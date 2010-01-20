From: Thomas Hellstrom <thomas-4+hqylr40dJg9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH] drm/ttm: Fix race condition in
	ttm_bo_delayed_delete
Date: Wed, 20 Jan 2010 12:28:46 +0100
Message-ID: <4B56E8EE.8090706@shipmail.org>
References: <1263840434-9113-1-git-send-email-luca@luca-barbieri.com>	<4B54B949.9010906@vmware.com>
	<ff13bc9a1001181433v1694e681l9f7ce9d880132dc3@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <ff13bc9a1001181433v1694e681l9f7ce9d880132dc3-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
Cc: "airlied-cv59FeDIM0c@public.gmane.org" <airlied-cv59FeDIM0c@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Thomas Hellstrom <thellstrom-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org>, "dri-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org" <dri-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Luca Barbieri wrote:
>> Would  nentry=list_first_entry(&entry->ddestroy, ....) work?
>>     
> Yes, it seems a bit less intuitive, but if that's the accepted
> practice, let's do that instead.
>
>   
>> Here nentry may have been removed from the list by another process, which
>> would trigger the unnecessary call, mentioned above.
>>     
> You are right.
>
> I attached a revised patch.
> It's only compile tested, but the changes are small and it should
> hopefully work.
>   
Yes, it looks correct. Although it seems a little unintuitive to enter 
the loop with the spinlock held, and exit it with the spinlock not held. 
I've attached yet another patch to have that fixed. Could you take a 
look at whether it seems OK with you and, in that case, repost it for Dave?

> The whole function seems more complicated than needed, but I can't
> find a way to do it with less code. If we could keep glob->lru_lock
> while calling ttm_bo_cleanup_refs things would be much simpler, but
> that would require intrusive changes and may not be possible.
>   

Yes, one of the rules of TTM is to avoid calling any kref_put() function 
that may free an object with a spinlock  or a mutex held,  since the 
free function must be able to take whatever mutex or spinlock it likes, 
otherwise we'd end up in a complete mess of recursive locks and lock 
dependency errors. Since therefore ttm_bo_cleanup_refs would need to 
temporarily release any lock held at call time, we wouldn't be better off.

/Thomas
