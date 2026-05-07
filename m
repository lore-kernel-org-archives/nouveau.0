Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF61FCD343F
	for <nouveau@archiver.kernel.org>; Thu,  7 May 2026 18:50:36 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7943810F244;
	Thu,  7 May 2026 18:50:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="G8ECtWEm";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id BE89F45E11;
	Thu,  7 May 2026 18:37:53 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1778179073;
 b=oCqOlrxy7I8HjVXWY0C7Qlfe+ried84fQlg5oNVUHOEh7mn2t2hM2hDQheXTYNVC/RQGK
 Ql50SbHhZbNEMlqXCDLbhv4mEf9xpEy8ZYPOh54dr2169sGua5dZbzuGd9QO0kZj5KfF0pD
 dfuAaBNJyFBf2JbwzRluSvE3bWB9D13gUt9vkJuOi9sGtczIh5tr1X/m6torVb+Mbv8r7A3
 7LgvlC5U84GxBQyFXLu6fMGIOGGTmbzQ9YwO9nlWQVJKDZTD1V40ohd60WKlmOcN3rFW318
 TM2lN19b3IRsEBAsoeHTKo8e3SSpX5RWygPQcohnBe7PMRPTeX4kjflTOOPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1778179073; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=cebLT9hDPtWbyk0oiA7eJWjbxe/0ODK0hQtqVY9UxIQ=;
 b=xKij7BfDytc22OkBrd3pKEimrQtdvM6kKhUVxGVvIZWVUt3v6kygGfgY21B/gakdF0cg+
 uZVPubl5nTTupUCO52tpKNdZR+FKlRZ8OF+apVW8vgpu0g7yL8CKC70rAbcSNDEwI8Pwp2O
 SYZ9fKT4AbuB61I8S87f+N9wAUqePVlDdD5bFatQByOcaaAlUdpPD9PgeI2XgVUUzxGmBGg
 ua685q0LNID1NRrxmVzstxODNZW5ztBbJ/NJIo9CApRxsCqTPfVKPo9GnigDHZTuE13cLLs
 XdaizdU1fodvrpokkSvYvIfRe3hGKX7Fbaj+QFpma4ZdLMuiROG7u23VQJvg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 1D8FD45E0A
	for <nouveau@lists.freedesktop.org>; Thu,  7 May 2026 18:37:51 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
	by gabe.freedesktop.org (Postfix) with ESMTPS id AAF6F10E5A5
	for <nouveau@lists.freedesktop.org>; Thu,  7 May 2026 18:50:33 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-2b9705613ddso7913555ad.1
        for <nouveau@lists.freedesktop.org>;
 Thu, 07 May 2026 11:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778179833; x=1778784633;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cebLT9hDPtWbyk0oiA7eJWjbxe/0ODK0hQtqVY9UxIQ=;
        b=G8ECtWEmJNGOp4fZqss4X4YRIqD0WywAkicEP9Z1SkMgVtBygcC7lEgRsr2My9R1aC
         g972x2sz7hXtqVnAMUeqDg6YZhtO+W6BI+vTrrA6ztEjMPveR7iIRwkxMFBvA1jTRvmN
         bQQfOzLI1j5ifRN6IZDPbGpcp0glf2/1ytqwk8faRW7OqcYT8NggPlEjmJLgpUbxrdli
         mke6nOCqPj+44cK/ee3FPnABm0gZaaRCjf3fcFHj5bxTwdk3TvypJRgCZiChE7UQqHMu
         ZqRw6kY7U8bZPkeG4qaqqffhNVCcQXgLWd34quz+5sXnUkZBAJmrEqqy1XWze8ax7QlC
         Ot1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778179833; x=1778784633;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cebLT9hDPtWbyk0oiA7eJWjbxe/0ODK0hQtqVY9UxIQ=;
        b=rRm9T6J1NroGMuie6gaKd7ZETmihMTM0BUv+IMhjuI3GRWSdbaesshojPYexv1r3oS
         vftgUvz+ljUc5tUAKk9GxoNEYy2OvuLK9jruVhbSMK3vmnonzTOO6eUyri0Im7/VEKzD
         kF27/vIfFmzH+ep+9I5INaHKo/R7FFDyW33zwoYuLsqkzpXzMm5DUo9X18jLVdYuCRe6
         giX6owCYzm2MslB4uybyISfdhGTGWDV2KaI3FSK/Nm+pmRACedbQDp/RAypYI29mG36C
         IfEXGWbyTdeOIDM0PwoWJqjhS8eglceGKm8sVXIbtbGpNdm22p+6fAwLtNdoPkQQvc4z
         SNfQ==
X-Gm-Message-State: AOJu0Yw9IVxL92Yfj89BTyLOyRuZX3Mz54K3O5nhL5Okli1wKstPQEES
	inGJbnweBWVDjt+1gQ2sNyHrLqx/gQnuDB5fxLQwo5kenMgpCJm5KjzB
X-Gm-Gg: Acq92OGYQBXCrkgkVZyi7l+Nkz65/CMksAUFo0hbreTgjn+f8YVRf8CWpxQajM/S0UN
	kWaRUUrS/e8rKQTqqJ1+kyFKb2sS9pxWATZow8FLLaLoB2sCrb5uaso4b31q7sWrOx1uqvFURqs
	jhnNTwm+gbqBwD2nRQM+HeL9Cx5usJ95bhULFhcIDBcZZw1idCw1+Y2/oevS/RwjJ3SBiE48h5K
	J1Hfl3YbaP8T/mLEn/b878zaPHO3ons2TKgOMudlyfYTSzGsw+Zjf5IYeHix8urKdalaha3vAzZ
	8vCn+hnaxgjlX9IaLuPgilbzrdwRFolo1U5ykfyC60NDKAoStOVcrbFrVx7EZGGM+t6zvrwO/Ar
	KXEizhyrgqapFdHM+WDWsEBXzyMvXG8BZNefGE1M70ncWs6IDHhtL87ZS3X5ScZOGOUIdWtEqS6
	YB3FZSXiANzG9MJs8lXt4xFkwwlQqOaMQOP8DmzUGYe7aFod92radY
X-Received: by 2002:a17:902:bc82:b0:2b2:ccfb:8387 with SMTP id
 d9443c01a7336-2ba799d7368mr68521255ad.28.1778179833052;
        Thu, 07 May 2026 11:50:33 -0700 (PDT)
Received: from eric-wcnlab.tail151456.ts.net
 ([2001:288:7001:1099:1e70:8174:f80d:ff44])
        by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2bae78709d1sm4272595ad.67.2026.05.07.11.50.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 11:50:32 -0700 (PDT)
From: Cheng-Yang Chou <yphbchou0911@gmail.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Alexandre Courbot <acourbot@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Gary Guo <gary@garyguo.net>,
	John Hubbard <jhubbard@nvidia.com>
Subject: [PATCH v3 2/2] gpu: nova-drm: Rename nova to nova-drm
Date: Fri,  8 May 2026 02:49:26 +0800
Message-ID: <20260507185012.1527139-3-yphbchou0911@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260507185012.1527139-1-yphbchou0911@gmail.com>
References: <20260507185012.1527139-1-yphbchou0911@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: UCJPUM6TJZWK3IQ4SE4HZDE47HYD7X2X
X-Message-ID-Hash: UCJPUM6TJZWK3IQ4SE4HZDE47HYD7X2X
X-MailFrom: yphbchou0911@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: nouveau@lists.freedesktop.org, Ching-Chun Huang <jserv@ccns.ncku.edu.tw>,
 Chia-Ping Tsai <chia7712@gmail.com>, Cheng-Yang Chou <yphbchou0911@gmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/UCJPUM6TJZWK3IQ4SE4HZDE47HYD7X2X/>
Archived-At: 
 <https://lore.freedesktop.org/20260507185012.1527139-3-yphbchou0911@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

The .ko filenames must match the module names to ensure consistency
before these names are exposed as UAPI via driver_override.

Update nova/Makefile and nova-core/Makefile so that nova-drm.ko and
nova-core.ko are produced, matching the module names set in patch 1.

Update drm::DriverInfo with the correct driver name and vendor
description. Fix Kconfig help text for both drivers and the debugfs
directory name in nova-core to match the new module names.

Closes: https://github.com/Rust-for-Linux/linux/issues/1228
Signed-off-by: Cheng-Yang Chou <yphbchou0911@gmail.com>
---
 drivers/gpu/drm/nova/Kconfig       | 2 +-
 drivers/gpu/drm/nova/Makefile      | 3 ++-
 drivers/gpu/drm/nova/driver.rs     | 4 ++--
 drivers/gpu/nova-core/Kconfig      | 2 +-
 drivers/gpu/nova-core/Makefile     | 3 ++-
 drivers/gpu/nova-core/nova_core.rs | 2 +-
 6 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/nova/Kconfig b/drivers/gpu/drm/nova/Kconfig
index a2028b8539d7..ba16c74401f8 100644
--- a/drivers/gpu/drm/nova/Kconfig
+++ b/drivers/gpu/drm/nova/Kconfig
@@ -14,4 +14,4 @@ config DRM_NOVA
 
 	  This driver is work in progress and may not be functional.
 
-	  If M is selected, the module will be called nova.
+	  If M is selected, the module will be called nova-drm.
diff --git a/drivers/gpu/drm/nova/Makefile b/drivers/gpu/drm/nova/Makefile
index 42019bff3173..f8527b2b7b4a 100644
--- a/drivers/gpu/drm/nova/Makefile
+++ b/drivers/gpu/drm/nova/Makefile
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
 
-obj-$(CONFIG_DRM_NOVA) += nova.o
+obj-$(CONFIG_DRM_NOVA) += nova-drm.o
+nova-drm-y := nova.o
diff --git a/drivers/gpu/drm/nova/driver.rs b/drivers/gpu/drm/nova/driver.rs
index f8f7beeccb13..e3de04f358f0 100644
--- a/drivers/gpu/drm/nova/driver.rs
+++ b/drivers/gpu/drm/nova/driver.rs
@@ -32,8 +32,8 @@ pub(crate) struct NovaData {
     major: 0,
     minor: 0,
     patchlevel: 0,
-    name: c"nova",
-    desc: c"Nvidia Graphics",
+    name: c"nova-drm",
+    desc: c"NVIDIA Graphics and Compute",
 };
 
 const NOVA_CORE_MODULE_NAME: &CStr = c"nova-core";
diff --git a/drivers/gpu/nova-core/Kconfig b/drivers/gpu/nova-core/Kconfig
index d8456f8eaa05..f918f69e0599 100644
--- a/drivers/gpu/nova-core/Kconfig
+++ b/drivers/gpu/nova-core/Kconfig
@@ -14,4 +14,4 @@ config NOVA_CORE
 
 	  This driver is work in progress and may not be functional.
 
-	  If M is selected, the module will be called nova_core.
+	  If M is selected, the module will be called nova-core.
diff --git a/drivers/gpu/nova-core/Makefile b/drivers/gpu/nova-core/Makefile
index 2d78c50126e1..4ae544f808f4 100644
--- a/drivers/gpu/nova-core/Makefile
+++ b/drivers/gpu/nova-core/Makefile
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
 
-obj-$(CONFIG_NOVA_CORE) += nova_core.o
+obj-$(CONFIG_NOVA_CORE) += nova-core.o
+nova-core-y := nova_core.o
diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index 80264094d44b..c488058880be 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -52,7 +52,7 @@ struct NovaCoreModule {
 
 impl InPlaceModule for NovaCoreModule {
     fn init(module: &'static kernel::ThisModule) -> impl PinInit<Self, Error> {
-        let dir = debugfs::Dir::new(kernel::c_str!("nova_core"));
+        let dir = debugfs::Dir::new(kernel::c_str!("nova-core"));
 
         // SAFETY: We are the only driver code running during init, so there
         // cannot be any concurrent access to `DEBUGFS_ROOT`.
-- 
2.48.1

