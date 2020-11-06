From: Matthew Wilcox <willy-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Subject: Re: [PATCH v3 1/6] mm/thp: add
 prep_transhuge_device_private_page()
Date: Fri, 6 Nov 2020 12:14:07 +0000
Message-ID: <20201106121407.GQ17076@casper.infradead.org>
References: <20201106005147.20113-1-rcampbell@nvidia.com>
 <20201106005147.20113-2-rcampbell@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20201106005147.20113-2-rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
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
Cc: Yang Shi <yang.shi-KPsoFbNs7GizrGE5bRqYAgC/G2K4zDHf@public.gmane.org>, Jason Gunthorpe <jgg-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Alistair Popple <apopple-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Bharata B Rao <bharata-tEXmvtCZX7AybS5Ee8rs3A@public.gmane.org>, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-kselftest-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Zi Yan <ziy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Shuah Khan <shuah-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>, "Kirill A . Shutemov" <kirill.shutemov-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Thu, Nov 05, 2020 at 04:51:42PM -0800, Ralph Campbell wrote:
> Add a helper function to allow device drivers to create device private
> transparent huge pages. This is intended to help support device private
> THP migrations.

I think you'd be better off with these calling conventions:

-void prep_transhuge_page(struct page *page)
+struct page *thp_prep(struct page *page)
 {
+       if (!page || compound_order(page) == 0)
+               return page;
        /*
-        * we use page->mapping and page->indexlru in second tail page
+        * we use page->mapping and page->index in second tail page
         * as list_head: assuming THP order >= 2
         */
+       BUG_ON(compound_order(page) == 1);
 
        INIT_LIST_HEAD(page_deferred_list(page));
        set_compound_page_dtor(page, TRANSHUGE_PAGE_DTOR);
+
+       return page;
 }

It simplifies the users.

> +void prep_transhuge_device_private_page(struct page *page)
> +{
> +	prep_compound_page(page, HPAGE_PMD_ORDER);
> +	prep_transhuge_page(page);
> +	/* Only the head page has a reference to the pgmap. */
> +	percpu_ref_put_many(page->pgmap->ref, HPAGE_PMD_NR - 1);
> +}
> +EXPORT_SYMBOL_GPL(prep_transhuge_device_private_page);

Something else that may interest you from my patch series is support
for page sizes other than PMD_SIZE.  I don't know what page sizes your
hardware supports.  There's no support for page sizes other than PMD
for anonymous memory, so this might not be too useful for you yet.
