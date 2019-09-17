From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/6] drm/nouveau: Remove bogus gk20a aperture
 callback
Date: Tue, 17 Sep 2019 11:02:54 +0200
Message-ID: <20190917090254.GC17854@ulmo>
References: <20190916151757.10953-1-thierry.reding@gmail.com>
 <20190916151757.10953-4-thierry.reding@gmail.com>
 <CACAvsv6AzWvpPLaOKahpJErTAMCJet4_4mBvRC8Z+e4+bwaD4w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0145585315=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CACAvsv6AzWvpPLaOKahpJErTAMCJet4_4mBvRC8Z+e4+bwaD4w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: ML nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, ML dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org


--===============0145585315==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="NU0Ex4SbNnrxsi6C"
Content-Disposition: inline


--NU0Ex4SbNnrxsi6C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 17, 2019 at 01:43:13PM +1000, Ben Skeggs wrote:
> On Tue, 17 Sep 2019 at 01:18, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> w=
rote:
> >
> > From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >
> > The gk20a (as well as all subsequent Tegra instantiations of the GPU) do
> > in fact use the same apertures as regular GPUs. Prior to gv11b there are
> > no checks in hardware for the aperture, so we get away with setting VRAM
> > as the aperture for buffers that are actually in system memory.
> Can GK20A take comptags with aperture set to system memory?  For some
> reason I can recall, I was under the impression PTEs needed to be
> pointed at "vidmem" (despite them actually accessing system memory
> anyway) on Tegra parts for compression to work?  I could be mistaken
> though.

I don't think GK20A supports comptags at all. I think this wasn't
introduced until GM20B. nvgpu has some "gk20a" code to flush comptags,
but that's only used on GM20B and later.

Anyway, my understanding is that on all of GK20A, GM20B and GP10B the
aperture field is completely ignored. I think that also goes for
comptags. nvgpu in particular never requests comptags to be allocated
=66rom vidmem. See:

	https://nv-tegra.nvidia.com/gitweb/?p=3Dlinux-nvgpu.git;a=3Dblob;f=3Ddrive=
rs/gpu/nvgpu/os/linux/ltc.c;h=3Dbaeb20b2e539cc6cb70667ce168603546678dc73;hb=
=3D2081ce686bfd4deb461b4130df424d592000ff88#l30

There are two callers of that, both passing "false" for the vidmem_alloc
parameter, so comptags always do end up in system memory for Tegra.

That said, I'll go confirm that with one of our experts and get back to
you.

Thierry

>=20
> Ben.
>=20
> >
> > Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > ---
> >  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h      |  1 -
> >  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgk20a.c | 10 ----------
> >  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgm20b.c |  4 ++--
> >  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp10b.c |  2 +-
> >  4 files changed, 3 insertions(+), 14 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h b/drivers/gp=
u/drm/nouveau/nvkm/subdev/mmu/vmm.h
> > index fb3a9e8bb9cd..9862f44ac8b5 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h
> > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h
> > @@ -212,7 +212,6 @@ void gf100_vmm_flush(struct nvkm_vmm *, int);
> >  void gf100_vmm_invalidate(struct nvkm_vmm *, u32 type);
> >  void gf100_vmm_invalidate_pdb(struct nvkm_vmm *, u64 addr);
> >
> > -int gk20a_vmm_aper(enum nvkm_memory_target);
> >  int gk20a_vmm_valid(struct nvkm_vmm *, void *, u32, struct nvkm_vmm_ma=
p *);
> >
> >  int gm200_vmm_new_(const struct nvkm_vmm_func *, const struct nvkm_vmm=
_func *,
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgk20a.c b/drive=
rs/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgk20a.c
> > index 16d7bf727292..999b953505b3 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgk20a.c
> > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgk20a.c
> > @@ -25,16 +25,6 @@
> >
> >  #include <core/memory.h>
> >
> > -int
> > -gk20a_vmm_aper(enum nvkm_memory_target target)
> > -{
> > -       switch (target) {
> > -       case NVKM_MEM_TARGET_NCOH: return 0;
> > -       default:
> > -               return -EINVAL;
> > -       }
> > -}
> > -
> >  int
> >  gk20a_vmm_valid(struct nvkm_vmm *vmm, void *argv, u32 argc,
> >                 struct nvkm_vmm_map *map)
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgm20b.c b/drive=
rs/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgm20b.c
> > index 7a6066d886cd..f5d7819c4a40 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgm20b.c
> > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgm20b.c
> > @@ -25,7 +25,7 @@ static const struct nvkm_vmm_func
> >  gm20b_vmm_17 =3D {
> >         .join =3D gm200_vmm_join,
> >         .part =3D gf100_vmm_part,
> > -       .aper =3D gk20a_vmm_aper,
> > +       .aper =3D gf100_vmm_aper,
> >         .valid =3D gk20a_vmm_valid,
> >         .flush =3D gf100_vmm_flush,
> >         .invalidate_pdb =3D gf100_vmm_invalidate_pdb,
> > @@ -41,7 +41,7 @@ static const struct nvkm_vmm_func
> >  gm20b_vmm_16 =3D {
> >         .join =3D gm200_vmm_join,
> >         .part =3D gf100_vmm_part,
> > -       .aper =3D gk20a_vmm_aper,
> > +       .aper =3D gf100_vmm_aper,
> >         .valid =3D gk20a_vmm_valid,
> >         .flush =3D gf100_vmm_flush,
> >         .invalidate_pdb =3D gf100_vmm_invalidate_pdb,
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp10b.c b/drive=
rs/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp10b.c
> > index 180c8f006e32..ffe84ea2f7d9 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp10b.c
> > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp10b.c
> > @@ -43,7 +43,7 @@ static const struct nvkm_vmm_func
> >  gp10b_vmm =3D {
> >         .join =3D gp100_vmm_join,
> >         .part =3D gf100_vmm_part,
> > -       .aper =3D gk20a_vmm_aper,
> > +       .aper =3D gf100_vmm_aper,
> >         .valid =3D gp10b_vmm_valid,
> >         .flush =3D gp100_vmm_flush,
> >         .mthd =3D gp100_vmm_mthd,
> > --
> > 2.23.0
> >
> > _______________________________________________
> > Nouveau mailing list
> > Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> > https://lists.freedesktop.org/mailman/listinfo/nouveau

--NU0Ex4SbNnrxsi6C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl2AoTsACgkQ3SOs138+
s6HzKQ/9EB5wLiorfO4HVVbB2tmuk2ROy4mZrh768Rlv4NB08ZJOhIBSray6eMvl
JFvyKXvfQiT2B4eFGlRqswnYiVZFm6QNFXpm/u/UtaKgygGLyIZ9OSxX/RFQK69p
lxcaP5b4pEi9T0KKboYRfiRfoZ/qtTg3NMy+pBSdQ4TVES47fZJTql+bDMIWb4A4
Cmf5fhmRkxN7YuPY0yTljS5e2yBTh2wGvRJxJNxhyp+fnUK737DbKeZ/sPC89bNY
pxdTGpGHyMp9/WCe2PFl3eVJKBJ9cZJT8AMLyQhC4qFD7qc2GxCpmJhxNQr2dmwA
WpI5rvlblZzDZrz9lxdkhrsmYb4Ck2Z9gbDHmefI6B0Kz6nysALPt6XviIh5VUqe
ilAXAFx6Euk28ecbepoIUQPtSYJXn2Wnz0o9gxB8QEMj/SfIhcPoAUjRvmkcfBYH
7LzSY2aNHLZYg2bl34KtbQBh4dWBSaTLam4M3An7MQJTJ9aQxZqZVk8l573i9TMa
N/NpMNwSCdJnHOR6DOkQ7pOLn96c6qKJSD3ejTgwEpOWqMrpXSUairNcZU3busKJ
m6N0t0ZmALrVXYsgB6MNtLdMqiTKqcbWDumMlvL4Mbw5Ag1KY5TKG5UEuNzbRuSc
C3d8kFhhqgpHRycoLcLvMMx560ByXhZKmirouDU7Ktexr4wOimg=
=Nq5T
-----END PGP SIGNATURE-----

--NU0Ex4SbNnrxsi6C--

--===============0145585315==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0145585315==--
