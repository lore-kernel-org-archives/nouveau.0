Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D421DCD343B
	for <nouveau@archiver.kernel.org>; Wed,  6 May 2026 13:42:38 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B12F610EDB9;
	Wed,  6 May 2026 13:42:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="q8VZAc1j";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id B2E5945DE5;
	Wed,  6 May 2026 13:29:58 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1778074198;
 b=uDWOETcRYtJPES2Ndd9FIqqUi7+bxyvBj2fXwRUVtC3/oOieAqVnm2cYr5GOFC9VHnhvM
 VkeAEWCbvg5jZAvFD3Frj9XcMHg9yt+02LDjHsgtpLZBSHlO86v/TODK6HQPz9dwuRITh5z
 ooUrZSNinChDBTDAMJoHKntvdVy1ngdEnNCREwhlALJ+0gajhLHEgiQq03wAHMCXNigoRxH
 +dO0HlT15CC1LC1nXdheOcPJHrkqhyptKqWOFp2UmhD2kyzHzcADWNV3Wx7c1LkNkNP658n
 CjY9c7/Kke1ythopwLxvWtFuPrnm0BSdlus0Cteq5bKwWzlD+uyCuQ4WaHOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1778074198; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=NMDcx+O4AmjQuiyyWNbpLwYDIurXURsZY4AD+VUdPxA=;
 b=fWmd0MyNRcNlm9w3tLYUgnBv1Dim6kMhevcqa5akHkITqzWekArsVdpVql8o+l5K5vABk
 tVyKBJY+PIvYhf5mcHXKvxkabYEYH41AXCkXeRqlHRGwDDumq5UYGQjtU1Lozs4++QLZILv
 Q9JO1IolKZn+jm5tTFccfpGP6IevG4c0plIT/cDk17PNPtxZ6m58QtlBn7VFhSvDlxonJWd
 fXVds5X8h/2wflKkljBmHzLkS8XZVOseX5PchvnZcxuFmSwZ/tHXoWICl92YaUOmwhw5PI8
 xsm6JkH1yqn8kWuocHq17qd6UM/PzaXZPKoCu7gwUbTqfSAJxSKRMyL4vaZA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 25305459AA
	for <nouveau@lists.freedesktop.org>; Wed,  6 May 2026 13:29:56 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 06FEE10EDB9;
	Wed,  6 May 2026 13:42:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E3D4144278;
	Wed,  6 May 2026 13:42:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00DFCC2BCC4;
	Wed,  6 May 2026 13:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778074955;
	bh=YMBtIgkv/0vd1T2Q/REmFWl7B9kwD1JjOym1CYgrerA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=q8VZAc1jKjhYkUce5aTh0zexq4y8C1u0/kYwDMq/fi4b5/BGgGyEcabyeYJr2ikps
	 tbpHkK4690619IA7Seo//dI++5K1FUI3MmCTv0/vzsBwZEXPOqSrLvrdbiVu7Mx8gh
	 6yKGnfFXcHTtCbFFKM/SjKiOJJvhnL8mk4DfpMTNViV3MWj0ZemPBcQT4+6rZv3khS
	 3oY/zdjZjDFl89TJNF69XmL51iMVurwGfhOUV6G88SCgKYU99B7tsnIhky3MMB8qLU
	 nWnHmzlT8Dy78VVc2SxQV8y/kc8NqAZVOezC+KtmDYUdzgjp6Da2lA63wKF4f7Z+je
	 qJzoK1/Nxy0PA==
From: Thierry Reding <thierry.reding@kernel.org>
Date: Wed, 06 May 2026 15:41:57 +0200
Subject: [PATCH 6/9] usb: xhci: tegra: Explicitly specify PMC instance to
 use
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260506-pmc-v1-6-a6de5da7216b@nvidia.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3100; i=treding@nvidia.com;
 h=from:subject:message-id; bh=59LKaPbdXc/3cXqAypoqqQT4hvZBv70PYCPPUxuHdSE=;
 b=owEBbQKS/ZANAwAKAd0jrNd/PrOhAcsmYgBp+0Uwjf/7ylsfyp/FAMe7OvIMjXJRmECcGvqVZ
 UdgOe3ty+OJAjMEAAEKAB0WIQSI6sMIAUnM98CNyJ/dI6zXfz6zoQUCaftFMAAKCRDdI6zXfz6z
 oUr/D/oDRCFAmlPpPBjksDR0c4WYjTIIgAxZyXVTwR/BZIayR2+hDUes+Ers37L4X+dcwam6dP1
 Mh/NYLYivVsc8JPA2s4Sh8AnPMZDnR73dmYHAkjioFdvHKQ9kCPf6VDL9LuJ8iHM5ml+5lNy1Cd
 LEE9AWIbrzoUTUxwgy4XQVyUOomYhY3vukCkUqteP4y4BGfUhevwYGzQFbHCV4vyZAT4+urTydX
 2b2k1jShmK+uEkkYXm7WUTIF5BUVdAn6d/IKzSBt21YmXtDXpaX6Tzn+8a17jB3R6wsdi2kNpnH
 MLP4k1/ipPn21FyY5bWaNkTBeOkW+rF3KSSf7E99TqvZQCJHFEvtGMeDxq112bFWeAu6Vim9TIP
 JivdrWQUbK2iZb+US3DF3Hiey/aSvj1ttSAQPOoMG6CdRr19XJZKfufMvYkjowSHTfwbwhNMeTj
 RDh7pJoTmia0m+gfXVGJyvu/1iWbTk0kWTQWuPqAwsCmQUJaArldYdeLColaKSwzr4p14oLhGeE
 +9jWHeQtlhstICfUV296Vsv9hYdp7inn9h/qimHAe24rzHd8Zszs7xDWkcgxHPZkNIUOna/FwXp
 +7hy6gArw+JwkdIuoFtay+dwoxXVMNRoYw+h/Nta0GmCYAqeutmeXlwpl2+fAHui33MG3YOA3iE
 pWK00Z5pZRkvs6w==
X-Developer-Key: i=treding@nvidia.com; a=openpgp;
 fpr=88EAC3080149CCF7C08DC89FDD23ACD77F3EB3A1
Message-ID-Hash: EWPZ2N5MQOPL447QEZVHPEEVPMZQT2Z6
X-Message-ID-Hash: EWPZ2N5MQOPL447QEZVHPEEVPMZQT2Z6
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/EWPZ2N5MQOPL447QEZVHPEEVPMZQT2Z6/>
Archived-At: 
 <https://lore.freedesktop.org/20260506-pmc-v1-6-a6de5da7216b@nvidia.com/>
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
 drivers/usb/host/xhci-tegra.c | 38 ++++++++++++++++++++++++++------------
 1 file changed, 26 insertions(+), 12 deletions(-)

diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
index d2214d309e96..122b711929ef 100644
--- a/drivers/usb/host/xhci-tegra.c
+++ b/drivers/usb/host/xhci-tegra.c
@@ -292,6 +292,7 @@ struct tegra_xusb {
 	struct reset_control *host_rst;
 	struct reset_control *ss_rst;
 
+	struct tegra_pmc *pmc;
 	struct device *genpd_dev_host;
 	struct device *genpd_dev_ss;
 	bool use_genpd;
@@ -1188,20 +1189,23 @@ static int tegra_xusb_unpowergate_partitions(struct tegra_xusb *tegra)
 			return rc;
 		}
 	} else {
-		rc = tegra_powergate_sequence_power_up(TEGRA_POWERGATE_XUSBA,
-							tegra->ss_clk,
-							tegra->ss_rst);
+		rc = tegra_pmc_powergate_sequence_power_up(tegra->pmc,
+							   TEGRA_POWERGATE_XUSBA,
+							   tegra->ss_clk,
+							   tegra->ss_rst);
 		if (rc < 0) {
 			dev_err(dev, "failed to enable XUSB SS partition\n");
 			return rc;
 		}
 
-		rc = tegra_powergate_sequence_power_up(TEGRA_POWERGATE_XUSBC,
-							tegra->host_clk,
-							tegra->host_rst);
+		rc = tegra_pmc_powergate_sequence_power_up(tegra->pmc,
+							   TEGRA_POWERGATE_XUSBC,
+							   tegra->host_clk,
+							   tegra->host_rst);
 		if (rc < 0) {
 			dev_err(dev, "failed to enable XUSB Host partition\n");
-			tegra_powergate_power_off(TEGRA_POWERGATE_XUSBA);
+			tegra_pmc_powergate_power_off(tegra->pmc,
+						      TEGRA_POWERGATE_XUSBA);
 			return rc;
 		}
 	}
@@ -1228,18 +1232,21 @@ static int tegra_xusb_powergate_partitions(struct tegra_xusb *tegra)
 			return rc;
 		}
 	} else {
-		rc = tegra_powergate_power_off(TEGRA_POWERGATE_XUSBC);
+		rc = tegra_pmc_powergate_power_off(tegra->pmc,
+						   TEGRA_POWERGATE_XUSBC);
 		if (rc < 0) {
 			dev_err(dev, "failed to disable XUSB Host partition\n");
 			return rc;
 		}
 
-		rc = tegra_powergate_power_off(TEGRA_POWERGATE_XUSBA);
+		rc = tegra_pmc_powergate_power_off(tegra->pmc,
+						   TEGRA_POWERGATE_XUSBA);
 		if (rc < 0) {
 			dev_err(dev, "failed to disable XUSB SS partition\n");
-			tegra_powergate_sequence_power_up(TEGRA_POWERGATE_XUSBC,
-							  tegra->host_clk,
-							  tegra->host_rst);
+			tegra_pmc_powergate_sequence_power_up(tegra->pmc,
+							      TEGRA_POWERGATE_XUSBC,
+							      tegra->host_clk,
+							      tegra->host_rst);
 			return rc;
 		}
 	}
@@ -1733,6 +1740,13 @@ static int tegra_xusb_probe(struct platform_device *pdev)
 				err);
 			goto put_padctl;
 		}
+
+		tegra->pmc = devm_tegra_pmc_get(&pdev->dev);
+		if (IS_ERR(tegra->pmc)) {
+			err = dev_err_probe(&pdev->dev, PTR_ERR(tegra->pmc),
+					    "failed to get PMC\n");
+			goto put_padctl;
+		}
 	} else {
 		err = tegra_xusb_powerdomain_init(&pdev->dev, tegra);
 		if (err)

-- 
2.52.0

