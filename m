From: Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org>
Subject: Re: GM108GLM?
Date: Thu, 31 Mar 2016 22:57:45 +0200
Message-ID: <20160331205745.GA1723@pmoreau.org>
References: <56FA7B55.6080208@translucent.dk>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0748875901=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <56FA7B55.6080208-VZMzO6RJk8wFoxwNN1DV/Q@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Sune =?utf-8?B?TcO4bGdhYXJk?= <smo-VZMzO6RJk8wFoxwNN1DV/Q@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0748875901==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oyUTqETQ0mS9luUI"
Content-Disposition: inline


--oyUTqETQ0mS9luUI
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

Acceleration support for GM107 was merged in kernel 4.1, and modesetting
support was added to 3.15. Which kernel version did you try? The GM108 chip=
set
seems to be recognised since at least 2015/08/20.

Regards,

Pierre Moreau


On 02:55 PM - Mar 29 2016, Sune M=C3=B8lgaard wrote:
> Hiya,
>=20
> Is there any change for Quadro K620M support at some point in time, and
> what can I do to help, apart from the info below?
>=20
> Best regards,
>=20
> Sune M=C3=B8lgaard
>=20
> dmesg |grep -i nouveau
> [    1.164919] nouveau 0000:08:00.0: unknown chipset (1183a0a2)
> [    1.164943] nouveau: probe of 0000:08:00.0 failed with error -12
>=20
> lspci|grep -i nvidi
> 08:00.0 3D controller: NVIDIA Corporation GM108GLM [Quadro K620M] (rev a2)
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau

--oyUTqETQ0mS9luUI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJW/Y9AAAoJEI7uMhYTPh3wUmsP/iCZU04lxmZy6cMegxiI9A2a
YAcconCUE2lUeddkZDu0cdTayAydcJEUSRtJ64nT1BMuTbGzA2aNNwBzFuSaAysT
ZhA067UJ3e8A9O7za+iQ4FhTa7Mh8CvnuyLvvYfpiLNVnkr4WdqJBjfJsgi7aPXX
NTU+Fo0YKWQMYjlQKKE8QMt4WyqQFA2lZ6g/o8cLnF0GVw5xWm3+eLPmnQAn/i+4
MmI4M+rN7VJj3E4yp8iDLGA7LjHp6aGEUIwzSR6myLmTZr3K2BuJscMZhruboLV/
j5hJ/hnwnTAmaK8G5PYzAQ9rniI2vOP5Y3MWurDPi+HFgqfbfenjbd1YhDi6gB4M
2sl9ngOINzfNOjGc3uyNEFeIJVvSQKvU5y/s3mBYybl2pDb/zIxiQYSGQ5T1oHyi
m8EFM5Y3S5NsIzSVPDJhxNaLC2EfENv0FPq7PIBX7bZLPH7IBC8cdoMtAxhbmEnq
l4Ue4hYmWp8LhmKodVfKbimXVcU+C9ZH+eXZpzd39axapjVulajlJ+crl0imFFCo
mMTOmM0KYuPQXKDe0PtxtpS556HKYbjutqhgMdShjGM+ZzWGReLxbJubpRsLk1Uj
tTfq0VM0mGeejkg187d0nqz43SbhC3U6zKvN3e6F7RturgqL7uaj+11uTAiwKUYj
4UL7lsazS9Q++3DRYKoh
=d9so
-----END PGP SIGNATURE-----

--oyUTqETQ0mS9luUI--

--===============0748875901==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0748875901==--
