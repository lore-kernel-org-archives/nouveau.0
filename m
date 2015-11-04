From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] instmem/gk20a: exclusively acquire instobjs
Date: Thu, 5 Nov 2015 07:19:00 +1000
Message-ID: <563A7644.80804@gmail.com>
References: <1445838895-28342-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1266112051=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1445838895-28342-1-git-send-email-acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
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
--===============1266112051==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="gqlB73iMaoxbcwNjl2OgKWsnwCTmQx2Xt"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--gqlB73iMaoxbcwNjl2OgKWsnwCTmQx2Xt
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 10/26/2015 03:54 PM, Alexandre Courbot wrote:
> Although I would not have expected this to happen, we seem to run into
> race conditions if instobjs are accessed concurrently. Use a global loc=
k
> for safety.
I wouldn't expect this to be an issue either.

Before merging such a large hammer of a fix, I'd strongly prefer to see
at least a better justification for why this is happening rather than
potentially papering over a larger issue.

Ben.

>=20
> Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drm/nouveau/nvkm/subdev/instmem/gk20a.c | 15 ++++++---------
>  1 file changed, 6 insertions(+), 9 deletions(-)
>=20
> diff --git a/drm/nouveau/nvkm/subdev/instmem/gk20a.c b/drm/nouveau/nvkm=
/subdev/instmem/gk20a.c
> index fc419bb8eab7..d015633b8edd 100644
> --- a/drm/nouveau/nvkm/subdev/instmem/gk20a.c
> +++ b/drm/nouveau/nvkm/subdev/instmem/gk20a.c
> @@ -92,6 +92,7 @@ struct gk20a_instmem {
> =20
>  	/* protects vaddr_* and gk20a_instobj::vaddr* */
>  	spinlock_t lock;
> +	unsigned long flags;
> =20
>  	/* CPU mappings LRU */
>  	unsigned int vaddr_use;
> @@ -188,12 +189,11 @@ gk20a_instobj_acquire(struct nvkm_memory *memory)=

>  	struct gk20a_instobj *node =3D gk20a_instobj(memory);
>  	struct gk20a_instmem *imem =3D node->imem;
>  	struct nvkm_ltc *ltc =3D imem->base.subdev.device->ltc;
> -	const u64 size =3D nvkm_memory_size(memory);
> -	unsigned long flags;
> +	u64 size;
> =20
>  	nvkm_ltc_flush(ltc);
> =20
> -	spin_lock_irqsave(&imem->lock, flags);
> +	spin_lock_irqsave(&imem->lock, imem->flags);
> =20
>  	if (node->vaddr) {
>  		/* remove us from the LRU list since we cannot be unmapped */
> @@ -202,6 +202,8 @@ gk20a_instobj_acquire(struct nvkm_memory *memory)
>  		goto out;
>  	}
> =20
> +	size =3D nvkm_memory_size(memory);
> +
>  	/* try to free some address space if we reached the limit */
>  	gk20a_instmem_vaddr_gc(imem, size);
> =20
> @@ -218,8 +220,6 @@ gk20a_instobj_acquire(struct nvkm_memory *memory)
>  		   imem->vaddr_use, imem->vaddr_max);
> =20
>  out:
> -	spin_unlock_irqrestore(&imem->lock, flags);
> -
>  	return node->vaddr;
>  }
> =20
> @@ -229,14 +229,11 @@ gk20a_instobj_release(struct nvkm_memory *memory)=

>  	struct gk20a_instobj *node =3D gk20a_instobj(memory);
>  	struct gk20a_instmem *imem =3D node->imem;
>  	struct nvkm_ltc *ltc =3D imem->base.subdev.device->ltc;
> -	unsigned long flags;
> -
> -	spin_lock_irqsave(&imem->lock, flags);
> =20
>  	/* add ourselves to the LRU list so our CPU mapping can be freed */
>  	list_add_tail(&node->vaddr_node, &imem->vaddr_lru);
> =20
> -	spin_unlock_irqrestore(&imem->lock, flags);
> +	spin_unlock_irqrestore(&imem->lock, imem->flags);
> =20
>  	wmb();
>  	nvkm_ltc_invalidate(ltc);
>=20


--gqlB73iMaoxbcwNjl2OgKWsnwCTmQx2Xt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWOnZEAAoJEHYLnGJQkpH7zM8QAI89EjDnxby242sosRrHRO4v
ZnI5saVtiVVIJE7EKpwQyHne8dk9UZsHOie+y4eswoZgiLqVbjC3MSuzL2j5TWar
Rc4rvS6u4LP3ILIc2GAvT2tyb4Jrkfc+xeHtsAiyvyq8ZEq0wMtdxcr89fhoXYgU
zp5s6eHZV1qXyn9D02SSiOA+5H/oApj8KNhnqd8Oeel5/NDEmdmJ7Ch7yoyYNasZ
FTmbZV+HizqvAhE314mISp1yNzKAjZxMcd6KLi5t23N8waYkGPYCiwCXWvp6AXYv
fScMzUP8gN8oxyYGGYMs2AsKOBW6Czo4Lxi8/48X3SfCRSB2W2ciMzVAVjT8omEf
tfcx7iPwxW5zIO3VBLnZyxv/xUqBPDNdlhERAS93BgBBpvzbva/CrIbzbLaEK0O3
IYGAiljvwsRveZu8iPb7fK8IO02dWWMdRDhXIqNi4ATW0exk5JbEdBWGUZJNvlHR
FJj9e0u2lzhBgZdk37sIkvE/MTSH7KUYdsQeaoT3xjjnLNT8q8pr6bEtZJjnvYFf
QPenhWPMAyIvqLevggtee7nrnQmI41KQeGRBPxrJZVfhHymK3RbxKttUr7WyBvn4
k+Dro17I22WzvY0f4VX7kTEiUKYxm29Nt5JMqctFBTvPMq5pFRgP5ZdJxwziKXlr
lBEhPEoaAJikl9hKFp4v
=L1NL
-----END PGP SIGNATURE-----

--gqlB73iMaoxbcwNjl2OgKWsnwCTmQx2Xt--

--===============1266112051==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1266112051==--
