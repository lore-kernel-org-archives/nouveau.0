Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 012E9C7EE25
	for <nouveau@archiver.kernel.org>; Wed,  7 Jun 2023 13:11:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B57D10E04D;
	Wed,  7 Jun 2023 13:11:12 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C97BF10E04D
 for <nouveau@lists.freedesktop.org>; Wed,  7 Jun 2023 13:11:09 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 01FC26732D; Wed,  7 Jun 2023 15:11:05 +0200 (CEST)
Date: Wed, 7 Jun 2023 15:11:04 +0200
From: Christoph Hellwig <hch@lst.de>
To: Lyude Paul <lyude@redhat.com>
Message-ID: <20230607131104.GA19206@lst.de>
References: <20230518134253.909623-1-hch@lst.de>
 <20230518134253.909623-4-hch@lst.de>
 <b07c93bc7cb71a32091794cd97f7c702c34539da.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b07c93bc7cb71a32091794cd97f7c702c34539da.camel@redhat.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Subject: Re: [Nouveau] [PATCH 3/4] drm/nouveau: stop using is_swiotlb_active
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, nouveau@lists.freedesktop.org,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Ben Skeggs <bskeggs@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>,
 xen-devel@lists.xenproject.org, Thomas Gleixner <tglx@linutronix.de>,
 Christoph Hellwig <hch@lst.de>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Thu, May 18, 2023 at 04:30:49PM -0400, Lyude Paul wrote:
> Reviewed-by: Lyude Paul <lyude@redhat.com>
> 
> Thanks for getting to this!

I've tentantively queued this up in the dma-mapping for-next tree.
Let me know if you'd prefer it to go through the nouveau tree.
