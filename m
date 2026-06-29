Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E09A6C44501
	for <nouveau@archiver.kernel.org>; Mon, 29 Jun 2026 19:26:25 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B2E1510EA4B;
	Mon, 29 Jun 2026 19:26:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nOPttWfe";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 5E41946D68;
	Mon, 29 Jun 2026 19:11:45 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1782760305;
 b=H00vHBTf71X3OqYFa3smd001tFbQb2CYs8GEeD9PrghUsLyjjhvDYa+k/AtpVU+ZJz+oY
 ts6RoacjOG7GBg3qU2uOcZ3cs01FJKcUomVVumpaVMBNGUi7MGrk9ygSMC14QKXWCluxWM6
 QzMJxHiNg16SYKJbbsx2to+m5hnc+MPI7yCfvV51u1lRPAnQTb+sIxXpnS4X/B0+faWnEZB
 A0fFoJLF4DGP26C2PgViCi3k0n0TEKwnglk98Z906SIyCNBwXyWIk9A0lo0NpNZRrBk8tPP
 iQufYi/GKSfRM5g2+QaiBf5NFhiiEGgs1v67Ps/Nu7O5Kxn/lIZVP3fJEebA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1782760305; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=Wnm2Xg8fzgzgq2t9tP+R94oZiE2QRSqcJqSUSdbb+xI=;
 b=qqeLtcGLNc+3dj1h9PPjh7zMEsNddN4S7MP0gqgJa3BTV8sUkTkEvLNg40hXaUrPD1Uu5
 fv6U9wWl9ItMVI9HBYn1/heXxn8X0mu0VMzhLXzWqknr2I5OT0hsyyAPqvejofvYIDRtPU9
 0F35KSdO/+D66oIveSz9mMldCijaAbZgjBURJJXFXKZGz43MHY6zWBkuxJx83Ww9NadGGGF
 jbk9hqzoaloWpf8E4ZjkjsvjLPTa0HPs0yqKHp3gQ0TSmtvdJ3CqSIc9Z94VBDqv29uUil/
 65jsCU+mO3ku7KCrQITg8jVRIKq8RdevErFYMD57fXhVRY/T+FzBBsnRbyEQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 19E9446D52
	for <nouveau@lists.freedesktop.org>; Mon, 29 Jun 2026 19:11:43 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2BCA710E9F4;
	Mon, 29 Jun 2026 19:26:23 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8623360129;
	Mon, 29 Jun 2026 19:26:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E1DD1F00A3A;
	Mon, 29 Jun 2026 19:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782761182;
	bh=Wnm2Xg8fzgzgq2t9tP+R94oZiE2QRSqcJqSUSdbb+xI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=nOPttWfeqx2WAAk+O86bRHV1xe9XjSiO7vWMcbguW/QG8cwhr9Ho+WujRZfoXIkNB
	 GAafXcLTt0A7107oO1/wfsRqbvh2NXnLmJEY5U2oNVlhqSlYA3t7vnfmg9ypcMiIQu
	 8h9CwqzwF/QmgcsSy6FddnicElSxEL4LUhf+meGHiuuHtZIY/zI5z4sASrd3sx6zbv
	 h+vKpCS3OgfNT1Vzh95SLJ33rPs0Xs2s5lFkRLuYrK0Dv+UhZIFDZTErNLJ48+783p
	 GrekfoEk+r6DJVzhZY0W/8o+WObqmyaivps6ZsvmcWguDnXNLCk/ULQ2n7338Yb/Eb
	 NW0mBvRR/aD3g==
From: Lorenzo Stoakes <ljs@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 09/13] mm/vma: update create_init_stack_vma() to use
 vma_flags_t
Date: Mon, 29 Jun 2026 20:25:32 +0100
Message-ID: 
 <34689784ee6856f100c02ad4eabeaa4db643713a.1782760670.git.ljs@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1782760670.git.ljs@kernel.org>
References: <cover.1782760670.git.ljs@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 3IQ3SJJL6KPMVMCTW2MYEOIKRFT72MNO
X-Message-ID-Hash: 3IQ3SJJL6KPMVMCTW2MYEOIKRFT72MNO
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/3IQ3SJJL6KPMVMCTW2MYEOIKRFT72MNO/>
Archived-At: 
 <https://lore.freedesktop.org/34689784ee6856f100c02ad4eabeaa4db643713a.1782760670.git.ljs@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Replace use of the legacy vm_flags_t flags with vma_flags_t values in
create_init_stack_vma().

As part of this change we add VMA_STACK_EARLY and VMA_STACK_INCOMPLETE
vma_flags_t defines, and slightly rework create_init_stack_vma() for
clarity.

No functional change intended.

Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>
---
 include/linux/mm.h |  4 ++++
 mm/vma_exec.c      | 18 +++++++++++-------
 2 files changed, 15 insertions(+), 7 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index b55790c75038..6e57d41677de 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -440,8 +440,10 @@ enum {
 #define VM_STACK	INIT_VM_FLAG(STACK)
 #ifdef CONFIG_STACK_GROWSUP
 #define VM_STACK_EARLY	INIT_VM_FLAG(STACK_EARLY)
+#define VMA_STACK_EARLY mk_vma_flags(VMA_STACK_EARLY_BIT)
 #else
 #define VM_STACK_EARLY	VM_NONE
+#define VMA_STACK_EARLY EMPTY_VMA_FLAGS
 #endif
 #ifdef CONFIG_ARCH_HAS_PKEYS
 #define VM_PKEY_SHIFT ((__force int)VMA_HIGH_ARCH_0_BIT)
@@ -532,6 +534,8 @@ enum {
 
 /* Bits set in the VMA until the stack is in its final location */
 #define VM_STACK_INCOMPLETE_SETUP (VM_RAND_READ | VM_SEQ_READ | VM_STACK_EARLY)
+#define VMA_STACK_INCOMPLETE_SETUP append_vma_flags(		\
+	VMA_STACK_EARLY, VMA_RAND_READ_BIT, VMA_SEQ_READ_BIT)
 
 #define TASK_EXEC_BIT ((current->personality & READ_IMPLIES_EXEC) ? \
 		       VMA_EXEC_BIT : VMA_READ_BIT)
diff --git a/mm/vma_exec.c b/mm/vma_exec.c
index b01c4964f2c9..48c783e73cf3 100644
--- a/mm/vma_exec.c
+++ b/mm/vma_exec.c
@@ -112,15 +112,17 @@ int relocate_vma_down(struct vm_area_struct *vma, unsigned long shift)
 int create_init_stack_vma(struct mm_struct *mm, struct vm_area_struct **vmap,
 			  unsigned long *top_mem_p)
 {
-	unsigned long flags = VM_STACK_FLAGS | VM_STACK_INCOMPLETE_SETUP;
+	vma_flags_t flags = VMA_STACK_INCOMPLETE_SETUP;
+	struct vm_area_struct *vma;
 	int err;
-	struct vm_area_struct *vma = vm_area_alloc(mm);
 
+	/* VMA_STACK_FLAGS and VMA_STACK_INCOMPLETE_SETUP must not overlap. */
+	VM_WARN_ON_ONCE(vma_flags_test_any_mask(&flags, VMA_STACK_FLAGS));
+
+	vma = vm_area_alloc(mm);
 	if (!vma)
 		return -ENOMEM;
 
-	vma_set_anonymous(vma);
-
 	if (mmap_write_lock_killable(mm)) {
 		err = -EINTR;
 		goto err_free;
@@ -134,18 +136,20 @@ int create_init_stack_vma(struct mm_struct *mm, struct vm_area_struct **vmap,
 	if (err)
 		goto err_ksm;
 
+	vma_flags_set_mask(&flags, VMA_STACK_FLAGS);
+	vma_set_anonymous(vma);
+
 	/*
 	 * Place the stack at the largest stack address the architecture
 	 * supports. Later, we'll move this to an appropriate place. We don't
 	 * use STACK_TOP because that can depend on attributes which aren't
 	 * configured yet.
 	 */
-	VM_WARN_ON_ONCE(VM_STACK_FLAGS & VM_STACK_INCOMPLETE_SETUP);
 	vma->vm_end = STACK_TOP_MAX;
 	vma->vm_start = vma->vm_end - PAGE_SIZE;
 	if (pgtable_supports_soft_dirty())
-		flags |= VM_SOFTDIRTY;
-	vm_flags_init(vma, flags);
+		vma_flags_set(&flags, VMA_SOFTDIRTY_BIT);
+	vma->flags = flags;
 	vma->vm_page_prot = vma_get_page_prot(vma);
 
 	err = insert_vm_struct(mm, vma);
-- 
2.54.0

