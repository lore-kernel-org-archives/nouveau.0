Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D27DCD343B
	for <nouveau@archiver.kernel.org>; Wed,  6 May 2026 13:42:17 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1212810EDA3;
	Wed,  6 May 2026 13:42:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="IKJ4RV3L";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 0136545DD5;
	Wed,  6 May 2026 13:29:37 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1778074176;
 b=XOLVl7JDFlB5U/uU0b2ZgBSWFbJtn01T/d91iguLEf7igAnc4JGymLVzGO1W5SGenVpdr
 ARU80NXXhdZa+n+nNOmbrfpxCFKsyKQT+nmqZ25dc+yClw+Zf22ffnCppqIpSGkyomxe9YN
 rFlvx4mn1FWUjGYWHN2jE6wrQsCM2UdP3+u3VnODfkT5ZeprSXvhnoQPcfkRgd776DzYsTm
 XoYSzamljQgyw4x5vrGVvgg3YVdVW9u65f4ok67g7ONCuganjGhFSwCQaS/V842ns2evLQO
 G+ihGduZ+chjHXUADN5xaSS56RczPDtpLQvbTFkxcSJYacqIWEOQ/7AqJ95A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1778074176; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=n/H3N4oojY2LuOXEQykSdAHHD2v/kKiKPv8XFQG2lfE=;
 b=Td6yMesh8oGsbExqOrMrDtI7pEGJIInOHgQ4kIJdQ8BXdBXzX+PKjn9zheeZG3qCI8jZ3
 oqYtmRNVRHVzikIynlKxSXBnChLChuIrrfXsNsR5O68R25cAaKmAASw2p+sLzICAeTbYWGd
 YliyS0GCUvCzIi+ln15EZBr+97GElq8hxrujggod8g2J+MMLgEzn72RXZzESblkky6G8ZBo
 230New3IzPs/rTj9tQA9sBTFhREmDb4c826ul5taU1Hpimhag+4EUvJDnSGilekJbzHedUB
 d/sSDfO45aJ8fSdh240CUIAjDaJ2oiwT8xfLbvpKJLjWYGua1q4As9guVFvQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 8F83E459AA
	for <nouveau@lists.freedesktop.org>; Wed,  6 May 2026 13:29:33 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 520C410E53A;
	Wed,  6 May 2026 13:42:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A0F6F60103;
	Wed,  6 May 2026 13:42:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BA64C2BCB8;
	Wed,  6 May 2026 13:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778074932;
	bh=c3IdukSqkdizYR+nvOsMFSfRacrCTihLpGMwf0DytCw=;
	h=From:Subject:Date:To:Cc:From;
	b=IKJ4RV3Lyv8oxdqtjJC6OIC/6rXY29IuJvTiT4NZTUHacP2c3bEAL5u8IO525gAAd
	 GdHYJPixovH2tJ8+/ccpTRSbFwSioKJNQ0jfXXpXj62CSlxnJLfRrzPvFFZbyJH94k
	 rmpOM5pmePtSKhc8yDNIiM9V0/1k6GFBaDGv+RMER+VjW6gNDG+AWSkPQLUlP3inFG
	 uR9VwrRzsa+NntueV5w8T5/9dFLPyDU2dBoZYPsGuM40wjmmpeFzNxHoRadZPM8Hyv
	 n3WTP6W9EXxusJxeDt6+bufGSq2+lKWQI3Lah8LnOBM4/ec9qAMzlA6hhQ83qfsP7o
	 KCbzR1+7uhdcw==
From: Thierry Reding <thierry.reding@kernel.org>
Subject: [PATCH 0/9] soc/tegra: pmc: Clean up legacy code
Date: Wed, 06 May 2026 15:41:51 +0200
Message-Id: <20260506-pmc-v1-0-a6de5da7216b@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXM0QpAMBjF8VfRd201iymvIhfMwafM2pCSdzdc/
 up/zkUBnhGoSi7yODjwaiOyNCEztXaE4D6alFRaFlILtxiRK/S5QamBgmLpPAY+v5e6+R32bob
 Z3ind9wOZhJpCZwAAAA==
X-Change-ID: 20260506-pmc-42ed4ce76ee5
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2907; i=treding@nvidia.com;
 h=from:subject:message-id; bh=c3IdukSqkdizYR+nvOsMFSfRacrCTihLpGMwf0DytCw=;
 b=owEBbQKS/ZANAwAKAd0jrNd/PrOhAcsmYgBp+0UviFY8FRKErx+gWaVIw1aQqo3vpgLFBeSK2
 QOwKU74fluJAjMEAAEKAB0WIQSI6sMIAUnM98CNyJ/dI6zXfz6zoQUCaftFLwAKCRDdI6zXfz6z
 oSXDD/91cqDJQm1CmiDEX3o7Unl38MlUu/CfFtYMDWyUZ7eThkCtVRzHXCEt+Z5P92fpge0puXf
 aQpRSV7kenNh18JhSWj/5+XyhAf6NgIP1IC7KvnU9Rb0ttmUPc44abwaGNIdl9JUY2P8a8DFwUb
 B8olNHLzudEKDrxFtwQJuA+LbBT/B7LjdtvVTmjg6Hgpz82Lv4IwUJIIB9/rvGBz07pKPtvqNlF
 8AXnGwpWBSmJBVD/Bg5tMVlTFcI8CuWM0uSfqF7Fe8QjWgyPcAQ17+anPVPDUeflenhlEOrB8FH
 d4hRnk3mE3bAsDflRt/8LQpkz4A6Vs/zwwcBVKwRDCXALnqI6jcpsUotp/Ub16lFCK5KYYd7VIa
 uVd5k7E3ku4W5EFiLk26KGUyi6WPtbHXM8YphtwwrXaB9bNDnTUcKXG8o2AERJLO/9hKSqMys43
 NtPtcMZXCS6SKQIFNR3QTOVTGrj+Bri3RAfwXpBeI7WXUuYjQLsKSe1sdC7fJfWfOusR7pdXLYA
 zIVEx3IjPndD4GaTjdKJTopPr1a/M6afg8r63ZXCO4u6fwxTaC854gRdvm6J/yhFnE2JPjqRKK0
 MSLNxv5xE1gMA37VuJq0jspEaXgC2N1nXEOBBMofoTN/HpGi8XfvXqzpfkn6YgWci9bGIj+8rZg
 oJJjuQE+3aztG1A==
X-Developer-Key: i=treding@nvidia.com; a=openpgp;
 fpr=88EAC3080149CCF7C08DC89FDD23ACD77F3EB3A1
Message-ID-Hash: 4GFGDWIK7J6LAIO5SOL6IFMGGKRYROQV
X-Message-ID-Hash: 4GFGDWIK7J6LAIO5SOL6IFMGGKRYROQV
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/4GFGDWIK7J6LAIO5SOL6IFMGGKRYROQV/>
Archived-At: 
 <https://lore.freedesktop.org/20260506-pmc-v1-0-a6de5da7216b@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

The Tegra PMC has accumulated a bit of cruft over the years. Most of the
legacy code has since been replaced by standard APIs, but for certain 32
bit platforms we cannot get rid of all remnants, unfortunately.

In addition, future SoC generations can have multiple instances of the
PMC, making some of the old APIs unusable. Preliminary work was merged
recently to allow passing a PMC instance to the custom PMC APIs to solve
this problem.

This series of patches is a final cleanup pass that makes use of the new
APIs in existing drivers. At the end of the series, only some old 32-bit
support code will use the old APIs, so they can be made exclusive to the
32-bit ARM builds (which is about as good as it's going to get).

Note that the first 6 patches can be applied to subsystem trees
independently since they only rely on patches that were merged into 7.0.
Patch 8 depends on these patches being applied, so some coordination is
needed. The simplest solution would probably be to merge them all
through the Tegra tree, if everyone agrees. Otherwise, maintainers
should feel free to apply patches to their subsystems and I'll monitor
things and apply the last three patches once all others have landed.

Thanks,
Thierry

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Thierry Reding (9):
      ata: ahci_tegra: Explicitly specify PMC instance to use
      drm/nouveau: tegra: Explicitly specify PMC instance to use
      drm/tegra: Explicitly specify PMC instance to use
      media: vde: Explicitly specify PMC instance to use
      PCI: tegra: Explicitly specify PMC instance to use
      usb: xhci: tegra: Explicitly specify PMC instance to use
      soc/tegra: pmc: Create PMC context dynamically
      soc/tegra: pmc: Remove unused legacy functions
      soc/tegra: pmc: Move legacy code behind CONFIG_ARM guard

 drivers/ata/ahci_tegra.c                           |  17 +-
 drivers/gpu/drm/nouveau/include/nvkm/core/tegra.h  |   2 +
 drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c |   9 +-
 drivers/gpu/drm/tegra/dc.c                         |  14 +-
 drivers/gpu/drm/tegra/dc.h                         |   1 +
 drivers/gpu/drm/tegra/gr3d.c                       |   9 +-
 drivers/gpu/drm/tegra/sor.c                        |  16 +-
 drivers/media/platform/nvidia/tegra-vde/vde.c      |  15 +-
 drivers/media/platform/nvidia/tegra-vde/vde.h      |   1 +
 drivers/pci/controller/pci-tegra.c                 |  20 +-
 drivers/soc/tegra/pmc.c                            | 412 +++++++++------------
 drivers/usb/host/xhci-tegra.c                      |  38 +-
 include/soc/tegra/pmc.h                            |  81 +---
 13 files changed, 305 insertions(+), 330 deletions(-)
---
base-commit: 7fd2df204f342fc17d1a0bfcd474b24232fb0f32
change-id: 20260506-pmc-42ed4ce76ee5

Best regards,
--  
Thierry Reding <treding@nvidia.com>

