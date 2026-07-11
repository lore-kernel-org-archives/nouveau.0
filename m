Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00D56C44507
	for <nouveau@archiver.kernel.org>; Sat, 11 Jul 2026 17:04:46 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0B40710E3BE;
	Sat, 11 Jul 2026 17:04:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="k75eMTHb";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 38A8347095;
	Sat, 11 Jul 2026 16:49:38 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1783788578;
 b=Q75LAV/ZvImi0OuaYi6R3hk00lNS6pmic3vtfSBrl7vscMuowzCbSBG6qDJb7QTGYzoiz
 erFEH1cr+iFkjWOr74uVVCFoJ9vaYzWzhJQgILxEHi5nSLjTxnRB6es32S4Ublmqan1diny
 V8Uflq/Zg3MdXdEK426TUaZ1KBdaVNkMk56oeUPvLUGYwYRmSzKEK0uA6RXQAuuRttzzPl0
 +ZMjmuCXO6rVaJq6h8Dsw/o1Xxg1MXAGrXpHmLD3hc7oQV0epnH5Y0NUuqhsk58imszDhCY
 kwlFdrwfAtefbM4Im7ZFP85l2QldOMErU4wh73bryyh9etgBKfgOhEhAURLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1783788578; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=+Kwd9D5Wl2KO1Q3Bx8l5+fiMeXu2P1OtbVPUfZ/bfbo=;
 b=Zh/j3PQtObj2iI4bGh0ve9VWvx8g3HMvYKdrECF5+vvPUHiSnVr9gQBO7LIrhcW74HJ0g
 XAtbs3HZaJ61C5oFvLtCpA5CnWySnKs4BlfwTWYBxR5xvKrzJ7Srd5p/aCs5VCjeF/gZQeg
 yEjt4bnjruN9Ex9Yg9zkVF9eRV/iJ16CsK8V1NqlH1KPh54fnVSNvkR8lddnT2KkcCMKVsp
 xbpt5IMtXkZV3+pbStI9wiqIuCrZGM6uObgEyD0U+6Tl2OaNxh13E79/B9Ts67u6YyaEy2W
 s75/D7bOwMf5sc2gsW+PDValHlb/I+6QJSjCahTYCFcPwnzr5eU9zwBZNc3A==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id CB46A47095
	for <nouveau@lists.freedesktop.org>; Sat, 11 Jul 2026 16:49:35 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1474310E39E;
	Sat, 11 Jul 2026 17:04:42 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2139260052;
	Sat, 11 Jul 2026 17:04:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44FBE1F000E9;
	Sat, 11 Jul 2026 17:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783789480;
	bh=+Kwd9D5Wl2KO1Q3Bx8l5+fiMeXu2P1OtbVPUfZ/bfbo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=k75eMTHbfY5dLiist6X1WccVv3k4otHBJCwIOTe46YBHnqrIF1xmytrUrRJODV0h2
	 NFmVNF/K5+hQkIVW3bv6RCnCkOSV5BteTL51MGqvOw9+FwfCEdTh0lJASD7uVwbR0D
	 7id+6F1QOheKs0/qV7VtYbBBrYuorsecGOcn4P+Aedutt57oKLfai/LPb47xTkHe2v
	 Vxu5p2eAfg3qWGWcIPsPlaAGCDayA6g0QKSaIAbXO2OSh1LdCes8X+y9FM6C+1Eu7H
	 /PK8nbJzJ0+/7/dPZ2uAj/ztBJv5OD5W3R7oCXqO8Y2s8cuPNpie8Ma1uT2vWb6Thl
	 oZYPNvSdCQdnQ==
Date: Sat, 11 Jul 2026 18:04:14 +0100
From: Lorenzo Stoakes <ljs@kernel.org>
To: Zi Yan <ziy@nvidia.com>
Subject: Re: [PATCH 12/13] mm/mprotect: convert mprotect code to use
 vma_flags_t
Message-ID: <alJ3CDR7zTvAv2XL@lucifer>
References: 
 <7ef626d8a12dc742cfc09d080be5dc09850e873a.1782760670.git.ljs@kernel.org>
 <20260701160917.91435-1-lance.yang@linux.dev>
 <akaIfhfbTCAdJm3H@lucifer>
 <DJTOG7IBZKEE.87TLWNXOCHR8@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DJTOG7IBZKEE.87TLWNXOCHR8@nvidia.com>
Message-ID-Hash: 24JJYECQQPIWAJ4O7S7I44VB4KWWSPDO
X-Message-ID-Hash: 24JJYECQQPIWAJ4O7S7I44VB4KWWSPDO
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/24JJYECQQPIWAJ4O7S7I44VB4KWWSPDO/>
Archived-At: <https://lore.freedesktop.org/alJ3CDR7zTvAv2XL@lucifer/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed, Jul 08, 2026 at 10:16:15PM -0400, Zi Yan wrote:
> On Thu Jul 2, 2026 at 11:53 AM EDT, Lorenzo Stoakes wrote:
> > On Thu, Jul 02, 2026 at 12:09:17AM +0800, Lance Yang wrote:
> >>
> >> On Mon, Jun 29, 2026 at 08:25:35PM +0100, Lorenzo Stoakes wrote:
> >> >Replace use of the legacy vm_flags_t flags with vma_flags_t values
> >> >throughout the mprotect logic.
> >> >
> >> >Note that we retain the legacy vm_flags_t bit shifting code in
> >> >do_mprotect_key(), deferring a vma_flags_t approach to this for the time
> >> >being.
> >> >
> >> >Additionally update comments to reflect the changes to be consistent.
> >> >
> >> >No functional change intended.
> >> >
> >> >Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>
> >> >---
> >> > mm/mprotect.c | 16 ++++++++--------
> >> > 1 file changed, 8 insertions(+), 8 deletions(-)
> >> >
> >> >diff --git a/mm/mprotect.c b/mm/mprotect.c
> >> >index 9cbf932b028c..c9504b2a2525 100644
> >> >--- a/mm/mprotect.c
> >> >+++ b/mm/mprotect.c
> >> >@@ -40,7 +40,7 @@
> >> >
> >> > static bool maybe_change_pte_writable(struct vm_area_struct *vma, pte_t pte)
> >> > {
> >> >-	if (WARN_ON_ONCE(!(vma->vm_flags & VM_WRITE)))
> >> >+	if (WARN_ON_ONCE(!vma_test(vma, VMA_WRITE_BIT)))
> >> > 		return false;
> >> >
> >> > 	/* Don't touch entries that are not even readable. */
> >> >@@ -97,7 +97,7 @@ static bool can_change_shared_pte_writable(struct vm_area_struct *vma,
> >> > bool can_change_pte_writable(struct vm_area_struct *vma, unsigned long addr,
> >> > 			     pte_t pte)
> >> > {
> >> >-	if (!(vma->vm_flags & VM_SHARED))
> >> >+	if (!vma_test(vma, VMA_SHARED_BIT))
> >> > 		return can_change_private_pte_writable(vma, addr, pte);
> >> >
> >> > 	return can_change_shared_pte_writable(vma, pte);
> >> >@@ -194,7 +194,7 @@ static __always_inline void set_write_prot_commit_flush_ptes(struct vm_area_stru
> >> > {
> >> > 	bool set_write;
> >> >
> >> >-	if (vma->vm_flags & VM_SHARED) {
> >> >+	if (vma_test(vma, VMA_SHARED_BIT)) {
> >> > 		set_write = can_change_shared_pte_writable(vma, ptent);
> >> > 		prot_commit_flush_ptes(vma, addr, ptep, oldpte, ptent, nr_ptes,
> >> > 				       /* idx = */ 0, set_write, tlb);
> >> >@@ -811,8 +811,8 @@ mprotect_fixup(struct vma_iterator *vmi, struct mmu_gather *tlb,
> >> > 		vm_unacct_memory(nrpages);
> >> >
> >> > 	/*
> >> >-	 * Private VM_LOCKED VMA becoming writable: trigger COW to avoid major
> >> >-	 * fault on access.
> >> >+	 * Private VMA_LOCKED_BIT VMA becoming writable: trigger COW to avoid
> >> >+	 * major fault on access.
> >> > 	 */
> >> > 	if (vma_flags_test(&new_vma_flags, VMA_WRITE_BIT) &&
> >> > 	    vma_flags_test(&old_vma_flags, VMA_LOCKED_BIT) &&
> >> >@@ -886,7 +886,7 @@ static int do_mprotect_pkey(unsigned long start, size_t len,
> >> > 			goto out;
> >> > 		start = vma->vm_start;
> >> > 		error = -EINVAL;
> >> >-		if (!(vma->vm_flags & VM_GROWSDOWN))
> >> >+		if (!vma_test(vma, VMA_GROWSDOWN_BIT))
> >> > 			goto out;
> >> > 	} else {
> >> > 		if (vma->vm_start > start)
> >> >@@ -894,7 +894,7 @@ static int do_mprotect_pkey(unsigned long start, size_t len,
> >> > 		if (unlikely(grows & PROT_GROWSUP)) {
> >> > 			end = vma->vm_end;
> >> > 			error = -EINVAL;
> >> >-			if (!(vma->vm_flags & VM_GROWSUP))
> >> >+			if (!vma_test(vma, VMA_GROWSUP_BIT))
> >>
> >> IIUC, should this be
> >>
> >> if (!vma_test_single_mask(vma, VMA_GROWSUP))
> >>
> >> instead?
> >>
> >> #elif defined(CONFIG_PARISC)
> >> #define VM_GROWSUP	INIT_VM_FLAG(GROWSUP)
> >> ...
> >> #ifndef VM_GROWSUP
> >> #define VM_GROWSUP	VM_NONE
> >> ...
> >>
> >> VM_GROWSUP is only defined as GROWSUP on parisc and becomes VM_NONE
> >> elsewhere. But VMA_GROWSUP_BIT is the raw ARCH_1 bit, which is also used
> >> for other arch-specific VMA flags:
> >>
> >> 	DECLARE_VMA_BIT_ALIAS(SAO, ARCH_1),		/* Strong Access Ordering (powerpc) */
> >> 	DECLARE_VMA_BIT_ALIAS(GROWSUP, ARCH_1),		/* parisc */
> >> 	DECLARE_VMA_BIT_ALIAS(SPARC_ADI, ARCH_1),	/* sparc64 */
> >> 	DECLARE_VMA_BIT_ALIAS(ARM64_BTI, ARCH_1),	/* arm64 */
> >> 	DECLARE_VMA_BIT_ALIAS(ARCH_CLEAR, ARCH_1),	/* sparc64, arm64 */
> >> 	DECLARE_VMA_BIT_ALIAS(MAPPED_COPY, ARCH_1),	/* !CONFIG_MMU */
> >>
> >> Other vma_test() changes look fine to me: just fixed INIT_VM_FLAG()
> >> masks matching their VMA_*_BIT :)
> >
> > Thanks you're right, will fix!
> >
> > Again I swear I ran claude on all of this so it's failing me here :)
> >
>
> Is it better to add something like below to avoid misuse these mutually
> exclusive bit aliases?
>
> An example for VMA_GROWSUP_BIT:
>
> #if defined(CONFIG_PARISC)
> DECLARE_VMA_BIT_ALIAS(GROWSUP, ARCH_1),		/* parisc */
> #else
> /* make VMA_GROWSUP_BIT a build bug on */
> #endif

Nah we can't...

>
> Hmm, these VMA_*_BIT are enum items, so the above might not be possible.

...because of this but also this is the canonical definition and we want to use
it for the VMA_xxx form.

> An alternative is to only define them for the corresponding config and
> you will get build errors when trying to use them directly and the
> config is not enabled. Otherwise, misuses like "vma_test(vma,
> VMA_GROWSUP_BIT)" is harder to uncover.

Yeah good idea, I may add a new DECLARE_INTERNAL_VMA_BIT() that gives you
__VMA_xxx_BIT, so nobody makes the obvious mistake and we force uses of safe
VMA_xxx form. Hmm :)

>
>
> --
> Best Regards,
> Yan, Zi
>

Thanks, Lorenzo
