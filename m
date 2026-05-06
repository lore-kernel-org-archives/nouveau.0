Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C666CD3440
	for <nouveau@archiver.kernel.org>; Wed,  6 May 2026 13:42:47 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 545EE10EDC9;
	Wed,  6 May 2026 13:42:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="u4raWXQI";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 55FD945DEB;
	Wed,  6 May 2026 13:30:07 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1778074207;
 b=jwZjQUc5mkmn12oauJeQ07zSFMlE45am611etT0lR2WZNPJkJ45MahGR2F2viLPy6Ces2
 pLBYpJCyGlZ0Gbf1fctVKEW1LVctzTeDw+/la+uNWVvVctevb5PL75P4DwiasfIqd9Ey9EK
 2zFoQ53P7edeS3AeqsPHmno3sLt4zMYiwTY3auMOCFl3Awx3U355He6vaUUKvSQJyX5wjsS
 503hBDTN1XNzSS8NE0GhaSuKPkicIsNC7lxo6IRV5GBY6zLyWHgdCdpnlyca7ms20MOsMMI
 +yunP+eVZWAdWYh3mjYwR9qmlp3J3dcDg6ZXHO7jpYS4+tSNrGSxmpJnsS6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1778074207; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=qFR8OX9ixQcJ2kkyC+9HsmCv0uQ+zgLnDiZBnfPjtx8=;
 b=OKEc3rzkFovGkoepDo/0CWEHZ3nwat/Z4TTK44tAliAshe3eSoNCorqmDz84VYo//wDOk
 Yzofela9Iefc9ukZMTqyFcTcO3oEmsgHqpwNH2lz4EBvnvHfW56S74PhJ9Q1oySIxlreYac
 7mK9ljdJ2uhE8Jgx74T+tk7zJb4KehhwrRR/HzZVYQ1o5sm70qqsKQis7BZL6HK9Pvp+vS/
 JabqUkEcXUFgEI4or8amCjIMUty/6cyvxpVKVvlx9Qd0ag69kMaA0daql0PIqcPPyv8NXXG
 O3oVAs/I0Ilp+ceVbYS+aJk1kBCjdnzBgR67O7Cn/LXTZRbkRgJKCwb37Blw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 478FA459AA
	for <nouveau@lists.freedesktop.org>; Wed,  6 May 2026 13:30:05 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 29C5210EDC9;
	Wed,  6 May 2026 13:42:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1256543863;
	Wed,  6 May 2026 13:42:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6A44C2BCF4;
	Wed,  6 May 2026 13:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778074964;
	bh=dhMIYzn0naroh7wEiEyD8mkr0lrPyoEZWpMhxfeiflg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=u4raWXQI2Wdg2bSaXn1HETF5GEiFQ72ibwRAa47bfqpVI5SWMD22kH7/5OHnxWAuA
	 1nkPxWf2dUD6NBJrnsoj5jr2nmWTyQA5D4J1WGXVYy03x3+80bBhsvg4qklXeIIfFL
	 lQ37+dZSZSLw+NvBFwKbyRufAjNV7Fv4SY06xl9H2YOnZPBomHdcPMDEd1lYXRpuCj
	 zqrf9woH9IGS6n3JI8+N9SmSpfBfLQJwdaZHD0AwqFezKLnqFo5J3wa2c3Y2IF9nN0
	 BeSgqxoIq/OsSo1iBpgfRUd61q0JkOZWtXUorD1+XhaQW0Q+QAapdQg3L7D+QySIMX
	 N9rvPBR1683CQ==
From: Thierry Reding <thierry.reding@kernel.org>
Date: Wed, 06 May 2026 15:41:59 +0200
Subject: [PATCH 8/9] soc/tegra: pmc: Remove unused legacy functions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260506-pmc-v1-8-a6de5da7216b@nvidia.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6033; i=treding@nvidia.com;
 h=from:subject:message-id; bh=dxlHQ75ERZaZquoLYGMUADgl07hpLeMdSph/VRfteA4=;
 b=owEBbQKS/ZANAwAKAd0jrNd/PrOhAcsmYgBp+0UwuL+I1tfaN0jTu1yVVepluyb/zMAaRVo8U
 1kKyKV8KLKJAjMEAAEKAB0WIQSI6sMIAUnM98CNyJ/dI6zXfz6zoQUCaftFMAAKCRDdI6zXfz6z
 oWAfEACW9hIvJoBpm7XmtiXmDNPsqhddpmCXDTVkthnNVLlro96hP5Dv2CUNMRM8pGdOeH3dsVQ
 a5gNS6b6IH6+37XFlyJZ4zzfwUGP/uUt/KFi4npTpNj1I6n2TIjaqQRrrPUvETmr3r1s4EjerZu
 /CRCiQBfKAz7cUL/uefUs6gpvhYNSFOeh1a4v5hfk6NHT95PfuF8VSN4MiHrdSckuM5OaMkcIfT
 u7sX/Y3KelzOdwiOXvnTyf0GPKLm7jdMk91HBp2yRJcTOmDVVQ3XeF82n4QObPwLfXwKOFktinm
 wtJSIWqlDX41pnlaSl7dZFHFbXXSBfQXty9ThTbf/hFbeDn4NvSTDTEKt/x/g1egVMFIR5JMhNN
 58uO/Eada7kc4dTr9Mu8M44pRimV6u/fhm17Sq6IGe9KwEer/UUzHPtlHt3gI5WnnomTx6EwqyN
 1XkFTVwtIVpytMnRpxkmWN6+Egflui44aLVnJNBg+Ldt2Oiux6hEmJQdvZyXBUq6rH9/xpBKQbt
 UbYABWRui3RMG5NgXP2lUNNh8r9hSnEovvU+PxWgK1nolDjr3ZAqXMCVz0tSrKV6bJpu+jD5Ryt
 +D0Ylz+OFFthcaFZD0bdvmLftdoqwWDTAzUl1O/ANMam/Hth1tc0M8VThOMJojdQYbOylxM9JMO
 MiFRUXJb9h0ke1w==
X-Developer-Key: i=treding@nvidia.com; a=openpgp;
 fpr=88EAC3080149CCF7C08DC89FDD23ACD77F3EB3A1
Message-ID-Hash: AAUCPZ4GHFH6DOSUGV3B4Z5A732P74FB
X-Message-ID-Hash: AAUCPZ4GHFH6DOSUGV3B4Z5A732P74FB
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/AAUCPZ4GHFH6DOSUGV3B4Z5A732P74FB/>
Archived-At: 
 <https://lore.freedesktop.org/20260506-pmc-v1-8-a6de5da7216b@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

From: Thierry Reding <treding@nvidia.com>

All callers of these functions have been replaced by their variants
taking a PMC context as an input, so they are no longer used and can be
removed.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/soc/tegra/pmc.c | 69 -------------------------------------------------
 include/soc/tegra/pmc.h | 47 ---------------------------------
 2 files changed, 116 deletions(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 50969b07fd8c..f25c8e73475c 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -1063,16 +1063,6 @@ int tegra_pmc_powergate_power_on(struct tegra_pmc *pmc, unsigned int id)
 }
 EXPORT_SYMBOL(tegra_pmc_powergate_power_on);
 
-/**
- * tegra_powergate_power_on() - power on partition
- * @id: partition ID
- */
-int tegra_powergate_power_on(unsigned int id)
-{
-	return tegra_pmc_powergate_power_on(early_pmc, id);
-}
-EXPORT_SYMBOL(tegra_powergate_power_on);
-
 /**
  * tegra_pmc_powergate_power_off() - power off partition
  * @pmc: power management controller
@@ -1087,16 +1077,6 @@ int tegra_pmc_powergate_power_off(struct tegra_pmc *pmc, unsigned int id)
 }
 EXPORT_SYMBOL(tegra_pmc_powergate_power_off);
 
-/**
- * tegra_powergate_power_off() - power off partition
- * @id: partition ID
- */
-int tegra_powergate_power_off(unsigned int id)
-{
-	return tegra_pmc_powergate_power_off(early_pmc, id);
-}
-EXPORT_SYMBOL(tegra_powergate_power_off);
-
 /**
  * tegra_powergate_is_powered() - check if partition is powered
  * @pmc: power management controller
@@ -1124,16 +1104,6 @@ int tegra_pmc_powergate_remove_clamping(struct tegra_pmc *pmc, unsigned int id)
 }
 EXPORT_SYMBOL(tegra_pmc_powergate_remove_clamping);
 
-/**
- * tegra_powergate_remove_clamping() - remove power clamps for partition
- * @id: partition ID
- */
-int tegra_powergate_remove_clamping(unsigned int id)
-{
-	return tegra_pmc_powergate_remove_clamping(early_pmc, id);
-}
-EXPORT_SYMBOL(tegra_powergate_remove_clamping);
-
 /**
  * tegra_pmc_powergate_sequence_power_up() - power up partition
  * @pmc: power management controller
@@ -1181,21 +1151,6 @@ int tegra_pmc_powergate_sequence_power_up(struct tegra_pmc *pmc,
 }
 EXPORT_SYMBOL(tegra_pmc_powergate_sequence_power_up);
 
-/**
- * tegra_powergate_sequence_power_up() - power up partition
- * @id: partition ID
- * @clk: clock for partition
- * @rst: reset for partition
- *
- * Must be called with clk disabled, and returns with clk enabled.
- */
-int tegra_powergate_sequence_power_up(unsigned int id, struct clk *clk,
-				      struct reset_control *rst)
-{
-	return tegra_pmc_powergate_sequence_power_up(early_pmc, id, clk, rst);
-}
-EXPORT_SYMBOL(tegra_powergate_sequence_power_up);
-
 /**
  * tegra_get_cpu_powergate_id() - convert from CPU ID to partition ID
  * @pmc: power management controller
@@ -1823,18 +1778,6 @@ int tegra_pmc_io_pad_power_enable(struct tegra_pmc *pmc, enum tegra_io_pad id)
 }
 EXPORT_SYMBOL(tegra_pmc_io_pad_power_enable);
 
-/**
- * tegra_io_pad_power_enable() - enable power to I/O pad
- * @id: Tegra I/O pad ID for which to enable power
- *
- * Returns: 0 on success or a negative error code on failure.
- */
-int tegra_io_pad_power_enable(enum tegra_io_pad id)
-{
-	return tegra_pmc_io_pad_power_enable(early_pmc, id);
-}
-EXPORT_SYMBOL(tegra_io_pad_power_enable);
-
 /**
  * tegra_pmc_io_pad_power_disable() - disable power to I/O pad
  * @pmc: power management controller
@@ -1879,18 +1822,6 @@ int tegra_pmc_io_pad_power_disable(struct tegra_pmc *pmc, enum tegra_io_pad id)
 }
 EXPORT_SYMBOL(tegra_pmc_io_pad_power_disable);
 
-/**
- * tegra_io_pad_power_disable() - disable power to I/O pad
- * @id: Tegra I/O pad ID for which to disable power
- *
- * Returns: 0 on success or a negative error code on failure.
- */
-int tegra_io_pad_power_disable(enum tegra_io_pad id)
-{
-	return tegra_pmc_io_pad_power_disable(early_pmc, id);
-}
-EXPORT_SYMBOL(tegra_io_pad_power_disable);
-
 static int tegra_io_pad_is_powered(struct tegra_pmc *pmc, enum tegra_io_pad id)
 {
 	const struct tegra_io_pad_soc *pad;
diff --git a/include/soc/tegra/pmc.h b/include/soc/tegra/pmc.h
index 1fd21be02577..8b4bcdea849e 100644
--- a/include/soc/tegra/pmc.h
+++ b/include/soc/tegra/pmc.h
@@ -164,16 +164,6 @@ int tegra_pmc_io_pad_power_enable(struct tegra_pmc *pmc, enum tegra_io_pad id);
 int tegra_pmc_io_pad_power_disable(struct tegra_pmc *pmc, enum tegra_io_pad id);
 
 /* legacy */
-int tegra_powergate_power_on(unsigned int id);
-int tegra_powergate_power_off(unsigned int id);
-int tegra_powergate_remove_clamping(unsigned int id);
-
-int tegra_powergate_sequence_power_up(unsigned int id, struct clk *clk,
-				      struct reset_control *rst);
-
-int tegra_io_pad_power_enable(enum tegra_io_pad id);
-int tegra_io_pad_power_disable(enum tegra_io_pad id);
-
 void tegra_pmc_set_suspend_mode(enum tegra_suspend_mode mode);
 void tegra_pmc_enter_suspend_mode(enum tegra_suspend_mode mode);
 
@@ -224,43 +214,6 @@ tegra_pmc_io_pad_power_disable(struct tegra_pmc *pmc, enum tegra_io_pad id)
 	return -ENOSYS;
 }
 
-static inline int tegra_powergate_power_on(unsigned int id)
-{
-	return -ENOSYS;
-}
-
-static inline int tegra_powergate_power_off(unsigned int id)
-{
-	return -ENOSYS;
-}
-
-static inline int tegra_powergate_remove_clamping(unsigned int id)
-{
-	return -ENOSYS;
-}
-
-static inline int tegra_powergate_sequence_power_up(unsigned int id,
-						    struct clk *clk,
-						    struct reset_control *rst)
-{
-	return -ENOSYS;
-}
-
-static inline int tegra_io_pad_power_enable(enum tegra_io_pad id)
-{
-	return -ENOSYS;
-}
-
-static inline int tegra_io_pad_power_disable(enum tegra_io_pad id)
-{
-	return -ENOSYS;
-}
-
-static inline int tegra_io_pad_get_voltage(enum tegra_io_pad id)
-{
-	return -ENOSYS;
-}
-
 static inline void tegra_pmc_set_suspend_mode(enum tegra_suspend_mode mode)
 {
 }

-- 
2.52.0

