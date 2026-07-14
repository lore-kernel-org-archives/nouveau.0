Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2327BC43458
	for <nouveau@archiver.kernel.org>; Tue, 14 Jul 2026 22:21:55 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id EEB5610EE7B;
	Tue, 14 Jul 2026 22:21:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="oQ2otNgb";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 1290A471D5;
	Tue, 14 Jul 2026 22:06:41 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1784066800;
 b=EmXhn3FY6RRE8MJIRV2AaBj2ArBw0Y8Siltl7k/1gTFfgztcdC2PJGeGmtFiFCoeJxVJ5
 4uB4xEOXWzE+xuEDk+TE2vhHAIOl90Z7Xvidiew6rlifuenIEATozaMkRSirdKqbtrP7bzZ
 M0aT6i6mB5yNm8JuqOxDmHWIr139M0K33KEntaAWM0XogPS+tfgtYi8GAa1RgJH/Ey7vtNW
 eHxYVGgX9yWunvOPy9aTilFtmtVq80XVQt8h8tU7JuWOQV6erBo9wLGudqqAV0MdIrh20+N
 E02J6B/yS0GrGpbZnFq4CFXg6Ylbv+SJgGv5TGb+snm+VF9sp+Zxx+BxUYGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1784066800; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=EUZJ2b06rpE59kyPt/lRc7T/ATHNB4Peeih6JEYSOE8=;
 b=hSzVoQLoKCkPttSdJgx2aUHLBGMd2Jb2XAKB1T7gDTtPl+/Q7OKW5XmMagcVnu7W19RO5
 5v3Ca2F+uIqA97CHOulRruv5NRFbim3B3kI0/OPEhh5KPq6ppghefSzBjK5fMKzchlnCIdH
 2rsQuUWrTxUn08FjQCoJ4Qomn8WCSi9HNpfIXCoQTTTPGeNgeSnVm3314E9t/ZCLum+NRs6
 SBbwCCC/WNIDxq0ry+bDp7K9PGs1KuBWokrrhNUFDO4w3z5J8jISItLDW+0a6onpiUW2Xtq
 +6fJDGspUuYLLXKJhJvNWL7EFB2g9/UQanehcrtC9l4L28KJTHpkYaxpONhA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id F262347123
	for <nouveau@lists.freedesktop.org>; Tue, 14 Jul 2026 22:06:38 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B904510EE7A
	for <nouveau@lists.freedesktop.org>; Tue, 14 Jul 2026 22:21:52 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-2cea3004256so48377255ad.0
        for <nouveau@lists.freedesktop.org>;
 Tue, 14 Jul 2026 15:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784067712; x=1784672512;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:subject:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=EUZJ2b06rpE59kyPt/lRc7T/ATHNB4Peeih6JEYSOE8=;
        b=oQ2otNgb7Og9cmM/XwueUjUQB69tT3PfCt4o3ayFXLcQivyjjqwxDIQG96fgxpaN7y
         Lr8FrR6O/DXXuDvg5Wo6c2njIOUDo4eN9OrMvslLQeC6kaZmgqS54Q17lEKUfZemRcxV
         Mp6+CHRHJ97WD3Npj0vnM62gkg0BJa0Z8LBwPmBpOgAAH7ed3fimZ5A7b61DL+NkPmvb
         XbsTmSVumDYHJPyQTy76nSXo7zdgK6PTIP6A7iAFH4tf1S8FIkpdlZsqgwvd0pKUGs6c
         KXFRvcwfn+yeC5+q23UDaJ4ffwNj/8q7W9D4X7dF/8yD8CCQKeOletw2qOe7tiPd8kKe
         ln2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784067712; x=1784672512;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EUZJ2b06rpE59kyPt/lRc7T/ATHNB4Peeih6JEYSOE8=;
        b=r735UTfjAtCrZx592P/liltAB0x8ZXyTqqKi5lEzhjUdaEQK8s80amUOHw0PumeHkv
         dJRW33ypn0V/7s1w7dTIpVoYQGexoy0d12fZyMzpw1cjJZJbSLsnUQ0BSX056TaQ/fky
         iL2bTCSvY2DUc0CQqhclvzSQGDcEFzdKHrbBnPtVKYbNnicsBtCYmSA43bbKP10vRW+9
         eNLO7r+tpIouEbHM9TfTTYjjHowfrpHKkN63rzgWZqughpdG9OUfrcm86yMU2nTDRoiH
         1+Qp9sZqePk8zOL6UYODwcEzogH4C//R3GbyvDA1Q2bnMTywdnmhvIAeeH5wLd3W5POk
         vWzQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RoTHfwX6TurHVuMPZR0mFiXAe5ZFSdOVatX+H/YLslJsxTAqZkYBFggFCGnvHktQlDGZ+fvFFhN@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwcQvBKlRBnvRe0ep2hXE2eCSxdGXP1srD4UqADiMvZW4VD9bg0
	JZivu81WKP2gg6se3wEEQiNSoNmSsssn9ifvZDYTwMqNjQIDIb0ZxgxU
X-Gm-Gg: AfdE7cmPXS8lgZAXlRZv8FF/7o/KyktE3/vTFe9kF4sNVdwtH7p4m/yCme33PtCyBhI
	PeZQQt8Ua+x5d0iJD+XcIEnKOHy5uQsTOMWetfLj41Ht+y8uKsD2RQkaK4Vt7YWV7Q/33dSRRhq
	9qyKHp8h/pccm28sQ9zTVek8sDXg8M5uepM9wqsKip8EoYBgZke4qS3DV4VgdqdbZuU9QZ37uEb
	qdZ+pXPtvxmiw7FRuHX8ZNvhz7G7tbA4xVNZpW0ikoCJvhjEIlMejoPfNKGwHpFuNhtG0VAZSYX
	ylQDaNNOFqjP/4YTHxtg7BxacWLq1HK1c4Ed/zCevcs8KhWOksRklBJHUxhICvikBjNh71yMVaL
	uaDfTHv8uNCx4bVjYXxtZixUSh9ZuYzLAUCjyGQ5bBHUdMJJzNRr7oqls54Cq659q9kr8yzfVHg
	HctJwg/2YdXzHFimNcDHthy7ZP5xuG/DNly0BfEJb7oyaffNOtX2eqO/+BZN4=
X-Received: by 2002:a17:902:e751:b0:2cc:307c:51f2 with SMTP id
 d9443c01a7336-2cef143aec1mr42102315ad.22.1784067712200;
        Tue, 14 Jul 2026 15:21:52 -0700 (PDT)
Received: from [192.168.0.160] (c-98-225-44-182.hsd1.wa.comcast.net.
 [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ccc9d1f030sm122554955ad.51.2026.07.14.15.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 15:21:51 -0700 (PDT)
Subject: [PATCH v2 4/4] fixup! drm/gpusvm: use
 hmm_range_fault_unlocked_timeout() for range faults
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
Date: Tue, 14 Jul 2026 15:21:49 -0700
Message-ID: <178406770964.1106335.10099816010446253543.stgit@skinsburskii>
In-Reply-To: <178406760622.1106335.2379450382728057793.stgit@skinsburskii>
References: <178406760622.1106335.2379450382728057793.stgit@skinsburskii>
User-Agent: StGit/0.19
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID-Hash: UWQKH6PRFFARHBENEJDLIIOUUEQ2NZD7
X-Message-ID-Hash: UWQKH6PRFFARHBENEJDLIIOUUEQ2NZD7
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/UWQKH6PRFFARHBENEJDLIIOUUEQ2NZD7/>
Archived-At: 
 <https://lore.freedesktop.org/178406770964.1106335.10099816010446253543.stgit@skinsburskii/>
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


