Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 905AECCA46C
	for <nouveau@archiver.kernel.org>; Fri, 16 Oct 2026 16:07:28 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 535A01128F7;
	Fri, 16 Oct 2026 16:07:23 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 9285848AF0;
	Fri, 16 Oct 2026 15:48:41 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1792165721;
 b=tDyOcr6vexi4zua35lef9odmjyVZ8rQFNb2trfJahnsfv+ejA7woVysRTAYpwpqokhRTf
 DnCWRXH3XKcUAuZVFNqUrIWfByGdOPpcEFn33jlQ7FcmP+nRh2lmXhZe6WrXuFd3XuysZ4h
 f0cbvhEXwZMIl5bJD9ZNaedbWbXoL1JFlOGtHEsX5zo5ApzcqETmLd/cj6XMZJgoM7eQd2l
 gTusUpuQEMSjhpUcwUXrkzwQnIIiVEqo/sWfL/2tVn4rZTVmfqrp87gKL5kWYJPWL7TfhFs
 r2rEmXEUlhJaRfVfJyCEtQ/oF2zaAOuGFvtidKXY4p/XPQskMyqWyWypwp9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1792165721; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=HkcaHoVEuEF6jyX7l2/gwSTBl3pJicibI4BqOQZqGyA=;
 b=wikp2BYX1T8MLB0Mep2eTd/lQNwcIRwU5IF9i9BqtyTyUv5T2ShHjfpI1O/krUk4T7L5u
 0g2sSEyQXUz7cjPA8NMUbI/O5SvXDYcMg/s/c2Mb2LiNZ9R2VD5160M0v82IT+0jTPtgePO
 RLHoFHoF4Ylt5BVxdVGxaC4iJ8c+U9yV1pH84IcyBgho3b9ceAgDeq9wBbs54ER1TuJBtcJ
 Dg71KlLnGGyI0tW4Gj7cNZVvAO37hE7ZDgo8CfI34Oc+cg0p+mq3uslhgS6IplDIXrGLfbN
 dDBZFcyf7wT95sTo5rmx7kjuOEM4F3NmDxKLkANE6ZB34VaanHQ9y+1t36Sg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 7882848AE8
	for <nouveau@lists.freedesktop.org>; Fri, 16 Oct 2026 15:48:38 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 326371128E9;
	Fri, 16 Oct 2026 16:07:14 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A6B5660204;
	Fri, 16 Oct 2026 16:07:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28C9B1F000C8;
	Fri, 16 Oct 2026 16:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792166833;
	bh=HkcaHoVEuEF6jyX7l2/gwSTBl3pJicibI4BqOQZqGyA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=DvBbqpzt1HA3rimcovjh1Gl6D1s64mWvD0b6KWVHdMToeVDnOKkWRBgmIQHS9Hzpe
	 wRpnmM3H37XPHKalWCSDp5Ue6nVO2XHqQqk6YJ78Cyb8Hv1O5q6uB8tKSTYOFUTYsY
	 XjToLrg9EV3Fl6zZmt+OV/O4+3vuU9XJnA+fZ7+rSnJ5SGKsH8BeBMMjRz0G2/rbui
	 DB3jhcYvGMG+yV4dMKCrodHK21CRfrMTTtecKfR5UFhH5pc4f1CoBKjYZLSX5uqRoo
	 JEG+DzsFjdphHa3imjdX1ekHS9ju4HrmrOzpYZjTb8+8I/F14t5BBRgVRsbhriRCH+
	 MLFOdwl7bfr/g==
From: Sasha Levin <sashal@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v2 4/6] arm64: tegra: Add the fuse clock to the Tegra186 GPU
Date: Fri, 16 Oct 2026 12:06:57 -0400
Message-ID: <20261016160700.3831336-5-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261016160700.3831336-1-sashal@kernel.org>
References: <20261016160700.3831336-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 4EFEEBBYCW6XCZNGNVRJT4W4MUE6UH6R
X-Message-ID-Hash: 4EFEEBBYCW6XCZNGNVRJT4W4MUE6UH6R
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/4EFEEBBYCW6XCZNGNVRJT4W4MUE6UH6R/>
Archived-At: 
 <https://lore.freedesktop.org/20261016160700.3831336-5-sashal@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

The GPU needs the fuse clock running while it is powered: Tegra194
already describes it for its GV11B, and the GM20B on Tegra210 often
fails to initialize without it, so the GP10B on Tegra186 is expected
to need it as well. Describe the fuse clock so that the GPU driver
can keep it enabled.

Assisted-by: LLM
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm64/boot/dts/nvidia/tegra186.dtsi | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
index 705af0373a090..7d2dd0713de5c 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
@@ -1883,8 +1883,9 @@ gpu@17000000 {
 		interrupt-names = "stall", "nonstall";
 
 		clocks = <&bpmp TEGRA186_CLK_GPCCLK>,
-			 <&bpmp TEGRA186_CLK_GPU>;
-		clock-names = "gpu", "pwr";
+			 <&bpmp TEGRA186_CLK_GPU>,
+			 <&bpmp TEGRA186_CLK_FUSE>;
+		clock-names = "gpu", "pwr", "fuse";
 		resets = <&bpmp TEGRA186_RESET_GPU>;
 		reset-names = "gpu";
 		status = "disabled";
-- 
2.53.0

