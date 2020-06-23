From: Ralph Campbell <rcampbell@nvidia.com>
Subject: Re: [RESEND PATCH 2/3] nouveau: fix mixed normal and device private
 page migration
Date: Mon, 22 Jun 2020 18:42:00 -0700
Message-ID: <730e85c9-33b5-9c57-7123-057b75cbbddf@nvidia.com>
References: <20200622233854.10889-1-rcampbell@nvidia.com>
 <20200622233854.10889-3-rcampbell@nvidia.com>
 <f2bf81df-8faa-0f51-3f74-cb3b31d96aad@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <f2bf81df-8faa-0f51-3f74-cb3b31d96aad@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: John Hubbard <jhubbard@nvidia.com>, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Jerome Glisse <jglisse@redhat.com>, Christoph Hellwig <hch@lst.de>, Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>
List-Id: nouveau.vger.kernel.org


On 6/22/20 5:30 PM, John Hubbard wrote:
> On 2020-06-22 16:38, Ralph Campbell wrote:
>> The OpenCL function clEnqueueSVMMigrateMem(), without any flags, will
>> migrate memory in the given address range to device private memory. The
>> source pages might already have been migrated to device private memory.
>> In that case, the source struct page is not checked to see if it is
>> a device private page and incorrectly computes the GPU's physical
>> address of local memory leading to data corruption.
>> Fix this by checking the source struct page and computing the correct
>> physical address.
>>
>> Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
>> ---
>> =C2=A0 drivers/gpu/drm/nouveau/nouveau_dmem.c | 8 ++++++++
>> =C2=A0 1 file changed, 8 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/no=
uveau/nouveau_dmem.c
>> index cc9993837508..f6a806ba3caa 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
>> +++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
>> @@ -540,6 +540,12 @@ static unsigned long nouveau_dmem_migrate_copy_one(=
struct nouveau_drm *drm,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!(src & MIGRATE_PFN_MIGRATE))
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto out;
>> +=C2=A0=C2=A0=C2=A0 if (spage && is_device_private_page(spage)) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 paddr =3D nouveau_dmem_page_=
addr(spage);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *dma_addr =3D DMA_MAPPING_ER=
ROR;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto done;
>> +=C2=A0=C2=A0=C2=A0 }
>> +
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dpage =3D nouveau_dmem_page_alloc_locked(=
drm);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!dpage)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto out;
>> @@ -560,6 +566,7 @@ static unsigned long nouveau_dmem_migrate_copy_one(s=
truct nouveau_drm *drm,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 goto out_free_page;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> +done:
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *pfn =3D NVIF_VMM_PFNMAP_V0_V | NVIF_VMM_=
PFNMAP_V0_VRAM |
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ((paddr >> PAGE_S=
HIFT) << NVIF_VMM_PFNMAP_V0_ADDR_SHIFT);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (src & MIGRATE_PFN_WRITE)
>> @@ -615,6 +622,7 @@ nouveau_dmem_migrate_vma(struct nouveau_drm *drm,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct migrate_vma args =3D {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .vma=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D vma,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .start=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D start,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .src_owner=C2=A0=C2=A0=C2=A0=
 =3D drm->dev,
>=20
> Hi Ralph,
>=20
> This .src_owner setting does look like a required fix, but it seems like
> a completely separate fix from what is listed in this patch's commit
> description, right? (It feels like a casualty of rearranging the patches.=
)
>=20
>=20
> thanks,

It's a bit more complex. There is a catch-22 here with the change to mm/mig=
rate.c.
Without this patch or mm/migrate.c, a second call to clEnqueueSVMMigrateMem=
()
for the same address range will invalidate the GPU mapping to device privat=
e memory
created by the first call.
With this patch but not mm/migrate.c, the first call to clEnqueueSVMMigrate=
Mem()
will fail to migrate normal anonymous memory to device private memory.
Without this patch but including the change to mm/migrate.c, a second call =
to
clEnqueueSVMMigrateMem() will crash the kernel because dma_map_page() will =
be
called with the device private PFN which is not a valid CPU physical addres=
s.
With both changes, a range of anonymous and device private pages can be mig=
rated
to the GPU and the GPU page tables updated properly.
