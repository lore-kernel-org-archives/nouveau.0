From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC] tegra: Initial support
Date: Fri, 28 Nov 2014 09:48:21 +0100
Message-ID: <20141128084819.GB5978@ulmo>
References: <1417106361-705-1-git-send-email-thierry.reding@gmail.com>
 <547804B0.4020603@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1566390195=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <547804B0.4020603-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1566390195==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jq0ap7NbKX2Kqbes"
Content-Disposition: inline


--jq0ap7NbKX2Kqbes
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 28, 2014 at 02:14:24PM +0900, Alexandre Courbot wrote:
> On 11/28/2014 01:39 AM, Thierry Reding wrote:
> >Tegra K1 and later use a GPU that can be driven by the Nouveau driver.
> >But the GPU is a pure render node and has no display engine, hence the
> >scanout needs to happen on the Tegra display hardware. The GPU and the
> >display engine each have a separate DRM device node exposed by the
> >kernel.
> >
> >To make the setup appear as a single device, this driver instantiates
> >a Nouveau screen with each instance of a Tegra screen and forwards GPU
> >requests to the Nouveau screen. For purposes of scanout it will import
> >buffers created on the GPU into the display driver. Handles that
> >userspace requests are those of the display driver so that they can be
> >used to create framebuffers.
> >
> >This has been tested with some GBM test programs, as well as kmscube and
> >weston. All of those run without modifications, but I'm sure there is a
> >lot that can be improved.
>=20
> Tested with kmscube and Weston and I can confirm this works. However, EGL
> clients inside Weston have their window filled with garbage (they seem to
> run fine otherwise). Do you also experience this?

To be honest, that wasn't part of my set of test cases. I had assumed
that since Weston could composite buffers into a final scan out buffer
everything else would just work as well. Do you have any particular
demos that aren't working?

Thierry

--jq0ap7NbKX2Kqbes
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUeDbTAAoJEN0jrNd/PrOhbWsP/ipCOAnu02bn9Gp1ihLKDDh1
ZtJJmUVa2oLtl/3zR+H8zX8XWOCiVfbKM0CJD8WdjoDFP/cs/5MdgAm5WB7PZc3B
vPjSEoK6+bi0CenIp1IivCFWPKW4G5N65JB3WKvYdg9n1dMu9PvqAHKGvq/+Tfqy
eCtt9zVU81H81vMmhJ2hU86hCFaguZLpmMdNuThJmoIPo3UwfnKioqFcNsEWBlaL
pZpABJXBdxvkKAbY82Aogiiv4EiqySM7E0w/z8HA6kO4YB8URsIgPHMSoEv634mT
ZxfbLWo0qdLIT7hxGWUoElHirKV2MKcYuetyv8+EU5h75AOA0KavqeQq/UwKESv0
fPHGLaREhNdy0iLheF0jG07JWLkfE2CDQwkBP+Muwj7hYkIo9J3+KcXcAzwvdEl9
JsZpIjsuTcbDlpERFGeoH4So3G8diU+bDQeQ8UdGG9IKfqS+3XQ3TNWJtDEUsmVo
Qpygy4unlgjskkfOYbTJZli76Lb2qASiz5Eq8ibElBDm4V8LUKC+hNWcCELGanLV
76XjKA/1/GrDz6qhe1ZsDr1EZKH+MlBix1+WnQKphmkTGlizGDRyBvkUMeOBw/85
Av/Am4wKXV7SH1Y9BNcov7pjvrTGA9MhszlaujaqjdKkp5S1PAYnAtxbkAqoDqWV
i+Jro3RevnU8Ld/ACbsG
=2Xem
-----END PGP SIGNATURE-----

--jq0ap7NbKX2Kqbes--

--===============1566390195==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1566390195==--
