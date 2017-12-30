From: Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org>
Subject: Re: [PATCH v2] nv50/ir: Initialize all members of GCRA
	(trivial)
Date: Sat, 30 Dec 2017 16:03:27 +0100
Message-ID: <20171230150326.3qcmjqyxdwdediay@pmoreau.org>
References: <20171229212921.d76zrcj6p7vzc7yt@pmoreau.org>
 <20171230142156.4585-1-tobias.johannes.klausmann@mni.thm.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1840146440=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20171230142156.4585-1-tobias.johannes.klausmann-AqjdNwhu20eELgA04lAiVw@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Tobias Klausmann <tobias.johannes.klausmann-AqjdNwhu20eELgA04lAiVw@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1840146440==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="my2ychh4bo2ewqpy"
Content-Disposition: inline


--my2ychh4bo2ewqpy
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2017-12-30 =E2=80=94 15:21, Tobias Klausmann wrote:
> v2: use initialization list (Pierre)
>=20
> Signed-off-by: Tobias Klausmann <tobias.johannes.klausmann-AqjdNwhu20eELgA04lAiVw@public.gmane.org>
> Reviewed-by: Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org>
> ---
>  src/gallium/drivers/nouveau/codegen/nv50_ir_ra.cpp | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_ra.cpp b/src/gal=
lium/drivers/nouveau/codegen/nv50_ir_ra.cpp
> index 361918a161..a70a54f6b8 100644
> --- a/src/gallium/drivers/nouveau/codegen/nv50_ir_ra.cpp
> +++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_ra.cpp
> @@ -1144,7 +1144,9 @@ GCRA::RIG_Node::addRegPreference(RIG_Node *node)
>  GCRA::GCRA(Function *fn, SpillCodeInserter& spill) :
>     func(fn),
>     regs(fn->getProgram()->getTarget()),
> -   spill(spill)
> +   spill(spill),
> +   nodeCount(0),
> +   nodes(NULL)

The order in the member initialisation list should be the same as the order=
 in
which the attributes are declared within the class, so you should have:

   nodes(NULL)
   nodeCount(0),
   func(fn),
   regs(fn->getProgram()->getTarget()),
   spill(spill)

>  {
>     prog =3D func->getProgram();
> =20
> --=20
> 2.15.1
>=20

--my2ychh4bo2ewqpy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEYgBv5JnnDxeItcEHU3l4X80+KSQFAlpHqr4ACgkQU3l4X80+
KSQpGRAAh4H50V4bwrhYjm9XJSbKcVE5Y6YvpVGxFjAyQNTytXwzR2LC1svOBH0C
8NAIjvv4zmvRDVVbwHydVXPYCcLsNDYdTQQOG1e47hjigKqU2Ghhdv2g8NsCoMLL
mWMr1F3R8gkOOrpVydnZVIWgJBIqQhjEKkYny85839+EX6g/+j8gWMp49DaLJxcP
yeVkahbJLtSiDmAKbL3Kk1ZXDwRtW362VVfCZdfSM5r54m7uctDpfDr7KIYYGrST
PZH+kG5Wb0Nm5X5F6C8QLDk8GSzCv3zS+hQQaIcJSOwKaxXRMnmmKrKvHNc9FPD5
VLbcdnZ/QZxrY0OScnOMx9GLL70lWn+rnXa49EmKPKDUaFSRnpo34rr9DZFx1u7o
zo83S60qtN7r68W9kTk/oguZYfQqEwIINsh6yJW5alrhz/xluDITgyreUwGfW3n+
gAvLzewmeUZdfUixx+vY2JyPH0IPAHZj8z9Tl/NuJFm/CZfHc3lvKW3pZpV9eAv6
eOx5L2eYMBy9q0tp/8zT9AyxJC+GyrKK7UakrqR5xbF7Lx0e30ec2xvYhE7jfGKD
RZWwMwWs36iE7ckQc2OP9KkWHVuBXpyUesDszcLP44RY9xhVLZiFcYuk1Qe6cnzY
TKSP5FO/oqcDW0QxOQaVL5x+it131qoeop7Q3N8jKEQUiU61Lgw=
=xk8e
-----END PGP SIGNATURE-----

--my2ychh4bo2ewqpy--

--===============1840146440==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1840146440==--
