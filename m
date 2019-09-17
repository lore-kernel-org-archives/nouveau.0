From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [Nouveau] [PATCH 2/6] drm/nouveau: fault: Widen engine field
Date: Tue, 17 Sep 2019 11:05:50 +0200
Message-ID: <20190917090550.GE17854@ulmo>
References: <20190916151757.10953-1-thierry.reding@gmail.com>
 <20190916151757.10953-3-thierry.reding@gmail.com>
 <CACAvsv5VKMW8fuMEj=XYAezpKVVxqem-MvKFOwDMMh2dqjFRLA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2137657746=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CACAvsv5VKMW8fuMEj=XYAezpKVVxqem-MvKFOwDMMh2dqjFRLA@mail.gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Ben Skeggs <skeggsb@gmail.com>
Cc: ML nouveau <nouveau@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>, ML dri-devel <dri-devel@lists.freedesktop.org>
List-Id: nouveau.vger.kernel.org


--===============2137657746==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="bi5JUZtvcfApsciF"
Content-Disposition: inline


--bi5JUZtvcfApsciF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 17, 2019 at 01:48:20PM +1000, Ben Skeggs wrote:
> On Tue, 17 Sep 2019 at 01:18, Thierry Reding <thierry.reding@gmail.com> wrote:
> >
> > From: Thierry Reding <treding@nvidia.com>
> >
> > The engine field in the FIFO fault information registers is actually 9
> > bits wide.
> Looks like this is true for fault buffer parsing too.

Yes, I'll add that in v2.

Thierry

> >
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >  drivers/gpu/drm/nouveau/nvkm/subdev/fault/gv100.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fault/gv100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/fault/gv100.c
> > index b5e32295237b..28306c5f6651 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/fault/gv100.c
> > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fault/gv100.c
> > @@ -137,8 +137,8 @@ gv100_fault_intr_fault(struct nvkm_fault *fault)
> >         info.addr = ((u64)addrhi << 32) | addrlo;
> >         info.inst = ((u64)insthi << 32) | (info0 & 0xfffff000);
> >         info.time = 0;
> > -       info.engine = (info0 & 0x000000ff);
> >         info.aperture = (info0 & 0x00000c00) >> 10;
> > +       info.engine = (info0 & 0x000001ff);
> >         info.valid  = (info1 & 0x80000000) >> 31;
> >         info.gpc    = (info1 & 0x1f000000) >> 24;
> >         info.hub    = (info1 & 0x00100000) >> 20;
> > --
> > 2.23.0
> >
> > _______________________________________________
> > Nouveau mailing list
> > Nouveau@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/nouveau

--bi5JUZtvcfApsciF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl2Aoe4ACgkQ3SOs138+
s6HOPA//Z5IIjQcIPGo95H3VGupBNJ175KCLQzB1kCvUz91KtbvVnZbj3Zsre1t4
xjIJo4t1wY9MabnAtNyMG0DCwmJojxxqdkV++GeUFrZy17x0RdGoY3tujEQoWSM0
DuL/xhvtHINMuinGhBHWhCC3uRHC9LqDXpeO/E+IX36ywUO8wrSC21k6iVx6PhEX
oCNqxKfP0BOo7X3vPbwYep6fIjnht7iahhYdeCfJqx97N7tg0shKaarmV7SAVSz3
oerrCafUxzJmfZKNxdRwifXMSLx7L2PnRBn8+R/GXupzgCNDjMucJOLQsddRjaRl
9Y33QTnk4Y9kmZGfFHeA9WAhhgbVTiFlnZ6NbdRc8sqT0CNKuNDxa+71l8p6CAkT
Vn3ZHEpdzfTK20714B4CFNWYJEjtHrm5qj02WMKltaymYD2BG3LrrBgijlcL/gKU
TaOkPs6GxXn2Ym46iSFesdtNZWp2uxQR8zDD5U/undPghVJhsRL6YfoR//JD2jZN
RyaDf51eMYg9bfZT2ms+fRHmcWH9I1/+s0QsTElLmEM/UE5GQx5edB8pffRActyk
siuBpVq9JA2OC5zAhlHlTzgnFoYWXd999mLu7hHoJsMSCtdldJg1XrNa/N2Sm6uB
sRq6+Jqlnmc7xyzoSmSrDRX0qbnQUnQIdmhT1k17PP54TqG5DOo=
=4G6L
-----END PGP SIGNATURE-----

--bi5JUZtvcfApsciF--

--===============2137657746==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2137657746==--
