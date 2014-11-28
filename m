From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Mesa-dev] [RFC] tegra: Initial support
Date: Fri, 28 Nov 2014 09:46:06 +0100
Message-ID: <20141128084605.GA5978@ulmo>
References: <1417106361-705-1-git-send-email-thierry.reding@gmail.com>
 <CAF6AEGuf9d_U7NpS2z-4_UTk=9cY3HX+FYpS-JYv_FagZBVG5A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1748550693=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAF6AEGuf9d_U7NpS2z-4_UTk=9cY3HX+FYpS-JYv_FagZBVG5A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org


--===============1748550693==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tKW2IUtsqtDRztdT"
Content-Disposition: inline


--tKW2IUtsqtDRztdT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 27, 2014 at 11:51:08AM -0500, Rob Clark wrote:
> On Thu, Nov 27, 2014 at 11:39 AM, Thierry Reding
> <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > Tegra K1 and later use a GPU that can be driven by the Nouveau driver.
> > But the GPU is a pure render node and has no display engine, hence the
> > scanout needs to happen on the Tegra display hardware. The GPU and the
> > display engine each have a separate DRM device node exposed by the
> > kernel.
> >
> > To make the setup appear as a single device, this driver instantiates
> > a Nouveau screen with each instance of a Tegra screen and forwards GPU
> > requests to the Nouveau screen. For purposes of scanout it will import
> > buffers created on the GPU into the display driver. Handles that
> > userspace requests are those of the display driver so that they can be
> > used to create framebuffers.
> >
> > This has been tested with some GBM test programs, as well as kmscube and
> > weston. All of those run without modifications, but I'm sure there is a
> > lot that can be improved.
> >
> > TODO:
> > - use Nouveau headers to get at the prototype for creating a screen
> > - implement enough support to seamlessly integrate with X
> > - refactor some of the code to be reusable by other drivers
>=20
> I haven't looked too carefully at the implementation yet, but couldn't
> you just put in src/gallium/drivers/shim ?  I guess you'd just want a
> small if/else ladder where you create the *actual* screen, to create a
> nouveau screen for tegra, an etnaviv screen for imx, armada, etc..?

That's not how Mesa's loader works. Typically only a file descriptor is
passed in and helpers determine a name for the driver to load, then the
DRI code will load <name>_dri.so. I don't see how this could be made to
work with a single Gallium driver.

There's also the fact that these drivers need to become very HW-specific
at some point, so sharing a single driver will likely just cause an
explosion of conditionals to special-case for each and everyone of the
drivers.

Lastly, Tegra is also somewhat special in this regard because earlier
generations did have a GPU that's controlled via the same DRM device as
the display part. If ever a Mesa driver shows up for that older GPU we
are going to have a conflict between the shim and the Tegra driver that
isn't going to be easy to untangle. With a separate driver we can use
SoC-specific knowledge to determine whether the driver is running on an
old SoC generation or Tegra K1 and later.

Thierry

--tKW2IUtsqtDRztdT
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUeDZNAAoJEN0jrNd/PrOhMZcQAK9RW6aW99eSIvWxWuYzayA/
05runJnkjetWufDxQTo9ORq4kV3ON7JpZyKcfBGYBoS2PUNvk8bTIykRvKmXrwik
7DmkDwAl+NNs782IACmknpvVg9GIUUDf+WmatvQUmNyqughWrgoWaNE9wLOJR5Pf
zcoBx3HbgqEyUcs4oReE8MxQuBJ0RUu2GnKXm18ShQkVv3LGw1KnUaMtdq2nn2X9
N1RcE5yMTkTvhjMbRINdnBPQnHrsVKFRPbCSPCVxYlrFRjTc33DWzU/aQ7UKnwSs
Erf2jQA2lpEAcCnRgtTQ0CiUYH+jZUfz+VXpV5GkmCK8JQZGWgxCE7L+jUSASSa1
JEMHHM1D9kkiUIqMMHX04ERFWm4Y2ErEmNvkc4dGX2cK8s6vETVTm/j/HCWTnF/O
xPFua4fR3PlpPMjP5St6Jq5DLuoQ27+T2Y0V8wJaDidPK+73os1qv0ETwhwJhaLZ
9NUkU68Y6f9Yrcq7CdgrB1OtgZJ5viqhRxEOF+j2Ag+RrQLgkLzwO/NB2+POIKs7
9KPUUo0tpViHLv8jeNCwkUMKSlsGEgvlB/92/+tQKT4We6mTXyRGclNS7oquuYup
zwvi0Jy/ehH5V5My/TEISGsPQSMcZJa2U7r0Ft9PhRUwH3RmPHN9y8N5cyY299MX
qAAQvu0/mNLCpm3GL2Iy
=HeQp
-----END PGP SIGNATURE-----

--tKW2IUtsqtDRztdT--

--===============1748550693==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1748550693==--
