From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 0/2] drm/nouveau: Two more fixes
Date: Tue, 17 Sep 2019 11:07:23 +0200
Message-ID: <20190917090723.GF17854@ulmo>
References: <20190916143606.9272-1-thierry.reding@gmail.com>
 <CACAvsv6jXCLm-3Y1yOAUpHk6pXFUN0_hSrUQeMrmqPc1hfpHAQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1671813002=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CACAvsv6jXCLm-3Y1yOAUpHk6pXFUN0_hSrUQeMrmqPc1hfpHAQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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


--===============1671813002==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/aVve/J9H4Wl5yVO"
Content-Disposition: inline


--/aVve/J9H4Wl5yVO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 17, 2019 at 04:07:54PM +1000, Ben Skeggs wrote:
> On Tue, 17 Sep 2019 at 00:36, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> w=
rote:
> >
> > From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >
> > Hi Ben,
> >
> > I messed up the ordering of patches in my tree a bit, so these two fixes
> > got separated from the others. I don't consider these particularily
> > urgent because the crash that the first one fixes only happens on gp10b
> > which we don't enable by default yet and the second patch fixes a crash
> > that only happens on module unload (or driver unbind, more accurately),
> > which isn't a terribly common thing to do.
> >
> > I'll be sending out fixes shortly to make the GP10B work more properly
> > on a wider range of Jetson TX2 devices and enable it by default.
> >
> > One thing to mention is that I'm not exactly sure if the first patch is
> > the right thing to do. I haven't seen any issues after that change, but
> > I'm also not exactly sure I understand what BAR2 is used for, so I don't
> > know if I would've even covered those code paths (other than the one
> > causing the crash at probe time) in my tests.
> BAR2 on dGPUs is used to map kernel-level GPU objects in VRAM so they
> can be accessed by the driver.  It's pretty much a smaller version of
> BAR1, but intended for a different purpose.
>=20
> On dGPUs, there's a couple of places (fault buffer address, and fault
> method buffer on volta) where the GPU wants PRI regs to be poked with
> an offset within BAR2 rather than an aperture+offset combination.  I'm
> not 100% sure what Tegra parts do here, but presumably if it's working
> for you, they're happy to just accept a system memory address instead.
>=20
> I guess this would be the right thing to do here in that situation.
> The more obvious (from a "reading the code" POV) thing to do would be
> to write Tegra-specific versions of the functions that use
> nvkm_memory_bar2() to perform this mapping, and use nvkm_memory_addr()
> instead but I'm not sure if we need/want to go to that effort.  It's
> conceivable it could be required at some point.

Yeah, that sounds slightly more correct. I'll look into it and see if I
can come up with something.

Thierry

>=20
> Ben.
>=20
> >
> > It'd be great to get Lyude's feedback on the second patch, since that
> > call to pci_disable_device() was rather oddly placed and I'm not sure if
> > that was essential for things to work or whether the slightly different
> > point in time where it's called after this patch is also okay. It looks
> > to me like it should work fine, but I don't currently have a way to test
> > this on desktop GPUs.
> >
> > Thierry
> >
> > Thierry Reding (2):
> >   drm/nouveau: tegra: Fix NULL pointer dereference
> >   drm/nouveau: tegra: Do not try to disable PCI device
> >
> >  drivers/gpu/drm/nouveau/nouveau_drm.c         |  3 +-
> >  .../drm/nouveau/nvkm/subdev/instmem/gk20a.c   | 30 +++++++++++++++++++
> >  2 files changed, 31 insertions(+), 2 deletions(-)
> >
> > --
> > 2.23.0
> >
> > _______________________________________________
> > Nouveau mailing list
> > Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> > https://lists.freedesktop.org/mailman/listinfo/nouveau

--/aVve/J9H4Wl5yVO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl2AoksACgkQ3SOs138+
s6Helw/+KI0FKZ1U90BhXdwqJ1GP1Fqq5tl1Z3nPoXwObI1A5ZXjZnTp+v3kL9Pt
i0wQXX83nfyzrHk5H0lHeJlq6rFmMdclUPDw6/HwM///C13Nnh5uIXPSUSBExTDv
B534yrqaNJiazOamS9TsKJo8ptDZzddax2wHjbqBdlp1Ck6NTbOkFGlHMtTerhhl
Lo4mEydA+w4RkX2bB2CEQaUD0g2HwUI+hkNXmi+5vZk2ZtbTx9leBWRR2kXqgP4I
PygMUE65qwth19oUuxsWgLtyVyV2hRUjsxYLw/dE90qyCREvtxIw2RcF9i2lRR/8
pxx3shMMPqHoJIC3A3nsIGELQJWkEFb0hrkQ81MlPwS9APJjKClSi2tP2HU6EFV0
IWmF6zHaA10tLalWaQlX7dIiXx6otL5rdf+vbQ7HUZdx3LMxnvLBqrJoIMoDWROa
8QNiiEb72Zem+LRvpCRB7cxmLW5j5ZvBdMryu+t8FuFEGIK1zDTIyhpFX5wfRdYK
nsT7kTVTcyR8WCLPcW3EV0eg6kchSiZCnLAAvblVV0Nm1UKNw0LNVlVe2IeaNBl8
PyETTORh9uKu22FI/hdcN787lUzH6l4CDQ7Xer0VHp4GHMDEVIqb05q+JDHk0Zo+
x3/KYLuLgeMGJ1aGgFezg1bl82y7QqGd64eRCf62Q1sZSlF8BuM=
=HuNe
-----END PGP SIGNATURE-----

--/aVve/J9H4Wl5yVO--

--===============1671813002==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1671813002==--
