From: Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org>
Subject: Re: NV130 - gtx 1050 ti
Date: Thu, 4 May 2017 11:00:40 +0200
Message-ID: <20170504090040.xnlpegbhp6jbwalp@pmoreau.org>
References: <160646ee-8f7f-7a5d-b703-dd951b1d815b@xtronics.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2089012375=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <160646ee-8f7f-7a5d-b703-dd951b1d815b-WH+jy8H4ZDlWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Karl Schmidt <karl-WH+jy8H4ZDlWk0Htik3J/w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============2089012375==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kxr7qzekt4pq5clz"
Content-Disposition: inline


--kxr7qzekt4pq5clz
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

Acceleration for Pascal cards is coming in Linux 4.12, support for Pascal c=
ards
in xorg-video-nouveau is in 1.0.15, and if I remember correctly, on the
Mesa-side, you will need >=3D17.0.

Pierre

On 02:04 am - May 04 2017, Karl Schmidt wrote:
> This is probably the problem
> May  3 16:44:45 kernel: [    7.068336] nouveau E[  DEVICE][0000:08:00.0] =
unknown chipset, 0x137000a1
> May  3 16:44:45 kernel: [    7.068401] nouveau E[     DRM] failed to crea=
te 0x80000080, -22
> May  3 16:44:45 kernel: [    7.068723] nouveau: probe of 0000:08:00.0 fai=
led with error -22
>=20
> I can make this card available - if you can tell me an older card that ca=
n do the
> hdmi2 480x1200 60hz 4:4:4 output that is in
>=20
> xserver-xorg-video-nouveau 1:1.0.13-3
>=20
> --=20
> -------------------------------------------------------------------------=
-------
> Karl Schmidt                                  EMail Karl-WH+jy8H4ZDlWk0Htik3J/w@public.gmane.org
> Transtronics, Inc.                              WEB http://secure.transtr=
onics.com
> 3209 West 9th Street                             Ph (785) 841-3089
> Lawrence, KS 66049                              FAX (785) 841-0434
>=20
> Coordination does not run in my family,
> it stumbles.
> -------------------------------------------------------------------------=
-------
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau

--kxr7qzekt4pq5clz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEYgBv5JnnDxeItcEHU3l4X80+KSQFAlkK7bQACgkQU3l4X80+
KSSxjw/+JZXvGsYcvNqLLzwLHVNdjT8amaEWia/NMvM0Gs0MA717aRyOF7GHYuKv
YigO9E4Ifpbu5BNiXQgbWYGE8b8hdVZCNolUEPJcZx+I1vaxwsif/QEPp7/sThjY
rtc8ePVDdpxVgstBLowmWtOKeRblSF8EVQNT+TMu55D9Y0punjZBys+S1VGPoFqo
0dheqEuxPbh3qoFwbjKnuRPkxdwNorXaLal2qrSiACYHdcDgZpFvywGRo6XDjwyt
NWr6uqcM9z04N7NhSU7YwObUe/7zPSmcOY/qjhcVD3f2/Pz9GO+vnFmT3H9aIo2C
SN8Pq2wZ/GGE9wgrDkr5CnlZKvZD0ermDF6s50HZ4jRU6SSauWDaCSzRdSo2YqfP
aJMT83V+NCZZvVUfs1E1zHPP7VDKrlZKMRi9Jz1uCNId/hUDgnLEO3O/Ows+OhXt
CYqTCVVEj9W//P/s8PkX480VU63d1/JmBfWuaOh0XYEHlVqGNMkMuW9CgV4/jXdT
E5e4vpRU0uRoabPbEe6fZdbgM/co8lq1Aqwd9Zzlg1oijvsTvmYbS7/s880ufpAF
ixfU/lD+YzXvDTOuk6Lv21J/G+B0O8n8JO1aZyVkSOCKj3TzHMD7OIN83BwT8v3G
EOZGgFWGcHrAbVAq35lfUivZThL5TkpW88vQaPsY5QnPAWT0xEY=
=haqj
-----END PGP SIGNATURE-----

--kxr7qzekt4pq5clz--

--===============2089012375==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============2089012375==--
