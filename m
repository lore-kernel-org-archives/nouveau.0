Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D034CCA46C
	for <nouveau@archiver.kernel.org>; Fri, 16 Oct 2026 16:07:22 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id BAF501128F9;
	Fri, 16 Oct 2026 16:07:16 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 640B048AEE;
	Fri, 16 Oct 2026 15:48:33 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1792165713;
 b=Z8K7wGne/4NtDgHZ3p2JYBzwJ+y+uP/vbqQWxywgSAV+AiD23Sa96jfeIb4xTks47ypBu
 KBtPB0G6j9ubD8nqwpljxs924ildXtSJj+6E89hcTEj0zeqqSaEbabjlD/HXucPwh4nrGQ0
 u/F3BK/hGT5o3LLpvuQz02DiY/ckT9EGgZUhSOiWis+BgJjYgCf8Qlbo8GG+F5mmH1Et72Z
 RjRI2XGkEsa0MosMyIrcOCYnbG/vTuO81mQC4ee/VtLnbsqvnXx0PegSDDgVTGPGIg6eej7
 RXRnwf5uqOjyoONh6Z9hHGtZbl3G9sW2Q0r9cp+OBIyzKzeBlzgSnJY4u/Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1792165713; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=EyhMIFki24z/GS7kQ9MxTJlK5fDdy74J09DSaxUb78g=;
 b=Ic7lA51HyGqC8Q/1BJ3sN3MzAGrtGEY626uexO3g3r6EmpWeRORNeqVok2+oy/FWrHGKB
 G3enMQ7beSk4TzmHBlLt8Hywgc6e/6H8AjwMBqRcmbAjnQr6rEfsqXJY9cg/sbXpAheK733
 q63IZBQSawZLyXE5pu0s5Ros1TPTHMl1jSyJsduz4oRiUDzU6PvlkbWbomb6OVXifrE74ZQ
 3kSGWp0fw2DOoqtswIdOuuiKsy9opTfiHxaB89kTJlL4wkBypMZzCSmdmfqOiPncdnVPQWx
 kdM7vn2lb9WR11yNYr9yeJzHPxamFXv9X+fwfCIizw8iCTsB+B2u6ro2lH3w==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 9B4FB48AC5
	for <nouveau@lists.freedesktop.org>; Fri, 16 Oct 2026 15:48:29 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 20AF310E239;
	Fri, 16 Oct 2026 16:07:06 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 085B6434B9;
	Fri, 16 Oct 2026 16:07:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2B491F000C6;
	Fri, 16 Oct 2026 16:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792166825;
	bh=EyhMIFki24z/GS7kQ9MxTJlK5fDdy74J09DSaxUb78g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=oSiy7S7F/4VWlSrLEKyL8T7zav3l+9kgUofPlfdPeVnZVIL6SOtZQaJE6VFYcbcne
	 u5aJq0t3Ep7iW7oTnJFKvH9aBSl62KQ0S/AcdZm8axc4Dtt5e4tdElIyKfUIfZt3vx
	 OqwY5h5TcOBQkhWwRT42CpUnVkXd1N7vBC8maYs/IRi8ogF782d0aXvdVQpm2nhA7C
	 jz9o3/ipk3gHBGfBT9A+saejHnahRrKRjPjLp31snRs8pMPwtNBDCGE1TdyEHXIIQ4
	 iAiKjt82eYacWqbo3OtG5R06//eUNIs+QpVfLK0uZca5lIpClHhQtiWfx+70N4jwHJ
	 TAv8ND+khwkrA==
From: Sasha Levin <sashal@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v2 1/6] dt-bindings: gpu: nvidia,gk20a: Require the fuse clock
Date: Fri, 16 Oct 2026 12:06:54 -0400
Message-ID: <20261016160700.3831336-2-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261016160700.3831336-1-sashal@kernel.org>
References: <20261016160700.3831336-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: E6BZ5PAY7YBXDR6TKD7CXFOILJYVZITX
X-Message-ID-Hash: E6BZ5PAY7YBXDR6TKD7CXFOILJYVZITX
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/E6BZ5PAY7YBXDR6TKD7CXFOILJYVZITX/>
Archived-At: 
 <https://lore.freedesktop.org/20261016160700.3831336-2-sashal@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

The GM20B on Tegra210 often fails to initialize unless the fuse clock
is running while the GPU is powered, and the GPUs on the other Tegra
generations are expected to have the same requirement. Tegra194 already
describes the fuse clock for its GV11B.

Make the fuse clock required for all of them, and list the exact clocks
for each GPU instead of allowing either the reference or the fuse clock
as the third one: GM20B takes the fuse clock after its reference clock,
the others take it after the GPU and power clocks.

The nouveau driver keeps treating the fuse clock as optional, so device
trees that lack it continue to work as before.

Assisted-by: LLM
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../devicetree/bindings/gpu/nvidia,gk20a.yaml | 52 ++++++++++++++-----
 1 file changed, 40 insertions(+), 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpu/nvidia,gk20a.yaml b/Documentation/devicetree/bindings/gpu/nvidia,gk20a.yaml
index 4d856a8b674c5..af0ada6e02557 100644
--- a/Documentation/devicetree/bindings/gpu/nvidia,gk20a.yaml
+++ b/Documentation/devicetree/bindings/gpu/nvidia,gk20a.yaml
@@ -39,18 +39,12 @@ properties:
       Regulator for GPU supply voltage
 
   clocks:
-    minItems: 2
-    items:
-      - description: GPU clock
-      - description: Power clock
-      - description: Reference or fuse clock
+    minItems: 3
+    maxItems: 4
 
   clock-names:
-    minItems: 2
-    items:
-      - const: gpu
-      - const: pwr
-      - enum: [ ref, fuse ]
+    minItems: 3
+    maxItems: 4
 
   resets:
     maxItems: 1
@@ -86,6 +80,39 @@ required:
   - reset-names
 
 allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: nvidia,gm20b
+    then:
+      properties:
+        clocks:
+          items:
+            - description: GPU clock
+            - description: Power clock
+            - description: Reference clock
+            - description: Fuse clock
+
+        clock-names:
+          items:
+            - const: gpu
+            - const: pwr
+            - const: ref
+            - const: fuse
+    else:
+      properties:
+        clocks:
+          items:
+            - description: GPU clock
+            - description: Power clock
+            - description: Fuse clock
+
+        clock-names:
+          items:
+            - const: gpu
+            - const: pwr
+            - const: fuse
   - if:
       properties:
         compatible:
@@ -163,8 +190,9 @@ examples:
         interrupt-names = "stall", "nonstall";
         vdd-supply = <&vdd_gpu>;
         clocks = <&tegra_car TEGRA124_CLK_GPU>,
-                 <&tegra_car TEGRA124_CLK_PLL_P_OUT5>;
-        clock-names = "gpu", "pwr";
+                 <&tegra_car TEGRA124_CLK_PLL_P_OUT5>,
+                 <&tegra_car TEGRA124_CLK_FUSE>;
+        clock-names = "gpu", "pwr", "fuse";
         resets = <&tegra_car 184>;
         reset-names = "gpu";
         iommus = <&mc TEGRA_SWGROUP_GPU>;
-- 
2.53.0

