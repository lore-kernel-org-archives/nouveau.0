From: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH hmm 4/5] mm/hmm: remove HMM_PFN_SPECIAL
Date: Wed, 22 Apr 2020 07:53:11 +0200
Message-ID: <20200422055311.GC22366@lst.de>
References: <0-v1-4eb72686de3c+5062-hmm_no_flags_jgg@mellanox.com>
 <4-v1-4eb72686de3c+5062-hmm_no_flags_jgg@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <intel-gfx-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <4-v1-4eb72686de3c+5062-hmm_no_flags_jgg@mellanox.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: "David (ChunMing) Zhou" <David1.Zhou@amd.com>, Ralph Campbell <rcampbell@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, Christoph Hellwig <hch@lst.de>, linux-mm@kvack.org, =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>, Ben Skeggs <bskeggs@redhat.com>, nouveau@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>, "Kuehling,
 Felix" <Felix.Kuehling@amd.com>, intel-gfx@lists.freedesktop.org, Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
List-Id: nouveau.vger.kernel.org

On Tue, Apr 21, 2020 at 09:21:45PM -0300, Jason Gunthorpe wrote:
> From: Jason Gunthorpe <jgg@mellanox.com>
> 
> This is just an alias for HMM_PFN_ERROR, nothing cares that the error was
> because of a special page vs any other error case.

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>
