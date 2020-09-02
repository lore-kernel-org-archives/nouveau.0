From: Ralph Campbell <rcampbell@nvidia.com>
Subject: Re: [PATCH v2 1/7] mm/thp: fix __split_huge_pmd_locked() for
 migration PMD
Date: Wed, 2 Sep 2020 15:02:43 -0700
Message-ID: <171f31cd-91e5-5c74-a68a-ec7cbd9bb450@nvidia.com>
References: <20200902165830.5367-1-rcampbell@nvidia.com>
 <20200902165830.5367-2-rcampbell@nvidia.com>
 <78B69571-13C6-4BF5-8478-6AAA4AB2C287@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <78B69571-13C6-4BF5-8478-6AAA4AB2C287@nvidia.com>
Content-Language: en-US
Sender: stable-owner@vger.kernel.org
To: Zi Yan <ziy@nvidia.com>
Cc: linux-mm@kvack.org, nouveau@lists.freedesktop.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, Jerome Glisse <jglisse@redhat.com>, John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, Christoph Hellwig <hch@lst.de>, Jason Gunthorpe <jgg@nvidia.com>, Bharata B Rao <bharata@linux.ibm.com>, Ben Skeggs <bskeggs@redhat.com>, Shuah Khan <shuah@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, stable@vger.kernel.org
List-Id: nouveau.vger.kernel.org


On 9/2/20 2:47 PM, Zi Yan wrote:
> On 2 Sep 2020, at 12:58, Ralph Campbell wrote:
>=20
>> A migrating transparent huge page has to already be unmapped. Otherwise,
>> the page could be modified while it is being copied to a new page and
>> data could be lost. The function __split_huge_pmd() checks for a PMD
>> migration entry before calling __split_huge_pmd_locked() leading one to
>> think that __split_huge_pmd_locked() can handle splitting a migrating PM=
D.
>> However, the code always increments the page->_mapcount and adjusts the
>> memory control group accounting assuming the page is mapped.
>> Also, if the PMD entry is a migration PMD entry, the call to
>> is_huge_zero_pmd(*pmd) is incorrect because it calls pmd_pfn(pmd) instea=
d
>> of migration_entry_to_pfn(pmd_to_swp_entry(pmd)).
>> Fix these problems by checking for a PMD migration entry.
>>
>> Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
>=20
> Thanks for the fix. You can add Reviewed-by: Zi Yan <ziy@nvidia.com>
>=20
> I think you also want to add the Fixes tag and cc stable.
>=20
> Fixes 84c3fc4e9c56 (=E2=80=9Cmm: thp: check pmd migration entry in common=
 path=E2=80=9D)
> cc: stable@vger.kernel.org # 4.14+

Thanks, I'll add these.
