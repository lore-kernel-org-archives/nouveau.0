From: Ralph Campbell <rcampbell@nvidia.com>
Subject: Re: [PATCH hmm 0/5] Adjust hmm_range_fault() API
Date: Wed, 22 Apr 2020 12:09:09 -0700
Message-ID: <17ce2fdc-4f9f-7772-c10c-6f339a4183e8@nvidia.com>
References: <0-v1-4eb72686de3c+5062-hmm_no_flags_jgg@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <0-v1-4eb72686de3c+5062-hmm_no_flags_jgg@mellanox.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jason Gunthorpe <jgg@ziepe.ca>, linux-mm@kvack.org
Cc: Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>, =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>, "David (ChunMing) Zhou" <David1.Zhou@amd.com>, dri-devel@lists.freedesktop.org, "Kuehling, Felix" <Felix.Kuehling@amd.com>, Christoph Hellwig <hch@lst.de>, intel-gfx@lists.freedesktop.org, =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>, John Hubbard <jhubbard@nvidia.com>, linux-kernel@vger.kernel.org, Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>, nouveau@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org


On 4/21/20 5:21 PM, Jason Gunthorpe wrote:
> From: Jason Gunthorpe <jgg@mellanox.com>
> 
> The API is a bit complicated for the uses we actually have, and
> disucssions for simplifying have come up a number of times.
> 
> This small series removes the customizable pfn format and simplifies the
> return code of hmm_range_fault()
> 
> All the drivers are adjusted to process in the simplified format.
> I would appreciated tested-by's for the two drivers, thanks!

For nouveau you can add:
Tested-by: Ralph Campbell <rcampbell@nvidia.com>
