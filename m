Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64C69C43458
	for <nouveau@archiver.kernel.org>; Thu,  2 Jul 2026 15:46:34 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 30FC510F4A1;
	Thu,  2 Jul 2026 15:46:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Mynx6GD6";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 72A6A46E7E;
	Thu,  2 Jul 2026 15:31:45 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1783006305;
 b=MOCMgo99+qV49g6Ik3wTHCsjPOhk8mT9/5K6gDXAv3my4tDoOQwewV7uCyUftE0Bm376E
 nOvTyMqsMjCSPyeWgCcWf3gJwpHNh5a7E4gFo7yGtgJguqQxYD5w38qqV7vGivPdodPqJt9
 +Jv2mJjZHD2TnrMZylgqLfVoOnpj4Q/p9H+rEWTBdv21jtaXF805b1PStf8ayfZqYSLUPBA
 SQZYwB/m5roN2629lgC/DPGlDW2Jq8ccCKxrJJDFnqJr8OsX/mbnU9ZtZfA9iOC1FFeKV76
 b2I4/tvtzP0EdTvb7HsLbPEv6afKoEP9b9FiOJMC8fzRxFKs4Uz+qXnz0rxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1783006305; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=jvE9wSqWBUCbGMsJG9svgBUezevNvrm1MrcHHSCChso=;
 b=nv+wY79RdV3WVW4S2My++KAYjQvFKfT55cVaSq0tAVQQ7YaTwhRt3dJ+8lTg+S/FVgHS2
 LhXCFNUdCNpUuZkzdhvAFdVcI9vuALnK8iM2fWI/0R02kk3a7Bq9jDYKpx65iEJTyi6mZs6
 QVfPGpy4o+/bvofRZosrrAsXU0u0+kIREBikK6BbY/GBSbO75OX1vhg92ZqXblraiuE2a6g
 3x6+TcVFg07RWuqF/eec+YaO04f5Q/VOc6pnOGztAr5K01xfuL/yTZM7fjJt9nvULkay7nY
 6mhvJhXsM5NjID5skVfLsyfBL8BK5I8lAuUqix5hejDDp2Gnvn4yu1cHv3NA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id A9CB94004C
	for <nouveau@lists.freedesktop.org>; Thu,  2 Jul 2026 15:31:42 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1426F10F37E;
	Thu,  2 Jul 2026 15:46:29 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2EBA4601EE;
	Thu,  2 Jul 2026 15:46:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90EC61F000E9;
	Thu,  2 Jul 2026 15:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783007187;
	bh=jvE9wSqWBUCbGMsJG9svgBUezevNvrm1MrcHHSCChso=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Mynx6GD6LkebsGmUnF9MjOYGoc5t/kjVRBAa3y4hDMiI7/vl1tQdkpNYaMYBglDKt
	 PpjOhV7WkyGWbA6148JfY40EHSUewPFem4EcHLSNtrDL52P+m6uRZFhhXV+p8drDP5
	 krlXhtnXXcRAzWJ2KFYq3Hh8rhTgMNWOvfDO5ubcScHxjko5fhA5/oYXfBSBTm3FYZ
	 q91+d//PbttUXOxvDyYYUNz2FFsT7LJ6pIAF99pcS/rpWlpmF6qsZCGqK6q0R7Cu6u
	 A7jMMvK5AtByO3p0pYtd9gulxJxBI42o3AQ7j7VXEvArqPbpGQYUH4EuymRAwVZamK
	 6IrFtw9w61Ysg==
Date: Thu, 2 Jul 2026 16:46:04 +0100
From: Lorenzo Stoakes <ljs@kernel.org>
To: Lance Yang <lance.yang@linux.dev>
Subject: Re: [PATCH 10/13] mm/vma: convert miscellaneous uses of VMA flags in
 core mm
Message-ID: <akaGxiTaJreEQn8T@lucifer>
References: 
 <1e7d834c887b6a65627d730addcff13d458c6268.1782760670.git.ljs@kernel.org>
 <20260702131233.59026-1-lance.yang@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260702131233.59026-1-lance.yang@linux.dev>
Message-ID-Hash: CWEFOAGGSMCS3AUYOC6UWEVZAKMIZHAH
X-Message-ID-Hash: CWEFOAGGSMCS3AUYOC6UWEVZAKMIZHAH
X-MailFrom: ljs@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: akpm@linux-foundation.org, tsbogend@alpha.franken.de, maddy@linux.ibm.com,
 mpe@ellerman.id.au, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 simona@ffwll.ch, l.stach@pengutronix.de, inki.dae@samsung.com,
 sw0312.kim@samsung.com, kyungmin.park@samsung.com, krzk@kernel.org,
 peter.griffin@linaro.org, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 tursulin@ursulin.net, robin.clark@oss.qualcomm.com, lumag@kernel.org,
 dakr@kernel.org, tomi.valkeinen@ideasonboard.com, hjc@rock-chips.com,
 heiko@sntech.de, andy.yan@rock-chips.com, thierry.reding@kernel.org,
 mperttunen@nvidia.com, kraxel@redhat.com, dmitry.osipenko@collabora.com,
 zack.rusin@broadcom.com, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com, oleksandr_andrushchenko@epam.com,
 deller@gmx.de, bcrl@kvack.org, viro@zeniv.linux.org.uk, brauner@kernel.org,
 muchun.song@linux.dev, osalvador@suse.de, david@kernel.org, ziy@nvidia.com,
 baolin.wang@linux.alibaba.com, liam@infradead.org, npache@redhat.com,
 ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org, hughd@google.com,
 vbabka@kernel.org, rppt@kernel.org, surenb@google.com, mhocko@suse.com,
 jannh@google.com, pfalcato@suse.de, kees@kernel.org, perex@perex.cz,
 tiwai@suse.com, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/CWEFOAGGSMCS3AUYOC6UWEVZAKMIZHAH/>
Archived-At: <https://lore.freedesktop.org/akaGxiTaJreEQn8T@lucifer/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Thu, Jul 02, 2026 at 09:12:33PM +0800, Lance Yang wrote:
>
> On Mon, Jun 29, 2026 at 08:25:33PM +0100, Lorenzo Stoakes wrote:
> >Update various uses of legacy flags in vma.c and mmap.c to the new
> >vma_flags_t type, updating comments alongside them to be consistent.
> >
> >Also update __install_special_mapping() to rearrange things slightly to
> >accommodate the changes.
> >
> >Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>
> >---
> [...]
> >diff --git a/mm/vma.c b/mm/vma.c
> >index b81c05e67a61..ab2ef0f04420 100644
> >--- a/mm/vma.c
> >+++ b/mm/vma.c
> >@@ -3417,23 +3417,27 @@ struct vm_area_struct *__install_special_mapping(
> > 	vm_flags_t vm_flags, void *priv,
> > 	const struct vm_operations_struct *ops)
> > {
> >-	int ret;
> >+	vma_flags_t vma_flags = legacy_to_vma_flags(vm_flags);
> > 	struct vm_area_struct *vma;
> >+	int ret;
> >
> > 	vma = vm_area_alloc(mm);
> >-	if (unlikely(vma == NULL))
> >+	if (unlikely(!vma))
> > 		return ERR_PTR(-ENOMEM);
> >
> >-	vma_set_range(vma, addr, addr + len, 0);
> >-	vm_flags |= vma_flags_to_legacy(mm->def_vma_flags) | VM_DONTEXPAND;
> >+	vma_flags_set_mask(&vma_flags, mm->def_vma_flags);
> >+	vma_flags_set(&vma_flags, VMA_DONTEXPAND_BIT);
> > 	if (pgtable_supports_soft_dirty())
> >-		vm_flags |= VM_SOFTDIRTY;
> >-	vm_flags_init(vma, vm_flags & ~VM_LOCKED_MASK);
> >+		vma_flags_set(&vma_flags, VMA_SOFTDIRTY_BIT);
> >+	vma_flags_clear_mask(&vma_flags, VMA_LOCKED_MASK);
> >+	vma->flags = vma_flags;
>
> Maybe worth a vma_flags_init() helper here to mirror vm_flags_init()?
> With this open-coded, we lose the soft-dirty WARN_ON_ONCE sanity check.
>
> Might be nicer to keep that check in one place ;)

I really hate all the VMA flag accessors, they conflate things horribly - we
should be explicitly taking VMA write locks when we need to (and often killable
ones actually) not assuming that a VMA flags accessor does (they should at most
assert).

This case is even more terribly egregious - you are setting flags at an
arbitrary time, why are we asserting something about softdirty?

You may update them as part of initialisation, maybe not. It's far from a
guarantee and feels like a lazy place to put it.

BUT obviously it's an oversight not to open code that here, so I'll update the
patch to do that!

I want VMA flags to be a clean stateless thing, other than the flags
themselves. Implicit, unrelated, asserts or lock acquisitions in general should
be done separately IMO.

>
> [...]

Thanks, Lorenzo
