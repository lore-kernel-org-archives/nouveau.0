Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83FA0C531C9
	for <nouveau@archiver.kernel.org>; Wed, 22 Jul 2026 21:45:04 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A95E710EEDC;
	Wed, 22 Jul 2026 21:45:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Yl8dhvHk";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 1C0B147328;
	Wed, 22 Jul 2026 21:29:32 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1784755771;
 b=FJQBwizZrZwSCbCxZ3XV0zfVpWkAQWiPmdt3jogsgJLnHeHDaVQbXTGhYJ6C5VRBhwaEv
 sYrYp3mRfzbLPmBuSE38EJsP5ucwLNJtSHsvwKM8tbRXGEhHpoh4Inulyw58RxUkFom9def
 VI3Rp7VXyq2OWPUbghhR6HwONMW0TSHfGx2XtdpihugVLeHKr1rxnFobEMPCk8Rb+ciUZyK
 eY3rKtlkm8+XUJ1IzgjQr4u8uq+wjChxRcb0sBioHbT+10j5boqTXmyv/YdkQNZg9VBbdoT
 MJypo2vHNtGbQqG77/eAgxJfAjnYIuLsGqfHnSwkTvNRvR6zVwXiZNJYb/rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1784755771; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=TSbIIq+MW5ujNCU6weGrEYnGd53JSmfWB5BOONHtR2c=;
 b=OyfCV+wjqej3zKQxoCzPq1QL7YRkYhfHQtdGX8vI3fcI2uVv9mZtFoSZer43H44Oviz2J
 GWuW+xn2PYZG6T5ID+F7Co9kwG0wh02CAhZ80KypcUC8iPocDcsrmTxBCWCmn748nIWc5TV
 oG+ByEF+1oe9Yd6jG0nwGancAdiO16DXrOjCD1Yv94uR5dYGw0y4IMgH97IMFyCH9UR3TpL
 Nlw8op3BPLEYeMZjuwz62nCDCvMVakgoAOVawsW34XKZHS2zpVRW5P93WZeep292chizN4c
 P1+Es8holW/1vSQtYX4xuDfhRwCoidsSoeiC2vqAp4KTorlc7UaqGHF1GcaA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 56ABE4731F
	for <nouveau@lists.freedesktop.org>; Wed, 22 Jul 2026 21:29:29 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
	by gabe.freedesktop.org (Postfix) with ESMTPS id BEE0F10EED9
	for <nouveau@lists.freedesktop.org>; Wed, 22 Jul 2026 21:45:00 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id
 d2e1a72fcca58-84e0688b7e8so2094375b3a.1
        for <nouveau@lists.freedesktop.org>;
 Wed, 22 Jul 2026 14:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784756700; x=1785361500;
 darn=lists.freedesktop.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TSbIIq+MW5ujNCU6weGrEYnGd53JSmfWB5BOONHtR2c=;
        b=Yl8dhvHkIXcdiB60ZwLySEk/CJijATfas8WXS0cLnZHbYZwOIiA6Rwu7gjBBPOUrJC
         OgCz5+QD8Fef2qGEj+o0ZLRUT/GxZPgX5duE7AXsvM4On13aRLD0e5nRpsLC+Ry2ET3I
         5K1rmNvnrp/Ii+ASKyS4GcJ8D7rDc+/Fl6jkpiLVvYg5lfsAr0govD63fAqUtzZDB8Yp
         v+WAA/oUWjJL8ph9kVPlwJARGBuEpmVZ3dLAvfI5nCrm1XFzf4xqsk7aTH6RH6HCFD3o
         kttl187CwajG1+3x91b0kyxSU36JLFlROuFhnHkrkafcjtVx0/rY0DbA9myS04S1gSrT
         oL/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784756700; x=1785361500;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TSbIIq+MW5ujNCU6weGrEYnGd53JSmfWB5BOONHtR2c=;
        b=b/NH1lBCGwr7BxTacAaHAmBmzIbT/p+bKdWTjdQHifM/0dKmAbtwlh9LXPPnBA0aGd
         TOwliN1M9vFoVcpxtPPSUAfY81YZ3FV5Fm79dy85Hz6/5sEwtHodK9++Xb2pnSaemPmA
         tjF6ajvsb3+3FXc4JolAP0OsjZNu4HKcb9MQQbKQ2T0ne7ZcqPxxQ9C1uxReg6Bq+FbB
         dq0+20WGl8q1rstNJyRJwZs8l3eX+KWizFqfPSf3kMFBeCZsXDts7FYh7YhSQ1wjFkdv
         SW6h7KqQYhUagNk9YQsk9GEulF90DcXZJeISCvj+nbQvycQzr1m7VL5uwJy1a+UKe+fS
         0AOw==
X-Forwarded-Encrypted: i=1;
 AHgh+RqPJXJB/VoZutj+5wbzQf6LOQRS9LGL9561CAe5SV+9gL4ROgkO4LrIAfMByJ2QaghKBlFo7yBd@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw3ujB5vQxUxC+jQVasJyuxDpS3uvvNtWcIbwhsmtAdx//W868e
	hpdEkfc7eCybM/K0AGnv84Kyzp6GUccti1fLqsIE/XGCo7ymy21/p2Ry
X-Gm-Gg: AR+sD13oT5/lIMdm0n34kyMly8+cC5TSNhER3zfrLyfVrd9kMRDgvSJMSNsLsn2UaED
	vnIkh7vCBTDEpnfDGFUTmHcMrZPqkB0CNVfanWpfZti3nDF7VeX1x0t3WRWdvEjoc8IX6paKyIt
	DyGFpz9nCEDujZQmIwND022vMjwQiObMmIjdq+zGzEEjPhlfHEyg+xauPMmEhe2ZCudnMhHV+r8
	MEK71wMpHC9nq9DLSoPmnpJfXXwDvCD9X581PvvxFGQkYYSeNSaHKJWK8Ygkr/3JgLq4LEqnnl6
	pHLR9JJwVJ+fLcO+PUBsY+ll3kzDb9hD4W+NiYzjzFfUVirhRxPDlTd+BOasrJ6afIt/eJwXNGC
	Eb5gNZHaxzkvteEhEYKWOcK5yQz0FLQmoUDJR5bQ6VyQpTbhjm3c7EqoHmQidfu/TK53SwvcfKB
	lnMzV7jvRAQGDei04QC0hPa0QUxBIDqO3wBkKIL+/Wjs5ww4o4
X-Received: by 2002:a05:6a00:94f7:b0:848:467d:293e with SMTP id
 d2e1a72fcca58-84e2baddf66mr627847b3a.43.1784756700316;
        Wed, 22 Jul 2026 14:45:00 -0700 (PDT)
Received: from [192.168.0.160] (c-98-225-44-182.hsd1.wa.comcast.net.
 [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-84e17237c3fsm1946297b3a.9.2026.07.22.14.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 14:44:59 -0700 (PDT)
From: Stanislav Kinsburskii <skinsburskii@gmail.com>
Date: Wed, 22 Jul 2026 14:44:30 -0700
Subject: [PATCH v10 8/8] drm/gpusvm: Use hmm_range_fault_unlocked_timeout()
 for range faults
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-hmm-v10-v1-8-606464dd601a@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784756683; l=5001;
 i=skinsburskii@gmail.com; s=20260722; h=from:subject:message-id;
 bh=JxcTBTW6lEzlUH9pe80rZJYyQZGUPa2uP7JaZIpbDO4=;
 b=t5pXaIaExV86XNOZX4rodLg/qlkvO7z8UzQMAKDvBSpVBwUgOqPA+1uKWVHHstjr3FsmGAV1u
 FhiXQ8BfH3FAK6QXFIhXuSWoEAqA3lYTf5A7cJupNOmjpSFDJW/pEX3
X-Developer-Key: i=skinsburskii@gmail.com; a=ed25519;
 pk=bDpriHBYgeTdkIDweZDCemxsU93neJBOCn3YLIuJpnE=
Message-ID-Hash: ND3GHTR6QAWXNERWHRYOMNSFNEJUZVWH
X-Message-ID-Hash: ND3GHTR6QAWXNERWHRYOMNSFNEJUZVWH
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/ND3GHTR6QAWXNERWHRYOMNSFNEJUZVWH/>
Archived-At: 
 <https://lore.freedesktop.org/20260722-hmm-v10-v1-8-606464dd601a@gmail.com/>
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

drm_gpusvm_scan_mm() and drm_gpusvm_range_evict() pass
HMM_RANGE_DEFAULT_TIMEOUT as the helper retry budget for each HMM fault
attempt. drm_gpusvm_get_pages() keeps its existing absolute outer deadline
because it can be reached from GPU page-fault workers, where fatal signals
from the faulting process cannot stop an endless invalidation retry loop.
It passes the remaining time from that deadline to HMM for each fault
attempt.

Leave drm_gpusvm_check_pages() on hmm_range_fault() because that path is
called with the mmap lock already held by its caller.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Stanislav Kinsburskii <skinsburskii@gmail.com>
---
 drivers/gpu/drm/drm_gpusvm.c | 60 ++++++++------------------------------------
 1 file changed, 10 insertions(+), 50 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
index 958cb605aedd..b946f920b7a0 100644
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
 
@@ -1408,6 +1392,7 @@ int drm_gpusvm_get_pages(struct drm_gpusvm *gpusvm,
 	void *zdd;
 	unsigned long timeout =
 		jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
+	unsigned long remaining;
 	unsigned long i, j;
 	unsigned long npages = npages_in_range(pages_start, pages_end);
 	unsigned long num_dma_mapped;
@@ -1422,9 +1407,11 @@ int drm_gpusvm_get_pages(struct drm_gpusvm *gpusvm,
 	struct dma_iova_state *state = &svm_pages->state;
 
 retry:
-	if (time_after(jiffies, timeout))
+	if (time_after_eq(jiffies, timeout))
 		return -EBUSY;
 
+	remaining = timeout - jiffies;
+
 	hmm_range.notifier_seq = mmu_interval_read_begin(notifier);
 	if (drm_gpusvm_pages_valid_unlocked(gpusvm, svm_pages))
 		goto set_seqno;
@@ -1439,21 +1426,7 @@ int drm_gpusvm_get_pages(struct drm_gpusvm *gpusvm,
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
+	err = hmm_range_fault_unlocked_timeout(&hmm_range, remaining);
 	mmput(mm);
 	if (err)
 		goto err_free;
@@ -1720,8 +1693,7 @@ int drm_gpusvm_range_evict(struct drm_gpusvm *gpusvm,
 		.end = drm_gpusvm_range_end(range),
 		.dev_private_owner = NULL,
 	};
-	unsigned long timeout =
-		jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
+	unsigned long timeout = msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
 	unsigned long *pfns;
 	unsigned long npages = npages_in_range(drm_gpusvm_range_start(range),
 					       drm_gpusvm_range_end(range));
@@ -1736,24 +1708,12 @@ int drm_gpusvm_range_evict(struct drm_gpusvm *gpusvm,
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
 

-- 
2.43.0

