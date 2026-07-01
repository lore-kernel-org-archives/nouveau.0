Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 709E7C43458
	for <nouveau@archiver.kernel.org>; Wed,  1 Jul 2026 16:16:19 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4B83C10EECD;
	Wed,  1 Jul 2026 16:16:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="GKsigi9j";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id BAF2D46E0B;
	Wed,  1 Jul 2026 16:01:34 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1782921694;
 b=pj4HAsfycsf5FRT7yg+wVVNNH91om7JB0ZLdyBN3qP/wM/G1mrMqEsH1mlQBZWBRgQRH7
 eYiQAicbq+X+VAKCTyWs80TdnkWhDa6Hp9vTy2YSQ4KQ63axAnZ+jzjRLv19c3YsrZwILtX
 1+dq80zWaI7yxXn4tXtWsDWAnkmJ7plCvvhNpsVaiVSyO6TYp94JLpGMD06RlqUL6fEVEHV
 sCUafR8GugJruEO5AkDHYTTej7fPuLmRNmAaEZXfWCCfE/sVv+d1w5H7+9mkjUv82LReYXK
 LBv7smgQsSJnqYaBZHP6ncP+F4Q6SOTNpPt2+599CiLU7tzNYiOUz1VCwMoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1782921694; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=32k3xy2qoDs5v558QiIXDOBJrw4XcLaI228zHYcvJQI=;
 b=ZP1BXDMWPUjVfrTjKmsqapx26T5zfpPsnSWYPtaJKp0p8lc9KtQewAsxg1SOptTxBWLE+
 LJHxhmIW0xyOgqfTFDIUhzem86ivfd/tzhhb6uhl905FzN21aZ3f3c4s166WAyMU+BJgbmI
 YJifmfsbyI2lnyuakwDDAO4V6+zPXkm9AdXwk0EfajBrzFaRjHKOZfJP32y8d3FYtXCNqmk
 V16p1n1x8TBl6/67KV21EXkuRi73SmxWZhZ3AlWvruzHLfJApzbkKoV1eHqvdge28XObuVP
 jso4BNMRnxPYW+sAkOrPEZO0Tk5GMOz9LLe2b4Up83UtTGN1AKJDFSrDSCwQ==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=linux.dev;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=linux.dev policy.dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=linux.dev;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=linux.dev policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 79FD846D8C
	for <nouveau@lists.freedesktop.org>; Wed,  1 Jul 2026 16:01:29 +0000 (UTC)
X-Greylist: delayed 380 seconds by postgrey-1.36 at gabe;
 Wed, 01 Jul 2026 16:16:13 UTC
Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com
 [91.218.175.180])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A483910E3E5
	for <nouveau@lists.freedesktop.org>; Wed,  1 Jul 2026 16:16:13 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782922180;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=32k3xy2qoDs5v558QiIXDOBJrw4XcLaI228zHYcvJQI=;
	b=GKsigi9jw5iEZkRAOu0U35OCwwNX+WFYQBJnw1VnjqCFwAV1xkeG5HVPPXjVerUIFCpvkl
	1sYFG/+4cZNO5RnH+3ZGNEajZyzEn2vDXqeNcTTch6ZM0ZT3P4Eo/8D1DaouN8eSB+B2FA
	bvbtO9Gx6J4K8rZ0y4m06I1Z9Hu4ibM=
From: Lance Yang <lance.yang@linux.dev>
To: ljs@kernel.org
Subject: Re: [PATCH 12/13] mm/mprotect: convert mprotect code to use
 vma_flags_t
Date: Thu,  2 Jul 2026 00:09:17 +0800
Message-Id: <20260701160917.91435-1-lance.yang@linux.dev>
In-Reply-To: 
 <7ef626d8a12dc742cfc09d080be5dc09850e873a.1782760670.git.ljs@kernel.org>
References: 
 <7ef626d8a12dc742cfc09d080be5dc09850e873a.1782760670.git.ljs@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
Message-ID-Hash: Q4VR7YS7RFXSVSEEJBJQP2KFDJZVN2NC
X-Message-ID-Hash: Q4VR7YS7RFXSVSEEJBJQP2KFDJZVN2NC
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/Q4VR7YS7RFXSVSEEJBJQP2KFDJZVN2NC/>
Archived-At: 
 <https://lore.freedesktop.org/20260701160917.91435-1-lance.yang@linux.dev/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>


On Mon, Jun 29, 2026 at 08:25:35PM +0100, Lorenzo Stoakes wrote:
>Replace use of the legacy vm_flags_t flags with vma_flags_t values
>throughout the mprotect logic.
>
>Note that we retain the legacy vm_flags_t bit shifting code in
>do_mprotect_key(), deferring a vma_flags_t approach to this for the time
>being.
>
>Additionally update comments to reflect the changes to be consistent.
>
>No functional change intended.
>
>Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>
>---
> mm/mprotect.c | 16 ++++++++--------
> 1 file changed, 8 insertions(+), 8 deletions(-)
>
>diff --git a/mm/mprotect.c b/mm/mprotect.c
>index 9cbf932b028c..c9504b2a2525 100644
>--- a/mm/mprotect.c
>+++ b/mm/mprotect.c
>@@ -40,7 +40,7 @@
> 
> static bool maybe_change_pte_writable(struct vm_area_struct *vma, pte_t pte)
> {
>-	if (WARN_ON_ONCE(!(vma->vm_flags & VM_WRITE)))
>+	if (WARN_ON_ONCE(!vma_test(vma, VMA_WRITE_BIT)))
> 		return false;
> 
> 	/* Don't touch entries that are not even readable. */
>@@ -97,7 +97,7 @@ static bool can_change_shared_pte_writable(struct vm_area_struct *vma,
> bool can_change_pte_writable(struct vm_area_struct *vma, unsigned long addr,
> 			     pte_t pte)
> {
>-	if (!(vma->vm_flags & VM_SHARED))
>+	if (!vma_test(vma, VMA_SHARED_BIT))
> 		return can_change_private_pte_writable(vma, addr, pte);
> 
> 	return can_change_shared_pte_writable(vma, pte);
>@@ -194,7 +194,7 @@ static __always_inline void set_write_prot_commit_flush_ptes(struct vm_area_stru
> {
> 	bool set_write;
> 
>-	if (vma->vm_flags & VM_SHARED) {
>+	if (vma_test(vma, VMA_SHARED_BIT)) {
> 		set_write = can_change_shared_pte_writable(vma, ptent);
> 		prot_commit_flush_ptes(vma, addr, ptep, oldpte, ptent, nr_ptes,
> 				       /* idx = */ 0, set_write, tlb);
>@@ -811,8 +811,8 @@ mprotect_fixup(struct vma_iterator *vmi, struct mmu_gather *tlb,
> 		vm_unacct_memory(nrpages);
> 
> 	/*
>-	 * Private VM_LOCKED VMA becoming writable: trigger COW to avoid major
>-	 * fault on access.
>+	 * Private VMA_LOCKED_BIT VMA becoming writable: trigger COW to avoid
>+	 * major fault on access.
> 	 */
> 	if (vma_flags_test(&new_vma_flags, VMA_WRITE_BIT) &&
> 	    vma_flags_test(&old_vma_flags, VMA_LOCKED_BIT) &&
>@@ -886,7 +886,7 @@ static int do_mprotect_pkey(unsigned long start, size_t len,
> 			goto out;
> 		start = vma->vm_start;
> 		error = -EINVAL;
>-		if (!(vma->vm_flags & VM_GROWSDOWN))
>+		if (!vma_test(vma, VMA_GROWSDOWN_BIT))
> 			goto out;
> 	} else {
> 		if (vma->vm_start > start)
>@@ -894,7 +894,7 @@ static int do_mprotect_pkey(unsigned long start, size_t len,
> 		if (unlikely(grows & PROT_GROWSUP)) {
> 			end = vma->vm_end;
> 			error = -EINVAL;
>-			if (!(vma->vm_flags & VM_GROWSUP))
>+			if (!vma_test(vma, VMA_GROWSUP_BIT))

IIUC, should this be

if (!vma_test_single_mask(vma, VMA_GROWSUP))

instead?

#elif defined(CONFIG_PARISC)
#define VM_GROWSUP	INIT_VM_FLAG(GROWSUP)
...
#ifndef VM_GROWSUP
#define VM_GROWSUP	VM_NONE
...

VM_GROWSUP is only defined as GROWSUP on parisc and becomes VM_NONE
elsewhere. But VMA_GROWSUP_BIT is the raw ARCH_1 bit, which is also used
for other arch-specific VMA flags:

	DECLARE_VMA_BIT_ALIAS(SAO, ARCH_1),		/* Strong Access Ordering (powerpc) */
	DECLARE_VMA_BIT_ALIAS(GROWSUP, ARCH_1),		/* parisc */
	DECLARE_VMA_BIT_ALIAS(SPARC_ADI, ARCH_1),	/* sparc64 */
	DECLARE_VMA_BIT_ALIAS(ARM64_BTI, ARCH_1),	/* arm64 */
	DECLARE_VMA_BIT_ALIAS(ARCH_CLEAR, ARCH_1),	/* sparc64, arm64 */
	DECLARE_VMA_BIT_ALIAS(MAPPED_COPY, ARCH_1),	/* !CONFIG_MMU */

Other vma_test() changes look fine to me: just fixed INIT_VM_FLAG()
masks matching their VMA_*_BIT :)

Cheers, Lance

> 				goto out;
> 		}
> 	}
>@@ -918,7 +918,7 @@ static int do_mprotect_pkey(unsigned long start, size_t len,
> 		}
> 
> 		/* Does the application expect PROT_READ to imply PROT_EXEC */
>-		if (rier && (vma->vm_flags & VM_MAYEXEC))
>+		if (rier && vma_test(vma, VMA_MAYEXEC_BIT))
> 			prot |= PROT_EXEC;
> 
> 		/*
>-- 
>2.54.0
>
>
