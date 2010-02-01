From: Luca Barbieri <luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org>
Subject: Re: [PATCH 2/3] drm/nouveau: add lockless dynamic
	semaphore allocator
Date: Mon, 1 Feb 2010 15:50:39 +0100
Message-ID: <ff13bc9a1002010650o5cab4d65q26f1d655f82f4f5a@mail.gmail.com>
References: <1265017810-13354-1-git-send-email-luca@luca-barbieri.com>
	<1265017810-13354-2-git-send-email-luca@luca-barbieri.com>
	<87bpg9w1w8.fsf@riseup.net>
	<ff13bc9a1002010527n5812d30fj8555a940aeba179f@mail.gmail.com>
	<874om1vxj4.fsf@riseup.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <874om1vxj4.fsf-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

> Sounds like premature optimization to me. I'm just stating my personal
> view here, but I have a feeling a patch with 60% of lines could do very
> well the same for most realistic cases.

Perhaps, but really, the only thing you would probably save by using
spinlocks in the fast path is retrying in nouveau_sem_alloc, which
should be at most 10 lines saved.

You could save much more by supporting only a single static semaphore
BO, and still retain almost all flexibility by making it large.
However, it's somewhat inelegant, and why not just keep the
functionality so we never need to revisit this again?

> BTW, the kernel has some linked list helpers you might want to use for
> sem_bo_free_list
It is a singly linked list, and slist.h never got merged.
I could possibly make it doubly linked, even though it's a bit useless.

> and probably the best place for the sem stuff to live
> is "dev_priv->fence" instead of the root of drm_nouveau_private.
There is no "fence" currently in drm_nouveau_private.
Adding a "sem" or "fence" substructure could make sense though.
