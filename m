From: Zi Yan <ziy@nvidia.com>
Subject: Re: [PATCH 4/6] mm/hmm: add output flag for compound page mapping
Date: Tue, 26 May 2020 18:29:34 -0400
Message-ID: <B0BF5621-FEF9-446C-AAD9-81EFA1416EB1@nvidia.com>
References: <20200508192009.15302-1-rcampbell@nvidia.com>
 <20200508192009.15302-5-rcampbell@nvidia.com> <20200508195129.GA19740@lst.de>
 <1ec0511f-e6eb-3e11-ad6d-ad4e5b107464@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
        boundary="=_MailMate_4B5C64C4-2994-4ABE-B17A-646474CC0806_=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1ec0511f-e6eb-3e11-ad6d-ad4e5b107464@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ralph Campbell <rcampbell@nvidia.com>
Cc: Christoph Hellwig <hch@lst.de>, nouveau@lists.freedesktop.org, linux-rdma@vger.kernel.org, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, Jerome Glisse <jglisse@redhat.com>, John Hubbard <jhubbard@nvidia.com>, Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>, willy@infradead.org
List-Id: nouveau.vger.kernel.org

--=_MailMate_4B5C64C4-2994-4ABE-B17A-646474CC0806_=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 8 May 2020, at 16:06, Ralph Campbell wrote:

> On 5/8/20 12:51 PM, Christoph Hellwig wrote:
>> On Fri, May 08, 2020 at 12:20:07PM -0700, Ralph Campbell wrote:
>>> hmm_range_fault() returns an array of page frame numbers and flags fo=
r
>>> how the pages are mapped in the requested process' page tables. The P=
FN
>>> can be used to get the struct page with hmm_pfn_to_page() and the pag=
e size
>>> order can be determined with compound_order(page) but if the page is =
larger
>>> than order 0 (PAGE_SIZE), there is no indication that the page is map=
ped
>>> using a larger page size. To be fully general, hmm_range_fault() woul=
d need
>>> to return the mapping size to handle cases like a 1GB compound page b=
eing
>>> mapped with 2MB PMD entries. However, the most common case is the map=
ping
>>> size the same as the underlying compound page size.
>>> Add a new output flag to indicate this so that callers know it is saf=
e to
>>> use a large device page table mapping if one is available.
>>
>> Why do you need the flag?  The caller should be able to just use
>> page_size() (or willys new thp_size helper).
>>
>
> The question is whether or not a large page can be mapped with smaller
> page table entries with different permissions. If one process has a 2MB=

> page mapped with 4K PTEs with different read/write permissions, I don't=
 think
> it would be OK for a device to map the whole 2MB with write access enab=
led.
> The flag is supposed to indicate that the whole page can be mapped by t=
he
> device with the indicated read/write permissions.

If hmm_range_fault() only walks one VMA at a time, you would not have thi=
s permission
issue, right? Since all pages from one VMA should have the same permissio=
n.
But it seems that hmm_range_fault() deals with pages across multiple VMAs=
=2E
Maybe we should make hmm_range_fault() bail out early when it encounters
a VMA with a different permission than the existing ones?


=E2=80=94
Best Regards,
Yan Zi

--=_MailMate_4B5C64C4-2994-4ABE-B17A-646474CC0806_=
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJDBAEBCgAtFiEEh7yFAW3gwjwQ4C9anbJR82th+ooFAl7NmE8PHHppeUBudmlk
aWEuY29tAAoJEJ2yUfNrYfqKjycP/3XJhZ/XUzVmTxYQ6iRjWJrpB2rP0Qm21PvT
aJJd4WglE/dotbUGatNjl86bKqfhWVyQSbwPFnsc94YTkkAazZh8FspW6mV2WdQ+
1itzDfkls+hAAXuJcWOOnw23UY5+y8Hy/tfsrqr0sP6UNvJ3wuyXDMBmbQVSyvur
Aa6SAZNJv7LG1YdCJfCI3X92aSziGBd7s3/1Kz2AUagsvP20T4jygQo+6lgepNzy
hEdUKBstpN1T3sRVom1n4BYJK+kDrRVfiYdCFrhJ9ZTIu3K9snEWrsMRSnx7wSX2
dxSZwVx+dqOokDM5DhYZWyif1X0/JZzq7v0P4BNuUJkpXZrCutqQP6nvGxsR+QVX
5GgkLzeUOUqnFJvljtiSkwjUPRblljGFo9WDGEnrVNTDG7uZf56Qz6SdQPwLR9GK
Vsk8saRYhZ6YHPE8QtuByliBhzzZfIUK7oafU8e/1QEo/0zFdL+QEbfUR61/nHpK
WkHcnZRxJ5EGmfGGk4dYq+soIl+0g3oMWIDQ2QFMA1RPf3pzOR595P5ldo6KgPSo
N+euHyai7HSurTxdE4JgN27uM9/d9yq0X3uQGwW/a/Fq3EhiAiUJnfd4s375Wd2y
qcsaP5rxatQo0EeVnGs2vwXgG3f3vFYVhs4FRRogl5EEQE36Y81uLm+pZmjoKfyf
eGcZSDTZ
=zDv+
-----END PGP SIGNATURE-----

--=_MailMate_4B5C64C4-2994-4ABE-B17A-646474CC0806_=--
