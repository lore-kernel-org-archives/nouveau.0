Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F7C5C43458
	for <nouveau@archiver.kernel.org>; Sat, 11 Jul 2026 17:10:08 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 84DE710E3E6;
	Sat, 11 Jul 2026 17:10:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="k3fNhKS6";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id B3347470C7;
	Sat, 11 Jul 2026 16:54:59 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1783788899;
 b=PjIUxuUI8o7oQ1ViEuBifi8j7EfYD38nApbEIiQG4UKrzbLcn9nrHlZ/c0/3dbaMNvpEx
 7T4foVhN3JSAZdK5HYUnaJyLQIO415ho8Z5S6vSMlRoRMe+Acoh5LVIr5uvrMLTPVJp4AHJ
 3fHVBZnGuOw90qLTNWSzD+WSLg7302iYLAjwSzdTl/jUPIWO4b/WvV84aWBE2Yp0nGBsXLM
 TdHneV6DwTpMtD/Q8R4MoUdyCWBv0WyEkMMYlHnhsx1TxWzagm8pgZIYazXWCl73BxdnmpG
 1AS/7yfGxhBvASydDKwGZm1PMSAyAoHLIUnNK5y9GDNevkAz+PI/IZ+9IypA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1783788899; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=AvtNjMXUVGcPIUxCxCfqbdEtpU8jR9HOTGYaAlW6IJ8=;
 b=IrOVMBLIOLIc5ozaHwheB+klvTxyW8ijQ9e9EZkQrGpBwZyD/DOtuhSSQLOULzKBdWPwM
 igAuUUd+AF0fv5cTqNVAFX6Ijx0sWdvimhfVX133dPm+q8Hm8E9Mv3IpZiL1UR/YUJbW6Hd
 yqN4LMuZq05MlvIfzGGL2YQCeT0j/Sln9R8KUnwOu0ijIxFEP0Nklcl2Hl6ZyknscFZOD6U
 MYOJ8R7SeV9gfN5DUMO3/wXdg3pcxGMxtmXnyva0C4t2JTibaBzTTaSjWRCVQ17KzxHStc8
 Bh9jZBxFQQQge4bnqY1YX6wtzdn2xu+YkntPOYcoHt8SPzI1j2aYKvHEKcnQ==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=kernel.org;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=kernel.org;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id E1ACD46FCD
	for <nouveau@lists.freedesktop.org>; Sat, 11 Jul 2026 16:54:56 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6550110E3A9;
	Sat, 11 Jul 2026 17:10:03 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3878D6111A;
	Sat, 11 Jul 2026 17:10:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA6F71F000E9;
	Sat, 11 Jul 2026 17:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783789801;
	bh=AvtNjMXUVGcPIUxCxCfqbdEtpU8jR9HOTGYaAlW6IJ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=k3fNhKS66r/p/o8Bc1xI7ewhTioGM5eE5UxTbAfHwiEEG5NZOQoHjazK2cWX+6/SE
	 v+U9r2rkD4VP0CNSplf/nSgPr33pdrLmGKOrJy6x0c8Xsnfudte+l8CuZRkvsJHzhL
	 2xzdkO2v+Q+2PPXWrMuMSvbGqEw9CmT9+ZHMiG1WT8jUC5NdwLiZsm50xu5zeD+/aW
	 zvImcxhwsTnEPAUhEbcG4TpZeBj1kqZVb6dm8VWTrMRJu36W2lybHuDy0lpFg0MMPF
	 ANsT8GKLEgijBVcxkcvqBp+1nPOUHmAwPtV+5/DPz8eLqjTPOJ42AuY6RZqVPq55n+
	 bc2Qco/fVIOQQ==
Date: Sat, 11 Jul 2026 18:09:35 +0100
From: Lorenzo Stoakes <ljs@kernel.org>
To: Zi Yan <ziy@nvidia.com>
Subject: Re: [PATCH 13/13] mm/mremap: convert mremap code to use vma_flags_t
Message-ID: <alJ4VPr7Igk3SJYt@lucifer>
References: 
 <380f761d35a3faa4370f8b3f92e3d4af3d4c7110.1782760670.git.ljs@kernel.org>
 <20260702134947.25189-1-lance.yang@linux.dev>
 <akaJx8Zt8kazlrjq@lucifer>
 <DJTOP760MDDG.2KUSKD8WVVKJ5@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DJTOP760MDDG.2KUSKD8WVVKJ5@nvidia.com>
Message-ID-Hash: GU4MVDKNDFNY4K4TKA64L3M655JXSSWP
X-Message-ID-Hash: GU4MVDKNDFNY4K4TKA64L3M655JXSSWP
X-MailFrom: ljs@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Lance Yang <lance.yang@linux.dev>, akpm@linux-foundation.org,
 tsbogend@alpha.franken.de, maddy@linux.ibm.com, mpe@ellerman.id.au,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, simona@ffwll.ch,
 l.stach@pengutronix.de, inki.dae@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, krzk@kernel.org, peter.griffin@linaro.org,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tursulin@ursulin.net, robin.clark@oss.qualcomm.com,
 lumag@kernel.org, dakr@kernel.org, tomi.valkeinen@ideasonboard.com,
 hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
 thierry.reding@kernel.org, mperttunen@nvidia.com, kraxel@redhat.com,
 dmitry.osipenko@collabora.com, zack.rusin@broadcom.com,
 matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 oleksandr_andrushchenko@epam.com, deller@gmx.de, bcrl@kvack.org,
 viro@zeniv.linux.org.uk, brauner@kernel.org, muchun.song@linux.dev,
 osalvador@suse.de, david@kernel.org, baolin.wang@linux.alibaba.com,
 liam@infradead.org, npache@redhat.com, ryan.roberts@arm.com,
 dev.jain@arm.com, baohua@kernel.org, hughd@google.com, vbabka@kernel.org,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com, jannh@google.com,
 pfalcato@suse.de, kees@kernel.org, perex@perex.cz, tiwai@suse.com,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, dri-devel@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-tegra@vger.kernel.org, virtualization@lists.linux.dev,
 intel-xe@lists.freedesktop.org, xen-devel@lists.xenproject.org,
 linux-fbdev@vger.kernel.org, linux-aio@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 linux-sound@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/GU4MVDKNDFNY4K4TKA64L3M655JXSSWP/>
Archived-At: <https://lore.freedesktop.org/alJ4VPr7Igk3SJYt@lucifer/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed, Jul 08, 2026 at 10:28:00PM -0400, Zi Yan wrote:
> On Thu Jul 2, 2026 at 12:07 PM EDT, Lorenzo Stoakes wrote:
> > On Thu, Jul 02, 2026 at 09:49:47PM +0800, Lance Yang wrote:
> >>
> >> On Mon, Jun 29, 2026 at 08:25:36PM +0100, Lorenzo Stoakes wrote:
> >> >Replace use of the legacy vm_flags_t flags with vma_flags_t values
> >> >throughout the mremap logic.
> >> >
> >> >Additionally update comments to reflect the changes to be consistent.
> >> >
> >> >No functional change intended.
> >> >
> >> >Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>
> >> >---
> >>
> >> The vm_flags_set() cases below spell out vma_start_write(), but the
> >> vm_flags_clear() cases don't?
> >
> > Yep as I said elsewhere, implicitly taking the lock is terrible and me doing
> > this is completely on purpose to get rid of that :)
> >
> > But I haven't been clear enough clearly, so I should put the argument as to why
> > that's ok in the commit message.
> >
> > Will do so on respin.
>
> How about also add a comment to vma_clear*() telling us a lock is not
> needed and why like you explained a lock is needed for vma_set*()?
> This asymmetry could confuse people.

Well you do absolutely have to hold the lock once the VMA is initialised when
using any VMA flags API that manipulates flags (apart from the explicitly atomic
case).

The argument here is that the VMA was _already locked_ at the point of clearing
:)

>
> This patch looks good to me.
>
> Reviewed-by: Zi Yan <ziy@nvidia.com>

Thanks!

>
> --
> Best Regards,
> Yan, Zi
>

Cheers, Lorenzo
