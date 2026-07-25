Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70EEAC531F9
	for <nouveau@archiver.kernel.org>; Sat, 25 Jul 2026 23:28:39 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9A7D910E12A;
	Sat, 25 Jul 2026 23:28:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="SsryXRgX";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 00838473BC;
	Sat, 25 Jul 2026 23:13:00 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1785021179;
 b=isUIklhqqy/ya/afHJQskjBUhfT8/5PHSEtbBxlC50iUad01FjAFgc1wv/qnQgTRDvtyd
 AFKJcIRFWEsSaYXrt5E126b51SiPJtUIEmA9JWQt6tmeDqnT27RbGUUBCvAWgTEvei41C2m
 FRfp9Hzw7Kq398bIT1y+ZOGQzIbpGCkTLF1aARDHzWIgE+g+WtL9u5alFqEfMz8r+g9aIkZ
 vUZH/pJK+FZTWslByaOsHvcLkErtwceObz1tw6MzmJxNlBU3AFNMDNq9fvSC0qn3CkxczpU
 lnIENXelci5X3VbZJmNMLZUGK+WltYiTQPMiSejLIvDY1rKv2nwbgHohxpqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1785021179; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=q3iylkBOAqbNzwa0ASyZyYXRtf8qeaj9DRYLgTr14g0=;
 b=AkYDUEHoBT4zw60F+XGOB+X0mnX80jeKD54BgAvCD+ZjsXDDFgUThhn2WtRVaQvGCtflO
 jbZxCKrvBdrVqYnxPbt3UY5ycKvjmSGDX1VDLlsJnZRB2Q9f59Uuu7SvmTPNYxHpWKVznVj
 3Xev2hkoFAz0OeY65fwQanrMFpTNXWSnVzFoUTCJHr+1cVV1CX6yk9upLmzy8XlpmHeaBzw
 neESuxOf/vrHH+GyY4FddGr3mfBTF+s6oD5vdDBNbjbNv+OQVc6iqsk+VwJ/GapHD7loRpE
 c03hC+qpZrbluums0O69Nw//KwZJkzPsfebbx71lqnxtDO63rU04YgjSElFA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 39FB446F74
	for <nouveau@lists.freedesktop.org>; Sat, 25 Jul 2026 23:12:57 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2D6CD10E11C;
	Sat, 25 Jul 2026 23:28:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8EA98403A3;
	Sat, 25 Jul 2026 23:28:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 51C30C2BCB8;
	Sat, 25 Jul 2026 23:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785022114;
	bh=hsb0sG3xQrzIWfbMpLDW2y2O5saBGuPW7KlD/qWLdy0=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=SsryXRgX4UQ+dWepb1sFPKMiu/UTlfG6m9lvRauTsnh6AA5b4GCUwXsVWxqHeRvWA
	 k8usURVqIUOY0d/0opV7fbsNK6/9rGLIqTlzHUY8WVnINeUaskTWC81Ferhx8ZLrfu
	 pIi4EOIjaBCycm2SgSoKORLSAbXJecbr6trDhuK9epOCeQOfWgMHx4bswJBIdVCCs1
	 3SdfVEwAhZk0b6gVLC+aWIX9cYAXTRd9HViNYDVa5dqLFvncgtQGo820RN/8r/aGET
	 /8U38lIqEGR8haH7upNEsu5WZ+dv1EVW9OzykDoYbnE2QLlY8R1CEjIv8BVr4DlJoz
	 UjYYlMiYIp39Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2850CC531F9;
	Sat, 25 Jul 2026 23:28:34 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Sat, 25 Jul 2026 18:28:32 -0500
Subject: [PATCH RFC] drm/nouveau: Use write-combined maps for coherent on
 Tegra
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260725-tegra-coherent-wc-v1-1-dfdcc929c21b@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDcyNT3ZLU9KJE3eT8jNSi1LwS3fJkXUNLSxPDFMNE00QzAyWgvoKi1LT
 MCrCZ0UpBbs5KsbW1AA2ZuwFoAAAA
X-Change-ID: 20260725-tegra-coherent-wc-19941d1a5a60
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785022113; l=1746;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=xGh6pnkZaocwOU8pE4vCOlQMWxF+mRIdr+h8cac+BR8=;
 b=sZmYcD/8oqKCgPrreK+uUgwVNQC8Jhvg4Efd/oYQ2kQl27ZNYV1yAG5oJGt6ob13Hf9ei1CYJ
 FamnB0RS4/7Bo+AHo4Uv/Koyj/a4UZPu1n3Z6O1Iyb6aXJKPXnmi/sJ
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Message-ID-Hash: LVCHFLZIQE7RXJ4N5P2AVSVK2EWVBQCW
X-Message-ID-Hash: LVCHFLZIQE7RXJ4N5P2AVSVK2EWVBQCW
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/LVCHFLZIQE7RXJ4N5P2AVSVK2EWVBQCW/>
Archived-At: 
 <https://lore.freedesktop.org/20260725-tegra-coherent-wc-v1-1-dfdcc929c21b@gmail.com/>
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

Signed-off-by: Faith Ekstrand <faith.ekstrand@collabora.com>
Co-developed-by: Aaron Kling <webgeek1234@gmail.com>
Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
This patch is marked RFC because there is not complete confidence that
the change is correct. Without this change, nouveau can easily hit
sigbus errors in Android UI rendering via nvk or running vulkan deqp
tests on Tegra. Changing coherent maps to use write-combined stops the
crashing, but it is unknown what the performance impact is, if any.
---
 drivers/gpu/drm/nouveau/nouveau_sgdma.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_sgdma.c b/drivers/gpu/drm/nouveau/nouveau_sgdma.c
index fa3b4ebf38a83..10f6ef1c541bd 100644
--- a/drivers/gpu/drm/nouveau/nouveau_sgdma.c
+++ b/drivers/gpu/drm/nouveau/nouveau_sgdma.c
@@ -72,9 +72,12 @@ nouveau_sgdma_create_ttm(struct ttm_buffer_object *bo, uint32_t page_flags)
 	struct nouveau_sgdma_be *nvbe;
 	enum ttm_caching caching;
 
-	if (nvbo->force_coherent)
-		caching = ttm_uncached;
-	else if (drm->agp.bridge)
+	if (nvbo->force_coherent) {
+		if (drm->client.device.info.platform == NV_DEVICE_INFO_V0_SOC)
+			caching = ttm_write_combined;
+		else
+			caching = ttm_uncached;
+	} else if (drm->agp.bridge)
 		caching = ttm_write_combined;
 	else
 		caching = ttm_cached;

---
base-commit: 1a1757b76427f6201bfe0bf1bea9f7574f332a93
change-id: 20260725-tegra-coherent-wc-19941d1a5a60

Best regards,
-- 
Aaron Kling <webgeek1234@gmail.com>


