From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] disp: activate dual link TMDS links only
 when possible
Date: Wed, 4 Nov 2015 10:02:57 +1000
Message-ID: <56394B31.2050504@gmail.com>
References: <1446590484-8670-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0747812996=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1446590484-8670-1-git-send-email-imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
List-Id: nouveau.vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0747812996==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="dQ27Cb16O67aucp9eV6QD1cvTuVvO6OCP"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--dQ27Cb16O67aucp9eV6QD1cvTuVvO6OCP
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 11/04/2015 08:41 AM, Ilia Mirkin wrote:
> From: Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
>=20
> Without this patch a pixel clock rate above 165 MHz on a TMDS link is
> assumed to be dual link. This is true for DVI, but not for HDMI. HDMI
> supports no dual link, but it supports pixel clock rates above 165 MHz.=

> Only activate Dual Link mode when it is actual possible.
>=20
> Signed-off-by: Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
> Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
> ---
>  drm/nouveau/nv50_display.c           | 8 ++++----
>  drm/nouveau/nvkm/engine/disp/gf119.c | 2 +-
>  drm/nouveau/nvkm/engine/disp/nv50.c  | 2 +-
>  3 files changed, 6 insertions(+), 6 deletions(-)
>=20
> diff --git a/drm/nouveau/nv50_display.c b/drm/nouveau/nv50_display.c
> index c053c50..93bcfdf 100644
> --- a/drm/nouveau/nv50_display.c
> +++ b/drm/nouveau/nv50_display.c
> @@ -1961,10 +1961,10 @@ nv50_sor_mode_set(struct drm_encoder *encoder, =
struct drm_display_mode *umode,
>  	switch (nv_encoder->dcb->type) {
>  	case DCB_OUTPUT_TMDS:
>  		if (nv_encoder->dcb->sorconf.link & 1) {
> -			if (mode->clock < 165000)
> -				proto =3D 0x1;
> -			else
> -				proto =3D 0x5;
> +			proto =3D 0x1;
> +			if (mode->clock >=3D 165000 &&
> +			    nv_encoder->dcb->duallink_possible)
> +				proto |=3D 0x4;
This is a somewhat flaky condition, given that one could plug a
single-link HDMI monitor into a duallink-capable TMDS connector.

Still, it's an improvement :)

>  		} else {
>  			proto =3D 0x2;
>  		}
> diff --git a/drm/nouveau/nvkm/engine/disp/gf119.c b/drm/nouveau/nvkm/en=
gine/disp/gf119.c
> index 186fd3a..8691b68 100644
> --- a/drm/nouveau/nvkm/engine/disp/gf119.c
> +++ b/drm/nouveau/nvkm/engine/disp/gf119.c
> @@ -158,7 +158,7 @@ exec_clkcmp(struct nv50_disp *disp, int head, int i=
d, u32 pclk, u32 *conf)
>  	switch (outp->info.type) {
>  	case DCB_OUTPUT_TMDS:
>  		*conf =3D (ctrl & 0x00000f00) >> 8;
> -		if (pclk >=3D 165000)
> +		if (pclk >=3D 165000 && outp->info.duallink_possible)
>  			*conf |=3D 0x0100;
I think it might be more robust to key this off the SOR protocol, rather
than duplicating the condition above.

>  		break;
>  	case DCB_OUTPUT_LVDS:
> diff --git a/drm/nouveau/nvkm/engine/disp/nv50.c b/drm/nouveau/nvkm/eng=
ine/disp/nv50.c
> index 32e73a9..ceecd0e 100644
> --- a/drm/nouveau/nvkm/engine/disp/nv50.c
> +++ b/drm/nouveau/nvkm/engine/disp/nv50.c
> @@ -391,7 +391,7 @@ exec_clkcmp(struct nv50_disp *disp, int head, int i=
d, u32 pclk, u32 *conf)
>  		switch (outp->info.type) {
>  		case DCB_OUTPUT_TMDS:
>  			*conf =3D (ctrl & 0x00000f00) >> 8;
> -			if (pclk >=3D 165000)
> +			if (pclk >=3D 165000 && outp->info.duallink_possible)
>  				*conf |=3D 0x0100;
Same here.

>  			break;
>  		case DCB_OUTPUT_LVDS:
>=20


--dQ27Cb16O67aucp9eV6QD1cvTuVvO6OCP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWOUsxAAoJEHYLnGJQkpH7j1sP/jS0o+e17AuxjA0Uzpv4+8eY
5eoLRWv82Ux6UgmFXeQ5hMMPWIiPe8v+Cmc2kp636R6pxYlI/vdz2Rqivjq6WCGD
s4S1Zv+Q4d9ORQbqJRBVb4itVlb2q7xPLShwOgIZxgKl3JDPecDoJnkOarpu86D8
vug65Yb2/OJEw/qin88oOL06qbxrqmYhXVAzAffox1Erq2rrGMjt6tdniQ52eCNr
YIM7aVnD7OtU0YcGl7gH76jYR190Nv2pumRtQbvPzjSbTEBbZ4Pt3LNu5lhMeohm
eEyQ+fOP9DEd1c7A5UWrBsy/SAnY4HOHwxIQESlGn+JcKfvFA6ftQDiMSn98rn9r
ZFKnHroDNpjmkRDbfpwfoEp2UtWxquX8NjODMmM5/fTmHJm2qTsJA7mze38dwuyl
A+BPN8WOJkDRo5eDfNhly62XkT7vrNV1udWknOi8EMLaGfugUqXKlQH6nMwFP1UW
kkSu4AFpaMca0QDYPQPo6PLIhSOM/jhnwJ6QJiSPQAFfVNuhBB0xuLW4rMMk9YUy
xfVgtUcJDEPS2wVCVAD1i//BxpCtsHFheYKQemlE8tJL4ixcn20ZvB9NSMCdJZAB
0reCgEiTPKdNjLiEJ61KiWxwcmo4gmjA05rX5Ip4Iazp+zR3GHDNb9lgIucKkLTp
ZwRGectPU1+BKv+CDWVV
=ITem
-----END PGP SIGNATURE-----

--dQ27Cb16O67aucp9eV6QD1cvTuVvO6OCP--

--===============0747812996==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0747812996==--
