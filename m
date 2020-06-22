From: Ralph Campbell <rcampbell@nvidia.com>
Subject: Re: [PATCH 14/16] mm/thp: add THP allocation helper
Date: Mon, 22 Jun 2020 14:33:06 -0700
Message-ID: <21d571c4-8442-82df-4baf-e5d1c2ced99d@nvidia.com>
References: <20200619215649.32297-1-rcampbell@nvidia.com>
 <20200619215649.32297-15-rcampbell@nvidia.com>
 <9948121A-CA52-494F-9B68-6C0089E15057@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <9948121A-CA52-494F-9B68-6C0089E15057@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Zi Yan <ziy@nvidia.com>
Cc: nouveau@lists.freedesktop.org, linux-rdma@vger.kernel.org, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, Jerome Glisse <jglisse@redhat.com>, John Hubbard <jhubbard@nvidia.com>, Christoph Hellwig <hch@lst.de>, Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>
List-Id: nouveau.vger.kernel.org


On 6/21/20 5:15 PM, Zi Yan wrote:
> On 19 Jun 2020, at 17:56, Ralph Campbell wrote:
>=20
>> Transparent huge page allocation policy is controlled by several sysfs
>> variables. Rather than expose these to each device driver that needs to
>> allocate THPs, provide a helper function.
>>
>> Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
>> ---
>>   include/linux/gfp.h | 10 ++++++++++
>>   mm/huge_memory.c    | 16 ++++++++++++++++
>>   2 files changed, 26 insertions(+)
>>
>> diff --git a/include/linux/gfp.h b/include/linux/gfp.h
>> index 67a0774e080b..1c7d968a27d3 100644
>> --- a/include/linux/gfp.h
>> +++ b/include/linux/gfp.h
>> @@ -562,6 +562,16 @@ extern struct page *alloc_pages_vma(gfp_t gfp_mask,=
 int order,
>>   	alloc_pages_vma(gfp_mask, 0, vma, addr, numa_node_id(), false)
>>   #define alloc_page_vma_node(gfp_mask, vma, addr, node)		\
>>   	alloc_pages_vma(gfp_mask, 0, vma, addr, node, false)
>> +#ifdef CONFIG_ARCH_ENABLE_THP_MIGRATION
>> +extern struct page *alloc_transhugepage(struct vm_area_struct *vma,
>> +					unsigned long addr);
>> +#else
>> +static inline struct page *alloc_transhugepage(struct vm_area_struct *v=
ma,
>> +						unsigned long addr)
>> +{
>> +	return NULL;
>> +}
>> +#endif
>>
>>   extern unsigned long __get_free_pages(gfp_t gfp_mask, unsigned int ord=
er);
>>   extern unsigned long get_zeroed_page(gfp_t gfp_mask);
>> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
>> index 25d95f7b1e98..f749633ed350 100644
>> --- a/mm/huge_memory.c
>> +++ b/mm/huge_memory.c
>> @@ -775,6 +775,22 @@ vm_fault_t do_huge_pmd_anonymous_page(struct vm_fau=
lt *vmf)
>>   	return __do_huge_pmd_anonymous_page(vmf, page, gfp);
>>   }
>>
>> +#ifdef CONFIG_ARCH_ENABLE_THP_MIGRATION
>> +struct page *alloc_transhugepage(struct vm_area_struct *vma,
>> +				 unsigned long haddr)
>> +{
>> +	gfp_t gfp;
>> +	struct page *page;
>> +
>> +	gfp =3D alloc_hugepage_direct_gfpmask(vma);
>> +	page =3D alloc_hugepage_vma(gfp, vma, haddr, HPAGE_PMD_ORDER);
>> +	if (page)
>> +		prep_transhuge_page(page);
>> +	return page;
>> +}
>> +EXPORT_SYMBOL_GPL(alloc_transhugepage);
>> +#endif
>> +
>>   static void insert_pfn_pmd(struct vm_area_struct *vma, unsigned long a=
ddr,
>>   		pmd_t *pmd, pfn_t pfn, pgprot_t prot, bool write,
>>   		pgtable_t pgtable)
>> --=20
>> 2.20.1
>=20
> Why use CONFIG_ARCH_ENABLE_THP_MIGRATION to guard THP allocator helper?
> Shouldn=E2=80=99t CONFIG_TRANSPARENT_HUGEPAGE be used? Also the helper st=
ill allocates
> a THP even if transparent_hugepage_enabled(vma) is false, which is wrong,=
 right?
>=20
>=20
> --
> Best Regards,
> Yan Zi
>=20

Oops, I'm not sure why I thought that was needed. The whole file is only co=
mpiled
if CONFIG_TRANSPARENT_HUGEPAGE is defined and the calls to alloc_hugepage_v=
ma()
and alloc_hugepage_direct_gfpmask() are unprotected just above this in
do_huge_pmd_anonymous_page(). I'll fix that in v2.

The helper is intended to be called by a device driver to allocate a THP wh=
en
migrating device private memory back to system memory. The THP should never=
 be
migrated to device private memory in the first place if
transparent_hugepage_enabled(vma) is false.
I suppose I could add a if (WARN_ON_ONCE()) return NULL as a sanity check.
The real checks are in migrate_vma_setup() and migrate_vma_pages().
