Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6997BC44506
	for <nouveau@archiver.kernel.org>; Sun, 12 Jul 2026 13:57:12 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 42C3B10E4B4;
	Sun, 12 Jul 2026 13:57:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="kGl604zO";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 8F52145FA7;
	Sun, 12 Jul 2026 13:42:03 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1783863723;
 b=gQMbkLhRqNzAUep3+Usmq0J+kdEkVW+C1UixfU5NlRlWt73MNYgdOr6Nx33nngIwFo0vo
 VEBf9qbvFGjIPXMU+GJv4rCy5NZKy08Ea66vr2jydgVI8PFhtMdJ8ugdSU8Vx6tx+kEAqyO
 8fY8O0qUVjE8GnJKh7JxboU+U23Gn9U5mBtaGDKOg7gvMNLlxnwM/Zy2SvZIPYBdS+B2jRz
 OrLwvN16ic7hq3QPQAUulDa2O7SdhD9vvAJsZCkCRPjPkNCZubpeWoQZ3z5+yL2gBKfz+re
 FBHpuhzvdAb8fiJamo58BUKliCKQCEAARSjClJdN0AreVDPXK03OokfJROug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1783863723; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=VYkDI6h+waLNcPjkBya9DGnDggZvgWVLygEReXlfsZM=;
 b=ih+pNXAsof/3c4tLt3iL6YEXFJJW/7zuFNP10JD79ST/DevAcEp1w/+UpMG5YjR0CwJAs
 BCBeKpqtY4kf75B8OFiqCbuFYqasTB0Gt6EmLEXlGt9y4qqfq+0bJXU2PSFWbufNl0E4iRs
 a6p487QGE06DkqGiryWCDjVFvshGxA9Q3oCVqA4DPwHFtKQcuSonT1jy6s7vXjWB5zZaDyj
 kS6HtqWd6rfY0KaSP/iW16u4UERurlhNvOg8aJ2gmSJkf99xRG7bIuvggh7RICneVnvGZXS
 1cDnEHhw+iJzM5wYfeTR+Gydu9gJOeq4NNTF2CdqzVkfVYR8/9zxmckQJ08g==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id EE9A8470E2
	for <nouveau@lists.freedesktop.org>; Sat, 11 Jul 2026 18:35:08 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9DB2410E2FF;
	Sat, 11 Jul 2026 18:50:15 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 16B8760052;
	Sat, 11 Jul 2026 18:50:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2690E1F00A3A;
	Sat, 11 Jul 2026 18:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783795814;
	bh=VYkDI6h+waLNcPjkBya9DGnDggZvgWVLygEReXlfsZM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=kGl604zOY5i/9BHc7cLc4ryqHD+01SAUicrFqMKwslfHQhi80jDyaMm2MyxhO5qOt
	 5Pq/TrS3o9h1Q+W/qwP8lSEVI5jCfMdWQHJGOSTzqQxcgi/ZcaaOXqvQkVb1FUVgE6
	 9YbVEPYs9ZC7WBFyRZhHqrj+/ntYKTZVK3XRtCayQvKHxiWeP6HYUE54e0sI1syKFA
	 s2zK3U9ax8wTAugutxfyxWaRWS5LrbXoh4d2i5NgoY8R2qopkb5XoFfc+IxgcXnP6J
	 LumgNfEnvhlL0OZHtdfacxoMtfjedGIBKxF4rKadinDpk8PtJvmtheBqh+pFiShHQX
	 BbDB2Fj9clkaw==
From: Lorenzo Stoakes <ljs@kernel.org>
Date: Sat, 11 Jul 2026 19:45:10 +0100
Subject: [PATCH v2 13/13] mm/mremap: convert mremap code to use vma_flags_t
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260711-b4-vma-flags-mm-v2-13-0fa2357d5431@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6381; i=ljs@kernel.org;
 h=from:subject:message-id; bh=PIqQBUvFAhhZLltfbuAmGUSiDj9zb0uqnBAJox/uNeE=;
 b=owGbwMvMwCV2fu7ZrsZH9SKMp9WSGLKC+q2WCm/T1ymxZjMq/yxer2XvM7/x212H55Myy179n
 RqvN8Gno5SFQYyLQVZMkeX5F/H9QSJh8zov+LvBzGFlAhnCwMUpABPpOszIsGhLcPGPAz1FjgKb
 Jc53v4/W6X/HznOmXdW58Edb+l2lCQz/DLaa7emYsZ9lb/CKY38l3gjvWSW8537dgQvfdvIpbK9
 8xgIA
X-Developer-Key: i=ljs@kernel.org; a=openpgp;
 fpr=E7F417BF5214569E89D04F46CF9DCD8A81E27F14
X-MailFrom: ljs@kernel.org
X-Mailman-Rule-Hits: max-recipients
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: FJO6FCKW6GXULQ3GMAWUIK5DY6RYREP3
X-Message-ID-Hash: FJO6FCKW6GXULQ3GMAWUIK5DY6RYREP3
X-Mailman-Approved-At: Sun, 12 Jul 2026 13:41:55 +0000
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/FJO6FCKW6GXULQ3GMAWUIK5DY6RYREP3/>
Archived-At: 
 <https://lore.freedesktop.org/20260711-b4-vma-flags-mm-v2-13-0fa2357d5431@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Replace use of the legacy vm_flags_t flags with vma_flags_t values
throughout the mremap logic.

Note that, in replacing vm_flags_clear() (which takes the VMA write lock)
with vma_clear_flags() and vma_clear_flags_mask() (which do not)
respectively in unmap_source_vma() and dontunmap_complete(), we do not add
a VMA write lock to account for htis.

This is because, in both cases, move_vma() is their calling function and
this has already acquired the VMA write lock on vrm->vma whose VMA flags
are being cleared.

In the case of vma_set_flags() in unmap_source_vma() we do need to do this
- as prev and next were not necessarily write locked at this point.

Additionally update comments to reflect the changes to be consistent.

No functional change intended.

Reviewed-by: Zi Yan <ziy@nvidia.com>
Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>
---
 mm/mremap.c | 38 ++++++++++++++++++++------------------
 1 file changed, 20 insertions(+), 18 deletions(-)

diff --git a/mm/mremap.c b/mm/mremap.c
index 384ef4cc2195..b64aa1f6e07e 100644
--- a/mm/mremap.c
+++ b/mm/mremap.c
@@ -68,7 +68,7 @@ struct vma_remap_struct {
 	bool populate_expand;		/* mlock()'d expanded, must populate. */
 	enum mremap_type remap_type;	/* expand, shrink, etc. */
 	bool mmap_locked;		/* Is mm currently write-locked? */
-	unsigned long charged;		/* If VM_ACCOUNT, # pages to account. */
+	unsigned long charged;		/* If VMA_ACCOUNT_BIT, # pgs to account */
 	bool vmi_needs_invalidate;	/* Is the VMA iterator invalidated? */
 };
 
@@ -963,7 +963,7 @@ static unsigned long vrm_set_new_addr(struct vma_remap_struct *vrm)
 
 	if (vrm->flags & MREMAP_FIXED)
 		map_flags |= MAP_FIXED;
-	if (vma->vm_flags & VM_MAYSHARE)
+	if (vma_test(vma, VMA_MAYSHARE_BIT))
 		map_flags |= MAP_SHARED;
 
 	res = get_unmapped_area(vma->vm_file, new_addr, vrm->new_len, pgoff,
@@ -985,7 +985,7 @@ static bool vrm_calc_charge(struct vma_remap_struct *vrm)
 {
 	unsigned long charged;
 
-	if (!(vrm->vma->vm_flags & VM_ACCOUNT))
+	if (!vma_test(vrm->vma, VMA_ACCOUNT_BIT))
 		return true;
 
 	/*
@@ -1012,7 +1012,7 @@ static bool vrm_calc_charge(struct vma_remap_struct *vrm)
  */
 static void vrm_uncharge(struct vma_remap_struct *vrm)
 {
-	if (!(vrm->vma->vm_flags & VM_ACCOUNT))
+	if (!vma_test(vrm->vma, VMA_ACCOUNT_BIT))
 		return;
 
 	vm_unacct_memory(vrm->charged);
@@ -1032,7 +1032,7 @@ static void vrm_stat_account(struct vma_remap_struct *vrm,
 	struct vm_area_struct *vma = vrm->vma;
 
 	vm_stat_account(mm, vma->vm_flags, pages);
-	if (vma->vm_flags & VM_LOCKED)
+	if (vma_test(vma, VMA_LOCKED_BIT))
 		mm->locked_vm += pages;
 }
 
@@ -1176,7 +1176,7 @@ static void unmap_source_vma(struct vma_remap_struct *vrm)
 	 * arose, in which case we _do_ wish to unmap the _new_ VMA, which means
 	 * we actually _do_ want it be unaccounted.
 	 */
-	bool accountable_move = (vma->vm_flags & VM_ACCOUNT) &&
+	bool accountable_move = vma_test(vma, VMA_ACCOUNT_BIT) &&
 		!(vrm->flags & MREMAP_DONTUNMAP);
 
 	/*
@@ -1195,7 +1195,7 @@ static void unmap_source_vma(struct vma_remap_struct *vrm)
 	 * portions of the original VMA that remain.
 	 */
 	if (accountable_move) {
-		vm_flags_clear(vma, VM_ACCOUNT);
+		vma_clear_flags(vma, VMA_ACCOUNT_BIT);
 		/* We are about to split vma, so store the start/end. */
 		vm_start = vma->vm_start;
 		vm_end = vma->vm_end;
@@ -1220,8 +1220,8 @@ static void unmap_source_vma(struct vma_remap_struct *vrm)
 	 * |             |
 	 * |-------------|
 	 *
-	 * Having cleared VM_ACCOUNT from the whole VMA, after we unmap above
-	 * we'll end up with:
+	 * Having cleared VMA_ACCOUNT_BIT from the whole VMA, after we unmap
+	 * above we'll end up with:
 	 *
 	 *    addr  end
 	 *     |     |
@@ -1241,13 +1241,15 @@ static void unmap_source_vma(struct vma_remap_struct *vrm)
 		if (vm_start < addr) {
 			struct vm_area_struct *prev = vma_prev(&vmi);
 
-			vm_flags_set(prev, VM_ACCOUNT); /* Acquires VMA lock. */
+			vma_start_write(prev);
+			vma_set_flags(prev, VMA_ACCOUNT_BIT);
 		}
 
 		if (vm_end > end) {
 			struct vm_area_struct *next = vma_next(&vmi);
 
-			vm_flags_set(next, VM_ACCOUNT); /* Acquires VMA lock. */
+			vma_start_write(next);
+			vma_set_flags(next, VMA_ACCOUNT_BIT);
 		}
 	}
 }
@@ -1330,8 +1332,8 @@ static void dontunmap_complete(struct vma_remap_struct *vrm,
 	unsigned long old_start = vrm->vma->vm_start;
 	unsigned long old_end = vrm->vma->vm_end;
 
-	/* We always clear VM_LOCKED[ONFAULT] on the old VMA. */
-	vm_flags_clear(vrm->vma, VM_LOCKED_MASK);
+	/* We always clear VMA_LOCKED[ONFAULT]_BIT on the old VMA. */
+	vma_clear_flags_mask(vrm->vma, VMA_LOCKED_MASK);
 
 	/*
 	 * anon_vma links of the old vma is no longer needed after its page
@@ -1767,14 +1769,14 @@ static int check_prep_vma(struct vma_remap_struct *vrm)
 	 * based on the original.  There are no known use cases for this
 	 * behavior.  As a result, fail such attempts.
 	 */
-	if (!old_len && !(vma->vm_flags & (VM_SHARED | VM_MAYSHARE))) {
+	if (!old_len && !vma_test_any(vma, VMA_SHARED_BIT, VMA_MAYSHARE_BIT)) {
 		pr_warn_once("%s (%d): attempted to duplicate a private mapping with mremap.  This is not supported.\n",
 			     current->comm, current->pid);
 		return -EINVAL;
 	}
 
 	if ((vrm->flags & MREMAP_DONTUNMAP) &&
-			(vma->vm_flags & (VM_DONTEXPAND | VM_PFNMAP)))
+	    vma_test_any(vma, VMA_DONTEXPAND_BIT, VMA_PFNMAP_BIT))
 		return -EINVAL;
 
 	/*
@@ -1804,7 +1806,7 @@ static int check_prep_vma(struct vma_remap_struct *vrm)
 		return 0;
 
 	/* We are expanding and the VMA is mlock()'d so we need to populate. */
-	if (vma->vm_flags & VM_LOCKED)
+	if (vma_test(vma, VMA_LOCKED_BIT))
 		vrm->populate_expand = true;
 
 	/* Need to be careful about a growing mapping */
@@ -1812,10 +1814,10 @@ static int check_prep_vma(struct vma_remap_struct *vrm)
 	if (pgoff + (new_len >> PAGE_SHIFT) < pgoff)
 		return -EINVAL;
 
-	if (vma->vm_flags & (VM_DONTEXPAND | VM_PFNMAP))
+	if (vma_test_any(vma, VMA_DONTEXPAND_BIT, VMA_PFNMAP_BIT))
 		return -EFAULT;
 
-	if (!mlock_future_ok(mm, vma->vm_flags & VM_LOCKED, vrm->delta))
+	if (!mlock_future_ok(mm, vma_test(vma, VMA_LOCKED_BIT), vrm->delta))
 		return -EAGAIN;
 
 	if (!may_expand_vm(mm, &vma->flags, vrm->delta >> PAGE_SHIFT))

-- 
2.55.0

