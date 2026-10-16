Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EBCECCA46C
	for <nouveau@archiver.kernel.org>; Fri, 16 Oct 2026 16:07:19 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A2E3B1128DF;
	Fri, 16 Oct 2026 16:07:11 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id E544D48AE9;
	Fri, 16 Oct 2026 15:48:29 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1792165709;
 b=c2mZfybmIb8ZR5ugzJ4gXiivNPMGV5Z8HLPNNpM5BlGDkpHTSBKUzjzhk+WMQ0rOTnLlc
 UDyuB5K8Ti9Nb5XRyyXZYAG0Foo1YNIo9eXcEJJ4BRN9+/eFc69jf9rrdW8USjxJnFb9xqH
 atPOqk2FNwR0P+gaEj/8D81H/x6b/j8XP58h4S0OrocKP6Igy+aNakFX2cYDv1O3Au3HyoX
 f6T4JtAhQaUfUxCbFzxwoOuY+e/nVbM9GYczBjve4erBKPIa6lWTOxfKHt4fM7NG1RQ2KvF
 4s7BoDESs26gFmOkUtLuN444qOgE7NK4xdUi/gI7QkJm2G7DEQp9eWzGdOpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1792165709; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=OruC+xVMUOjeQ0CCeCTlrwXSIelR6KAByPpIlRqyTfk=;
 b=QGtK9Xll7jKtZdMZBiYK32atYtK8UqARQJuom8YBgwSwJ2GilDfpOysx3ZyA9yuUoiGnY
 /jcbSetCsoUfSVuQnhsdVZhRA7C6+YeLf5vozIQSrtA5nWpEZoeo4Kl6EI7juvjKXysEg5D
 FBTn2NDU8ErITSrpY0HozPc9Yw8nHV2/EhssU18+7eAoM7sx5WcmpjeQIJAKKv2skp3v6I4
 T/H10mbzqbY0I3vF7b47dcuWT6XSdjMeRXCAJrjC8WQvvZS+izDqiXWdQX7CFknDA59e9Hh
 12k5fXnMVCV4yHF9v/kWakjholYZWZl+4ugdMdS+YmYTuxVzmWSnSVNINzNw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 7902848AC5
	for <nouveau@lists.freedesktop.org>; Fri, 16 Oct 2026 15:48:27 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E871F1128D5;
	Fri, 16 Oct 2026 16:07:03 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7E3B942E71;
	Fri, 16 Oct 2026 16:07:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20EC51F000C5;
	Fri, 16 Oct 2026 16:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792166823;
	bh=OruC+xVMUOjeQ0CCeCTlrwXSIelR6KAByPpIlRqyTfk=;
	h=From:To:Cc:Subject:Date;
	b=nvN/Wjbo5/6SUmUglC+oaP9HXTRyaQEx6EkhnKmEZc916Ohdgbyh63cA1IL+hyWwQ
	 /I8vZpAU1qsb2NZcWq0rczGwe/cnY0xA2eQAGCJgSSvno5N2zsbXYzDF91lbqMRUkJ
	 labZHPSKPsl1bpf4Q2UxA6bBGrHFzqYJZKMSmRhPrHTiwevwNrfW5Sg0c/NBsiwwTD
	 /PMEG1kiMTjJhlSSbb0Pf0EqVRRNNyQgsgF4vLH2y+k7aBjQF3z691/iswQf1NWlzV
	 xcuMRYTUeb5BkfBbfc9FCCWmjijS86ZCzj2NoS/oXlcvUUbuCYay82GhN4OvmrOA7E
	 R+AKrhnfLmSMg==
From: Sasha Levin <sashal@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v2 0/6] Keep the fuse clock enabled while the Tegra GPU is
 powered
Date: Fri, 16 Oct 2026 12:06:53 -0400
Message-ID: <20261016160700.3831336-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: XJMSPMJUNTC4TIMAZVMTXWVEB4D4HO42
X-Message-ID-Hash: XJMSPMJUNTC4TIMAZVMTXWVEB4D4HO42
X-MailFrom: sashal@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Sasha Levin <sashal@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, Aaron Kling <webgeek1234@gmail.com>,
 Diogo Ivo <diogo.ivo@bootlin.com>, Svyatoslav Ryhel <clamor95@gmail.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/XJMSPMJUNTC4TIMAZVMTXWVEB4D4HO42/>
Archived-At: 
 <https://lore.freedesktop.org/20261016160700.3831336-1-sashal@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Since the GPU on the Jetson TX1 was enabled in its device tree, nouveau
often fails to bring up the GM20B: BOOT_0 reads back garbage, PRI reads
time out, or the first register reads stall until an SError. The GPU needs
the fuse clock running while it is powered, but nothing keeps that clock
enabled: the Tegra fuse driver only turns it on around its own fuse reads.

This series describes the fuse clock in the GPU device tree nodes and has
nouveau keep it enabled from before the GPU rail is turned on until after
it is turned off. Patch 1 makes the fuse clock required by the binding and
lists the exact clocks for each GPU. Patches 2-5 add it to the Tegra124,
Tegra132, Tegra186 and Tegra210 device trees; Tegra194 already has it.
Patch 6 makes nouveau use it.

nouveau keeps treating the fuse clock as optional, so device trees that
lack it continue to work as before.

On eight Jetson TX1 devkits, the GPU failed to come up in 27 of 109 boots
without the fix and in 11 of 291 with it; patch 6 has the details. Aaron
Kling reported that a Jetson Nano that almost never loaded nouveau did so
on 3 of 3 boots with v1. The Tegra124, Tegra132 and Tegra186 device tree
changes have only been checked with dtbs_check.

Changes in v2:
- 1/6: List the exact clocks for each GPU, so that "fuse" cannot appear
  twice, and make the fuse clock required (Thierry).
- 2/6, 3/6, 4/6: New. Add the fuse clock to the Tegra124, Tegra132 and
  Tegra186 GPUs as well (Thierry).
- 5/6: Add a Fixes: tag, as the nouveau fix depends on it.
- 6/6: Disable the fuse clock on power down even if disabling the
  regulator fails (sashiko).

v1: https://lore.kernel.org/r/20261013145210.103565-1-sashal@kernel.org

Sasha Levin (6):
  dt-bindings: gpu: nvidia,gk20a: Require the fuse clock
  ARM: tegra: Add the fuse clock to the Tegra124 GPU
  arm64: tegra: Add the fuse clock to the Tegra132 GPU
  arm64: tegra: Add the fuse clock to the Tegra186 GPU
  arm64: tegra: Add the fuse clock to the Tegra210 GPU
  drm/nouveau/tegra: Keep the fuse clock enabled while the GPU is
    powered

 .../devicetree/bindings/gpu/nvidia,gk20a.yaml | 52 ++++++++++++++-----
 arch/arm/boot/dts/nvidia/tegra124.dtsi        |  5 +-
 arch/arm64/boot/dts/nvidia/tegra132.dtsi      |  5 +-
 arch/arm64/boot/dts/nvidia/tegra186.dtsi      |  5 +-
 arch/arm64/boot/dts/nvidia/tegra210.dtsi      |  5 +-
 .../gpu/drm/nouveau/include/nvkm/core/tegra.h |  1 +
 .../drm/nouveau/nvkm/engine/device/tegra.c    | 22 +++++---
 7 files changed, 69 insertions(+), 26 deletions(-)


base-commit: 70dd4ee72eb2d5793c62e71c14e3aba78e5a4e56
-- 
2.53.0

