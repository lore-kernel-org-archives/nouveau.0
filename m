Return-Path: <SRS0=xjD2=IN=lists.freedesktop.org=nouveau-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7B4BC433E0
	for <nouveau@archiver.kernel.org>; Mon, 15 Mar 2021 07:28:25 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 64AD864E64
	for <nouveau@archiver.kernel.org>; Mon, 15 Mar 2021 07:28:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 64AD864E64
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=nouveau-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1015489CD7;
	Mon, 15 Mar 2021 07:28:25 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29A5389CDF;
 Mon, 15 Mar 2021 07:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=/4x/X3GS6thVGUK6cOVI8rH4h4+Oo61yBODFUT5MA0w=; b=vZi3bhH4d2YcxZIWoFyxnCOCzo
 hhpidY/A6Mbh0EWNvr0oyxoaxtFxeFowICoVqbo6OK+Fgs1EsPYDuqwvGPFnGYsbCBkIZSWYxCOcW
 53tvfYpwfVOOebLDQB//3YJkAXiY+BeQNlExtECW8bSXB9ZlaA8bahIuUUktyvMN0zXD25fma/ut9
 7Sa4bDI5j6qs0U6/ExHfBLXqx1JscAvFwgh3w63HrUrCUghFXuQgBKnC0iKP70Tx8EHYCGKSSEYj9
 KdWllX4zU5Vfypl+9TtxQCzfCvkQmhBD7U8ONPnT40VeCCb9W6OKibM/MKO7skATmiDfTlcrIEfFz
 B/grPu7A==;
Received: from hch by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1lLhdt-00HMIO-KN; Mon, 15 Mar 2021 07:27:58 +0000
Date: Mon, 15 Mar 2021 07:27:57 +0000
From: Christoph Hellwig <hch@infradead.org>
To: Alistair Popple <apopple@nvidia.com>
Message-ID: <20210315072757.GA4136862@infradead.org>
References: <20210312083851.15981-1-apopple@nvidia.com>
 <20210312083851.15981-2-apopple@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210312083851.15981-2-apopple@nvidia.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Subject: Re: [Nouveau] [PATCH v6 1/8] mm: Remove special swap entry functions
X-BeenThere: nouveau@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=subscribe>
Cc: rcampbell@nvidia.com, willy@infradead.org, daniel@ffwll.ch,
 linux-doc@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kvm-ppc@vger.kernel.org, hch@infradead.org, linux-mm@kvack.org,
 bskeggs@redhat.com, jgg@nvidia.com, akpm@linux-foundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Fri, Mar 12, 2021 at 07:38:44PM +1100, Alistair Popple wrote:
> Remove the migration and device private entry_to_page() and
> entry_to_pfn() inline functions and instead open code them directly.
> This results in shorter code which is easier to understand.

I think this commit log should mention pfn_swap_entry_to_page() now.

Otherwise looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
