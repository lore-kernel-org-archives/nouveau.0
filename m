Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B38CFC43458
	for <nouveau@archiver.kernel.org>; Thu,  2 Jul 2026 13:21:57 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3740410F3A1;
	Thu,  2 Jul 2026 13:21:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="lItd+RyL";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id B140546E67;
	Thu,  2 Jul 2026 13:07:09 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1782997629;
 b=rmfVR572D5J/rGSebyzQQIGxXQXhLzO9nQYZKp+4+6oK5pvTtQxITI/zuuaNgN5lyZn+r
 v/K/wKGNGDyyoBcviipF3XII09hFoGvleI8kZJDyOtVcEN+YIsNvbez1MsegzmP8i2UL487
 QPY80rPWY3r0aAMn7W8QxJjMXIsnyQw9sBxkDE8hDVPIU3yNcm99Wo2mJguFVlGYPe/owFU
 W2mxzvnAyczFh6DpItFNxu1BsbzB4PR/T28sP91ETyl6JfsBLUtH4b6sM+JyMhvN2g5HNCa
 RiIswfGGffItcZZ76ag5pyUNAp0rULhEUF/y8YIbFV3N/FnhHUE9S5T0nBIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1782997629; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=JUypSg4x3H5Npdac5Q/QNTHcczAl9LnBdMVXVWinEec=;
 b=jSwM0ia/Z76u6hy5om7LRBNDo6az5XfHw81FgaAv4FAmRCHtNV211BvqZO2Cr21jYIZWD
 /QJ3EoY/7r/D559dQM3nyQstHKKBuh6oMRF7t9kHeM/bZux1zoCI5L4es5fT27mzKmzf75b
 nLihO1TSDMGuUYCUbrpVuMJm6nXTVjoMGcby+YPgL7hIhbHFq6D5ZwFvOv7kE0I1smaQf0f
 8MDL3rzsepm1sKTGnGj6Dg5+29RlRekV9Mx5QsMZYW7PC6LJsjUztAkpTbNcG9x2j2KsWeL
 jLyvIPCl0b9FULGEeudG1k99yuf0oU6jMcQJ659nyRrfF1OG3V39eiihvj3w==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=linux.dev;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=linux.dev policy.dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=linux.dev;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=linux.dev policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 9E70A46DDC
	for <nouveau@lists.freedesktop.org>; Thu,  2 Jul 2026 13:07:06 +0000 (UTC)
Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com
 [91.218.175.188])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C078F10F389;
	Thu,  2 Jul 2026 13:21:52 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782998499;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JUypSg4x3H5Npdac5Q/QNTHcczAl9LnBdMVXVWinEec=;
	b=lItd+RyL3jRAHkpl0dxrPEWed2AY0HWUHX4RwICujMLfpbUgWjWjW+ARImTVfb6PHm9Sny
	y6V8i67fWjOA8LCWLGCzxRy43+gvonIsLNLIP4rLaMNI+LWR2I1BadswAi+4/7c6z/eUrS
	IlFVPIdu28UO/M5UjVs/++abx0FKfS4=
From: Lance Yang <lance.yang@linux.dev>
To: ljs@kernel.org
Subject: Re: [PATCH 11/13] mm/mlock: convert mlock code to use vma_flags_t
Date: Thu,  2 Jul 2026 21:21:07 +0800
Message-Id: <20260702132107.73727-1-lance.yang@linux.dev>
In-Reply-To: 
 <2db16db81538355ca65f778c246d2381c673cad4.1782760670.git.ljs@kernel.org>
References: 
 <2db16db81538355ca65f778c246d2381c673cad4.1782760670.git.ljs@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
Message-ID-Hash: 54I5KC7GLBUQAQMEAFDOL7HHBHTO4LNV
X-Message-ID-Hash: 54I5KC7GLBUQAQMEAFDOL7HHBHTO4LNV
X-MailFrom: lance.yang@linux.dev
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
 ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org,
 lance.yang@linux.dev, hughd@google.com, vbabka@kernel.org, rppt@kernel.org,
 surenb@google.com, mhocko@suse.com, jannh@google.com, pfalcato@suse.de,
 kees@kernel.org, perex@perex.cz, tiwai@suse.com, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 dri-devel@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
 virtualization@lists.linux.dev, intel-xe@lists.freedesktop.org,
 xen-devel@lists.xenproject.org, linux-fbdev@vger.kernel.org,
 linux-aio@kvack.org, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 linux-sound@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/54I5KC7GLBUQAQMEAFDOL7HHBHTO4LNV/>
Archived-At: 
 <https://lore.freedesktop.org/20260702132107.73727-1-lance.yang@linux.dev/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>


On Mon, Jun 29, 2026 at 08:25:34PM +0100, Lorenzo Stoakes wrote:
>Replace use of the legacy vm_flags_t flags with vma_flags_t values
>throughout the mlock logic.
>
>Additionally update comments to reflect the changes to be consistent.
>
>No functional change intended.
>
>Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>
>---

Nothing scary jumped out at me. Just one tiny nit below ;)

[...]
>@@ -466,24 +466,23 @@ static void mlock_vma_pages_range(struct vm_area_struct *vma,
>  */
> static int mlock_fixup(struct vma_iterator *vmi, struct vm_area_struct *vma,
> 	       struct vm_area_struct **prev, unsigned long start,
>-	       unsigned long end, vm_flags_t newflags)
>+	       unsigned long end, vma_flags_t *new_vma_flags)
> {
>-	vma_flags_t new_vma_flags = legacy_to_vma_flags(newflags);
> 	const vma_flags_t old_vma_flags = vma->flags;
> 	struct mm_struct *mm = vma->vm_mm;
> 	int nr_pages;
> 	int ret = 0;
> 
>-	if (vma_flags_same_pair(&old_vma_flags, &new_vma_flags) ||
>+	if (vma_flags_same_pair(&old_vma_flags, new_vma_flags) ||
> 	    vma_is_secretmem(vma) || !vma_supports_mlock(vma)) {
> 		/*
>-		 * Don't set VM_LOCKED or VM_LOCKONFAULT and don't count.
>+		 * Don't set VMA_LOCKED_BIT or VM_LOCKONFAULT and don't count.

s/VM_LOCKONFAULT/VMA_LOCKONFAULT_BIT/

Otherwise LGTM. Feel free to add:

Reviewed-by: Lance Yang <lance.yang@linux.dev>

> 		 * For secretmem, don't allow the memory to be unlocked.
> 		 */
> 		goto out;
> 	}
> 
>-	vma = vma_modify_flags(vmi, *prev, vma, start, end, &new_vma_flags);
>+	vma = vma_modify_flags(vmi, *prev, vma, start, end, new_vma_flags);
> 	if (IS_ERR(vma)) {
> 		ret = PTR_ERR(vma);
> 		goto out;
[...]
