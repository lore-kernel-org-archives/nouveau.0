From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: [PATCH] devinit: lock/unlock crtc regs for all
	devices, not just pre-nv50
Date: Sun, 19 Jan 2014 11:14:36 -0500
Message-ID: <CAKb7UvhYBqky6ueYK7NBA7zJW-9w=FTCuKz1ajzcn2a4KAFspw@mail.gmail.com>
References: <1390123095-2032-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1390123095-2032-1-git-send-email-imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Pekka Paalanen <ppaalanen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andreas Reis <andreas.reis-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Sun, Jan 19, 2014 at 4:18 AM, Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> wrote:
> Also make nv_lockvgac work for nv50+ devices. This should fix IO_CONDITION and
> related VBIOS opcodes that read/write the crtc regs.
>
> See https://bugs.freedesktop.org/show_bug.cgi?id=60680
>
> Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
> ---
>
> Ben, is this what you had in mind? I haven't gotten a chance to test this yet
> since your tree doesn't build against mine (which is largely based on
> nouveau/linux-2.6 master + drm-nouveau-next patches merged in). Something
> about nouveau_acpi/backlight.
>
> Pekka, mind testing this out and see if it also fixes your issue? Grab Ben's
> tree at http://cgit.freedesktop.org/~darktama/nouveau/ and apply this patch,
> and build against a late 3.13-rcX release, I guess. (Still haven't figured out
> which tree I need to have for this stuff to build.)
>
> ./autogen.sh; cd drm; make
>
> should generate a nouveau.ko against your currently-running kernel.

Andreas -- you had the same issue as Pekka, would you mind testing
this out? I'm not sure when he'll be able to give it a shot. This is
an alternate way of resolving the issue that produces itself as HDMI
output not working. You can get a pristine copy of the patch at
http://lists.freedesktop.org/archives/nouveau/2014-January/015770.html
-- but do note the instructions above, as it applies to a different
repo.

>
>  nvkm/engine/disp/vga.c     |  9 +++++++--
>  nvkm/subdev/devinit/base.c | 14 ++++++++++++++
>  nvkm/subdev/devinit/nv04.c | 13 ++++++++-----
>  nvkm/subdev/devinit/priv.h |  8 +++++---
>  4 files changed, 34 insertions(+), 10 deletions(-)
>
> diff --git a/nvkm/engine/disp/vga.c b/nvkm/engine/disp/vga.c
> index 5a1c684..8836c3c 100644
> --- a/nvkm/engine/disp/vga.c
> +++ b/nvkm/engine/disp/vga.c
> @@ -138,10 +138,15 @@ nv_wrvgai(void *obj, int head, u16 port, u8 index, u8 value)
>  bool
>  nv_lockvgac(void *obj, bool lock)
>  {
> +       struct nouveau_device *dev = nv_device(obj);
> +
>         bool locked = !nv_rdvgac(obj, 0, 0x1f);
>         u8 data = lock ? 0x99 : 0x57;
> -       nv_wrvgac(obj, 0, 0x1f, data);
> -       if (nv_device(obj)->chipset == 0x11) {
> +       if (dev->card_type < NV_50)
> +               nv_wrvgac(obj, 0, 0x1f, data);
> +       else
> +               nv_wrvgac(obj, 0, 0x3f, data);
> +       if (dev->chipset == 0x11) {
>                 if (!(nv_rd32(obj, 0x001084) & 0x10000000))
>                         nv_wrvgac(obj, 1, 0x1f, data);
>         }
> diff --git a/nvkm/subdev/devinit/base.c b/nvkm/subdev/devinit/base.c
> index 6b23d9a..a4df3fa 100644
> --- a/nvkm/subdev/devinit/base.c
> +++ b/nvkm/subdev/devinit/base.c
> @@ -26,6 +26,7 @@
>
>  #include <subdev/bios.h>
>  #include <subdev/bios/init.h>
> +#include <subdev/vga.h>
>
>  #include "priv.h"
>
> @@ -38,6 +39,9 @@ _nouveau_devinit_fini(struct nouveau_object *object, bool suspend)
>         if (suspend)
>                 devinit->post = true;
>
> +       /* unlock the extended vga crtc regs */
> +       nv_lockvgac(devinit, false);
> +
>         return nouveau_subdev_fini(&devinit->base, suspend);
>  }
>
> @@ -61,6 +65,16 @@ _nouveau_devinit_init(struct nouveau_object *object)
>         return 0;
>  }
>
> +void
> +_nouveau_devinit_dtor(struct nouveau_object *object)
> +{
> +       struct nouveau_devinit *devinit = (void *)object;
> +
> +       /* lock crtc regs */
> +       nv_lockvgac(devinit, true);
> +       nouveau_subdev_destroy(&devinit->base);
> +}
> +
>  int
>  nouveau_devinit_create_(struct nouveau_object *parent,
>                         struct nouveau_object *engine,
> diff --git a/nvkm/subdev/devinit/nv04.c b/nvkm/subdev/devinit/nv04.c
> index 24025e4..7037eae 100644
> --- a/nvkm/subdev/devinit/nv04.c
> +++ b/nvkm/subdev/devinit/nv04.c
> @@ -388,17 +388,21 @@ int
>  nv04_devinit_fini(struct nouveau_object *object, bool suspend)
>  {
>         struct nv04_devinit_priv *priv = (void *)object;
> +       int ret;
>
>         /* make i2c busses accessible */
>         nv_mask(priv, 0x000200, 0x00000001, 0x00000001);
>
> -       /* unlock extended vga crtc regs, and unslave crtcs */
> -       nv_lockvgac(priv, false);
> +       ret = nouveau_devinit_fini(&priv->base, suspend);
> +       if (ret)
> +               return ret;
> +
> +       /* unslave crtcs */
>         if (priv->owner < 0)
>                 priv->owner = nv_rdvgaowner(priv);
>         nv_wrvgaowner(priv, 0);
>
> -       return nouveau_devinit_fini(&priv->base, suspend);
> +       return 0;
>  }
>
>  int
> @@ -426,9 +430,8 @@ nv04_devinit_dtor(struct nouveau_object *object)
>  {
>         struct nv04_devinit_priv *priv = (void *)object;
>
> -       /* restore vga owner saved at first init, and lock crtc regs  */
> +       /* restore vga owner saved at first init */
>         nv_wrvgaowner(priv, priv->owner);
> -       nv_lockvgac(priv, true);
>
>         nouveau_devinit_destroy(&priv->base);
>  }
> diff --git a/nvkm/subdev/devinit/priv.h b/nvkm/subdev/devinit/priv.h
> index c4179b6..822a2fb 100644
> --- a/nvkm/subdev/devinit/priv.h
> +++ b/nvkm/subdev/devinit/priv.h
> @@ -15,8 +15,10 @@ struct nouveau_devinit_impl {
>
>  #define nouveau_devinit_create(p,e,o,d)                                        \
>         nouveau_devinit_create_((p), (e), (o), sizeof(**d), (void **)d)
> -#define nouveau_devinit_destroy(p)                                             \
> -       nouveau_subdev_destroy(&(p)->base)
> +#define nouveau_devinit_destroy(p) ({                                          \
> +       struct nouveau_devinit *d = (p);                                       \
> +       _nouveau_devinit_dtor(nv_object(d));                                   \
> +})
>  #define nouveau_devinit_init(p) ({                                             \
>         struct nouveau_devinit *d = (p);                                       \
>         _nouveau_devinit_init(nv_object(d));                                   \
> @@ -28,7 +30,7 @@ struct nouveau_devinit_impl {
>
>  int nouveau_devinit_create_(struct nouveau_object *, struct nouveau_object *,
>                             struct nouveau_oclass *, int, void **);
> -#define _nouveau_devinit_dtor _nouveau_subdev_dtor
> +void _nouveau_devinit_dtor(struct nouveau_object *);
>  int _nouveau_devinit_init(struct nouveau_object *);
>  int _nouveau_devinit_fini(struct nouveau_object *, bool suspend);
>
> --
> 1.8.3.2
>
