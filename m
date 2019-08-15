From: Ralph Campbell <rcampbell@nvidia.com>
Subject: Re: turn hmm migrate_vma upside down v3
Date: Wed, 14 Aug 2019 17:09:54 -0700
Message-ID: <8e3b17ef-0b9e-6866-128f-403c8ba3a322@nvidia.com>
References: <20190814075928.23766-1-hch@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190814075928.23766-1-hch@lst.de>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Christoph Hellwig <hch@lst.de>, =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>
Cc: Bharata B Rao <bharata@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org


On 8/14/19 12:59 AM, Christoph Hellwig wrote:
> Hi J=C3=A9r=C3=B4me, Ben and Jason,
>=20
> below is a series against the hmm tree which starts revamping the
> migrate_vma functionality.  The prime idea is to export three slightly
> lower level functions and thus avoid the need for migrate_vma_ops
> callbacks.
>=20
> Diffstat:
>=20
>      7 files changed, 282 insertions(+), 614 deletions(-)
>=20
> A git tree is also available at:
>=20
>      git://git.infradead.org/users/hch/misc.git migrate_vma-cleanup.3
>=20
> Gitweb:
>=20
>      http://git.infradead.org/users/hch/misc.git/shortlog/refs/heads/migr=
ate_vma-cleanup.3
>=20
>=20
> Changes since v2:
>   - don't unmap pages when returning 0 from nouveau_dmem_migrate_to_ram
>   - minor style fixes
>   - add a new patch to remove CONFIG_MIGRATE_VMA_HELPER
>=20
> Changes since v1:
>   - fix a few whitespace issues
>   - drop the patch to remove MIGRATE_PFN_WRITE for now
>   - various spelling fixes
>   - clear cpages and npages in migrate_vma_setup
>   - fix the nouveau_dmem_fault_copy_one return value
>   - minor improvements to some nouveau internal calling conventions
>=20

Some of the patches seem to have been mangled in the mail.
I was able to edit them and apply to Jason's tree
https://github.com/jgunthorpe/linux.git mmu_notifier branch.
So for the series you can add:

Tested-by: Ralph Campbell <rcampbell@nvidia.com>
