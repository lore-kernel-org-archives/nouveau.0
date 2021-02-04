Return-Path: <SRS0=ct60=HG=lists.freedesktop.org=nouveau-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94603C433E0
	for <nouveau@archiver.kernel.org>; Thu,  4 Feb 2021 14:37:32 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE28C64EE2
	for <nouveau@archiver.kernel.org>; Thu,  4 Feb 2021 14:37:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CE28C64EE2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=nouveau-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 832656E10A;
	Thu,  4 Feb 2021 14:37:31 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DAB96EC87;
 Thu,  4 Feb 2021 08:40:28 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 77E4067373; Thu,  4 Feb 2021 09:40:23 +0100 (CET)
Date: Thu, 4 Feb 2021 09:40:23 +0100
From: Christoph Hellwig <hch@lst.de>
To: Dongli Zhang <dongli.zhang@oracle.com>
Message-ID: <20210204084023.GA32328@lst.de>
References: <20210203233709.19819-1-dongli.zhang@oracle.com>
 <20210203233709.19819-6-dongli.zhang@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210203233709.19819-6-dongli.zhang@oracle.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mailman-Approved-At: Thu, 04 Feb 2021 14:37:30 +0000
Subject: Re: [Nouveau] [PATCH RFC v1 5/6] xen-swiotlb: convert variables to
 arrays
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
Cc: ulf.hansson@linaro.org, airlied@linux.ie, benh@kernel.crashing.org,
 joonas.lahtinen@linux.intel.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, bhelgaas@google.com, paulus@samba.org,
 hpa@zytor.com, hch@lst.de, m.szyprowski@samsung.com, sstabellini@kernel.org,
 adrian.hunter@intel.com, mpe@ellerman.id.au, x86@kernel.org,
 joe.jin@oracle.com, mingo@kernel.org, peterz@infradead.org, mingo@redhat.com,
 bskeggs@redhat.com, linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 matthew.auld@intel.com, thomas.lendacky@amd.com, konrad.wilk@oracle.com,
 intel-gfx@lists.freedesktop.org, jani.nikula@linux.intel.com, bp@alien8.de,
 rodrigo.vivi@intel.com, nouveau@lists.freedesktop.org,
 boris.ostrovsky@oracle.com, chris@chris-wilson.co.uk, jgross@suse.com,
 tsbogend@alpha.franken.de, robin.murphy@arm.com, linux-mmc@vger.kernel.org,
 linux-mips@vger.kernel.org, iommu@lists.linux-foundation.org,
 tglx@linutronix.de, bauerman@linux.ibm.com, daniel@ffwll.ch,
 akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, rppt@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

So one thing that has been on my mind for a while:  I'd really like
to kill the separate dma ops in Xen swiotlb.  If we compare xen-swiotlb
to swiotlb the main difference seems to be:

 - additional reasons to bounce I/O vs the plain DMA capable
 - the possibility to do a hypercall on arm/arm64
 - an extra translation layer before doing the phys_to_dma and vice
   versa
 - an special memory allocator

I wonder if inbetween a few jump labels or other no overhead enablement
options and possibly better use of the dma_range_map we could kill
off most of swiotlb-xen instead of maintaining all this code duplication?
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
