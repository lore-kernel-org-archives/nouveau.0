From: Ralph Campbell <rcampbell@nvidia.com>
Subject: Re: [PATCH v2] nouveau/hmm: map pages after migration
Date: Tue, 3 Mar 2020 13:15:21 -0800
Message-ID: <1f27ac9e-7ddf-6e4f-25ea-063ef6c78761@nvidia.com>
References: <20200303010023.2983-1-rcampbell@nvidia.com>
 <20200303124229.GH26318@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200303124229.GH26318@mellanox.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jason Gunthorpe <jgg@mellanox.com>
Cc: dri-devel@lists.freedesktop.org, linux-rdma@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org, Jerome Glisse <jglisse@redhat.com>, John Hubbard <jhubbard@nvidia.com>, Christoph Hellwig <hch@lst.de>, Andrew Morton <akpm@linux-foundation.org>, Ben Skeggs <bskeggs@redhat.com>
List-Id: nouveau.vger.kernel.org


On 3/3/20 4:42 AM, Jason Gunthorpe wrote:
> On Mon, Mar 02, 2020 at 05:00:23PM -0800, Ralph Campbell wrote:
>> When memory is migrated to the GPU, it is likely to be accessed by GPU
>> code soon afterwards. Instead of waiting for a GPU fault, map the
>> migrated memory into the GPU page tables with the same access permission=
s
>> as the source CPU page table entries. This preserves copy on write
>> semantics.
>>
>> Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
>> Cc: Christoph Hellwig <hch@lst.de>
>> Cc: Jason Gunthorpe <jgg@mellanox.com>
>> Cc: "J=C3=A9r=C3=B4me Glisse" <jglisse@redhat.com>
>> Cc: Ben Skeggs <bskeggs@redhat.com>
>> ---
>>
>> Originally this patch was targeted for Jason's rdma tree since other HMM
>> related changes were queued there. Now that those have been merged, this
>> patch just contains changes to nouveau so it could go through any tree.
>> I guess Ben Skeggs' tree would be appropriate.
>=20
> Yep
>=20
>> +static inline struct nouveau_pfnmap_args *
>> +nouveau_pfns_to_args(void *pfns)
>=20
> don't use static inline inside C files

OK.

>> +{
>> +	struct nvif_vmm_pfnmap_v0 *p =3D
>> +		container_of(pfns, struct nvif_vmm_pfnmap_v0, phys);
>> +
>> +	return container_of(p, struct nouveau_pfnmap_args, p);
>=20
> And this should just be
>=20
>     return container_of(pfns, struct nouveau_pfnmap_args, p.phys);

Much simpler, thanks.

>> +static struct nouveau_svmm *
>> +nouveau_find_svmm(struct nouveau_svm *svm, struct mm_struct *mm)
>> +{
>> +	struct nouveau_ivmm *ivmm;
>> +
>> +	list_for_each_entry(ivmm, &svm->inst, head) {
>> +		if (ivmm->svmm->notifier.mm =3D=3D mm)
>> +			return ivmm->svmm;
>> +	}
>> +	return NULL;
>> +}
>=20
> Is this re-implementing mmu_notifier_get() ?
>=20
> Jason

Not quite. This is being called from an ioctl() call on the GPU device
file which calls nouveau_svmm_bind() which locks mmap_sem for reading,
walks the vmas for the address range given in the ioctl() data, and migrate=
s
the pages to the GPU memory.
mmu_notifier_get() would try to lock mmap_sem for writing so that would dea=
dlock.
But it is similar in that the GPU specific process context (nouveau_svmm) n=
eeds
to be found for the given ioctl caller.
If find_get_mmu_notifier() was exported, I think that could work.
Now that I look at this again, there is an easier way to find the svmm and =
I see
some other bugs that need fixing. I'll post a v3 as soon as I get those wri=
tten
and tested.

Thanks for the review.
