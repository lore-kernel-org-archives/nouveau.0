Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C28A6CC6B12
	for <nouveau@archiver.kernel.org>; Tue, 13 Oct 2026 14:52:32 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6992510E923;
	Tue, 13 Oct 2026 14:52:27 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id A4FE648A75;
	Tue, 13 Oct 2026 14:33:49 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1791902029;
 b=coV+1Htb48zcIxBxLGTZmMM7g/XKoOil6rVa9o8YW42YyGHVOybHUsUcr7Do397FEkCdb
 rHPY3wEnrrjvlo78XqJ0Bvw1T3HJ18giYsG59MH+Atad6ds3+f82ixtBrflpe/Fxovn/x38
 EbDuR8RNKFl3D5sGVZBbYDsRgu//PsQxECUFKtm0wX8ne7oeDmdVFYe6bcPFsJdEvAKITJP
 SEeSc6WfDIq+vFBz8Th2QJojHs4s1cAvOcOOqsFsI6FEAFbwCdfJvA6nvT412MqRGvmwTgi
 g4EuFAUI8ecBvu6WKogNSNu+nOlu4aZzxDwON8hXzqIQLXcLH4/rdT2e3NWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1791902029; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=hbNHU1fsqSqBvlLyyjwsZtUfV6L8Ck8u/6m0aKnYvpE=;
 b=P7xkoGAvzl8Db776x6F2nFxU8kY22MMfpFP/UCTqHXrCWx0Nf6zxoOmsmFmEh7Vh26uSq
 OW7cF6zC6pEOIU492c51YX44VvMAzKSXvhwnAC0gP8yO+/zS0dC9eDCzcIZRhhOMqS8hqrB
 35ILqY+WJdYUUp2G25jN1zfjSA7mOrr6tABqKJP5+L0RxXBPEaHGqO1RePb7GhuUivzQIv5
 s5ToTvZA7i8c8uXbRTgJNOQzRpmT+9b5kEd7837JkNHuwBJReWL18Fr+sH/2HZOLB8qTabF
 QCoT82fr/uEy2+pwyfxD/HRmBhA78iSz9StRyPQ36xe6T+yaMOTmeGbEybEg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 8219B48A6C
	for <nouveau@lists.freedesktop.org>; Tue, 13 Oct 2026 14:33:46 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3C88B10E8CD;
	Tue, 13 Oct 2026 14:52:16 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B3B97602C3;
	Tue, 13 Oct 2026 14:52:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DF571F00893;
	Tue, 13 Oct 2026 14:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791903135;
	bh=hbNHU1fsqSqBvlLyyjwsZtUfV6L8Ck8u/6m0aKnYvpE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=PW5uHOaqNfFerh7XvA6GccwyPteZU9o8lgMSsFD0lKj/nqtlSw1zXQTbIZhNUdDCJ
	 N1zCLyQ413MsGAVS2S1kaxYHFVpSeF6Tuu+E1a3f2GtU/FNNRAUk3OSYJI/tvSPA9o
	 rsO0sVofrj0M173tBhgjLW4CjMl9JlgjjDg4lYOjWPctqXbW023GwAKvDbO5NWe0va
	 9xXUljmjyv5UgFrYRL8ngvS7Q9rshiXjMkfmL7gXl6sCmFJHAJDHd6rCuMJwVblU4J
	 Q3uLgBBmO3SryQZ+vnsgvnJ9uFUD+aG0wmDy9gPthyD97CC0yAW+yzImho9jX3zI5c
	 cgm4uHE/+ud9w==
From: Sasha Levin <sashal@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH 2/3] arm64: tegra: Add the fuse clock to the Tegra210 GPU
Date: Tue, 13 Oct 2026 10:52:09 -0400
Message-ID: <20261013145210.103565-2-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261013145210.103565-1-sashal@kernel.org>
References: <20261013145210.103565-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: GBQQ4F36NQCUIWWEPAMQEJIDUHKWANJW
X-Message-ID-Hash: GBQQ4F36NQCUIWWEPAMQEJIDUHKWANJW
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/GBQQ4F36NQCUIWWEPAMQEJIDUHKWANJW/>
Archived-At: 
 <https://lore.freedesktop.org/20261013145210.103565-2-sashal@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

The GM20B GPU on Tegra210 needs the fuse clock running while it is
powered. Describe it so that the GPU driver can keep it enabled.

Assisted-by: LLM
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm64/boot/dts/nvidia/tegra210.dtsi | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
index 5f5e5370d709..2e84b2bda314 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
@@ -446,8 +446,9 @@ gpu@57000000 {
 		interrupt-names = "stall", "nonstall";
 		clocks = <&tegra_car TEGRA210_CLK_GPU>,
 			 <&tegra_car TEGRA210_CLK_PLL_P_OUT5>,
-			 <&tegra_car TEGRA210_CLK_PLL_G_REF>;
-		clock-names = "gpu", "pwr", "ref";
+			 <&tegra_car TEGRA210_CLK_PLL_G_REF>,
+			 <&tegra_car TEGRA210_CLK_FUSE>;
+		clock-names = "gpu", "pwr", "ref", "fuse";
 		resets = <&tegra_car 184>;
 		reset-names = "gpu";
 
-- 
2.43.0

