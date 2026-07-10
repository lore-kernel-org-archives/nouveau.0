Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E2CEC44506
	for <nouveau@archiver.kernel.org>; Fri, 10 Jul 2026 21:27:11 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3710410E4B2;
	Fri, 10 Jul 2026 21:27:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BN5435Am";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 42F3247069;
	Fri, 10 Jul 2026 21:12:06 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1783717926;
 b=QEexczp7iUrnUHwn6r8eyY0blF8KsOrctLYD5UYubUUUALO13gMI3dL0NarbIBA7N/3k4
 Gu7se4zTNI9AQqGcBAIQM9C6DDtUR911e5tZXNjSEfhBtXLxg8qgmCT6WJA0WcjiW3Y61So
 L+QG7ak2E0thEtYYNnSZuKunPGZJmLEbn7cryR7oTTb2IO8xFurmjdH/84i8qBnsjPYllId
 Fy/P97GGAyH2U4RgA5+OxLhvNEclMZjEqeUrzvH1yba7ebo1v7sGnOiYGvF6tMSD9bAyDwj
 nvynDfepOqFnQREx3+5E3cQ8O4mmE2V5RgHy+8NTV2gNJdVlV8zNS2X51jGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1783717926; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=rz6324+iAv2KNy97kcq58R5fN0X8s7ommcJ7e4qhr4M=;
 b=BKjqgd7OJ+crB1jTHd7PJztdz+bQeFohK+Z4SuzBXxdNjBcFl4k29jF9Jj15vHHyTRHcB
 Oyijiu3S3DAy9Gq/JECzuEqOMiHdPIYLtEpnpN4OCKuYVHxFTS6CTqNWuuACKtsTePz6mCn
 PvW9HgO5Bv5iQrXhbG7PTQcbpfeX+seyXcqtuC594HCI3OeSeb/K2f9yo8/JmiLXX94q8mn
 WzvlK23tyJ6XWpnAEUV8nX3+v+P73B6j4+tyxeqIxpoeZteIyg4+z9eNrc8k7ndYe63WYw5
 jkC0f9loEBKD05kvhpqX82LvBvXYZ6EfRgzt0lsTPSZt/IsiNZWdYqSC3MqQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id A643C46FDF
	for <nouveau@lists.freedesktop.org>; Fri, 10 Jul 2026 21:12:03 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7961810E254
	for <nouveau@lists.freedesktop.org>; Fri, 10 Jul 2026 21:27:08 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-2ccdb73f0e1so12003675ad.3
        for <nouveau@lists.freedesktop.org>;
 Fri, 10 Jul 2026 14:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783718828; x=1784323628;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:subject:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=rz6324+iAv2KNy97kcq58R5fN0X8s7ommcJ7e4qhr4M=;
        b=BN5435AmMgO+RYf0Zl8r1Ftw+L5ZRkvq45wVmg8MJKcTMJ0XUGb7MOw5n72MyYKFtR
         nmsW82TDdMhwCc6KUxh9TPvuyc6a0MGw63emJg2wLG2M/wG/fzgAtx824tq6VNrR4sJE
         VjtYRppT8CbZmFQyeh8RyQxGr4Y/rc4EMUA5NoNMKnm2ytDP2VO8KfdgzVUcjRDXIWuj
         /5ATLHbVtcbxjTkTjY3JiSydsYZBl3gFpcsnUb84hOoFi6iZxrNYTfeWbVJHIabktAZV
         ln/ZyIRS2NBWUwbkUmpcIcZGBo5gJ+srVpqFgbCBBoiNni6D3Z3JlbqA1YOKcEZkplUw
         0XkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783718828; x=1784323628;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rz6324+iAv2KNy97kcq58R5fN0X8s7ommcJ7e4qhr4M=;
        b=R4uChG4phB5v+apzBYiE83awhJqkV0ssZpNLKugybrBLuu23278SbSW5zamyqVRfoJ
         yXcya5kOESqASrCB5q3n5hl+9hxPEplQ7/DVxZPD47KBLfv/p89prK4gA5HwL7qGlt8g
         UDBaGUa5uA6ddWftxMcBNITR1bvXnm1T2Jtf40yyusJ/FE0ow1++yAIeMi6wDzOz8NC6
         Ve9WLMfGhlGYAYNHTJrqOBzIKgA7pRohj6IzbHdUllYndha+oA/vgARn0t9Ikl5Mlea8
         lGotZ7Bg4c6qsQrnND1OFZzbXv9OzJXCQ5GJ7kuPFE5LjSCJVBzJaRpXWvdKqvQ+g6KC
         jTYA==
X-Forwarded-Encrypted: i=1;
 AHgh+RrWxQUSKQ0Mk0lj5nlb8rt0PQFS4L5t9rjltI9qye6VmtgkOTikSOpek9kXsfeR1q7vxDRfbci2@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxL0/NyMP9NdtMkung/3WT07HjQDAFWiBSfy8hS3tIzeUk+EFTA
	/wkjCaB4387dWNx0tPS7XZEOeyqIlTDjIDedhrxMCCN24yfVWNpBPy3/
X-Gm-Gg: AfdE7cl8hPDUMVcYH8k12BU+PrdjJ6NY4HepAau+gdXhQ5AHuHMlpFQ8Z38D1HXKNdg
	cMEmQBJMhP/Q49i5SADVDSi9S56CIM2M0m028mvE6kRDBl4DxF6f3UWjgy+pIApkSkX3y3xzbIf
	NQJezLDOzDh8f7aMg9o1v/7Fv0FjZnZLArswt6i8eBDS0HTeIjWSevVjRNNjmpQRgXP3thSis/Q
	ObFC1YuVVcdJXfG74/JyqrxMf6jPK1h16w+0TlT0kCzayyuzb+o65MImZeLIT20KUf9mJVLsLMq
	hHYH1hVPMsG5TfqftyhXVU5j3EJYFi2lFHuZFwydMTNS1QyyLZGoxKjXhWwcGSVnLepQYGIdU9m
	GYcXmDqVJk1QIOusDvgSKzVbG1mq3vkcRQUMl0wy2dy89x1kIg1rNPxNvZheP1AmagP6gxwJRIS
	BlyndwNPzsHSD5jqY646xqPXpyTP1Ugm5d/FqcDO1sDzZ39b1mNxEClcuGxqzrdMvTyQChSQ==
X-Received: by 2002:a17:902:d98b:b0:2ca:1bbe:c3d0 with SMTP id
 d9443c01a7336-2ce9f3d5e4amr6769265ad.43.1783718827906;
        Fri, 10 Jul 2026 14:27:07 -0700 (PDT)
Received: from [192.168.0.160] (c-98-225-44-182.hsd1.wa.comcast.net.
 [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ccc9d3bd33sm65951165ad.58.2026.07.10.14.27.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 14:27:07 -0700 (PDT)
Subject: [PATCH v8 6/8] RDMA/umem: Use hmm_range_fault_unlocked_timeout() for
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
Date: Fri, 10 Jul 2026 14:27:05 -0700
Message-ID: <178371882559.900500.4008217424194230517.stgit@skinsburskii>
In-Reply-To: <178371866223.900500.12312667138651735591.stgit@skinsburskii>
References: <178371866223.900500.12312667138651735591.stgit@skinsburskii>
User-Agent: StGit/0.19
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID-Hash: YXJTG52RLMWQDYC5P32ZWTX6NNZZKM7N
X-Message-ID-Hash: YXJTG52RLMWQDYC5P32ZWTX6NNZZKM7N
X-MailFrom: skinsburskii@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 linux-doc@vger.kernel.org, linux-hyperv@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-rdma@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/YXJTG52RLMWQDYC5P32ZWTX6NNZZKM7N/>
Archived-At: 
 <https://lore.freedesktop.org/178371882559.900500.4008217424194230517.stgit@skinsburskii/>
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
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
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


