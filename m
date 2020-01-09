From: Jason Gunthorpe <jgg@mellanox.com>
Subject: Re: [BUG] nouveau lockdep splat
Date: Thu, 9 Jan 2020 14:53:09 +0000
Message-ID: <20200109145305.GV20978@mellanox.com>
References: <20200109011640.19678-1-rcampbell@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200109011640.19678-1-rcampbell@nvidia.com>
Content-Language: en-US
Content-ID: <EFCCE5C3CA7FC54D9497CF2317C63284@eurprd05.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ralph Campbell <rcampbell@nvidia.com>
Cc: "linux-mm@kvack.org" <linux-mm@kvack.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, Jerome Glisse <jglisse@redhat.com>, John Hubbard <jhubbard@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>, Ben Skeggs <bskeggs@redhat.com>
List-Id: nouveau.vger.kernel.org

On Wed, Jan 08, 2020 at 05:16:40PM -0800, Ralph Campbell wrote:
> I hit this while testing HMM with nouveau on linux-5.5-rc5.
> I'm not a lockdep expert but my understanding of this is that an
> invalidation callback could potentially call kzalloc(GFP_KERNEL)
> which could cause another invalidation and recursively deadlock.
> Looking at the drivers/gpu/drm/nouveau/nvkm/ layer, I do see a
> number of places where GFP_KERNEL is used for allocations and I
> don't see an easy way to avoid that.

Not quite..

Any lock held by the invalidation callback becomes a lock where
GFP_KERNEL cannot be used within it's critical region.

Ie we can't have a notifier callback block on a lock which is held by
another thread which is blocked on GFP_KERNEL as we now risk
deadlocking on other mm locks if that allocation triggers reclaim.

AFAIK there is no fix from the core side. The driver must respect this
and be organized to deal with it. Daniel fixed the intel driver
already, I fixed RDMA recently, the other drivers must also be fixed.

Some choices
 - Split up the lock held by the notifier callback so it doesn't need
   to cover allocations
 - Use GFP_ATOMIC for allocations
 - Speculatively do allocations before obtaining the lock and free if
   they were not needed.

I suppose it will be some troublbe for nouveau, but it must be done
there..

Jason
