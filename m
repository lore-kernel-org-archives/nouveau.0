Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3910F3381F
	for <nouveau@archiver.kernel.org>; Tue, 17 Mar 2026 09:23:23 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A646610E3C0;
	Tue, 17 Mar 2026 09:23:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ACKkII1k";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id D95B8451E2;
	Tue, 17 Mar 2026 09:12:34 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1773738754;
 b=UrWUgZulVpWw12f3UcDE2xk20GRQDQBk89gYMJwfuzsM68UlOhWDVmpTRh5y1z4MjbuKw
 33DJlUl4ffXdCr+fxw9Le2TKaaemLKL3cBs25L7MTZZd7ISpM6ocM9oqlnyIFw6VrgZFcLr
 DMt2y69LyGbUT6TJiRkXgF4+9Gy2pAJZ2psaSHMLLzasH0Pa3VwM53CI/DBP788JLZ7pmoK
 toGzPuf8a2XLN2imOvsH/pGROVYmrh0Skfm4l1hJaXeNtfm7z8yeG1lAuHoyAMbEekgDs3L
 xzsrUYzGybpl5RTwf1rDLGEX30trlYcaPcL/u6IgF0rwZqj53fw2OMFvq17w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1773738754; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=Nct4kNqnGcAYlXVnZ1lrP6jb9x/1/lWYKGUKVTO0MqM=;
 b=vc0LloviHjAfdFqSJUliRpyLtiebfX6Kgc/YFdACsh1g1AlEyuTj2kob2jGfV1SGMqs0f
 mEZRVH2WXG4th2ok9QxU1bVgmzenOYXzJg+/WqoPX184au5+eEY4pa435f7OJI1PoS9V94Y
 olcXWIlbXEr+ykkbCWQ1cN5w6/YbknVItZugrb6KlfgtQtLpMXuLJc8gUs9qr3B2dMrkXIA
 sL8MLTwWEJSoMZUimSmqfEIpWHmR0452TlUNx6YRV5S1hiO0a4NaR18bejwZE+ApU8fQI4c
 oDFI3ruExkP/7rqvpcjxY6NUxUlKnsBM3tX/ePK8rMO9v5uxDbL+faXqnnrw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id A8A1540321
	for <nouveau@lists.freedesktop.org>; Tue, 17 Mar 2026 09:12:31 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
 [209.85.215.171])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0EE9810E1E4
	for <nouveau@lists.freedesktop.org>; Tue, 17 Mar 2026 09:23:19 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id
 41be03b00d2f7-c2af7d09533so4406562a12.1
        for <nouveau@lists.freedesktop.org>;
 Tue, 17 Mar 2026 02:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773739399; x=1774344199;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nct4kNqnGcAYlXVnZ1lrP6jb9x/1/lWYKGUKVTO0MqM=;
        b=ACKkII1katibKgrPwhQ+Yq2neW4/wuDbgHQXi5sgdzuCS87lvR2CytyYsq34Dc5JOP
         4KBetMsOQqRKxpsmZ3Md8sfK80grWRhlfY1wmsPm+h+aoR/okY6R41FHOq2WzwQfnzp0
         G7FNo1jW+rU7oKy0io+xbV6G4Gs4eUKfba+U+1voO2W2XwgyZzO/RI2nhSXzX1X2gBA2
         EkjSG5D7WRfRF8KnmOMLEuxkv8I60Unc+sVMbTqrVQS48nxjCwnJN7HJn4lrhwu9hFgn
         3ApRhIPMeXL31fmuGaGD+pmeaJ4tlrh4CILoEcyBfYleqjPzpvnxww81KhDE3tDLav39
         WPWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773739399; x=1774344199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Nct4kNqnGcAYlXVnZ1lrP6jb9x/1/lWYKGUKVTO0MqM=;
        b=nAXHJRNug5Guh2gA08E1LIdAuc9XenA4BK3fPLiObC/qfoR8vO1vzWv2eM8e7G8EwN
         SW4xO4idU7/iTN3RmWcNAM6EHxiWx+O2t8fAWY9d9tFZg2GrWOgLn1Q1ZibzfTQNS21y
         D7fBJg9pTiymIAAOXjUTfaSZE2KDFGKAB9mYdrI9r6IBIyT+BWKmeTeeULPJ7hEwa30v
         MnGtc64UJq/F32h4MCDy0wpvrG7chpfvUz9/+Hd8vYC9h7LDrugUkIYHPQrsE3t1JBkD
         NqRvM8DqJ9WZwDyJ7LRefy8ngQ8kOWa9rQN2pij+ELYoNblk0TZQISUQ30ZiSHOfxeNj
         QdnA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVPsDenJ88O7ygp+i9zOe4SCbL7JfG0IGZKS6lrL4x/tAGb8BltMfOG2LJJeTFs5H2KMHZoYn9m@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwjTYHpoLUHG6Z85OYIdEVw1+l+RNRjYzV7f5HPTHcj5OHCGSyr
	3eyfJIIdBCKG01QFv7Bd5En6m0as7T5RPzscpfwXSjDmRSDDHKxUkUD3
X-Gm-Gg: ATEYQzyQXh3tWbW/V8/ve151pDrXIyruRwP0toihAYpitOodOW9eiVrGvDD0fG+Kijz
	X9GgrhBWZpdzLA30MTUr6GFyiefWM//EThn2DV9Hj9tg3UoDpBYUSxBwgC0Vl73PT7K/cxW5lYQ
	2dBIplXSa610LMDPrEl8pzcMYQhJPR4iJ78ZedpIDLAdjszfKqvPBzhUCGJ7iDoowXQA/mb6qco
	iIdxYIPY0LiPlRbdw4ODGV2mgEiO6p1ABE6mjXa7i3CaOhwYy0oPUJpG3fCtEAoocPIzrQntowD
	PNAy0E06RbCy5o0vBjWVAR0KiaVJMWPlW7iQWBGQC7rZ6Wn87YDD1l/uA6jNSmsR6jgrqFcftQr
	lRtHZWwUtbPb/KJ15di+vliln95F0mIVliLs5P+FsG+1VB+YQaaNhBYMdCCIa3JuJycGe36IbGa
	Sf+VbYzqZf1X3IWdxmjUAUndBFBNxSL6VnlLqjuZ8uJWjK7gIBSFsw
X-Received: by 2002:a17:903:19c8:b0:2b0:68d1:2538 with SMTP id
 d9443c01a7336-2b068d12618mr10289815ad.51.1773739399222;
        Tue, 17 Mar 2026 02:23:19 -0700 (PDT)
Received: from eric-wcnlab.tail151456.ts.net
 ([2001:288:7001:1099:6521:1510:d053:7359])
        by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2aece81dc18sm137065385ad.69.2026.03.17.02.23.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 02:23:18 -0700 (PDT)
From: Cheng-Yang Chou <yphbchou0911@gmail.com>
To: jhubbard@nvidia.com
Subject: [PATCH v3 2/2] gpu: nova-drm: rename nova to nova-drm
Date: Tue, 17 Mar 2026 17:23:04 +0800
Message-ID: <20260317092304.424377-1-yphbchou0911@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <e7539fd5-9a0d-4a06-aa02-ec3dcd235926@nvidia.com>
References: <e7539fd5-9a0d-4a06-aa02-ec3dcd235926@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 4CHYJ4N27N4M2DNF3KSJEUHDLCYLQRND
X-Message-ID-Hash: 4CHYJ4N27N4M2DNF3KSJEUHDLCYLQRND
X-MailFrom: yphbchou0911@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: acourbot@nvidia.com, aliceryhl@google.com, chia7712@gmail.com,
 dakr@kernel.org, dri-devel@lists.freedesktop.org, gary@garyguo.net,
 jserv@ccns.ncku.edu.tw, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org, simona@ffwll.ch, yphbchou0911@gmail.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/4CHYJ4N27N4M2DNF3KSJEUHDLCYLQRND/>
Archived-At: 
 <https://lore.freedesktop.org/20260317092304.424377-1-yphbchou0911@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Rename the nova-drm driver directory from drivers/gpu/drm/nova/ to
drivers/gpu/drm/nova-drm/ and the top-level source file from nova.rs
to nova_drm.rs (matching the object name nova_drm.o) to follow the
kebab-case naming convention already used by the auxiliary device name.

Update MAINTAINERS, Kconfig, and Makefile references accordingly.
Update the Kconfig help text to reflect the new module name nova-drm.

Link: https://github.com/Rust-for-Linux/linux/issues/1228
Signed-off-by: Cheng-Yang Chou <yphbchou0911@gmail.com>
Reviewed-by: John Hubbard <jhubbard@nvidia.com>
---
Changes in v3:
- Rename subject line (John Hubbard)

 MAINTAINERS                                            | 6 +++---
 drivers/gpu/drm/Kconfig                                | 2 +-
 drivers/gpu/drm/Makefile                               | 2 +-
 drivers/gpu/drm/{nova => nova-drm}/Kconfig             | 2 +-
 drivers/gpu/drm/nova-drm/Makefile                      | 3 +++
 drivers/gpu/drm/{nova => nova-drm}/driver.rs           | 0
 drivers/gpu/drm/{nova => nova-drm}/file.rs             | 0
 drivers/gpu/drm/{nova => nova-drm}/gem.rs              | 0
 drivers/gpu/drm/{nova/nova.rs => nova-drm/nova_drm.rs} | 0
 drivers/gpu/drm/nova/Makefile                          | 3 ---
 10 files changed, 9 insertions(+), 9 deletions(-)
 rename drivers/gpu/drm/{nova => nova-drm}/Kconfig (84%)
 create mode 100644 drivers/gpu/drm/nova-drm/Makefile
 rename drivers/gpu/drm/{nova => nova-drm}/driver.rs (100%)
 rename drivers/gpu/drm/{nova => nova-drm}/file.rs (100%)
 rename drivers/gpu/drm/{nova => nova-drm}/gem.rs (100%)
 rename drivers/gpu/drm/{nova/nova.rs => nova-drm/nova_drm.rs} (100%)
 delete mode 100644 drivers/gpu/drm/nova/Makefile

diff --git a/MAINTAINERS b/MAINTAINERS
index 7b277d5bf3d1..7ee486627420 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8201,7 +8201,7 @@ B:	https://gitlab.freedesktop.org/drm/nova/-/issues
 C:	irc://irc.oftc.net/nouveau
 T:	git https://gitlab.freedesktop.org/drm/rust/kernel.git drm-rust-next
 F:	Documentation/gpu/nova/
-F:	drivers/gpu/drm/nova/
+F:	drivers/gpu/drm/nova-drm/
 F:	include/uapi/drm/nova_drm.h
 
 DRM DRIVER FOR OLIMEX LCD-OLINUXINO PANELS
@@ -8484,7 +8484,7 @@ X:	drivers/gpu/drm/i915/
 X:	drivers/gpu/drm/kmb/
 X:	drivers/gpu/drm/mediatek/
 X:	drivers/gpu/drm/msm/
-X:	drivers/gpu/drm/nova/
+X:	drivers/gpu/drm/nova-drm/
 X:	drivers/gpu/drm/radeon/
 X:	drivers/gpu/drm/tegra/
 X:	drivers/gpu/drm/tyr/
@@ -8496,7 +8496,7 @@ M:	Alice Ryhl <aliceryhl@google.com>
 S:	Supported
 W:	https://drm.pages.freedesktop.org/maintainer-tools/drm-rust.html
 T:	git https://gitlab.freedesktop.org/drm/rust/kernel.git
-F:	drivers/gpu/drm/nova/
+F:	drivers/gpu/drm/nova-drm/
 F:	drivers/gpu/drm/tyr/
 F:	drivers/gpu/nova-core/
 F:	rust/kernel/drm/
diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index d3d52310c9cc..958fa142b6cd 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -308,7 +308,7 @@ source "drivers/gpu/drm/mgag200/Kconfig"
 source "drivers/gpu/drm/msm/Kconfig"
 source "drivers/gpu/drm/mxsfb/Kconfig"
 source "drivers/gpu/drm/nouveau/Kconfig"
-source "drivers/gpu/drm/nova/Kconfig"
+source "drivers/gpu/drm/nova-drm/Kconfig"
 source "drivers/gpu/drm/omapdrm/Kconfig"
 source "drivers/gpu/drm/panel/Kconfig"
 source "drivers/gpu/drm/panfrost/Kconfig"
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index ec2c5ff82382..acdec9e30a27 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -186,7 +186,7 @@ obj-$(CONFIG_DRM_VMWGFX)+= vmwgfx/
 obj-$(CONFIG_DRM_VGEM)	+= vgem/
 obj-$(CONFIG_DRM_VKMS)	+= vkms/
 obj-$(CONFIG_DRM_NOUVEAU) +=nouveau/
-obj-$(CONFIG_DRM_NOVA) += nova/
+obj-$(CONFIG_DRM_NOVA) += nova-drm/
 obj-$(CONFIG_DRM_EXYNOS) +=exynos/
 obj-$(CONFIG_DRM_ROCKCHIP) +=rockchip/
 obj-$(CONFIG_DRM_GMA500) += gma500/
diff --git a/drivers/gpu/drm/nova/Kconfig b/drivers/gpu/drm/nova-drm/Kconfig
similarity index 84%
rename from drivers/gpu/drm/nova/Kconfig
rename to drivers/gpu/drm/nova-drm/Kconfig
index 3e637ad7b5ba..48a731bff9b1 100644
--- a/drivers/gpu/drm/nova/Kconfig
+++ b/drivers/gpu/drm/nova-drm/Kconfig
@@ -13,4 +13,4 @@ config DRM_NOVA
 
 	  This driver is work in progress and may not be functional.
 
-	  If M is selected, the module will be called nova.
+	  If M is selected, the module will be called nova-drm.
diff --git a/drivers/gpu/drm/nova-drm/Makefile b/drivers/gpu/drm/nova-drm/Makefile
new file mode 100644
index 000000000000..bd3a5e703742
--- /dev/null
+++ b/drivers/gpu/drm/nova-drm/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+
+obj-$(CONFIG_DRM_NOVA) += nova_drm.o
diff --git a/drivers/gpu/drm/nova/driver.rs b/drivers/gpu/drm/nova-drm/driver.rs
similarity index 100%
rename from drivers/gpu/drm/nova/driver.rs
rename to drivers/gpu/drm/nova-drm/driver.rs
diff --git a/drivers/gpu/drm/nova/file.rs b/drivers/gpu/drm/nova-drm/file.rs
similarity index 100%
rename from drivers/gpu/drm/nova/file.rs
rename to drivers/gpu/drm/nova-drm/file.rs
diff --git a/drivers/gpu/drm/nova/gem.rs b/drivers/gpu/drm/nova-drm/gem.rs
similarity index 100%
rename from drivers/gpu/drm/nova/gem.rs
rename to drivers/gpu/drm/nova-drm/gem.rs
diff --git a/drivers/gpu/drm/nova/nova.rs b/drivers/gpu/drm/nova-drm/nova_drm.rs
similarity index 100%
rename from drivers/gpu/drm/nova/nova.rs
rename to drivers/gpu/drm/nova-drm/nova_drm.rs
diff --git a/drivers/gpu/drm/nova/Makefile b/drivers/gpu/drm/nova/Makefile
deleted file mode 100644
index 42019bff3173..000000000000
--- a/drivers/gpu/drm/nova/Makefile
+++ /dev/null
@@ -1,3 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-
-obj-$(CONFIG_DRM_NOVA) += nova.o
-- 
2.48.1

