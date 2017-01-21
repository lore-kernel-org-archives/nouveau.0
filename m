From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] drm/nouveau/client: use rb_entry()
Date: Sat, 21 Jan 2017 10:14:57 +1000
Message-ID: <1b2c2698-5f99-f851-4e19-5ca5b756e1a9@gmail.com>
References: <c6a809ea5820242a4ae126b03cdcd910a36e5cae.1484817152.git.geliangtang@gmail.com>
 <22da087ad757fafdb206fd0c57d286449302acdb.1484816560.git.geliangtang@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1549756663=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <22da087ad757fafdb206fd0c57d286449302acdb.1484816560.git.geliangtang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1549756663==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="mM5OuKSs9Ij1n81G8n7GAoWkGCf2CO6UH"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--mM5OuKSs9Ij1n81G8n7GAoWkGCf2CO6UH
Content-Type: multipart/mixed; boundary="DBriT6N7iErjblNjhf7XMSSX50oHrTEC1"
From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Message-ID: <1b2c2698-5f99-f851-4e19-5ca5b756e1a9-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Nouveau] [PATCH] drm/nouveau/client: use rb_entry()
References: <c6a809ea5820242a4ae126b03cdcd910a36e5cae.1484817152.git.geliangtang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
 <22da087ad757fafdb206fd0c57d286449302acdb.1484816560.git.geliangtang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
In-Reply-To: <22da087ad757fafdb206fd0c57d286449302acdb.1484816560.git.geliangtang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

--DBriT6N7iErjblNjhf7XMSSX50oHrTEC1
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 01/21/2017 12:36 AM, Geliang Tang wrote:
> To make the code clearer, use rb_entry() instead of container_of() to
> deal with rbtree.
Hey Geliang,

Looks good, however, I've already got a patch handling this pending in
my tree.

Thank you!
Ben.

>=20
> Signed-off-by: Geliang Tang <geliangtang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/gpu/drm/nouveau/nvkm/core/client.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nvkm/core/client.c b/drivers/gpu/d=
rm/nouveau/nvkm/core/client.c
> index e194391..ab2ee14 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/core/client.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/core/client.c
> @@ -221,7 +221,7 @@ nvkm_client_insert(struct nvkm_client *client, stru=
ct nvkm_object *object)
> =20
>  	while (*ptr) {
>  		struct nvkm_object *this =3D
> -			container_of(*ptr, typeof(*this), node);
> +			rb_entry(*ptr, typeof(*this), node);
>  		parent =3D *ptr;
>  		if (object->object < this->object)
>  			ptr =3D &parent->rb_left;
> @@ -243,7 +243,7 @@ nvkm_client_search(struct nvkm_client *client, u64 =
handle)
>  	struct rb_node *node =3D client->objroot.rb_node;
>  	while (node) {
>  		struct nvkm_object *object =3D
> -			container_of(node, typeof(*object), node);
> +			rb_entry(node, typeof(*object), node);
>  		if (handle < object->object)
>  			node =3D node->rb_left;
>  		else
>=20


--DBriT6N7iErjblNjhf7XMSSX50oHrTEC1--

--mM5OuKSs9Ij1n81G8n7GAoWkGCf2CO6UH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEETp/uv2nr9kIVth0/dgucYlCSkfsFAliCqAwACgkQdgucYlCS
kftP7g//RI41mCQYm7aJc+6KFb4HpEhLXALL12bwc6U4/elIdSDjrkuk71BgjgcW
rrb9gxJcc4GYm3IZrukTfz6idFfZkSLhOlVHJR+WQj1t2Pcw8vTexf5Z/Rmfqcss
zea9fgAopmVtG+gqwGFl+ONmaGGAyRG5lmpYg4NWy80ya8ZWqracSo+Ocp5vqobB
KXi4x/zcvhGLK4CE2o5VF5+rbzglCjUlB8m9xViLjcTysZtEM7UPd8qebL16TgE6
G2JycONcve+Djfdy8XmblhDDWbJxwYSipVg6BuoBjJiUSkQQxooHZFem2W3vVf0q
GelUeqkkqDHmkgLygCS6N3dC6wE6eJfL5heMPb5d4Pkzft9nP/k1h2TAnH2KtS4O
yozomyiKNlQEc58BPDm/0jfEjzYzEa2aqnDZ+1M8rJRvCWleE5grOaQpfka/7Y1E
GTo+kwNxgf+STQktqBWIGADSslztb9Nae8a7MiFWZMNibhPKFeuj89LQ98Pb8O0b
EM8k3Xk9nqzHDXCAZ6WFoxTbUwD8wdKI3eHs4dIi5n+7V0KhiOu8NJZbleqPL55L
ghQcfla/gvoJBCreUOYPh/PgvrPGgKNDjqEsdVbgNbJgcK0w/nH5A53M42WWp6qZ
LOzbeJ1mMz15lvYz/IXmkfOGcUDGFlPJI0iVnm7RfsyZEa9unv8=
=fQzj
-----END PGP SIGNATURE-----

--mM5OuKSs9Ij1n81G8n7GAoWkGCf2CO6UH--

--===============1549756663==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1549756663==--
