Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2791EC531FA
	for <nouveau@archiver.kernel.org>; Thu, 23 Jul 2026 17:37:00 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1A95E10F1CA;
	Thu, 23 Jul 2026 17:36:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GGR5f6Zr";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id AB8B347367;
	Thu, 23 Jul 2026 17:21:24 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1784827284;
 b=XwN45xZR6KIVMNfR0zkcE8zguUeqqzNecWY2CAgWv5iXzqzw7bOS+Va6S+d8t7XDHicBU
 UJ+PqGimgLuJEgdSEa7gx+pm8m2g+dE0m1eXAj7GJeyqX4olWOcrJwNrqZO+JZYzZmBUKHW
 s5/EE7yfHjud/5xV375iGD8zw5Ws6V9xsLlMQmj6TcfZxFQq2AjAP43pjg5AoedF/KwgH9E
 ZwhaClwj0TutrQT6kru0/eNybErWdv5aGCG1bBp47pBvVnrulRY66j2mqO3tkIaR5nTEiNX
 nj6oBNcQRpH8/cXi1lr8g3rJTPIpOLhvXNvc7Q9ahbgDFZyRkWR++lwJ+CcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1784827284; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=Hwr2PA6k/yzOHBkhyRcV60oQVyvCsFMHOEQ+QEbH+Ag=;
 b=Eg5LViFHKkED99ZzU/NwNzaLr29SXor83tDmQaHp1ugVIV0pTzKMMgTqj72kv0QGMu0xD
 bbJ9na3CpwB2kg0L9zwetdXBOmR+Z3SyiN3rjQCk/7Jyy3Jp7cWiIa3Ijsnn2xMeWqrytkY
 QOrA/LSVVMcxc5f0t2IDaFsKEEXoXYYpkXDjgI17SdMYAxXkK+RLVp9NgtHxwWxSptJw16z
 KDemGnVL49MbXi2tpk0LzUQpW54WUxjkPsw3cTPThivGrw1quXiXUM0K1NRz+UnVg15Sdtz
 Pj9ACts+Q0JX1oPYiGcku0zmM0ah8VPwird/MkFBUEmsWg5XOFOPywpnAd/A==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id D08494735A
	for <nouveau@lists.freedesktop.org>; Thu, 23 Jul 2026 17:21:21 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1D83E10F1B3
	for <nouveau@lists.freedesktop.org>; Thu, 23 Jul 2026 17:36:55 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id
 d2e1a72fcca58-84e0688b7e8so849354b3a.1
        for <nouveau@lists.freedesktop.org>;
 Thu, 23 Jul 2026 10:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784828214; x=1785433014;
 darn=lists.freedesktop.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hwr2PA6k/yzOHBkhyRcV60oQVyvCsFMHOEQ+QEbH+Ag=;
        b=GGR5f6ZrpEI+Q5fY42W2c1c4S5ZLLZ5s1pld2eBHRo/Dj1SsWu4DdJKnYyPoAaBx9e
         kZa0MNGPCXA+p2jTiBkYogfNKmZP0UCX0Xat4EJqf5hyOxjuZ+D8KWw4rW/Symb9CXlD
         g2QJRpY5yn7On+ArcfJRZZnlA69aQdIGfXyzTDInPBUnR/IF6W2O8X1HnzZwC2KCnBFt
         czS2SthIQj1XCqGbKLqhHnZY/UFdjreGZIputSJv0S+JpGF69YQrZVR+RqjaXDVEJm8b
         5129XyavmVecfMadkmUQbFkDKLbgkBvQhnh9aphpUIOY6obmLLTrlElm717auvPQnL57
         pjyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784828214; x=1785433014;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hwr2PA6k/yzOHBkhyRcV60oQVyvCsFMHOEQ+QEbH+Ag=;
        b=GI+JTL+UyNPpQ6/5ma08VgJm0Xhlf3prB8TbuDtAZ1EkFRqneiJR35nN7UgWpi/y/b
         o8LElqV06fVWIgVp8A95HLjJD3mHtf141GKZrp/LsSYG4EiT1SH0JQjucPLB7CpDxrpX
         8S7M4IfZalKTrC9V4pX8UpOO3lR2JZLuCj90dRJHTCfRqsSQcMWP+yd1HXXfRYEH3D99
         815rbA5PKkYK9qwl7couT0En6gyy3zwCc/L13PZbeL4K5phD6VRvCVoC/SmaGgjQIH28
         ppMUMNMVrAOgulld9lDyKDtDTEYptAJfrdcMu/OmeqpqAibBEb4t5qcrCUEycW/ZRBLZ
         YqHA==
X-Forwarded-Encrypted: i=1;
 AHgh+RqPkkcNtt4ztKUB/gVBe28Gk+rtaRtfotd4nLsYwFtd9YON5tpop5Y9+rybEvGSYCmEu8EYZ/tT@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz/ztY9c/Je3lwVmcXtDvyv+ZEA+5EY4b939weJVpLd2iTAtrPt
	1uYaHUSzH23HZ29s9B9BmYWkYyuzLQClmoEJXKqbvmXtVu4owGASo+Zh
X-Gm-Gg: AR+sD11Rex7FUmwZAaUa3neaJ43Gblj/mzjCO19gCL5EDoNNbDd6fa1NIS4VOf07DwJ
	ETHMPpabF1SJB6X7eeeQbs0R3c0S4Ma6U43AKm4TAmyV+bzLe4xBzkCZW6ImGgum179pw19oGs8
	ldOZSck+QjpMaimubY9Wh5o2H3WV2Wt6U33im0p2kgFp263dm5lgQs1d8hMkwXw8LQuck1Ag/sC
	AWeuzISCkOoHd+0EaDCXSBX6Om3t1rxLKJ1jQZHbLogs1/N4XSscq6sIgFRRMvW8O+hyGm2DT6v
	kYp1/U8lQif9982MaWxbi3Qw+XZv0t1jH8gLyxvw4BRXrgTfnoye0lfZxLy0uvTGS0f4NuDFCc5
	tlngSKZO4lPN45u3EIIe94EXwtFXSCnjcgMV0kqFgiD+onHE7956u70p/D68cycZKnPGPd/HMda
	VHuLQAYnmoAAPKp1CenbGc+JslHiv3gTvIgCc6XRTzM3taqGiJ
X-Received: by 2002:a05:6a00:e88:b0:847:b16b:46d9 with SMTP id
 d2e1a72fcca58-84e2b8aa77bmr4617793b3a.34.1784828214639;
        Thu, 23 Jul 2026 10:36:54 -0700 (PDT)
Received: from [192.168.0.160] (c-98-225-44-182.hsd1.wa.comcast.net.
 [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-84e20622dedsm2691612b3a.11.2026.07.23.10.36.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 10:36:54 -0700 (PDT)
From: Stanislav Kinsburskii <skinsburskii@gmail.com>
Date: Thu, 23 Jul 2026 10:36:38 -0700
Subject: [PATCH v11 6/8] RDMA/umem: Use hmm_range_fault_unlocked_timeout()
 for ODP faults
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-hmm-v10-v11-6-c55b003a4b61@gmail.com>
References: <20260723-hmm-v10-v11-0-c55b003a4b61@gmail.com>
In-Reply-To: <20260723-hmm-v10-v11-0-c55b003a4b61@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784828202; l=2457;
 i=skinsburskii@gmail.com; s=20260722; h=from:subject:message-id;
 bh=wCDSwsZ/5jgwWzEqFja4q7w3SxWPNbitK21qCohy6H8=;
 b=gezzOLTGQ+6T3Wy5w3nFtel93rrT2Kd9eeZ0n6f5FEQw8Beb0IrNif+mDyjnRhH39tdmJbOsG
 yXEZFknqYwdCOt8awUKVwHYE2B6xTW+3MpwtLFeYQDVzLwrWkfuTvq6
X-Developer-Key: i=skinsburskii@gmail.com; a=ed25519;
 pk=bDpriHBYgeTdkIDweZDCemxsU93neJBOCn3YLIuJpnE=
Message-ID-Hash: LWXGFBI6TARJE37X7S44EYK3XV4ZCQFE
X-Message-ID-Hash: LWXGFBI6TARJE37X7S44EYK3XV4ZCQFE
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/LWXGFBI6TARJE37X7S44EYK3XV4ZCQFE/>
Archived-At: 
 <https://lore.freedesktop.org/20260723-hmm-v10-v11-6-c55b003a4b61@gmail.com/>
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

