From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] instmem/gk20a: fix race conditions
Date: Wed, 11 Nov 2015 10:19:07 +1000
Message-ID: <5642897B.3060104@gmail.com>
References: <1447054673-1500-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0614583033=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1447054673-1500-1-git-send-email-acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0614583033==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="aetdBX9SaWj6dbHJDwQiMn5kQVl1WWV02"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--aetdBX9SaWj6dbHJDwQiMn5kQVl1WWV02
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 11/09/2015 05:37 PM, Alexandre Courbot wrote:
> The LRU list used for recycling CPU mappings was handling concurrency
> very poorly. For instance, if an instobj was acquired twice before bein=
g
> released once, it would end up into the LRU list even though there is
> still a client accessing it.
>=20
> This patch fixes this by properly counting how many clients are
> currently using a given instobj.
Out of curiosity, which instobjs are being accessed concurrently?

>=20
> While at it, we also raise errors when inconsistencies are detected, an=
d
> factorize some code.
>=20
> Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drm/nouveau/nvkm/subdev/instmem/gk20a.c | 66 ++++++++++++++++++-------=
--------
>  1 file changed, 37 insertions(+), 29 deletions(-)
>=20
> diff --git a/drm/nouveau/nvkm/subdev/instmem/gk20a.c b/drm/nouveau/nvkm=
/subdev/instmem/gk20a.c
> index fc419bb8eab7..681b2541229a 100644
> --- a/drm/nouveau/nvkm/subdev/instmem/gk20a.c
> +++ b/drm/nouveau/nvkm/subdev/instmem/gk20a.c
> @@ -57,6 +57,8 @@ struct gk20a_instobj {
>  	/* CPU mapping */
>  	u32 *vaddr;
>  	struct list_head vaddr_node;
> +	/* How many clients are using vaddr? */
> +	u32 use_cpt;
>  };
>  #define gk20a_instobj(p) container_of((p), struct gk20a_instobj, memor=
y)
> =20
> @@ -158,27 +160,35 @@ gk20a_instobj_cpu_map_iommu(struct nvkm_memory *m=
emory)
>  }
> =20
>  /*
> - * Must be called while holding gk20a_instmem_lock
> + * Recycle the vaddr of obj. Must be called with gk20a_instmem::lock h=
eld.
> + */
> +static void
> +gk20a_instobj_recycle_vaddr(struct gk20a_instobj *obj)
> +{
> +	struct gk20a_instmem *imem =3D obj->imem;
> +	/* there should not be any user left... */
> +	WARN_ON(obj->use_cpt);
> +	list_del(&obj->vaddr_node);
> +	vunmap(obj->vaddr);
> +	obj->vaddr =3D NULL;
> +	imem->vaddr_use -=3D nvkm_memory_size(&obj->memory);
> +	nvkm_debug(&imem->base.subdev, "vaddr used: %x/%x\n", imem->vaddr_use=
,
> +		   imem->vaddr_max);
> +}
> +
> +/*
> + * Must be called while holding gk20a_instmem::lock
>   */
>  static void
>  gk20a_instmem_vaddr_gc(struct gk20a_instmem *imem, const u64 size)
>  {
>  	while (imem->vaddr_use + size > imem->vaddr_max) {
> -		struct gk20a_instobj *obj;
> -
>  		/* no candidate that can be unmapped, abort... */
>  		if (list_empty(&imem->vaddr_lru))
>  			break;
> =20
> -		obj =3D list_first_entry(&imem->vaddr_lru, struct gk20a_instobj,
> -				       vaddr_node);
> -		list_del(&obj->vaddr_node);
> -		vunmap(obj->vaddr);
> -		obj->vaddr =3D NULL;
> -		imem->vaddr_use -=3D nvkm_memory_size(&obj->memory);
> -		nvkm_debug(&imem->base.subdev, "(GC) vaddr used: %x/%x\n",
> -			   imem->vaddr_use, imem->vaddr_max);
> -
> +		gk20a_instobj_recycle_vaddr(list_first_entry(&imem->vaddr_lru,
> +					     struct gk20a_instobj, vaddr_node));
>  	}
>  }
> =20
> @@ -196,9 +206,10 @@ gk20a_instobj_acquire(struct nvkm_memory *memory)
>  	spin_lock_irqsave(&imem->lock, flags);
> =20
>  	if (node->vaddr) {
> -		/* remove us from the LRU list since we cannot be unmapped */
> -		list_del(&node->vaddr_node);
> -
> +		if (!node->use_cpt) {
> +			/* remove from LRU list since mapping in use again */
> +			list_del(&node->vaddr_node);
> +		}
>  		goto out;
>  	}
> =20
> @@ -218,6 +229,7 @@ gk20a_instobj_acquire(struct nvkm_memory *memory)
>  		   imem->vaddr_use, imem->vaddr_max);
> =20
>  out:
> +	node->use_cpt++;
>  	spin_unlock_irqrestore(&imem->lock, flags);
> =20
>  	return node->vaddr;
> @@ -233,9 +245,15 @@ gk20a_instobj_release(struct nvkm_memory *memory)
> =20
>  	spin_lock_irqsave(&imem->lock, flags);
> =20
> -	/* add ourselves to the LRU list so our CPU mapping can be freed */
> -	list_add_tail(&node->vaddr_node, &imem->vaddr_lru);
> +	/* we should at least have one user to release... */
> +	if (WARN_ON(node->use_cpt =3D=3D 0))
> +		goto out;
> +
> +	/* add unused objs to the LRU list to recycle their mapping */
> +	if (--node->use_cpt =3D=3D 0)
> +		list_add_tail(&node->vaddr_node, &imem->vaddr_lru);
> =20
> +out:
>  	spin_unlock_irqrestore(&imem->lock, flags);
> =20
>  	wmb();
> @@ -273,25 +291,15 @@ static void
>  gk20a_instobj_dtor(struct gk20a_instobj *node)
>  {
>  	struct gk20a_instmem *imem =3D node->imem;
> -	struct gk20a_instobj *obj;
>  	unsigned long flags;
> =20
>  	spin_lock_irqsave(&imem->lock, flags);
> =20
> +	/* vaddr has already been recycled */
>  	if (!node->vaddr)
>  		goto out;
> =20
> -	list_for_each_entry(obj, &imem->vaddr_lru, vaddr_node) {
> -		if (obj =3D=3D node) {
> -			list_del(&obj->vaddr_node);
> -			break;
> -		}
> -	}
> -	vunmap(node->vaddr);
> -	node->vaddr =3D NULL;
> -	imem->vaddr_use -=3D nvkm_memory_size(&node->memory);
> -	nvkm_debug(&imem->base.subdev, "vaddr used: %x/%x\n",
> -		   imem->vaddr_use, imem->vaddr_max);
> +	gk20a_instobj_recycle_vaddr(node);
> =20
>  out:
>  	spin_unlock_irqrestore(&imem->lock, flags);
>=20


--aetdBX9SaWj6dbHJDwQiMn5kQVl1WWV02
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWQomCAAoJEHYLnGJQkpH7QWYP/A/JccvJZ+0zGzqGS7odRaqW
dNBYNILOVrhsM+Kz7dV8A/UqJTwGV0bN8PvAk6EB5uSA4qVjJp1n6eGu6gkMPTYM
CsTDmERixG+sCGUY5a4+v7RmMED+oP3ynJVFsNleKfesnp0BMKpbMPCcqPiCAyRX
1x/yoVHyA4sg5H4OSihEZD3YsKwA+NT2DhlqqM5/OXwrnL5MpicqsDrPzHIkuaSj
bY+IXry+W8pHqLumP/6TO57XxYnaPbOb7Og6vbHxDHMLFDNrf1S98QJD82Hf+5bQ
x2VsPlr30iYoDrAdbbglHyCjxQHb4BLy+I3h449yVs4th6T0vf4ONNHSSnWTOaCt
Lxnob2cMqynZQfCMG2ZR28YmGA2r9jAe4Ec7L+GqmSXOSS3G3ioa9ghi++4dTJZ+
1pOAD9VGI/mugHdbEIbiF+bq3zElsqit+VtEESLlyN6kHzsf9FZr7tUxY5ZeIHRE
LJHuUUtrxSKPra2W6jHKh0Ri0MgMR/jiUUYNb1z+s4uwUAGxa3dFVHR0vGKGGb6v
/haxE0BKRpGuAbgMhzL9YEjILN1+xKRh0slN0D2hH+puVNH2kSGA4OG/1fU2er/D
coXGruqPh4ullYjFMG6M2uYFlLFbSjrT1oexJqW6REOU1dK5KK3BtVWOWTkUw+4m
7WSM8RpZM7Cfqj66cUx4
=PBwH
-----END PGP SIGNATURE-----

--aetdBX9SaWj6dbHJDwQiMn5kQVl1WWV02--

--===============0614583033==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0614583033==--
