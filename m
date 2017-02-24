From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] drm/nouveau: gk20a: Turn instmem lock into
 mutex
Date: Fri, 24 Feb 2017 17:59:05 +1000
Message-ID: <d9c0c711-0c4f-c7ab-3e4d-8b3c8c9d138e@gmail.com>
References: <20170130200307.18574-1-thierry.reding@gmail.com>
 <20170223162015.GA15693@ulmo.ba.sec>
 <6febf110-a04a-da21-20b4-638bde1eaf36@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0074672517=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <6febf110-a04a-da21-20b4-638bde1eaf36-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
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
--===============0074672517==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="IAAplb70Wd2B6cmdhI7EXoFjTMonMaTsK"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--IAAplb70Wd2B6cmdhI7EXoFjTMonMaTsK
Content-Type: multipart/mixed; boundary="9RPkwevHrNXQg4vc0Ijv8urgiFVNm5kHC"
From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Message-ID: <d9c0c711-0c4f-c7ab-3e4d-8b3c8c9d138e-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Nouveau] [PATCH] drm/nouveau: gk20a: Turn instmem lock into
 mutex
References: <20170130200307.18574-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
 <20170223162015.GA15693-EkSeR96xj6Pcmrwk2tT4+A@public.gmane.org>
 <6febf110-a04a-da21-20b4-638bde1eaf36-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
In-Reply-To: <6febf110-a04a-da21-20b4-638bde1eaf36-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--9RPkwevHrNXQg4vc0Ijv8urgiFVNm5kHC
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 02/24/2017 05:25 PM, Alexandre Courbot wrote:
> On 02/24/2017 01:20 AM, Thierry Reding wrote:
>> * PGP Signed by an unknown key
>>
>> On Mon, Jan 30, 2017 at 09:03:07PM +0100, Thierry Reding wrote:
>>> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>>
>>> The gk20a implementation of instance memory uses vmap()/vunmap() to m=
ap
>>> memory regions into the kernel's virtual address space. These functio=
ns
>>> may sleep, so protecting them by a spin lock is not safe. This trigge=
rs
>>> a warning if the DEBUG_ATOMIC_SLEEP Kconfig option is enabled. Fix th=
is
>>> by using a mutex instead.
>>>
>>> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>> ---
>>>  drivers/gpu/drm/nouveau/nvkm/subdev/instmem/gk20a.c | 19
>>> ++++++++-----------
>>>  1 file changed, 8 insertions(+), 11 deletions(-)
>>
>> Alex, could you take a look at this?
>=20
> Sorry! Yes, using a mutex here should be safe since vmap() can sleep
> anyway. And I don't think this code can ever be reached in atomic
> context (Ben can confirm that last point). Tested this patch and it
> seems to work like a charm.
That should be true on this chipset.  Though, if we ever need to touch
the grctx or something in response to an interrupt (iirc nvgpu does
this, maybe?), this could change.  Granted, we probably should switch to
threaded interrupts at some point anyway.

As it currently stands, it should be fine.

Ben.

>=20
> Reviewed-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Tested-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
>>
>> Thanks,
>> Thierry
>>
>>> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/gk20a.c
>>> b/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/gk20a.c
>>> index a6a7fa0d7679..7f5244d57d2f 100644
>>> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/gk20a.c
>>> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/gk20a.c
>>> @@ -94,7 +94,7 @@ struct gk20a_instmem {
>>>      struct nvkm_instmem base;
>>>
>>>      /* protects vaddr_* and gk20a_instobj::vaddr* */
>>> -    spinlock_t lock;
>>> +    struct mutex lock;
>>>
>>>      /* CPU mappings LRU */
>>>      unsigned int vaddr_use;
>>> @@ -184,11 +184,10 @@ gk20a_instobj_acquire_iommu(struct nvkm_memory
>>> *memory)
>>>      struct gk20a_instmem *imem =3D node->base.imem;
>>>      struct nvkm_ltc *ltc =3D imem->base.subdev.device->ltc;
>>>      const u64 size =3D nvkm_memory_size(memory);
>>> -    unsigned long flags;
>>>
>>>      nvkm_ltc_flush(ltc);
>>>
>>> -    spin_lock_irqsave(&imem->lock, flags);
>>> +    mutex_lock(&imem->lock);
>>>
>>>      if (node->base.vaddr) {
>>>          if (!node->use_cpt) {
>>> @@ -216,7 +215,7 @@ gk20a_instobj_acquire_iommu(struct nvkm_memory
>>> *memory)
>>>
>>>  out:
>>>      node->use_cpt++;
>>> -    spin_unlock_irqrestore(&imem->lock, flags);
>>> +    mutex_unlock(&imem->lock);
>>>
>>>      return node->base.vaddr;
>>>  }
>>> @@ -239,9 +238,8 @@ gk20a_instobj_release_iommu(struct nvkm_memory
>>> *memory)
>>>      struct gk20a_instobj_iommu *node =3D gk20a_instobj_iommu(memory)=
;
>>>      struct gk20a_instmem *imem =3D node->base.imem;
>>>      struct nvkm_ltc *ltc =3D imem->base.subdev.device->ltc;
>>> -    unsigned long flags;
>>>
>>> -    spin_lock_irqsave(&imem->lock, flags);
>>> +    mutex_lock(&imem->lock);
>>>
>>>      /* we should at least have one user to release... */
>>>      if (WARN_ON(node->use_cpt =3D=3D 0))
>>> @@ -252,7 +250,7 @@ gk20a_instobj_release_iommu(struct nvkm_memory
>>> *memory)
>>>          list_add_tail(&node->vaddr_node, &imem->vaddr_lru);
>>>
>>>  out:
>>> -    spin_unlock_irqrestore(&imem->lock, flags);
>>> +    mutex_unlock(&imem->lock);
>>>
>>>      wmb();
>>>      nvkm_ltc_invalidate(ltc);
>>> @@ -306,19 +304,18 @@ gk20a_instobj_dtor_iommu(struct nvkm_memory
>>> *memory)
>>>      struct gk20a_instmem *imem =3D node->base.imem;
>>>      struct device *dev =3D imem->base.subdev.device->dev;
>>>      struct nvkm_mm_node *r;
>>> -    unsigned long flags;
>>>      int i;
>>>
>>>      if (unlikely(list_empty(&node->base.mem.regions)))
>>>          goto out;
>>>
>>> -    spin_lock_irqsave(&imem->lock, flags);
>>> +    mutex_lock(&imem->lock);
>>>
>>>      /* vaddr has already been recycled */
>>>      if (node->base.vaddr)
>>>          gk20a_instobj_iommu_recycle_vaddr(node);
>>>
>>> -    spin_unlock_irqrestore(&imem->lock, flags);
>>> +    mutex_unlock(&imem->lock);
>>>
>>>      r =3D list_first_entry(&node->base.mem.regions, struct nvkm_mm_n=
ode,
>>>                   rl_entry);
>>> @@ -580,7 +577,7 @@ gk20a_instmem_new(struct nvkm_device *device, int=

>>> index,
>>>      if (!(imem =3D kzalloc(sizeof(*imem), GFP_KERNEL)))
>>>          return -ENOMEM;
>>>      nvkm_instmem_ctor(&gk20a_instmem, device, index, &imem->base);
>>> -    spin_lock_init(&imem->lock);
>>> +    mutex_init(&imem->lock);
>>>      *pimem =3D &imem->base;
>>>
>>>      /* do not allow more than 1MB of CPU-mapped instmem */
>>> --=20
>>> 2.11.0
>>>
>>
>> * Unknown Key
>> * 0x7F3EB3A1
>>
>=20
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau


--9RPkwevHrNXQg4vc0Ijv8urgiFVNm5kHC--

--IAAplb70Wd2B6cmdhI7EXoFjTMonMaTsK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEETp/uv2nr9kIVth0/dgucYlCSkfsFAliv58kACgkQdgucYlCS
kfs0wRAAgdttKalZ4IbimcJzt1e+c3kn3bQLUBWRZtVaTmrpBJMyiFd25TOzYN5J
yvSWHhcAWK9SRr7YFBiKQFvVpmx774ZXElyCysc0+bKPobekaqD8oQ+Ja/K2N4z/
vD+juSZBXlqJgRldyo+ysMzJ9sTUm6KKKQaWUEZaEJKfMSv5khlAqtXmMZ5k/U4N
XKF/YbUMOTGj12WsLz5Jg6O+xQ6tne27cOJ4VyHnQPFq15uOdGKvOVupGNvHj7ZW
w8sGskf/MDWQ9s0bFpk5KMkvLfcidafPOpSnpoSODI4FE+T0a+iwccL/R3WtfNjU
7vfwtC0Nz76c/pBmeARNJS2j5BGI0O+HbkL5atDI2HEeWnpcDZPPnWaOT00nKEnr
CDnzwNMDFMxHd5Q8rQ4LBefgzm87XD3OfGVV2fiis1OYJVYpaA12biJmEnEGT8VD
inSwueHdAU01IFfbQ4tW2rBBuNhQVUcRsondevwDpiQnhPmBme9//FgSIry13AfO
buJiZp/Xdqtt4fV4CM01pxqlIcf75E2boHGguQ+cuEqg/PmE5VL11RgBFtkiIfpF
+JNsGv8yZ/oBsnwxYoNNQ9G5HJbggjwOfZ1a470J36gtjBYviDKYKU/W/oNtp1AT
/Gfk3D20TwSl3J+FtUF2nD/rPkQuOuLNf+B7ihCcC7e9g14nMvI=
=/FZh
-----END PGP SIGNATURE-----

--IAAplb70Wd2B6cmdhI7EXoFjTMonMaTsK--

--===============0074672517==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0074672517==--
