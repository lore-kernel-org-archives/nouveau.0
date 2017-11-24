From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] pci: do a msi rearm on init
Date: Fri, 24 Nov 2017 15:02:50 +0100
Message-ID: <20171124140250.GD15999@ulmo>
References: <20171124025626.14037-1-kherbst@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1573239932=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20171124025626.14037-1-kherbst-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
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
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1573239932==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="oj4kGyHlBMXGt3Le"
Content-Disposition: inline


--oj4kGyHlBMXGt3Le
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 24, 2017 at 03:56:26AM +0100, Karol Herbst wrote:
> On my GP107 when I load nouveau after unloading it, for some reason the
> GPU stopped sending or the CPU stopped receiving interrupts if MSI was
> enabled.

I suppose this could happen if the GPU raises an interrupt after the
driver's already called free_irq() on it, and hence the driver can't
rearm itself in the interrupt handler.

This possibly points to a bug somewhere (the GPU should be completely
idle by the time free_irq() is called), but this seems like a valid
thing to do at initialization in any case to avoid relying on the prior
owner of the device to always behave properly.

> Doing a rearm once before getting any interrupts fixes this.
>=20
> Signed-off-by: Karol Herbst <kherbst-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> ---
>  drm/nouveau/nvkm/subdev/pci/base.c | 4 ++++
>  1 file changed, 4 insertions(+)

Reviewed-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--oj4kGyHlBMXGt3Le
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAloYJogACgkQ3SOs138+
s6EevA/+J8Eqm9wBeYUgqCIjf/UrBMTxFMY4ggThVPKLSIW2iPlKd9auuAJUjMXp
ow0EerTvBuuzbC2K/Uu3dEZtpCKryr0HXVi0pRW0QlJKD3Yn3nuPBZkZdBaR0iiz
Mxhk3cukfWV34KKRI4gkuDXZWzWj9id6d+zWIvizjU25S/CuJP5rdUIYJoNF0Pli
4uhLf1DSBvs+3yaukyepuuz/FVi3+whJxz7DWYNPydwdEu+/TVwW7Bld/GZ5VtJN
VgHjodL3kZdhNvnpZARQrpqNHbFzEyrOb+1qIRUqhhD2NP1vk2trkeqDy64jrWaM
scDW4RNPifERlk2eWOsbGT42EoprZwyTjUQSp49NVCox816XHrgB4W3n04lTAKCf
1E9TsOqflbHy8t17FwS3f1nrso1ILJ0MrRZSonzO4Bxj8g07hPpxm6IIgPM9RFC7
jnxJlS6/YdJZcZv7HRzXw5XZlgU6mAIl11cDuJp0L7MjH7XdWXFkdm/6MUkFAVBU
Q2tvhycyfTI4FT+CRYQMS62Lb8H6eWGhoFf0j4iDRdam19ST8D81zXM4VPNmOnph
6jLMBWNjNBwvOC3j6vc5xmq/AyqyhCNytlv1ENV/FSxUnvJ86VxaN/qvME2GVzi8
b/Q1AoUeHDdBJ8OPHz0IoWCJW7Oar4oePcitnMoCcnFXv8O3CuA=
=SF0D
-----END PGP SIGNATURE-----

--oj4kGyHlBMXGt3Le--

--===============1573239932==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1573239932==--
