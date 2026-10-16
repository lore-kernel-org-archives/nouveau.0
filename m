Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA6DDCCF2C2
	for <nouveau@archiver.kernel.org>; Fri, 16 Oct 2026 16:07:29 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9D76F112913;
	Fri, 16 Oct 2026 16:07:24 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id F02AF48AE8;
	Fri, 16 Oct 2026 15:48:42 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1792165722;
 b=UXbBvvc/ukgthfdDU8WFjWhFYuefr51d/Svo8M4/hNSN+Rr8G3i4jJRK7XLMPXG4KQaEL
 3QetNblWKw/rHdGtuGHcObV/BxHbVvOaI0/GtFuvTbsNLs+VRVVCBHkaZjpNvmDXr2V56VZ
 7wW/vp61UwhBJ/zZInFP0MRvuWaAkqBUVGaAufX1Bcmlk0V0VxQCPHWtFxEZYJB9l1QLQWb
 zr6OGqQCv+p2hNst3dJ1ZSGlTGutV0S9E797VIa8uXaVj0SDfQpYxD72o0y3+N9L9P2A4YX
 TfHOE+dfYz07qEl7Gtcr6g5cqKsm8g57yk7KMH4kC3SMNg5Lt5B8dU8ZwhKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1792165722; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=bTnvzmPBqQO5bnBnm+XgGen3Y38ypytnbj4pLgrXzZI=;
 b=HcGSbzSZm2rYL2v1Yo6YvK7xnuVkr4TrY4mTqKaMJ6Uctv4kphdabnIHo3Ek4V5QQmjiS
 BHU418fGFNGHtDQI15TcJ90nR7AVR9xvQCmV6w0AjxVjb3LAGtV0B/ua8s5iwdSRTbvIGF8
 T5TtZLe0zyZUx+OXR5RrzDN98ngPhsz+s6Tytz9yYerTRJda2A5B39YrOGcv4SXnEqtFi9P
 MSXsddo8IqIcKHfDjBOUn7a6AMflTnHHvnBNvXLhZ33kOJNkDEveBSv6BxgDpFTozxosZAV
 L9cwXenTZWjMczJexZsocVMN3VJsSALh9Qg/NBMsnvl5LcqPYi96OW1AyOvg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id A034148AED
	for <nouveau@lists.freedesktop.org>; Fri, 16 Oct 2026 15:48:39 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 139B71128EF;
	Fri, 16 Oct 2026 16:07:16 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F0097403A1;
	Fri, 16 Oct 2026 16:07:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A10A11F000C7;
	Fri, 16 Oct 2026 16:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792166835;
	bh=bTnvzmPBqQO5bnBnm+XgGen3Y38ypytnbj4pLgrXzZI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=lAe7Td8XOZeaj/f4Z6IveolOWQxjThgFB7mKy/zV25BfXtHsOup8Bu0G9/vSewuAt
	 4167jHC7JTF54vSJsqo0sWRQJuJWoNPzrIPxswwflYqFS6MMkOZZ6Patq5gNUfhHub
	 ONYn57NtbuUSCg3JKpjcfkaaLX0U70n0qzwSMKPYGXezcBNMsy3uiAvLmO8oFJbXbG
	 zWGG8BZbYvt03LYoLhf6Ud7BD23Mh2TJK1uFRM6jw48JEB61iCdX+yo+pF7gY8GPt+
	 QaaB04gDG8Xgyt+8bp8xMGKr/E4xsNPRmJ3OOccR2xg1Rf1qVQoD4oHMMZdERA4tvk
	 RKH2Tpr6CgTDQ==
From: Sasha Levin <sashal@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v2 5/6] arm64: tegra: Add the fuse clock to the Tegra210 GPU
Date: Fri, 16 Oct 2026 12:06:58 -0400
Message-ID: <20261016160700.3831336-6-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261016160700.3831336-1-sashal@kernel.org>
References: <20261016160700.3831336-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 7DO7RKZPTITSBZJRNUD5JXDQXUTPRSBD
X-Message-ID-Hash: 7DO7RKZPTITSBZJRNUD5JXDQXUTPRSBD
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/7DO7RKZPTITSBZJRNUD5JXDQXUTPRSBD/>
Archived-At: 
 <https://lore.freedesktop.org/20261016160700.3831336-6-sashal@kernel.org/>
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

Fixes: d1b725476104 ("arm64: tegra: p2180: Explicitly enable GPU")
Assisted-by: LLM
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm64/boot/dts/nvidia/tegra210.dtsi | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
index 5f5e5370d7096..2e84b2bda3142 100644
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
2.53.0

