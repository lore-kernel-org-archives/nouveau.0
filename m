Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6986AC44501
	for <nouveau@archiver.kernel.org>; Wed, 15 Jul 2026 18:16:28 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4116410F119;
	Wed, 15 Jul 2026 18:16:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Dumn6yPB";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 85677471E0;
	Wed, 15 Jul 2026 18:01:12 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1784138472;
 b=HVQcTRRaHjE7jl8znpt3bPWGrXD5OvUeRx5ik+uallqUuf+DQgtkUln/aYC+X40fB7lno
 pro6KYMBohyKDN3gOVMJ5NJVIACsb9gH1/F0NKPY9r5S1LoKcgIB2F/++8BOl9ARKKg4vke
 2ESLiqpft+3us+bb3JqcwgzuBXR3/NUmZwbf5CKI3rVB0fRg6eWrdkoQBSOuBLbR+x+EqpE
 LPxx17hADCvkIWlmvJREeV7zKrxfXe7ts/aNGV9cm2xclLuJvN83olapcVPMOb4mZK6b1b0
 aYAe6m7v5ipwKHBuKmObiOW/2noOFRtKCJ5lFKggIy6rkkNsenCz0f4VgTZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1784138472; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=hJyDStROVAjhZv77Mf9h0pLyMcLfVsgmfa9JsYP9Vb0=;
 b=PQuoDsczF1EgvmGddVpyvrm9N7KOb4qqs/rcKxTCaLSkePKdwAl69xvriRtQ8TdlPWZ3Z
 iX+/iqLi/WWab9EYT+JCtLMIRbTx3t4U02GCN4JPy7I+tZEGBon0AAgLtl/NptAUjpxGk4G
 B+mesF9wft4mHALZWw4KNprJqi6LFAx3Gp078d7XXSozR2OJ5yfjCKEjPatuzOEcX2MH/Nb
 I2IRfAHiAErcd8qlbhEB9OQm0UHlrDdEqc8g08GgIRbiMjFCaOz7SNEzIdbbmQ6oefkd8hJ
 2TCzj+MvvRnU2K2zJCDXF6weplR4kajDtEiLifCy/xfILENYhTAm53FT9BUg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id DB33746CB5
	for <nouveau@lists.freedesktop.org>; Wed, 15 Jul 2026 18:01:09 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7A8CE10F117
	for <nouveau@lists.freedesktop.org>; Wed, 15 Jul 2026 18:16:25 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-2ce7d2adef4so34913275ad.3
        for <nouveau@lists.freedesktop.org>;
 Wed, 15 Jul 2026 11:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784139385; x=1784744185;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:subject:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=hJyDStROVAjhZv77Mf9h0pLyMcLfVsgmfa9JsYP9Vb0=;
        b=Dumn6yPB4gz6ZK9WC3UUr9X74A8A1/WCzsT8OQ6p+eZkJaFIwSMLjtzDbyac1niInv
         THijCZoVx2f7Nz6JEcwLxRZb5f3B3QwzbcUWYFilBidwCFKJIQKp74p+8fAarQX2Eq9p
         wdUY2KBI/8kp59KIQwx94fcaORJkrbVD9QiJrvf6Nw+GSiI9S6fBZbDyFYBgfDz33wL6
         tyJOU2lMm6zDV24v1vmWLqcHyWpj3tqPuIlQUFWanLGHv3wAs2v3LO36LzN1wTL3lTA2
         4QQNDTfY3wnokb5ok89ldeuVX8gwziJOwJ10qidLHnL0ODomuhtpBt/eWeHimU3eU/yP
         7q+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784139385; x=1784744185;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hJyDStROVAjhZv77Mf9h0pLyMcLfVsgmfa9JsYP9Vb0=;
        b=BOaOMoNh++CVuUTbWGKK7Xq6LmmH8tYpN0J5hIgBN1aiXaLYCwNFBzg44/wyu3Y9+A
         N+Vmg1/aVepY+cii1+I9K3vSir3X2MTfTTNjMzYBi5apYivbBhbJDyIQdZbTRVdjh0Fr
         mDamsbbzJxDIBs1TvWEMOByAV3tJw1xsDpftYN0jWrCazoTxe65bB+cDuTdU59ve2lBp
         8c3FM4J5Ak8tq6yY/WP5HY0VNGZgsuCwYg8xBXtCENcr2wvLgzzlmseklckr8GK0NWCT
         uvzih3Vfb73Qs29Ef+/YrFLO4BPwsTEkSV60qCtHeGF1kparRXubA1Zn8NctA0OhwAgV
         +gJw==
X-Forwarded-Encrypted: i=1;
 AHgh+RokU3TDmMCmiDha77YIN/o1M26JceWmNXpET5/bwBXau6K2oXmpIwHrEOO9gWE+VPzcoZJNGhzx@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyvfbEj56X6s2FLvHWgoFLZoCwyaKgTpNzyzIMWKhnLSDPS6GkF
	RS59meAdp/6OrDt56PJVyHglyqyXAxCUsc6vlFMTe3LldR5AzsM8Iidu
X-Gm-Gg: AfdE7ckQ00JB86ecM5BL67stFt7Kk6wRUBEQ9Cl/z9n5odgBL9elr4Lxw6DLIyMOBRL
	NGaoFIiVcYeS+rakqXKhPSMeqg8ZQUmwurN4SECt93sKIlsCNzlsdAqADj4+0NSSiNVVDH1QtyN
	qz+wULe5SXJC8m9w5VYzQ+ff16bglSHkbMh92pIJQvrzJx75hxmrIf4o8TG97Uznfpbd046AufC
	TvF3XzIPYrbeQ94wIzEXnKAjnONfEa2MjZsBrVh+H4NcRq6uqBn7SUh6eL+vPLv/wRF5rr0vSqw
	5hmwKIYaYyab0iwjg45XieRCW9XdpXJ1eHSg4r7t/AWTvReCzRiotq+RKNI9JRwlt+N7rTYW0iD
	Dp0Coiw7V7NlRJOyjRjNBhvI/vItlsQpUa7M6L52eBfr/Q3NUCYdtupWk7IA2aGb4yeEKFOkWJ9
	p0xcWLqqCshP+WmeisWh9FYMdmT31sksraoPc0AQP39/qo6Ge6LvFdU3FwpRM=
X-Received: by 2002:a17:903:19c5:b0:2ca:bb6:e7c6 with SMTP id
 d9443c01a7336-2ce9ef22bc9mr189071215ad.37.1784139385005;
        Wed, 15 Jul 2026 11:16:25 -0700 (PDT)
Received: from [192.168.0.160] (c-98-225-44-182.hsd1.wa.comcast.net.
 [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2cf0fdb3a0asm7052845ad.0.2026.07.15.11.16.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 11:16:24 -0700 (PDT)
Subject: [PATCH v9 4/8] mshv: Use hmm_range_fault_unlocked_timeout() for
 region faults
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
Date: Wed, 15 Jul 2026 11:16:22 -0700
Message-ID: <178413938249.1155966.292562154596800687.stgit@skinsburskii>
In-Reply-To: <178413903133.1155966.3904063656020521607.stgit@skinsburskii>
References: <178413903133.1155966.3904063656020521607.stgit@skinsburskii>
User-Agent: StGit/0.19
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID-Hash: Y4W5Q5AJAFI2GHNAWNDMO2PSZKN5YHLL
X-Message-ID-Hash: Y4W5Q5AJAFI2GHNAWNDMO2PSZKN5YHLL
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/Y4W5Q5AJAFI2GHNAWNDMO2PSZKN5YHLL/>
Archived-At: 
 <https://lore.freedesktop.org/178413938249.1155966.292562154596800687.stgit@skinsburskii/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

MSHV currently faults movable memory regions by taking mmap_read_lock()
around hmm_range_fault(). That prevents the fault path from handling VMAs
whose fault handlers need to drop mmap_lock, such as userfaultfd-backed
mappings.

Use hmm_range_fault_unlocked_timeout() instead. Passing a timeout of 0
preserves MSHV's existing unbounded retry behavior while letting the HMM
helper own mmap_lock acquisition and refresh range->notifier_seq internally
before walking the range. After the fault succeeds, MSHV still takes
mreg_mutex and checks mmu_interval_read_retry() before installing the pages
into the region, so the existing invalidation synchronization is preserved.

Fold the small fault-and-lock helper into mshv_region_range_fault(), since
the remaining retry path is just the standard "fault, take the driver lock,
check the interval notifier sequence" pattern.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Stanislav Kinsburskii <skinsburskii@gmail.com>
---
 drivers/hv/mshv_regions.c |   54 ++++++++-------------------------------------
 1 file changed, 10 insertions(+), 44 deletions(-)

diff --git a/drivers/hv/mshv_regions.c b/drivers/hv/mshv_regions.c
index 6d65e5b42152..dddaade31b5d 100644
--- a/drivers/hv/mshv_regions.c
+++ b/drivers/hv/mshv_regions.c
@@ -381,46 +381,6 @@ int mshv_region_get(struct mshv_mem_region *region)
 	return kref_get_unless_zero(&region->mreg_refcount);
 }
 
-/**
- * mshv_region_hmm_fault_and_lock - Handle HMM faults and lock the memory region
- * @region: Pointer to the memory region structure
- * @range: Pointer to the HMM range structure
- *
- * This function performs the following steps:
- * 1. Reads the notifier sequence for the HMM range.
- * 2. Acquires a read lock on the memory map.
- * 3. Handles HMM faults for the specified range.
- * 4. Releases the read lock on the memory map.
- * 5. If successful, locks the memory region mutex.
- * 6. Verifies if the notifier sequence has changed during the operation.
- *    If it has, releases the mutex and returns -EBUSY to match with
- *    hmm_range_fault() return code for repeating.
- *
- * Return: 0 on success, a negative error code otherwise.
- */
-static int mshv_region_hmm_fault_and_lock(struct mshv_mem_region *region,
-					  struct hmm_range *range)
-{
-	int ret;
-
-	range->notifier_seq = mmu_interval_read_begin(range->notifier);
-	mmap_read_lock(region->mreg_mni.mm);
-	ret = hmm_range_fault(range);
-	mmap_read_unlock(region->mreg_mni.mm);
-	if (ret)
-		return ret;
-
-	mutex_lock(&region->mreg_mutex);
-
-	if (mmu_interval_read_retry(range->notifier, range->notifier_seq)) {
-		mutex_unlock(&region->mreg_mutex);
-		cond_resched();
-		return -EBUSY;
-	}
-
-	return 0;
-}
-
 /**
  * mshv_region_range_fault - Handle memory range faults for a given region.
  * @region: Pointer to the memory region structure.
@@ -452,13 +412,19 @@ static int mshv_region_range_fault(struct mshv_mem_region *region,
 	range.start = region->start_uaddr + page_offset * HV_HYP_PAGE_SIZE;
 	range.end = range.start + page_count * HV_HYP_PAGE_SIZE;
 
-	do {
-		ret = mshv_region_hmm_fault_and_lock(region, &range);
-	} while (ret == -EBUSY);
-
+again:
+	ret = hmm_range_fault_unlocked_timeout(&range, 0);
 	if (ret)
 		goto out;
 
+	mutex_lock(&region->mreg_mutex);
+
+	if (mmu_interval_read_retry(range.notifier, range.notifier_seq)) {
+		mutex_unlock(&region->mreg_mutex);
+		cond_resched();
+		goto again;
+	}
+
 	for (i = 0; i < page_count; i++)
 		region->mreg_pages[page_offset + i] = hmm_pfn_to_page(pfns[i]);
 


