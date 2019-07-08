From: Ralph Campbell <rcampbell@nvidia.com>
Subject: Re: hmm_range_fault related fixes and legacy API removal v2
Date: Mon, 8 Jul 2019 10:30:55 -0700
Message-ID: <41dbb308-fc9e-d730-ffb0-6ce051dff1e1@nvidia.com>
References: <20190703220214.28319-1-hch@lst.de>
 <20190704164236.GP3401@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190704164236.GP3401@mellanox.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jason Gunthorpe <jgg@mellanox.com>, Christoph Hellwig <hch@lst.de>
Cc: =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>, Ben Skeggs <bskeggs@redhat.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: nouveau.vger.kernel.org


On 7/4/19 9:42 AM, Jason Gunthorpe wrote:
> On Wed, Jul 03, 2019 at 03:02:08PM -0700, Christoph Hellwig wrote:
>> Hi J=C3=A9r=C3=B4me, Ben and Jason,
>>
>> below is a series against the hmm tree which fixes up the mmap_sem
>> locking in nouveau and while at it also removes leftover legacy HMM APIs
>> only used by nouveau.
>>
>> Changes since v1:
>>   - don't return the valid state from hmm_range_unregister
>>   - additional nouveau cleanups
>=20
> Ralph, since most of this is nouveau could you contribute a
> Tested-by? Thanks
>=20
> Jason
>=20

I can test things fairly easily but with all the different patches,
conflicts, and personal git trees, can you specify the git tree
and branch with everything applied that you want me to test?
