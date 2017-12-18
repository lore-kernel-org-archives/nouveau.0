From: Pierre Moreau <pierre.morrow@free.fr>
Subject: Re: [Nouveau] [PATCH] drm/nouveau/imem/nv50: fix incorrect use of
 refcount API
Date: Mon, 18 Dec 2017 13:16:47 +0100
Message-ID: <20171218121628.akfvzmlvqvkbtjno@pmoreau.org>
References: <20171208183034.9027-1-ard.biesheuvel@linaro.org>
 <CAKv+Gu-2xLOZjvDM7-PtxsQJKPdO1H5DgBL7zA91HSMa23=zPg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0890200611=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAKv+Gu-2xLOZjvDM7-PtxsQJKPdO1H5DgBL7zA91HSMa23=zPg@mail.gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Cc: Daniel Thompson <daniel.thompson@linaro.org>, ollapse-all@freedesktop.org, Masami Hiramatsu <masami.hiramatsu@linaro.org>, David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>, setcollapse_unread=no@pmoreau.org
List-Id: nouveau.vger.kernel.org


--===============0890200611==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tzcfvzpcnn5s66vr"
Content-Disposition: inline


--tzcfvzpcnn5s66vr
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Ard,

It seems that Ben already committed a similar patch to his tree (see [0]). =
I do
not know whether he is planning to have it part of a pull request of fixes =
for
4.15.

Best regards,
Pierre

[0]: https://github.com/skeggsb/nouveau/commit/9068f1df2394f0e4ab2b2a28cac0=
6b462fe0a0aa

On 2017-12-18 =E2=80=94 09:27, Ard Biesheuvel wrote:
> On 8 December 2017 at 19:30, Ard Biesheuvel <ard.biesheuvel@linaro.org> w=
rote:
> > Commit be55287aa5b ("drm/nouveau/imem/nv50: embed nvkm_instobj directly
> > into nv04_instobj") introduced some new calls to the refcount api to
> > the nv50 mapping code. In one particular instance, it does the
> > following:
> >
> >     if (!refcount_inc_not_zero(&iobj->maps)) {
> >             ...
> >             refcount_inc(&iobj->maps);
> >     }
> >
> > i.e., it calls refcount_inc() to increment the refcount when it is known
> > to be zero, which is explicitly forbidden by the API. Instead, use
> > refcount_set() to set it to 1.
> >
> > Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
> > ---
> >
> > Apologies if this was already found and fixed. I don't usually follow
> > the DRM or nouveau mailing lists.
> >
> >  drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c b/drive=
rs/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c
> > index 1ba7289684aa..db48a1daca0c 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c
> > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c
> > @@ -249,7 +249,7 @@ nv50_instobj_acquire(struct nvkm_memory *memory)
> >                         iobj->base.memory.ptrs =3D &nv50_instobj_fast;
> >                 else
> >                         iobj->base.memory.ptrs =3D &nv50_instobj_slow;
> > -               refcount_inc(&iobj->maps);
> > +               refcount_set(&iobj->maps, 1);
> >         }
> >
> >         mutex_unlock(&imem->subdev.mutex);
> > --
> > 2.11.0
> >
>=20
> Ping?
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau

--tzcfvzpcnn5s66vr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEYgBv5JnnDxeItcEHU3l4X80+KSQFAlo3sa4ACgkQU3l4X80+
KST9qRAAtv5OLyThG0OZFow67/H+aJouH9Fxegsdaa0faAdvNZnRBoI5ll+aSNhn
jYyXjUZCnbKP6OgsQ4rj6WYTiUED+O+0PxZRNPxOhxk5JPSxqz8IDfcstPiyuZvF
SZ9/smCRZxXLqiXIxorGLUb+WZJBXS1V3e5nDeWfPWfOSiXC7Wzo/jrOglUA+ywo
vQ7ngR7AlVgFwCPnNw7ugBxJQP/5AWVQT/mupVNF/3XKZCkLMRBKzNJimFR+3IEe
O/4M8qmwXx3FY3gK/wQhVHxHQ3t+EuG1se+cazV2AZe0wKHPfGpyWPTs6OuyOgdy
iX7V243xBy2f7fmi5vdESFQ8PaeNYrxGI2nlbyQSB1UFOdZAF0gkczC6XP43VkVG
UxGxrDwNO646UUVeR61XCbBM7hI4Hkn6oNRbgqwpdy5D4FkynHRGTAqvGqnrdor/
VKeFmsWanwezzWLZnVJ7j7C+293qRJ8RMN4eeE2X911H3bEDtciflf4zY8CxbQTS
0lKC1CmuWtQZpjuP8PM+SEOb4ecd0TwcoVDsXvhe+qf0bVDPrb8S6gVdIA5xdvB0
J0zYSjoH5jru9+20Fl11QjkxBZ3KIYtKrDEap6vsN7G8c6lKzqbhb+LGCOpOLSh/
YYTxaWVOXrHoaHx4AOyvU34H9GyoeViXPNRyB0gbFRI+OmQH+do=
=ba7l
-----END PGP SIGNATURE-----

--tzcfvzpcnn5s66vr--

--===============0890200611==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0890200611==--
