From: Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RESEND PATCH 2/3] nouveau: fix mixed normal and
 device private page migration
Date: Wed, 24 Jun 2020 11:10:55 -0700
Message-ID: <330f6a82-d01d-db97-1dec-69346f41e707@nvidia.com>
References: <20200622233854.10889-1-rcampbell@nvidia.com>
 <20200622233854.10889-3-rcampbell@nvidia.com> <20200624072355.GB18609@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20200624072355.GB18609-jcswGhMUV9g@public.gmane.org>
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
To: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jason Gunthorpe <jgg-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org


On 6/24/20 12:23 AM, Christoph Hellwig wrote:
> On Mon, Jun 22, 2020 at 04:38:53PM -0700, Ralph Campbell wrote:
>> The OpenCL function clEnqueueSVMMigrateMem(), without any flags, will
>> migrate memory in the given address range to device private memory. The
>> source pages might already have been migrated to device private memory.
>> In that case, the source struct page is not checked to see if it is
>> a device private page and incorrectly computes the GPU's physical
>> address of local memory leading to data corruption.
>> Fix this by checking the source struct page and computing the correct
>> physical address.
> 
> I'm really worried about all this delicate code to fix the mixed
> ranges.  Can't we make it clear at the migrate_vma_* level if we want
> to migrate from or two device private memory, and then skip all the work
> for regions of memory that already are in the right place?  This might be
> a little more work initially, but I think it leads to a much better
> API.
> 

The current code does encode the direction with src_owner != NULL meaning
device private to system memory and src_owner == NULL meaning system
memory to device private memory. This patch would obviously defeat that
so perhaps a flag could be added to the struct migrate_vma to indicate the
direction but I'm unclear how that makes things less delicate.
Can you expand on what you are worried about?

The issue with invalidations might be better addressed by letting the device
driver handle device private page TLB invalidations when migrating to
system memory and changing migrate_vma_setup() to only invalidate CPU
TLB entries for normal pages being migrated to device private memory.
If a page isn't migrating, it seems inefficient to invalidate those TLB
entries.

Any other suggestions?
