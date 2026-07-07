Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0734C44503
	for <nouveau@archiver.kernel.org>; Wed,  8 Jul 2026 23:27:22 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7E79B10F330;
	Wed,  8 Jul 2026 23:27:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="pT0OoEJp";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id C829346FA2;
	Wed,  8 Jul 2026 23:12:21 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1783552341;
 b=K9SMlsVG5a6ahoKHJzzEkTIx2VL8FCh0M53iM3AAvIVo/vcDd+7bkwuYjwmZHGW6IhbEA
 0TeEjCtmFnGo2SoHj2KzdSx49yXRXpXGXPPIvR3Qczh+4FGudb53iChf79Ht8G3u6+tkM7Y
 l5oAhcXAP0VwZxQG/386qQlMCylWETiMUl+sbkkfQQ0JPrROeLo4D2vxHoDJjbogQ24S4o1
 pVWMlC9fz3I/hyEegz0CkmNaLNopk7hFTOl4jAwPq+Aof1zqx95ZEAs3uHRtD+KcYi5M85x
 mrjgBYwZzooSFP5yo2ADH/X0Kdl09kwvsFuGrje9iz6485TF5hBuJ0xyhvXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1783552341; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=MurgedTImf2dmSaSEEivYoY5j30SVqg6Is/CYFnqB6k=;
 b=aQuX15O7wsXbWJ14DOpO8ZK4vfug8zGLQezo9HD4ZQfa19fZa2lBDAk6EAsapIVfKGIEA
 1m8leZ6N3UPdNGH53hTBKFKJBvH1OzfKxfMZa75aY6PMh8I4y0dk4wTfNddfh0ZTAt0BdQ1
 UF8oiPrLpA2ZkQATIm+gUT5HTbF5zKL9w4jiNz1jPnuQcGiPqXvZnDhIQHHdA2pl8lfOU+c
 iaciwVsLqzimP6rI+riDFpU75CGeloj14uxa7jR3KpN5SO0uD15yr73mlNwCs5dUlwPh60s
 tqZXAHOE/ZV+4MxpJEHgtIB5KX0Hq9+G2OHQPJT3MgfOt+ihzOKnYVPvbbcg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 58F3646F69
	for <nouveau@lists.freedesktop.org>; Tue,  7 Jul 2026 19:32:34 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5B97810EEEE
	for <nouveau@lists.freedesktop.org>; Tue,  7 Jul 2026 19:47:32 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-2cc73e322dbso30439035ad.1
        for <nouveau@lists.freedesktop.org>;
 Tue, 07 Jul 2026 12:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783453652; x=1784058452;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:message-id:date:cc:to:from:subject:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MurgedTImf2dmSaSEEivYoY5j30SVqg6Is/CYFnqB6k=;
        b=pT0OoEJpVs/vqCJllNkPFjOcESTuWYdGWFCGsdCemP9+llP9zceihiVKaMBtanLaeL
         57sI+CNyZYIHaDtJfh9Hc+WIYutNLbgVviIzbPAg1PIiw7xYCVnzGyCcL3qrt5YyWPq0
         ZBznLkUISlZezrno6nGObM1tkaPl9yxsBXFQff3Gyk6G79JxmxlmLsOKYWM34o59euSS
         c9S6sKHKotCQtW1F5n1W4dwMcD+HN4noat4aMpz302JbSE6SvLtHQ4uSB2IHOGS1qyus
         80OTA9HVdG3INdZeptnqQJepUz/DVb4yJZyMcQKTZIqfV+08TyLLvO74euXlX4DkvwRd
         Zsqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783453652; x=1784058452;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:message-id:date:cc:to:from:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MurgedTImf2dmSaSEEivYoY5j30SVqg6Is/CYFnqB6k=;
        b=LM0X0ITMcMBQ4wy8jvAbeeBHuy3wlwnxkBPyAQ4Bj1d88k9QHjwAhckGRFFwkxscyu
         vIkGeUhEiq41C6eHtGzJW9a28H0zFDFLlg5Zeqqwl2+QDTwqKTPHT8+XCaBGWOu1MbD0
         dLX8tiA4uJBN7qlr124gK99WZ31r7p77/O/t/YvTBfk64LAVJJth/ase4sW0qy6YBGIH
         7DzR2CrvpGbGIqcTo6A0VyH/78FZ450upgmOYwl0pVZVehlbIwvfCnCjIIgIR/3PLs7W
         qENBFZ/h508j8QoU0YJv1iC9kOXl4JtLbka0DfjaxNOHCx+KMdeUPy2/Fr+op4RaJQtr
         ZgDg==
X-Forwarded-Encrypted: i=1;
 AHgh+Rq36MxAwI9QUD+bH7MmkWRLE+6qbSkIER+Huyvu7g/p+xuj6rORb5TinUMFFtvgtEB1tr9QmRuX@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzFVLfFIyB7wzAzfYvqT0t8a5I3tafW7++GkUh5qnk4360GcpSv
	ShBWBYyvjVDVeOE+93iGeXaCHLBHKUEUkkfNoyQxd2dr5gocLRSG26DtY6yZ4A==
X-Gm-Gg: AfdE7ckDsqX8DO+k0Yv9jQHSfM/+9wN9jwnXeFkTwyMYIamK/axTjgkZo3cBr1llPPN
	0HLBY9XbS99Ol51pL1UaQvT0BE8jRZW0SqQQDR05R7J0mB9kdq6a24uo1nA5g4s4CZr9fdJZOQS
	1stj1P2Us9fJGviSLcHMc7G8P1lckJq7bGfYjE3/ngFmuAYQAQP7+VfdmOvPUJ4WMKRUQhmDIZz
	U430jaJ/uRweiGJMUz4mqcWiXU+Jw7sj6Gb+qCIc7JuWUXWq48Z+3WkqUFDxbJr1T6VOz2HdakA
	TGbcpNii7z5+QPRNgzIU8Lrm74yAsSaKxiJ7E0XNaLbckUjjIFWmvasCV4F9sgjw+meS8u2o76h
	LQU2d79W9kO9l7+PStsJtBoLqGC25LlOwXVaB5wm5T0tiifz7hc2iWDRhFQgN3LX1rTKgUn/A4y
	f03z+1pNJZJUKADr7lkzncOR4Ou951nGJPy71xANELQiEXJu/o065f2dfV5B0=
X-Received: by 2002:a17:902:ef44:b0:2c9:cf62:6f61 with SMTP id
 d9443c01a7336-2ccbe616252mr63274975ad.17.1783453651528;
        Tue, 07 Jul 2026 12:47:31 -0700 (PDT)
Received: from [192.168.0.160] (c-98-225-44-182.hsd1.wa.comcast.net.
 [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ccc9d1e0c4sm17270585ad.49.2026.07.07.12.47.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 12:47:31 -0700 (PDT)
Subject: [PATCH v7 6/8] RDMA/umem: Use hmm_range_fault_unlocked_timeout() for
 ODP faults
From: Stanislav Kinsburskii <skinsburskii@gmail.com>
To: airlied@gmail.com, akhilesh@ee.iitb.ac.in, akpm@linux-foundation.org,
 corbet@lwn.net, dakr@kernel.org, david@kernel.org, decui@microsoft.com,
 haiyangz@microsoft.com, jgg@ziepe.ca, kees@kernel.org, kys@microsoft.com,
 leon@kernel.org, liam@infradead.org, lizhi.hou@amd.com, ljs@kernel.org,
 longli@microsoft.com, lyude@redhat.com, maarten.lankhorst@linux.intel.com,
 mamin506@gmail.com, mhocko@suse.com, mripard@kernel.org,
 nouveau@lists.freedesktop.org, ogabbay@kernel.org, oleg@redhat.com,
 rppt@kernel.org, shuah@kernel.org, simona@ffwll.ch,
 skhan@linuxfoundation.org, skinsburskii@gmail.com, surenb@google.com,
 tzimmermann@suse.de, vbabka@kernel.org, wei.liu@kernel.org,
 skinsburskii@gmail.com
Date: Tue, 07 Jul 2026 12:47:29 -0700
Message-ID: <178345364975.660027.8790629832830633290.stgit@skinsburskii>
In-Reply-To: <178345345668.660027.2952911919681614557.stgit@skinsburskii>
References: <178345345668.660027.2952911919681614557.stgit@skinsburskii>
User-Agent: StGit/0.19
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-MailFrom: skinsburskii@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: F76MPIDESHGN2EM7IFRMBAZYOH5WYBES
X-Message-ID-Hash: F76MPIDESHGN2EM7IFRMBAZYOH5WYBES
X-Mailman-Approved-At: Wed, 08 Jul 2026 23:12:16 +0000
CC: dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 linux-doc@vger.kernel.org, linux-hyperv@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-rdma@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/F76MPIDESHGN2EM7IFRMBAZYOH5WYBES/>
Archived-At: 
 <https://lore.freedesktop.org/178345364975.660027.8790629832830633290.stgit@skinsburskii/>
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

Signed-off-by: Stanislav Kinsburskii <skinsburskii@gmail.com>
---
 drivers/infiniband/core/umem_odp.c |   18 +++++-------------
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


