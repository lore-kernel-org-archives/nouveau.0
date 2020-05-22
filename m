From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] nouveau/hmm: fix migrate zero page to GPU
Date: Fri, 22 May 2020 10:47:32 +1000
Message-ID: <CACAvsv6TYCaChfsp4LNcVUZ6b0f6F5vDiKqfpzRTVRnRM7373g@mail.gmail.com>
References: <20200520183652.21633-1-rcampbell@nvidia.com>
 <20200520192045.GH24561@mellanox.com>
 <0ef69e08-7f5d-7a3d-c657-55b3a8df1dfe@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <0ef69e08-7f5d-7a3d-c657-55b3a8df1dfe-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ML nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jason Gunthorpe <jgg-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Thu, 21 May 2020 at 07:05, Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>
>
> On 5/20/20 12:20 PM, Jason Gunthorpe wrote:
> > On Wed, May 20, 2020 at 11:36:52AM -0700, Ralph Campbell wrote:
> >> When calling OpenCL clEnqueueSVMMigrateMem() on a region of memory that
> >> is backed by pte_none() or zero pages, migrate_vma_setup() will fill the
> >> source PFN array with an entry indicating the source page is zero.
> >> Use this to optimize migration to device private memory by allocating
> >> GPU memory and zero filling it instead of failing to migrate the page.
> >>
> >> Signed-off-by: Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >>
> >> This patch applies cleanly to Jason's Gunthorpe's hmm tree plus two
> >> patches I posted earlier. The first is queued in Ben Skegg's nouveau
> >> tree and the second is still pending review/not queued.
> >> [1] ("nouveau/hmm: map pages after migration")
> >> https://lore.kernel.org/linux-mm/20200304001339.8248-5-rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org/
> >> [2] ("nouveau/hmm: fix nouveau_dmem_chunk allocations")
> >> https://lore.kernel.org/lkml/20200421231107.30958-1-rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org/
> >
> > It would be best if it goes through Ben's tree if it doesn't have
> > conflicts with the hunks I have in the hmm tree.. Is it the case?
> >
> > Jason
>
> I think there might be some merge conflicts even though it is semantically
> independent of the other changes. I guess since we are at 5.7-rc6 and not
> far from the merge window, I can rebase after 5.8-rc1 and resend.
> I posted this mostly to get some review and as a "heads up" of the issue.
Both look alright to me, and apply cleanly on top of my tree already,
so I've got them locally.

Ben.

> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
