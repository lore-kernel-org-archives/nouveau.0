From: Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 4/4] drm/nouveau: change FB map to simple
	ioremap
Date: Sun, 26 Jul 2009 21:03:44 +1000
Message-ID: <21d7e9970907260403k68294124xcd10802e6d7cd220@mail.gmail.com>
References: <1248524947-4550-1-git-send-email-pq@iki.fi>
	<1248524947-4550-2-git-send-email-pq@iki.fi>
	<1248524947-4550-3-git-send-email-pq@iki.fi>
	<1248524947-4550-4-git-send-email-pq@iki.fi>
	<1248524947-4550-5-git-send-email-pq@iki.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1248524947-4550-5-git-send-email-pq-X3B1VOXEql0@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Sat, Jul 25, 2009 at 10:29 PM, Pekka Paalanen<pq-X3B1VOXEql0@public.gmane.org> wrote:
> Remove the use of drm_local_map for the FB mapping and replace it with
> the equivalent ioremap.

I don't think FBs are ioremapped normally with addmap, unless nouveau
does something different here. Generally ioremapping the whole framebuffer
is considered a bad idea as ioremap on 32-bit x86 is limited.

Dave.

>
> Macros nv_[rw]f32() are changed into inline functions and the 'dev'
> argument is explicit.
>
> Macros nv_[rw]v32() are removed as unused.
>
> Signed-off-by: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
> ---
> =A0drivers/gpu/drm/nouveau/nouveau_drv.h =A0 | =A0 17 ++++++++++++-----
> =A0drivers/gpu/drm/nouveau/nouveau_hw.c =A0 =A0| =A0 16 ++++++++--------
> =A0drivers/gpu/drm/nouveau/nouveau_state.c | =A0 12 +++++-------
> =A03 files changed, 25 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouv=
eau/nouveau_drv.h
> index 4d53129..74f835f 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_drv.h
> +++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
> @@ -448,7 +448,7 @@ struct drm_nouveau_private {
> =A0 =A0 =A0 =A0int flags;
>
> =A0 =A0 =A0 =A0void __iomem *mmio;
> - =A0 =A0 =A0 struct drm_local_map *fb;
> + =A0 =A0 =A0 void __iomem *fb;
> =A0 =A0 =A0 =A0struct drm_local_map *ramin;
>
> =A0 =A0 =A0 =A0struct work_struct irq_work;
> @@ -998,10 +998,17 @@ static inline void nv_wr08(struct drm_device *dev, =
unsigned reg, u8 val)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 (mask), (val))
>
> =A0/* VRAM access */
> -#define nv_rf32(reg) nv_in32(fb, (reg))
> -#define nv_wf32(reg,val) nv_out32(fb, (reg), (val))
> -#define nv_rv32(reg) nv_rf32(reg)
> -#define nv_wv32(reg,val) nv_wf32(reg, val)
> +static inline u32 nv_rf32(struct drm_device *dev, unsigned reg)
> +{
> + =A0 =A0 =A0 struct drm_nouveau_private *dev_priv =3D dev->dev_private;
> + =A0 =A0 =A0 return ioread32_native(dev_priv->fb + reg);
> +}
> +
> +static inline void nv_wf32(struct drm_device *dev, unsigned reg, u32 val)
> +{
> + =A0 =A0 =A0 struct drm_nouveau_private *dev_priv =3D dev->dev_private;
> + =A0 =A0 =A0 iowrite32_native(val, dev_priv->fb + reg);
> +}
>
> =A0/* PRAMIN access */
> =A0#define nv_ri32(reg) nv_in32(ramin, (reg))
> diff --git a/drivers/gpu/drm/nouveau/nouveau_hw.c b/drivers/gpu/drm/nouve=
au/nouveau_hw.c
> index f3cd10d..295b876 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_hw.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_hw.c
> @@ -578,36 +578,36 @@ nouveau_hw_save_vga_fonts(struct drm_device *dev, b=
ool save)
> =A0 =A0 =A0 =A0NVWriteVgaGr(dev, 0, NV_VIO_GX_READ_MAP_INDEX, 0x0);
> =A0 =A0 =A0 =A0for (i =3D 0; i < 16384; i++)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (save)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_priv->saved_vga_font[0]=
[i] =3D nv_rf32(i * 4);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_priv->saved_vga_font[0]=
[i] =3D nv_rf32(dev, i * 4);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0else
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 nv_wf32(i * 4, dev_priv->sa=
ved_vga_font[0][i]);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 nv_wf32(dev, i * 4, dev_pri=
v->saved_vga_font[0][i]);
>
> =A0 =A0 =A0 =A0/* store font in plane 1 */
> =A0 =A0 =A0 =A0NVWriteVgaSeq(dev, 0, NV_VIO_SR_PLANE_MASK_INDEX, 0x2);
> =A0 =A0 =A0 =A0NVWriteVgaGr(dev, 0, NV_VIO_GX_READ_MAP_INDEX, 0x1);
> =A0 =A0 =A0 =A0for (i =3D 0; i < 16384; i++)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (save)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_priv->saved_vga_font[1]=
[i] =3D nv_rf32(i * 4);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_priv->saved_vga_font[1]=
[i] =3D nv_rf32(dev, i * 4);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0else
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 nv_wf32(i * 4, dev_priv->sa=
ved_vga_font[1][i]);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 nv_wf32(dev, i * 4, dev_pri=
v->saved_vga_font[1][i]);
>
> =A0 =A0 =A0 =A0/* store font in plane 2 */
> =A0 =A0 =A0 =A0NVWriteVgaSeq(dev, 0, NV_VIO_SR_PLANE_MASK_INDEX, 0x4);
> =A0 =A0 =A0 =A0NVWriteVgaGr(dev, 0, NV_VIO_GX_READ_MAP_INDEX, 0x2);
> =A0 =A0 =A0 =A0for (i =3D 0; i < 16384; i++)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (save)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_priv->saved_vga_font[2]=
[i] =3D nv_rf32(i * 4);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_priv->saved_vga_font[2]=
[i] =3D nv_rf32(dev, i * 4);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0else
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 nv_wf32(i * 4, dev_priv->sa=
ved_vga_font[2][i]);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 nv_wf32(dev, i * 4, dev_pri=
v->saved_vga_font[2][i]);
>
> =A0 =A0 =A0 =A0/* store font in plane 3 */
> =A0 =A0 =A0 =A0NVWriteVgaSeq(dev, 0, NV_VIO_SR_PLANE_MASK_INDEX, 0x8);
> =A0 =A0 =A0 =A0NVWriteVgaGr(dev, 0, NV_VIO_GX_READ_MAP_INDEX, 0x3);
> =A0 =A0 =A0 =A0for (i =3D 0; i < 16384; i++)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (save)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_priv->saved_vga_font[3]=
[i] =3D nv_rf32(i * 4);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_priv->saved_vga_font[3]=
[i] =3D nv_rf32(dev, i * 4);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0else
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 nv_wf32(i * 4, dev_priv->sa=
ved_vga_font[3][i]);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 nv_wf32(dev, i * 4, dev_pri=
v->saved_vga_font[3][i]);
>
> =A0 =A0 =A0 =A0/* restore control regs */
> =A0 =A0 =A0 =A0NVWritePRMVIO(dev, 0, NV_PRMVIO_MISC__WRITE, misc);
> diff --git a/drivers/gpu/drm/nouveau/nouveau_state.c b/drivers/gpu/drm/no=
uveau/nouveau_state.c
> index b70ec33..3a6cabf 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_state.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_state.c
> @@ -579,12 +579,10 @@ int nouveau_load(struct drm_device *dev, unsigned l=
ong flags)
> =A0 =A0 =A0 =A0}
>
> =A0 =A0 =A0 =A0/* map first 64KiB of VRAM, holds VGA fonts etc */
> - =A0 =A0 =A0 ret =3D drm_addmap(dev, drm_get_resource_start(dev, 1), 655=
36,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0_DRM_REGISTERS, _DRM_REA=
D_ONLY | _DRM_DRIVER,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&dev_priv->fb);
> - =A0 =A0 =A0 if (ret) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 NV_ERROR(dev, "Failed to map FB BAR: %d\n",=
 ret);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 return ret;
> + =A0 =A0 =A0 dev_priv->fb =3D ioremap(pci_resource_start(dev->pdev, 1), =
65536);
> + =A0 =A0 =A0 if (!dev_priv->fb) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 NV_ERROR(dev, "Failed to map FB BAR\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -ENOMEM;
> =A0 =A0 =A0 =A0}
>
> =A0#if defined(__powerpc__)
> @@ -656,7 +654,7 @@ int nouveau_unload(struct drm_device *dev)
>
> =A0 =A0 =A0 =A0iounmap(dev_priv->mmio);
> =A0 =A0 =A0 =A0drm_rmmap(dev, dev_priv->ramin);
> - =A0 =A0 =A0 drm_rmmap(dev, dev_priv->fb);
> + =A0 =A0 =A0 iounmap(dev_priv->fb);
>
> =A0 =A0 =A0 =A0kfree(dev_priv);
> =A0 =A0 =A0 =A0dev->dev_private =3D NULL;
> --
> 1.6.3.3
>
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
>
