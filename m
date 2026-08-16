Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92A3CC5DF6E
	for <nouveau@archiver.kernel.org>; Sun, 16 Aug 2026 13:09:13 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5391B10E2DA;
	Sun, 16 Aug 2026 13:09:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DzwTql79";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 111A547872;
	Sun, 16 Aug 2026 12:52:47 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1786884766;
 b=Pw8dblGul5JOSwzFNvxw7bcgzU6a00ypeezqH2QHWVohnEsj2t6pD87jmHUjdE7gZuH53
 ojtWmPJ6nyylNATTkYdI7BiqI4Uuw06zKhjw8AXeRahn2AaX0/GlDti7uiIublqV3iRqtyc
 wulsCm7kK3jVgyv9Ue5wIbETxVSZ9DSOEUQCFabZxNwhAp1sSeR1jmOZilfMO+T9mNg8agG
 zQB35+kOgxuZSJIW5fBDt6gNzY4xoDKiMyjZ4SR2OcO48YPaRyQuo+4NOa0JuGxf4ByP33S
 87Ffy6NqAAkwzaLxnyvcjiXeV24zJw0okWxCDA5LvwmUighBYbO8QLePggiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1786884766; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=d0KY6ujsVdhJpdGQ0TGxZp2xPfufyCTAKNlLxKb3PUM=;
 b=X8cnkyvhAZhYJw2fgysJHM6Lavpg1/C992o1eTeXqOqXJleBnkIHx5i0aYmlxrNgadgP7
 WxKw2i5MXRRFHEiWZvWbfqe1+iN++0uIsmzbsfFhjVCNalMNPVUMcXTBpPnvkWCHxunrsaD
 5fMqWCAoqfVdQBq175N+hKpFMDgnu2YxDB6z/9j+145gg9n713qdRQphWFjrmJgDgFvtcst
 Do2uBwWkSlbSpFY7yO2OClzcWN+hh6HZtbwv76Z+RCEqlBojG8jnvaj73kCM5/mVGS/5ACJ
 Y4Yf3QVrBPzIjCR/mPAEcWnUAiKUFP5IHfwbFw+bvuV3yatPsiZMYE13PB/Q==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 265D446D2B
	for <nouveau@lists.freedesktop.org>; Sun, 16 Aug 2026 12:52:44 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4121710E2D2
	for <nouveau@lists.freedesktop.org>; Sun, 16 Aug 2026 13:09:10 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4955c545a94so3069435e9.3
        for <nouveau@lists.freedesktop.org>;
 Sun, 16 Aug 2026 06:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786885749; x=1787490549;
 darn=lists.freedesktop.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=d0KY6ujsVdhJpdGQ0TGxZp2xPfufyCTAKNlLxKb3PUM=;
        b=DzwTql79wX98vN6c6tB5PuAZjpplBNW2cHQZwuX8zGzLO9prjmzxWbXG+7QrkmX6+A
         MGNNrmshwHopXSXWB0vTwC9dRI5/pXOM2R2R5bnrLEdRXpW7+stWgUf1jLNUhNin0CJz
         wUDORiklB8M9ITnC/OkCpEiC7IzF+Pv6ARAZaaPuzKUXhP3jRZXNl1i0lfTdg2dH282t
         lij25L9I3nj5x8ylu2kTNRoHzU22Y1eNdfMIsFBqm3+Jw6b3XQb9XpOuXFlZ4eDWNB1q
         UIoqRwUI3/kbJ7ZIVzVjqKMzWAAuhl7peq9KOxhs2ZbpVMijIdxPvlD83qArrk+uo17d
         FD/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786885749; x=1787490549;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d0KY6ujsVdhJpdGQ0TGxZp2xPfufyCTAKNlLxKb3PUM=;
        b=UyOYAim7l2rIBP4Aq036q2becHmE6ZdWQ71Zg77l3UaJIgdyd4ld55eXZMiUFXoRzv
         sIinJAxVBsgIsXZn3NJZIEGdoCf1Ev+rF1JgeJQmwR/ay3wT2HylX5D82XLmpIXpeujP
         GDUplLokLQhONCmuY/yDly9RVrG14MD7qrRRGgAXHbKWYdhAEY7ER032aTTQ9b+LMVmP
         DvC65C5vNh3vMQj8+r8K8+WHzjvCau0y03JzR4tiM4+5H/rot9c6N76Q8AFV162BloDI
         tqpIrvRqUoyj2if05fXRtc8ysgG0WQ06kx+XuMrCUcPd9EzI/B4d6/R3ezEaojw18GS5
         sl6A==
X-Gm-Message-State: AOJu0YyOjqeJicRjbT/CtxT2Df44N6nMzOySNLqgmefA1GYeZjL3bC+W
	FC5qnsBCIki+S/3hRELRXjszZU6AMaPTsRLYdwzFTwz+I2e43maMqOmofjRB+2Kp
X-Gm-Gg: AR+sD126esKivvb1ZK6HO0aexgrhsP1j7xFuRxvN+11GruEWAHhi6aO9X4tE89c9nm9
	hG7Gzr1Q5I2ZTwNMzZ/gzyPkGtUEIrPnphGnTzEcK2v5uLV/M9CUXFeTZDtakrEYFUSE2ZOG/qg
	vpWDyp6IEpDEFAbjbk/qqrCIzVUMJCk+ilEeb5a144mjmuDKzPCbQ+IMC0ZibMRVuifDEGELBGJ
	ETVrbrItbB4qskPlqt/OunOLFWPh6M0ZOSuOwg991Dgeo17hEK87jLAe7Zbyx8oP4cszBYt5Crk
	rayqjsCh2nfw4Bmj035PmerSktOcWW5Ui/JvkkSUu/CNQ4MSRqoIECPZmEZruGX9VgEbUvEq2f6
	hxnhHkTW+jd1s4K2WYhv4vrWsREJILIPGoGxC+5s5YYRMS/QzyO3IgKTfXCdVcmZb/rTPvkkNLs
	jUQyDo4Tu0T/oGXSBX9glMfQYqPV+2zNSJpFSdnZ3c2MB2MdcAVgGTbZymVToqqWr7P5TZ0Xr2S
	QLlpGgNHQdVerkD8/5QyVv6dC50XJCs1DiiXHgK2A==
X-Received: by 2002:a05:600c:8b57:b0:499:8411:9e8d with SMTP id
 5b1f17b1804b1-499878cb099mr138184085e9.0.1786885748398;
        Sun, 16 Aug 2026 06:09:08 -0700 (PDT)
Received: from [127.0.0.1] (ip-109-193-028-127.um39.pools.vodafone-ip.de.
 [109.193.28.127])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49996105c0bsm66548375e9.4.2026.08.16.06.09.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 06:09:07 -0700 (PDT)
From: Marek Czernohous <mczernohous@gmail.com>
To: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH v4 1/2] drm/nouveau/pci: use config-space MSI rearm on
 MCP79/MCP7A (NVAC)
Date: Sun, 16 Aug 2026 15:09:04 +0200
Message-ID: <178688574401.522643.12812428444459119913@gmail.com>
X-Mailer: python-smtplib
In-Reply-To: <178688574400.522643.6695278742335367229@gmail.com>
References: <178688574400.522643.6695278742335367229@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Message-ID-Hash: IZ6TOXT67RW3N5KUFB2YFJAKJLQ4EMD6
X-Message-ID-Hash: IZ6TOXT67RW3N5KUFB2YFJAKJLQ4EMD6
X-MailFrom: mczernohous@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>,
 Simona Vetter <simona@ffwll.ch>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/IZ6TOXT67RW3N5KUFB2YFJAKJLQ4EMD6/>
Archived-At: 
 <https://lore.freedesktop.org/178688574401.522643.12812428444459119913@gmail.com/>
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
 .../gpu/drm/nouveau/include/nvkm/subdev/pci.h |  1 +
 .../gpu/drm/nouveau/nvkm/engine/device/base.c |  2 +-
 .../gpu/drm/nouveau/nvkm/subdev/pci/Kbuild    |  1 +
 .../gpu/drm/nouveau/nvkm/subdev/pci/mcp79.c   | 35 +++++++++++++++++++
 4 files changed, 38 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/pci/mcp79.c

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/pci.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/pci.h
index 112b674ed9c8..0172e0d200f8 100644
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
index ea62dc97f118..f7e02a16e5bc 100644
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
index a14ea0f7b1c8..90f03baeb22a 100644
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
index 000000000000..e2ae242f1aa7
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
2.54.0

