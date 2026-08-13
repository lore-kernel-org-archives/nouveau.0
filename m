Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57517C5B572
	for <nouveau@archiver.kernel.org>; Thu, 13 Aug 2026 13:22:17 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E316310F325;
	Thu, 13 Aug 2026 13:22:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="psUKvRik";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 39EB547734;
	Thu, 13 Aug 2026 13:05:57 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1786626357;
 b=Z4U+NCfSRHe+UCskisWjcWYoYNKmg8ZwdIeSbmKKxRp2sMYD3GxUpT2bg8NF4Sjx/tSqj
 pmxz+HYQipivtvgO874GJmAq2/tVJOOURmmdk5UpTxRccD03+J1PV/j6YrlF9pcsZngQM+l
 NlCxnykiWoBJqwzPjYulnefFtTk6yO+bJpPAscWbgwWMRJkSnNSuDDCdQHAuhjC6qfmgw4a
 QDEoSrMQi8SJIBjJe1UKW3WI2Kd04SN8WmVMYYRyaGFfgjBhtXFpjDcdtTkIFzpAsc+hbjQ
 VB03jMGopejBjzHTZZZzd3dkO6iXvcel16ButZ0685MJDovBeH9kWuR5d1jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1786626357; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=TVWNuYas/MOMOGJWvOzXANfSQQ0qHMRR18n7cjmi/E0=;
 b=glcROllUsReUXnU3bpfj12Md98ynS9K7fggUxbJqwyqRSYkLaqse0dFO+DdHxWRL+4MWh
 TxeFvmVRysDN0mBjsl12p//QLM8U5Pj9gLWJi1NYnytzHh+GqRGBPVh8UMi+XA9GPDHiDnR
 XQqTqy2vjvIJH2tUPbeNoK7mBA7oAzMa/+aGMGLHp7pRePqMq43t9GQsTy3sFYPHxIa5eYA
 9fYvqjNSJQK4AjkvT56vNjfpCFWEayAmlwmNWUEGGdFdGGuAoWtGUjS3TtGVFy/Eu5rMuLI
 h1NXl4Gsm1SwmQx7z5xl0iILUFOXfVVC/x2VJATR0JkuvcmQXQ/YNftt8qTg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 2A4EA473D7
	for <nouveau@lists.freedesktop.org>; Thu, 13 Aug 2026 13:05:55 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A09E010E392
	for <nouveau@lists.freedesktop.org>; Thu, 13 Aug 2026 13:22:14 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-2d0407aedd6so9651275ad.0
        for <nouveau@lists.freedesktop.org>;
 Thu, 13 Aug 2026 06:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786627334; x=1787232134;
 darn=lists.freedesktop.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TVWNuYas/MOMOGJWvOzXANfSQQ0qHMRR18n7cjmi/E0=;
        b=psUKvRikaZZsYEUaDBDEhGV/0URMzVEttvow+OHvIkYba70HjiSIBwH2Fk84JrP7rp
         vd48Gy960wCeVnbOw4eddCBc2E9APvO31f1KO+4eLgp2ZGMfRwmRwz9o5h0Jf5CGk21U
         KFQFbw0Recq89/7QVwsKgMg124AlKKtqnBjlxICaXac7Q30gso1lyHcx3nUVM0qn9Fth
         dydy/ZSa8qNQmypAp6Whfhmh9x0pPZQo9fTNwp4QoF0bBzPyBdBYyoWuclEg5bznb4WI
         /sd7pPnbHLyKrIWMY85BI7M+saDUR38ivzS5qIRYysp3IFK7X6QtfvayBM7Pi4fQHse1
         K0ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786627334; x=1787232134;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=TVWNuYas/MOMOGJWvOzXANfSQQ0qHMRR18n7cjmi/E0=;
        b=EXMfBuUpN9JtEwrnAmThV5t5So3SXomiC5ncwxlAaaUuwyJkGzeVw6AI7QXQ0ySsx3
         7XhyQiQGhzdeUW5dJEa45V8OwAT/H0ZrKbEj2sZzZPL2Bu80KH4u3SQul8HwZ/RAofpF
         K/vLP6K6wheNQhvqsd9fNo8NtxG+Iuedfrm9vYN+dX+fVflB/A4/r0V3XC7ooOtLMXQx
         eSvvR12IevC03iIxdXQoPkY6YvMaNMszp2/PA857Lg9RO5HZnK//RqXYbnIBy3spgnHi
         Hxm8k2s+ml9B7rMXKZ7mXbhNt1OzGUR/TNy8ax/611vCJhawdh5+PQF+zYjj9SCe8Mxf
         wmMg==
X-Forwarded-Encrypted: i=1;
 AHgh+Rp5FNX/zyEtBT1lgMlAF9LAVdns+yRkqESgaPyG4vF02m+ZOe89WkOCXm6Nrf/vCMJrvNOB07s4@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzOZGy0etXykTOLtnDZnnj+gqzLgyfXI43D2XHwxNa3TMnptwoh
	RvYZ0OboOB1hvuT8i4088VLz/Qe5PZBxHVW8eCsN2YYBNmAHPwGmXTLP4CulHH3Lzak=
X-Gm-Gg: AR+sD13w1nq08OX+5HrQDGCNfRKD/CUz4jECo+TnOkZZll3HDIDS3AhQwwT5xUzQ4lE
	+n7CCdxLt7NzQFjMlyZhHl+CyCKEMQWNzO8cNRwtiPeV0lV/yVfEYFy4gTWdzoEe+lPLjrau2yT
	8PobHs+5GleNQrqI3SFllyUXuF51S0bSZeJjN5LYsHamxImibU3d+sD7zFk8eQ/cCoKO2JGo2CZ
	8O3g5wOiZ6c3673/tP623yAAKxRox1maMy0Xl+cU3tSVYXMYGYJAv5CbP03sbntk6uCxZ63Qkzd
	uBmwiARLBMw63gcSdKzncUejv98ZIytRuoA1uW3MnXWRxcpT+2e809dNS7eLugAMcnjxocNdSMz
	RNWKly4xq+o7K8PQzUMSAwxaXQjKfAsJGBPdOQURP8ux/gWLkhu0DO9WH88kGZEU2XBvJorNsqJ
	3rd3isxCvdeUkro2A6PR9vblAGcIgED8xNgHD+blfeJMQuMc/TBKES2IENzIo=
X-Received: by 2002:a17:903:468e:b0:2ce:7563:70a5 with SMTP id
 d9443c01a7336-2d37d577d92mr68447035ad.6.1786627333851;
        Thu, 13 Aug 2026 06:22:13 -0700 (PDT)
Received: from LAPTOP-N3B6U5LC.localdomain ([117.147.100.52])
        by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2d37c4947cfsm9509705ad.65.2026.08.13.06.22.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 06:22:13 -0700 (PDT)
From: Zhenhao Wan <whi4ed0g@gmail.com>
Date: Thu, 13 Aug 2026 21:21:42 +0800
Subject: [PATCH] drm/nouveau/svm: drain fault handler before freeing svmm
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260813-nouveau-svm-svmm-uaf-v1-1-2d3112dea734@gmail.com>
X-B4-Tracking: v=1; b=H4sIAOXEfWoC/yXMQQqDMBCF4avIrDugEYP0KsXFJE7qFIwl04SCe
 PdGu3iLb/H+HZSTsMK92SFxEZUtVnS3BvxC8ckoczWY1th27HqMWy5MGbWs51bMFNA5H3pr7EB
 EUK/vxEG+V/Yx/a3Zvdh/zhYcxw/7gCVYeAAAAA==
X-Change-ID: 20260813-nouveau-svm-svmm-uaf-bbcf36265aaa
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Ben Skeggs <bskeggs@redhat.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786627329; l=2616;
 i=whi4ed0g@gmail.com; h=from:subject:message-id;
 bh=MkqdAWdWz0lutQb8l1T1yO7gmyXKQ04Cgj/5wL4FwHI=;
 b=yWyApmq3N/iL78hHvscIOIj2yoIsiORxcfjfAjWEf97XuifNnsE4SSw4ljisawH+utDwbmttv
 3Ei8K0VW84RAFRxr9ixUgqc/R/yxG9hg5HPCQE6XMJo06un1mFjA9V1
X-Developer-Key: i=whi4ed0g@gmail.com; a=ed25519;
 pk=zRTKlstE0LmilshGwJsFYEVjiT6RiXMBXK8Og6VmuVQ=
Message-ID-Hash: WTRCZPVIASBRAQQQ3UP4G4MZ2LAEVUGZ
X-Message-ID-Hash: WTRCZPVIASBRAQQQ3UP4G4MZ2LAEVUGZ
X-MailFrom: whi4ed0g@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Yuhao Jiang <danisjiang@gmail.com>,
 stable@vger.kernel.org, Zhenhao Wan <whi4ed0g@gmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/WTRCZPVIASBRAQQQ3UP4G4MZ2LAEVUGZ/>
Archived-At: 
 <https://lore.freedesktop.org/20260813-nouveau-svm-svmm-uaf-v1-1-2d3112dea734@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

The SVM fault handler nouveau_svm_fault() looks up each fault's
nouveau_svmm from the per-device instance list under svm->mutex, caches
it in the fault array, then drops svm->mutex and dereferences the svmm
across blocking faults (mmu_interval_notifier_insert(), hmm_range_fault()),
taking svmm->mutex and touching svmm->vmm.

nouveau_svmm has no reference of its own. It is freed on DRM file close,
via nouveau_svmm_fini() -> mmu_notifier_put(), which frees asynchronously
through call_srcu() without waiting for the handler; svm->mutex is not
held during the dereference, and mmget_not_zero() pins the mm, not the
svmm. A fault handled concurrently with a close can therefore dereference
a freed svmm. flush_work() on the fault buffer otherwise runs only at
device removal and suspend, never on the per-client close path.

The instance is already unlinked earlier in the same close, by
nouveau_svmm_part(), so no new fault can resolve to this svmm. Drain the
fault handler in nouveau_svmm_fini() before the free, so any handler that
cached the pointer has completed. nouveau_cli_fini() already flushes
cli->work here, and device-scope teardown already uses the same idiom.

Fixes: eeaf06ac1a55 ("drm/nouveau/svm: initial support for shared virtual memory")
Reported-by: Yuhao Jiang <danisjiang@gmail.com>
Assisted-by: Claude:claude-opus-5
Cc: stable@vger.kernel.org
Signed-off-by: Zhenhao Wan <whi4ed0g@gmail.com>
---
 drivers/gpu/drm/nouveau/nouveau_svm.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
index dcc92131488e..01191b126be5 100644
--- a/drivers/gpu/drm/nouveau/nouveau_svm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
@@ -304,6 +304,17 @@ nouveau_svmm_fini(struct nouveau_svmm **psvmm)
 {
 	struct nouveau_svmm *svmm = *psvmm;
 	if (svmm) {
+		struct nouveau_svm *svm = svmm->vmm->cli->drm->svm;
+
+		/* The fault handler caches svmm pointers looked up under
+		 * svm->mutex and then dereferences them after dropping it,
+		 * across blocking faults.  The instance has already been
+		 * unlinked (nouveau_svmm_part), so no new fault can resolve to
+		 * this svmm; drain the handler to release any in-flight
+		 * reference before the svmm is freed.
+		 */
+		flush_work(&svm->buffer[0].work);
+
 		mutex_lock(&svmm->mutex);
 		svmm->vmm = NULL;
 		mutex_unlock(&svmm->mutex);

---
base-commit: db2ddb87143519e20a95aa36c60b36107b736a58
change-id: 20260813-nouveau-svm-svmm-uaf-bbcf36265aaa

Best regards,
--  
Zhenhao Wan <whi4ed0g@gmail.com>

