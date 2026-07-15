Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92D11C44508
	for <nouveau@archiver.kernel.org>; Wed, 15 Jul 2026 18:16:57 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7880D10F119;
	Wed, 15 Jul 2026 18:16:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="R0aFpnbR";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id B9BB8471E8;
	Wed, 15 Jul 2026 18:01:41 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1784138501;
 b=qIgBYWJqXo3vpplJJyg+UBSeqh4t0OKjWVDgeLzrze6Go2p6jKH/dID+hv1KlpCyBEsxd
 hdDEWgGIYHGNx/YH/PUaLaA5md2xeA6ipJevqpOJSLRB4rzcvVcRAiw9k5ehHc0K5tqDsc3
 t4sg5Nd1adshG60fGxIcbQnkEVzQbOF+0kcw9ineEZt9pa3dY1oDWjcQYoP6sDY5RtzrIVM
 JZV3je+lR6v3ufQCoYRjfkHSrbxikQWlEXn97sOjbqpFNebFiCMsveq8qMpR1K4aANqClIO
 DlREf4U2KhXJCPOBVaEe/31OUYE5dggGrZqTGAn33u0786YNqZ9D6QaOssaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1784138501; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=kQ5Orso9YJMZEBfqLHTmR8qEZ0VQA0+aPO2YU4j8nyU=;
 b=GdTBt7EVokxj/LMjdpl6lSfrp1vlobvXKer3m0mtMyPRUy7qy8MVbIeSFrA9ps7E38G2Y
 yX2Rq/j1MY7+hB4FIlxSM/Vqfw/GteKawPkjiARv4imncwvJsvsGIpNMxkeXGNttBJMheyP
 97Jyz45wthBcceCBu4vZunCg90XKZ/bgOd3wGhsVDgRO78qcyYruN3ILfW8w3+l4lOQv4Gy
 1ibcTeZsoWX1oVL7S8mRfFypLuwdUPvUY0TuyT/q0JdcSnV1O8TYp3qkqwKftrKfNRxU1Dl
 0hXsf3M6iyENRlvg/0g0a+aBYXuX8wnDjQSsY7ajOIgmMzvxfR5jj7h7udag==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 3F0F9471E8
	for <nouveau@lists.freedesktop.org>; Wed, 15 Jul 2026 18:01:39 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D367D10F10C
	for <nouveau@lists.freedesktop.org>; Wed, 15 Jul 2026 18:16:54 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id
 d2e1a72fcca58-845b6d9bf39so2580871b3a.1
        for <nouveau@lists.freedesktop.org>;
 Wed, 15 Jul 2026 11:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784139414; x=1784744214;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:subject:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=kQ5Orso9YJMZEBfqLHTmR8qEZ0VQA0+aPO2YU4j8nyU=;
        b=R0aFpnbR5uxCIyudrqtWURGd7gR6hxhS0THHCt87LMRZPwY86Qogl0WaanCH9PIS6l
         Nj6AbvlGf5c90ZrQf9awX9Ty78ltw0XlBZUGUqEvyodtrdlXK7GDEMxydRVjxcA/gTVW
         FgiYfql0MHhSEDC9bfiPj0T6AyvIZlw6uVGhYVpa/i+TUUdKbEMM8dPhOdp5070ecdWc
         lxI+L+i1qvPlkxoNNNYD8jQi490HuCk1J3vStHBhzfveT/OvtCeDgEBybnXuX0IgyOJR
         7a1NCZ93LBDTTDGwFbpJGLkq30X8ulRmk93CE890ZCG8wzeRg1OCDvY7GytV1fqfKDBV
         bWqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784139414; x=1784744214;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kQ5Orso9YJMZEBfqLHTmR8qEZ0VQA0+aPO2YU4j8nyU=;
        b=TRL8NPqnFk6TBz6LbaYcgQ/6cl7R022FXWwuy7Ns8yWkoul5KY6J1+YYzHfnujXPJ6
         Xsaw2Aidq6yVuB40uma/l0ZCHZRr6/fUruHn+ZbevtoxTUOlWMNEmj9+cBlpU+iFBUHE
         JOpjD+bHRMbpGCG2eQHDJaQeoOpZCqPuhK2Rje88yX0QJ3prHZ0mspux98J5Y3L0sSiI
         xwwyZIrZ+IGZAR5WVNODZhIlEM9lFPjB1P+C/tDeZ7Jlm/cOK0jU9UEzqqf543eoAdry
         l86RI9gkxule8qsPOkDeKd+3FKGjgPHfH0tZpJKHo7lz0JKVtpypBpvFRmL35VFJO04q
         2IUA==
X-Forwarded-Encrypted: i=1;
 AHgh+RrxhSPdw1SAbSMX1dsqivKqfrbk3hNpHX6WPH1Q75y9woiqiA6oCoFimWeJHiLMQMY3fyHEr+Hr@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyKO6xgWIrlpHm5Be4+N243BMao8BQYdVIZXe5DAsJ1qRXsc/8Y
	ZM5Oxp8o+LV7RMfi/G4et+0FRsV6/5C1h6IdKBkEQzTZX1fO3qRbHvgjl9lAHw7f
X-Gm-Gg: AfdE7cmhDpMh1Ep7pOAtIBnbGJ/jFZhJVI7oz5r4K+swcnVxCIwHpp7d0QgCjjxPns/
	pzxNxhqVI3yiLGM8VIQ6Xrs/4aj+tjcyPh98eqC3ZSXViV1IRSxTYTxEuz589NbfQtDJdcLzKIr
	EbEmb96d4XLJ8/aQIWHTMXeV034gOuH0AxXC5b6eB0voXifquBclQ0BFj0uQG/kFAo0YAdWSFUK
	SYk4LRe5y268OYJxTeZk6oHBb9p7URuBDubWPllFLelKnAb39Ag8o6eQXeNQrLS19USbkfhId4M
	1x+cDb4C0Ko6aMB9flnB15NFH0mev3QCC4X9CPs+Oo33H1MrmK2a5D4HhFBglRfjM0DBRKJsfFF
	UaJdIxNRHIwaDGaJUE5tPL/6p082OmUhnILAm8qtZfuvxvM7Jwx/B2W9G2g0uTAKrmvBbJmQWc7
	OfWw3dOBSZtitvd7R8NbNuZvMPDTuETRndxPYVFUtePkEAcMNhO71BvqPaFLs=
X-Received: by 2002:a05:6a00:10d1:b0:836:6f2e:bb6d with SMTP id
 d2e1a72fcca58-84a9d0e5e99mr412854b3a.14.1784139414332;
        Wed, 15 Jul 2026 11:16:54 -0700 (PDT)
Received: from [192.168.0.160] (c-98-225-44-182.hsd1.wa.comcast.net.
 [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-cb258ede81asm621883a12.11.2026.07.15.11.16.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 11:16:53 -0700 (PDT)
Subject: [PATCH v9 8/8] drm/gpusvm: Use hmm_range_fault_unlocked_timeout() for
 range faults
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
Date: Wed, 15 Jul 2026 11:16:52 -0700
Message-ID: <178413941236.1155966.14485211391150425997.stgit@skinsburskii>
In-Reply-To: <178413903133.1155966.3904063656020521607.stgit@skinsburskii>
References: <178413903133.1155966.3904063656020521607.stgit@skinsburskii>
User-Agent: StGit/0.19
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID-Hash: W4LGRENENPJYPWW4B4K2RADWOAXHCGOE
X-Message-ID-Hash: W4LGRENENPJYPWW4B4K2RADWOAXHCGOE
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/W4LGRENENPJYPWW4B4K2RADWOAXHCGOE/>
Archived-At: 
 <https://lore.freedesktop.org/178413941236.1155966.14485211391150425997.stgit@skinsburskii/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Several GPU SVM paths take mmap_read_lock() only to call hmm_range_fault()
and open-code mmu interval sequence setup before each HMM walk. They also
retry -EBUSY until HMM_RANGE_DEFAULT_TIMEOUT expires.

Use hmm_range_fault_unlocked_timeout() for those faults. The HMM helper now
owns mmap_lock acquisition and refreshes range->notifier_seq for its
internal retries, while GPU SVM keeps its existing driver-lock validation
with mmu_interval_read_retry() after a successful fault.

Pass HMM_RANGE_DEFAULT_TIMEOUT as the helper retry budget for each HMM
fault attempt. This scopes the timeout to repeated HMM notifier retries
while preserving the outer retry loops that restart when the interval is
invalidated before GPU SVM updates or consumes the mapping state.

Leave drm_gpusvm_check_pages() on hmm_range_fault() because that path is
called with the mmap lock already held by its caller.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Stanislav Kinsburskii <skinsburskii@gmail.com>
---
 drivers/gpu/drm/drm_gpusvm.c |   61 +++++-------------------------------------
 1 file changed, 7 insertions(+), 54 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
index 958cb605aedd..de5bbfe58ee9 100644
--- a/drivers/gpu/drm/drm_gpusvm.c
+++ b/drivers/gpu/drm/drm_gpusvm.c
@@ -773,8 +773,7 @@ enum drm_gpusvm_scan_result drm_gpusvm_scan_mm(struct drm_gpusvm_range *range,
 		.end = end,
 		.dev_private_owner = dev_private_owner,
 	};
-	unsigned long timeout =
-		jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
+	unsigned long timeout = msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
 	enum drm_gpusvm_scan_result state = DRM_GPUSVM_SCAN_UNPOPULATED, new_state;
 	unsigned long *pfns;
 	unsigned long npages = npages_in_range(start, end);
@@ -788,22 +787,7 @@ enum drm_gpusvm_scan_result drm_gpusvm_scan_mm(struct drm_gpusvm_range *range,
 	hmm_range.hmm_pfns = pfns;
 
 retry:
-	hmm_range.notifier_seq = mmu_interval_read_begin(notifier);
-	mmap_read_lock(range->gpusvm->mm);
-
-	while (true) {
-		err = hmm_range_fault(&hmm_range);
-		if (err == -EBUSY) {
-			if (time_after(jiffies, timeout))
-				break;
-
-			hmm_range.notifier_seq =
-				mmu_interval_read_begin(notifier);
-			continue;
-		}
-		break;
-	}
-	mmap_read_unlock(range->gpusvm->mm);
+	err = hmm_range_fault_unlocked_timeout(&hmm_range, timeout);
 	if (err)
 		goto err_free;
 
@@ -1406,8 +1390,7 @@ int drm_gpusvm_get_pages(struct drm_gpusvm *gpusvm,
 		.dev_private_owner = ctx->device_private_page_owner,
 	};
 	void *zdd;
-	unsigned long timeout =
-		jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
+	unsigned long timeout = msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
 	unsigned long i, j;
 	unsigned long npages = npages_in_range(pages_start, pages_end);
 	unsigned long num_dma_mapped;
@@ -1422,9 +1405,6 @@ int drm_gpusvm_get_pages(struct drm_gpusvm *gpusvm,
 	struct dma_iova_state *state = &svm_pages->state;
 
 retry:
-	if (time_after(jiffies, timeout))
-		return -EBUSY;
-
 	hmm_range.notifier_seq = mmu_interval_read_begin(notifier);
 	if (drm_gpusvm_pages_valid_unlocked(gpusvm, svm_pages))
 		goto set_seqno;
@@ -1439,21 +1419,7 @@ int drm_gpusvm_get_pages(struct drm_gpusvm *gpusvm,
 	}
 
 	hmm_range.hmm_pfns = pfns;
-	while (true) {
-		mmap_read_lock(mm);
-		err = hmm_range_fault(&hmm_range);
-		mmap_read_unlock(mm);
-
-		if (err == -EBUSY) {
-			if (time_after(jiffies, timeout))
-				break;
-
-			hmm_range.notifier_seq =
-				mmu_interval_read_begin(notifier);
-			continue;
-		}
-		break;
-	}
+	err = hmm_range_fault_unlocked_timeout(&hmm_range, timeout);
 	mmput(mm);
 	if (err)
 		goto err_free;
@@ -1720,8 +1686,7 @@ int drm_gpusvm_range_evict(struct drm_gpusvm *gpusvm,
 		.end = drm_gpusvm_range_end(range),
 		.dev_private_owner = NULL,
 	};
-	unsigned long timeout =
-		jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
+	unsigned long timeout = msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
 	unsigned long *pfns;
 	unsigned long npages = npages_in_range(drm_gpusvm_range_start(range),
 					       drm_gpusvm_range_end(range));
@@ -1736,24 +1701,12 @@ int drm_gpusvm_range_evict(struct drm_gpusvm *gpusvm,
 		return -ENOMEM;
 
 	hmm_range.hmm_pfns = pfns;
-	while (!time_after(jiffies, timeout)) {
-		hmm_range.notifier_seq = mmu_interval_read_begin(notifier);
-		if (time_after(jiffies, timeout)) {
-			err = -ETIME;
-			break;
-		}
-
-		mmap_read_lock(mm);
-		err = hmm_range_fault(&hmm_range);
-		mmap_read_unlock(mm);
-		if (err != -EBUSY)
-			break;
-	}
+	err = hmm_range_fault_unlocked_timeout(&hmm_range, timeout);
 
 	kvfree(pfns);
 	mmput(mm);
 
-	return err;
+	return err == -EBUSY ? -ETIME : err;
 }
 EXPORT_SYMBOL_GPL(drm_gpusvm_range_evict);
 


