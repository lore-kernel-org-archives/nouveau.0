From: Jason Gunthorpe <jgg@mellanox.com>
Subject: Re: [PATCH v6 5/6] nouveau: use new mmu interval notifiers
Date: Thu, 16 Jan 2020 20:21:55 +0000
Message-ID: <20200116202151.GS20978@mellanox.com>
References: <20200113224703.5917-1-rcampbell@nvidia.com>
 <20200113224703.5917-6-rcampbell@nvidia.com>
 <20200114125957.GO20978@mellanox.com>
 <5845f50e-8bc0-8068-ee21-4f910beb1255@nvidia.com>
 <20200116160002.GL20978@mellanox.com>
 <01adb7dd-589e-2cde-4fa9-68baa44c0976@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <01adb7dd-589e-2cde-4fa9-68baa44c0976@nvidia.com>
Content-Language: en-US
Content-ID: <44E2456FEB759847AAF542E9DDA6A620@eurprd05.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ralph Campbell <rcampbell@nvidia.com>
Cc: "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>, Jerome Glisse <jglisse@redhat.com>, John Hubbard <jhubbard@nvidia.com>, Christoph Hellwig <hch@lst.de>, Andrew Morton <akpm@linux-foundation.org>, Ben Skeggs <bskeggs@redhat.com>, Shuah Khan <shuah@kernel.org>
List-Id: nouveau.vger.kernel.org

On Thu, Jan 16, 2020 at 12:16:30PM -0800, Ralph Campbell wrote:
> Can you point me to the latest ODP code? Seems like my understanding is
> quite off.

https://elixir.bootlin.com/linux/v5.5-rc6/source/drivers/infiniband/hw/mlx5=
/odp.c

Look for the word 'implicit'

mlx5_ib_invalidate_range() releases the interval_notifier when there are
no populated shadow PTEs in its leaf

pagefault_implicit_mr() creates an interval_notifier that covers the
level in the page table that needs population. Notice it just uses an
unlocked xa_load to find the page table level.

The locking is pretty tricky as it relies on RCU, but the fault flow
is fairly lightweight.

Jason
