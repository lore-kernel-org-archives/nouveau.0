From: Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org>
Subject: Re: [PATCH] nouveau/codegen: dump tgsi floats as hex
	values
Date: Wed, 15 Nov 2017 22:44:57 +0100
Message-ID: <20171115214449.eryt2oakudpmzc5l@pmoreau.org>
References: <20171114141105.2656-1-tobias.johannes.klausmann@mni.thm.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1563423732=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20171114141105.2656-1-tobias.johannes.klausmann-AqjdNwhu20eELgA04lAiVw@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Tobias Klausmann <tobias.johannes.klausmann-AqjdNwhu20eELgA04lAiVw@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1563423732==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="de3e5f4swclbp4pm"
Content-Disposition: inline


--de3e5f4swclbp4pm
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

This looks like the saner approach, compared to changing tgsi_dump.c to dis=
play
more fractional digits. Maybe there could be a second option to display as =
both
float and hex?

Reviewed-by: Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org>

On 2017-11-14 =E2=80=94 15:11, Tobias Klausmann wrote:
> Printing without this could lead to the following output, while the value=
s are
> not exactly zero:
> IMM[5] FLT32 {    0.0000,     0.0000,     0.0000,     0.0000}
> IMM[6] FLT32 {    0.0000,     0.0000,     0.0000,     0.0000}
> IMM[7] FLT32 {    0.0000,     0.0000,     0.0000,     0.0000}
>=20
> when printing the values as hex, we can now see the differences:
> IMM[5] FLT32 {0x00000019, 0x0000000f, 0x00000005, 0x0000001e}
> IMM[6] FLT32 {0x0000001e, 0x00000005, 0x0000000a, 0x00000014}
> IMM[7] FLT32 {0x00000014, 0x0000000a, 0x0000000f, 0x00000019}
>=20
> Signed-off-by: Tobias Klausmann <tobias.johannes.klausmann-AqjdNwhu20eELgA04lAiVw@public.gmane.org>
> ---
>  src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp b/=
src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp
> index 34351dab51..898031811d 100644
> --- a/src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp
> +++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp
> @@ -1095,7 +1095,7 @@ Source::Source(struct nv50_ir_prog_info *prog) : in=
fo(prog)
>     tokens =3D (const struct tgsi_token *)info->bin.source;
> =20
>     if (prog->dbgFlags & NV50_IR_DEBUG_BASIC)
> -      tgsi_dump(tokens, 0);
> +      tgsi_dump(tokens, TGSI_DUMP_FLOAT_AS_HEX);
>  }
> =20
>  Source::~Source()
> --=20
> 2.15.0
>=20
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau

--de3e5f4swclbp4pm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEYgBv5JnnDxeItcEHU3l4X80+KSQFAloMtVkACgkQU3l4X80+
KSQk0g/+OnOSaR5pC559kuhsapBQhVx1hGJ4oxtRylwDyIYZ/GlLesi0YblO1dxX
grQ1saFRtWb9tklvJgJdtOGnHfJWwYll0AS8YoNSbsm7A4gpDsDv2cVZb6ZTOD4b
gAbaZLtl+hDSHriLTXPXsB5FQe3vuqlFIJtGW5qc3gxlZ8KmEtvUPePxjaGATasK
V5NdXCTWeTQudWBinDw4P9RpwHWXl+UX5+qtgFXjPzZdvT7A3NBOR6vLtguHw573
IW1MY3cVVUhFm3malf7L1z9XDIjOImh0JLsFctFep2JQZHS5B26RSdYJb0+E+eD8
RdX675HMsVeamGbl8DrEKr2HKwhwlRRc07pjRhw/vrZeHsmhe9sCqaFrd2w3/9Qd
albGpg/nYNxruQ3grVCSlJw4UIVaqcZ2Ao59nPxrEXGiyYziDx+YDhAd5OGn5gRy
lI1BvgngubiXLYueWHKiWNGzmk40vR6t4LVxyd9b8+tJYqCQHcOxdx9jHZXlJ3F9
4GuUq3qA9llrc6Fbo2gUHOFaiaSwxXDNfxgTpPmJ/5o3piagGyvxQsXl700UR+7v
vpaciSMGsE6eTd7PxOrSewhMSJKxOXfqfs/7WBgoqGU0xLzVTbX9IQTFBK/CnYtu
4ThQGnIbYCfV8/owipqkSgRvkaNQw6uWqQTNkhdqKQMPOIDIHnM=
=fPbM
-----END PGP SIGNATURE-----

--de3e5f4swclbp4pm--

--===============1563423732==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1563423732==--
