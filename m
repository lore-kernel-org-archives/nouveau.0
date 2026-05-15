Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF872CD4F25
	for <nouveau@archiver.kernel.org>; Fri, 15 May 2026 16:56:16 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id F102510E443;
	Fri, 15 May 2026 16:56:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Xa3pZcmi";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 9B632428F6;
	Fri, 15 May 2026 16:43:15 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1778863395;
 b=ZFj8TdvJ0eC51Dme/i3RfuD7eCJ67yfP/7RfFfzXfWVPh3bXtM+S92fMejWTAUHOParM7
 QXm+lWLN8mYeKpkXvtuBKNEb9cgEKtYEt19MbcfXafpMN+i6RQ+dEHnuXKj7XndZr6w0MKu
 SuUU2zLe0WylvXSCqdlHqmz5PwKUlLCUrLUOBePVHFLd1VdIkd+1JvRh3yNexQttpHUqQ8e
 hArTfWKwLEIj7flhqJyv9vyGPlLixyvqqFf26ufRjNX8XwJ3LiZZrer/x//+2sDA4Q4VGZ0
 FTqFoifv4dH73QHAkgbxDz5XubxpQqdyP0fMgvV1umVtb8fZ7vvDlsYdz2Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1778863395; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=qjqiLHL/KfX9muA3nNzVtU6V1gWqpRgkJWytVAkJPic=;
 b=oGYox/vyhCWm9VvzlZv1Tox/t6by75vo9oPRiKj2RjktOEekWD8KpF3xCduQs3P11G1yY
 cB9RemWq8l5jHH33DJEbhIj5GVA8Ug6DFbe0cEkutU58gzgmUDQPyc97tWTFbK2igmbBOsi
 27Owvfy/Eyj24fqkR/INF/nOmFXLtNXvB7ezTM0o+8jWmlfgjoHQ/lq0jAj3PNEEO6H/1w9
 SItOL0P6lWUfe2IKA9xawAybuja8+K7deT9N7jprpaEv7KrMoFLLTuyVPdCgtNTVTGX2ixv
 T7AadytcEHlqD5jPnm3dZ4spA8+TbcMricq6w9rS45OEdGl1ItGUxPl9UEMg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 3FB55414DF
	for <nouveau@lists.freedesktop.org>; Fri, 15 May 2026 16:43:12 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5F3F610E351;
	Fri, 15 May 2026 16:56:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 252C842E3C;
	Fri, 15 May 2026 16:56:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 979D9C2BCB0;
	Fri, 15 May 2026 16:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778864172;
	bh=SedbGXwK4aJOlbTTWEI5B8hx7KCD74sgdfit/X5/dJM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xa3pZcmiApyLXNIWHocH1qtmaMryAJkTWFgl+rng4s+TItk7aPdEyki3iosuzdkpy
	 dgMoi/zAjmq1PaylNozIrTBcWx2+miI4B3X/5vpx2wIA4hyWqf/WnNbnV9bsUNJdi0
	 A2/NaH5AKgVd7c5/xDWZpgPnsQ6J66Ni0O3qxYhlMkyNkAonTG/uiTVDQ9sQ0ismet
	 gkX84eIz9xXaskpFWuRsmZ01UJ8CUA/lAInYKclnjXLC68dSmjN8pdCc2G31aiAxC0
	 UucbSO9ecDfCOoB5pNipj0B2O1REqoFub+DwkVlt7VWbjAZx43vX5E1L7xODkNvcyH
	 ewY6CfpJxGZkg==
Date: Fri, 15 May 2026 22:25:59 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>
Subject: Re: [PATCH 5/9] PCI: tegra: Explicitly specify PMC instance to use
Message-ID: <rt3tpcu7eucylbxurtvraghnyljkv52zau75jwkkbtyfslc2ox@2bjkryjd4nqp>
References: <20260506-pmc-v1-0-a6de5da7216b@nvidia.com>
 <20260506-pmc-v1-5-a6de5da7216b@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260506-pmc-v1-5-a6de5da7216b@nvidia.com>
Message-ID-Hash: MJ5NNVJO753TXFBITOHRTOU7OGTQEFNJ
X-Message-ID-Hash: MJ5NNVJO753TXFBITOHRTOU7OGTQEFNJ
X-MailFrom: mani@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Mikko Perttunen <mperttunen@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-ide@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-media@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-usb@vger.kernel.org, Thierry Reding <treding@nvidia.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/MJ5NNVJO753TXFBITOHRTOU7OGTQEFNJ/>
Archived-At: 
 <https://lore.freedesktop.org/rt3tpcu7eucylbxurtvraghnyljkv52zau75jwkkbtyfslc2ox@2bjkryjd4nqp/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed, May 06, 2026 at 03:41:56PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Currently the kernel relies on a global variable to reference the PMC
> context. Use an explicit lookup for the PMC and pass that to the public
> PMC APIs.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/pci/controller/pci-tegra.c | 20 +++++++++++++++-----
>  1 file changed, 15 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controller/pci-tegra.c
> index 512309763d1f..2c6c521e6901 100644
> --- a/drivers/pci/controller/pci-tegra.c
> +++ b/drivers/pci/controller/pci-tegra.c
> @@ -340,6 +340,8 @@ struct tegra_pcie {
>  	struct reset_control *afi_rst;
>  	struct reset_control *pcie_xrst;
>  
> +	struct tegra_pmc *pmc;
> +
>  	bool legacy_phy;
>  	struct phy *phy;
>  
> @@ -1165,7 +1167,7 @@ static void tegra_pcie_power_off(struct tegra_pcie *pcie)
>  	clk_disable_unprepare(pcie->afi_clk);
>  
>  	if (!dev->pm_domain)
> -		tegra_powergate_power_off(TEGRA_POWERGATE_PCIE);
> +		tegra_pmc_powergate_power_off(pcie->pmc, TEGRA_POWERGATE_PCIE);
>  
>  	err = regulator_bulk_disable(pcie->num_supplies, pcie->supplies);
>  	if (err < 0)
> @@ -1183,7 +1185,7 @@ static int tegra_pcie_power_on(struct tegra_pcie *pcie)
>  	reset_control_assert(pcie->pex_rst);
>  
>  	if (!dev->pm_domain)
> -		tegra_powergate_power_off(TEGRA_POWERGATE_PCIE);
> +		tegra_pmc_powergate_power_off(pcie->pmc, TEGRA_POWERGATE_PCIE);
>  
>  	/* enable regulators */
>  	err = regulator_bulk_enable(pcie->num_supplies, pcie->supplies);
> @@ -1191,12 +1193,14 @@ static int tegra_pcie_power_on(struct tegra_pcie *pcie)
>  		dev_err(dev, "failed to enable regulators: %d\n", err);
>  
>  	if (!dev->pm_domain) {
> -		err = tegra_powergate_power_on(TEGRA_POWERGATE_PCIE);
> +		err = tegra_pmc_powergate_power_on(pcie->pmc,
> +						   TEGRA_POWERGATE_PCIE);
>  		if (err) {
>  			dev_err(dev, "failed to power ungate: %d\n", err);
>  			goto regulator_disable;
>  		}
> -		err = tegra_powergate_remove_clamping(TEGRA_POWERGATE_PCIE);
> +		err = tegra_pmc_powergate_remove_clamping(pcie->pmc,
> +							  TEGRA_POWERGATE_PCIE);
>  		if (err) {
>  			dev_err(dev, "failed to remove clamp: %d\n", err);
>  			goto powergate;
> @@ -1234,7 +1238,7 @@ static int tegra_pcie_power_on(struct tegra_pcie *pcie)
>  	clk_disable_unprepare(pcie->afi_clk);
>  powergate:
>  	if (!dev->pm_domain)
> -		tegra_powergate_power_off(TEGRA_POWERGATE_PCIE);
> +		tegra_pmc_powergate_power_off(pcie->pmc, TEGRA_POWERGATE_PCIE);
>  regulator_disable:
>  	regulator_bulk_disable(pcie->num_supplies, pcie->supplies);
>  
> @@ -1432,6 +1436,12 @@ static int tegra_pcie_get_resources(struct tegra_pcie *pcie)
>  		return err;
>  	}
>  
> +	pcie->pmc = devm_tegra_pmc_get(dev);
> +	if (IS_ERR(pcie->pmc)) {
> +		dev_err_probe(dev, PTR_ERR(pcie->pmc), "failed to get PMC\n");
> +		return err;

As Sashiko pointed out, you need to return dev_err_probe() directly.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
