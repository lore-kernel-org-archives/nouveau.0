Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C3E1C43458
	for <nouveau@archiver.kernel.org>; Tue, 14 Jul 2026 20:13:58 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6151F10EE4D;
	Tue, 14 Jul 2026 20:13:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="o+J+oGTu";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id ACC2F4718E;
	Tue, 14 Jul 2026 19:58:44 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1784059124;
 b=OkFg6UjsKP1GUJXDyWIj2Myr9V8MlMeCLEIDZtU44H1XYNTq0WCIKvtXZO6kGhUM0Y9Rr
 20Yl4+yl6j5UB5woca+iFGyz7fx4wFnrUsVN0AMZ+nu35U/UksszBaqIiiaWx7dj+HfnJgx
 xvQR042PnHNdOFxv5yhOqfS+yg1001Ss5h8wgTdPFUUlKzG+i5D4lJEabycz+K1akXT80ZD
 JiAEH6MZu4IMg9EUu2S6qQAO7HR2ZzyOq4DTPg3mlbMyiWILSzFkPskecR4GVGqg1pB8/Hq
 GftD+vxtPbDHlrdQSsma4jJs4kr3qluAuez2ULG7bBOv4XQ3FcObjx6wLrRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1784059124; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=EUZJ2b06rpE59kyPt/lRc7T/ATHNB4Peeih6JEYSOE8=;
 b=w/ata3mvO/6UnnufOT5Fdpe+3JFPlGi8TVHylQuPgRzqGAoi/wyhPW1X5xlibtH6PJN9Q
 6WtjMH4iJqgsIFkc0rPI034wArs8SP1VePvCq+7xYD2Ue/aU+dbs2d8rbvWmz2lIssZMO6k
 V+3Jv9B8fMM4I9b//6XDrQ/I5CKZ2TeM7yb5qYHiJU2PRLXodx2IDKsCjNjVcCZIthlELIe
 uCyvthEFtdirdvx8011qv9keoeRZvlJOCO1WPoh18V4o7qFEHULBAECw4jtP/qQj4KBx1Sc
 Sp4MxV0h3dNZvaZwS4Eh+Bwsx5IhpZUZFB6OQriSa6RiL7tbq0FOt1LcAxIg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 1618047182
	for <nouveau@lists.freedesktop.org>; Tue, 14 Jul 2026 19:58:42 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9F46B10EE4D
	for <nouveau@lists.freedesktop.org>; Tue, 14 Jul 2026 20:13:55 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-2cc97653887so54594065ad.1
        for <nouveau@lists.freedesktop.org>;
 Tue, 14 Jul 2026 13:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784060035; x=1784664835;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:subject:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=EUZJ2b06rpE59kyPt/lRc7T/ATHNB4Peeih6JEYSOE8=;
        b=o+J+oGTuffmE1UpcuEh903TexV1zq8bLHtzv2uuT8PD3bqAeP7qT10r3eDaFPKiLFs
         Ld7D+kLkUU/4Y6suVT9d5m82Sl4bouJWh3v5MwJnexNUuCPaDbeu0ZmyK5xWvyT2zzjb
         aetGaW3NWkJ+YVVqKA7r+Aeu1pmKcq6sJVuIJvuIRw3uhPeVJuSUmEcnpn67qW7o6EuS
         qZpzVg412fZSreqmesE7qUJn0rnAXg6IbkVdIDegWqYvkOPYNddFBtUI4AkZ6/rS84e2
         9Y3IGxSPnSQW9EO0sM7dpw5IoPfgnFdP0CuUvYcJAsJle6Plp6Pzsxx+Oo6NSOnDvWga
         7s6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784060035; x=1784664835;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EUZJ2b06rpE59kyPt/lRc7T/ATHNB4Peeih6JEYSOE8=;
        b=f5eq/Fh7COp1I9BB1YhfT+RJGhOThhkY1Gl0T/cwrI4A/WkUvHyMMamwA44dLSj+B7
         y6DOIyMHSP5Ct8iNlDm/Xa7fwrsChdB2gAorMGpgsRjBDC8t3DXV7alAZbmbPSXX3hFS
         nfuyl29CkHIgL6IsnpALPlHVkaPTsr1822wfF6emPTyOnQbscKdu6lI7Rx8Qyg3kLRUZ
         zAQ3jmo6Iz6lAX+9UKJOSqzPcwXBRQvklLXgter4aSkoutRXQcQeNuAZcGXn8uleSh1L
         Tc9E4euRsJDZgF410vMsEjgt/lroEDtkL6O6LfTHHirWHZ+lBlp7Ju3j35Q2zMmC5hmI
         Q/xQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Rp32AXe4UoVZ3M1O2QZ0zBkC/c7tVKe2H5C3VB7MFrRIDE8JaF1r1znPBJBCUD6OjKrVW+NfsDs@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yysz5LTngGcGnTgoUpkWUpzHODqQBN2oHCOH4EBs1ocojwaJ5SM
	KMq5qL1VC6xSa5fL/lKfiRkEYO+SSwgQNQ9aXqy8T8O/cXUQQBJFCMzT
X-Gm-Gg: AfdE7ckmitDb6TnZJED8+RoUH8xLtobmdtwZZiqIv5KjJXe/e9AREw+XohqLniW7cRM
	+Y/emnPNxmsKFgNpsk8hbWrPwbF57zoTseGASsD/zDu9Ms28U/CR88HK22rg7Br8Cs4zYhdGTxF
	JKSr1dKmbv6L0seksMc8Vmz8r+d7kA+1YwBXn9H5O0MrpeBUhGCoZ1dQeHRs4kr84oPXzCcXNjh
	Ha9qo6xw2KPOkWuzztRStpWiq5BroaNv8hEYQJ1JSWWi1ElX9ox6utYzR5KsbCd+c+LNp9U9ALl
	DWvd96En/0GA4iJnbLC9GCs65q7+ZlQ44REnZMtwqxuXCbp7gwhHpvTdM085qEQ1zb8jCFMdAak
	7DMqLLWwK9d+4kaw6tsT8M5h1xiPs6d6HIAbDFE1GbpApXykYsC945HqH+SB+rduyXxUmFjjGqL
	c2jxIHd7n/bQu4ANHqmzWDMgi2z2vROuocKCKDsMMlde5XWwhKJgAfX9g8L3YZVQPLLk4pSg==
X-Received: by 2002:a17:902:fc8f:b0:2c9:97a8:afe5 with SMTP id
 d9443c01a7336-2ce9f27e6dbmr139524545ad.40.1784060035193;
        Tue, 14 Jul 2026 13:13:55 -0700 (PDT)
Received: from [192.168.0.160] (c-98-225-44-182.hsd1.wa.comcast.net.
 [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ccc9bdb877sm120937885ad.14.2026.07.14.13.13.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 13:13:54 -0700 (PDT)
Subject: [PATCH 4/4] fixup! drm/gpusvm: use hmm_range_fault_unlocked_timeout()
 for range faults
From: Stanislav Kinsburskii <skinsburskii@gmail.com>
To: airlied@gmail.com, akhilesh@ee.iitb.ac.in, akpm@linux-foundation.org,
 corbet@lwn.net, dakr@kernel.org, david@kernel.org, jgg@ziepe.ca,
 kees@kernel.org, leon@kernel.org, liam@infradead.org, lizhi.hou@amd.com,
 ljs@kernel.org, lyude@redhat.com, maarten.lankhorst@linux.intel.com,
 mamin506@gmail.com, mhocko@suse.com, mripard@kernel.org,
 nouveau@lists.freedesktop.org, ogabbay@kernel.org, oleg@redhat.com,
 rppt@kernel.org, shuah@kernel.org, simona@ffwll.ch,
 skhan@linuxfoundation.org, skinsburskii@gmail.com, surenb@google.com,
 tzimmermann@suse.de, vbabka@kernel.org
Date: Tue, 14 Jul 2026 13:13:53 -0700
Message-ID: <178406003318.1082778.16211328573488321338.stgit@skinsburskii>
In-Reply-To: <178405975214.1082778.5193079941156341151.stgit@skinsburskii>
References: <178405975214.1082778.5193079941156341151.stgit@skinsburskii>
User-Agent: StGit/0.19
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID-Hash: LQTNTD5FJV6P74LV3EVJSW2MF2IG7KYK
X-Message-ID-Hash: LQTNTD5FJV6P74LV3EVJSW2MF2IG7KYK
X-MailFrom: skinsburskii@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-rdma@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/LQTNTD5FJV6P74LV3EVJSW2MF2IG7KYK/>
Archived-At: 
 <https://lore.freedesktop.org/178406003318.1082778.16211328573488321338.stgit@skinsburskii/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

The timeout passed to hmm_range_fault_unlocked_timeout() is a relative
retry budget for HMM's internal mmu-notifier retry loop. drm_gpusvm was
still keeping an absolute deadline around the outer driver retry logic
and passing the remaining time into HMM.

Pass HMM_RANGE_DEFAULT_TIMEOUT directly to
hmm_range_fault_unlocked_timeout() on each HMM fault attempt instead.
If HMM succeeds but the later drm_gpusvm-side mmu_interval_read_retry()
check observes an invalidation, retry with a fresh HMM retry budget.

This keeps the timeout focused on repeated notifier retries inside HMM,
while avoiding an outer deadline that also accounts unrelated driver-side
work after HMM has made progress.

Signed-off-by: Stanislav Kinsburskii <skinsburskii@gmail.com>
---
 drivers/gpu/drm/drm_gpusvm.c |   21 ++++++---------------
 1 file changed, 6 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
index b8f2dd9982f5..76e8a0028c7f 100644
--- a/drivers/gpu/drm/drm_gpusvm.c
+++ b/drivers/gpu/drm/drm_gpusvm.c
@@ -852,8 +852,7 @@ enum drm_gpusvm_scan_result drm_gpusvm_scan_mm(struct drm_gpusvm_range *range,
 		.end = end,
 		.dev_private_owner = dev_private_owner,
 	};
-	unsigned long timeout =
-		jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
+	unsigned long timeout = msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
 	enum drm_gpusvm_scan_result state = DRM_GPUSVM_SCAN_UNPOPULATED, new_state;
 	unsigned long *pfns;
 	unsigned long npages = npages_in_range(start, end);
@@ -867,8 +866,7 @@ enum drm_gpusvm_scan_result drm_gpusvm_scan_mm(struct drm_gpusvm_range *range,
 	hmm_range.hmm_pfns = pfns;
 
 retry:
-	err = hmm_range_fault_unlocked_timeout(&hmm_range,
-					       max(timeout - jiffies, 1L));
+	err = hmm_range_fault_unlocked_timeout(&hmm_range, timeout);
 	if (err)
 		goto err_free;
 
@@ -1459,8 +1457,7 @@ int drm_gpusvm_get_pages(struct drm_gpusvm *gpusvm,
 		.dev_private_owner = ctx->device_private_page_owner,
 	};
 	void *zdd;
-	unsigned long timeout =
-		jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
+	unsigned long timeout = msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
 	unsigned long i, j;
 	unsigned long npages = npages_in_range(pages_start, pages_end);
 	unsigned long num_dma_mapped;
@@ -1478,9 +1475,6 @@ int drm_gpusvm_get_pages(struct drm_gpusvm *gpusvm,
 		return -EINVAL;
 
 retry:
-	if (time_after(jiffies, timeout))
-		return -EBUSY;
-
 	hmm_range.notifier_seq = mmu_interval_read_begin(notifier);
 	if (drm_gpusvm_pages_valid_unlocked(gpusvm, svm_pages))
 		goto set_seqno;
@@ -1495,8 +1489,7 @@ int drm_gpusvm_get_pages(struct drm_gpusvm *gpusvm,
 	}
 
 	hmm_range.hmm_pfns = pfns;
-	err = hmm_range_fault_unlocked_timeout(&hmm_range,
-				max_t(long, timeout - jiffies, 1));
+	err = hmm_range_fault_unlocked_timeout(&hmm_range, timeout);
 	mmput(mm);
 	if (err)
 		goto err_free;
@@ -1718,8 +1711,7 @@ int drm_gpusvm_range_evict(struct drm_gpusvm *gpusvm,
 		.end = drm_gpusvm_range_end(range),
 		.dev_private_owner = NULL,
 	};
-	unsigned long timeout =
-		jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
+	unsigned long timeout = msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
 	unsigned long *pfns;
 	unsigned long npages = npages_in_range(drm_gpusvm_range_start(range),
 					       drm_gpusvm_range_end(range));
@@ -1734,8 +1726,7 @@ int drm_gpusvm_range_evict(struct drm_gpusvm *gpusvm,
 		return -ENOMEM;
 
 	hmm_range.hmm_pfns = pfns;
-	err = hmm_range_fault_unlocked_timeout(&hmm_range,
-				max_t(long, timeout - jiffies, 1));
+	err = hmm_range_fault_unlocked_timeout(&hmm_range, timeout);
 
 	kvfree(pfns);
 	mmput(mm);


