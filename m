Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69C89CD342C
	for <nouveau@archiver.kernel.org>; Wed,  6 May 2026 13:42:19 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 39FDF10EDAE;
	Wed,  6 May 2026 13:42:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="THtIptsl";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 3A28545DD5;
	Wed,  6 May 2026 13:29:39 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1778074179;
 b=IjPsMpu8jd1E6L9Jq4BkHSM3Ky5N0uphem6apf7g63j4g9yP2Axsl/WQoYNc2Y58VWsoh
 Xzns+0/nDsM3v0b+xUpqGCQDkdOTEe+QfqiY44VBJ5ibqWYR/W3xhm8r9M27+GGzn4NNXR5
 MvYOfofKpxsIM3vF5pLxNoZsjZjgR2xM8H7L7MKe/re2nhmqgWioMJjGHh0keZilDzt/qee
 ImYPkLB5tO/K8hlqt3yOtaFjbh7cuUdz2FWjT90mTEug6/kQLpcqokUCuHEVCxW6omzi2Rp
 Dmk+An3VaJCkD8PczdVgi182vzkClE8ramXDti7m/DUossAJ1XOinJvtJD+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1778074179; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=9VT2uplXsSFb56aFp/yRgAXU8SwD+uaVXBkyrggv0Tk=;
 b=qVYOazv9926Ao2Hl7gFlp7Okt7W4vMGgHNLoaivZZ9wC9PuDmosxebR9k74YiBoa8xpWN
 G9M8ZmvKfaTfOlve/tmbUqx0x2cTnFhfCveiX/xqVG0N0eO7TR8WDZyPcjQTBiIj1eN2fEb
 tp3Yo+pLSmiIGqLpUx7+KnkuEBwQm/I2y0NEobhIqgj1LokQVvunww01L+mRFj35YXVvcyp
 Sobm/jcqoq2WweU7lkxdmMwzJQsC/Z4oT5eiAYjYBjMH/bqvAwUhLFxUJ5gPFMdWtgVKwVl
 LHZyCt+zjA1NVS2FwFhZX42wEznqcDyu3oWvprWxvRgUeTcWn7HSXYCAqR+w==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 35870459AA
	for <nouveau@lists.freedesktop.org>; Wed,  6 May 2026 13:29:37 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 00FF510E54D;
	Wed,  6 May 2026 13:42:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7A6656015B;
	Wed,  6 May 2026 13:42:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 516DEC2BCC9;
	Wed,  6 May 2026 13:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778074936;
	bh=mBnLUZMGhM091DpLc/U5zErdLqXnLgpupJv9YgGKdUI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=THtIptsl/EzTcknji8Sr7FZocfL59iionTpaj9jsaQAsNkW59Js6CON4LILpwJmR0
	 oLdboQHRAfNjp4OPCsxOQv02ppiDM9CLZ0xqHMTvJdOzdMqTSvgPx19bWd8M6sKJaz
	 90b3OmrPxHplmwJT2afntzUpR9iNzmuZ6SEIGKAzoRhl2MRyXCRtwnw9b/mAg+0/0c
	 TlKdskWrN6+E3o1LcsPisph5lJhM2D0PlACMZ1tte43bSRB88PdcpgF29UUQoZgpBp
	 Nu9exKX7YtAifz5j97TwBGMd18glKob487U6z17EieQIbvmv0/22ekvFpGej+dOOxr
	 0XBfEHreJ8JQQ==
From: Thierry Reding <thierry.reding@kernel.org>
Date: Wed, 06 May 2026 15:41:52 +0200
Subject: [PATCH 1/9] ata: ahci_tegra: Explicitly specify PMC instance to
 use
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260506-pmc-v1-1-a6de5da7216b@nvidia.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2433; i=treding@nvidia.com;
 h=from:subject:message-id; bh=CzZgWVZZSZZ3cjegVsK5oiOvQGLlRFg7d8ikashi5Ls=;
 b=owEBbQKS/ZANAwAKAd0jrNd/PrOhAcsmYgBp+0UvwgGq03mhNWzC/Ms1bLh5lNTjVlpCh+IHt
 YPQUMgqVaiJAjMEAAEKAB0WIQSI6sMIAUnM98CNyJ/dI6zXfz6zoQUCaftFLwAKCRDdI6zXfz6z
 obDtD/9X/qtjzKNCvjJ1NN5bLe5DDKPANAIxNXbNDKMmYnrdRH3rAzFrl5eNg4E7GB72CADzGvi
 e9x77y2TmP/+jeZjbQ0KXZtseKmDMBqqYwMUvbd8KVFp0AXCMklVBdpfGZB3iCPw0qK2UlqmaUn
 Fud3PfVmxypldtelOZHVw/YH6r2ZfNvHnGE03XUclDfu1MkoVpdjPM+b/1MTBWmmsik/R+RB4GB
 Iw6TLbbUQwHrJwAF/rCNJxacbnXgKhdhhGB+jmOKJIWQe9VNO+MMw6hezHyGYCjFTD685fzqFm+
 SzzjV3gQ29jU4kYDqJlx/9+g/WbOuYHK3Wa1YbWeUzI5HKx+lbJRe0Oj6H94PXOsmHGIz0JD28n
 cHl7bHrZlAKQOoIvo8Q88SYHg8VmPrS6vj+ZjJrlOZYcKw7M0s6tx4BIP5NQ4jJAfMUoTnR3ngV
 t1uAci/JktTzGCsn91tQBxMfZbHUhU9yd1tekKDx8KEpGvD6jlfr3+rtW5iJpm/1Jgbe8N/P0b2
 dEgKpALYXVeMYixFdtlpU/D/8TAn5SG4PEd3IwTqAcOVhdOBfQCBy8615wrwgPDQcC+FT3H+2hI
 VAm8EFtN1iorZQelz0wvngIceHQqiwtYvc/6Q/zaIEFnhQLn6SzoUf9ZkY58QVWvkWdJJIkigGE
 b8rYJVlg885kbyg==
X-Developer-Key: i=treding@nvidia.com; a=openpgp;
 fpr=88EAC3080149CCF7C08DC89FDD23ACD77F3EB3A1
Message-ID-Hash: 7J2C72ZZOYZEH25FIFF7JKW3SHLWMNT7
X-Message-ID-Hash: 7J2C72ZZOYZEH25FIFF7JKW3SHLWMNT7
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/7J2C72ZZOYZEH25FIFF7JKW3SHLWMNT7/>
Archived-At: 
 <https://lore.freedesktop.org/20260506-pmc-v1-1-a6de5da7216b@nvidia.com/>
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
 drivers/ata/ahci_tegra.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/ata/ahci_tegra.c b/drivers/ata/ahci_tegra.c
index 44584eed6374..554f05e09f98 100644
--- a/drivers/ata/ahci_tegra.c
+++ b/drivers/ata/ahci_tegra.c
@@ -175,6 +175,7 @@ struct tegra_ahci_priv {
 	struct reset_control	   *sata_cold_rst;
 	/* Needs special handling, cannot use ahci_platform */
 	struct clk		   *sata_clk;
+	struct tegra_pmc	   *pmc;
 	struct regulator_bulk_data *supplies;
 	const struct tegra_ahci_soc *soc;
 };
@@ -246,9 +247,10 @@ static int tegra_ahci_power_on(struct ahci_host_priv *hpriv)
 		return ret;
 
 	if (!tegra->pdev->dev.pm_domain) {
-		ret = tegra_powergate_sequence_power_up(TEGRA_POWERGATE_SATA,
-							tegra->sata_clk,
-							tegra->sata_rst);
+		ret = tegra_pmc_powergate_sequence_power_up(tegra->pmc,
+							    TEGRA_POWERGATE_SATA,
+							    tegra->sata_clk,
+							    tegra->sata_rst);
 		if (ret)
 			goto disable_regulators;
 	}
@@ -269,7 +271,7 @@ static int tegra_ahci_power_on(struct ahci_host_priv *hpriv)
 	clk_disable_unprepare(tegra->sata_clk);
 
 	if (!tegra->pdev->dev.pm_domain)
-		tegra_powergate_power_off(TEGRA_POWERGATE_SATA);
+		tegra_pmc_powergate_power_off(tegra->pmc, TEGRA_POWERGATE_SATA);
 
 disable_regulators:
 	regulator_bulk_disable(tegra->soc->num_supplies, tegra->supplies);
@@ -289,7 +291,7 @@ static void tegra_ahci_power_off(struct ahci_host_priv *hpriv)
 
 	clk_disable_unprepare(tegra->sata_clk);
 	if (!tegra->pdev->dev.pm_domain)
-		tegra_powergate_power_off(TEGRA_POWERGATE_SATA);
+		tegra_pmc_powergate_power_off(tegra->pmc, TEGRA_POWERGATE_SATA);
 
 	regulator_bulk_disable(tegra->soc->num_supplies, tegra->supplies);
 }
@@ -571,6 +573,11 @@ static int tegra_ahci_probe(struct platform_device *pdev)
 		return PTR_ERR(tegra->sata_clk);
 	}
 
+	tegra->pmc = devm_tegra_pmc_get(&pdev->dev);
+	if (IS_ERR(tegra->pmc))
+		return dev_err_probe(&pdev->dev, PTR_ERR(tegra->pmc),
+				     "failed to get PMC\n");
+
 	tegra->supplies = devm_kcalloc(&pdev->dev,
 				       tegra->soc->num_supplies,
 				       sizeof(*tegra->supplies), GFP_KERNEL);

-- 
2.52.0

