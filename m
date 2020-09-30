From: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
Subject: Re: [PATCH] drm/nouveau: Drop mutex_lock_nested for atomic
Date: Wed, 30 Sep 2020 11:37:35 +0200
Message-ID: <20200930093735.GT438822@phenom.ffwll.local>
References: <20200802181849.1586281-1-daniel.vetter@ffwll.ch>
 <579702ca-4b4e-0b05-1b93-25b99554d464@linux.intel.com>
 <CAKMK7uHbdcLMJONxR5OZXBLtm0WVxT117mBD72RDW5MRQ=ky4g@mail.gmail.com>
 <CAKMK7uE89ZyvVronwpS=+ovJj_njVo3C5+GjjZp2S-Dk_7p2jg@mail.gmail.com>
 <CACAvsv7nmpJPVnfGkRW=UECvNyjNRO0x=0VMPr0VuFBNtpk+2g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CACAvsv7nmpJPVnfGkRW=UECvNyjNRO0x=0VMPr0VuFBNtpk+2g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Maarten Lankhorst <m.b.lankhorst-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Nouveau Dev <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Maarten Lankhorst <maarten.lankhorst-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, DRI Development <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Daniel Vetter <daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Wed, Sep 30, 2020 at 10:45:05AM +1000, Ben Skeggs wrote:
> On Wed, 30 Sep 2020 at 00:52, Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org> wrote:
> >
> > On Thu, Sep 17, 2020 at 3:15 PM Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org> wrote:
> > >
> > > Ben, did you have a chance to look at this?
> >
> > Ping
> > -Daniel
> >
> > > On Mon, Aug 3, 2020 at 1:22 PM Maarten Lankhorst
> > > <maarten.lankhorst-VuQAYsv1563Yd54FQh9/CA@public.gmane.org> wrote:
> > > >
> > > > Op 02-08-2020 om 20:18 schreef Daniel Vetter:
> > > > > Purely conjecture, but I think the original locking inversion with the
> > > > > legacy page flip code between flipping and ttm's bo move function
> > > > > shoudn't exist anymore with atomic: With atomic the bo pinning and
> > > > > actual modeset commit is completely separated in the code patsh.
> > > > >
> > > > > This annotation was originally added in
> > > > >
> > > > > commit 060810d7abaabcab282e062c595871d661561400
> > > > > Author: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> > > > > Date:   Mon Jul 8 14:15:51 2013 +1000
> > > > >
> > > > >     drm/nouveau: fix locking issues in page flipping paths
> > > > >
> > > > > due to
> > > > >
> > > > > commit b580c9e2b7ba5030a795aa2fb73b796523d65a78
> > > > > Author: Maarten Lankhorst <m.b.lankhorst-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > > > > Date:   Thu Jun 27 13:48:18 2013 +0200
> > > > >
> > > > >     drm/nouveau: make flipping lockdep safe
> > > > >
> > > > > Signed-off-by: Daniel Vetter <daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
> > > > > Cc: Maarten Lankhorst <m.b.lankhorst-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > > > > Cc: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> > > > > Cc: Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > > > > Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> > > > > ---
> > > > > I might be totally wrong, so this definitely needs testing :-)
> > > > >
> > > > > Cheers, Daniel
> > > > > ---
> > > > >  drivers/gpu/drm/nouveau/nouveau_bo.c | 6 +++++-
> > > > >  1 file changed, 5 insertions(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
> > > > > index 7806278dce57..a7b2a9bb0ffe 100644
> > > > > --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> > > > > +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> > > > > @@ -776,7 +776,11 @@ nouveau_bo_move_m2mf(struct ttm_buffer_object *bo, int evict, bool intr,
> > > > >                       return ret;
> > > > >       }
> > > > >
> > > > > -     mutex_lock_nested(&cli->mutex, SINGLE_DEPTH_NESTING);
> > > > > +     if (drm_drv_uses_atomic_modeset(drm->dev))
> > > > > +             mutex_lock(&cli->mutex);
> > > > > +     else
> > > > > +             mutex_lock_nested(&cli->mutex, SINGLE_DEPTH_NESTING);
> > > > > +
> > > > >       ret = nouveau_fence_sync(nouveau_bo(bo), chan, true, intr);
> > > > >       if (ret == 0) {
> > > > >               ret = drm->ttm.move(chan, bo, &bo->mem, new_reg);
> > > >
> > > > Well if you're certain it works now. :)
> > > >
> > > > Reviewed-by: Maarten Lankhorst <maarten.lankhorst-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
> Acked-by: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

Can you pull this in through your tree and maybe give it a spin just to
make sure? I don't really have nouveau hardware here.

Also it's entirely stand-alone, I was simply reviewing all the
mutex_lock_nested we have in drm, and this one stuck out as probably not
necessary anymore, at least with atomic.

I guess I can also just stuff it into drm-misc-next and if it blows up,
figure out what to do then :-)
-Daniel

> 
> > > >
> > >
> > >
> > > --
> > > Daniel Vetter
> > > Software Engineer, Intel Corporation
> > > http://blog.ffwll.ch
> >
> >
> >
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch
> > _______________________________________________
> > Nouveau mailing list
> > Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> > https://lists.freedesktop.org/mailman/listinfo/nouveau

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
