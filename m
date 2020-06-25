From: Ralph Campbell <rcampbell@nvidia.com>
Subject: Re: [RESEND PATCH 2/3] nouveau: fix mixed normal and device private
 page migration
Date: Thu, 25 Jun 2020 10:25:38 -0700
Message-ID: <a9aba057-3786-8204-f782-6e8f3c290b35@nvidia.com>
References: <20200622233854.10889-1-rcampbell@nvidia.com>
 <20200622233854.10889-3-rcampbell@nvidia.com> <20200624072355.GB18609@lst.de>
 <330f6a82-d01d-db97-1dec-69346f41e707@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <330f6a82-d01d-db97-1dec-69346f41e707@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Christoph Hellwig <hch@lst.de>
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org, Jerome Glisse <jglisse@redhat.com>, John Hubbard <jhubbard@nvidia.com>, Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, Bharata B Rao <bharata@linux.ibm.com>
List-Id: nouveau.vger.kernel.org

Making sure to include linux-mm and Bharata B Rao for IBM's
use of migrate_vma*().

On 6/24/20 11:10 AM, Ralph Campbell wrote:
>=20
> On 6/24/20 12:23 AM, Christoph Hellwig wrote:
>> On Mon, Jun 22, 2020 at 04:38:53PM -0700, Ralph Campbell wrote:
>>> The OpenCL function clEnqueueSVMMigrateMem(), without any flags, will
>>> migrate memory in the given address range to device private memory. The
>>> source pages might already have been migrated to device private memory.
>>> In that case, the source struct page is not checked to see if it is
>>> a device private page and incorrectly computes the GPU's physical
>>> address of local memory leading to data corruption.
>>> Fix this by checking the source struct page and computing the correct
>>> physical address.
>>
>> I'm really worried about all this delicate code to fix the mixed
>> ranges.=C2=A0 Can't we make it clear at the migrate_vma_* level if we wa=
nt
>> to migrate from or two device private memory, and then skip all the work
>> for regions of memory that already are in the right place?=C2=A0 This mi=
ght be
>> a little more work initially, but I think it leads to a much better
>> API.
>>
>=20
> The current code does encode the direction with src_owner !=3D NULL meani=
ng
> device private to system memory and src_owner =3D=3D NULL meaning system
> memory to device private memory. This patch would obviously defeat that
> so perhaps a flag could be added to the struct migrate_vma to indicate th=
e
> direction but I'm unclear how that makes things less delicate.
> Can you expand on what you are worried about?
>=20
> The issue with invalidations might be better addressed by letting the dev=
ice
> driver handle device private page TLB invalidations when migrating to
> system memory and changing migrate_vma_setup() to only invalidate CPU
> TLB entries for normal pages being migrated to device private memory.
> If a page isn't migrating, it seems inefficient to invalidate those TLB
> entries.
>=20
> Any other suggestions?

After a night's sleep, I think this might work. What do others think?

1) Add a new MMU_NOTIFY_MIGRATE enum to mmu_notifier_event.

2) Change migrate_vma_collect() to use the new MMU_NOTIFY_MIGRATE event typ=
e.

3) Modify nouveau_svmm_invalidate_range_start() to simply return (no invali=
dations)
for MMU_NOTIFY_MIGRATE mmu notifier callbacks.

4) Leave the src_owner check in migrate_vma_collect_pmd() for normal pages =
so if the
device driver is migrating normal pages to device private memory, the drive=
r would
set src_owner =3D NULL and already migrated device private pages would be s=
kipped.
Since the mmu notifier callback did nothing, the device private entries rem=
ain valid
in the device's MMU. migrate_vma_collect_pmd() would still invalidate the C=
PU page
tables for migrated normal pages.
If the driver is migrating device private pages to system memory, it would =
set
src_owner !=3D NULL, normal pages would be skipped, but now the device driv=
er has to
invalidate device MMU mappings in the "alloc and copy" before doing the cop=
y.
This would be after migrate_vma_setup() returns so the list of migrating de=
vice
pages is known to the driver.

The rest of the migrate_vma_pages() and migrate_vma_finalize() remain the s=
ame.
