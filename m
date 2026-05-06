Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAD21CD343B
	for <nouveau@archiver.kernel.org>; Wed,  6 May 2026 13:42:23 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6F57810EDB9;
	Wed,  6 May 2026 13:42:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="pm9Rnq6K";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 7012C45DD8;
	Wed,  6 May 2026 13:29:43 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1778074183;
 b=wiE/jLnkZCjoxmoqOSEQS/+eyo1tf8orc4+EwPZbHicai6XMdxszQ7zDJnkfEb1b+xijU
 JlnJFk9grkMt6NjrIoLCnVwaMtzQvIxWP0avrSdYjKQlUdy6Pei9Aaebu0UBmmRyUgbMJtH
 BvZlvRCurU7ELcsGoUGgV9avKdqrfHsZtFfCEoGp6b9W6xHuPDOpzVH7C0m1GNY0UOELDlz
 wveTF8M/olbx+7AinpyxBPXRU3Zs5y+vEoRyrvo7v+Y0dQZZqAl3ADvNrSCUV3ndPASfukI
 aitPG6Gv5ihN4/SAviu7oLtlod1apuCq2phrdWQEi/WG84n6z/2ntWIELz2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1778074183; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=1OJnrko19Fwog+tTjtgzV72i47d2AzG+M/5bCHADNIY=;
 b=IxCW4zXyBY0TCvtnHDZ5HbEZm1zp677SK/0nGUp57xC+w9w8FpylM/f8CaJUAja6AT7QI
 1JunYR8jdPreplGxduNv+Iyd9y8i8rknetSObiTbTnVqROfvsf2qeCJkuInpGq+L9xfCi/i
 y6EtVnK5N98a6bpzlDUPf2/ab/qKWgjvsJZrKZb2nWZaLBG8umgSM8vQiOiag2MHGtBbQSq
 IXwgPC63pztmpA/1+ErtbuveeZ0DbY4UarhDhBTp30Od85ofK8sIamdehlDZvANc47gp06m
 LexIVdR68zTHrYGsllLHvewzCSEdE9knaDYCFf6oncP4uNh4jqJCWdZQovMg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id AD8ED459AA
	for <nouveau@lists.freedesktop.org>; Wed,  6 May 2026 13:29:40 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8B06F10EDB0;
	Wed,  6 May 2026 13:42:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2898843BF3;
	Wed,  6 May 2026 13:42:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29468C2BCB8;
	Wed,  6 May 2026 13:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778074940;
	bh=yAYc840Jzox92Oy7x86kKq1dkgwkDjAdvn1/sg+lx58=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=pm9Rnq6K9gJJMNXIWLrgyFOp68t+rA2iV/LHBaqJKRCAsPQCeM/ZAEWs6vAwLlZGJ
	 d9z+KkaMzo55TamZ/uLbZtAxvhH+EIiCH/F1X//24cn77f+JSN3VYwpzEUKdJUyjqZ
	 hW2neer6M21yjLAD2atOXu7qbVlI7QrlBdwoiWyXYhiH53m1K4CCl4uFSWz+rj+rVb
	 wdIGyT0llWeOZMvuOd3gym3r0l8MxBH1OLwVk3Dx++Yebh4lVvgdn7qP2TqjRkXXJA
	 40mWCdHBvWGbXP71vf3PRqUXO2Zy7PK8Bal4/vfx6aAB3cp2rFwakpoy0tYXhQdBM2
	 OhzjoTpF0J+UA==
From: Thierry Reding <thierry.reding@kernel.org>
Date: Wed, 06 May 2026 15:41:53 +0200
Subject: [PATCH 2/9] drm/nouveau: tegra: Explicitly specify PMC instance to
 use
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260506-pmc-v1-2-a6de5da7216b@nvidia.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1790; i=treding@nvidia.com;
 h=from:subject:message-id; bh=8+nv7sk7Akwz75J9dY7T6KYUmn88Q/uMOZjp/QVHnwE=;
 b=owEBbQKS/ZANAwAKAd0jrNd/PrOhAcsmYgBp+0UwWa1SvQWmP/QpBTIYpH/p5BjW/vNe3PQFW
 PIJtKK0Yc+JAjMEAAEKAB0WIQSI6sMIAUnM98CNyJ/dI6zXfz6zoQUCaftFMAAKCRDdI6zXfz6z
 oT55D/9UlLXiJUGNHvbif1WyheZOPAmCfQiBGs4tT3nSsGD8ADVsjiCwxXPwjZLNPbJHn7cbFVF
 ysSL8Eu8nGtZq8uzRoV48KFaDU2hheMMjC32m/Vwlqq6Mi8HTtbd/pAxKNJcHFebCHCNQSQiVZ9
 Hj7RPGo7EE++sFH78dSJyxFS26Ls+O51QEGh2GT/2M05Jn/N8WPHdGRZ+tvKf9wSmj7yljpcxeq
 hxs7zZgwaTxiMPqux14/8a+wyfC9qKiOWYvrqyYa6QVd7ox5OMLOgHc3eWp9oE7JoWpmuz2RCkv
 h4Z12oUWR2Zb9JGgeaQ9uazJ0gnRmI4qiC6hvI6O/znhvHL44z1ys/MJ23jNaeIREOGj926+qTU
 U+HYS42RwN6q01vAYwbcmp/2b/gCcXxnZBvtBzwvFQaIqb1AI4Qyfs1OBgcQdI+xTeLYbmTWcSg
 mP8/kKzYvqzYROVlX7OloVAR68X4SESXFKM9MA0v+iojV5I9JNsxVdXYW8BoQ1J8sZAA6dOwm3u
 vWFxSpJuLw6Du+t0ET3+7dhymYxHiw7SbgfU+Bev3DIvyNfwTNXykX02Vrh2wqblBVnIeMKbnVt
 kK7TY61hKlczNad2u16XUyDACkaE64sjKVfPoc0d6TDZEL+BaGgM2SBtoMNSrtEsGc2aNeSxahD
 TaS1nZNuBTY0KJQ==
X-Developer-Key: i=treding@nvidia.com; a=openpgp;
 fpr=88EAC3080149CCF7C08DC89FDD23ACD77F3EB3A1
Message-ID-Hash: M5HFQQVCS2YMDHHLAJC2LAEOEN4SY42V
X-Message-ID-Hash: M5HFQQVCS2YMDHHLAJC2LAEOEN4SY42V
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/M5HFQQVCS2YMDHHLAJC2LAEOEN4SY42V/>
Archived-At: 
 <https://lore.freedesktop.org/20260506-pmc-v1-2-a6de5da7216b@nvidia.com/>
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
 drivers/gpu/drm/nouveau/include/nvkm/core/tegra.h  | 2 ++
 drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c | 9 ++++++++-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/core/tegra.h b/drivers/gpu/drm/nouveau/include/nvkm/core/tegra.h
index 57bc542780bb..6aaa30ef167f 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/core/tegra.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/core/tegra.h
@@ -18,6 +18,8 @@ struct nvkm_device_tegra {
 
 	struct regulator *vdd;
 
+	struct tegra_pmc *pmc;
+
 	struct {
 		/*
 		 * Protects accesses to mm from subsystems
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c b/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c
index 46bb55a1f565..3c8d0878891a 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c
@@ -54,7 +54,8 @@ nvkm_device_tegra_power_up(struct nvkm_device_tegra *tdev)
 		reset_control_assert(tdev->rst);
 		udelay(10);
 
-		ret = tegra_powergate_remove_clamping(TEGRA_POWERGATE_3D);
+		ret = tegra_pmc_powergate_remove_clamping(tdev->pmc,
+							  TEGRA_POWERGATE_3D);
 		if (ret)
 			goto err_clamp;
 		udelay(10);
@@ -307,6 +308,12 @@ nvkm_device_tegra_new(const struct nvkm_device_tegra_func *func,
 		goto free;
 	}
 
+	tdev->pmc = devm_tegra_pmc_get(&pdev->dev);
+	if (IS_ERR(tdev->pmc)) {
+		ret = PTR_ERR(tdev->pmc);
+		goto free;
+	}
+
 	/**
 	 * The IOMMU bit defines the upper limit of the GPU-addressable space.
 	 */

-- 
2.52.0

