From: Thomas Zimmermann <tzimmermann-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [Nouveau] [RFC] Remove AGP support from Radeon/Nouveau/TTM
Date: Tue, 12 May 2020 20:29:43 +0200
Message-ID: <1f7b3774-8724-7653-3481-9429ae991acc@suse.de>
References: <20200511171722.96576-1-christian.koenig@amd.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1310300533=="
Return-path: <amd-gfx-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20200511171722.96576-1-christian.koenig-5C7GfCeVMHo@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:amd-gfx-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: amd-gfx-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "amd-gfx" <amd-gfx-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1310300533==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="XYg86twiVKksAsvYo9LMBYSw5Mu9e8bTQ"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--XYg86twiVKksAsvYo9LMBYSw5Mu9e8bTQ
Content-Type: multipart/mixed; boundary="4417UGSA9ZHxDkKbeOefL9hpeZxzUXtlz";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann-l3A5Bk7waGM@public.gmane.org>
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>,
 dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org,
 nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Message-ID: <1f7b3774-8724-7653-3481-9429ae991acc-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [Nouveau] [RFC] Remove AGP support from Radeon/Nouveau/TTM
References: <20200511171722.96576-1-christian.koenig-5C7GfCeVMHo@public.gmane.org>
In-Reply-To: <20200511171722.96576-1-christian.koenig-5C7GfCeVMHo@public.gmane.org>

--4417UGSA9ZHxDkKbeOefL9hpeZxzUXtlz
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 11.05.20 um 19:17 schrieb Christian K=C3=B6nig:
> Hi guys,
>=20
> Well let's face it AGP is a total headache to maintain and dead for at =
least 10+ years.
>=20
> We have a lot of x86 specific stuff in the architecture independent gra=
phics memory management to get the caching right, abusing the DMA API on =
multiple occasions, need to distinct between AGP and driver specific page=
 tables etc etc...
>=20
> So the idea here is to just go ahead and remove the support from Radeon=
 and Nouveau and then drop the necessary code from TTM.
>=20
> For Radeon this means that we just switch over to the driver specific p=
age tables and everything should more or less continue to work.
>=20
> For Nouveau I'm not 100% sure, but from the code it of hand looks like =
we can do it similar to Radeon.
>=20
> Please comment what you think about this.

There's some AGP support code in the DRM core. Can some of that declared
as legacy?

Specifically, what about these AGP-related ioctl calls? Can they be
declared as legacy? It would appear to me that KMS-based drivers don't
have to manage AGP by themselves. (?)

Best regards
Thomas

>=20
> Regards,
> Christian.
>=20
>=20
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--4417UGSA9ZHxDkKbeOefL9hpeZxzUXtlz--

--XYg86twiVKksAsvYo9LMBYSw5Mu9e8bTQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl666xcACgkQaA3BHVML
eiMKGQgAsI0A8WPKZ1qfU4YU6Bk0bcQSwsNBNjj8fnK7dO4zoUovRX2WQbEQfSHn
gTCXramN+vtT5WKKotFx4lyKAxZaRflbDeXncLCjFzTPts4bdYaLmFGyeseLBeYZ
yXfTr9uylnkuCogztxOEU3HO+xTz5qX/eGQlznOLs1pwWFsCvhwPZzFHqgEyqFXR
OpKOAGLXc/UgvGDqNdV1+bfNJrE8smJvIuD7OMS7v4SvEUSTxGO5khVaItsdpjr5
V10LoyDkEIS10pB1zUde7iBabMsg39EwqyGGrEzvcmdT/ViSyfrEVS4fBChhCE01
fwOIY+6MsgTMw/k2kMngsph0XwmRag==
=dP9q
-----END PGP SIGNATURE-----

--XYg86twiVKksAsvYo9LMBYSw5Mu9e8bTQ--

--===============1310300533==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
amd-gfx mailing list
amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--===============1310300533==--
