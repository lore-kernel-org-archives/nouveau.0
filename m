Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C0F0C44507
	for <nouveau@archiver.kernel.org>; Sun, 12 Jul 2026 13:57:05 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0638B10E4A6;
	Sun, 12 Jul 2026 13:57:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Oj2bbZq2";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 4CB764184F;
	Sun, 12 Jul 2026 13:41:56 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1783863716;
 b=PLQo/juBANVkGM7tXm6SG7mmI8w6TzQh0aFyD+kYVWJm0HeqLrl5/b/t2FjwT9X3VcSFW
 QtB666pzqxyimEac/kKf8Yz67jZTjoaUhJY3SyvuEOlpAsqQ9DFsuTNz+CW3i+I/Em0Qtqg
 eoCeYtkM54rp8ZvC6ewL5XRJEPXqJJp2HQBeK9+/irXo6tIl8T0HoWoxCURMHER72cTx/n6
 73+DnvrQlfDLrCorwXKFDpb2GBYltKhGUWChEXbbYP/DrEyNrKX7DTIpyVwwAuJKE93fELj
 EY6vbbwbtmtFV+n8oFS+vEXJe/wl8JJYM9aYNAqLguw6gmgvYNZ4CZUDRxAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1783863716; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=4YSWAKth/DAZEc/MzMRhpX5OSIdEQ/yxeUWHtpyMER8=;
 b=MO4ttF3EXfDKg8Dt3AD9IO9YiP3E9Et8qKaKFIomAghddl5CGYVTdwKeOP7xocVVPZUD7
 83QSlQQzq+AwFVx240JadWgunYm3of3cG/WTvjbUJYDO4cWmkt6mAAx8dU/OAajs/aWka3L
 po4uxsTrvrVf6Iz+8XZgx1pJvw0i54Lfe8hOCzfU9XWDe4BeZjojfCNlxjO0rW1H4Yklqk3
 QN8WD03PjQAaePJKMwDR+5PXaanUKs7oApbDkMvtK8XP1sGuzN2AztY8yJbtBzgkoeTMCCz
 BnHJD+mqwVX0Ulfat97+L9zf310aSnlL/z43X+TjdS4OyXWiVQkOG1z1Cfnw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 5AB02470D1
	for <nouveau@lists.freedesktop.org>; Sat, 11 Jul 2026 18:32:21 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 08F5210E08B;
	Sat, 11 Jul 2026 18:47:28 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7F64D60052;
	Sat, 11 Jul 2026 18:47:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9E271F00A3A;
	Sat, 11 Jul 2026 18:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783795647;
	bh=4YSWAKth/DAZEc/MzMRhpX5OSIdEQ/yxeUWHtpyMER8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Oj2bbZq2ueyXMY7p77+CFk7KQGuguV+50w4ZIUQ3vDaeafeKSyr0+ZYcJDubPtLNZ
	 sJRwgYlEz100fbFYljWUFkR/aPeb1rLheG84FTwtN8ZRUfctoXXsBHdSy8qI71UJOJ
	 dg/wbxCPU7ZbHdmLXYfyUofuSsmh6hs/WTMBZ7ZZw8n0FLFgvBmCyQthypfFVSbSNO
	 yHJjuwm/P2LYqsxijaLaLepajZ099PPnEwDe01Ij8FEmBIB/uvMIEuvsz6Cp7HYgSB
	 88rYybISb+jVWxJ0M5ETwHbF/oOafId49qQKlqekjyCWQccGO/6+cbQyFvdid/L/wa
	 7g5Vp/gB+SANw==
From: Lorenzo Stoakes <ljs@kernel.org>
Date: Sat, 11 Jul 2026 19:45:02 +0100
Subject: [PATCH v2 05/13] mm: prefer mm->def_vma_flags in mm logic
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260711-b4-vma-flags-mm-v2-5-0fa2357d5431@kernel.org>
References: <20260711-b4-vma-flags-mm-v2-0-0fa2357d5431@kernel.org>
In-Reply-To: <20260711-b4-vma-flags-mm-v2-0-0fa2357d5431@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Benjamin LaHaise <bcrl@kvack.org>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Hugh Dickins <hughd@google.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, Jann Horn <jannh@google.com>,
 Pedro Falcato <pfalcato@suse.de>, Muchun Song <muchun.song@linux.dev>,
 Oscar Salvador <osalvador@suse.de>, Zi Yan <ziy@nvidia.com>,
 Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Sandy Huang <hjc@rock-chips.com>,
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>,
 Thierry Reding <thierry.reding@kernel.org>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>, Zack Rusin <zack.rusin@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Helge Deller <deller@gmx.de>, Kees Cook <kees@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4997; i=ljs@kernel.org;
 h=from:subject:message-id; bh=znvD/86roRelXlsxkkyvLX6yQAgqFWtP++AzhbmZe7g=;
 b=owGbwMvMwCV2fu7ZrsZH9SKMp9WSGLKC+i31WndfM+frXN4sPvuH9w6+orV5IQ9e9ZyfL3g4f
 rWG7aetHaUsDGJcDLJiiizPv4jvDxIJm9d5wd8NZg4rE8gQBi5OAZiItyUjw6sjzxQ4DtU+eKxS
 vvH1lgeXZAX7sk8X3267Whxu8rz8fB3D/8oZYmmbF/D99t5rvYvDWH/z7caXj3f8bt538lfH7D1
 yenwA
X-Developer-Key: i=ljs@kernel.org; a=openpgp;
 fpr=E7F417BF5214569E89D04F46CF9DCD8A81E27F14
X-MailFrom: ljs@kernel.org
X-Mailman-Rule-Hits: max-recipients
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: UWXZWQUNIDRNYWOZYM6D67SBNBFAXJ2E
X-Message-ID-Hash: UWXZWQUNIDRNYWOZYM6D67SBNBFAXJ2E
X-Mailman-Approved-At: Sun, 12 Jul 2026 13:41:51 +0000
CC: Lorenzo Stoakes <ljs@kernel.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-aio@kvack.org, linux-fsdevel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, dri-devel@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-tegra@vger.kernel.org, virtualization@lists.linux.dev,
 intel-xe@lists.freedesktop.org, xen-devel@lists.xenproject.org,
 linux-fbdev@vger.kernel.org, linux-sound@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/UWXZWQUNIDRNYWOZYM6D67SBNBFAXJ2E/>
Archived-At: 
 <https://lore.freedesktop.org/20260711-b4-vma-flags-mm-v2-5-0fa2357d5431@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Currently mm->def_flags (of type vm_flags_t) is union'd with
mm->def_vma_flags (of type vma_flags_t).

As part of the effort to convert vm_flags_t usage to vma_flags_t (in order
to no longer be arbitrarily limited to a system word size for VMA flags),
prefer mm->def_vma_flags to mm->def_flags throughout the mm logic.

We update dump_mm() to use the %*pb format which means we make no
assumption about the number of VMA flag bits on output when outputting
default VMA flags.

No functional change intended.

Reviewed-by: Lance Yang <lance.yang@linux.dev>
Reviewed-by: Zi Yan <ziy@nvidia.com>
Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>
---
 mm/debug.c |  5 +++--
 mm/mlock.c | 13 +++++++------
 mm/mmap.c  | 11 ++++++-----
 mm/vma.c   |  2 +-
 4 files changed, 17 insertions(+), 14 deletions(-)

diff --git a/mm/debug.c b/mm/debug.c
index 497654b36f1a..9a0297b3988d 100644
--- a/mm/debug.c
+++ b/mm/debug.c
@@ -197,7 +197,7 @@ void dump_mm(const struct mm_struct *mm)
 		"numa_next_scan %lu numa_scan_offset %lu numa_scan_seq %d\n"
 #endif
 		"tlb_flush_pending %d\n"
-		"def_flags: %#lx(%pGv)\n",
+		"def_flags: %*pb(%pGv)\n",
 
 		mm, mm->task_size,
 		mm->mmap_base, mm->mmap_legacy_base,
@@ -226,7 +226,8 @@ void dump_mm(const struct mm_struct *mm)
 		mm->numa_next_scan, mm->numa_scan_offset, mm->numa_scan_seq,
 #endif
 		atomic_read(&mm->tlb_flush_pending),
-		mm->def_flags, &mm->def_flags
+		NUM_VMA_FLAG_BITS, mm->def_vma_flags.__vma_flags,
+		&mm->def_vma_flags
 	);
 }
 EXPORT_SYMBOL(dump_mm);
diff --git a/mm/mlock.c b/mm/mlock.c
index 97e49038d8d3..34ffa954006f 100644
--- a/mm/mlock.c
+++ b/mm/mlock.c
@@ -699,26 +699,27 @@ SYSCALL_DEFINE2(munlock, unsigned long, start, size_t, len)
 
 /*
  * Take the MCL_* flags passed into mlockall (or 0 if called from munlockall)
- * and translate into the appropriate modifications to mm->def_flags and/or the
- * flags for all current VMAs.
+ * and translate into the appropriate modifications to mm->def_vma_flags and/or
+ * the flags for all current VMAs.
  *
  * There are a couple of subtleties with this.  If mlockall() is called multiple
  * times with different flags, the values do not necessarily stack.  If mlockall
  * is called once including the MCL_FUTURE flag and then a second time without
- * it, VM_LOCKED and VM_LOCKONFAULT will be cleared from mm->def_flags.
+ * it, VM_LOCKED and VM_LOCKONFAULT will be cleared from mm->def_vma_flags.
  */
 static int apply_mlockall_flags(int flags)
 {
 	VMA_ITERATOR(vmi, current->mm, 0);
+	struct mm_struct *mm = current->mm;
 	struct vm_area_struct *vma, *prev = NULL;
 	vm_flags_t to_add = 0;
 
-	current->mm->def_flags &= ~VM_LOCKED_MASK;
+	vma_flags_clear_mask(&mm->def_vma_flags, VMA_LOCKED_MASK);
 	if (flags & MCL_FUTURE) {
-		current->mm->def_flags |= VM_LOCKED;
+		vma_flags_set(&mm->def_vma_flags, VMA_LOCKED_BIT);
 
 		if (flags & MCL_ONFAULT)
-			current->mm->def_flags |= VM_LOCKONFAULT;
+			vma_flags_set(&mm->def_vma_flags, VMA_LOCKONFAULT_BIT);
 
 		if (!(flags & MCL_CURRENT))
 			goto out;
diff --git a/mm/mmap.c b/mm/mmap.c
index 39d33f3a55c2..ae9a5018e20e 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -102,15 +102,16 @@ void vma_set_page_prot(struct vm_area_struct *vma)
  */
 static int check_brk_limits(unsigned long addr, unsigned long len)
 {
+	const struct mm_struct *mm = current->mm;
+	const bool is_def_locked =
+		vma_flags_test(&mm->def_vma_flags, VMA_LOCKED_BIT);
 	unsigned long mapped_addr;
 
 	mapped_addr = get_unmapped_area(NULL, addr, len, 0, MAP_FIXED);
 	if (IS_ERR_VALUE(mapped_addr))
 		return mapped_addr;
 
-	return mlock_future_ok(current->mm,
-			      current->mm->def_flags & VM_LOCKED, len)
-		? 0 : -EAGAIN;
+	return mlock_future_ok(mm, is_def_locked, len) ? 0 : -EAGAIN;
 }
 
 SYSCALL_DEFINE1(brk, unsigned long, brk)
@@ -197,7 +198,7 @@ SYSCALL_DEFINE1(brk, unsigned long, brk)
 		goto out;
 
 	mm->brk = brk;
-	if (mm->def_flags & VM_LOCKED)
+	if (vma_flags_test(&mm->def_vma_flags, VMA_LOCKED_BIT))
 		populate = true;
 
 success:
@@ -1247,7 +1248,7 @@ int vm_brk_flags(unsigned long addr, unsigned long request, bool is_exec)
 
 	vma = vma_prev(&vmi);
 	ret = do_brk_flags(&vmi, vma, addr, len, vma_flags);
-	populate = ((mm->def_flags & VM_LOCKED) != 0);
+	populate = vma_flags_test(&mm->def_vma_flags, VMA_LOCKED_BIT);
 	mmap_write_unlock(mm);
 	userfaultfd_unmap_complete(mm, &uf);
 	if (populate && !ret)
diff --git a/mm/vma.c b/mm/vma.c
index 70b08c76ea2f..1f443d979a7d 100644
--- a/mm/vma.c
+++ b/mm/vma.c
@@ -3426,7 +3426,7 @@ struct vm_area_struct *__install_special_mapping(
 	if (unlikely(vma == NULL))
 		return ERR_PTR(-ENOMEM);
 
-	vm_flags |= mm->def_flags | VM_DONTEXPAND;
+	vm_flags |= vma_flags_to_legacy(mm->def_vma_flags) | VM_DONTEXPAND;
 	if (pgtable_supports_soft_dirty())
 		vm_flags |= VM_SOFTDIRTY;
 	vm_flags_init(vma, vm_flags & ~VM_LOCKED_MASK);

-- 
2.55.0

