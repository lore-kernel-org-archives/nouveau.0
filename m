Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 809BBFD2D69
	for <nouveau@archiver.kernel.org>; Tue, 10 Mar 2026 12:20:38 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5A37910E6E0;
	Tue, 10 Mar 2026 12:20:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Myth0tS6";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 062C745016;
	Tue, 10 Mar 2026 12:10:05 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1773144604;
 b=SuyXRZm4amjFRzRHci8MdH0jp+XHrXrVarABNq48761YfnYaNp1QlxHi6WcsKd8zNxLZj
 B0hMSvswlJKFnMyOWvH51/zNlkcKNkUbMpAccRabyf/zLXxvo4Zlx+KXv7+D3dBcSguRRim
 eatIxHnIGtoKZvSpXH+ZVQXMWDWSWyj2u7B8wn5BDqJ6/rG1Rgb0ntnOp5RK3YEHIUUCvT3
 9bfK2tnXrBGw02JiULwnwjQmNiqH/ZYlKXdhh7MX9iPg9Mfx2ot2wTJHypbRNMyix+4mLp7
 5JhshMDomarFxCHO2G/zu/q7sKyTtYyguxz68d77ed/Xz6Rd/a8GDjej5RCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1773144604; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=jzGKi0IE+e0O0TkW5bmmYzbro6hAyekiqeV76oVBwN8=;
 b=h1lXLKwOqAgVdJRME3d2pQN6KllIv6TVHmIUHlDFI+ylEox81G7nO8Suo1lF0zNNx4xKp
 kuhwD6YbNVRXda4LBFZHMLi5mktFZuHVl2Bh7VMEu7gras497WQ3KgGQfXHCj+Dc0ZEyRBn
 N/I+X9MKRqMaImE64hTDa7MIEzdWlyptkiS7Uc2/t93irDPNg47bbMfSkHCj777VbySqeCj
 KnBlmhs/z4IOL6n8yC5Ebm82vQDGHqqQFd2fxX1i7FDcYvjDvnswV3FTissFNwvwd4kAA5t
 Xaiws/Yqv5yFWr/K7BV165DA8bJpfsYZ4BGBYkaUIgVu3gbPB6JJAAHLt9dg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id D7C0F4088B
	for <nouveau@lists.freedesktop.org>; Tue, 10 Mar 2026 06:14:23 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8013710E655
	for <nouveau@lists.freedesktop.org>; Tue, 10 Mar 2026 06:24:56 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id
 41be03b00d2f7-c70ea5e9e9dso4699535a12.1
        for <nouveau@lists.freedesktop.org>;
 Mon, 09 Mar 2026 23:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773123896; x=1773728696;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jzGKi0IE+e0O0TkW5bmmYzbro6hAyekiqeV76oVBwN8=;
        b=Myth0tS62vXZDsjK+jPhP9Yyw9n8TuNFFcIx+1zWR573ZkOKknMuk+vSjV6qpBYPuq
         RH0y4Ks1HAuMoQO3QxEoX79pcrimXTpeX5nZXuQGsinl5VI1GjnJQtl30JGfY4mPuIGF
         VgXDfR9zLRUN+Bb+dQLXQR744dpS03cbQT/w7IZp+kmyr+kBNN8P9j3LYrmUdqmUrNkj
         rPn7t3P5jDX7ovcqFhLKxM45EgDij9IR8pbvbha+X4Ks8wFlGV7s/5/WVeJ7/CIcoMPk
         hLLo5HDxPIcnykvrX3BAm6TylOMo4o3QS5Ku1ent6mBpRzUVxYTwG028RM9XbirLocAC
         Aaiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773123896; x=1773728696;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jzGKi0IE+e0O0TkW5bmmYzbro6hAyekiqeV76oVBwN8=;
        b=mNE8fRB0wwYaY4NYVUK5QN749IxvVhh/gwIuSkW5yF74HiC5J12l/2PAfOZryFSF3l
         YdGScj21K9C3UQcq5L3tNv/PlwgLkv8rt0vvcEVHVovqueztFFnCy2HhKTxVk0myOqaI
         oFqm6WvC4EzgGy4fOeuRe5ioyrbp8HIklmkXJiY2CDdOrvcd/tRh9GiT4mzinU27JpGF
         L7kJtZxwvCrb235pWdER0iKpiwIyVrL6pPsUOQ2dZBhHB9MUGt2AEYN7ZOwwOFAzpL0V
         wVj5FDjLKc2YXgl7RgoEVSf2/X9t8KpR/uIpA+4gGTrDMCnvxN3m6Y86yfmUp0PqeMLZ
         GK0g==
X-Gm-Message-State: AOJu0YzU6lW0Wz0GNVN6zttym7mmjB1ErV3yeeV5jXgI31zHmSRCSVtS
	jcOJWY+0ZLRvI9SiWC/uLPw5Iscpq1rzJS/7DxBmEwsgymghKeXr5Dfj
X-Gm-Gg: ATEYQzwhLZJiQHLEf6SRjTItlpj38GynOMYr5P9ihfueSv1zxpMY1u/YXxIy4GDoe5M
	iw3ucN+tal8CZL3o6AV2YxpvtriD26239QVXbsp3iZrEib3/OQAhu21XosEyMCXdhOb5K6yVghu
	zWYhUi4o5E9JMmrkWVfi8GmndidkWAnyk5jY1S3ghMdQ+E2zllohm/xXtAiaHIZzkLZTgEjKlDU
	b29j03hi22FG9LfzueoCRZ47JM2lwhgjIL2yBz4VILYBTDMaKVk+rr5IJU8QF+57E/6TGwlORha
	HYyeiqx2/k+Z78CLs6tW6RX7AQkuaBIgOPtf9sRMnNUxOkuo8ao/TUuDAivxofWVtY+WUscUdGl
	BXxVILx1AkBAOOcV1pYKTIg4TCrjBw0qz5a2yQdeb10Xgf9jOtCpkDF5Bazt3wsymcoj8UjoZIa
	TYunv0zXJxRW7fXWd9GDBb1OFwkaCfmnBJRoXqgP6KtCv4mIMG5LfH
X-Received: by 2002:a17:903:1ace:b0:2ae:4ebc:71d5 with SMTP id
 d9443c01a7336-2ae8249ce30mr148810525ad.52.1773123895891;
        Mon, 09 Mar 2026 23:24:55 -0700 (PDT)
Received: from eric-wcnlab.tail151456.ts.net
 ([2001:288:7001:1099:3cea:adff:13a5:9a2c])
        by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ae83f8cfb0sm187668565ad.67.2026.03.09.23.24.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 23:24:55 -0700 (PDT)
From: Cheng-Yang Chou <yphbchou0911@gmail.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Alexandre Courbot <acourbot@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Gary Guo <gary@garyguo.net>
Subject: [PATCH] gpu: nova: rename drivers to use kebab-case convention
Date: Tue, 10 Mar 2026 14:24:43 +0800
Message-ID: <20260310062443.2763230-1-yphbchou0911@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: yphbchou0911@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: FLEFPOHAJMR6J3CS6BWLSKAEGPRKBUFL
X-Message-ID-Hash: FLEFPOHAJMR6J3CS6BWLSKAEGPRKBUFL
X-Mailman-Approved-At: Tue, 10 Mar 2026 12:10:02 +0000
CC: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, jserv@ccns.ncku.edu.tw,
 Cheng-Yang Chou <yphbchou0911@gmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/FLEFPOHAJMR6J3CS6BWLSKAEGPRKBUFL/>
Archived-At: 
 <https://lore.freedesktop.org/20260310062443.2763230-1-yphbchou0911@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Rename nova-core driver from "NovaCore" to "nova-core" and nova-drm
driver from "Nova" to "nova-drm" to follow kernel naming conventions
before these names become UAPI (e.g. exposed via driver_override).

Link: https://github.com/Rust-for-Linux/linux/issues/1228
Signed-off-by: Cheng-Yang Chou <yphbchou0911@gmail.com>
---
 drivers/gpu/drm/nova/driver.rs     | 4 ++--
 drivers/gpu/drm/nova/nova.rs       | 2 +-
 drivers/gpu/nova-core/nova_core.rs | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nova/driver.rs b/drivers/gpu/drm/nova/driver.rs
index b1af0a099551..addf70c33cb2 100644
--- a/drivers/gpu/drm/nova/driver.rs
+++ b/drivers/gpu/drm/nova/driver.rs
@@ -32,11 +32,11 @@ pub(crate) struct NovaData {
     major: 0,
     minor: 0,
     patchlevel: 0,
-    name: c"nova",
+    name: c"nova-drm",
     desc: c"Nvidia Graphics",
 };
 
-const NOVA_CORE_MODULE_NAME: &CStr = c"NovaCore";
+const NOVA_CORE_MODULE_NAME: &CStr = c"nova-core";
 const AUXILIARY_NAME: &CStr = c"nova-drm";
 
 kernel::auxiliary_device_table!(
diff --git a/drivers/gpu/drm/nova/nova.rs b/drivers/gpu/drm/nova/nova.rs
index 8893e58ee0db..1fd454c7e0df 100644
--- a/drivers/gpu/drm/nova/nova.rs
+++ b/drivers/gpu/drm/nova/nova.rs
@@ -10,7 +10,7 @@
 
 kernel::module_auxiliary_driver! {
     type: NovaDriver,
-    name: "Nova",
+    name: "nova-drm",
     authors: ["Danilo Krummrich"],
     description: "Nova GPU driver",
     license: "GPL v2",
diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index c1121e7c64c5..90e98380687b 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -22,7 +22,7 @@
 
 kernel::module_pci_driver! {
     type: driver::NovaCore,
-    name: "NovaCore",
+    name: "nova-core",
     authors: ["Danilo Krummrich"],
     description: "Nova Core GPU driver",
     license: "GPL v2",
-- 
2.48.1

