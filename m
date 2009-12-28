From: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [rebased PATCH 1/2] nv50/exa: add support for more
	color formats
Date: Mon, 28 Dec 2009 18:55:23 +0100
Message-ID: <6d4bc9fc0912280955h348381der3ebae761e412ba5c@mail.gmail.com>
References: <20091228173717.GA10639@joi.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20091228173717.GA10639-OI9uyE9O0yo@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Mon, Dec 28, 2009 at 6:37 PM, Marcin Slusarz
<marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
> ---
> =A0src/nv50_exa.c | =A0155 ++++++++++++++++++++++++++++++++++++----------=
----------
> =A01 files changed, 100 insertions(+), 55 deletions(-)
>
> diff --git a/src/nv50_exa.c b/src/nv50_exa.c
> index 1f5a4ac..54968e8 100644
> --- a/src/nv50_exa.c
> +++ b/src/nv50_exa.c
> @@ -79,15 +79,16 @@ NV50EXA2DSurfaceFormat(PixmapPtr ppix, uint32_t *fmt)
>
> =A0 =A0 =A0 =A0switch (ppix->drawable.depth) {
> =A0 =A0 =A0 =A0case 8 : *fmt =3D NV50_2D_SRC_FORMAT_R8_UNORM; break;
> - =A0 =A0 =A0 case 15: *fmt =3D NV50_2D_SRC_FORMAT_X1R5G5B5_UNORM; break;
> - =A0 =A0 =A0 case 16: *fmt =3D NV50_2D_SRC_FORMAT_R5G6B5_UNORM; break;
> + =A0 =A0 =A0 case 15:
> + =A0 =A0 =A0 case 16:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 *fmt =3D NV50_2D_SRC_FORMAT_R5G6B5_UNORM;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;

depth 15 is R5G5B5, why this change?

> =A0 =A0 =A0 =A0case 24: *fmt =3D NV50_2D_SRC_FORMAT_X8R8G8B8_UNORM; break;
> =A0 =A0 =A0 =A0case 30: *fmt =3D NV50_2D_SRC_FORMAT_A2B10G10R10_UNORM; br=
eak;
> =A0 =A0 =A0 =A0case 32: *fmt =3D NV50_2D_SRC_FORMAT_A8R8G8B8_UNORM; break;
> =A0 =A0 =A0 =A0default:
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 NOUVEAU_FALLBACK("Unknown surface format =
for bpp=3D%d\n",
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ppix->=
drawable.depth);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return FALSE;

Why did you remove this?

> =A0 =A0 =A0 =A0}
>
> =A0 =A0 =A0 =A0return TRUE;
> @@ -442,12 +443,17 @@ NV50EXACheckRenderTarget(PicturePtr ppict)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ppict->pD=
rawable->height);
>
> =A0 =A0 =A0 =A0switch (ppict->format) {
> - =A0 =A0 =A0 case PICT_FORMAT(32, PICT_TYPE_ABGR, 2, 10, 10, 10):
> - =A0 =A0 =A0 case PICT_FORMAT(32, PICT_TYPE_ABGR, 0, 10, 10, 10):
> =A0 =A0 =A0 =A0case PICT_a8r8g8b8:
> =A0 =A0 =A0 =A0case PICT_x8r8g8b8:
> =A0 =A0 =A0 =A0case PICT_r5g6b5:
> =A0 =A0 =A0 =A0case PICT_a8:
> + =A0 =A0 =A0 case PICT_x1r5g5b5:
> + =A0 =A0 =A0 case PICT_a1r5g5b5:
> + =A0 =A0 =A0 case PICT_x8b8g8r8:
> + =A0 =A0 =A0 case PICT_a2b10g10r10:
> + =A0 =A0 =A0 case PICT_x2b10g10r10:
> + =A0 =A0 =A0 case PICT_a2r10g10b10:
> + =A0 =A0 =A0 case PICT_x2r10g10b10:
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0break;
> =A0 =A0 =A0 =A0default:
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0NOUVEAU_FALLBACK("picture format 0x%08x\n"=
, ppict->format);
> @@ -469,14 +475,23 @@ NV50EXARenderTarget(PixmapPtr ppix, PicturePtr ppic=
t)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0NOUVEAU_FALLBACK("pixmap is scanout buffer=
\n");
>
> =A0 =A0 =A0 =A0switch (ppict->format) {
> - =A0 =A0 =A0 case PICT_FORMAT(32, PICT_TYPE_ABGR, 2, 10, 10, 10):
> - =A0 =A0 =A0 case PICT_FORMAT(32, PICT_TYPE_ABGR, 0, 10, 10, 10):
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 format =3D NV50TCL_RT_FORMAT_A2B10G10R10_UN=
ORM;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> =A0 =A0 =A0 =A0case PICT_a8r8g8b8: format =3D NV50TCL_RT_FORMAT_A8R8G8B8_=
UNORM; break;
> =A0 =A0 =A0 =A0case PICT_x8r8g8b8: format =3D NV50TCL_RT_FORMAT_X8R8G8B8_=
UNORM; break;
> =A0 =A0 =A0 =A0case PICT_r5g6b5 =A0: format =3D NV50TCL_RT_FORMAT_R5G6B5_=
UNORM; break;
> =A0 =A0 =A0 =A0case PICT_a8 =A0 =A0 =A0: format =3D NV50TCL_RT_FORMAT_A8_=
UNORM; break;
> + =A0 =A0 =A0 case PICT_x1r5g5b5:
> + =A0 =A0 =A0 case PICT_a1r5g5b5:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 format =3D NV50TCL_RT_FORMAT_A1R5G5B5_UNORM;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> + =A0 =A0 =A0 case PICT_x8b8g8r8: format =3D NV50TCL_RT_FORMAT_X8B8G8R8_U=
NORM; break;
> + =A0 =A0 =A0 case PICT_a2b10g10r10:
> + =A0 =A0 =A0 case PICT_x2b10g10r10:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 format =3D NV50TCL_RT_FORMAT_A2B10G10R10_UN=
ORM;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> + =A0 =A0 =A0 case PICT_a2r10g10b10:
> + =A0 =A0 =A0 case PICT_x2r10g10b10:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 format =3D NV50TCL_RT_FORMAT_A2R10G10B10_UN=
ORM;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> =A0 =A0 =A0 =A0default:
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0NOUVEAU_FALLBACK("invalid picture format\n=
");
> =A0 =A0 =A0 =A0}
> @@ -510,14 +525,27 @@ NV50EXACheckTexture(PicturePtr ppict, PicturePtr pd=
pict, int op)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ppict->pD=
rawable->height);
>
> =A0 =A0 =A0 =A0switch (ppict->format) {
> - =A0 =A0 =A0 case PICT_FORMAT(32, PICT_TYPE_ABGR, 2, 10, 10, 10):
> - =A0 =A0 =A0 case PICT_FORMAT(32, PICT_TYPE_ABGR, 0, 10, 10, 10):
> =A0 =A0 =A0 =A0case PICT_a8r8g8b8:
> =A0 =A0 =A0 =A0case PICT_a8b8g8r8:
> =A0 =A0 =A0 =A0case PICT_x8r8g8b8:
> =A0 =A0 =A0 =A0case PICT_x8b8g8r8:
> =A0 =A0 =A0 =A0case PICT_r5g6b5:
> =A0 =A0 =A0 =A0case PICT_a8:
> + =A0 =A0 =A0 case PICT_x1r5g5b5:
> + =A0 =A0 =A0 case PICT_x1b5g5r5:
> + =A0 =A0 =A0 case PICT_a1r5g5b5:
> + =A0 =A0 =A0 case PICT_a1b5g5r5:
> + =A0 =A0 =A0 case PICT_b5g6r5:
> + =A0 =A0 =A0 case PICT_b8g8r8a8:
> + =A0 =A0 =A0 case PICT_b8g8r8x8:
> + =A0 =A0 =A0 case PICT_a2b10g10r10:
> + =A0 =A0 =A0 case PICT_x2b10g10r10:
> + =A0 =A0 =A0 case PICT_x2r10g10b10:
> + =A0 =A0 =A0 case PICT_a2r10g10b10:
> + =A0 =A0 =A0 case PICT_x4r4g4b4:
> + =A0 =A0 =A0 case PICT_x4b4g4r4:
> + =A0 =A0 =A0 case PICT_a4r4g4b4:
> + =A0 =A0 =A0 case PICT_a4b4g4r4:
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0break;
> =A0 =A0 =A0 =A0default:
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0NOUVEAU_FALLBACK("picture format 0x%08x\n"=
, ppict->format);
> @@ -544,6 +572,13 @@ NV50EXACheckTexture(PicturePtr ppict, PicturePtr pdp=
ict, int op)
> =A0 =A0 =A0 =A0return TRUE;
> =A0}
>
> +#define NV50TIC_0_0_FMT_1_5_5_5 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x00000014
> +#define NV50TIC_0_0_FMT_4_4_4_4 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x00000012
> +
> +#define _(X1,X2,X3,X4,FMT) (NV50TIC_0_0_TYPER_UNORM | NV50TIC_0_0_TYPEG_=
UNORM | NV50TIC_0_0_TYPEB_UNORM | NV50TIC_0_0_TYPEA_UNORM | \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 NV50TIC_0_0_MAP##X1=
 | NV50TIC_0_0_MAP##X2 | NV50TIC_0_0_MAP##X3 | NV50TIC_0_0_MAP##X4 | \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 NV50TIC_0_0_FMT_##F=
MT)
> +
> =A0static Bool
> =A0NV50EXATexture(PixmapPtr ppix, PicturePtr ppict, unsigned unit)
> =A0{
> @@ -569,66 +604,76 @@ NV50EXATexture(PixmapPtr ppix, PicturePtr ppict, un=
signed unit)
> =A0 =A0 =A0 =A0BEGIN_RING(chan, tesla, NV50TCL_CB_ADDR, 1);
> =A0 =A0 =A0 =A0OUT_RING =A0(chan, CB_TIC | ((unit * 8) << NV50TCL_CB_ADDR=
_ID_SHIFT));
> =A0 =A0 =A0 =A0BEGIN_RING(chan, tesla, NV50TCL_CB_DATA(0) | 0x40000000, 8=
);
> +
> =A0 =A0 =A0 =A0switch (ppict->format) {
> - =A0 =A0 =A0 case PICT_FORMAT(32, PICT_TYPE_ABGR, 2, 10, 10, 10):
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 OUT_RING =A0(chan, NV50TIC_0_0_MAPA_C3 | NV=
50TIC_0_0_TYPEA_UNORM |
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0NV50TIC_0_0_MAPR_C2 | NV=
50TIC_0_0_TYPER_UNORM |
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0NV50TIC_0_0_MAPG_C1 | NV=
50TIC_0_0_TYPEB_UNORM |
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0NV50TIC_0_0_MAPB_C0 | NV=
50TIC_0_0_TYPEG_UNORM |
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0NV50TIC_0_0_FMT_2_10_10_=
10);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> - =A0 =A0 =A0 case PICT_FORMAT(32, PICT_TYPE_ABGR, 0, 10, 10, 10):
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 OUT_RING =A0(chan, NV50TIC_0_0_MAPA_ONE | N=
V50TIC_0_0_TYPEA_UNORM |
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0NV50TIC_0_0_MAPR_C2 | NV=
50TIC_0_0_TYPER_UNORM |
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0NV50TIC_0_0_MAPG_C1 | NV=
50TIC_0_0_TYPEB_UNORM |
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0NV50TIC_0_0_MAPB_C0 | NV=
50TIC_0_0_TYPEG_UNORM |
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0NV50TIC_0_0_FMT_2_10_10_=
10);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> =A0 =A0 =A0 =A0case PICT_a8r8g8b8:
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 OUT_RING =A0(chan, NV50TIC_0_0_MAPA_C3 | NV=
50TIC_0_0_TYPEA_UNORM |
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0NV50TIC_0_0_MAPR_C0 | NV=
50TIC_0_0_TYPER_UNORM |
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0NV50TIC_0_0_MAPG_C1 | NV=
50TIC_0_0_TYPEB_UNORM |
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0NV50TIC_0_0_MAPB_C2 | NV=
50TIC_0_0_TYPEG_UNORM |
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0NV50TIC_0_0_FMT_8_8_8_8);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 OUT_RING(chan, _(R_C0, G_C1, B_C2, A_C3, 8_=
8_8_8));
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0break;
> =A0 =A0 =A0 =A0case PICT_a8b8g8r8:
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 OUT_RING =A0(chan, NV50TIC_0_0_MAPA_C3 | NV=
50TIC_0_0_TYPEA_UNORM |
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0NV50TIC_0_0_MAPR_C2 | NV=
50TIC_0_0_TYPER_UNORM |
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0NV50TIC_0_0_MAPG_C1 | NV=
50TIC_0_0_TYPEB_UNORM |
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0NV50TIC_0_0_MAPB_C0 | NV=
50TIC_0_0_TYPEG_UNORM |
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0NV50TIC_0_0_FMT_8_8_8_8);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 OUT_RING(chan, _(B_C0, G_C1, R_C2, A_C3, 8_=
8_8_8));
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0break;
> =A0 =A0 =A0 =A0case PICT_x8r8g8b8:
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 OUT_RING =A0(chan, NV50TIC_0_0_MAPA_ONE | N=
V50TIC_0_0_TYPEA_UNORM |
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0NV50TIC_0_0_MAPR_C0 | NV=
50TIC_0_0_TYPER_UNORM |
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0NV50TIC_0_0_MAPG_C1 | NV=
50TIC_0_0_TYPEB_UNORM |
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0NV50TIC_0_0_MAPB_C2 | NV=
50TIC_0_0_TYPEG_UNORM |
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0NV50TIC_0_0_FMT_8_8_8_8);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 OUT_RING(chan, _(R_C0, G_C1, B_C2, A_ONE, 8=
_8_8_8));
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0break;
> =A0 =A0 =A0 =A0case PICT_x8b8g8r8:
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 OUT_RING =A0(chan, NV50TIC_0_0_MAPA_ONE | N=
V50TIC_0_0_TYPEA_UNORM |
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0NV50TIC_0_0_MAPR_C2 | NV=
50TIC_0_0_TYPER_UNORM |
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0NV50TIC_0_0_MAPG_C1 | NV=
50TIC_0_0_TYPEB_UNORM |
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0NV50TIC_0_0_MAPB_C0 | NV=
50TIC_0_0_TYPEG_UNORM |
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0NV50TIC_0_0_FMT_8_8_8_8);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 OUT_RING(chan, _(B_C0, G_C1, R_C2, A_ONE, 8=
_8_8_8));
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0break;
> =A0 =A0 =A0 =A0case PICT_r5g6b5:
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 OUT_RING =A0(chan, NV50TIC_0_0_MAPA_ONE | N=
V50TIC_0_0_TYPEA_UNORM |
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0NV50TIC_0_0_MAPR_C0 | NV=
50TIC_0_0_TYPER_UNORM |
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0NV50TIC_0_0_MAPG_C1 | NV=
50TIC_0_0_TYPEB_UNORM |
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0NV50TIC_0_0_MAPB_C2 | NV=
50TIC_0_0_TYPEG_UNORM |
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0NV50TIC_0_0_FMT_5_6_5);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 OUT_RING(chan, _(R_C0, G_C1, B_C2, A_ONE, 5=
_6_5));
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0break;
> =A0 =A0 =A0 =A0case PICT_a8:
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 OUT_RING =A0(chan, NV50TIC_0_0_MAPA_C0 | NV=
50TIC_0_0_TYPEA_UNORM |
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0NV50TIC_0_0_MAPR_ZERO | =
NV50TIC_0_0_TYPER_UNORM |
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0NV50TIC_0_0_MAPG_ZERO | =
NV50TIC_0_0_TYPEB_UNORM |
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0NV50TIC_0_0_MAPB_ZERO | =
NV50TIC_0_0_TYPEG_UNORM |
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0NV50TIC_0_0_FMT_8);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 OUT_RING(chan, _(A_C0, R_ZERO, G_ZERO, B_ZE=
RO, 8));
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> + =A0 =A0 =A0 case PICT_x1r5g5b5:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 OUT_RING(chan, _(R_C0, G_C1, B_C2, A_ONE, 1=
_5_5_5));
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> + =A0 =A0 =A0 case PICT_x1b5g5r5:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 OUT_RING(chan, _(B_C0, G_C1, R_C2, A_ONE, 1=
_5_5_5));
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> + =A0 =A0 =A0 case PICT_a1r5g5b5:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 OUT_RING(chan, _(R_C0, G_C1, B_C2, A_C3, 1_=
5_5_5));
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> + =A0 =A0 =A0 case PICT_a1b5g5r5:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 OUT_RING(chan, _(B_C0, G_C1, R_C2, A_C3, 1_=
5_5_5));
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> + =A0 =A0 =A0 case PICT_b5g6r5:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 OUT_RING(chan, _(B_C0, G_C1, R_C2, A_ONE, 5=
_6_5));
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> + =A0 =A0 =A0 case PICT_b8g8r8x8:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 OUT_RING(chan, _(A_ONE, B_C1, G_C2, R_C3, 8=
_8_8_8));
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> + =A0 =A0 =A0 case PICT_b8g8r8a8:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 OUT_RING(chan, _(A_C0, B_C1, G_C2, R_C3, 8_=
8_8_8));
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> + =A0 =A0 =A0 case PICT_a2b10g10r10:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 OUT_RING(chan, _(B_C0, G_C1, R_C2, A_C3, 2_=
10_10_10));
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> + =A0 =A0 =A0 case PICT_x2b10g10r10:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 OUT_RING(chan, _(B_C0, G_C1, R_C2, A_ONE, 2=
_10_10_10));
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> + =A0 =A0 =A0 case PICT_x2r10g10b10:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 OUT_RING(chan, _(R_C0, G_C1, B_C2, A_ONE, 2=
_10_10_10));
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> + =A0 =A0 =A0 case PICT_a2r10g10b10:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 OUT_RING(chan, _(R_C0, G_C1, B_C2, A_C3, 2_=
10_10_10));
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> + =A0 =A0 =A0 case PICT_x4r4g4b4:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 OUT_RING(chan, _(R_C0, G_C1, B_C2, A_ONE, 4=
_4_4_4));
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> + =A0 =A0 =A0 case PICT_x4b4g4r4:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 OUT_RING(chan, _(B_C0, G_C1, R_C2, A_ONE, 4=
_4_4_4));
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> + =A0 =A0 =A0 case PICT_a4r4g4b4:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 OUT_RING(chan, _(R_C0, G_C1, B_C2, A_C3, 4_=
4_4_4));
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> + =A0 =A0 =A0 case PICT_a4b4g4r4:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 OUT_RING(chan, _(B_C0, G_C1, R_C2, A_C3, 4_=
4_4_4));
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0break;
> =A0 =A0 =A0 =A0default:
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0NOUVEAU_FALLBACK("invalid picture format, =
this SHOULD NOT HAPPEN. Expect trouble.\n");
> =A0 =A0 =A0 =A0}
> +#undef _
> +
> =A0 =A0 =A0 =A0if (OUT_RELOCl(chan, bo, delta, NOUVEAU_BO_VRAM | NOUVEAU_=
BO_RD))
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return FALSE;
> =A0 =A0 =A0 =A0OUT_RING =A0(chan, 0xd0005000 | (bo->tile_mode << 22));
> --
> 1.6.6.rc3
>
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
>
