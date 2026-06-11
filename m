Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 060CBCD8CB9
	for <nouveau@archiver.kernel.org>; Thu, 11 Jun 2026 07:26:45 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D817110ED2B;
	Thu, 11 Jun 2026 07:26:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PGUF1AFJ";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 8B01646A31;
	Thu, 11 Jun 2026 07:12:42 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1781161962;
 b=ohsP6KHpHRP2yMHLD7+Vh0tiT+2UQigBMw5I9JWYuoyajBGWRNDZ++l+04wPJiIePzLYM
 cc8A0qG+sXjlCi7ElsCBH1ph732sUYw9HRvmGnf7BRvznsxEfnjBQqy5BHW9jmjgQefal6j
 ilrEkvKTM0yAh8LAl3ysJfDV5Lku9gv1t4OwzpEJv+2uPSifqgTb4pCu3nEfAn4Jo/bv6Xy
 bKH3LxIDBwXCrEyEyB3flNiMKCBegeATQ5MTREyeSRIATgH53D6l1r6aVGVtvh0qBobM2KA
 HrEZov9uZOhw2kGKZhdmX39slBNSoP3CvQSpHl/hhuApSJq9ptQlTo75Mcaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1781161962; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=5eKc8xoinNQulP3EE43EUw/q3KLX56zkxbj8GquDS6g=;
 b=pDRvRyqq606gewsrp84u+3jjCzBQwMd/KXodqDj8EEbLAZ01wYarU38ymZJFZsb1M5n8g
 iaHF+0M2XLJcDQGds+n/3wXWoNTaIoirtyqHhDJD69xFMpRPFYaCa1KhEbYR2UGK8jpaZfG
 F+J56LWNpSlxmLhbH9Ipz4Q4MCp4umY6WYlTnndyFG7r+p0PXPjwMO2//+FsgDoqeTAg4UQ
 ozphz94m9reWvXjexci9vpIqaBysMOfjzMSbIkVyyIh2yv3yLoNyUY+qK7NEMiO1Tc50WNk
 z/8XS4UeDSAVV7NzxNn41r96VE3MyCp8Uf9u09NsOoCMTVWdXaVBT6rFB3Og==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 235A146980
	for <nouveau@lists.freedesktop.org>; Thu, 11 Jun 2026 07:12:40 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4DF1410ED1B
	for <nouveau@lists.freedesktop.org>; Thu, 11 Jun 2026 07:26:39 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-490c28f84fdso13361085e9.0
        for <nouveau@lists.freedesktop.org>;
 Thu, 11 Jun 2026 00:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781162798; x=1781767598;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5eKc8xoinNQulP3EE43EUw/q3KLX56zkxbj8GquDS6g=;
        b=PGUF1AFJ/SsGGWNeOzob070uVUgRy6aGZdBExgbRGmDiKc3bI1WqpN+/T0LCjN48dK
         l5oMvpPPvn9tLt9qguhPuxdCOPZ04Lu5DzKCH4Kul/FcILTY7k+9oTqiV3y4d078dxTZ
         XOx7cib/3oGpOKoZbijj2uD9sHVPxizYhHrv3fd5C1dYGZ/466+snDS0eQiTpWN3EqFN
         3W0h6979WsLcWXNAzCoR7YmOmuZ+1gv1zO7QFkNFbse29BNcrAGkWSu/w0nTK9vuIsnF
         vGeSRlCC8kj+LX2CthllOOnG3n6oj4kgCRfcHVBogjt4jbTg+ZOgTp5GBwSUD2EzZPvL
         V/Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781162798; x=1781767598;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5eKc8xoinNQulP3EE43EUw/q3KLX56zkxbj8GquDS6g=;
        b=Rn3FYw3r2wa+qR7lD7M5yUf2Xe/+U6RZ1pca06ZLI1UlV2BAIvVRbeRSBBIRXfuBLy
         KlBfBWptUbHNvOTi+gwsv5gF4J7rpf478U04phiedYoHpYn7jKykQ8idj3XU3XJ7+Mzg
         M/LqqB/04xMQlfkvRMfpRvd6Dt0aJcXlhVObnS/BgjhbVM65UDtKcynsrjNjQTOJvJXF
         DfXiog5Oumhq5DPSi94s48+30JNB+jEj+e3nNEFFVY/W6jdX357n3NTpybC/voI09rju
         h4QIw4zM58YKJA+ZXokzhl+O7Nfeegrp8geOOghbfQtMFD2vYo1EdsF7U6CJGFAEHKTF
         ALZw==
X-Forwarded-Encrypted: i=1;
 AFNElJ/DMCldosnkA/pr+xuXLSVOvdHljMaBgaf8DU30GP8+DMcuohafcQILRZPGNuNK3GB24d9dqPZD@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyfNY+d0rohj8UGYqxxvwaa69B/Zx6EGELgCAbcIvgMtpbY/loJ
	e6//NTzk5CHH+9VwMe2VCu+akvZ+dh00Q4zMwQ8r3J266t5eVA3SSAdS
X-Gm-Gg: Acq92OHvru3gPldoY/GGcoLNuNwA24x78O1WEXz5FN3twzsBRQB66/fK0uG8Hs4arAY
	NlNTA23gN58NK/GWMoSUFKaNajm03V7SmmcXTcK0xTFOTgFzke3Mk1gLTlqJFzUGKhxipx1tCZJ
	fezaYJhfpQKa9351woLYGxis2PKR0/vHoLuLCSGMm/fUxI1PPhv5CuBf8FjKC4UJxl2aByLGwDO
	yK5m1qwc4C+bgnEUEegwEIbYCjg1rVcaUgyKbesaM30tESHt8WgfEwqOz0Z24QO8mpEmn5vNGrt
	zc/0oaF+0kMPc6pcGXpbmrSXK44T+hnkiGkh9z+ujVn0mnDAkxQ8AVww13WHhboFhiuQubJVxyA
	jpWMSWdIBE01Lu7fq74tG5j5TWtftuDi7nucMHGN+3F6FE1PCWa6Qw7cWcuv2nQL74RQoFFvrUQ
	JLs0Ugui4W5UrzkTKxrFDZMrLpC+B/sA8GOaUE/nT9yL4b0ku7ZUh4CLNczyYHxl2Q+z2aGx4k1
	qVvqv+ZetxMn/TSh+OG1qff9Q==
X-Received: by 2002:a05:600c:3104:b0:490:b2b2:87d2 with SMTP id
 5b1f17b1804b1-490e561be8cmr6449625e9.5.1781162797702;
        Thu, 11 Jun 2026 00:26:37 -0700 (PDT)
Received: from localhost.localdomain
 (ip-109-193-028-127.um39.pools.vodafone-ip.de. [109.193.28.127])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490e2c7ea21sm42585795e9.1.2026.06.11.00.26.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 00:26:37 -0700 (PDT)
From: Marek Czernohous <mczernohous@gmail.com>
X-Google-Original-From: Marek Czernohous <marek@czernohous.de>
To: Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v2 1/2] drm/nouveau/pci: use config-space MSI rearm on
 MCP79/MCP7A (NVAC)
Date: Thu, 11 Jun 2026 09:26:33 +0200
Message-ID: 
 <b658dc52cf2f7ec9cf65ba80f7713c7f79988583.1781162589.git.marek@czernohous.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1781162589.git.marek@czernohous.de>
References: <cover.1781162589.git.marek@czernohous.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 4HADVL5BALLN2WY3PHYXCAC3VIUHXBGE
X-Message-ID-Hash: 4HADVL5BALLN2WY3PHYXCAC3VIUHXBGE
X-MailFrom: mczernohous@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Fab Stz <fabstz-it@yahoo.fr>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/4HADVL5BALLN2WY3PHYXCAC3VIUHXBGE/>
Archived-At: 
 <https://lore.freedesktop.org/b658dc52cf2f7ec9cf65ba80f7713c7f79988583.1781162589.git.marek@czernohous.de/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

From: Marek Czernohous <mczernohous@gmail.com>

From: Marek Czernohous <marek@czernohous.de>

NVAC (MCP79/MCP7A) uses g94_pci_func, whose .msi_rearm is
nv40_pci_msi_rearm(): a re-arm write through the MMIO mirror of PCI
config space.  On this IGP that path is unreliable; when a re-arm is
missed the interrupt line stays dead, command submission times out and
the GPU appears hung until reboot.  On an Apple Mac mini (early 2009,
MCP79, 0xac080b1) this showed as sporadic fifo timeouts and GPU hangs
under load unless MSI was disabled via config=NvMSI=0.

Give NVAC its own pci func that re-arms through real PCI config space
(nv46_pci_msi_rearm) instead.  This follows existing precedent: nv46.c
documents the MMIO-mirror re-arm as broken on several related parts,
and commit 5112abc6a433 ("drm/nouveau/pci/g92: Fix rearm") already
split g92 out of the shared table for the same reason.  The sibling
IGP NVAA (MCP77/MCP78) has MSI disabled entirely as "reported broken"
in nvkm_pci_new_(); NVAC works correctly once the re-arm goes through
config space, so disabling MSI is not necessary.

Only NVAC is switched: that is the hardware this has been validated
on.  The other users of g94_pci_func (G94/G96/G98/GT2xx and the
MCP77/MCP89 IGPs) keep their current behavior; MCP77 and MCP89
plausibly want the same treatment but were not tested.

Tested on the Mac mini as a daily driver for two months with MSI
enabled and zero fifo timeouts; independently confirmed stable on an
iMac9,1 (MCP79) running 6.12.90.

Fixes: 5112abc6a433 ("drm/nouveau/pci/g92: Fix rearm")
Cc: <stable@vger.kernel.org>
Tested-by: Fab Stz <fabstz-it@yahoo.fr>
Assisted-by: Claude:claude-opus-4-7
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Marek Czernohous <marek@czernohous.de>
---
v1 -> v2: narrowed to NVAC via a dedicated mcp79 pci func instead of
changing the shared g94 table (only chipset the fix was validated on);
added Fixes/stable/Assisted-by tags.
v1: https://lore.kernel.org/nouveau/20260409172126.115441-2-marek@czernohous.de/

 .../gpu/drm/nouveau/include/nvkm/subdev/pci.h |  2 ++
 .../gpu/drm/nouveau/nvkm/engine/device/base.c |  2 +-
 .../gpu/drm/nouveau/nvkm/subdev/pci/Kbuild    |  1 +
 .../gpu/drm/nouveau/nvkm/subdev/pci/mcp79.c   | 33 +++++++++++++++++++
 4 files changed, 37 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/pci/mcp79.c

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/pci.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/pci.h
index 112b674..88efe06 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/pci.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/pci.h
@@ -46,6 +46,8 @@ int nv4c_pci_new(struct nvkm_device *, enum nvkm_subdev_type, int inst, struct n
 int g84_pci_new(struct nvkm_device *, enum nvkm_subdev_type, int inst, struct nvkm_pci **);
 int g92_pci_new(struct nvkm_device *, enum nvkm_subdev_type, int inst, struct nvkm_pci **);
 int g94_pci_new(struct nvkm_device *, enum nvkm_subdev_type, int inst, struct nvkm_pci **);
+int mcp79_pci_new(struct nvkm_device *device, enum nvkm_subdev_type type,
+		  int inst, struct nvkm_pci **ppci);
 int gf100_pci_new(struct nvkm_device *, enum nvkm_subdev_type, int inst, struct nvkm_pci **);
 int gf106_pci_new(struct nvkm_device *, enum nvkm_subdev_type, int inst, struct nvkm_pci **);
 int gk104_pci_new(struct nvkm_device *, enum nvkm_subdev_type, int inst, struct nvkm_pci **);
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
index b101e14..a809ec3 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
@@ -1237,7 +1237,7 @@ nvac_chipset = {
 	.mc       = { 0x00000001, g98_mc_new },
 	.mmu      = { 0x00000001, mcp77_mmu_new },
 	.mxm      = { 0x00000001, nv50_mxm_new },
-	.pci      = { 0x00000001, g94_pci_new },
+	.pci      = { 0x00000001, mcp79_pci_new },
 	.therm    = { 0x00000001, g84_therm_new },
 	.timer    = { 0x00000001, nv41_timer_new },
 	.volt     = { 0x00000001, nv40_volt_new },
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/pci/Kbuild b/drivers/gpu/drm/nouveau/nvkm/subdev/pci/Kbuild
index a14ea0f..90f03ba 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/pci/Kbuild
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/pci/Kbuild
@@ -9,6 +9,7 @@ nvkm-y += nvkm/subdev/pci/nv4c.o
 nvkm-y += nvkm/subdev/pci/g84.o
 nvkm-y += nvkm/subdev/pci/g92.o
 nvkm-y += nvkm/subdev/pci/g94.o
+nvkm-y += nvkm/subdev/pci/mcp79.o
 nvkm-y += nvkm/subdev/pci/gf100.o
 nvkm-y += nvkm/subdev/pci/gf106.o
 nvkm-y += nvkm/subdev/pci/gk104.o
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/pci/mcp79.c b/drivers/gpu/drm/nouveau/nvkm/subdev/pci/mcp79.c
new file mode 100644
index 0000000..9f6a6cd
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/pci/mcp79.c
@@ -0,0 +1,33 @@
+// SPDX-License-Identifier: MIT
+/*
+ * MCP79/MCP7A (NVAC): like g94, but MSI re-arm goes through real PCI
+ * config space.  The MMIO-mirror re-arm is unreliable on this IGP and a
+ * missed re-arm kills the interrupt line (see the nv46 comment; g92 was
+ * split out of the shared table for the same reason).
+ */
+#include "priv.h"
+
+static const struct nvkm_pci_func
+mcp79_pci_func = {
+	.cfg = { .addr = 0x088000, .size = 0x1000 },
+
+	.init = g84_pci_init,
+	.msi_rearm = nv46_pci_msi_rearm,
+
+	.pcie.init = g84_pcie_init,
+	.pcie.set_link = g84_pcie_set_link,
+
+	.pcie.max_speed = g84_pcie_max_speed,
+	.pcie.cur_speed = g84_pcie_cur_speed,
+
+	.pcie.set_version = g84_pcie_set_version,
+	.pcie.version = g84_pcie_version,
+	.pcie.version_supported = g92_pcie_version_supported,
+};
+
+int
+mcp79_pci_new(struct nvkm_device *device, enum nvkm_subdev_type type, int inst,
+	      struct nvkm_pci **ppci)
+{
+	return nvkm_pci_new_(&mcp79_pci_func, device, type, inst, ppci);
+}
-- 
2.53.0

