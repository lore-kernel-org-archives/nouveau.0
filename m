From: Jason Gunthorpe <jgg-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v6 4/6] mm/mmu_notifier: add
 mmu_interval_notifier_find()
Date: Tue, 14 Jan 2020 12:49:59 +0000
Message-ID: <20200114124956.GN20978@mellanox.com>
References: <20200113224703.5917-1-rcampbell@nvidia.com>
 <20200113224703.5917-5-rcampbell@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20200113224703.5917-5-rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Content-ID: <A257C7D2E6E81A488462C5DDE02DD0C5-wNKe6lTLrGecE4WynfumptQqCkab/8FMAL8bYrjMMd8@public.gmane.org>
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
Cc: "linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org" <linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "linux-kselftest-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kselftest-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Shuah Khan <shuah-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Mon, Jan 13, 2020 at 02:47:01PM -0800, Ralph Campbell wrote:
> diff --git a/mm/mmu_notifier.c b/mm/mmu_notifier.c
> index 47ad9cc89aab..4efecc0f13cb 100644
> +++ b/mm/mmu_notifier.c
> @@ -1171,6 +1171,39 @@ void mmu_interval_notifier_update(struct mmu_interval_notifier *mni,
>  }
>  EXPORT_SYMBOL_GPL(mmu_interval_notifier_update);
>  
> +struct mmu_interval_notifier *mmu_interval_notifier_find(struct mm_struct *mm,
> +				const struct mmu_interval_notifier_ops *ops,
> +				unsigned long start, unsigned long last)
> +{
> +	struct mmu_notifier_mm *mmn_mm = mm->mmu_notifier_mm;
> +	struct interval_tree_node *node;
> +	struct mmu_interval_notifier *mni;
> +	struct mmu_interval_notifier *res = NULL;
> +
> +	spin_lock(&mmn_mm->lock);
> +	node = interval_tree_iter_first(&mmn_mm->itree, start, last);
> +	if (node) {
> +		mni = container_of(node, struct mmu_interval_notifier,
> +				   interval_tree);
> +		while (true) {
> +			if (mni->ops == ops) {
> +				res = mni;
> +				break;
> +			}
> +			node = interval_tree_iter_next(&mni->interval_tree,
> +						       start, last);
> +			if (!node)
> +				break;
> +			mni = container_of(node, struct mmu_interval_notifier,
> +					   interval_tree);
> +		}
> +	}
> +	spin_unlock(&mmn_mm->lock);

This doesn't seem safe at all, here we are returning a pointer to
memory from the interval tree with out any kind of lifetime
protection.

If the interval tree is read it must be left in the read lock state
until the caller is done with the pointer.

.. and this poses all sorts of questions about consistency with items
on the deferred list. Should find return an item undergoing deletion?

Should find return items using the old interval tree values or their
new updated values?

Jason
