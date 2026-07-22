Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4704DC4453C
	for <nouveau@archiver.kernel.org>; Wed, 22 Jul 2026 21:45:01 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id EBB7410EED2;
	Wed, 22 Jul 2026 21:45:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ir2H3ScM";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 5E47C47321;
	Wed, 22 Jul 2026 21:29:29 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1784755769;
 b=jtw9YER7TKRezAlw5eqVkRGuGFtV10qBEWPxdReWWvxyWt/kxu3mxTFqYszlQt8OtZaNt
 9Hr+ldK83quxdd2vo7SGvSbxid0YMI2VSYAD7HkjFBUFFIG8NA+txxc/zqmYClmKOGlZ8eq
 I2g0sYDlCrpssGCRqEiO6HwM0GVqTO7cg2ydmCo0ZWtqE30wHgaYdV4YEFUob/W9vHn5Xim
 BMho6ZgVBqOnD/atpFEYbANGHoFV+1/Gm5nAoJ2dGDcXPR7ReIrCXqg4vHdqpBmrZ3oEKJJ
 XJmXDINk9tXrH9NNNLAKSlBfAZBex5c2WPfkuUiE3IpvJ1+HdzvzqcVPVj+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1784755769; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=Hwr2PA6k/yzOHBkhyRcV60oQVyvCsFMHOEQ+QEbH+Ag=;
 b=fXiOtctwshS6ZS33th4c0u809VtkRKACvtAccsyHhxmpptgfz2LnAG8JJGJr7hCrFMD/H
 rHb3/6jl3JbreuWcv8WSw6nPByu5DrRtpxBhTr64U4DdM+XiumvcMRk36esIsNZVyu6aCki
 3TnyxFJA3L5HeJKWkGSdXdXfh7wJTvawGg5+/RxAs/2b0oWoiLPxW/pqGmaQYBegLHQjRyJ
 DSjeig9bTm1g6FRQym+OJWaBrDi+JaOK7A9U/beU3DE3KLOB/5FLCEajxUG73adr4bRXCt+
 Owxi0cb/6BbmJeg8pJuESoQOU2VfQc4m/5Y25w9KN9/XDhAS9v5IHFkWq+tw==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 38EE747318
	for <nouveau@lists.freedesktop.org>; Wed, 22 Jul 2026 21:29:26 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A33AC10E514
	for <nouveau@lists.freedesktop.org>; Wed, 22 Jul 2026 21:44:57 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id
 d2e1a72fcca58-84864086bfeso588167b3a.1
        for <nouveau@lists.freedesktop.org>;
 Wed, 22 Jul 2026 14:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784756697; x=1785361497;
 darn=lists.freedesktop.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hwr2PA6k/yzOHBkhyRcV60oQVyvCsFMHOEQ+QEbH+Ag=;
        b=Ir2H3ScMeokp/QSaS7KllnXLnr5QrWE9Bx6fNfx3+6glyYVUuBr9V+pcaJyXS3982r
         Kr5IPAANfzp6A79GzGZ1O48RDmRGsGC4EbTEsGt9KzaeW8ulirODchhaYINWZTevN9Un
         wEAsvA1XMHTAa7gVY6wWNuO+22EFKvIMLZaav8nX8jgvFA7qbNGNyEtL8o2mzGMFyoBZ
         v6lM8Ihto1vgZLEj22OkI5UGSZCTWNCIjb9pO+FYmfVZbkably9bpCW1iJmNYQOulngJ
         jwqyQtPLPzFX1AFMVxaqHxHirfUD2uywQSneAYchSH1miTgjiJjwp1sn79zegEHdAP57
         YgMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784756697; x=1785361497;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hwr2PA6k/yzOHBkhyRcV60oQVyvCsFMHOEQ+QEbH+Ag=;
        b=cqwAc20NsHVtvsZK5Df5BwF3NYO9U+d1MUoRt2/q/bPoaPH+dfSZgVMYuPwjlFSZIw
         I/pJkYPvMkk6Rwsww9QcpBY/VPBzsT8v3bpB0FrJT9XnUlUPZ1qdOJICyEx/mvcqDx7B
         kEJlHjI+UaxwD9dqCxo0DnPb4z6RZQ0Ina+JpTIdM8XANa0ZBjGSfAbIAv1VbHQQIZ5p
         tw5heoadiTjU+G+uCs+rTqd1oDWRLpBKnuzCOg7M/fBMXzbXfbtF6hwqDTX+jr4hZ8aI
         xPp572ot4hrHaiiwwEd97XwU4KI+7y545CQw5PKgbZYg0d7zBY/RsSKo7v5VbWKTrtUL
         4phA==
X-Forwarded-Encrypted: i=1;
 AHgh+RrWKPTDlLD/m+PJtwIxoMiFcurWxC0DTxIl0e8ON7ZODc667bqoeaD67RVA6bvJwtHShaGw+M5b@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwgAnXquQQHmv5lX7xCt6lHYBsaw2mqz2qYyd1Ff8b+RZyU/9mI
	8cMP50RwbU3IU+159V1XqE6m1dkb6/Z7OE0+HIC50YUB2nFR8sk6/ny6
X-Gm-Gg: AR+sD12ZtIiUgiJ+fnwGXsf2zGsrTWGGy+aCD8RscC7oR3WwEyXKllplM/WPGg2cvlS
	hkI10xLTUUcP5hAc/x5Jy9RR2T2LeeupvLqYn/yit5ZbHb7s6rW0qTMCCfLPH021XGD6Y4bC5Kj
	R0eQz3k4Yp/2iyJMWcBhW8MT42sNFYw/QjyH2D0KBdelSjWv1bDFJUhvqq354NpzvhBmsgYioUL
	5Uk6p6BD9y5P/dsLjl3GsON/V4FhiwMaJWcmnSeUBqMrxmDJNDi7UJOKBXMmMlu4De7lEztWEJB
	CQfui977TBpCSbjhtSSfeR24ugrQEi0KdeHi1uOv7pZTiu2omiYWzNMJLUNiOQuAD2CGL912EVI
	lo1C+n98Dmnalnh+PtiIRDp77zUH1QIPTvldPNgJevHLCi7av3iov4/7sSyCwUiYLwc55mWam0G
	25gRJzcb87i3OdVKRO67VOEXxN1fHEy4PMVcUVUL/Cwagb6KOB
X-Received: by 2002:a05:6a00:1388:b0:848:7b92:8e74 with SMTP id
 d2e1a72fcca58-84e2c1b9f43mr598680b3a.39.1784756697112;
        Wed, 22 Jul 2026 14:44:57 -0700 (PDT)
Received: from [192.168.0.160] (c-98-225-44-182.hsd1.wa.comcast.net.
 [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-84e17237c3fsm1946297b3a.9.2026.07.22.14.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 14:44:56 -0700 (PDT)
From: Stanislav Kinsburskii <skinsburskii@gmail.com>
Date: Wed, 22 Jul 2026 14:44:28 -0700
Subject: [PATCH v10 6/8] RDMA/umem: Use hmm_range_fault_unlocked_timeout()
 for ODP faults
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-hmm-v10-v1-6-606464dd601a@gmail.com>
References: <20260722-hmm-v10-v1-0-606464dd601a@gmail.com>
In-Reply-To: <20260722-hmm-v10-v1-0-606464dd601a@gmail.com>
To: Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Shuah Khan <shuah@kernel.org>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Min Ma <mamin506@gmail.com>, Lizhi Hou <lizhi.hou@amd.com>,
 Oded Gabbay <ogabbay@kernel.org>, skinsburskii@gmail.com
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784756683; l=2457;
 i=skinsburskii@gmail.com; s=20260722; h=from:subject:message-id;
 bh=wCDSwsZ/5jgwWzEqFja4q7w3SxWPNbitK21qCohy6H8=;
 b=oTLl/A3KKM6QVfczDQir+MiwWd6xegg7AP0nwym7Jb+EYIV4zgzMMZlGO0Uy3Tv+0wtFJYifg
 zfmA30BQ0D/AoP9W2yBY0iwSakKcdy31nmnUIbQ0QmfiWeEgduaY6fE
X-Developer-Key: i=skinsburskii@gmail.com; a=ed25519;
 pk=bDpriHBYgeTdkIDweZDCemxsU93neJBOCn3YLIuJpnE=
Message-ID-Hash: JSDKI2HZFBUV7JPQVPEMLTIPGEFYCZLD
X-Message-ID-Hash: JSDKI2HZFBUV7JPQVPEMLTIPGEFYCZLD
X-MailFrom: skinsburskii@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-hyperv@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-rdma@vger.kernel.org,
 Jason Gunthorpe <jgg@ziepe.ca>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/JSDKI2HZFBUV7JPQVPEMLTIPGEFYCZLD/>
Archived-At: 
 <https://lore.freedesktop.org/20260722-hmm-v10-v1-6-606464dd601a@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

ib_umem_odp_map_dma_and_lock() takes mmap_read_lock() only around
hmm_range_fault(), then retries -EBUSY until HMM_RANGE_DEFAULT_TIMEOUT
expires.

Use hmm_range_fault_unlocked_timeout() instead. The HMM helper now owns
the mmap lock and refreshes range->notifier_seq for its internal retries.
ODP keeps using HMM_RANGE_DEFAULT_TIMEOUT for each HMM fault attempt,
while interval invalidation retries continue to be handled by the existing
outer loop.

ODP still validates the interval notifier sequence while holding umem_mutex
before DMA mapping pages.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Stanislav Kinsburskii <skinsburskii@gmail.com>
---
 drivers/infiniband/core/umem_odp.c | 18 +++++-------------
 1 file changed, 5 insertions(+), 13 deletions(-)

diff --git a/drivers/infiniband/core/umem_odp.c b/drivers/infiniband/core/umem_odp.c
index 404fa1cc3254..9cc21cd762d9 100644
--- a/drivers/infiniband/core/umem_odp.c
+++ b/drivers/infiniband/core/umem_odp.c
@@ -329,7 +329,7 @@ int ib_umem_odp_map_dma_and_lock(struct ib_umem_odp *umem_odp, u64 user_virt,
 	struct mm_struct *owning_mm = umem_odp->umem.owning_mm;
 	int pfn_index, dma_index, ret = 0, start_idx;
 	unsigned int page_shift, hmm_order, pfn_start_idx;
-	unsigned long num_pfns, current_seq;
+	unsigned long num_pfns;
 	struct hmm_range range = {};
 	unsigned long timeout;
 
@@ -363,26 +363,18 @@ int ib_umem_odp_map_dma_and_lock(struct ib_umem_odp *umem_odp, u64 user_virt,
 	}
 
 	range.hmm_pfns = &(umem_odp->map.pfn_list[pfn_start_idx]);
-	timeout = jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
+	timeout = msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
 
 retry:
-	current_seq = range.notifier_seq =
-		mmu_interval_read_begin(&umem_odp->notifier);
-
-	mmap_read_lock(owning_mm);
-	ret = hmm_range_fault(&range);
-	mmap_read_unlock(owning_mm);
-	if (unlikely(ret)) {
-		if (ret == -EBUSY && !time_after(jiffies, timeout))
-			goto retry;
+	ret = hmm_range_fault_unlocked_timeout(&range, timeout);
+	if (unlikely(ret))
 		goto out_put_mm;
-	}
 
 	start_idx = (range.start - ib_umem_start(umem_odp)) >> page_shift;
 	dma_index = start_idx;
 
 	mutex_lock(&umem_odp->umem_mutex);
-	if (mmu_interval_read_retry(&umem_odp->notifier, current_seq)) {
+	if (mmu_interval_read_retry(&umem_odp->notifier, range.notifier_seq)) {
 		mutex_unlock(&umem_odp->umem_mutex);
 		goto retry;
 	}

-- 
2.43.0

