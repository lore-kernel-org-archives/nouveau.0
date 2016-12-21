From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] drm/nouveau/dma: use rb_entry()
Date: Thu, 22 Dec 2016 09:22:14 +1000
Message-ID: <f5c3fb4b-ba2a-daab-9654-57ca4c35ca49@gmail.com>
References: <ddabc96c798df194791134d8e070d728e2a7b59f.1482203698.git.geliangtang@gmail.com>
 <5a188bc5a22daa80cf7a43dc75003b31f9e3abcd.1482203355.git.geliangtang@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1936822712=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <5a188bc5a22daa80cf7a43dc75003b31f9e3abcd.1482203355.git.geliangtang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Geliang Tang <geliangtang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1936822712==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="OF4lAQs4q55L4kxd34GGSipoiU735nJuS"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--OF4lAQs4q55L4kxd34GGSipoiU735nJuS
Content-Type: multipart/mixed; boundary="qBavcfdSTqtnxkFriErKQ2Eenvm4DnwSF"
From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
To: Geliang Tang <geliangtang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>,
 David Airlie <airlied-cv59FeDIM0c@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org,
 nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Message-ID: <f5c3fb4b-ba2a-daab-9654-57ca4c35ca49-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Nouveau] [PATCH] drm/nouveau/dma: use rb_entry()
References: <ddabc96c798df194791134d8e070d728e2a7b59f.1482203698.git.geliangtang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
 <5a188bc5a22daa80cf7a43dc75003b31f9e3abcd.1482203355.git.geliangtang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
In-Reply-To: <5a188bc5a22daa80cf7a43dc75003b31f9e3abcd.1482203355.git.geliangtang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

--qBavcfdSTqtnxkFriErKQ2Eenvm4DnwSF
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 12/21/2016 12:02 AM, Geliang Tang wrote:
> To make the code clearer, use rb_entry() instead of container_of() to
> deal with rbtree.
Thanks, I've grabbed the patch.

Ben.

>=20
> Signed-off-by: Geliang Tang <geliangtang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/gpu/drm/nouveau/nvkm/engine/dma/base.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/dma/base.c b/drivers/g=
pu/drm/nouveau/nvkm/engine/dma/base.c
> index f11ebdd..4655d17 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/dma/base.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/dma/base.c
> @@ -34,7 +34,7 @@ nvkm_dma_search(struct nvkm_dma *dma, struct nvkm_cli=
ent *client, u64 object)
>  	struct rb_node *node =3D client->dmaroot.rb_node;
>  	while (node) {
>  		struct nvkm_dmaobj *dmaobj =3D
> -			container_of(node, typeof(*dmaobj), rb);
> +			rb_entry(node, typeof(*dmaobj), rb);
>  		if (object < dmaobj->handle)
>  			node =3D node->rb_left;
>  		else
> @@ -67,7 +67,7 @@ nvkm_dma_oclass_new(struct nvkm_device *device,
>  	dmaobj->handle =3D oclass->object;
> =20
>  	while (*ptr) {
> -		struct nvkm_dmaobj *obj =3D container_of(*ptr, typeof(*obj), rb);
> +		struct nvkm_dmaobj *obj =3D rb_entry(*ptr, typeof(*obj), rb);
>  		parent =3D *ptr;
>  		if (dmaobj->handle < obj->handle)
>  			ptr =3D &parent->rb_left;
>=20


--qBavcfdSTqtnxkFriErKQ2Eenvm4DnwSF--

--OF4lAQs4q55L4kxd34GGSipoiU735nJuS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEETp/uv2nr9kIVth0/dgucYlCSkfsFAlhbDqYACgkQdgucYlCS
kft7Tg/9FxccX2RWfz94zgsRfyOZPYfvqLxMgSYB2CbkpcP3tWCYuSeGMgPmM+v7
8LfxYS1I3CF5RNKGfKzT8mcurTVqyn5N4wniLe58IIShXWzARw+vv1EOSHe+oSMY
KLJxSiGBuTGfIWtWaIlphViVUlVJoGYEu6wEODuAdMy0z+JH/QjwhgQ9oZYN4dGZ
qvrD/wl+9Cua4kVl8CTa4ECSrI96Gtp/H6SWFB/lEhuw6AiXhxg5vM3KgVvAhsyP
LZWJ9uHHiMjPbsgiF7MQmhio5TDh2mKAM8VcFCX3LT+qODEJpEzAbE4tf+cIFN/n
vLBSXkTagwDTcnneSM6Iv6YUeWYg0eAV8K0rT+I624gq+2XUwkYTQ1QGeTzWDda+
4nGMHHJVzNJ6ezGgV0beDgLsVDHAvLZ93rVfKIQMD5nQu0zh+2S+PIwlnFD2JCIs
WpGTfnJnK8NxOpDoJkR12KteyrtbxTtbNedZyDxcj4gWLhW7HPUWy+03xvB5Yvr+
RpsF3NqB3gZUNmnVALdS6Fh3vo339L042Kj0GIHd5yERpLyIxGBwsGzfeZ3pAkWX
LwjFFcqYr/wzel7c1vMcmCPbpQMICbVeuOIhZxbEzZ4nLQhjzu6gOvwx8gyn+iG2
luLQ225Q02jQg/mufl3LTvdglobKtZDkzrL6YybsztveprpqBe4=
=k7c7
-----END PGP SIGNATURE-----

--OF4lAQs4q55L4kxd34GGSipoiU735nJuS--

--===============1936822712==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1936822712==--
