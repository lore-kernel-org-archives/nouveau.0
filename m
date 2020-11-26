From: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
Subject: Re: [PATCH] drm/nouveau: fix relocations applying logic
 and a double-free
Date: Thu, 26 Nov 2020 08:05:10 +0100
Message-ID: <20201126070510.GA401619@phenom.ffwll.local>
References: <20201120152338.1203257-1-ccr@tnsp.org>
 <CAKMK7uGDY+aLP-yYwyW5t-usUK3XM-oU9ZLHm1_jU0BTjJUN+g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAKMK7uGDY+aLP-yYwyW5t-usUK3XM-oU9ZLHm1_jU0BTjJUN+g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Matti Hamalainen <ccr-lYQ0WmeKI4w@public.gmane.org>
Cc: Nouveau Dev <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Mon, Nov 23, 2020 at 10:51:25AM +0100, Daniel Vetter wrote:
> On Fri, Nov 20, 2020 at 4:23 PM Matti Hamalainen <ccr-lYQ0WmeKI4w@public.gmane.org> wrote:
> >
> > Commit 03e0d26fcf79 ("drm/nouveau: slowpath for pushbuf ioctl") included
> > a logic-bug which results in the relocations not actually getting
> > applied at all as the call to nouveau_gem_pushbuf_reloc_apply() is
> > never reached. This causes a regression with graphical corruption,
> > triggered when relocations need to be done (for example after a
> > suspend/resume cycle.)
> >
> > Fix by setting *apply_relocs value only if there were more than 0
> > relocations.
> >
> > Additionally, the never reached code had a leftover u_free() call,
> > which, after fixing the logic, now got called and resulted in a
> > double-free. Fix by removing one u_free(), moving the other
> > and adding check for errors.
> >
> > Cc: Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>
> > Cc: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> > Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> > Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> > Signed-off-by: Matti Hamalainen <ccr-lYQ0WmeKI4w@public.gmane.org>
> > Fixes: 03e0d26fcf79 ("drm/nouveau: slowpath for pushbuf ioctl")
> > Link: https://gitlab.freedesktop.org/drm/nouveau/-/issues/11
> 
> Link: is for the mailing list submission of the patch itself (to link
> the git log to the mailing list discussions), this should be
> References: or similar. Aside from this:
> 
> Reviewed-by: Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>
> 
> Ben, I'm assuming you'll push this through your tree.

Ok Dave asked me to just push it into drm-misc-fixes.

Thanks for your patch!
-Daniel

> -Daniel
> 
> 
> > ---
> >  drivers/gpu/drm/nouveau/nouveau_gem.c | 8 +++++---
> >  1 file changed, 5 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
> > index 549bc67feabb..c2051380d18c 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_gem.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
> > @@ -558,8 +558,10 @@ nouveau_gem_pushbuf_validate(struct nouveau_channel *chan,
> >                         NV_PRINTK(err, cli, "validating bo list\n");
> >                 validate_fini(op, chan, NULL, NULL);
> >                 return ret;
> > +       } else if (ret > 0) {
> > +               *apply_relocs = true;
> >         }
> > -       *apply_relocs = ret;
> > +
> >         return 0;
> >  }
> >
> > @@ -662,7 +664,6 @@ nouveau_gem_pushbuf_reloc_apply(struct nouveau_cli *cli,
> >                 nouveau_bo_wr32(nvbo, r->reloc_bo_offset >> 2, data);
> >         }
> >
> > -       u_free(reloc);
> >         return ret;
> >  }
> >
> > @@ -872,9 +873,10 @@ nouveau_gem_ioctl_pushbuf(struct drm_device *dev, void *data,
> >                                 break;
> >                         }
> >                 }
> > -               u_free(reloc);
> >         }
> >  out_prevalid:
> > +       if (!IS_ERR(reloc))
> > +               u_free(reloc);
> >         u_free(bo);
> >         u_free(push);
> >
> >
> > base-commit: 3494d58865ad4a47611dbb427b214cc5227fa5eb
> > --
> > 2.29.2
> >
> 
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
