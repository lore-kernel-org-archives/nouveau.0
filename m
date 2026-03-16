Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51381F4645A
	for <nouveau@archiver.kernel.org>; Mon, 16 Mar 2026 12:08:46 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0768910E50D;
	Mon, 16 Mar 2026 12:08:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DI2v04Rf";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 5E79645139;
	Mon, 16 Mar 2026 11:57:59 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1773662279;
 b=ksg82DPvjLP4MJPh884fxt8o7KkeaxBiRDMlRZkOyB9gUh8d1zthECwmrHOXtK0YTK9t6
 KzPh3GDKNMVPQE+cynrw92A++HYSkeDGcpiLT7m/hevQDLy+yddABxraMstWNInOYUUxMbO
 9+xRPIbmbPXNtsZbArI7O9Ke+Mhy5Wv4TkVjmz4FDEqmTvLLm4uULNrGsgks0sMKJBOAJiI
 sAXZhXV0FS8g7XNfhbEBiYoJ5WBdaQg1u8AiBnnSy5YXAoHRF45f/GfFTEUr5KEHd0MPyhs
 3I9Chix/Dy6RvGXWI14HWfYGxL6i7sLUpxi4t+bzBbWYQ5L30zni2Hf/NjKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1773662279; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=vcMCN4hBDLIQ/4UX2mdBSL3FjHJfxnbR1E7YALxJuSk=;
 b=auRDqqNPo67JZYZ9arp9oHzK2ojmimcrfIvB6spREFZy/XU4CWgPGI/vwqfKpGU6B2CQa
 rPKVMGaecqFZXS20b6EIKw5nLRguKpFluOGsdttcqxE2c4iQXML0pmwdqvAqrKziEV5CnV1
 COB2oO2wcAuAMUokbwt8e+vZrPrMgYpTW7UH6BuaZZRGbhxFELnNaJMVZWPaywCn951ReX/
 IhhgeI3BLk4NmFHItoycnIX+6XTJb2Natk7cdGGPWs18k6UDquqBRCVfWcswvNsdAmWWaFg
 llNmo12B5alh91p5vxRmoo8SNOl1zBs6foRtS49YqB9qn4f0l+qa1OaeM6Kg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 8B41440696
	for <nouveau@lists.freedesktop.org>; Mon, 16 Mar 2026 11:57:56 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 173F010E502
	for <nouveau@lists.freedesktop.org>; Mon, 16 Mar 2026 12:08:43 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id
 98e67ed59e1d1-358d80f60ccso2701750a91.3
        for <nouveau@lists.freedesktop.org>;
 Mon, 16 Mar 2026 05:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773662922; x=1774267722;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vcMCN4hBDLIQ/4UX2mdBSL3FjHJfxnbR1E7YALxJuSk=;
        b=DI2v04Rf7f7vsEvT4wCVlUzJsLzXv5s3RocCu0091YZK7v+WIkAJ82Ae5PrVm14HCt
         aWXJEr8OMm15hGy0AYr1/N+tBFbxsOcChYQO2ko5P24C6/2Ywk35gJBLn2ZvAdVk5hsR
         mJC6+jnbbc2/CmatQHRhfOyUtWoZhN2I+kMvf2B2BWYBmYpfN4xNyUKz0tfmTegQ5rnH
         /6cvW+VZtSd1Gxm8Mumj0CbhvMsqlNhOsnS4XOO0XLpyXHWCqXFSOcXeQsRux+3Ctl4E
         K+ysheW+T94jRh0R2Ukno5vaxJCtXbx4NIbtFeRGB4M8U6B119gxXb8Aa9qiPu8OkSnp
         p9/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773662922; x=1774267722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vcMCN4hBDLIQ/4UX2mdBSL3FjHJfxnbR1E7YALxJuSk=;
        b=NKJHxo+I6uuqkjXLi9PRNKuNf8YvMLw7FzL151o7OdyEwsmukrvIqvoAqQrsHTgLQV
         jkbqX4MDNiUXYPV+NHSEZsZZd2WMR01NBecahy8NNNLwBEIYCOye8UrGsnEac9pq101B
         XrnOnM+6O3DOYKPVqi+S+bVh4WZm0KoIxOW3vw7kxddPBI0ktBPv0kt63aaHffBgrdbw
         1KsHiDes1qjQ6l1/fAiOyUKynsHKJiH9oPcJ6Qsx8wej7j0/C7z26YPIo8wucR+cWpPO
         z+11ITOm84NuBpZHN/tTSjcuAkyLkAGYUAzgTFoLimUt4LE49rYaYJQm66K7m1kEIij7
         74Ug==
X-Gm-Message-State: AOJu0Yw5fwjP8+tmkmZeJW5ooZLS/PE7T5z0UQbjXTMat2x7pDvJ/baM
	cGo8x+47W694ol1uSiQSueGj5hFLVxC8JRHwawzGjYs7BnYyCrlYnDSi
X-Gm-Gg: ATEYQzySNiACnpHO8oXzVHmDFOKpMc5ERLxubttlJHTHzgK/cBeHqvQ0688jg3JUg8y
	xkxO+KtBiwITC3hwGNo5b8oHrjkTi/+6Qmv2NEEar6oSLUr3xOOKuP7p0g69mTmD8f7OvFM/soV
	u7xt3Ii6h1AaO+oxRBoUYdjAu2qVXp/DbAM1IL5zbVa8Eh0VjXvpdgJoS2cnYj59+cwuT55cYzs
	h3RfpFychgdkLfXMROcgoc9UbOuwJ+IZdZ1L83RBp9O6V9Lf9KcfG/f+akh03Ph7Sn37gEpYKNr
	k9JbN53NnT9JcB64OMnBGq75QFhAxkM+o2bW8OaftLKtmMS+cnPGfVSBUrQ2pEM4VTp5phEVl+J
	6qCiAL7/oB8wyK1k6wZBsmSTOgclv2izv5483imgK77NUN4Ox5O/Ao8rGpYjvNGSB3/lPFgEAzW
	rwttMH6mqUiUTkgTnWQt4xHCFRhj7eaZ95CdcrFemhR7VBHQEkabGJ
X-Received: by 2002:a17:90b:2496:b0:35a:275c:4c27 with SMTP id
 98e67ed59e1d1-35a275c501bmr6504117a91.2.1773662922410;
        Mon, 16 Mar 2026 05:08:42 -0700 (PDT)
Received: from eric-wcnlab.tail151456.ts.net
 ([2001:288:7001:1099:c21f:f7d6:f4bc:6198])
        by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-35b9e36f45asm3240083a91.3.2026.03.16.05.08.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 05:08:42 -0700 (PDT)
From: Cheng-Yang Chou <yphbchou0911@gmail.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Alexandre Courbot <acourbot@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Gary Guo <gary@garyguo.net>,
	John Hubbard <jhubbard@nvidia.com>
Subject: [PATCH v2 2/2] gpu: nova-drm: rename nova/ directory to nova-drm/
Date: Mon, 16 Mar 2026 20:08:20 +0800
Message-ID: <20260316120820.2117081-3-yphbchou0911@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260316120820.2117081-1-yphbchou0911@gmail.com>
References: <20260316120820.2117081-1-yphbchou0911@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: YROOCZV7YCALBB55K4UXDDQUZTOXIDRY
X-Message-ID-Hash: YROOCZV7YCALBB55K4UXDDQUZTOXIDRY
X-MailFrom: yphbchou0911@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Ching-Chun Huang <jserv@ccns.ncku.edu.tw>,
 Chia-Ping Tsai <chia7712@gmail.com>, Cheng-Yang Chou <yphbchou0911@gmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/YROOCZV7YCALBB55K4UXDDQUZTOXIDRY/>
Archived-At: 
 <https://lore.freedesktop.org/20260316120820.2117081-3-yphbchou0911@gmail.com/>
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
---
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

