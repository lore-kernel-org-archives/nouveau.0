Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEC52CD98D8
	for <nouveau@archiver.kernel.org>; Thu, 11 Jun 2026 12:45:44 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B10E610EF0A;
	Thu, 11 Jun 2026 12:45:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="X83bS2F+";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id DFA4B46A65;
	Thu, 11 Jun 2026 12:31:43 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1781181103;
 b=WWeKILxpOw0GFNTCXjGiNM2B2lQOjcEz0D0ujkrA51iEb51y14uymEbLlSbN9gWH6cQRN
 wjj/WZLJZNQ34K24LLwaJNj2TzL0THlh9Y0fWDl+Qswv+xqcwzvNnH/essAadWyx+CDVExs
 6UdlLkxxspQN+J9YoY4yZhP97yDe+XcAisXhp0ZdNgPLbBqTX4XHU13nY1hgB6A+u1uNT7B
 CQs7C7De1obr+wOoxxTW6yEEaMl0EillwMJ3YdGD5Oodqvv3YHsMxfog4mQiOhmKtO3bfka
 YpJGDrANiICvpMHX9pAROjIrv1ANgwOi+qrl240dgKOJvTv85m8VCIxabIPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1781181103; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=LXPVPLZ24FFS4gpZDOA+n5sn4Zne5FOUIT6Mg5+7lsY=;
 b=k8fu8lCQanfscF7OqGKdPfDn4fjS3GzXRxP+j2fDROSJol14QfVRINpObqfvK8+8w7bR1
 1aY5C2A6ADzRT7EmoUjZ4OgsyYUOMLcvKf3AuEQLq4tcfgdgNz77E8Wh+kNDYYxeezRx9G8
 10q6b9+UmLPNI4ty2FmPhpyZ8iDTdMHiV/UhYbsObL+Jm8kyuDPS/Qr+3FHR6i5rhzuBK5Y
 jD3i2VfQc5fSwrZ0HwUXKv8rAuGlNAt75BrK9TGn3E9AMJ3B7ts3QTbLt+ojqnp1+n5OYUW
 vbMwKs2F0tVJtaUA2t/rxCwJVK+ZnAQzo7Wt7YxBTBuyvwUAoZ5WkjZreHcw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id CB26746A45
	for <nouveau@lists.freedesktop.org>; Thu, 11 Jun 2026 12:31:40 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7A96210EEE7
	for <nouveau@lists.freedesktop.org>; Thu, 11 Jun 2026 12:45:40 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-45ee449671fso538976f8f.2
        for <nouveau@lists.freedesktop.org>;
 Thu, 11 Jun 2026 05:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781181939; x=1781786739;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LXPVPLZ24FFS4gpZDOA+n5sn4Zne5FOUIT6Mg5+7lsY=;
        b=X83bS2F+P5UTFoYvbkx83jazxgqq2q0AdVpqsJFmAsGgDeVI5VGnkV86RWA84+kI/a
         m+rRSiYxw5hfphJYG/kevAzR4cRZp20ry+ntleskl2co41T03MT5M6kdMM8YBu3/6qXa
         4FZmouUSrgb0WRZepyuFJNGn7y2KhS+bK7ILycoEVcnP96KEepipLIdpO7vEAFed2iku
         kx9XXuozygrAV/nOu0zfU/PX4MryhMEJaxw4ru/ZmiHnrhajEK5yB0wXNQPZ6C0/EMUT
         6Zee7iG6oZJUaBhcgZ+1CFlc4ZMGnnxcvIEcImklDVdqi/PwSe475U6uITX03HYSVOTm
         I0pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781181939; x=1781786739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LXPVPLZ24FFS4gpZDOA+n5sn4Zne5FOUIT6Mg5+7lsY=;
        b=B18EW1wFlIw8SKk3Vx/KyLGdjNS40FEP4cr0IMXU803MxRaYCq+CV8+G4dVDOANkzN
         aY9MkxowwwGgH4LfIYz7Qqdv07o4CgqOzavCJXjULJ1QVt2kJvsnayYAmzUwS+m3hewn
         IEsUCPD4gP0hlPnVkkXbdtOzjgw0VdtJN/UHt4FquvhKZMcyzaFh5IvYgBQTdWQE5oWH
         t1YqnJCtrMnr1hz4fJzUddKnaGgUWbl03HsRbkHaW7pQaLYEBqXHbrc+vP4HdPx/88kh
         jtm4T3lbn4dxJptJSoX2WPBd9u6dse6cpyq2Dicw14R1/DSPlinIKSRXJ+kV9j/ulNiK
         e4wQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ9K4fcMAYAACdHdhkah9mwirGnhNyocIUipMDhWqvB0zXu5hoiEzbBOsayjclm27RvvANOo0RC0@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzZJHRWo7eoouWKMnMaAP9WsDe6n1Alh7BlzZPlf0NX9XqoUH0L
	J7Mn77ECQrKH5wpuyw4N9MHegPc4lOCE1dcI4+/cDbcrq5+VdnrgKMjq
X-Gm-Gg: Acq92OGbBdAFKMzV0xgnCU1y3L5M5JFHNHWOfuD8awEvMEIGKuH/aAyP0YCTHPzA9vN
	DxKu2Fc92olVX66TSUoL2jQK5L+z4zikEtolTjT/IYx4D0J0UUz/M1UtQ4l/dMMXqA0oUenVM19
	sx3azWqa5F0hZbRFDngKz5eI/NUpyY1M6xloFkwCgGu5We6v3zt0T7KUAGKCTyZJSfCMsjt6ABC
	xXym+NNtCoOtfSAm7C4TRtZqxW6q2/nQFZnfvyFLAP7wfYKvHinUwCXsWaU4aL3/QXBxaRZA4mo
	C1RWtII6Y749sBZo6Sma5ChDUMyB9s5YdY4CmKj3RNCCgvMGTz9+Mff7OglDTYOXdWSzEF5ZpeB
	sWZ7uNFS6SXLzwGXSI4ABsUehCvawKGXdsyLGAuh/v2VNI8asWzumIpOKlaBaF2jq6FaFNz75Ay
	DMrqIcXMeocuLYpgp0N6XXdv7gbBidyZAwYU4qXUrctUCsE1+V0VURPRJvBhXrvIyr+bWgUG4q1
	ueZY63wHxO5FOKtrWU/ql67ayVz
X-Received: by 2002:a05:600c:8b29:b0:490:6e0f:29f4 with SMTP id
 5b1f17b1804b1-490e55cc3fdmr17908975e9.3.1781181938417;
        Thu, 11 Jun 2026 05:45:38 -0700 (PDT)
Received: from localhost.localdomain
 (ip-109-193-028-127.um39.pools.vodafone-ip.de. [109.193.28.127])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490e532c778sm48697645e9.14.2026.06.11.05.45.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 05:45:38 -0700 (PDT)
From: Marek Czernohous <mczernohous@gmail.com>
To: Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v3 1/2] drm/nouveau/pci: use config-space MSI rearm on
 MCP79/MCP7A (NVAC)
Date: Thu, 11 Jun 2026 14:45:34 +0200
Message-ID: <20260611124535.527275-2-mczernohous@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260611124535.527275-1-mczernohous@gmail.com>
References: <20260611124535.527275-1-mczernohous@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: V2F6NJDDEHUVRSHDV7I6Q2UJEFGCUPN4
X-Message-ID-Hash: V2F6NJDDEHUVRSHDV7I6Q2UJEFGCUPN4
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/V2F6NJDDEHUVRSHDV7I6Q2UJEFGCUPN4/>
Archived-At: 
 <https://lore.freedesktop.org/20260611124535.527275-2-mczernohous@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

From: Marek Czernohous <marek@czernohous.de>

NVAC (MCP79/MCP7A) uses g94_pci_func, whose .msi_rearm is
nv40_pci_msi_rearm(): a re-arm write through the MMIO mirror of PCI
config space.  On this IGP that path is unreliable; when a re-arm is
missed the interrupt line stays dead, command submission times out and
the GPU appears hung until reboot.  On an Apple Mac mini (early 2009,
MCP79, boot0 0x0ac080b1) this showed as sporadic fifo timeouts and GPU
hangs under load unless MSI was disabled via config=NvMSI=0.

Give NVAC its own pci func that re-arms through real PCI config space
(nv46_pci_msi_rearm) instead.  This follows existing precedent: nv46.c
documents the MMIO-mirror re-arm as broken on several related parts,
and commit 5112abc6a433 ("drm/nouveau/pci/g92: Fix rearm") fixed g92
the same way while moving the remaining chipsets, NVAC included, into
the newly added shared g94 table, where NVAC stayed on the MMIO path.
This change completes that fix for NVAC.  The sibling IGP NVAA
(MCP77/MCP78) has MSI disabled entirely as "reported broken" in
nvkm_pci_new_(); NVAC works correctly once the re-arm goes through
config space, so disabling MSI is not necessary.

Only NVAC is switched: that is the hardware this has been validated
on.  The other users of g94_pci_func (G94/G96/G98/GT2xx and the
MCP77/MCP89 IGPs) keep their current behavior; MCP77 and MCP89
plausibly want the same treatment but were not tested.

Tested on the Mac mini as a daily driver for two months with MSI
enabled and zero fifo timeouts.  Independently confirmed stable on an
iMac9,1 (MCP79) running 6.12.90 with the v1 form of this change (the
same one-line functional switch, applied to that kernel's g94
implementation).

Fixes: 5112abc6a433 ("drm/nouveau/pci/g92: Fix rearm")
Cc: <stable@vger.kernel.org> # v6.16+
Tested-by: Fab Stz <fabstz-it@yahoo.fr>
Assisted-by: Claude:claude-opus-4-7
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Marek Czernohous <marek@czernohous.de>
---
The stable tag is annotated v6.16+ because the new file uses the .cfg
member introduced there by 2f89bb3264af ("drm/nouveau/pci: add PRI
address of config space mirror to nvkm_pci_func"); on older kernels
the backport is the era-specific one-line .msi_rearm switch in the g94
implementation (nv46_pci_msi_rearm exists everywhere), happy to send
those per tree if wanted.

v2 -> v3: no code changes; annotated the stable tag, clarified the g92
precedent wording and that the iMac9,1 test used the v1 form, minor
nits (copyright line, declaration style matching the header, boot0
notation).
v1 -> v2: narrowed to NVAC via a dedicated mcp79 pci func instead of
changing the shared g94 table (only chipset the fix was validated on);
added Fixes/stable/Assisted-by tags.
v2: https://lore.kernel.org/all/c5a46ddcc38172b43bc3d7432e8114669f3dc933.1781162589.git.marek@czernohous.de/
v1: https://lore.kernel.org/nouveau/20260409172126.115441-2-marek@czernohous.de/

 .../gpu/drm/nouveau/include/nvkm/subdev/pci.h |  1 +
 .../gpu/drm/nouveau/nvkm/engine/device/base.c |  2 +-
 .../gpu/drm/nouveau/nvkm/subdev/pci/Kbuild    |  1 +
 .../gpu/drm/nouveau/nvkm/subdev/pci/mcp79.c   | 35 +++++++++++++++++++
 4 files changed, 38 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/pci/mcp79.c

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/pci.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/pci.h
index 112b674..0172e0d 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/pci.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/pci.h
@@ -46,6 +46,7 @@ int nv4c_pci_new(struct nvkm_device *, enum nvkm_subdev_type, int inst, struct n
 int g84_pci_new(struct nvkm_device *, enum nvkm_subdev_type, int inst, struct nvkm_pci **);
 int g92_pci_new(struct nvkm_device *, enum nvkm_subdev_type, int inst, struct nvkm_pci **);
 int g94_pci_new(struct nvkm_device *, enum nvkm_subdev_type, int inst, struct nvkm_pci **);
+int mcp79_pci_new(struct nvkm_device *, enum nvkm_subdev_type, int inst, struct nvkm_pci **);
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
index 0000000..e2ae242
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/pci/mcp79.c
@@ -0,0 +1,35 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright 2026 Marek Czernohous
+ *
+ * MCP79/MCP7A (NVAC): like g94, but MSI re-arm goes through real PCI
+ * config space.  The MMIO-mirror re-arm is unreliable on this IGP and a
+ * missed re-arm kills the interrupt line (see the nv46 comment; g92
+ * already re-arms through config space for the same reason).
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

