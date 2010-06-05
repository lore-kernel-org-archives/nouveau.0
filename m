From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: Re: [PATCH] kmmio/mmiotrace: fix double free of
	kmmio_fault_pages
Date: Sat, 5 Jun 2010 20:29:33 +0300
Message-ID: <20100605202933.7a650c62@daedalus.pq.iki.fi>
References: <20100605164919.GA2816@joi.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20100605164919.GA2816-OI9uyE9O0yo@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, x86-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Sat, 5 Jun 2010 18:49:42 +0200
Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> After every iounmap mmiotrace has to free kmmio_fault_pages, but
> it can't do it directly, so it defers freeing by RCU.
> 
> It usually works, but when mmiotraced code calls ioremap-iounmap
> multiple times without sleeping between (so RCU won't kick in and
> start freeing) it can be given the same virtual address, so at
> every iounmap mmiotrace will schedule the same pages for release.
> Obviously it will explode on second free.
> 
> Fix it by marking kmmio_fault_pages which are scheduled for
> release and not adding them second time.
> 
> Signed-off-by: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
> Cc: Stuart Bennett <stuart-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org>

Excellent work! Unfortunately I cannot review this patch
right now, I am sick. The description sounds good, though,
and I have no objections.


Thank you very much!

> ---
>  arch/x86/mm/kmmio.c |   16 +++++++++++++---
>  1 files changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/x86/mm/kmmio.c b/arch/x86/mm/kmmio.c
> index 5d0e67f..e5d5e2c 100644
> --- a/arch/x86/mm/kmmio.c
> +++ b/arch/x86/mm/kmmio.c
> @@ -45,6 +45,8 @@ struct kmmio_fault_page {
>  	 * Protected by kmmio_lock, when linked into
> kmmio_page_table. */
>  	int count;
> +
> +	bool scheduled_for_release;
>  };
>  
>  struct kmmio_delayed_release {
> @@ -398,8 +400,11 @@ static void
> release_kmmio_fault_page(unsigned long page, BUG_ON(f->count < 0);
>  	if (!f->count) {
>  		disarm_kmmio_fault_page(f);
> -		f->release_next = *release_list;
> -		*release_list = f;
> +		if (!f->scheduled_for_release) {
> +			f->release_next = *release_list;
> +			*release_list = f;
> +			f->scheduled_for_release = true;
> +		}
>  	}
>  }
>  
> @@ -471,8 +476,10 @@ static void remove_kmmio_fault_pages(struct
> rcu_head *head) prevp = &f->release_next;
>  		} else {
>  			*prevp = f->release_next;
> +			f->release_next = NULL;
> +			f->scheduled_for_release = false;
>  		}
> -		f = f->release_next;
> +		f = *prevp;
>  	}
>  	spin_unlock_irqrestore(&kmmio_lock, flags);
>  
> @@ -510,6 +517,9 @@ void unregister_kmmio_probe(struct
> kmmio_probe *p) kmmio_count--;
>  	spin_unlock_irqrestore(&kmmio_lock, flags);
>  
> +	if (!release_list)
> +		return;
> +
>  	drelease = kmalloc(sizeof(*drelease), GFP_ATOMIC);
>  	if (!drelease) {
>  		pr_crit("leaking kmmio_fault_page objects.\n");
> -- 
> 1.7.1
> 
> 


-- 
Pekka Paalanen
http://www.iki.fi/pq/
