From: Thomas Hellstrom <thellstrom-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] drm/ttm: Fix race condition in
	ttm_bo_delayed_delete
Date: Wed, 20 Jan 2010 21:16:58 +0100
Message-ID: <4B5764BA.7080801@vmware.com>
References: <1263840434-9113-1-git-send-email-luca@luca-barbieri.com>	
	<4B54B949.9010906@vmware.com>	
	<ff13bc9a1001181433v1694e681l9f7ce9d880132dc3@mail.gmail.com>	
	<4B56E8EE.8090706@shipmail.org>
	<4B56F308.5090603@shipmail.org>	 <4B56F401.8070700@vmware.com>
	<ff13bc9a1001201122y110fb003k704bc6d05d2aea07@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <ff13bc9a1001201122y110fb003k704bc6d05d2aea07-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Luca Barbieri <luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org>
Cc: "airlied-cv59FeDIM0c@public.gmane.org" <airlied-cv59FeDIM0c@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "dri-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org" <dri-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>, Thomas Hellstrom <thomas-4+hqylr40dJg9hUCZPvPmw@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Luca Barbieri wrote:
> Yes it's fine. I sent your patch to Dave with an expanded commit
> comment for merging.
>
> Here is a possible redesign of the mechanism inspired by this issue.
> It seems that what we are racing against is buffer eviction, due to
> delayed deletion buffers being still kept on the LRU list.
>
> I'm wondering if the delayed deletion design could be changed as follows:
> 1. Remove to-be-deleted buffers from the LRU list before putting them
> on delayed delete
> 2. Change buffer eviction to first do a delayed deletion pass. This
> should be cheap (and cheaper than the current code) because delayed
> deletion stops at the first unsignaled fence.
> 3. Add a new "delayed deletion" lock/semaphore. Then, have
> ttm_bo_delayed_delete take it for reading and keep it across the
> function.
> 4. Inside the delayed deletion lock, grab the LRU lock, copy the
> delayed delete list head to a local variable, set it to empty and
> release the lock.
> 5. Iterate on the privately held list with list_for_each_safe
> 6. At the end of ttm_bo_delayed_delete, retake the LRU lock and readd
> the remaining part of our private list at the head of the global list
>
> This would prevent uselessly trying to evict delayed-delete buffers
> (which should be processed in fence order and not LRU order), and also
> prevent concurrent delayed deletions, which should be more harmful
> than useful.
>   

Yes. Note that there is a problem with this. If we need to find space 
for a buffer, we need to be able to guarantee that we've evicted *all* 
evictable buffers. Even those on the delayed delete list. Otherwise we 
have no means of guaranteeing a certain available GPU memory space to 
user-space, so that user-space can predict when to flush. If we remove 
delayed-delete buffers from the LRU lists, we'd need to empty the 
delayed-delete list to guarantee that, and we may end up waiting for 
buffers that aren't even in the relevant memory region.

Also note that the delayed delete list is not in fence order but in 
deletion-time order, which perhaps gives room for more optimizations.

> Furthermore, it should be possible to get rid of list locking in the
> following way:
> 1. BOs to be delayed-deleted are added to the head of the initial
> delayed deletion single linked list, using atomic cmpxchg
> 2. ttm_bo_delayed_delete takes the delayed deletion lock and grabs the
> list with an atomic xchg of the head with zero
> 3. It reverses the list in place, processes the entries and puts them
> at the end of a second single linked list, the recurring delayed
> deletion list
> 4. It processes the recurring delayed deletion list, cleaning up the BOs
> 5. Finally, the delayed deletion lock is released
>
> This makes adding to the delayed deletion list lockless.
>   

But isn't an atomic cmpxchg about as costly as a spinlock?

> The LRU list instead inherently needs to be doubly linked, so only RCU
> could make it lockless, and it seems that may require using an
> external list node structure (so readers don't suddenly jump to the
> most recent node), and that would not be a win (except with *lots* of
> CPUs).
> Besides, most DRM drivers (except vmware) are taking the BKL around
> all ioctls and (except nouveau) use a single pushbuffer, so this is a
> bit moot anyway.
>
> What do you think?
>   

In general, the more locks we can get rid of, the better, so I'm for 
that. Note, however, that reserving a buffer and simultaneously taking 
it off lru lists need to be an atomic operation. The lru lock is 
currently used to assure that, and I guess we need to preserve that in 
some way.

/Thomas
