From: Jason Gunthorpe <jgg-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH] nouveau: fix page fault on device private
 memory
Date: Fri, 26 Jun 2020 14:44:37 -0300
Message-ID: <20200626174437.GD23821@mellanox.com>
References: <20200626172626.19207-1-rcampbell@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200626172626.19207-1-rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
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
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Fri, Jun 26, 2020 at 10:26:26AM -0700, Ralph Campbell wrote:
> If system memory is migrated to device private memory and no GPU MMU
> page table entry exists, the GPU will fault and call hmm_range_fault()
> to get the PFN for the page. Since the .dev_private_owner pointer in
> struct hmm_range is not set, hmm_range_fault returns an error which
> results in the GPU program stopping with a fatal fault.
> Fix this by setting .dev_private_owner appropriately.
> 
> Fixes: 08ddddda667b ("mm/hmm: check the device private page owner in hmm_range_fault()")
> Signed-off-by: Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> 
> This is based on Linux-5.8.0-rc2 and is for Ben Skeggs nouveau tree.
> It doesn't depend on any of the other nouveau/HMM changes I have
> recently posted.

Makes sense to me

Reviewed-by: Jason Gunthorpe <jgg-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>

Jason
