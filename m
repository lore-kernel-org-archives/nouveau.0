From: Mike Galbraith <efault@gmx.de>
Subject: Re: [Nouveau] kernel spew from nouveau/ swiotlb
Date: Thu, 10 May 2018 18:30:46 +0200
Message-ID: <1525969846.5308.2.camel@gmx.de>
References: <1525943427.8013.11.camel@gmx.de>
         <474293973.18773550.1525962696189.JavaMail.zimbra@redhat.com>
         <1525966280.5207.1.camel@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1525966280.5207.1.camel@gmx.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Jerome Glisse <jglisse@redhat.com>
Cc: nouveau <nouveau@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>, Ben Skeggs <bskeggs@redhat.com>
List-Id: nouveau.vger.kernel.org

On Thu, 2018-05-10 at 17:31 +0200, Mike Galbraith wrote:
> On Thu, 2018-05-10 at 10:31 -0400, Jerome Glisse wrote:
> > 
> > Could you bisect ? I would love to point finger upstream to the DMA
> > folk who made changes to that API without testing with GPU.
> 
> Rummaging a bit, it might be...
> 

(unsend, whack duplicate line, munge, send;)

> nouveau_bo_new()
> ...
> ttm_dma_pool_alloc_new_pages()
>   dma_alloc_attrs()
>     ops->alloc() == x86_swiotlb_alloc_coherent()
>     x86_swiotlb_alloc_coherent() flags |= __GFP_NOWARN;
>       swiotlb_alloc_coherent(..flags)
>         swiotlb_alloc_coherent(..flags) attrs = (flags & __GFP_NOWARN) ? DMA_ATTR_NO_WARN : 0;
>           swiotlb_alloc_buffer(..attrs)
*              swiotlb_tbl_map_single(..0) passed 0 vs attrs, gripeage follows

Or something like that.
