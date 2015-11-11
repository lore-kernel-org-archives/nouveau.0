From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] instmem/gk20a: use DMA API CPU mapping
Date: Thu, 12 Nov 2015 08:49:43 +1000
Message-ID: <5643C607.60204@gmail.com>
References: <1447229271-22901-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1765538553=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1447229271-22901-1-git-send-email-acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Dave Airlie <airlied-cv59FeDIM0c@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
List-Id: nouveau.vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1765538553==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="mAcvITMcbs6fh3jk2cQLl3oKxLsrMnjHg"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--mAcvITMcbs6fh3jk2cQLl3oKxLsrMnjHg
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 11/11/2015 06:07 PM, Alexandre Courbot wrote:
> Commit 69c4938249fb ("drm/nouveau/instmem/gk20a: use direct CPU access"=
)
> tried to be smart while using the DMA-API by managing the CPU mappings =
of
> buffers allocated with the DMA-API by itself. In doing so, it relied
> on dma_to_phys() which is an architecture-private function not
> available everywhere. This broke the build on several architectures.
>=20
> Since there is no reliable and portable way to obtain the physical
> address of a DMA-API buffer, stop trying to be smart and just use the
> CPU mapping that the DMA-API can provide. This means that buffers will
> be CPU-mapped for all their life as opposed to when we need them, but
> anyway using the DMA-API here is a fallback for when no IOMMU is
> available so we should not expect optimal behavior.
>=20
> This makes the IOMMU and DMA-API implementations of instmem diverge
> enough that we should maybe put them into separate files...
>=20
> Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> Ben/Dave, since Dave's fix has reached mainline and builds are not
> broken anymore, we can proceed one of two ways:
>=20
> 1) Ben merges this for 4.4 and let it flow for -rc2
> 2) I send another fix against the kernel tree
I just spoke to Dave, and I'll take this in my tree for 4.5 if
everything works fine with the temporary hack fix.  Does that sound OK
to you?

Ben.
>=20
> Which one shall I do?
>=20
>  drm/nouveau/nvkm/subdev/instmem/gk20a.c | 148 +++++++++++++-----------=
--------
>  lib/include/nvif/os.h                   |   6 --
>  2 files changed, 62 insertions(+), 92 deletions(-)
>=20
> diff --git a/drm/nouveau/nvkm/subdev/instmem/gk20a.c b/drm/nouveau/nvkm=
/subdev/instmem/gk20a.c
> index 681b2541229a..4c20fec64d96 100644
> --- a/drm/nouveau/nvkm/subdev/instmem/gk20a.c
> +++ b/drm/nouveau/nvkm/subdev/instmem/gk20a.c
> @@ -56,9 +56,6 @@ struct gk20a_instobj {
> =20
>  	/* CPU mapping */
>  	u32 *vaddr;
> -	struct list_head vaddr_node;
> -	/* How many clients are using vaddr? */
> -	u32 use_cpt;
>  };
>  #define gk20a_instobj(p) container_of((p), struct gk20a_instobj, memor=
y)
> =20
> @@ -68,7 +65,6 @@ struct gk20a_instobj {
>  struct gk20a_instobj_dma {
>  	struct gk20a_instobj base;
> =20
> -	u32 *cpuaddr;
>  	dma_addr_t handle;
>  	struct nvkm_mm_node r;
>  };
> @@ -81,6 +77,11 @@ struct gk20a_instobj_dma {
>  struct gk20a_instobj_iommu {
>  	struct gk20a_instobj base;
> =20
> +	/* to link into gk20a_instmem::vaddr_lru */
> +	struct list_head vaddr_node;
> +	/* how many clients are using vaddr? */
> +	u32 use_cpt;
> +
>  	/* will point to the higher half of pages */
>  	dma_addr_t *dma_addrs;
>  	/* array of base.mem->size pages (+ dma_addr_ts) */
> @@ -109,8 +110,6 @@ struct gk20a_instmem {
> =20
>  	/* Only used by DMA API */
>  	struct dma_attrs attrs;
> -
> -	void __iomem * (*cpu_map)(struct nvkm_memory *);
>  };
>  #define gk20a_instmem(p) container_of((p), struct gk20a_instmem, base)=

> =20
> @@ -132,46 +131,19 @@ gk20a_instobj_size(struct nvkm_memory *memory)
>  	return (u64)gk20a_instobj(memory)->mem.size << 12;
>  }
> =20
> -static void __iomem *
> -gk20a_instobj_cpu_map_dma(struct nvkm_memory *memory)
> -{
> -	struct gk20a_instobj_dma *node =3D gk20a_instobj_dma(memory);
> -	struct device *dev =3D node->base.imem->base.subdev.device->dev;
> -	int npages =3D nvkm_memory_size(memory) >> 12;
> -	struct page *pages[npages];
> -	int i;
> -
> -	/* phys_to_page does not exist on all platforms... */
> -	pages[0] =3D pfn_to_page(dma_to_phys(dev, node->handle) >> PAGE_SHIFT=
);
> -	for (i =3D 1; i < npages; i++)
> -		pages[i] =3D pages[0] + i;
> -
> -	return vmap(pages, npages, VM_MAP, pgprot_writecombine(PAGE_KERNEL));=

> -}
> -
> -static void __iomem *
> -gk20a_instobj_cpu_map_iommu(struct nvkm_memory *memory)
> -{
> -	struct gk20a_instobj_iommu *node =3D gk20a_instobj_iommu(memory);
> -	int npages =3D nvkm_memory_size(memory) >> 12;
> -
> -	return vmap(node->pages, npages, VM_MAP,
> -		    pgprot_writecombine(PAGE_KERNEL));
> -}
> -
>  /*
>   * Recycle the vaddr of obj. Must be called with gk20a_instmem::lock h=
eld.
>   */
>  static void
> -gk20a_instobj_recycle_vaddr(struct gk20a_instobj *obj)
> +gk20a_instobj_iommu_recycle_vaddr(struct gk20a_instobj_iommu *obj)
>  {
> -	struct gk20a_instmem *imem =3D obj->imem;
> +	struct gk20a_instmem *imem =3D obj->base.imem;
>  	/* there should not be any user left... */
>  	WARN_ON(obj->use_cpt);
>  	list_del(&obj->vaddr_node);
> -	vunmap(obj->vaddr);
> -	obj->vaddr =3D NULL;
> -	imem->vaddr_use -=3D nvkm_memory_size(&obj->memory);
> +	vunmap(obj->base.vaddr);
> +	obj->base.vaddr =3D NULL;
> +	imem->vaddr_use -=3D nvkm_memory_size(&obj->base.memory);
>  	nvkm_debug(&imem->base.subdev, "vaddr used: %x/%x\n", imem->vaddr_use=
,
>  		   imem->vaddr_max);
>  }
> @@ -187,17 +159,30 @@ gk20a_instmem_vaddr_gc(struct gk20a_instmem *imem=
, const u64 size)
>  		if (list_empty(&imem->vaddr_lru))
>  			break;
> =20
> -		gk20a_instobj_recycle_vaddr(list_first_entry(&imem->vaddr_lru,
> -					     struct gk20a_instobj, vaddr_node));
> +		gk20a_instobj_iommu_recycle_vaddr(
> +				list_first_entry(&imem->vaddr_lru,
> +				struct gk20a_instobj_iommu, vaddr_node));
>  	}
>  }
> =20
>  static void __iomem *
> -gk20a_instobj_acquire(struct nvkm_memory *memory)
> +gk20a_instobj_acquire_dma(struct nvkm_memory *memory)
>  {
>  	struct gk20a_instobj *node =3D gk20a_instobj(memory);
>  	struct gk20a_instmem *imem =3D node->imem;
>  	struct nvkm_ltc *ltc =3D imem->base.subdev.device->ltc;
> +
> +	nvkm_ltc_flush(ltc);
> +
> +	return node->vaddr;
> +}
> +
> +static void __iomem *
> +gk20a_instobj_acquire_iommu(struct nvkm_memory *memory)
> +{
> +	struct gk20a_instobj_iommu *node =3D gk20a_instobj_iommu(memory);
> +	struct gk20a_instmem *imem =3D node->base.imem;
> +	struct nvkm_ltc *ltc =3D imem->base.subdev.device->ltc;
>  	const u64 size =3D nvkm_memory_size(memory);
>  	unsigned long flags;
> =20
> @@ -205,7 +190,7 @@ gk20a_instobj_acquire(struct nvkm_memory *memory)
> =20
>  	spin_lock_irqsave(&imem->lock, flags);
> =20
> -	if (node->vaddr) {
> +	if (node->base.vaddr) {
>  		if (!node->use_cpt) {
>  			/* remove from LRU list since mapping in use again */
>  			list_del(&node->vaddr_node);
> @@ -216,9 +201,10 @@ gk20a_instobj_acquire(struct nvkm_memory *memory)
>  	/* try to free some address space if we reached the limit */
>  	gk20a_instmem_vaddr_gc(imem, size);
> =20
> -	node->vaddr =3D imem->cpu_map(memory);
> -
> -	if (!node->vaddr) {
> +	/* map the pages */
> +	node->base.vaddr =3D vmap(node->pages, size >> PAGE_SHIFT, VM_MAP,
> +				pgprot_writecombine(PAGE_KERNEL));
> +	if (!node->base.vaddr) {
>  		nvkm_error(&imem->base.subdev, "cannot map instobj - "
>  			   "this is not going to end well...\n");
>  		goto out;
> @@ -232,15 +218,25 @@ out:
>  	node->use_cpt++;
>  	spin_unlock_irqrestore(&imem->lock, flags);
> =20
> -	return node->vaddr;
> +	return node->base.vaddr;
>  }
> =20
>  static void
> -gk20a_instobj_release(struct nvkm_memory *memory)
> +gk20a_instobj_release_dma(struct nvkm_memory *memory)
>  {
>  	struct gk20a_instobj *node =3D gk20a_instobj(memory);
>  	struct gk20a_instmem *imem =3D node->imem;
>  	struct nvkm_ltc *ltc =3D imem->base.subdev.device->ltc;
> +
> +	nvkm_ltc_invalidate(ltc);
> +}
> +
> +static void
> +gk20a_instobj_release_iommu(struct nvkm_memory *memory)
> +{
> +	struct gk20a_instobj_iommu *node =3D gk20a_instobj_iommu(memory);
> +	struct gk20a_instmem *imem =3D node->base.imem;
> +	struct nvkm_ltc *ltc =3D imem->base.subdev.device->ltc;
>  	unsigned long flags;
> =20
>  	spin_lock_irqsave(&imem->lock, flags);
> @@ -284,27 +280,6 @@ gk20a_instobj_map(struct nvkm_memory *memory, stru=
ct nvkm_vma *vma, u64 offset)
>  	nvkm_vm_map_at(vma, offset, &node->mem);
>  }
> =20
> -/*
> - * Clear the CPU mapping of an instobj if it exists
> - */
> -static void
> -gk20a_instobj_dtor(struct gk20a_instobj *node)
> -{
> -	struct gk20a_instmem *imem =3D node->imem;
> -	unsigned long flags;
> -
> -	spin_lock_irqsave(&imem->lock, flags);
> -
> -	/* vaddr has already been recycled */
> -	if (!node->vaddr)
> -		goto out;
> -
> -	gk20a_instobj_recycle_vaddr(node);
> -
> -out:
> -	spin_unlock_irqrestore(&imem->lock, flags);
> -}
> -
>  static void *
>  gk20a_instobj_dtor_dma(struct nvkm_memory *memory)
>  {
> @@ -312,12 +287,10 @@ gk20a_instobj_dtor_dma(struct nvkm_memory *memory=
)
>  	struct gk20a_instmem *imem =3D node->base.imem;
>  	struct device *dev =3D imem->base.subdev.device->dev;
> =20
> -	gk20a_instobj_dtor(&node->base);
> -
> -	if (unlikely(!node->cpuaddr))
> +	if (unlikely(!node->base.vaddr))
>  		goto out;
> =20
> -	dma_free_attrs(dev, node->base.mem.size << PAGE_SHIFT, node->cpuaddr,=

> +	dma_free_attrs(dev, node->base.mem.size << PAGE_SHIFT, node->base.vad=
dr,
>  		       node->handle, &imem->attrs);
> =20
>  out:
> @@ -331,13 +304,20 @@ gk20a_instobj_dtor_iommu(struct nvkm_memory *memo=
ry)
>  	struct gk20a_instmem *imem =3D node->base.imem;
>  	struct device *dev =3D imem->base.subdev.device->dev;
>  	struct nvkm_mm_node *r;
> +	unsigned long flags;
>  	int i;
> =20
> -	gk20a_instobj_dtor(&node->base);
> -
>  	if (unlikely(list_empty(&node->base.mem.regions)))
>  		goto out;
> =20
> +	spin_lock_irqsave(&imem->lock, flags);
> +
> +	/* vaddr has already been recycled */
> +	if (node->base.vaddr)
> +		gk20a_instobj_iommu_recycle_vaddr(node);
> +
> +	spin_unlock_irqrestore(&imem->lock, flags);
> +
>  	r =3D list_first_entry(&node->base.mem.regions, struct nvkm_mm_node,
>  			     rl_entry);
> =20
> @@ -368,8 +348,8 @@ gk20a_instobj_func_dma =3D {
>  	.target =3D gk20a_instobj_target,
>  	.addr =3D gk20a_instobj_addr,
>  	.size =3D gk20a_instobj_size,
> -	.acquire =3D gk20a_instobj_acquire,
> -	.release =3D gk20a_instobj_release,
> +	.acquire =3D gk20a_instobj_acquire_dma,
> +	.release =3D gk20a_instobj_release_dma,
>  	.rd32 =3D gk20a_instobj_rd32,
>  	.wr32 =3D gk20a_instobj_wr32,
>  	.map =3D gk20a_instobj_map,
> @@ -381,8 +361,8 @@ gk20a_instobj_func_iommu =3D {
>  	.target =3D gk20a_instobj_target,
>  	.addr =3D gk20a_instobj_addr,
>  	.size =3D gk20a_instobj_size,
> -	.acquire =3D gk20a_instobj_acquire,
> -	.release =3D gk20a_instobj_release,
> +	.acquire =3D gk20a_instobj_acquire_iommu,
> +	.release =3D gk20a_instobj_release_iommu,
>  	.rd32 =3D gk20a_instobj_rd32,
>  	.wr32 =3D gk20a_instobj_wr32,
>  	.map =3D gk20a_instobj_map,
> @@ -402,10 +382,10 @@ gk20a_instobj_ctor_dma(struct gk20a_instmem *imem=
, u32 npages, u32 align,
> =20
>  	nvkm_memory_ctor(&gk20a_instobj_func_dma, &node->base.memory);
> =20
> -	node->cpuaddr =3D dma_alloc_attrs(dev, npages << PAGE_SHIFT,
> -					&node->handle, GFP_KERNEL,
> -					&imem->attrs);
> -	if (!node->cpuaddr) {
> +	node->base.vaddr =3D dma_alloc_attrs(dev, npages << PAGE_SHIFT,
> +					   &node->handle, GFP_KERNEL,
> +					   &imem->attrs);
> +	if (!node->base.vaddr) {
>  		nvkm_error(subdev, "cannot allocate DMA memory\n");
>  		return -ENOMEM;
>  	}
> @@ -611,18 +591,14 @@ gk20a_instmem_new(struct nvkm_device *device, int=
 index,
>  		imem->mm =3D &tdev->iommu.mm;
>  		imem->domain =3D tdev->iommu.domain;
>  		imem->iommu_pgshift =3D tdev->iommu.pgshift;
> -		imem->cpu_map =3D gk20a_instobj_cpu_map_iommu;
>  		imem->iommu_bit =3D tdev->func->iommu_bit;
> =20
>  		nvkm_info(&imem->base.subdev, "using IOMMU\n");
>  	} else {
>  		init_dma_attrs(&imem->attrs);
> -		/* We will access the memory through our own mapping */
>  		dma_set_attr(DMA_ATTR_NON_CONSISTENT, &imem->attrs);
>  		dma_set_attr(DMA_ATTR_WEAK_ORDERING, &imem->attrs);
>  		dma_set_attr(DMA_ATTR_WRITE_COMBINE, &imem->attrs);
> -		dma_set_attr(DMA_ATTR_NO_KERNEL_MAPPING, &imem->attrs);
> -		imem->cpu_map =3D gk20a_instobj_cpu_map_dma;
> =20
>  		nvkm_info(&imem->base.subdev, "using DMA API\n");
>  	}
> diff --git a/lib/include/nvif/os.h b/lib/include/nvif/os.h
> index 2df30489179a..e8c06cb254dc 100644
> --- a/lib/include/nvif/os.h
> +++ b/lib/include/nvif/os.h
> @@ -943,12 +943,6 @@ dma_unmap_page(struct device *pdev, dma_addr_t add=
r, int size, unsigned flags)
>  {
>  }
> =20
> -static inline phys_addr_t
> -dma_to_phys(struct device *dev, dma_addr_t addr)
> -{
> -	return 0;
> -}
> -
>  /*********************************************************************=
*********
>   * PCI
>   *********************************************************************=
********/
>=20


--mAcvITMcbs6fh3jk2cQLl3oKxLsrMnjHg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWQ8YHAAoJEHYLnGJQkpH7v8gP/3hV5Tt97RYfREFdb3V4P+CJ
bn9/35LZjvR3jrhAzTfNP+XvN8QSyagVRGJ09Pb1NdoEufLmeAMUJPr2MIqjC9Jt
t3jdXu3HXUJPWZsLtEMYwwFIkljjTZmafuCpKYV7SwAhTeq59x5sn43uUYXWiE06
pFDam+1+DZ1OlE3/ZNLExRA1N2YL4+0Jo74F8DPNf8UAQPZGYW2c17rdxrLUkG0M
YtCWcXhnePF04tebrgp99AgCoqICYZofurC1R3hWspZIhvj4pwslUO2YJXQTG4Fi
RWa+h7bFW1KK3wNnfX66WipxNOMn26O+81rAVe0gwXPco7XT8gvUWAevFiMv29OX
dGAVajBc/Ef34/+mWKZBNzueNh12hW8nqudy4tJCPI5miofsvn+RPll12bJbBFi7
xXtn81KzMQ0r0wBGdWZGFp9mYvrJbkJu4hDoffXzskMVUVdXIsKG26nkGN2uV5Kp
xXhQys+QtOJZAeg0YiX9VqtG5nygJxxhs57NtAZDLoF87jA2PE5H/C9ZbHkrV00W
qf86BPmCLx6Gpx3Bh0HSX5pT7gOki1LhBvPVhvMBKaBKKEMwzJSAy3FvxhKIOOwe
ss95fS0ycQnkNojT+uZ1d9yAmzKsRfL5pHDNHaBnCTBHPUDGSUJ6J5zhahxto/RH
3g3AvQcrJX3clSOnpKiB
=V8WX
-----END PGP SIGNATURE-----

--mAcvITMcbs6fh3jk2cQLl3oKxLsrMnjHg--

--===============1765538553==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1765538553==--
