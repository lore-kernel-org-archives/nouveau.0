From: Zi Yan <ziy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 13/16] mm: support THP migration to device
 private memory
Date: Mon, 22 Jun 2020 16:10:45 -0400
Message-ID: <C7BEB563-3698-442C-A188-1B66CBE4CF63@nvidia.com>
References: <20200619215649.32297-1-rcampbell@nvidia.com>
 <20200619215649.32297-14-rcampbell@nvidia.com>
 <F1872509-3B1F-4A8A-BFF5-E4D44E451920@nvidia.com>
 <b6eed976-c515-72d6-a7be-2296cab8f0d4@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1129398036=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <b6eed976-c515-72d6-a7be-2296cab8f0d4-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, Jason Gunthorpe <jgg-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-kselftest-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Shuah Khan <shuah-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
List-Id: nouveau.vger.kernel.org

--===============1129398036==
Content-Type: multipart/signed;
	boundary="=_MailMate_48103850-4C7E-4E7F-8F24-58AD79C74F54_=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=_MailMate_48103850-4C7E-4E7F-8F24-58AD79C74F54_=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 22 Jun 2020, at 15:36, Ralph Campbell wrote:

> On 6/21/20 4:20 PM, Zi Yan wrote:
>> On 19 Jun 2020, at 17:56, Ralph Campbell wrote:
>>
>>> Support transparent huge page migration to ZONE_DEVICE private memory=
=2E
>>> A new flag (MIGRATE_PFN_COMPOUND) is added to the input PFN array to
>>> indicate the huge page was fully mapped by the CPU.
>>> Export prep_compound_page() so that device drivers can create huge
>>> device private pages after calling memremap_pages().
>>>
>>> Signed-off-by: Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>> ---
>>>   include/linux/migrate.h |   1 +
>>>   include/linux/mm.h      |   1 +
>>>   mm/huge_memory.c        |  30 ++++--
>>>   mm/internal.h           |   1 -
>>>   mm/memory.c             |  10 +-
>>>   mm/memremap.c           |   9 +-
>>>   mm/migrate.c            | 226 ++++++++++++++++++++++++++++++++-----=
---
>>>   mm/page_alloc.c         |   1 +
>>>   8 files changed, 226 insertions(+), 53 deletions(-)
>>>
>>> diff --git a/include/linux/migrate.h b/include/linux/migrate.h
>>> index 3e546cbf03dd..f6a64965c8bd 100644
>>> --- a/include/linux/migrate.h
>>> +++ b/include/linux/migrate.h
>>> @@ -166,6 +166,7 @@ static inline int migrate_misplaced_transhuge_pag=
e(struct mm_struct *mm,
>>>   #define MIGRATE_PFN_MIGRATE	(1UL << 1)
>>>   #define MIGRATE_PFN_LOCKED	(1UL << 2)
>>>   #define MIGRATE_PFN_WRITE	(1UL << 3)
>>> +#define MIGRATE_PFN_COMPOUND	(1UL << 4)
>>>   #define MIGRATE_PFN_SHIFT	6
>>>
>>>   static inline struct page *migrate_pfn_to_page(unsigned long mpfn)
>>> diff --git a/include/linux/mm.h b/include/linux/mm.h
>>> index dc7b87310c10..020b9dd3cddb 100644
>>> --- a/include/linux/mm.h
>>> +++ b/include/linux/mm.h
>>> @@ -932,6 +932,7 @@ static inline unsigned int page_shift(struct page=
 *page)
>>>   }
>>>
>>>   void free_compound_page(struct page *page);
>>> +void prep_compound_page(struct page *page, unsigned int order);
>>>
>>>   #ifdef CONFIG_MMU
>>>   /*
>>> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
>>> index 78c84bee7e29..25d95f7b1e98 100644
>>> --- a/mm/huge_memory.c
>>> +++ b/mm/huge_memory.c
>>> @@ -1663,23 +1663,35 @@ int zap_huge_pmd(struct mmu_gather *tlb, stru=
ct vm_area_struct *vma,
>>>   	} else {
>>>   		struct page *page =3D NULL;
>>>   		int flush_needed =3D 1;
>>> +		bool is_anon =3D false;
>>>
>>>   		if (pmd_present(orig_pmd)) {
>>>   			page =3D pmd_page(orig_pmd);
>>> +			is_anon =3D PageAnon(page);
>>>   			page_remove_rmap(page, true);
>>>   			VM_BUG_ON_PAGE(page_mapcount(page) < 0, page);
>>>   			VM_BUG_ON_PAGE(!PageHead(page), page);
>>>   		} else if (thp_migration_supported()) {
>>>   			swp_entry_t entry;
>>>
>>> -			VM_BUG_ON(!is_pmd_migration_entry(orig_pmd));
>>>   			entry =3D pmd_to_swp_entry(orig_pmd);
>>> -			page =3D pfn_to_page(swp_offset(entry));
>>> +			if (is_device_private_entry(entry)) {
>>> +				page =3D device_private_entry_to_page(entry);
>>> +				is_anon =3D PageAnon(page);
>>> +				page_remove_rmap(page, true);
>>> +				VM_BUG_ON_PAGE(page_mapcount(page) < 0, page);
>>> +				VM_BUG_ON_PAGE(!PageHead(page), page);
>>> +				put_page(page);
>>
>> Why do you hide this code behind thp_migration_supported()? It seems t=
hat you just need
>> pmd swap entry not pmd migration entry. Also the condition is not cons=
istent with the code
>> in __handle_mm_fault(), in which you handle is_device_private_entry() =
directly without
>> checking thp_migration_support().
>
> Good point, I think "else if (thp_migration_supported())" should be
> "else if (is_pmd_migration_entry(orig_pmd))" since if the PMD *is*
> a device private or migration entry, then it should be handled and the
> VM_BUG_ON() should be that thp_migration_supported() is true
> (or maybe remove the VM_BUG_ON?).

I disagree. A device private entry is independent of a PMD migration entr=
y, since a device private
entry is just a swap entry, which is available when CONFIG_TRANSPARENT_HU=
GEPAGE. So for architectures
support THP but not THP migration (like ARM64), your code should still wo=
rk.

I would suggest you to check all the use of is_swap_pmd() and make sure t=
he code
can handle is_device_private_entry().

For new device private code, you might need to guard it either statically=
 or dynamically in case
CONFIG_DEVICE_PRIVATE is disabled. Potentially, you would like to make su=
re a system without
CONFIG_DEVICE_PRIVATE will not see is_device_private_entry() =3D=3D true =
and give errors when it does.


>
>> Do we need to support split_huge_pmd() if a page is migrated to device=
? Any new code
>> needed in split_huge_pmd()?
>
> I was thinking that any CPU usage of the device private page would caus=
e it to be
> migrated back to system memory as a whole PMD/PUD page but I'll double =
check.
> At least there should be a check that the page isn't a device private p=
age.

Well, that depends. If we can allocate a THP on CPU memory, we can migrat=
e the whole page back.
But if no THP is allocated due to low on free memory or memory fragmentat=
ion, I think you
might need a fallback plan, either splitting the device private page and =
migrating smaller
pages instead or reclaiming CPU memory until you get a THP. IMHO, the for=
mer might be preferred,
since the latter might cost a lot of CPU cycles but still gives no THP af=
ter all.



=E2=80=94
Best Regards,
Yan Zi

--=_MailMate_48103850-4C7E-4E7F-8F24-58AD79C74F54_=
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJDBAEBCgAtFiEEh7yFAW3gwjwQ4C9anbJR82th+ooFAl7xEEUPHHppeUBudmlk
aWEuY29tAAoJEJ2yUfNrYfqKYSoP/Rjt9LBjM+NzAfwgzfrswt10MroG1LEsGSOi
6d+od98EjIztweYrQvgYzzTL+h1Z7VJ6Z8jp2sqhm9aqZ64Rg+wCYiX/wmUQ+gYU
Sva39zxKUsSgM/Ik1tQeKs1rtOKAq8rlbnpT42TMFwtMbxUjfYhfTH0C8llg6Ins
vnLreKOAuQtE6lCZi2+ofWWqIARZvkhcBGwS4BFei3k1h/SNi43rK8eGHgGdyM3v
ZrXktuWE2naGY5qs1o7MfIVKbyWyBQ5t/IIvbh2VADjwP0uLpdJcRxaG6Hiafml8
J9MrjIKnZj2OUvN/Ic2W1n4PWnjCjbClPKKKlHze7LSmqFMnzPikiR/jbBF3XhQH
UwLhNX2nubyJJq63CXjlaU2jUdqRqFA/u3VCcCp7LcBUHOemqURV65GT+PZ6CjyA
RkZZPTkeD6NTzP7QRtF2Q568Olt6aZZOfSNGYHsbxWTCwqAM7rjOXttIijilGS42
O15jkvrgeGTWbGhAP6ysyMKtQztrrr0UiBvP4ljLaGNTHn1dIU6jZeMybq0TWHGP
zsn8FLDGsDNsneYK8PLY9rDAsZ1rIq7bqVTVi4AbfrVxTtYcblnvdEuQVBvE+4bT
n11xLUaei+keSUBU2h0cxsk8kWd/If9R1Wvv/bULCg40LDn8He05P9FDmP6s0NQp
UN85D1l4
=g7TJ
-----END PGP SIGNATURE-----

--=_MailMate_48103850-4C7E-4E7F-8F24-58AD79C74F54_=--

--===============1129398036==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1129398036==--
