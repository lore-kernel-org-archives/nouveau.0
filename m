From: =?UTF-8?B?RnLDqWTDqXJpYyBQaWVycmV0?= <frederic.pierret-aAmZIGRXKFlg9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH] nv50_disp_chan_mthd: ensure mthd is not NULL
Date: Thu, 20 Feb 2020 18:19:24 +0100
Message-ID: <c94ce223-56d5-e31a-2a2c-59defb988b28@qubes-os.org>
References: <dac89843-5258-5bed-ee86-7038e94e56da@qubes-os.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1699095104=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <dac89843-5258-5bed-ee86-7038e94e56da-aAmZIGRXKFlg9hUCZPvPmw@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, daniel-/w4YWyX8dFk@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: nouveau.vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1699095104==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="w32BqMJ8HV23tU4jg2Bb4RtNFGXOHFoba"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--w32BqMJ8HV23tU4jg2Bb4RtNFGXOHFoba
Content-Type: multipart/mixed; boundary="8CHATbdN7dX0VKeJHOzRWHdG37WhI5eiD"

--8CHATbdN7dX0VKeJHOzRWHdG37WhI5eiD
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi,
Is anything missing here? How can I get this merged?

Best regards,
Fr=C3=A9d=C3=A9ric Pierret

On 2020-02-08 20:43, Fr=C3=A9d=C3=A9ric Pierret wrote:
> Pointer to structure array is assumed not NULL by default. It has
> the consequence to raise a kernel panic when it's not the case.
>=20
> Basically, running at least a RTX2080TI on Xen makes a bad mmio error
> which causes having 'mthd' pointer to be NULL in 'channv50.c'. From the=

> code, it's assumed to be not NULL by accessing directly 'mthd->data[0]'=

> which is the reason of the kernel panic. Simply check if the pointer
> is not NULL before continuing.
>=20
> BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=3D206299
> Cc: stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Signed-off-by: Fr=C3=A9d=C3=A9ric Pierret (fepitre) <frederic.pierret@q=
ubes-os.org>
> ---
>  drivers/gpu/drm/nouveau/nvkm/engine/disp/channv50.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/channv50.c b/driv=
ers/gpu/drm/nouveau/nvkm/engine/disp/channv50.c
> index bcf32d92ee5a..50e3539f33d2 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/channv50.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/channv50.c
> @@ -74,6 +74,8 @@ nv50_disp_chan_mthd(struct nv50_disp_chan *chan, int =
debug)
> =20
>  	if (debug > subdev->debug)
>  		return;
> +	if (!mthd)
> +		return;
> =20
>  	for (i =3D 0; (list =3D mthd->data[i].mthd) !=3D NULL; i++) {
>  		u32 base =3D chan->head * mthd->addr;
>=20


--8CHATbdN7dX0VKeJHOzRWHdG37WhI5eiD--

--w32BqMJ8HV23tU4jg2Bb4RtNFGXOHFoba
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEn6ZLkvlecGvyjiymSEAQtc3FduIFAl5Ov5wACgkQSEAQtc3F
duLSHw/+P2mgoCNKTxx7otQopMCHby1vNGeAhUhLrEBEcyH+s8HUw0PKa+sMcibJ
VBNFWivU/COlSowQWklTL3E21wTZNf7Wjw4Bn6R/G7GHYbEdHo/8o7kwcPT8+2J6
eF+AttjMc2wYlqiGea0PULs3plbDpJBtJXVzQG//5TVZXiVNF1RF+sCH0jyqfLfn
axvuE8I8kJO/yN6gstsumDzBdXA6TtgzVyJDs2KHm3P5z7OdECk9/UJDtp70Gsr7
bfBcAneBZNCPAekqB1VOl5399OYEINbRlyycb1CKtfkqW0Ydk24dsA2ymw9lairn
yi/3gOAI+cmSsuWK9xFBRgjtXmrduBhD68UtLGno5JA4qoKhYryGHyIhf5EGbQvA
aBTVrdvRQwlu9sipUvUYWeVHZ/nn7D3n3RVUXZ/lf8svoVfl4AeMqhI3+poDrG2C
cNHRiW8pwh/g6qoYbZjvCkI/A4gftqGQGZwJf+IvOGZz7+cO16d9KUA9nYQY7wRq
f7hVRbA5TgM62VI05uWLmdUGnbmNJh8T698dm2q/ghf2TIt6pbxPfCjEUtw8a0jH
Pp0u0kvclJ5pFAdOXHSqxs9tdZEbmMrdj1APXn6GhYY0cjaf59o08bJ9+AQtxFgB
OfX8vtDOrtQR7ROHp/rKpRy1qX1wB6ZIQnAIan93/vD26Dxl9lY=
=V2u5
-----END PGP SIGNATURE-----

--w32BqMJ8HV23tU4jg2Bb4RtNFGXOHFoba--

--===============1699095104==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1699095104==--
