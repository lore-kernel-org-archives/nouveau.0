Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7967DCC6B0E
	for <nouveau@archiver.kernel.org>; Tue, 13 Oct 2026 14:52:33 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9A88010F893;
	Tue, 13 Oct 2026 14:52:27 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 3A16548A78;
	Tue, 13 Oct 2026 14:33:52 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1791902032;
 b=Twvk1dk7aKiiC8LVDR7eYyIBotBtEBYxWPthIWaf36MkJTfjm9wL4unoU1hqEhm5h6xVj
 9GwMZ5EHMKCbqLmLu43+OeZdWovPwAJmjz9wBNIvWW68w090aKDBr5lFMSduxfI3MhyM9Mo
 HP9lP7OQCLphwfBobne110nrXdW/DbsgnyrxTvQ/wdInsjGQvifXULStC7xnG4gYF26PfnD
 kGdtX+lsMKCi3Au89akPUv46mS6/yKXlI3NMTDnpUaxX4QMv4BECOs4+Fx/13QcfllqyJbJ
 JQPB/XzfMyOz2svoQzN9M8W1JmRkbjYzleq9pY4UpmM3a5ImqiBlY6hNy4vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1791902032; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=kzhwRl3T1k1AdPv6B7bJL6B4cN4Kgv+yi+7DS1nteLA=;
 b=XMmOkcOe20tNfQmcwbX9yu4cPUKPqpnL2ms1u8a7EL4yJZ6ynUe9KuMHU6vYgFNR/TyzP
 ExosbDQBgrcXYPtEFkCssKFNQIXjU4Lpc9syUxfrrMMBETXFXKq2XLKlYubobNmSTQqivvb
 1+6QyM3Bj13K0g7zcx3fJutf8P3IyS8q4z2G+HOumC8b8ifhToFnYdo8uDoldVgQbIAx494
 FR8ETjWwd83QXZDDlcqnGxeqzGG+d56D+UMLzphx9jFs/OZ1KlJdWwyEquZqPha3nB0HI3m
 /WRIJ8hg2S9bnwFF4cPmmappikP1oLblrieVxJb1Se42aVXIob+xvjWCoEXw==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=kernel.org;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=kernel.org;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 4997848A6D
	for <nouveau@lists.freedesktop.org>; Tue, 13 Oct 2026 14:33:48 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0ECCA10E8AB;
	Tue, 13 Oct 2026 14:52:18 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BFB2C438DC;
	Tue, 13 Oct 2026 14:52:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAC6D1F00899;
	Tue, 13 Oct 2026 14:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791903137;
	bh=kzhwRl3T1k1AdPv6B7bJL6B4cN4Kgv+yi+7DS1nteLA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=n1nHBZ0HSExzZ1ujuDc3pCPJMRgU2xATqpvt1ZSQPgAazeG0fwk7zadKRVqHZs9a3
	 86Z9HehjzB9g/CJzIwUA0dZ2uEkc4R47jfK/1bbKfg4zJo7s//p3uMSIS1qOlVlaAz
	 1DyUPJ8WlSqtZv8QXWHqUH4uL4dAlbADX6gwVhHiBTuJyu2T4X0wuaGzsQxP3IZJ6H
	 MzIjh0n+h3QsUGQhptXFNdf0rsKB9pGAZW++N97dl5Ymy0izgovfSEeJGnHU1LCySM
	 dwQYDaV1p0ROUFH0vIvdxd2eKYWwH7Df0gVkkTJ+9AonjUP5n4DNdhqNBBhgBZOdsR
	 LZfZGBVR9YGGQ==
From: Sasha Levin <sashal@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH 3/3] drm/nouveau/tegra: Keep the fuse clock enabled while the
 GPU is powered
Date: Tue, 13 Oct 2026 10:52:10 -0400
Message-ID: <20261013145210.103565-3-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261013145210.103565-1-sashal@kernel.org>
References: <20261013145210.103565-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: TAVYEXV2UGT4VYBT35B5HVRJUEN4VJAG
X-Message-ID-Hash: TAVYEXV2UGT4VYBT35B5HVRJUEN4VJAG
X-MailFrom: sashal@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, Aaron Kling <webgeek1234@gmail.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 Sasha Levin <sashal@kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/TAVYEXV2UGT4VYBT35B5HVRJUEN4VJAG/>
Archived-At: 
 <https://lore.freedesktop.org/20261013145210.103565-3-sashal@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Since the GPU on the Jetson TX1 was enabled in commit d1b725476104
("arm64: tegra: p2180: Explicitly enable GPU"), nouveau often fails to
bring up the GM20B. Either BOOT_0 reads back garbage ("unknown chipset
(5ffefa47)"), or PRI reads of the GPC PLL time out ("MMIO read of
00000000 FAULT at 137000 [ TIMEOUT ]"), or the first register reads in
nvkm_device_ctor() stall until an asynchronous SError. How often depends
on the board; one board fails on every boot.

nouveau powers the GPU up with the fuse clock gated: since commit
24a15252ff04 ("soc/tegra: fuse: Add runtime PM support"), the Tegra fuse
driver only enables that clock around its own fuse reads. NVIDIA's
downstream nvgpu driver enables the fuse clock along with the other GPU
clocks whenever the GPU is powered. Do the same: take an optional "fuse"
clock and keep it enabled from before the GPU rail is turned on until
after it is turned off.

Tested on eight Jetson TX1 devkits, on mainline and on v6.18. Without
this patch, the GPU failed to come up in 27 of 109 boots; with it, in 11
of 291, none of them with a garbage BOOT_0. On the board that failed on
every boot, 38 of 40 boots now succeed. The remaining failures are
mostly a register read that stalls until an SError; wherever the console
shows when, nouveau had already finished probing. Such stalls also occur
without this patch and are a separate problem. The Jetson Nano, which
shares the Tegra210 GPU node, still works (24 of 24 boots).

Fixes: d1b725476104 ("arm64: tegra: p2180: Explicitly enable GPU")
Assisted-by: LLM
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/nouveau/include/nvkm/core/tegra.h  |  1 +
 drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c | 13 +++++++++++++
 2 files changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/core/tegra.h b/drivers/gpu/drm/nouveau/include/nvkm/core/tegra.h
index 6aaa30ef167f..0189043382d0 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/core/tegra.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/core/tegra.h
@@ -15,6 +15,7 @@ struct nvkm_device_tegra {
 	struct clk *clk;
 	struct clk *clk_ref;
 	struct clk *clk_pwr;
+	struct clk *clk_fuse;
 
 	struct regulator *vdd;
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c b/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c
index 3c8d0878891a..31f8eaa9d650 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c
@@ -32,6 +32,10 @@ nvkm_device_tegra_power_up(struct nvkm_device_tegra *tdev)
 {
 	int ret;
 
+	ret = clk_prepare_enable(tdev->clk_fuse);
+	if (ret)
+		return ret;
+
 	if (tdev->vdd) {
 		ret = regulator_enable(tdev->vdd);
 		if (ret)
@@ -76,6 +80,7 @@ nvkm_device_tegra_power_up(struct nvkm_device_tegra *tdev)
 	if (tdev->vdd)
 		regulator_disable(tdev->vdd);
 err_power:
+	clk_disable_unprepare(tdev->clk_fuse);
 	return ret;
 }
 
@@ -95,6 +100,8 @@ nvkm_device_tegra_power_down(struct nvkm_device_tegra *tdev)
 			return ret;
 	}
 
+	clk_disable_unprepare(tdev->clk_fuse);
+
 	return 0;
 }
 
@@ -308,6 +315,12 @@ nvkm_device_tegra_new(const struct nvkm_device_tegra_func *func,
 		goto free;
 	}
 
+	tdev->clk_fuse = devm_clk_get_optional(&pdev->dev, "fuse");
+	if (IS_ERR(tdev->clk_fuse)) {
+		ret = PTR_ERR(tdev->clk_fuse);
+		goto free;
+	}
+
 	tdev->pmc = devm_tegra_pmc_get(&pdev->dev);
 	if (IS_ERR(tdev->pmc)) {
 		ret = PTR_ERR(tdev->pmc);
-- 
2.43.0

