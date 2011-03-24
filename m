From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH 1/5] nouveau: Fix checkpatch.pl error messages
Date: Thu, 24 Mar 2011 19:54:40 +0100
Message-ID: <87fwqcgxhr.fsf@riseup.net>
References: <1300577514-6833-1-git-send-email-emil.l.velikov@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0918856098=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1300577514-6833-1-git-send-email-emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> (Emil
	Velikov's message of "Sat, 19 Mar 2011 23:31:50 +0000")
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============0918856098==
Content-Type: multipart/signed; boundary="==-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"

--==-=-=
Content-Type: multipart/mixed; boundary="=-=-="

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:

> Fix the following message
> 'ERROR: trailing statements should be on next line'
>
> Signed-off-by: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/gpu/drm/nouveau/nouveau_display.c |   20 +++++++--
>  drivers/gpu/drm/nouveau/nouveau_mem.c     |   12 ++++--
>  drivers/gpu/drm/nouveau/nouveau_object.c  |    8 +++-
>  drivers/gpu/drm/nouveau/nv50_display.c    |   64 +++++++++++++++++++++--=
-----
>  drivers/gpu/drm/nouveau/nv50_fb.c         |    9 +++-
>  drivers/gpu/drm/nouveau/nv50_grctx.c      |    3 +-
>  drivers/gpu/drm/nouveau/nvc0_grctx.c      |    4 +-
>  7 files changed, 88 insertions(+), 32 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/=
nouveau/nouveau_display.c
> index 764c15d..2dca746 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_display.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_display.c
> @@ -91,12 +91,22 @@ nouveau_framebuffer_init(struct drm_device *dev,
>  			nv_fb->r_dma =3D NvEvoVRAM_LP;
>=20=20
>  		switch (fb->depth) {
> -		case  8: nv_fb->r_format =3D NV50_EVO_CRTC_FB_DEPTH_8; break;
> -		case 15: nv_fb->r_format =3D NV50_EVO_CRTC_FB_DEPTH_15; break;
> -		case 16: nv_fb->r_format =3D NV50_EVO_CRTC_FB_DEPTH_16; break;
> +		case  8:
> +			nv_fb->r_format =3D NV50_EVO_CRTC_FB_DEPTH_8;
> +			break;
> +		case 15:
> +			nv_fb->r_format =3D NV50_EVO_CRTC_FB_DEPTH_15;
> +			break;
> +		case 16:
> +			nv_fb->r_format =3D NV50_EVO_CRTC_FB_DEPTH_16;
> +			break;
>  		case 24:
> -		case 32: nv_fb->r_format =3D NV50_EVO_CRTC_FB_DEPTH_24; break;
> -		case 30: nv_fb->r_format =3D NV50_EVO_CRTC_FB_DEPTH_30; break;
> +		case 32:
> +			nv_fb->r_format =3D NV50_EVO_CRTC_FB_DEPTH_24;
> +			break;
> +		case 30:
> +			nv_fb->r_format =3D NV50_EVO_CRTC_FB_DEPTH_30;
> +			break;
>  		default:
>  			 NV_ERROR(dev, "unknown depth %d\n", fb->depth);
>  			 return -EINVAL;
> diff --git a/drivers/gpu/drm/nouveau/nouveau_mem.c b/drivers/gpu/drm/nouv=
eau/nouveau_mem.c
> index 8af07c4..12f511e 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_mem.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_mem.c
> @@ -432,10 +432,14 @@ nouveau_mem_vram_init(struct drm_device *dev)
>  		u32 rsvd;
>=20=20
>  		/* estimate grctx size, the magics come from nv40_grctx.c */
> -		if      (dev_priv->chipset =3D=3D 0x40) rsvd =3D 0x6aa0 * vs;
> -		else if (dev_priv->chipset  < 0x43) rsvd =3D 0x4f00 * vs;
> -		else if (nv44_graph_class(dev))	    rsvd =3D 0x4980 * vs;
> -		else				    rsvd =3D 0x4a40 * vs;
> +		if (dev_priv->chipset =3D=3D 0x40)
> +			rsvd =3D 0x6aa0 * vs;
> +		else if (dev_priv->chipset  < 0x43)
> +			rsvd =3D 0x4f00 * vs;
> +		else if (nv44_graph_class(dev))
> +			rsvd =3D 0x4980 * vs;
> +		else
> +			rsvd =3D 0x4a40 * vs;
>  		rsvd +=3D 16 * 1024;
>  		rsvd *=3D dev_priv->engine.fifo.channels;
>=20=20
> diff --git a/drivers/gpu/drm/nouveau/nouveau_object.c b/drivers/gpu/drm/n=
ouveau/nouveau_object.c
> index 823800d..a89256e 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_object.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_object.c
> @@ -416,9 +416,13 @@ nv50_gpuobj_dma_init(struct nouveau_gpuobj *obj, u32=
 offset, int class,
>  	flags0 |=3D 0x00100000;
>=20=20
>  	switch (access) {
> -	case NV_MEM_ACCESS_RO: flags0 |=3D 0x00040000; break;
> +	case NV_MEM_ACCESS_RO:
> +		flags0 |=3D 0x00040000;
> +		break;
>  	case NV_MEM_ACCESS_RW:
> -	case NV_MEM_ACCESS_WO: flags0 |=3D 0x00080000; break;
> +	case NV_MEM_ACCESS_WO:
> +		flags0 |=3D 0x00080000;
> +		break;
>  	default:
>  		break;
>  	}
> diff --git a/drivers/gpu/drm/nouveau/nv50_display.c b/drivers/gpu/drm/nou=
veau/nv50_display.c
> index 75a376c..031116c 100644
> --- a/drivers/gpu/drm/nouveau/nv50_display.c
> +++ b/drivers/gpu/drm/nouveau/nv50_display.c
> @@ -629,8 +629,12 @@ nv50_display_unk10_handler(struct drm_device *dev)
>  			continue;
>=20=20
>  		switch ((mc & 0x00000f00) >> 8) {
> -		case 0: type =3D OUTPUT_ANALOG; break;
> -		case 1: type =3D OUTPUT_TV; break;
> +		case 0:
> +			type =3D OUTPUT_ANALOG;
> +			break;
> +		case 1:
> +			type =3D OUTPUT_TV;
> +			break;
>  		default:
>  			NV_ERROR(dev, "invalid mc, DAC-%d: 0x%08x\n", i, mc);
>  			goto ack;
> @@ -652,12 +656,24 @@ nv50_display_unk10_handler(struct drm_device *dev)
>  			continue;
>=20=20
>  		switch ((mc & 0x00000f00) >> 8) {
> -		case 0: type =3D OUTPUT_LVDS; break;
> -		case 1: type =3D OUTPUT_TMDS; break;
> -		case 2: type =3D OUTPUT_TMDS; break;
> -		case 5: type =3D OUTPUT_TMDS; break;
> -		case 8: type =3D OUTPUT_DP; break;
> -		case 9: type =3D OUTPUT_DP; break;
> +		case 0:
> +			type =3D OUTPUT_LVDS;
> +			break;
> +		case 1:
> +			type =3D OUTPUT_TMDS;
> +			break;
> +		case 2:
> +			type =3D OUTPUT_TMDS;
> +			break;
> +		case 5:
> +			type =3D OUTPUT_TMDS;
> +			break;
> +		case 8:
> +			type =3D OUTPUT_DP;
> +			break;
> +		case 9:
> +			type =3D OUTPUT_DP;
> +			break;
>  		default:
>  			NV_ERROR(dev, "invalid mc, SOR-%d: 0x%08x\n", i, mc);
>  			goto ack;
> @@ -761,8 +777,12 @@ nv50_display_unk20_handler(struct drm_device *dev)
>  			continue;
>=20=20
>  		switch ((mc & 0x00000f00) >> 8) {
> -		case 0: type =3D OUTPUT_ANALOG; break;
> -		case 1: type =3D OUTPUT_TV; break;
> +		case 0:
> +			type =3D OUTPUT_ANALOG;
> +			break;
> +		case 1:
> +			type =3D OUTPUT_TV;
> +			break;
>  		default:
>  			NV_ERROR(dev, "invalid mc, DAC-%d: 0x%08x\n", i, mc);
>  			goto ack;
> @@ -784,12 +804,24 @@ nv50_display_unk20_handler(struct drm_device *dev)
>  			continue;
>=20=20
>  		switch ((mc & 0x00000f00) >> 8) {
> -		case 0: type =3D OUTPUT_LVDS; break;
> -		case 1: type =3D OUTPUT_TMDS; break;
> -		case 2: type =3D OUTPUT_TMDS; break;
> -		case 5: type =3D OUTPUT_TMDS; break;
> -		case 8: type =3D OUTPUT_DP; break;
> -		case 9: type =3D OUTPUT_DP; break;
> +		case 0:
> +			type =3D OUTPUT_LVDS;
> +			break;
> +		case 1:
> +			type =3D OUTPUT_TMDS;
> +			break;
> +		case 2:
> +			type =3D OUTPUT_TMDS;
> +			break;
> +		case 5:
> +			type =3D OUTPUT_TMDS;
> +			break;
> +		case 8:
> +			type =3D OUTPUT_DP;
> +			break;
> +		case 9:
> +			type =3D OUTPUT_DP;
> +			break;
>  		default:
>  			NV_ERROR(dev, "invalid mc, SOR-%d: 0x%08x\n", i, mc);
>  			goto ack;
> diff --git a/drivers/gpu/drm/nouveau/nv50_fb.c b/drivers/gpu/drm/nouveau/=
nv50_fb.c
> index ddebd71..d6880e4 100644
> --- a/drivers/gpu/drm/nouveau/nv50_fb.c
> +++ b/drivers/gpu/drm/nouveau/nv50_fb.c
> @@ -277,9 +277,12 @@ nv50_fb_vm_trap(struct drm_device *dev, int display)
>  	else
>  		printk("%02x/", st2);
>=20=20
> -	if      (cl && cl->data) cl =3D nouveau_enum_find(cl->data, st3);
> -	else if (en && en->data) cl =3D nouveau_enum_find(en->data, st3);
> -	else                     cl =3D NULL;
> +	if (cl && cl->data)
> +		cl =3D nouveau_enum_find(cl->data, st3);
> +	else if (en && en->data)
> +		cl =3D nouveau_enum_find(en->data, st3);
> +	else
> +		cl =3D NULL;
>  	if (cl)
>  		printk("%s", cl->name);
>  	else
> diff --git a/drivers/gpu/drm/nouveau/nv50_grctx.c b/drivers/gpu/drm/nouve=
au/nv50_grctx.c
> index 336aab2..6a4290a 100644
> --- a/drivers/gpu/drm/nouveau/nv50_grctx.c
> +++ b/drivers/gpu/drm/nouveau/nv50_grctx.c
> @@ -572,7 +572,8 @@ nv50_graph_construct_mmio(struct nouveau_grctx *ctx)
>=20=20
>  			/* per-MP state */
>  			for (j =3D 0; j < (dev_priv->chipset < 0xa0 ? 2 : 4); j++) {
> -				if (!(units & (1 << (j+24)))) continue;
> +				if (!(units & (1 << (j+24))))
> +					continue;
>  				if (dev_priv->chipset < 0xa0)
>  					offset =3D base + 0x200 + (j<<7);
>  				else
> diff --git a/drivers/gpu/drm/nouveau/nvc0_grctx.c b/drivers/gpu/drm/nouve=
au/nvc0_grctx.c
> index f880ff7..7aa0cbf 100644
> --- a/drivers/gpu/drm/nouveau/nvc0_grctx.c
> +++ b/drivers/gpu/drm/nouveau/nvc0_grctx.c
> @@ -32,7 +32,9 @@ nv_icmd(struct drm_device *dev, u32 icmd, u32 data)
>  {
>  	nv_wr32(dev, 0x400204, data);
>  	nv_wr32(dev, 0x400200, icmd);
> -	while (nv_rd32(dev, 0x400700) & 2) {}
> +	while (nv_rd32(dev, 0x400700) & 2) {
> +		/* by design */
> +	}
>  }
>=20=20
>  static void

Thanks, I've pushed patches 2 through 5, but not this one, Ben's too
attached to these "compressed" conditional blocks :)

--=-=-=--

--==-=-=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iF4EAREIAAYFAk2Lk3EACgkQg5k4nX1Sv1uK8wD/dop/ijczuK4yzUg9rV5PZiy/
ecaiXGkCRuk9tP6i29YBAJt0zyBXHpruEmCcz9fFEmO4xya2F/HUWIJjufA2rVfx
=3EU+
-----END PGP SIGNATURE-----
--==-=-=--

--===============0918856098==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0918856098==--
