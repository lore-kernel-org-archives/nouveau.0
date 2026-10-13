Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CEEFCC6B12
	for <nouveau@archiver.kernel.org>; Tue, 13 Oct 2026 14:52:29 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 50AC810E8E5;
	Tue, 13 Oct 2026 14:52:22 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 561A748A70;
	Tue, 13 Oct 2026 14:33:47 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1791902027;
 b=Sj5NBdHchLSbYD1S3P67Qb8tiLBgzCuS82Sd+5r3riKeOFbWd1bcR56DNehy1Py4y7eHF
 /yHlTtq44zftLcZ6XAUECAB2ZWFc4hU5lf3/7J8hdM7+MSZJVVZAA4AkqBmFS987sy9zqzK
 4hDMe749yRaahECoZG9JzDCoTZR8lAxy6rYXwEw/XYysTD7FeBPJpnTXzRUABVfEeX8ryRN
 PSu8bHf6ntxl+RyIhTS8JeydYqdELAqsRnhSuiML2nuAFSOsKkCE3IoELRSKXOYwbi+gkN0
 k9nkwIX+PthXoED8ZxWXv/tMkeChnlEnXTuqwpq+NQ19uYaolt4tRCtnZvOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1791902027; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=kYokskwFXqmZbxKXA0hYcmteDiHu4dzWazXznQi6jas=;
 b=mQ5LYXjYFTckGO5RacXpNr/+MCCDoXW/bRjNtw1HNUcW3lYM1/1qKagT54QCQ/zMsjEnE
 V0Qkcd4K0rnJbx7TEtQGHZSbcCqcFCllBXW1uj71aAdXHRgJbXjf03PyWDUwdrVfUMkgS3z
 VXkcishcCPdd8Z5KcGJt6dxwDwmnLWuzVNtceX1feZAME81KlauUo5q5/s4+anv89UdRHwe
 TbQvrWXNL7xeT3HPKMHwQtj7yp6ZgbJdxA9//rZajQ2fePjtaKfC9171Td77fCl9xakAam+
 cOG3HAIvgoflYbq22G4J1CvpNIyhDYs+HqcO8qru1CtD3q7rG22GL9ZTtegg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 97F7C48530
	for <nouveau@lists.freedesktop.org>; Tue, 13 Oct 2026 14:33:44 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 480BB10E00F;
	Tue, 13 Oct 2026 14:52:14 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 760D460A52;
	Tue, 13 Oct 2026 14:52:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 276071F000FF;
	Tue, 13 Oct 2026 14:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791903133;
	bh=kYokskwFXqmZbxKXA0hYcmteDiHu4dzWazXznQi6jas=;
	h=From:To:Cc:Subject:Date;
	b=maz/NfDLUqWVk46kbQMUYi+byb8hig2awtRci3j40GQMdgpsPuS0sCFthj5FFvq1n
	 WBd+9CZfIpchLU1v2GvSoK418B55YxWRRVnYYJVBYdjT5KEAW3+IM0AchnSIuo3yaA
	 w0hymCfISUgZUKjEHm1Xc2oh30ec4DIi890rilGsmcqHM9p3/NuNe88UKXFgWlRObE
	 Gm8+In9FCU9xPAZlJ6EiJ1gnKqqt3neOvnQsDDduqrMA3v3KWZqcRFdNjyd9dsAqLJ
	 WgI1UXnTeXyC6Cq5jiqiQ7F6914ahbIIdPSttuKaJwiGHVjlFGljGu9DaRq5Ne5Q3v
	 as4m/OI4y0Slw==
From: Sasha Levin <sashal@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH 1/3] dt-bindings: gpu: nvidia,gk20a: Allow a fuse clock after
 the reference clock
Date: Tue, 13 Oct 2026 10:52:08 -0400
Message-ID: <20261013145210.103565-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 3FHH5KUX7ZJ34CCU7OMTEBDSJZLTW3HZ
X-Message-ID-Hash: 3FHH5KUX7ZJ34CCU7OMTEBDSJZLTW3HZ
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/3FHH5KUX7ZJ34CCU7OMTEBDSJZLTW3HZ/>
Archived-At: 
 <https://lore.freedesktop.org/20261013145210.103565-1-sashal@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

GM20B needs both its reference clock and the fuse clock while it is
powered, so allow "fuse" as a fourth clock after "ref".

Assisted-by: LLM
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 Documentation/devicetree/bindings/gpu/nvidia,gk20a.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpu/nvidia,gk20a.yaml b/Documentation/devicetree/bindings/gpu/nvidia,gk20a.yaml
index 4d856a8b674c..ecbc20e6adec 100644
--- a/Documentation/devicetree/bindings/gpu/nvidia,gk20a.yaml
+++ b/Documentation/devicetree/bindings/gpu/nvidia,gk20a.yaml
@@ -44,6 +44,7 @@ properties:
       - description: GPU clock
       - description: Power clock
       - description: Reference or fuse clock
+      - description: Fuse clock
 
   clock-names:
     minItems: 2
@@ -51,6 +52,7 @@ properties:
       - const: gpu
       - const: pwr
       - enum: [ ref, fuse ]
+      - const: fuse
 
   resets:
     maxItems: 1
-- 
2.43.0

