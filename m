From: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH v6 1/6] mm/mmu_notifier: add
 mmu_interval_notifier_insert_safe()
Date: Thu, 16 Jan 2020 11:07:54 +0100
Message-ID: <20200116100754.GA16347@lst.de>
References: <20200113224703.5917-1-rcampbell@nvidia.com> <20200113224703.5917-2-rcampbell@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <owner-linux-mm@kvack.org>
Content-Disposition: inline
In-Reply-To: <20200113224703.5917-2-rcampbell@nvidia.com>
Sender: owner-linux-mm@kvack.org
To: Ralph Campbell <rcampbell@nvidia.com>
Cc: linux-rdma@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org, linux-kselftest@vger.kernel.org, Jerome Glisse <jglisse@redhat.com>, John Hubbard <jhubbard@nvidia.com>, Christoph Hellwig <hch@lst.de>, Jason Gunthorpe <jgg@mellanox.com>, Andrew Morton <akpm@linux-foundation.org>, Ben Skeggs <bskeggs@redhat.com>, Shuah Khan <shuah@kernel.org>
List-Id: nouveau.vger.kernel.org

The name is weird, normally we call functions like this _locked.

Additionally it will need a lockdep_assert_held to ensure the caller
actually holds the lock.
