Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF99BCD343B
	for <nouveau@archiver.kernel.org>; Wed,  6 May 2026 13:42:26 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A731910EDBE;
	Wed,  6 May 2026 13:42:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="EPCcSvNc";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id A6DBA45DDB;
	Wed,  6 May 2026 13:29:46 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1778074186;
 b=UQLdPiV7mnIAT20QFPlrnkVN76Vj1izZacj5kROE8GcTc6zj7kifMS51dFI68te9B86bZ
 cmfjgCtHqmH1W6HUcugvNGwaCXkNPIJUNocFKWg5Txw4rjpSSJt2eGegX/yhg+itOy7yYiz
 bJC4W5qKz0CAE+eYN17nU18334qAxcGc0v7dp0UhpEdoiNGsysgXlTXXl/zKorOdDPqoh76
 GjaK2f1sRWa5QD138AdcRjQah+At/HaaVDCTmF/yoKedP/L0IUpPC38tLiED3jOAsIwgSGe
 wtJHJ4r+I7J1XVHZh8SsCLWfMfuzzAfAEBxrtsj3s/lUmdTEFzAEOQoQxk1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1778074186; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=k6ucIVevPDvmAAkILIDG31ggGkah7SvuAQtBwXQi/cc=;
 b=yjnaU8QJviYKQ2XjvnNzOs1qtYl1sHpdmynOF77CtmZktgM4xRptaUNN6LDaR4n20qn5e
 MUDqlBVnNzSk09OKcGq0EVgJ6PILltJbMTdRTOm59RDaMDev2ObI4BqhNg8eKuDoDJT1TV2
 ZU+7QEWRrmmdrFkOz8pAge9UlIvi0wn0nhF28SfdSHRfgNXW70KhE88suhMD3gzBN7tINJt
 4woBY03UNvMDpq6HE4WrblWnZHFqOKcl8QclzaNGt7pM+w2J80u5M7OTM99aIj0WD1noGET
 6AjzvplCyrLgvMMcGG9p3GrjnNo2iw+8EU/wuMr72eQ696bOdiTfKT3+FCxQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id EC2D6459AA
	for <nouveau@lists.freedesktop.org>; Wed,  6 May 2026 13:29:44 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B647710EDB0;
	Wed,  6 May 2026 13:42:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3BA2760582;
	Wed,  6 May 2026 13:42:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1656CC2BCB8;
	Wed,  6 May 2026 13:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778074943;
	bh=mRUAjElokfCLlryiKurN6OdVdNDlBl90aqBT3kdVSS4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=EPCcSvNcsYfqQk9979aGLZYLlIOppQetN8bvItpeWP8qAWXWM82kXR6gCR6ZqvsIp
	 dZ0+N8zpe+yWMCo30T45XpwsKvY70EfV4HH082bD3XKo65HtjAcDKjAU23WR9l/eAn
	 E0APksuOOH1vBvMxG5Wm3OPmHo64b0fKhi60zq4tyfrgKHkCxEVPaBCASlhsLIj1k4
	 W68UHr2b9cmTneI+IWWUr2xq9AtO6pcGkL2iUS42jpMkH238iU8atkLse3QUUmdLsA
	 WGut+oyXmSQabwJ+hUse3Y46XTYaQw28YmFBurHaCXCbo0vcKyFKUnSwgzd+KmoztS
	 f9X1dDsBOOshQ==
From: Thierry Reding <thierry.reding@kernel.org>
Date: Wed, 06 May 2026 15:41:54 +0200
Subject: [PATCH 3/9] drm/tegra: Explicitly specify PMC instance to use
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260506-pmc-v1-3-a6de5da7216b@nvidia.com>
References: <20260506-pmc-v1-0-a6de5da7216b@nvidia.com>
In-Reply-To: <20260506-pmc-v1-0-a6de5da7216b@nvidia.com>
To: Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>,
 Thierry Reding <thierry.reding@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Mikko Perttunen <mperttunen@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=5673; i=treding@nvidia.com;
 h=from:subject:message-id; bh=w3MJGfdYzraD5ekl0lHsYILyyuiEKQeRdpE6UsHEGqA=;
 b=owEBbQKS/ZANAwAKAd0jrNd/PrOhAcsmYgBp+0Uwbyd9AZVUF95uI3Go833QdOFS/rz66XeOE
 7R7HeNM2eeJAjMEAAEKAB0WIQSI6sMIAUnM98CNyJ/dI6zXfz6zoQUCaftFMAAKCRDdI6zXfz6z
 ocofEACdb1o4wiNkcg34ScLCNPddLTxCrmhpadYSQ6RYiQR2+QaC1DXB9vQ6M8QUdM5MCoDuJML
 l6b/yD0uVRnCD724taIKpUelAilWbLndaxUyEuIS475dFGCB7tq2P4IE1yhI5jZ80bibbLKN3bN
 LMBwQimqSWo7XF4rrpE0zG83miTNWWlhSyK0MRSzn3PksNk3jp7vICWSfGHzsD3pcdAW+bUz5G7
 XSKscwbYeP+gJz+x5Sb/xM712bL3u7VXs0F0zhWgK3k2Reqxyx5WiltXi6jkIQ2tWyzyeLbW89d
 b/R11gZ51a6IpDAjkwrDY6C4GGTILswECVsSPhpkTzMnz/U8d7YJM3FrhNGJMTT17ivt6HMKgVz
 16bPKMIeptePSKaCO3cxAV+hJoZp3m7Ntvwy9FIwcRDa/Hgu5sI3GBJboDxO7gH0OEaTygEFL09
 WZkRHtTohi4pKYOqdIxZndtouYv4AMgZHrLRwuWjFT+Cd9KYGxrhVT/DbZ5HMFBtctBdjSjKEwZ
 uA5Z1zChC3vY3/CCa4sO/BEtvuBVTFGMqPLWdCE41LgxU6f4WDNvaf888ojDfkerEXiLOguOhnI
 L7hpRSaUkspobfo0X1+SCTNqXs/GrmNTxwPerhk09fja1nUZbdTXbAE3LeC1DPNVA6LgS+l/28W
 tQFUeWYd3UDXhnQ==
X-Developer-Key: i=treding@nvidia.com; a=openpgp;
 fpr=88EAC3080149CCF7C08DC89FDD23ACD77F3EB3A1
Message-ID-Hash: QTMZULVBM4Q5PM2KRIAXPGMAIXBXNIBX
X-Message-ID-Hash: QTMZULVBM4Q5PM2KRIAXPGMAIXBXNIBX
X-MailFrom: thierry.reding@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: linux-ide@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-media@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-usb@vger.kernel.org,
 Thierry Reding <treding@nvidia.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/QTMZULVBM4Q5PM2KRIAXPGMAIXBXNIBX/>
Archived-At: 
 <https://lore.freedesktop.org/20260506-pmc-v1-3-a6de5da7216b@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

From: Thierry Reding <treding@nvidia.com>

Currently the kernel relies on a global variable to reference the PMC
context. Use an explicit lookup for the PMC and pass that to the public
PMC APIs.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/dc.c   | 14 ++++++++++----
 drivers/gpu/drm/tegra/dc.h   |  1 +
 drivers/gpu/drm/tegra/gr3d.c |  9 ++++++++-
 drivers/gpu/drm/tegra/sor.c  | 16 ++++++++++++----
 4 files changed, 31 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 06370b7e0e56..e6099f5aced7 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -2780,7 +2780,7 @@ static int tegra_dc_runtime_suspend(struct host1x_client *client)
 	}
 
 	if (dc->soc->has_powergate)
-		tegra_powergate_power_off(dc->powergate);
+		tegra_pmc_powergate_power_off(dc->pmc, dc->powergate);
 
 	clk_disable_unprepare(dc->clk);
 	pm_runtime_put_sync(dev);
@@ -2801,8 +2801,9 @@ static int tegra_dc_runtime_resume(struct host1x_client *client)
 	}
 
 	if (dc->soc->has_powergate) {
-		err = tegra_powergate_sequence_power_up(dc->powergate, dc->clk,
-							dc->rst);
+		err = tegra_pmc_powergate_sequence_power_up(dc->pmc,
+							    dc->powergate,
+							    dc->clk, dc->rst);
 		if (err < 0) {
 			dev_err(dev, "failed to power partition: %d\n", err);
 			goto put_rpm;
@@ -3231,12 +3232,17 @@ static int tegra_dc_probe(struct platform_device *pdev)
 	clk_disable_unprepare(dc->clk);
 
 	if (dc->soc->has_powergate) {
+		dc->pmc = devm_tegra_pmc_get(dc->dev);
+		if (IS_ERR(dc->pmc))
+			return dev_err_probe(dc->dev, PTR_ERR(dc->pmc),
+					     "failed to get PMC\n");
+
 		if (dc->pipe == 0)
 			dc->powergate = TEGRA_POWERGATE_DIS;
 		else
 			dc->powergate = TEGRA_POWERGATE_DISB;
 
-		tegra_powergate_power_off(dc->powergate);
+		tegra_pmc_powergate_power_off(dc->pmc, dc->powergate);
 	}
 
 	err = tegra_dc_init_opp_table(dc);
diff --git a/drivers/gpu/drm/tegra/dc.h b/drivers/gpu/drm/tegra/dc.h
index 0559fa6b1bf7..10b86250e4ca 100644
--- a/drivers/gpu/drm/tegra/dc.h
+++ b/drivers/gpu/drm/tegra/dc.h
@@ -94,6 +94,7 @@ struct tegra_dc {
 	int irq;
 
 	struct tegra_output *rgb;
+	struct tegra_pmc *pmc;
 
 	struct tegra_dc_stats stats;
 	struct list_head list;
diff --git a/drivers/gpu/drm/tegra/gr3d.c b/drivers/gpu/drm/tegra/gr3d.c
index 42e9656ab80c..debf66fa4eeb 100644
--- a/drivers/gpu/drm/tegra/gr3d.c
+++ b/drivers/gpu/drm/tegra/gr3d.c
@@ -46,6 +46,7 @@ struct gr3d {
 	unsigned int nclocks;
 	struct reset_control_bulk_data resets[RST_GR3D_MAX];
 	unsigned int nresets;
+	struct tegra_pmc *pmc;
 	struct dev_pm_domain_list *pd_list;
 
 	DECLARE_BITMAP(addr_regs, GR3D_NUM_REGS);
@@ -353,7 +354,8 @@ static int gr3d_power_up_legacy_domain(struct device *dev, const char *name,
 	if (err) {
 		dev_err(dev, "failed to acquire %s reset: %d\n", name, err);
 	} else {
-		err = tegra_powergate_sequence_power_up(id, clk, reset);
+		err = tegra_pmc_powergate_sequence_power_up(gr3d->pmc, id,
+							    clk, reset);
 		reset_control_release(reset);
 	}
 
@@ -385,6 +387,11 @@ static int gr3d_init_power(struct device *dev, struct gr3d *gr3d)
 		if (err != -ENOENT)
 			return err;
 
+		gr3d->pmc = devm_tegra_pmc_get(dev);
+		if (IS_ERR(gr3d->pmc))
+			return dev_err_probe(dev, PTR_ERR(gr3d->pmc),
+					     "failed to get PMC\n");
+
 		/*
 		 * Older device-trees don't use GENPD. In this case we should
 		 * toggle power domain manually.
diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index de8b2dfc4984..a76095838133 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -422,6 +422,8 @@ struct tegra_sor {
 	struct clk *clk_dp;
 	struct clk *clk;
 
+	struct tegra_pmc *pmc;
+
 	u8 xbar_cfg[5];
 
 	struct drm_dp_link link;
@@ -2237,7 +2239,7 @@ static void tegra_sor_hdmi_disable(struct drm_encoder *encoder)
 	if (err < 0)
 		dev_err(sor->dev, "failed to power down SOR: %d\n", err);
 
-	err = tegra_io_pad_power_disable(sor->pad);
+	err = tegra_pmc_io_pad_power_disable(sor->pmc, sor->pad);
 	if (err < 0)
 		dev_err(sor->dev, "failed to power off I/O pad: %d\n", err);
 
@@ -2277,7 +2279,7 @@ static void tegra_sor_hdmi_enable(struct drm_encoder *encoder)
 
 	div = clk_get_rate(sor->clk) / 1000000 * 4;
 
-	err = tegra_io_pad_power_enable(sor->pad);
+	err = tegra_pmc_io_pad_power_enable(sor->pmc, sor->pad);
 	if (err < 0)
 		dev_err(sor->dev, "failed to power on I/O pad: %d\n", err);
 
@@ -2701,7 +2703,7 @@ static void tegra_sor_dp_disable(struct drm_encoder *encoder)
 	if (err < 0)
 		dev_err(sor->dev, "failed to power down SOR: %d\n", err);
 
-	err = tegra_io_pad_power_disable(sor->pad);
+	err = tegra_pmc_io_pad_power_disable(sor->pmc, sor->pad);
 	if (err < 0)
 		dev_err(sor->dev, "failed to power off I/O pad: %d\n", err);
 
@@ -2743,7 +2745,7 @@ static void tegra_sor_dp_enable(struct drm_encoder *encoder)
 	if (err < 0)
 		dev_err(sor->dev, "failed to set safe parent clock: %d\n", err);
 
-	err = tegra_io_pad_power_enable(sor->pad);
+	err = tegra_pmc_io_pad_power_enable(sor->pmc, sor->pad);
 	if (err < 0)
 		dev_err(sor->dev, "failed to power on LVDS rail: %d\n", err);
 
@@ -3730,6 +3732,12 @@ static int tegra_sor_probe(struct platform_device *pdev)
 
 	sor->num_settings = sor->soc->num_settings;
 
+	sor->pmc = devm_tegra_pmc_get(&pdev->dev);
+	if (IS_ERR(sor->pmc)) {
+		err = PTR_ERR(sor->pmc);
+		goto put_aux;
+	}
+
 	np = of_parse_phandle(pdev->dev.of_node, "nvidia,dpaux", 0);
 	if (np) {
 		sor->aux = drm_dp_aux_find_by_of_node(np);

-- 
2.52.0

