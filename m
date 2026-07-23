Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29D6CC531CC
	for <nouveau@archiver.kernel.org>; Thu, 23 Jul 2026 17:37:02 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 050F810F1A9;
	Thu, 23 Jul 2026 17:37:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GCALOzV6";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 90C2E47365;
	Thu, 23 Jul 2026 17:21:28 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1784827288;
 b=iwjBNIbxeOfe2tfU7MC+FsSuofbH4KFBO0B8o2z3R3w3XSD7iBBJjcdgldjfaem+yDZOo
 V/RfKkl1HWrGCobScIPsPmXGSQE3A62tCscsrG169sK7nDKbBJEGrTSi+10NR1M1VShStqh
 AWAF1t4tbokb9TnTe0Vb/EG4cgGj46LVSrCfqxZKBuLlteougdBF0jMMUww0QmrHol9KC4G
 AKJKVLDR9wU8NhqFtRbjen+9zbWCb17tAqVB/sSxvSfc/xAwF2fJ8bt5XLzZPVk08P8+QEI
 emq0dmOhqcP6K1IlWzlLmS12uLRa3ki8a6yvhgK2mD7P8ZWrvIazT+dzIwfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1784827288; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=i8Qd33SMLkRtmqANiDW8AEhl0t9s2Dut7/75bk+4IdQ=;
 b=OZJwnbCY2o42kwkuTm56G+PnLyheGNPpirQzxeBADrtcEoX2T0OWt4G4uvq4MW4lZUXAo
 3B9jJfZ0qVzVem1g3d+vJlp/YCRqVBhHZ+yNdnDnavy02ixW3BGEbhqWeJK6xdgYDpAABrC
 yi3FUELiRgscf+NhsYlOyn0enq7P96WTv4slifJuPox7Q77L6kj9Aite65NiyFLK/54OWzR
 9nPDtz3skz7zydOA6sJuPfjuHVlr/LITcAdc1F6BG+KIRWlMY20K5Frc/94iN8FU4CjC/Pl
 O5RvXYO5kFaXF4GVULRZ/3aGNgTukoVYEdHSS+p7n6MqcoMd41/mjGEV9sBw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 5CF0C47362
	for <nouveau@lists.freedesktop.org>; Thu, 23 Jul 2026 17:21:25 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9C00210F1C6
	for <nouveau@lists.freedesktop.org>; Thu, 23 Jul 2026 17:36:58 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id
 d2e1a72fcca58-84e3007a2b7so771269b3a.0
        for <nouveau@lists.freedesktop.org>;
 Thu, 23 Jul 2026 10:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784828218; x=1785433018;
 darn=lists.freedesktop.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i8Qd33SMLkRtmqANiDW8AEhl0t9s2Dut7/75bk+4IdQ=;
        b=GCALOzV66aKFmjVMZQOoGYSntXSTTwwUq3twl851N3N1R3duWvIjp/fLnY6GSL3hah
         eS0iMt87IK/CcvYzca0Lfxm9K26eWFibNtNjX3yRqguN6u6DoByuJvamJnQUdCdCaFVi
         Szh8X2wSeRSfRBHg4NsB+IRGuvCDe6gN4YlYW+G8XA7vG1ynZBUD7oUijucjzvFWm6Sd
         CLDgTDzZQ+k/ZaJxHhlV/E7aOwb5DoUkKg6NpZTMgt92HNoHrob6F+jqecmBA1jjb6QH
         4M+nTm6db6hCNwCwQcfjG7jI1v1GN9F/2IbQHg9F0U/PsXzDOBzY5UWpA7wjx+lSJf1p
         tqVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784828218; x=1785433018;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i8Qd33SMLkRtmqANiDW8AEhl0t9s2Dut7/75bk+4IdQ=;
        b=IUBUjX4MJk6QgOb4xzti0qVKyJCzokQgV8fngZve9OcThJvhv5vbhLmYWNqOlQKf4K
         MchkainLtIKl0U9vOXzWzo893XS94LY3NFee63+qiPFNr4m4ZKhPZ4TWonVKCigM9JHP
         IhVV09XZyfEFxjf+fK7VrDStixeWLM2EZAsvax0VRjFHJ8Ga52l6mQd7IW8+6uzrJUwP
         8OcOKX8jE0zzs3oM9Pvn5qM313os28/nld6R0/P1uwhDObdUqTNx4HXEOLPDNNp/8jMc
         eM1UNu6bwQAlKHarJXfjgsqgTpwI1TWuzN+pFcVkRiXHg8494Mnz1hztuEUs3P9CvsIh
         Ef4Q==
X-Forwarded-Encrypted: i=1;
 AHgh+Rq9nkS+avL10tAbHL0atT2+TG3HZmMo0bemvpUBW4z4sTRStctY1BTO6ZTcwoSJPnlMWQ3KsD5n@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzT0asXiJw4Ywlim2ZsSPYs/8EAxx5qml1iEfWfyZpgxhqnF3Qn
	nUFzFE1g1GkQQH/Nr0i8fsndtsAw1bUSto84yiO0bOg3IYfE8oj+HqqG
X-Gm-Gg: AR+sD121T3yLUDgTmcQQyLg2iXkAWsozlSdkrp4VtnpARPCTlc+Z/KMcxBikJd1BAEN
	u0JHWGVbHP6jQXj65wmBIL4Ao5ADiE6lFAw+j4Zoc7ts4XsR1znyg8zsgkjJWJhC3vbEYgJCNuf
	yyerRLXJGqFKuBcZ/FvOt7rGI9t+l0mgFhHEkZNS58MMUXWymQ3d2CFvywiVRCcLKdYJdK28aH/
	1i2nmf6ZGayYww7VPSYNpWLXYfryyuuZyiN40V7fnvzMigr9P76Dx0g+OjeP1E5TXT2RePjWSNB
	F7b7794VukqPlAW07PmYn9yXx1/kAc+Mxq7QmJKKrGQmNovEOeKSf9xQEivrDypfWA4x6qK+zWI
	jG0HP+b1egbc22y4xvry2qCHnVrFwdcRtlDou8TQixpFZFiolAwLKXGkFJcNJTmC8AhX78GdV4d
	rHgSKBUIA1MzWhVVItg2bEDr/seXgLXFa4gERG9Q4eBT66XEOw
X-Received: by 2002:a05:6a00:cd3:b0:848:88e6:95d3 with SMTP id
 d2e1a72fcca58-84e2bc4d259mr4728321b3a.72.1784828217972;
        Thu, 23 Jul 2026 10:36:57 -0700 (PDT)
Received: from [192.168.0.160] (c-98-225-44-182.hsd1.wa.comcast.net.
 [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-84e20622dedsm2691612b3a.11.2026.07.23.10.36.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 10:36:57 -0700 (PDT)
From: Stanislav Kinsburskii <skinsburskii@gmail.com>
Date: Thu, 23 Jul 2026 10:36:40 -0700
Subject: [PATCH v11 8/8] drm/gpusvm: Use hmm_range_fault_unlocked_timeout()
 for range faults
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-hmm-v10-v11-8-c55b003a4b61@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784828202; l=4921;
 i=skinsburskii@gmail.com; s=20260722; h=from:subject:message-id;
 bh=OHRNaT5JjbQYbg0HfVsh/goi/Wp2JeVv837tKjXheiU=;
 b=3mS7hpEm1cC4EjlfjSHzs08itt/haPD5UmH5YZzhkX5wXqdTOzSMnls0rW++T0vSS8hxNEDOH
 H/0vN9YPqS8C3NJp8Qfk40j/53Cv5CNaQqrwQS1NX9qK2UYGBofyGE6
X-Developer-Key: i=skinsburskii@gmail.com; a=ed25519;
 pk=bDpriHBYgeTdkIDweZDCemxsU93neJBOCn3YLIuJpnE=
Message-ID-Hash: KM26XPFUYUZ2R7DXH3SKB2RD5XIUVCJS
X-Message-ID-Hash: KM26XPFUYUZ2R7DXH3SKB2RD5XIUVCJS
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/KM26XPFUYUZ2R7DXH3SKB2RD5XIUVCJS/>
Archived-At: 
 <https://lore.freedesktop.org/20260723-hmm-v10-v11-8-c55b003a4b61@gmail.com/>
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
index 958cb605aedd..e912e994beb2 100644
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
@@ -1422,7 +1407,9 @@ int drm_gpusvm_get_pages(struct drm_gpusvm *gpusvm,
 	struct dma_iova_state *state = &svm_pages->state;
 
 retry:
-	if (time_after(jiffies, timeout))
+	remaining = timeout - jiffies;
+
+	if (time_after_eq(jiffies, timeout))
 		return -EBUSY;
 
 	hmm_range.notifier_seq = mmu_interval_read_begin(notifier);
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

