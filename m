From: Thomas Zimmermann <tzimmermann-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [RFC] Remove AGP support from Radeon/Nouveau/TTM
Date: Wed, 13 May 2020 13:00:10 +0200
Message-ID: <a4b8b601-b376-448c-d09e-845342dd6423@suse.de>
References: <20200511171722.96576-1-christian.koenig@amd.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1901008595=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20200511171722.96576-1-christian.koenig-5C7GfCeVMHo@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1901008595==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="MrjUrVWqiQEewrsNf4S2lLkzGVVsVr58o"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--MrjUrVWqiQEewrsNf4S2lLkzGVVsVr58o
Content-Type: multipart/mixed; boundary="Me6c6vnN3QGvOgraktLMmbZaVN7vNUKSA";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann-l3A5Bk7waGM@public.gmane.org>
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>,
 dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org,
 nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Message-ID: <a4b8b601-b376-448c-d09e-845342dd6423-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [Nouveau] [RFC] Remove AGP support from Radeon/Nouveau/TTM
References: <20200511171722.96576-1-christian.koenig-5C7GfCeVMHo@public.gmane.org>
In-Reply-To: <20200511171722.96576-1-christian.koenig-5C7GfCeVMHo@public.gmane.org>

--Me6c6vnN3QGvOgraktLMmbZaVN7vNUKSA
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

It's probably not much of a problem in practice.

I guess everyone who plays 3d games has upgraded to something newer.

Wrt desktops, I found that some components of modern desktops (KDE,
Gnome) now have a hard requirement on SSE2. [1][2] But AGP is mostly
used in old 32-bit systems, which don't have SSE2.* So remaining users
of the GART functionality probably don't use any of these desktops.

The simpler WMs are usually usable with only little VRAM. At least they
should not be hit by any performance penalty.

Best regards
Thomas

[1] https://bugzilla.opensuse.org/show_bug.cgi?id=3D1162283
[2] https://bugzilla.opensuse.org/show_bug.cgi?id=3D1077870

* First-generation Athlon 64 have SSE2 and AGP support. But there are
few systems. Around that time AGP was replaced by PCIe.

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


--Me6c6vnN3QGvOgraktLMmbZaVN7vNUKSA--

--MrjUrVWqiQEewrsNf4S2lLkzGVVsVr58o
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl670z4ACgkQaA3BHVML
eiNigwgAuwUs8S6HYu8CTwsz9zS8zr2FLxgCELINCjLc7uHN+bBpMnK/E9SbuncH
UfQTlPf8oSae7Y6EGKPdW8LrG2KhF+RNoCTnhx1MR45kucbzzs5n1DXZhUx440E2
dC2rVY08zsiFJCWMjz2fC56PkDFc8LVXKIbPwCVWq9I0tvfq/aja4CELOQIbcFFX
kE7wez1Wb2R4RPY34XN5hyvL1vroX3WojI2dRiH2Ek5sSY+KiiTTY3CEQ6edRoAK
daGJMrjsgHPZdETKdl9wgZPEj1nBNeSRVkZOABXeMYxWxstPK20t97NYMmWpXxm6
Z5kveddcarO9OCm7Ed4o+sdJty2PQw==
=4IX2
-----END PGP SIGNATURE-----

--MrjUrVWqiQEewrsNf4S2lLkzGVVsVr58o--

--===============1901008595==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1901008595==--
