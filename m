From: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/5] drm/nouveau: better alignment of bo sizes
	and use roundup instead of ALIGN
Date: Sun, 27 Dec 2009 01:21:40 +0100
Message-ID: <6d4bc9fc0912261621v46be0bb6mfa614deae69c0154@mail.gmail.com>
References: <1261863788-8318-1-git-send-email-madman2003@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1261863788-8318-1-git-send-email-madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

pushed 1 to 4

On Sat, Dec 26, 2009 at 10:43 PM, Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> w=
rote:
> - Aligning to block size should ensure that the extra size is enough.
> - Using roundup, because not all sizes are powers of two.
>
> Signed-off-by: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
> =A0drivers/gpu/drm/nouveau/nouveau_bo.c =A0 =A0| =A0 =A08 ++++++--
> =A0drivers/gpu/drm/nouveau/nouveau_fbcon.c | =A0 =A04 ++--
> =A02 files changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouve=
au/nouveau_bo.c
> index 98c46bd..fd767e7 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> @@ -73,6 +73,7 @@ nouveau_bo_fixup_align(struct drm_device *dev,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0case 0x4800:
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0case 0x7a00:
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (dev_priv->chipset >=3D=
 0xA0) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 *size =3D r=
oundup(*size, 28672);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/* This is=
 based on high end cards with 448 bits
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * memory =
bus, could be different elsewhere.*/
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*size +=3D=
 6 * 28672;
> @@ -80,9 +81,11 @@ nouveau_bo_fixup_align(struct drm_device *dev,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * but we =
must also align to page size. */
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*align =3D=
 2 * 8 * 28672;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0} else if (dev_priv->chips=
et >=3D 0x90) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 *size =3D r=
oundup(*size, 16384);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*size +=3D=
 3 * 16384;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*align =3D=
 12 * 16834;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0} else {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 *size =3D r=
oundup(*size, 8192);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*size +=3D=
 3 * 8192;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/* 12 * 81=
92 is the actual alignment requirement
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * but we =
must also align to page size. */
> @@ -110,10 +113,11 @@ nouveau_bo_fixup_align(struct drm_device *dev,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0}
>
> - =A0 =A0 =A0 *size =3D ALIGN(*size, PAGE_SIZE);
> + =A0 =A0 =A0 /* ALIGN works only on powers of two. */
> + =A0 =A0 =A0 *size =3D roundup(*size, PAGE_SIZE);
>
> =A0 =A0 =A0 =A0if (dev_priv->card_type =3D=3D NV_50) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 *size =3D ALIGN(*size, 65536);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 *size =3D roundup(*size, 65536);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*align =3D max(65536, *align);
> =A0 =A0 =A0 =A0}
> =A0}
> diff --git a/drivers/gpu/drm/nouveau/nouveau_fbcon.c b/drivers/gpu/drm/no=
uveau/nouveau_fbcon.c
> index 84af25c..44cbbee 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_fbcon.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_fbcon.c
> @@ -212,11 +212,11 @@ nouveau_fbcon_create(struct drm_device *dev, uint32=
_t fb_width,
>
> =A0 =A0 =A0 =A0mode_cmd.bpp =3D surface_bpp;
> =A0 =A0 =A0 =A0mode_cmd.pitch =3D mode_cmd.width * (mode_cmd.bpp >> 3);
> - =A0 =A0 =A0 mode_cmd.pitch =3D ALIGN(mode_cmd.pitch, 256);
> + =A0 =A0 =A0 mode_cmd.pitch =3D roundup(mode_cmd.pitch, 256);
> =A0 =A0 =A0 =A0mode_cmd.depth =3D surface_depth;
>
> =A0 =A0 =A0 =A0size =3D mode_cmd.pitch * mode_cmd.height;
> - =A0 =A0 =A0 size =3D ALIGN(size, PAGE_SIZE);
> + =A0 =A0 =A0 size =3D roundup(size, PAGE_SIZE);
>
> =A0 =A0 =A0 =A0ret =3D nouveau_gem_new(dev, dev_priv->channel, size, 0, T=
TM_PL_FLAG_VRAM,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A00, 0x0000, fal=
se, true, &nvbo);
> --
> 1.6.6.rc4
>
>
