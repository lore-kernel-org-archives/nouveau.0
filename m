Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B1C2C5DF8C
	for <nouveau@archiver.kernel.org>; Sat, 22 Aug 2026 04:43:31 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B9F0D10E3A1;
	Sat, 22 Aug 2026 04:43:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="CVVJdcy+";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id E43B147B0F;
	Sat, 22 Aug 2026 04:26:51 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1787372811;
 b=N6l+5CCCuE9vBgNkC/LvtzL3cFXVbI81mbVB7ZM1yFXqMIbsI9aZ45bV2Mx1D9M/l0s+E
 Oj/Vr3QyOrmX/PQsVjMJuWPWd1k2tWQMXScDbHZ3ByRHd3TkA+VBjhC4pZfNlr5AADVIWjP
 sPVpOV3vrkzDS7FFXnDkj+itvCrghChBaDBBbpYAAvtpp/AtDe/5tqhvvre+XwlI0Nw9RLI
 /9vqJRrXAJBikXUcFC2WM9OURRB8xlPZOZngnHzniP6OZLEut+IJCgrdiT/Fzc5TO6lKsZk
 BBrFndlWt1w+Xwz/rfsYPWdT+7rf3qlSdm7SoUZLDcU4FNcfycUc30GSuF5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1787372811; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=lOebG8ciTox8+O2cpg7yilpMa2MvN7jgmERTQ8MdlCc=;
 b=klDUyKiRp0RqFplf++KrNmz0fORIlWfs9dcl31wm9EnPvYVGMSXiqZVYKhDTnt8n0M1jg
 R0u5oylKTLhFqEJFxHk3fMQJe0+TuCuSyfNglOkood9rSjDZcqHf0Z/h0U/03wLTfRvv46P
 UqWZ4WymLp/RBx9sXrIcbwioWNCBsgp4Qypo1nmUcah+rWo1hjfrLihzYfQi9OmyMKL6OMK
 WXQ0LCHrPwgxE9Tcz/QCzDaRTbHKKT8sTDmNDBT4tJDye/RsADM/ATZZsQ5CK0+w+DUHbBw
 xK6qj5W3McQfrPXX2sVC6NhaoW7cg6Ks+Q3oWBIURQC4bGw9gsphWeHpOBDg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 9F924473C8
	for <nouveau@lists.freedesktop.org>; Sat, 22 Aug 2026 04:26:48 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 16F3410E38C;
	Sat, 22 Aug 2026 04:43:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EDC19600E2;
	Sat, 22 Aug 2026 04:43:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7C11DC2BCB8;
	Sat, 22 Aug 2026 04:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787373805;
	bh=JzOcZ/Tb7M5I13Crk4COYLtOJLFMvFLaEr7Wvye8qMw=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=CVVJdcy+70G/P7byX90dR7gX6Z7OmdNW+OFqCz/BNdedmxLYJxogNI0SbqQwmUlok
	 PnZqAGXQfKYRXv5oGEi8GdLT2zGCdbEuDzQ2Pul7FU1JSFpPt8W+Z6of3XvX65BA5z
	 fPEbp+QX3FWVYJA+Xns9FhwhseQ+kjvrO7IXdaRz1BtT7bRcoSr5lh5hinOCLv0kyK
	 Yx6ewqVX2lH8qMcHBKfRtg7bUbd/+YrZJr9vFamHCaWNB8XoY/N9TK0+w1Fiu1ZEHt
	 neg4oJCjXvpQg5DW3Dl9yRHyQfvoVg0sO0fTC4/g3rYhkaJNSJjka4wsTf+PPTXoBw
	 JL63OnXXQfJ6A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54CEFC5DF8C;
	Sat, 22 Aug 2026 04:43:25 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Fri, 21 Aug 2026 23:42:59 -0500
Subject: [PATCH v2] drm/nouveau: Use write-combined maps for coherent
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-tegra-coherent-wc-v2-1-2b1ddb67bf18@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32NQQ6CMBBFr0Jm7RimEUxdeQ/Dok4HmESoaRvUE
 O5u5QAu30v++yskiSoJLtUKURZNGuYC5lABj24eBNUXBlObtj6bBrMM0SGHUaLMGV+MZO2JPLn
 GtTWU3TNKr++9eesKj5pyiJ/9YqGf/VdbCAl975mtsWzofh0mp48jhwm6bdu+iwT7VbIAAAA=
X-Change-ID: 20260725-tegra-coherent-wc-19941d1a5a60
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787373804; l=1825;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=6HYeU8KylnBhcnrcZPOXIGFiI2xLSNaxtWKW6C5P3EY=;
 b=E+K0KUreTCalBE7SgwbmAoYYgW1vWcIP+4h8O5xvCnM/Xw/+v3R7Ojy+JrPJaTgM+vbqU6QDQ
 TqOCd3WkGgIDuzAuBIfm4z/IH0L8P9txEOi2/citcAVSjvqvuIRgS7A
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Message-ID-Hash: P7YGOBQNCS5VIXJE7BRE7Y7GDQ77FNFT
X-Message-ID-Hash: P7YGOBQNCS5VIXJE7BRE7Y7GDQ77FNFT
X-MailFrom: devnull+webgeek1234.gmail.com@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Faith Ekstrand <faith.ekstrand@collabora.com>,
 Aaron Kling <webgeek1234@gmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
Reply-To: webgeek1234@gmail.com
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/P7YGOBQNCS5VIXJE7BRE7Y7GDQ77FNFT/>
Archived-At: 
 <https://lore.freedesktop.org/20260821-tegra-coherent-wc-v2-1-2b1ddb67bf18@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

From: Faith Ekstrand <faith.ekstrand@collabora.com>

On Tegra devices, uncached maps traslate to device memory, causing
unaligned accesses by userspace resulting in a SIGBUS. Instead, use
write-combined maps to ensure proper access.

This would also affect discrete cards on any Arm device. It was
determined that discrete cards regardless of cpu arch should use
write-combined maps for coherent anyways. Thus this change is made for
all gpu types.

Signed-off-by: Faith Ekstrand <faith.ekstrand@collabora.com>
Co-developed-by: Aaron Kling <webgeek1234@gmail.com>
Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
Without this change, nouveau can easily hit sigbus errors in the Android
UI rendering via nvk or running vulkan deqp tests on Tegra. Changing
coherent maps to use write-combined stops the crashing.
---
Changes in v2:
- Set write-combined for coherent on all gpu types
- Link to v1: https://lore.kernel.org/r/20260725-tegra-coherent-wc-v1-1-dfdcc929c21b@gmail.com
---
 drivers/gpu/drm/nouveau/nouveau_sgdma.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_sgdma.c b/drivers/gpu/drm/nouveau/nouveau_sgdma.c
index fa3b4ebf38a83..2bd0376193aee 100644
--- a/drivers/gpu/drm/nouveau/nouveau_sgdma.c
+++ b/drivers/gpu/drm/nouveau/nouveau_sgdma.c
@@ -72,9 +72,7 @@ nouveau_sgdma_create_ttm(struct ttm_buffer_object *bo, uint32_t page_flags)
 	struct nouveau_sgdma_be *nvbe;
 	enum ttm_caching caching;
 
-	if (nvbo->force_coherent)
-		caching = ttm_uncached;
-	else if (drm->agp.bridge)
+	if (nvbo->force_coherent || drm->agp.bridge)
 		caching = ttm_write_combined;
 	else
 		caching = ttm_cached;

---
base-commit: 903c1cf6dff9964e71eda98a39e2e5d442050472
change-id: 20260725-tegra-coherent-wc-19941d1a5a60

Best regards,
-- 
Aaron Kling <webgeek1234@gmail.com>


