From: Thomas Hellstrom <thomas-4+hqylr40dJg9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH] drm/ttm: Fix race condition in
	ttm_bo_delayed_delete
Date: Wed, 20 Jan 2010 22:04:53 +0100
Message-ID: <4B576FF5.9040907@shipmail.org>
References: <1263840434-9113-1-git-send-email-luca@luca-barbieri.com>	
	<4B54B949.9010906@vmware.com>	
	<ff13bc9a1001181433v1694e681l9f7ce9d880132dc3@mail.gmail.com>	
	<4B56E8EE.8090706@shipmail.org>
	<4B56F308.5090603@shipmail.org>	 <4B56F401.8070700@vmware.com>	
	<ff13bc9a1001201122y110fb003k704bc6d05d2aea07@mail.gmail.com>	
	<4B5764BA.7080801@vmware.com>
	<ff13bc9a1001201245g6ee25219q851b7989968f4c7b@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <ff13bc9a1001201245g6ee25219q851b7989968f4c7b-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
>> Also note that the delayed delete list is not in fence order but in
>> deletion-time order, which perhaps gives room for more optimizations.
>>     
> You are right.
> I think then that ttm_bo_delayed_delete may still need to be changed,
> because it stops when ttm_bo_cleanup_refs returns -EBUSY, which
> happens when a fence has not been reached.
> This means that a buffer will need to wait for all previously deleted
> buffers to become unused, even if it is unused itself.
> Is this acceptable?
>   

Yes, I think it's acceptable if you view it in the context that the most 
important buffer resources (GPU memory space and physical system memory) 
are immediately reclaimable through the eviction- and swapping mechanisms.

> What if we get rid of the delayed destroy list, and instead append
> buffers to be deleted to their fence object, and delete them when the
> fence is signaled?
>
> This also allows to do it more naturally, since the fence object can
> just keep a normal reference to the buffers it fences, and unreference
> them on expiration.
>
> Then there needs to be no special "delayed destruction" logic, and it
> would work as if the GPU were keeping a reference to the buffer
> itself, using fences as a proxy to have the CPU do that work for the
> GPU.
>
> Then the delayed work is no longer "periodically destroy buffers" but
> rather "periodically check if fences are expired", naturally stopping
> at the first unexpired one.
> Drivers that support IRQs on fences could also do the work in the
> interrupt handler/tasklet instead, avoid the delay jiffies magic
> number. This may need a NAPI-like interrupt mitigation middle layer
> for optimal results though.
>
>   

Yes, I think that this way, it should definitely be possible to find a 
more optimal solution. One should keep in mind, however, that we'll 
probably not able to destroy buffers from within an atomic context, 
which means we have to schedule a workqueue to do that task. We had to 
do a similar thing in the Poulsbo driver and it turned out that we could 
save a significant amount of CPU by using a delayed workqueue, 
collecting objects and destroying them periodically.

/Thomas
