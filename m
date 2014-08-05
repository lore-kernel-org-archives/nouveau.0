From: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
Subject: Re: [PATCH 09/19] drm/radeon: handle lockup in delayed
	work, v2
Date: Tue, 5 Aug 2014 10:16:38 +0200
Message-ID: <20140805081638.GD8727@phenom.ffwll.local>
References: <53DF4A7D.3040505@canonical.com> <53DF7516.2010408@amd.com>
 <53DF8BF2.4000309@canonical.com> <53DF9AC4.3010700@amd.com>
 <53DF9B58.8000403@canonical.com> <53DF9C88.6060107@amd.com>
 <53DF9F89.60202@canonical.com> <53DFA0EB.5040302@amd.com>
 <53DFA210.2020603@canonical.com> <53DFBD2E.5070001@amd.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <53DFBD2E.5070001-5C7GfCeVMHo@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig-5C7GfCeVMHo@public.gmane.org>
Cc: thellstrom-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, alexander.deucher-5C7GfCeVMHo@public.gmane.org, bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Mon, Aug 04, 2014 at 07:04:46PM +0200, Christian K=F6nig wrote:
> Am 04.08.2014 um 17:09 schrieb Maarten Lankhorst:
> >op 04-08-14 17:04, Christian K=F6nig schreef:
> >>Am 04.08.2014 um 16:58 schrieb Maarten Lankhorst:
> >>>op 04-08-14 16:45, Christian K=F6nig schreef:
> >>>>Am 04.08.2014 um 16:40 schrieb Maarten Lankhorst:
> >>>>>op 04-08-14 16:37, Christian K=F6nig schreef:
> >>>>>>>It'a pain to deal with gpu reset.
> >>>>>>Yeah, well that's nothing new.
> >>>>>>
> >>>>>>>I've now tried other solutions but that would mean reverting to th=
e old style during gpu lockup recovery, and only running the delayed work w=
hen !lockup.
> >>>>>>>But this meant that the timeout was useless to add. I think the cl=
eanest is keeping the v2 patch, because potentially any waiting code can be=
 called during lockup recovery.
> >>>>>>The lockup code itself should never call any waiting code and V2 do=
esn't seem to handle a couple of cases correctly either.
> >>>>>>
> >>>>>>How about moving the fence waiting out of the reset code?
> >>>>>What cases did I miss then?
> >>>>>
> >>>>>I'm curious how you want to move the fence waiting out of reset, whe=
n there are so many places that could potentially wait, like radeon_ib_get =
can call radeon_sa_bo_new which can do a wait, or radeon_ring_alloc that ca=
n wait on radeon_fence_wait_next, etc.
> >>>>The IB test itself doesn't needs to be protected by the exclusive loc=
k. Only everything between radeon_save_bios_scratch_regs and radeon_ring_re=
store.
> >>>I'm not sure about that, what do you want to do if the ring tests fail=
? Do you have to retake the exclusive lock?
> >>Just set need_reset again and return -EAGAIN, that should have mostly t=
he same effect as what we are doing right now.
> >Yeah, except for the locking the ttm delayed workqueue, but that bool sh=
ould be easy to save/restore.
> >I think this could work.
> =

> Actually you could activate the delayed workqueue much earlier as well.
> =

> Thinking more about it that sounds like a bug in the current code, because
> we probably want the workqueue activated before waiting for the fence.

We've actually had a similar issue on i915 where when userspace never
waited for rendering (some shitty userspace drivers did that way back) we
never noticed that the gpu died. So launching the hangcheck/stuck wait
worker (we have both too) right away is what we do now.
-Daniel
-- =

Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
