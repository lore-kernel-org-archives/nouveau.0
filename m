From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/6] drm/nouveau: fault: Store aperture in
 fault information
Date: Tue, 17 Sep 2019 11:05:28 +0200
Message-ID: <20190917090528.GD17854@ulmo>
References: <20190916151757.10953-1-thierry.reding@gmail.com>
 <20190916151757.10953-2-thierry.reding@gmail.com>
 <CACAvsv70b1-LJoaP1ZL2hvy9xMcO1WXqh0ibGzNfpB81ybgrTg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0578469214=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CACAvsv70b1-LJoaP1ZL2hvy9xMcO1WXqh0ibGzNfpB81ybgrTg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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


--===============0578469214==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="M38YqGLZlgb6RLPS"
Content-Disposition: inline


--M38YqGLZlgb6RLPS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 17, 2019 at 01:47:25PM +1000, Ben Skeggs wrote:
> On Tue, 17 Sep 2019 at 01:18, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> w=
rote:
> >
> > From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >
> > The fault information register contains data about the aperture that
> > caused the failure. This can be useful in debugging aperture related
> > programming bugs.
> Should this be parsed for fault buffer entries too?

Yes, it probably should. Will fix that in v2.

Thanks,
Thierry

>=20
> >
> > Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > ---
> >  drivers/gpu/drm/nouveau/include/nvkm/subdev/fault.h | 1 +
> >  drivers/gpu/drm/nouveau/nvkm/engine/fifo/gk104.c    | 3 ++-
> >  drivers/gpu/drm/nouveau/nvkm/subdev/fault/gv100.c   | 1 +
> >  3 files changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/fault.h b/driv=
ers/gpu/drm/nouveau/include/nvkm/subdev/fault.h
> > index 97322f95b3ee..1cc862bc1122 100644
> > --- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/fault.h
> > +++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/fault.h
> > @@ -21,6 +21,7 @@ struct nvkm_fault_data {
> >         u64  addr;
> >         u64  inst;
> >         u64  time;
> > +       u8 aperture;
> >         u8 engine;
> >         u8  valid;
> >         u8    gpc;
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/gk104.c b/drivers=
/gpu/drm/nouveau/nvkm/engine/fifo/gk104.c
> > index 5d4b695cab8e..81cbe1cc4804 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/gk104.c
> > +++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/gk104.c
> > @@ -519,9 +519,10 @@ gk104_fifo_fault(struct nvkm_fifo *base, struct nv=
km_fault_data *info)
> >         chan =3D nvkm_fifo_chan_inst_locked(&fifo->base, info->inst);
> >
> >         nvkm_error(subdev,
> > -                  "fault %02x [%s] at %016llx engine %02x [%s] client =
%02x "
> > +                  "fault %02x [%s] at %016llx aperture %02x engine %02=
x [%s] client %02x "
> >                    "[%s%s] reason %02x [%s] on channel %d [%010llx %s]\=
n",
> >                    info->access, ea ? ea->name : "", info->addr,
> > +                  info->aperture,
> >                    info->engine, ee ? ee->name : en,
> >                    info->client, ct, ec ? ec->name : "",
> >                    info->reason, er ? er->name : "", chan ? chan->chid =
: -1,
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fault/gv100.c b/driver=
s/gpu/drm/nouveau/nvkm/subdev/fault/gv100.c
> > index 6747f09c2dc3..b5e32295237b 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/fault/gv100.c
> > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fault/gv100.c
> > @@ -138,6 +138,7 @@ gv100_fault_intr_fault(struct nvkm_fault *fault)
> >         info.inst =3D ((u64)insthi << 32) | (info0 & 0xfffff000);
> >         info.time =3D 0;
> >         info.engine =3D (info0 & 0x000000ff);
> > +       info.aperture =3D (info0 & 0x00000c00) >> 10;
> >         info.valid  =3D (info1 & 0x80000000) >> 31;
> >         info.gpc    =3D (info1 & 0x1f000000) >> 24;
> >         info.hub    =3D (info1 & 0x00100000) >> 20;
> > --
> > 2.23.0
> >
> > _______________________________________________
> > Nouveau mailing list
> > Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> > https://lists.freedesktop.org/mailman/listinfo/nouveau

--M38YqGLZlgb6RLPS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl2AodcACgkQ3SOs138+
s6Gi6RAAjv3ak2g6rrygLQCWZqJYh/xSmaoIPpfTUspQy4B1PSiTFy6G/3KCbvgZ
N+haXGrqMewbmD9gUk22Ltz54nkZIPeXUU+2DWbrJ/3kkV/6qbXs4RVy3nxgHYDT
h4ORGrqF5NkQDHm2kLGptzPG5wfn1C//pjRKB7SY94zCmytL2wA5l9swT6A91qjs
9wvAI9TM72ajzF3b4qz52shc2Ut978nJ1BLhiJN4IdXxwDBYZZlRqUWK3mlTXLRY
4/tN+tsfK2lFBvwStRQE7YfMuV7hHen5F4Cm038SJJOZzBO6nvvkyG65VmMmltPw
+eNhrwsuMcDKuAVPO4T6CIJveCo4VQG8AEKOlSdaFe4vzemZEO17hx+za/7TxqEy
UfRsRdBQwPZrQIgNPhxIF+Z59YnclETEDFyhF0KhrLDrmN5y7uRDnewli7YaewL1
wn9HRMHfmyyRE6ojp696EVjDIOPnbQntMLXJya+CJrWN8g89cx2GgdO/oQP51pOB
csTw0rGg4lZUceIG2IUOrPDMyfOk+azNmgQvEC56OzlHdVvdDGWNQGVTjpupWUzK
a+3+L5+8c3txSxQ0v9H5vJI62GxiUZ8g0Z+YbUJRZkX5EMeCR3YV3ITQyzXuXM3P
aBSAtXuHtTxLo9l8bqZIIOeU1aZpvuhHZn6Bdx0zt5FlRUZQwFM=
=6oyz
-----END PGP SIGNATURE-----

--M38YqGLZlgb6RLPS--

--===============0578469214==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0578469214==--
