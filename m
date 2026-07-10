Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BC5BC44507
	for <nouveau@archiver.kernel.org>; Fri, 10 Jul 2026 21:27:27 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id EDE8510E494;
	Fri, 10 Jul 2026 21:27:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gGQIrtGT";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id F17C54706F;
	Fri, 10 Jul 2026 21:12:21 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1783717941;
 b=TYeaMyQ44diLWXFggqmboVLWZ4A0Rn3cWLgCVWH7ASZjccT0nsXOzsk4zCzgvx3FQkoEk
 p0KOOkhl66P0xSaF1o5ZItKnOFle/VD4TQDldiLE70EsPTOOeNLuOn8PV7QycxVVci0oyuh
 FtcrB4GheRgHxjSl/sbXKhYK7hRpeBnePdcTvRJumquuJ/9rzGBdCD8K2kNS2MUi/5RMJWr
 KiTH+Evsufov6X1gvh46mlNkw7uM1LFQcBKAmeHQ7i/PZL0u90LwqW+8ldAhctyu9qmDLKI
 ngsZJQmgsXtTxCKkwhQY56aqNmPQnqtK1pm0BFArz8tXlrexnoo6BFNWhVlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1783717941; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=9/L8xh2nQ4nR7e9MheG1BnxPJ3sCm51YBcPVud12DY4=;
 b=MkwHd15oY9D7MHrwTBo4V3lCMsUWnL1wYtoFm3lacJwHSWb2eJeGzhxGvSxfvDoEVe+3L
 MZQpjy9PFIIk+TY16/gBhK3V0PC6Beyp+SOB/YqDCSIcqahdEOmrZKedfCGHVViIwaA11Ae
 xgY3o1A7uotGDuLVW85wssTOtKgUDsdqgp+AUjdLxmxL9U22RUrHR1K9n+fcDbZr9BYF5lL
 dh/HFcdiahVMyqOfrNaHUvBYJt2kWlEsI3AuHjWW28J6I11ueMmh7o0qV84u5G5fv0qzfEq
 fQd/D6uPWyYWWylR+5qojA1eLLI5m33B6UFyvs2XPiGYh/UWV1r1YG2FOZdw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id D2DDA46FDF
	for <nouveau@lists.freedesktop.org>; Fri, 10 Jul 2026 21:12:18 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A5E6010E240
	for <nouveau@lists.freedesktop.org>; Fri, 10 Jul 2026 21:27:23 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-2ce7d2adef4so17547035ad.3
        for <nouveau@lists.freedesktop.org>;
 Fri, 10 Jul 2026 14:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783718843; x=1784323643;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:subject:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=9/L8xh2nQ4nR7e9MheG1BnxPJ3sCm51YBcPVud12DY4=;
        b=gGQIrtGTynKjdPDj8yvozF8ZxPpF9Y+EOGwYcwCu3eFv1oMucGx7GjzLRs/iWVK8BZ
         gPL4xaVGiV6f4aC5aJ8NOt/ILZgW2D5C82x3diRTaer8rdqUpxu0YPpq4kG2qQY+AkHU
         ylC2aQkSkKPeW0hjNd947GDytpwDMRRJ3hgrsp9hcl1n+VcdU8WQNx6ssmTZTJuYiUnc
         DsHqejAhRmUY3cLWPD3RKzsYxDvFuUufNPIhL7TySPoxRuhac4+jfcnn0J9RBWHDgHl3
         fbiab7uRJrF9hWE4hl7C4PIkAOEmrhS3wduW0vP3nEfQPzytcC6AWqyotHn+q2J8BFot
         0KYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783718843; x=1784323643;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9/L8xh2nQ4nR7e9MheG1BnxPJ3sCm51YBcPVud12DY4=;
        b=IVqOR7H4p+cUg6mIL21dLVlNus87jGMru2eXQUea9A5RzFoNrZn5KhtngCHF3HxWfj
         JBLZt+yflo8VTROBSUYV23dsBZ2n9MA1FH7gc5V2cHboaX5kl0QwBrFseD3KaXQjKIvK
         RqBc8B55IpKwX7miy0V43bTNNTSYR86/3IHUjGmWLN0HpPXTObyGFlisSE0/0MMBRx3z
         wNrqiWnduCAcaVpEpebURwkLk2xBim6fihJ0QwPtayAuE2JFMJ4fuhHHAbIcANkAXeTC
         NK6ejK+GPahITUL/ADdwu0Qb5B9oyF262+RuLgmqQv4ScEDEHSPr0/9RO02IsPyrbDr5
         CWUA==
X-Forwarded-Encrypted: i=1;
 AHgh+RpXMI6uSYWaqxoB7r35nYc2Xd9TYVfxgS27yPBhQTH+zIflITxiGMvUbJrc12wDTiZ8GPvqF7bU@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxkyMoCPH5nXPGHZWhjZyja4lw0PwxuhIUKT8EZKEJJPM+BehMs
	5mya+yqM4YyvdwHQ4k7VN93hCV91hBZqh9FR5punIaY4cv39h9Lxd8Ef
X-Gm-Gg: AfdE7cmV/GMSSM1tdnewGJJtC3Nbb6tFWPjA9ze4TkloLvhetTQ7Q6soDTDgvqlSgrn
	NFswfMgKF15X4Ke9bHV6Qzdt/vVVjEkg5Gna2Omaz988H9VQEbcNE3HJJzapPP3KGqPuQxfD+Ho
	w+zaN2KHxXvqudXjZ3jUR/5saFUU09b5z8UdrtWqDqe5PnY7Nlthw/5dJA5AzWh/NEI9z4Jpgh/
	uVueELq3URewljiKi1V5R20smJd4tCH8nq4AdU0P5tIyfKAKeIxprNyk3OAKDW1TVW77QCdiPCx
	scVpZ9bRKxOZ0tCtb67+4DWW8YASjcpVSZRKmvM4fvx8qLDYk3NrO8OL64bOakBGtFtrv9hscMg
	6diGWY/FU9+ZRBgfPe9gKDOf/S5b5y5L6MN8x1EpI1aZpuS+ncxdwjI3dhVpO2C0EfnEBrmmu2I
	TKykVfwQ1q7sFVcwVZ06k+UbwjSNn8vk2F3vJ0xABEWuXKBGQxkkFZVKzrwKE=
X-Received: by 2002:a17:903:2b0d:b0:2ca:11af:5ee9 with SMTP id
 d9443c01a7336-2ce9ec0f0b4mr7098515ad.25.1783718843116;
        Fri, 10 Jul 2026 14:27:23 -0700 (PDT)
Received: from [192.168.0.160] (c-98-225-44-182.hsd1.wa.comcast.net.
 [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ccc9bf77e4sm65443035ad.22.2026.07.10.14.27.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 14:27:22 -0700 (PDT)
Subject: [PATCH v8 8/8] drm/gpusvm: Use hmm_range_fault_unlocked_timeout() for
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
Date: Fri, 10 Jul 2026 14:27:19 -0700
Message-ID: <178371883977.900500.2198446134676328631.stgit@skinsburskii>
In-Reply-To: <178371866223.900500.12312667138651735591.stgit@skinsburskii>
References: <178371866223.900500.12312667138651735591.stgit@skinsburskii>
User-Agent: StGit/0.19
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID-Hash: UW7KGV53MNDQVUCZF6K65OHOBRKTT7U5
X-Message-ID-Hash: UW7KGV53MNDQVUCZF6K65OHOBRKTT7U5
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/UW7KGV53MNDQVUCZF6K65OHOBRKTT7U5/>
Archived-At: 
 <https://lore.freedesktop.org/178371883977.900500.2198446134676328631.stgit@skinsburskii/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Several GPU SVM paths take mmap_read_lock() only to call hmm_range_fault(),
then retry -EBUSY until HMM_RANGE_DEFAULT_TIMEOUT expires. Those paths use
MMU interval notifiers whose mm matches the mm that was locked for the HMM
fault.

Use hmm_range_fault_unlocked_timeout() for those faults and pass the
remaining retry budget to HMM. The helper owns mmap_lock acquisition and
refreshes range->notifier_seq internally for each retry, while GPU SVM
keeps its existing driver-lock validation with mmu_interval_read_retry()
after a successful fault.

Leave drm_gpusvm_check_pages() on hmm_range_fault() because that path is
called with the mmap lock already held by its caller.

Signed-off-by: Stanislav Kinsburskii <skinsburskii@gmail.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/gpu/drm/drm_gpusvm.c |   52 ++++++------------------------------------
 1 file changed, 7 insertions(+), 45 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
index 958cb605aedd..6b7a6eaebcd9 100644
--- a/drivers/gpu/drm/drm_gpusvm.c
+++ b/drivers/gpu/drm/drm_gpusvm.c
@@ -788,22 +788,8 @@ enum drm_gpusvm_scan_result drm_gpusvm_scan_mm(struct drm_gpusvm_range *range,
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
+	err = hmm_range_fault_unlocked_timeout(&hmm_range,
+					       max(timeout - jiffies, 1L));
 	if (err)
 		goto err_free;
 
@@ -1439,21 +1425,8 @@ int drm_gpusvm_get_pages(struct drm_gpusvm *gpusvm,
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
+	err = hmm_range_fault_unlocked_timeout(&hmm_range,
+				max_t(long, timeout - jiffies, 1));
 	mmput(mm);
 	if (err)
 		goto err_free;
@@ -1736,24 +1709,13 @@ int drm_gpusvm_range_evict(struct drm_gpusvm *gpusvm,
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
+	err = hmm_range_fault_unlocked_timeout(&hmm_range,
+				max_t(long, timeout - jiffies, 1));
 
 	kvfree(pfns);
 	mmput(mm);
 
-	return err;
+	return err == -EBUSY ? -ETIME : err;
 }
 EXPORT_SYMBOL_GPL(drm_gpusvm_range_evict);
 


