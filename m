Return-Path: <SRS0=wQmX=KI=lists.freedesktop.org=nouveau-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32FD4C433ED
	for <nouveau@archiver.kernel.org>; Thu, 13 May 2021 13:15:55 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF525613BF
	for <nouveau@archiver.kernel.org>; Thu, 13 May 2021 13:15:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF525613BF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=nouveau-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A7B26E883;
	Thu, 13 May 2021 13:15:54 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2AC56E883
 for <nouveau@lists.freedesktop.org>; Thu, 13 May 2021 13:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=CqhS/DjApfCwkLFCvP6kllDyz5SMs1FoNvFzUNiKyfA=; b=d8SS8qgwVEBfC/z564sa+2N9DF
 Wzl+TkORKwOMT+wsnvHLbotWjCbktxMqEnEd2QDACc1JoP6nuoT0gG+x6tSw0bH/nMZmg3vcFw6bk
 T9uVRNj0t06RnJG86r4+uzrnLHwlQSMb56hyRRPYQTBnk6U+x/MSZe3SCKnWIz/ozlPPAYy1gj+4q
 HvSfyuYYfdpXO5LS6n3ggU8Sml9RM0tpfiBgwZrFWjnivtBXZC1AjPstssMqYjg0jJRha16bVMCV1
 kn3Rz01pS2/4jQSLQY4ZUixfzSpIiGfI8UfZ528pvwk//NUchwwjGJ7iq2xlPLP94iBxGBki80CBw
 OJddTV1Q==;
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1lhBB6-009RwN-5m; Thu, 13 May 2021 13:15:10 +0000
Date: Thu, 13 May 2021 14:15:00 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Ralph Campbell <rcampbell@nvidia.com>
Message-ID: <YJ0mVAK7OjwIGnMe@casper.infradead.org>
References: <20201001181715.17416-1-rcampbell@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201001181715.17416-1-rcampbell@nvidia.com>
Subject: Re: [Nouveau] [RFC PATCH v3 0/2] mm: remove extra ZONE_DEVICE
 struct page refcount
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
Cc: Yang Shi <yang.shi@linux.alibaba.com>, Zi Yan <ziy@nvidia.com>,
 nouveau@lists.freedesktop.org, Alistair Popple <apopple@nvidia.com>,
 linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org,
 Bharata B Rao <bharata@linux.ibm.com>, Paul Mackerras <paulus@ozlabs.org>,
 linux-mm@kvack.org, Ben Skeggs <bskeggs@redhat.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Dan Williams <dan.j.williams@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, Ira Weiny <ira.weiny@intel.com>,
 Christoph Hellwig <hch@lst.de>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Thu, Oct 01, 2020 at 11:17:13AM -0700, Ralph Campbell wrote:
> This is still an RFC because after looking at the pmem/dax code some
> more, I realized that the ZONE_DEVICE struct pages are being inserted
> into the process' page tables with vmf_insert_mixed() and a zero
> refcount on the ZONE_DEVICE struct page. This is sort of OK because
> insert_pfn() increments the reference count on the pgmap which is what
> prevents memunmap_pages() from freeing the struct pages and it doesn't
> check for a non-zero struct page reference count.
> But, any calls to get_page() will hit the VM_BUG_ON_PAGE() that
> checks for a reference count == 0.

This seems to have gone quiet.  What needs to happen to resurrect this?
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
