Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB86EC43458
	for <nouveau@archiver.kernel.org>; Mon, 29 Jun 2026 19:26:11 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A414510EA34;
	Mon, 29 Jun 2026 19:26:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BExgykrx";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 4C30C46D5B;
	Mon, 29 Jun 2026 19:11:31 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1782760291;
 b=FgefczLC8KToI5zQzHpeoNbVOtc4nMjPw4QqFv71aexAHWkns0KBTzF+qf4uQU3KY5H7J
 JUSk85EVDB96KL/6afWCmzOWLKCYwG7P8hRzf/PNWBdxtHYQLmffKnA6L3rBJ6wIvOkEBBj
 g3Owze4yy8FPulwjKt3F3NJ0tESh0GBS2k7tNxzOlPao7ByrvCwsIOcxucPVo/Zwq+9hrun
 OV2KL3gIILcQ3YgKNlz72qDyEOD8bKys6bSbYK6ErJkMYzsTmVUKV/qxTHS+dtDiA5R/UNW
 PEzIF64RNs49m0hds7A8INsK0eXIWx+4aE1F4nAUb6zlxcXb/MOB2Vzftlhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1782760291; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=hVd6ZuVqENj3zeMR4aL2t+2UMMhczNHM+gJ9snfAafg=;
 b=mvjtj8CbH0cM1STQOGA7cl7GetMiSHGXRgAnY7K3VWDdbNgFkc3AT7psJHTvLVQkCZflK
 dXMcKs8LYTBG4NiDDcW7NJwSH4oqSZHJBF9YHQWOOxYgpwRJ2ptMDrPF3bGMsJPIyBOQuEu
 QZJZXoGD/jfvgmXSHZKxbL8PmFV95mVL/nXKXkz6I/4vBw3MT7EP9wx4CzG4uSCXmaTqsfj
 bByyYQdy8oL6q/gX5IBBFUVB1b2I2cLbS5mybMnmjL9rfB/9FsAihm1DT0HlhvWY/qU/l2V
 s/4VzMsvRMW5PasxpbI95YN8viCVvYxvPu9HafftmBoIqlFWUPffcfjES1Bw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 0938B46D58
	for <nouveau@lists.freedesktop.org>; Mon, 29 Jun 2026 19:11:29 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1072110EA1D;
	Mon, 29 Jun 2026 19:26:09 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 51A386014B;
	Mon, 29 Jun 2026 19:26:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A2DC1F00A3E;
	Mon, 29 Jun 2026 19:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782761168;
	bh=hVd6ZuVqENj3zeMR4aL2t+2UMMhczNHM+gJ9snfAafg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=BExgykrxcgTd5RClbXfmFD5Hp/1Grb/Kjey3DiRaMUeFZgqydXxsDWyRIvpzoISG7
	 /Iilv3IrxTXNlJUqKZNyr5TyZZvKbnpj8BmRYrG9ZFdN0Nb0i0NyJk8Sl7npMKfdti
	 1DTOuDeaNgSBKxd+05qng9++fyrY+sD0P/+0C6uNIMSgwntxptodo0GGuiVJ2fa7Xh
	 tcbnSkYetMr8IMTjqAFSQc8sq/Xc+KvUA6heTO4Lwayd0uEmx/7h0R2T9dkwHlc5h+
	 iCD7J6P0FnSJ3xPPyRVSFdOIImy48N18CmoYp7IbeVR4j1E/heYWHJ8ULXWfCEAyFn
	 uHB+/Pwf3DOzg==
From: Lorenzo Stoakes <ljs@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 04/13] mm: update generic_get_unmapped_area[_topdown]() to use
 vma_flags_t
Date: Mon, 29 Jun 2026 20:25:27 +0100
Message-ID: 
 <cef55b19f86c110952f13829aefa4859db3a70ed.1782760670.git.ljs@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1782760670.git.ljs@kernel.org>
References: <cover.1782760670.git.ljs@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: JGJUFSQYVXLWE7KOVJ2K4PKVA6B4YF4Y
X-Message-ID-Hash: JGJUFSQYVXLWE7KOVJ2K4PKVA6B4YF4Y
X-MailFrom: ljs@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Lucas Stach <l.stach@pengutronix.de>, Inki Dae <inki.dae@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>,
 Thierry Reding <thierry.reding@kernel.org>,
 Mikko Perttunen <mperttunen@nvidia.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Zack Rusin <zack.rusin@broadcom.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Helge Deller <deller@gmx.de>, Benjamin LaHaise <bcrl@kvack.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Muchun Song <muchun.song@linux.dev>,
 Oscar Salvador <osalvador@suse.de>, David Hildenbrand <david@kernel.org>,
 Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R . Howlett" <liam@infradead.org>, Nico Pache <npache@redhat.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>,
 Hugh Dickins <hughd@google.com>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Jann Horn <jannh@google.com>,
 Pedro Falcato <pfalcato@suse.de>, Kees Cook <kees@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/JGJUFSQYVXLWE7KOVJ2K4PKVA6B4YF4Y/>
Archived-At: 
 <https://lore.freedesktop.org/cef55b19f86c110952f13829aefa4859db3a70ed.1782760670.git.ljs@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

As part of the changes converting VMA flags from a system word size to a
bitmap, extend this change to generic_get_unmapped_area() and
generic_get_unmapped_area_topdown(), which also allows us to convert
stack_guard_placement() as well.

We retain arch_get_unmapped_area() and arch_get_unmapped_area_topdown()
as-is for now, using legacy_to_vma_flags() as necessary to do so.

No functional change intended.

Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>
---
 arch/powerpc/mm/book3s64/slice.c |  6 ++++--
 include/linux/sched/mm.h         |  4 ++--
 mm/mmap.c                        | 16 ++++++++--------
 3 files changed, 14 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/slice.c b/arch/powerpc/mm/book3s64/slice.c
index 28bec5bc7879..82127e31dca6 100644
--- a/arch/powerpc/mm/book3s64/slice.c
+++ b/arch/powerpc/mm/book3s64/slice.c
@@ -659,7 +659,8 @@ unsigned long arch_get_unmapped_area(struct file *filp,
 	unsigned int psize;
 
 	if (radix_enabled())
-		return generic_get_unmapped_area(filp, addr, len, pgoff, flags, vm_flags);
+		return generic_get_unmapped_area(filp, addr, len, pgoff, flags,
+						 legacy_to_vma_flags(vm_flags));
 
 	if (filp && is_file_hugepages(filp))
 		psize = file_to_psize(filp);
@@ -679,7 +680,8 @@ unsigned long arch_get_unmapped_area_topdown(struct file *filp,
 	unsigned int psize;
 
 	if (radix_enabled())
-		return generic_get_unmapped_area_topdown(filp, addr0, len, pgoff, flags, vm_flags);
+		return generic_get_unmapped_area_topdown(filp, addr0, len,
+				pgoff, flags, legacy_to_vma_flags(vm_flags));
 
 	if (filp && is_file_hugepages(filp))
 		psize = file_to_psize(filp);
diff --git a/include/linux/sched/mm.h b/include/linux/sched/mm.h
index b301ec90740a..c8720d8e2158 100644
--- a/include/linux/sched/mm.h
+++ b/include/linux/sched/mm.h
@@ -203,11 +203,11 @@ unsigned long mm_get_unmapped_area_vmaflags(struct file *filp,
 unsigned long
 generic_get_unmapped_area(struct file *filp, unsigned long addr,
 			  unsigned long len, unsigned long pgoff,
-			  unsigned long flags, vm_flags_t vm_flags);
+			  unsigned long flags, vma_flags_t vma_flags);
 unsigned long
 generic_get_unmapped_area_topdown(struct file *filp, unsigned long addr,
 				  unsigned long len, unsigned long pgoff,
-				  unsigned long flags, vm_flags_t vm_flags);
+				  unsigned long flags, vma_flags_t vma_flags);
 #else
 static inline void arch_pick_mmap_layout(struct mm_struct *mm,
 					 const struct rlimit *rlim_stack) {}
diff --git a/mm/mmap.c b/mm/mmap.c
index 461ce510e12a..3ef603d5ff00 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -657,9 +657,9 @@ SYSCALL_DEFINE1(old_mmap, struct mmap_arg_struct __user *, arg)
  * Determine if the allocation needs to ensure that there is no
  * existing mapping within it's guard gaps, for use as start_gap.
  */
-static inline unsigned long stack_guard_placement(vm_flags_t vm_flags)
+static inline unsigned long stack_guard_placement(vma_flags_t vma_flags)
 {
-	if (vm_flags & VM_SHADOW_STACK)
+	if (vma_flags_test_single_mask(&vma_flags, VMA_SHADOW_STACK))
 		return PAGE_SIZE;
 
 	return 0;
@@ -701,7 +701,7 @@ unsigned long vm_unmapped_area(struct vm_unmapped_area_info *info)
 unsigned long
 generic_get_unmapped_area(struct file *filp, unsigned long addr,
 			  unsigned long len, unsigned long pgoff,
-			  unsigned long flags, vm_flags_t vm_flags)
+			  unsigned long flags, vma_flags_t vma_flags)
 {
 	struct mm_struct *mm = current->mm;
 	struct vm_area_struct *vma, *prev;
@@ -726,7 +726,7 @@ generic_get_unmapped_area(struct file *filp, unsigned long addr,
 	info.length = len;
 	info.low_limit = mm->mmap_base;
 	info.high_limit = mmap_end;
-	info.start_gap = stack_guard_placement(vm_flags);
+	info.start_gap = stack_guard_placement(vma_flags);
 	if (filp && is_file_hugepages(filp))
 		info.align_mask = huge_page_mask_align(filp);
 	return vm_unmapped_area(&info);
@@ -739,7 +739,7 @@ arch_get_unmapped_area(struct file *filp, unsigned long addr,
 		       unsigned long flags, vm_flags_t vm_flags)
 {
 	return generic_get_unmapped_area(filp, addr, len, pgoff, flags,
-					 vm_flags);
+					 legacy_to_vma_flags(vm_flags));
 }
 #endif
 
@@ -750,7 +750,7 @@ arch_get_unmapped_area(struct file *filp, unsigned long addr,
 unsigned long
 generic_get_unmapped_area_topdown(struct file *filp, unsigned long addr,
 				  unsigned long len, unsigned long pgoff,
-				  unsigned long flags, vm_flags_t vm_flags)
+				  unsigned long flags, vma_flags_t vma_flags)
 {
 	struct vm_area_struct *vma, *prev;
 	struct mm_struct *mm = current->mm;
@@ -778,7 +778,7 @@ generic_get_unmapped_area_topdown(struct file *filp, unsigned long addr,
 	info.length = len;
 	info.low_limit = PAGE_SIZE;
 	info.high_limit = arch_get_mmap_base(addr, mm->mmap_base);
-	info.start_gap = stack_guard_placement(vm_flags);
+	info.start_gap = stack_guard_placement(vma_flags);
 	if (filp && is_file_hugepages(filp))
 		info.align_mask = huge_page_mask_align(filp);
 	addr = vm_unmapped_area(&info);
@@ -807,7 +807,7 @@ arch_get_unmapped_area_topdown(struct file *filp, unsigned long addr,
 			       unsigned long flags, vm_flags_t vm_flags)
 {
 	return generic_get_unmapped_area_topdown(filp, addr, len, pgoff, flags,
-						 vm_flags);
+						 legacy_to_vma_flags(vm_flags));
 }
 #endif
 
-- 
2.54.0

