From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] drm/nouveau: gk20a: Turn instmem lock into mutex
Date: Thu, 23 Feb 2017 17:20:15 +0100
Message-ID: <20170223162015.GA15693@ulmo.ba.sec>
References: <20170130200307.18574-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1343466103=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20170130200307.18574-1-thierry.reding@gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Ben Skeggs <bskeggs@redhat.com>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org


--===============1343466103==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wRRV7LY7NUeQGEoC"
Content-Disposition: inline


--wRRV7LY7NUeQGEoC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 30, 2017 at 09:03:07PM +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
>=20
> The gk20a implementation of instance memory uses vmap()/vunmap() to map
> memory regions into the kernel's virtual address space. These functions
> may sleep, so protecting them by a spin lock is not safe. This triggers
> a warning if the DEBUG_ATOMIC_SLEEP Kconfig option is enabled. Fix this
> by using a mutex instead.
>=20
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/gpu/drm/nouveau/nvkm/subdev/instmem/gk20a.c | 19 ++++++++-------=
----
>  1 file changed, 8 insertions(+), 11 deletions(-)

Alex, could you take a look at this?

Thanks,
Thierry

> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/gk20a.c b/driver=
s/gpu/drm/nouveau/nvkm/subdev/instmem/gk20a.c
> index a6a7fa0d7679..7f5244d57d2f 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/gk20a.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/gk20a.c
> @@ -94,7 +94,7 @@ struct gk20a_instmem {
>  	struct nvkm_instmem base;
> =20
>  	/* protects vaddr_* and gk20a_instobj::vaddr* */
> -	spinlock_t lock;
> +	struct mutex lock;
> =20
>  	/* CPU mappings LRU */
>  	unsigned int vaddr_use;
> @@ -184,11 +184,10 @@ gk20a_instobj_acquire_iommu(struct nvkm_memory *mem=
ory)
>  	struct gk20a_instmem *imem =3D node->base.imem;
>  	struct nvkm_ltc *ltc =3D imem->base.subdev.device->ltc;
>  	const u64 size =3D nvkm_memory_size(memory);
> -	unsigned long flags;
> =20
>  	nvkm_ltc_flush(ltc);
> =20
> -	spin_lock_irqsave(&imem->lock, flags);
> +	mutex_lock(&imem->lock);
> =20
>  	if (node->base.vaddr) {
>  		if (!node->use_cpt) {
> @@ -216,7 +215,7 @@ gk20a_instobj_acquire_iommu(struct nvkm_memory *memor=
y)
> =20
>  out:
>  	node->use_cpt++;
> -	spin_unlock_irqrestore(&imem->lock, flags);
> +	mutex_unlock(&imem->lock);
> =20
>  	return node->base.vaddr;
>  }
> @@ -239,9 +238,8 @@ gk20a_instobj_release_iommu(struct nvkm_memory *memor=
y)
>  	struct gk20a_instobj_iommu *node =3D gk20a_instobj_iommu(memory);
>  	struct gk20a_instmem *imem =3D node->base.imem;
>  	struct nvkm_ltc *ltc =3D imem->base.subdev.device->ltc;
> -	unsigned long flags;
> =20
> -	spin_lock_irqsave(&imem->lock, flags);
> +	mutex_lock(&imem->lock);
> =20
>  	/* we should at least have one user to release... */
>  	if (WARN_ON(node->use_cpt =3D=3D 0))
> @@ -252,7 +250,7 @@ gk20a_instobj_release_iommu(struct nvkm_memory *memor=
y)
>  		list_add_tail(&node->vaddr_node, &imem->vaddr_lru);
> =20
>  out:
> -	spin_unlock_irqrestore(&imem->lock, flags);
> +	mutex_unlock(&imem->lock);
> =20
>  	wmb();
>  	nvkm_ltc_invalidate(ltc);
> @@ -306,19 +304,18 @@ gk20a_instobj_dtor_iommu(struct nvkm_memory *memory)
>  	struct gk20a_instmem *imem =3D node->base.imem;
>  	struct device *dev =3D imem->base.subdev.device->dev;
>  	struct nvkm_mm_node *r;
> -	unsigned long flags;
>  	int i;
> =20
>  	if (unlikely(list_empty(&node->base.mem.regions)))
>  		goto out;
> =20
> -	spin_lock_irqsave(&imem->lock, flags);
> +	mutex_lock(&imem->lock);
> =20
>  	/* vaddr has already been recycled */
>  	if (node->base.vaddr)
>  		gk20a_instobj_iommu_recycle_vaddr(node);
> =20
> -	spin_unlock_irqrestore(&imem->lock, flags);
> +	mutex_unlock(&imem->lock);
> =20
>  	r =3D list_first_entry(&node->base.mem.regions, struct nvkm_mm_node,
>  			     rl_entry);
> @@ -580,7 +577,7 @@ gk20a_instmem_new(struct nvkm_device *device, int ind=
ex,
>  	if (!(imem =3D kzalloc(sizeof(*imem), GFP_KERNEL)))
>  		return -ENOMEM;
>  	nvkm_instmem_ctor(&gk20a_instmem, device, index, &imem->base);
> -	spin_lock_init(&imem->lock);
> +	mutex_init(&imem->lock);
>  	*pimem =3D &imem->base;
> =20
>  	/* do not allow more than 1MB of CPU-mapped instmem */
> --=20
> 2.11.0
>=20

--wRRV7LY7NUeQGEoC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlivC74ACgkQ3SOs138+
s6E5kxAAotmA5+kEd5Lf4qWaE0HGb+LZUAKPamwyXlmTh3vE6U8b7BjZF3EN0zT2
6v8SlTr88ee6xv6P9GcI1JdCx7/t1Jzr9xKQE4NdoS1paVU78dLGaCAINY1+LXJe
h2ESH4hhhcbSpVA009Xgcl3NW9zxzDqs4WBb7U6pONWLcDXw4Xn9RPyFU6Y1f1Ru
thbrIlAoScLKBRC5X4GAJPO5im4RIpIGIJEVnEb1rBSlzJTsTEIuDXHAMmxTlvsn
g5bs6BxnnUHOnco4rXTZ/mj4vbJQ3C3tKNXVLRbXOqtnLtJL8EBLlJkWQj9CExtN
nM7y8F/0TpwD2h1UnKUF5jjd6suJjUg+4U0HasFhLTslsf3b9bA4Z94LiUKWG3Xj
K/IYF3ZUW6YYAVQ7OO+C6wxnp0xB+0zkgC7UsPjQVH8FTs4dH5COnlieDH61aDp3
ScFuc8XnhpFArabQBBvtPTrLL32NYxjWpl/QxFlvV7k9h/aPW+dzBymfPduC8xnQ
o3gSyhIKbGCQ7fcTSQ2P9R/H6jphnM2yi1BFNP/40Q2bEL6Eysx7rGPX5+f+EERc
g6qIatBPMKsk3nBOSYceQqeqTu+MQsf8nnVtKRt8BvsEy5SUVV3SvOxQGq8qHPHN
cRJRWtwVK9PI0KzsKB0Ur98Chv+Id1opKHiFvCKGZnCWaLlDYog=
=7SEH
-----END PGP SIGNATURE-----

--wRRV7LY7NUeQGEoC--

--===============1343466103==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1343466103==--
