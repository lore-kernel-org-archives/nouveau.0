From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] pci: do a msi rearm on init
Date: Fri, 24 Nov 2017 15:23:28 +0100
Message-ID: <20171124142328.GA19273@ulmo>
References: <20171124025626.14037-1-kherbst@redhat.com>
 <20171124140250.GD15999@ulmo>
 <CACO55tt7xEkxfYHvw=gDRQgULvYr1dCLEUmOztKfXHyBOvUdAw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0533218040=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CACO55tt7xEkxfYHvw=gDRQgULvYr1dCLEUmOztKfXHyBOvUdAw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Karol Herbst <kherbst-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org


--===============0533218040==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="FL5UXtIhxfXey3p5"
Content-Disposition: inline


--FL5UXtIhxfXey3p5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 24, 2017 at 03:08:25PM +0100, Karol Herbst wrote:
> On Fri, Nov 24, 2017 at 3:02 PM, Thierry Reding
> <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > On Fri, Nov 24, 2017 at 03:56:26AM +0100, Karol Herbst wrote:
> >> On my GP107 when I load nouveau after unloading it, for some reason the
> >> GPU stopped sending or the CPU stopped receiving interrupts if MSI was
> >> enabled.
> >
> > I suppose this could happen if the GPU raises an interrupt after the
> > driver's already called free_irq() on it, and hence the driver can't
> > rearm itself in the interrupt handler.
> >
> > This possibly points to a bug somewhere (the GPU should be completely
> > idle by the time free_irq() is called), but this seems like a valid
> > thing to do at initialization in any case to avoid relying on the prior
> > owner of the device to always behave properly.
> >
>=20
> Yeah, this makes sense. But what I am wondering about is, why this
> isn't a bigger problem or maybe this is just due to those changes in
> the Pascal interrupt handler and this is a Pascal only problem?

Yeah, this could be some kind of race that's only triggering on Pascal.

Comparing with the nvgpu driver it seems like the MSI interrupt should
be rearmed only after all interrupts have been processed, while Nouveau
currently rearms before processing interrupts (though after masking the
interrupts). I'm not very familiar with all of this, but perhaps Pascal
has some interrupts that Nouveau doesn't mask and therefore might race.

Perhaps something like this would help:

--- >8 ---
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/pci/base.c b/drivers/gpu/d=
rm/nouveau/nvkm/subdev/pci/base.c
index b1b1f3626b96..0b3b802c26df 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/pci/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/pci/base.c
@@ -72,10 +72,10 @@ nvkm_pci_intr(int irq, void *arg)
        struct nvkm_device *device =3D pci->subdev.device;
        bool handled =3D false;
        nvkm_mc_intr_unarm(device);
-       if (pci->msi)
-               pci->func->msi_rearm(pci);
        nvkm_mc_intr(device, &handled);
        nvkm_mc_intr_rearm(device);
+       if (pci->msi)
+               pci->func->msi_rearm(pci);
        return handled ? IRQ_HANDLED : IRQ_NONE;
 }

--- >8 ---

> Anyway, the Nvidia driver seems to do it once on loading time as well,
> so I was quite sure we could simply do it this way and be sure that we
> are able to use the GPU from any state.

I think it's totally fine to apply as-is and leave it to further
investigation what Nouveau needs to do to properly uninitialize the
device. Like you said it can always happen that somebody else leaves
the GPU in some undefined state, in which case it's good to always
do this at initialization.

Thierry

--FL5UXtIhxfXey3p5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAloYK14ACgkQ3SOs138+
s6GyXQ//QtSHtrtkENSJGaTIIr8hYoiVIabuOc2ECsRHYp+DPsWmFPVsVYrsQsJV
WgN/+UAgftbja2+m9U+5vmD+7kWa5zShpIdbdqvaoYpA7mOLvhz7CG9MdBo68dCm
3SUconMM3yn6emjnrsyPUTwG35dsfK+brlv2/WcGptUku+NKEnFwAJnZ8YxjSiZO
KmWqHMwrd/Ol8pOMr/nWvr6udx8JyOX07bOG7bg9jihCm505TFr1kXyQ43YC+n7V
RuGh8mDqPmSn2+X9YYyUqABQOJx3vW2eKm2LmkfNatGmCnj8kCSuNk/G164PrX5T
CVZjlrmthk3nY8/DytbsmKpQPCXxPE5Kv0/haEfJGhahapsfi0xq7ALXFQ0BXnEc
McuKUr/MRaWPpEV4oVIgndumPwagksCra1gQKMOiqoNsLH9sUuQSkhnnedCu4dzy
/pygPM+F/U8cfl3TI1kxhMa2ZWXBU6owu7aZCsbJ6AfX1p1JWYkSOFSb1vqfPbtm
Gy8SJLLmesUDBp7KAqD+ZBei/Z4sd7cv8wU8EmevXOLCjsmO6Uut2pupiN//xnx6
ovZZ9mfPhHNLpCaxA9tNXfgH0pkqX6GcUiqOhh80A+HeXr2d0Ml36Qj4i9rqiAi3
96ahMbba22C20QL/hDfjvx7MBAnvM0BIyCjSKcteTZCnBVEuNkc=
=VoTm
-----END PGP SIGNATURE-----

--FL5UXtIhxfXey3p5--

--===============0533218040==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0533218040==--
