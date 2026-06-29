Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 014C4C43602
	for <nouveau@archiver.kernel.org>; Mon, 29 Jun 2026 19:26:21 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id F37AD10EA21;
	Mon, 29 Jun 2026 19:26:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="klEBAvxA";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 93FC746D63;
	Mon, 29 Jun 2026 19:11:39 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1782760299;
 b=DM5j/J8hTuise3WYJ4hEKWgpwB1MSgHSQVS7CVhVmL2wkgYE0kILYeQ/zZV85Ax3RT2uh
 d5ofGHzK5BYWXm73/SqcLkXZGnZSH058yQHejQHU8R3wNUWf7FlfjZoDiYfuugUZjzOigrz
 es99xeLetrLYHEFSKLP+yVPBB00c0hj+ans5aqteUQOC91fvtQZGwKXcyU4ZecwsKXmlshu
 /7HLrrbGJs0PCUoWyBkXsqfr5ZfACx2UMtdCquBcQcRZZFJQTNFZwzykCM5Dh6Cn5dxdiks
 9wxni6BK6tEuFUh6Q0FvAOAgxX92ejqJvwKlEmtkLYYjMRk/u5jNx4/uFLIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1782760299; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=kVNcj1n0t63iEIMvCjdqZpMGs73q5Ko9ggshfmmLkXE=;
 b=eWnkmuOMxU/wFPNOXPdq0W/QsI1K3mVy4GLRDdQX4TJKpfwDp2lVvb0UaL/NA5aDm9bOD
 gyTuQI50Wu1nXXHM4fzDpL8tovS8anStm9BYGPrJYbg3U69dwMx/r+3LKQioMmK/xzO5HUT
 74X8x4irA5wZlk0KlOMfHuh1DjReqKls+QnO816N9G9Mjny4FjiMX3Y3jDjzQb6yN7xESX/
 7XRm1pBkwR4CjrTQyFTFGZkIcGklhGU6yEDuaA9cJG1qT3gcZWTuPCMbhMLQ4RoFcPWcLYf
 d7ParFZgINirHcTFeJWG5LFYyoH5OFUtWXJKbP/P6WgBeBxHpZGKgSnh0WJw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 4328D46D52
	for <nouveau@lists.freedesktop.org>; Mon, 29 Jun 2026 19:11:37 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5CB5B10EA13;
	Mon, 29 Jun 2026 19:26:17 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D2D50601BE;
	Mon, 29 Jun 2026 19:26:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC1611F00A3A;
	Mon, 29 Jun 2026 19:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782761176;
	bh=kVNcj1n0t63iEIMvCjdqZpMGs73q5Ko9ggshfmmLkXE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=klEBAvxAFllrYroNuPJLJ6gpkhIWH2gTVoT+/xDpJL5trOYXohBGpPUklmeyy3M8s
	 V8yPCwMkEt0hiRNtDQFKpdz3l1uU7duIasGbSIztboWDM2ZAqiJD0rorDwfoqGlBAa
	 LG7rxtse+7tEtmE7jUNFo/a5he8kyou91LnB1mOd3C/3gEPhWsxleGxfu6UNzRLKT4
	 q/kle54fQbZ80BilK1fYXEKilUW+HJlbq+uSEtkk9SKLXzWuUuYgjrQUH6aBSmWp7O
	 s8EEU2+Bt7ipQc2WUzag4pdln2sWzLqlewf7/vmu4r9kXvNYawRuP/0vdC2aunN5Wg
	 EWS79jrl2lb4w==
From: Lorenzo Stoakes <ljs@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 07/13] mm/vma: rename vma_get_page_prot to
 vma_flags_to_page_prot
Date: Mon, 29 Jun 2026 20:25:30 +0100
Message-ID: 
 <fc8ac30d03d29d236e76542b36432bba315aca60.1782760670.git.ljs@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1782760670.git.ljs@kernel.org>
References: <cover.1782760670.git.ljs@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: SJFV2RKVMPANOAD64SHJLJCZK5KGBB35
X-Message-ID-Hash: SJFV2RKVMPANOAD64SHJLJCZK5KGBB35
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/SJFV2RKVMPANOAD64SHJLJCZK5KGBB35/>
Archived-At: 
 <https://lore.freedesktop.org/fc8ac30d03d29d236e76542b36432bba315aca60.1782760670.git.ljs@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Having vma_get_page_prot() refer to VMA flags and vma_set_page_prot() refer
to a VMA is confusing.

Rename vma_get_page_prot() to vma_flags_to_page_prot() to resolve this
confusion.

No functional change intended.

Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>
---
 include/linux/mm.h              | 4 ++--
 mm/vma.c                        | 2 +-
 mm/vma.h                        | 2 +-
 tools/testing/vma/include/dup.h | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 474b3698f565..c8336f68d7bb 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -4568,7 +4568,7 @@ static inline bool range_in_vma_desc(const struct vm_area_desc *desc,
 #ifdef CONFIG_MMU
 pgprot_t vm_get_page_prot(vm_flags_t vm_flags);
 
-static inline pgprot_t vma_get_page_prot(vma_flags_t vma_flags)
+static inline pgprot_t vma_flags_to_page_prot(vma_flags_t vma_flags)
 {
 	const vm_flags_t vm_flags = vma_flags_to_legacy(vma_flags);
 
@@ -4581,7 +4581,7 @@ static inline pgprot_t vm_get_page_prot(vm_flags_t vm_flags)
 {
 	return __pgprot(0);
 }
-static inline pgprot_t vma_get_page_prot(vma_flags_t vma_flags)
+static inline pgprot_t vma_flags_to_page_prot(vma_flags_t vma_flags)
 {
 	return __pgprot(0);
 }
diff --git a/mm/vma.c b/mm/vma.c
index 395b6619ecc1..fcdd2ac3ac68 100644
--- a/mm/vma.c
+++ b/mm/vma.c
@@ -56,7 +56,7 @@ struct mmap_state {
 		.pglen = PHYS_PFN(len_),				\
 		.vma_flags = vma_flags_,				\
 		.file = file_,						\
-		.page_prot = vma_get_page_prot(vma_flags_),		\
+		.page_prot = vma_flags_to_page_prot(vma_flags_),	\
 	}
 
 #define VMG_MMAP_STATE(name, map_, vma_)				\
diff --git a/mm/vma.h b/mm/vma.h
index 6a8abb8ae937..d6b48d596f44 100644
--- a/mm/vma.h
+++ b/mm/vma.h
@@ -524,7 +524,7 @@ static inline bool vma_wants_manual_pte_write_upgrade(struct vm_area_struct *vma
 #ifdef CONFIG_MMU
 static inline pgprot_t vma_pgprot_modify(pgprot_t oldprot, vma_flags_t vma_flags)
 {
-	const pgprot_t prot = vma_get_page_prot(vma_flags);
+	const pgprot_t prot = vma_flags_to_page_prot(vma_flags);
 
 	return pgprot_modify(oldprot, prot);
 }
diff --git a/tools/testing/vma/include/dup.h b/tools/testing/vma/include/dup.h
index 813044781719..1ffac38a5377 100644
--- a/tools/testing/vma/include/dup.h
+++ b/tools/testing/vma/include/dup.h
@@ -1555,7 +1555,7 @@ static inline int get_sysctl_max_map_count(void)
 #define pgtable_supports_soft_dirty()	IS_ENABLED(CONFIG_MEM_SOFT_DIRTY)
 #endif
 
-static inline pgprot_t vma_get_page_prot(vma_flags_t vma_flags)
+static inline pgprot_t vma_flags_to_page_prot(vma_flags_t vma_flags)
 {
 	const vm_flags_t vm_flags = vma_flags_to_legacy(vma_flags);
 
-- 
2.54.0

