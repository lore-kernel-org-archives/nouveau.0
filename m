From: Lyude Paul <lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/2] drm/nouveau/kms/nv50-: Program notifier
 offset before requesting disp caps
Date: Tue, 01 Sep 2020 16:43:56 -0400
Message-ID: <c099dc05ff80ea43033c72a52de51165d9b0f6ab.camel@redhat.com>
References: <20200824183253.826343-1-lyude@redhat.com>
 <20200824183253.826343-2-lyude@redhat.com>
 <CACAvsv6hymdcGkEcigL3fWACZ_1POpB+aefq9d9ChnYv_dHnVg@mail.gmail.com>
 <76392bff28359a88fbdf0857f011e0ed9f666dc4.camel@redhat.com>
 <CACAvsv6GKeX=u4Jn0VVJk1qgnPcnPCW6exukqjvfrfmm2mwSUg@mail.gmail.com>
Reply-To: lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CACAvsv6GKeX=u4Jn0VVJk1qgnPcnPCW6exukqjvfrfmm2mwSUg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
Cc: Sasha Levin <sashal-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, ML nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:DRM DRIVER FOR NVIDIA
 GEFORCE/QUADRO GPUS" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Mon, 2020-08-31 at 14:26 +1000, Ben Skeggs wrote:
> On Wed, 26 Aug 2020 at 02:52, Lyude Paul <lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> > On Tue, 2020-08-25 at 08:28 +1000, Ben Skeggs wrote:
> > > On Tue, 25 Aug 2020 at 04:33, Lyude Paul <lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> > > > Not entirely sure why this never came up when I originally tested this
> > > > (maybe some BIOSes already have this setup?) but the ->caps_init vfunc
> > > > appears to cause the display engine to throw an exception on driver
> > > > init, at least on my ThinkPad P72:
> > > > 
> > > > nouveau 0000:01:00.0: disp: chid 0 mthd 008c data 00000000 0000508c
> > > > 0000102b
> > > > 
> > > > This is magic nvidia speak for "You need to have the DMA notifier offset
> > > > programmed before you can call NV507D_GET_CAPABILITIES." So, let's fix
> > > > this by doing that, and also perform an update afterwards to prevent
> > > > racing with the GPU when reading capabilities.
> > > > 
> > > > Changes since v1:
> > > > * Don't just program the DMA notifier offset, make sure to actually
> > > >   perform an update
> > > I'm not sure there's a need to send an Update() method here, I believe
> > > GetCapabilities() is an action method on its own right?
> > > 
> > 
> > I'm not entirely sure about this part tbh. I do know that we need to call
> > GetCapabilities() _after_ the DMA notifier offset is programmed. But, my
> > assumption was that if GetCapabilities() requires a DMA notifier offset to
> > store
> > its results in, we'd probably want to fire an update or something to make
> > sure
> > that we're not reading before it finishes writing capabilities?
> We definitely want to *wait* on GetCapabilities() finishing, I believe
> it should also update the notifier the same (or similar) way Update()
> does.  But I don't think we want to send an Update() here, it'll
> actually trigger a modeset (which, on earlier HW, will tear down the
> boot mode.  Not sure about current HW, it might preserve state), and
> we may not want that to happen there.

I'm not so sure about that, as it seems like the notifier times out without the
update:

[    5.142033] nouveau 0000:1f:00.0: DRM: [DRM/00000000:kmsChanPush] 00000000: 00040088 mthd 0x0088 size 1 - core507d_init
[    5.142037] nouveau 0000:1f:00.0: DRM: [DRM/00000000:kmsChanPush] 00000004: f0000000-> NV507D_SET_CONTEXT_DMA_NOTIFIER
[    5.142041] nouveau 0000:1f:00.0: DRM: [DRM/00000000:kmsChanPush] 00000008: 00040084 mthd 0x0084 size 1 - core507d_caps_init
[    5.142044] nouveau 0000:1f:00.0: DRM: [DRM/00000000:kmsChanPush] 0000000c: 80000000-> NV507D_SET_NOTIFIER_CONTROL
[    5.142047] nouveau 0000:1f:00.0: DRM: [DRM/00000000:kmsChanPush] 00000010: 0004008c mthd 0x008c size 1 - core507d_caps_init
[    5.142050] nouveau 0000:1f:00.0: DRM: [DRM/00000000:kmsChanPush] 00000014: 00000000-> NV507D_GET_CAPABILITIES
[    7.142026] nouveau 0000:1f:00.0: DRM: core notifier timeout
[    7.142700] nouveau 0000:1f:00.0: DRM: sor-0002-0fc1 caps: dp_interlace=0
[    7.142708] nouveau 0000:1f:00.0: DRM: sor-0002-0fc4 caps: dp_interlace=0
[    7.142715] nouveau 0000:1f:00.0: DRM: sor-0002-0f42 caps: dp_interlace=0
[    7.142829] nouveau 0000:1f:00.0: DRM: sor-0006-0f82 caps: dp_interlace=0
[    7.142842] nouveau 0000:1f:00.0: DRM: sor-0002-0f82 caps: dp_interlace=0
[    7.142849] nouveau 0000:1f:00.0: DRM: failed to create encoder 1/8/0: -19
[    7.142851] nouveau 0000:1f:00.0: DRM: Virtual-1 has no encoders, removing

Any other alternatives to UPDATE we might want to try?

> 
> Ben.
> 
> > > Ben.
> > > 
> > > > Signed-off-by: Lyude Paul <lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> > > > Fixes: 4a2cb4181b07 ("drm/nouveau/kms/nv50-: Probe SOR and PIOR caps for
> > > > DP
> > > > interlacing support")
> > > > Cc: <stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org> # v5.8+
> > > > ---
> > > >  drivers/gpu/drm/nouveau/dispnv50/core507d.c | 25 ++++++++++++++++-----
> > > >  1 file changed, 19 insertions(+), 6 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/nouveau/dispnv50/core507d.c
> > > > b/drivers/gpu/drm/nouveau/dispnv50/core507d.c
> > > > index e341f572c2696..5e86feec3b720 100644
> > > > --- a/drivers/gpu/drm/nouveau/dispnv50/core507d.c
> > > > +++ b/drivers/gpu/drm/nouveau/dispnv50/core507d.c
> > > > @@ -65,13 +65,26 @@ core507d_ntfy_init(struct nouveau_bo *bo, u32
> > > > offset)
> > > >  int
> > > >  core507d_caps_init(struct nouveau_drm *drm, struct nv50_disp *disp)
> > > >  {
> > > > -       u32 *push = evo_wait(&disp->core->chan, 2);
> > > > +       struct nv50_core *core = disp->core;
> > > > +       u32 interlock[NV50_DISP_INTERLOCK__SIZE] = {0};
> > > > +       u32 *push;
> > > > 
> > > > -       if (push) {
> > > > -               evo_mthd(push, 0x008c, 1);
> > > > -               evo_data(push, 0x0);
> > > > -               evo_kick(push, &disp->core->chan);
> > > > -       }
> > > > +       core->func->ntfy_init(disp->sync, NV50_DISP_CORE_NTFY);
> > > > +
> > > > +       push = evo_wait(&core->chan, 4);
> > > > +       if (!push)
> > > > +               return 0;
> > > > +
> > > > +       evo_mthd(push, 0x0084, 1);
> > > > +       evo_data(push, 0x80000000 | NV50_DISP_CORE_NTFY);
> > > > +       evo_mthd(push, 0x008c, 1);
> > > > +       evo_data(push, 0x0);
> > > > +       evo_kick(push, &core->chan);
> > > > +
> > > > +       core->func->update(core, interlock, false);
> > > > +       if (core->func->ntfy_wait_done(disp->sync, NV50_DISP_CORE_NTFY,
> > > > +                                      core->chan.base.device))
> > > > +               NV_ERROR(drm, "core notifier timeout\n");
> > > > 
> > > >         return 0;
> > > >  }
> > > > --
> > > > 2.26.2
> > > > 
> > > > _______________________________________________
> > > > Nouveau mailing list
> > > > Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> > > > https://lists.freedesktop.org/mailman/listinfo/nouveau
> > --
> > Sincerely,
> >       Lyude Paul (she/her)
> >       Software Engineer at Red Hat
> > 
-- 
Sincerely,
      Lyude Paul (she/her)
      Software Engineer at Red Hat
