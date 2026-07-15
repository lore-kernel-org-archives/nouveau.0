Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D2FCC44508
	for <nouveau@archiver.kernel.org>; Wed, 15 Jul 2026 18:16:43 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id EEAA110F117;
	Wed, 15 Jul 2026 18:16:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cVhHrgaH";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 4062F471E8;
	Wed, 15 Jul 2026 18:01:27 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1784138487;
 b=Pj1s4ChfD7WvEIHBeva8AoZTW3nzDYuhpOtGYsnt8G+63+N3m7/GL73DpF1li7B18+X6o
 okWU2ow0ik8sBmogwRUuc8gt9wqwyH0mJNhvv+7GCk6P6DeDt9iF+NFu+hbP1baaUYJxLzw
 OCvDZyJKoB0u5po/ARTPdKITq62a0D7OXvlAYRTb0h31xWexEYZX1joZXLyAzguKgUF8VEb
 S1k0wghqzCNF6TO6VNYEE4qlw4A9zjbSuvckdAeJ1/KpQur7AMTry4XCrq4j+NY9BClc5EV
 fUeq8MavHo3rC009wWfaHWl+JM7qAa4fWsS4ODfUx8Kaq9jpoKr2HABGdVrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1784138487; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=xews/oLHPsdqsmPpn1oXU4/lUwRmc6mOTrGvCA27l7U=;
 b=NwvJZfatMtZt4ZnzV+55J5DgYTWixMc5/+8yK5XsRpWRoigecwHVhSXNhJ7WsYbAESoV5
 9kt1wnrwjw1BGuhZbI4Df426bfGK2DGNfzfFARL1XfLZPEaOW951bLFn1aUMhqldj4nl/kS
 xiPvG3T4KPr8QB1Xip1rRkFZ3W7Ggks4Ly+9APsVr1080Ms799V5Zpkz6774qfu0cl8881n
 OxfP3ndoUJQiK8D0ON5oBZ0nkUK9oyH6xBkBClpNXwHN4Ev6ucwaxicvtrkYM58WIIVGaES
 Kuh4X4bYFfZYcyLdI1Vz0jyXveraOkPuXiNl5QMKQQnmriGU206oBOLHUPiA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id A56CD46CB5
	for <nouveau@lists.freedesktop.org>; Wed, 15 Jul 2026 18:01:24 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4561B10F140
	for <nouveau@lists.freedesktop.org>; Wed, 15 Jul 2026 18:16:40 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-2ce87c7e3bbso63990395ad.1
        for <nouveau@lists.freedesktop.org>;
 Wed, 15 Jul 2026 11:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784139400; x=1784744200;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:subject:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=xews/oLHPsdqsmPpn1oXU4/lUwRmc6mOTrGvCA27l7U=;
        b=cVhHrgaHhTNMpKyPxASD+efk7INLNPehfUrpBdOlYo06M+zQo0MT+XGbs4Yuaw2o4f
         JpMvn7qiWZZ0FRmkVAwZ3NZjTC3YgeuhI8leRDk1hB4qjMH3t/C5vco69z8OPAuV0kmj
         0C59Viyrq8/keiY95btqT2idXMc7bUwHkd2lNzPiZeGaiMdE0WlvUg8ab2JjulOEBaTV
         GZUiCUfxGM7EndgJcUeaJaku47X6EGojUdE5MfBZ6qX6yqG8RrZEAjk04DdJQvTwd1AE
         2kblR0X8jm2pr3mN2XxfM+RwI5ALtMVhSXthejitpslL7kx6LPuqTI5CvSXxY8TE95Uu
         PGVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784139400; x=1784744200;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xews/oLHPsdqsmPpn1oXU4/lUwRmc6mOTrGvCA27l7U=;
        b=Ecvp1i+kRsrCDTgMDGX2CNarV4+AaMkCmZFW8qvQjwFzq+2QNhc9Vu8HOMx9+Q5bbY
         3i9NgudHcCz27kiHP4NdTCW3WKY9a2NKkeO+c4psyR/grzv4BDdXtwPuW9QtkqH003wi
         gfsfJvL112PUbWjg8OE4ZBAGcTcB+5aO1hUtzqx7c0BIrM9cvWm94fGkHYLNjAM4c4I7
         LwrqC9HMViC+TJSWQp4NIUZ/3B45m+AqEAwRNnKs5S4NtxMeqth6gW5KbnXfCjPQCM8o
         cgpkludbrFX3MJ5O/H47lmYUeWr2jkAknmd7hTo1NsQXFMGBIgcxTJH6LiIvG/bzoVR/
         ozpA==
X-Forwarded-Encrypted: i=1;
 AHgh+Ro8CvuKjVA+yRDAd31Rf6G8V1glQAGrGU3Oi/7kQdltpC7hP1aWX3KorZvgb7YIpSCxPUpTErfU@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyPBtVlT/tRCKOezn4y4fgE4sEW096VvAKVI9N0xhIFo20d5Hox
	IUnKb3nGd1WyQlF81QvG3plmQz2geilMN7n22evSQZ7UrIqyZvDChzmM
X-Gm-Gg: AfdE7ckcVE8A+xQMHM8+28OxTp/4+DI+zHYS6eqftD5iEAxL7pTM02ljiP283v+3Oup
	6DftR1jksuLdM3Vk+/NBoLf0JY69SL4UVsqAznmMz7ZDtfTkBw3a8OmlHdSy4ZxRVCOvR+9yYtW
	PJSxulu4eAg894tjCHHF41VrKdWd/45Anyscs6fu8uY4lku4dseeTOg8mYUhtB41EDhnk0SR82s
	pZ/M90hghezCDDRMRPeTd/L5cpAEwn5WrpgdC6dMDzE1szO+Cy0rk8Q0jK0Xti8oXYzH6s7ohSD
	czrA3aG9/qyNWghzyHG573lOO/77quDG+TeDLsSDJx6l+NMnR1Batl3IbpxCi3Lw+fkQkRwd1IS
	jaMbvZBYm+rXL8GdJG9tfyIGLOnjRqZ1lkfEj61MUm5LkjisfkwoswEdHcL0WzLIAjCIC+Q5n9z
	hX8Q2xlRlxMx5NTRp2NFyWbPMfyyAcTkNYWQnsNyKW3GYE3msUM9Rqn5X67HM=
X-Received: by 2002:a17:902:ccd2:b0:2c8:4c29:afeb with SMTP id
 d9443c01a7336-2cee9a64cf7mr89372715ad.8.1784139399557;
        Wed, 15 Jul 2026 11:16:39 -0700 (PDT)
Received: from [192.168.0.160] (c-98-225-44-182.hsd1.wa.comcast.net.
 [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2cf10592040sm6621985ad.55.2026.07.15.11.16.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 11:16:38 -0700 (PDT)
Subject: [PATCH v9 6/8] RDMA/umem: Use hmm_range_fault_unlocked_timeout() for
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
Date: Wed, 15 Jul 2026 11:16:37 -0700
Message-ID: <178413939750.1155966.3639451690646685854.stgit@skinsburskii>
In-Reply-To: <178413903133.1155966.3904063656020521607.stgit@skinsburskii>
References: <178413903133.1155966.3904063656020521607.stgit@skinsburskii>
User-Agent: StGit/0.19
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID-Hash: NTGZ3TXSXNGTKNVM4W4WGISWETUNYV35
X-Message-ID-Hash: NTGZ3TXSXNGTKNVM4W4WGISWETUNYV35
X-MailFrom: skinsburskii@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-mm@kvack.org, linux-doc@vger.kernel.org, linux-hyperv@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-rdma@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/NTGZ3TXSXNGTKNVM4W4WGISWETUNYV35/>
Archived-At: 
 <https://lore.freedesktop.org/178413939750.1155966.3639451690646685854.stgit@skinsburskii/>
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


