From: Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v6 5/6] nouveau: use new mmu interval notifiers
Date: Wed, 19 Feb 2020 17:10:45 -0800
Message-ID: <770d0aab-726a-12b0-944d-ef71722ad587@nvidia.com>
References: <20200113224703.5917-1-rcampbell@nvidia.com>
 <20200113224703.5917-6-rcampbell@nvidia.com>
 <20200114125957.GO20978@mellanox.com>
 <5845f50e-8bc0-8068-ee21-4f910beb1255@nvidia.com>
 <20200116160002.GL20978@mellanox.com>
 <01adb7dd-589e-2cde-4fa9-68baa44c0976@nvidia.com>
 <20200116202151.GS20978@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20200116202151.GS20978-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Jason Gunthorpe <jgg-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
Cc: "linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org" <linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "linux-kselftest-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kselftest-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Shuah Khan <shuah-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
List-Id: nouveau.vger.kernel.org


On 1/16/20 12:21 PM, Jason Gunthorpe wrote:
> On Thu, Jan 16, 2020 at 12:16:30PM -0800, Ralph Campbell wrote:
>> Can you point me to the latest ODP code? Seems like my understanding is
>> quite off.
> 
> https://elixir.bootlin.com/linux/v5.5-rc6/source/drivers/infiniband/hw/mlx5/odp.c
> 
> Look for the word 'implicit'
> 
> mlx5_ib_invalidate_range() releases the interval_notifier when there are
> no populated shadow PTEs in its leaf
> 
> pagefault_implicit_mr() creates an interval_notifier that covers the
> level in the page table that needs population. Notice it just uses an
> unlocked xa_load to find the page table level.
> 
> The locking is pretty tricky as it relies on RCU, but the fault flow
> is fairly lightweight.
> 
> Jason
> 
Thanks for the information, Jason.

I'm still interested in finding a way to support range based hints to device drivers.
madvise() looks like it only sets a bit in vma->vm_flags or acts on the
advice immediately. mbind() and set_mempolicy() only work with CPUs and memory
with NUMA a node number. What I'm looking for is a way for the device to know
whether to migrate pages to device private memory on a fault, whether to duplicate
read-only pages in device private memory, or remote map/access a page instead of migrating it.
For example, there is a working draft extension to OpenCL,
https://github.com/intel/llvm/blob/sycl/sycl/doc/extensions/USM/cl_intel_unified_shared_memory.asciidoc
that could provide a way to specify this sort of advice.
C++ is also looking at extentions for specifying affinity attributes.
In any case, these are probably a long ways off before being finalized and implemented.

I also have some changes to support THP migration to device private memory but that
will require updating nouveau to use 2MB TLB mappings.

In the mean time, I can update the HMM self tests to do something like ODP without
changing mm/mmu_notifier.c but I don't think I can easily change nouveau to that model.
