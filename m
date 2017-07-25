From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] bios: Restrict missing fp table message to
 desktop cards.
Date: Tue, 25 Jul 2017 12:57:02 +1000
Message-ID: <30f80fcb-0ed5-de21-cdca-a2b95f552417@gmail.com>
References: <20170725023939.4850-1-rosenp@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0353157993=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20170725023939.4850-1-rosenp-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0353157993==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="IlDEa92rSSA3FwOWIh8WxUxnrUEXOLN1X"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--IlDEa92rSSA3FwOWIh8WxUxnrUEXOLN1X
Content-Type: multipart/mixed; boundary="xgN4gUJfpv1G9mfrl5MQ50VB2TWmhNQMr";
 protected-headers="v1"
From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Message-ID: <30f80fcb-0ed5-de21-cdca-a2b95f552417-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Nouveau] [PATCH] bios: Restrict missing fp table message to
 desktop cards.
References: <20170725023939.4850-1-rosenp-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
In-Reply-To: <20170725023939.4850-1-rosenp-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

--xgN4gUJfpv1G9mfrl5MQ50VB2TWmhNQMr
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 07/25/2017 12:39 PM, Rosen Penev wrote:
> A 2 minute google search shows that this error is prevalent with mobile=
 Nvidia
> GPUs. Since we can assume mobile parts have no fp table, demote the err=
or to
> desktop cards.
>=20
> Also reword the comment since the error is not restricted to Apple hard=
ware.
Thanks for the patch.  Dealing with this is something that I've thought
about on and off for a while, but never done.

Instead of making it conditional, I'd suggest instead just removing it
completely, or silencing it with NV_DEBUG instead of NV_ERROR.

Ben.

>=20
> Signed-off by: Rosen Penev <rosenp-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drm/nouveau/nouveau_bios.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>=20
> diff --git a/drm/nouveau/nouveau_bios.c b/drm/nouveau/nouveau_bios.c
> index b998c33a..7c17878d 100644
> --- a/drm/nouveau/nouveau_bios.c
> +++ b/drm/nouveau/nouveau_bios.c
> @@ -351,11 +351,11 @@ static int parse_fp_mode_table(struct drm_device =
*dev, struct nvbios *bios)
>  	struct lvdstableheader lth;
> =20
>  	if (bios->fp.fptablepointer =3D=3D 0x0) {
> -		/* Apple cards don't have the fp table; the laptops use DDC */
> -		/* The table is also missing on some x86 IGPs */
> -#ifndef __powerpc__
> -		NV_ERROR(drm, "Pointer to flat panel table invalid\n");
> -#endif
> +		if (!bios->is_mobile) {
> +			/* Most laptop cards lack an fp table. They use DDC.*/
> +			NV_ERROR(drm, "Pointer to flat panel table invalid\n");
> +		}
> +
>  		bios->digital_min_front_porch =3D 0x4b;
>  		return 0;
>  	}
>=20


--xgN4gUJfpv1G9mfrl5MQ50VB2TWmhNQMr--

--IlDEa92rSSA3FwOWIh8WxUxnrUEXOLN1X
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEETp/uv2nr9kIVth0/dgucYlCSkfsFAll2s34ACgkQdgucYlCS
kfsSGQ/9FKCWRjgtio5B3iCKuxHHMU3UzXUWI9i2DqFLHhJ9nq2TdlASZhMJaxQ2
+vGzk4O4Ac8yCbwyIe6kG3e+Lzbrh4XxmsKrTNM8CKuMyp11J1EffYJI77xv6ovV
cHKe3Qvj3eqkLJ84ys4/bMjRR0YqagZca2QPfMDQBlCJqqIgxe7r0eWzNUrv7n81
k57vXYySVI6GIxXRGA1ZjUtT/KALNMtmdEeGRdVRJ7t2ZloIs8C2ukdAiefyspNh
n+jadeKICALPnFzOifky6I+qfWdwmJvnpfswZOA/viTbmu2NkDLzSz+cFfG5i562
W/ZlvvJHYWTb5poDcfdMk/yV7rzoANl6AcN0JYAWUOMeWHwn7rxDZpGZTOsfpAXl
tBPrLAisD3oGcbIexWW464pBSQhLga9XgcD+LED5gZPoRJlYlJF7Ug3a4agWQhtc
Oolf9MfzD0FkZB8pnjnZyp44kd0Nphv9OlgnjMG8BLDdlPOLQeCzPSYVgvtgfmOZ
Jx1VJWocc64U2YXMkE1JyQFSSKwTJa8dyh9kyvAW+MPLPGbJOi3rHxU0PoqGLPop
7l0R8U9ffeNADqE337qYcGsDj7Wsw5yWrJC6WkWpZbxXlQiNoLo94RTHgS/TQnSw
iIciK5ZC0uz1YWBECmUz2W7PXdFGWLY1Y2yO2GARa5s0YpWPpMw=
=uKLu
-----END PGP SIGNATURE-----

--IlDEa92rSSA3FwOWIh8WxUxnrUEXOLN1X--

--===============0353157993==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0353157993==--
