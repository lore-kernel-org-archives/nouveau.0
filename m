Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56149F53D7E
	for <nouveau@archiver.kernel.org>; Mon, 16 Mar 2026 17:36:46 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C4FB810E240;
	Mon, 16 Mar 2026 17:36:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=nppct.ru header.i=@nppct.ru header.b="n9C021Ht";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 904BE45152;
	Mon, 16 Mar 2026 17:25:58 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1773681958;
 b=h8eAAkj5tCmo3uFfXzTUr2nY3AE6MuFaqUibQw2x3G2G68wrIfn4XFnmdqpEdvDQIREt6
 e78SZCDU2dye9x8hSzE9SwZHjkF2WsaT+V6VywOIx7jQMK4T7SxV0VOmS+BtJwGN3sB9FOA
 javX15OTuMtXk7W/qdxlsJcAH3ugj9h56S1iPoLt/saKtInhB2rPNxgb5m0kZ+wzbvI4Cxq
 jcgX+SYSV5ubfN36DZ0rnBlg1dyEeCsJDlfOSBHSc6kEwLgpsFoZkhCxUHKPSM8F9BfO6pg
 YamYCugvPgNqg998tuN1zqUcMFxp8/H8ix3ajQqcR4dHVf76Xr69tydId0vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1773681958; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=L9VsafVwXH/MmAr7lP6kbNfDmElNR4KOX8hg5Vd8EBI=;
 b=0PtFfsWujsyXRDnKdzTTKg439DLJF/IPGO6PYLijIPt15yrVaJJ5zkzn8vEPS1OxnMKpq
 dBdofYRX3CDp8RRwDvaNZ/Lu8+R9Xjv+COYsFQTQgJbiW8g/K0Q6fcda0MH8HdJpNpSXjf7
 SHlDcJljWK3alSOpULddn7w9l6wHKm0w/qyuYANZ0o/RxQqnH3ociEGwRE8YhCrTRBEZL36
 t4IEX1Pvda3yFO3XLXJiRYNWpwtbuJHub/HmYuNDHseuJ9luiaaoQ3KUXKUDfIYpD1d3T2y
 jN9FqwLMN8M9HgxCCtEyLIUPFpVDrO4PsCPGiEd53tBeQ2WrelZgHPQkxyyA==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=nppct.ru;
  arc=none (Message is not ARC signed);
  dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=nppct.ru;
 arc=none (Message is not ARC signed); dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id E409345143
	for <nouveau@lists.freedesktop.org>; Mon, 16 Mar 2026 17:25:53 +0000 (UTC)
X-Greylist: delayed 594 seconds by postgrey-1.36 at gabe;
 Mon, 16 Mar 2026 17:36:38 UTC
Received: from mail.nppct.ru (mail.nppct.ru [195.133.245.4])
	by gabe.freedesktop.org (Postfix) with ESMTPS id AC4B010E211
	for <nouveau@lists.freedesktop.org>; Mon, 16 Mar 2026 17:36:38 +0000 (UTC)
Received: from mail.nppct.ru (localhost [127.0.0.1])
	by mail.nppct.ru (Postfix) with ESMTP id 4AFEE1C0F93
	for <nouveau@lists.freedesktop.org>; Mon, 16 Mar 2026 20:26:40 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nppct.ru; h=
	content-transfer-encoding:mime-version:x-mailer:message-id:date
	:date:subject:subject:to:from:from; s=dkim; t=1773681999; x=
	1774546000; bh=nRk+BqLXO6nRR7vlha6s+jbOBge8/EBwlJRvGcfgEEc=; b=n
	9C021HtLFcaOUEGwZSD7p9iTRZIhw2C8a2cG3G5pibg21PKSpV67UGxLM/XrWi6g
	WqEAZVcYsTvEtiOx2C6bIAeR9s3k5ZTXrzGvNgRUEn7V02s5L1TEUK6GWfokqQiy
	nVLrkUFvXGM9MqfEmaxlBSz/vtKzrk8zJ2B6Q5qMi0=
X-Virus-Scanned: Debian amavisd-new at mail.nppct.ru
Received: from mail.nppct.ru ([127.0.0.1])
	by mail.nppct.ru (mail.nppct.ru [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id zOQouRfYM7To for <nouveau@lists.freedesktop.org>;
	Mon, 16 Mar 2026 20:26:39 +0300 (MSK)
Received: from localhost.localdomain (unknown [87.249.24.51])
	by mail.nppct.ru (Postfix) with ESMTPSA id 12A001C0EE6;
	Mon, 16 Mar 2026 20:26:35 +0300 (MSK)
From: Alexey Nepomnyashih <sdl@nppct.ru>
To: Lyude Paul <lyude@redhat.com>
Subject: [PATCH] drm/nouveau/disp: Fix potential NULL pointer dereference in
 nouveau_dp_irq
Date: Mon, 16 Mar 2026 17:26:17 +0000
Message-ID: <20260316172631.82304-1-sdl@nppct.ru>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: JBAPNTRNSKHMXWJ4YGU3DSIZYNLIU5AC
X-Message-ID-Hash: JBAPNTRNSKHMXWJ4YGU3DSIZYNLIU5AC
X-MailFrom: sdl@nppct.ru
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Alexey Nepomnyashih <sdl@nppct.ru>, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Ben Skeggs <bskeggs@redhat.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 lvc-project@linuxtesting.org, stable@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/JBAPNTRNSKHMXWJ4YGU3DSIZYNLIU5AC/>
Archived-At: 
 <https://lore.freedesktop.org/20260316172631.82304-1-sdl@nppct.ru/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

nouveau_dp_irq() dereferences the encoder pointer before verifying
that it is valid. The drm pointer is initialized using
outp->base.base.dev prior to the NULL check:

  struct nouveau_drm *drm = nouveau_drm(outp->base.base.dev);

If no encoder is associated with the connector, this leads to a
NULL pointer dereference.

Move the drm initialization after the NULL check.

Fixes: 773eb04d14a1 ("drm/nouveau/disp: expose conn event class")
Cc: stable@vger.kernel.org
Signed-off-by: Alexey Nepomnyashih <sdl@nppct.ru>
---
 drivers/gpu/drm/nouveau/nouveau_dp.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_dp.c b/drivers/gpu/drm/nouveau/nouveau_dp.c
index 55691ec44aba..738802358d85 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dp.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dp.c
@@ -486,7 +486,7 @@ nouveau_dp_irq(struct work_struct *work)
 		container_of(work, typeof(*nv_connector), irq_work);
 	struct drm_connector *connector = &nv_connector->base;
 	struct nouveau_encoder *outp = find_encoder(connector, DCB_OUTPUT_DP);
-	struct nouveau_drm *drm = nouveau_drm(outp->base.base.dev);
+	struct nouveau_drm *drm;
 	struct nv50_mstm *mstm;
 	u64 hpd = 0;
 	int ret;
@@ -494,6 +494,8 @@ nouveau_dp_irq(struct work_struct *work)
 	if (!outp)
 		return;
 
+	drm = nouveau_drm(outp->base.base.dev);
+
 	mstm = outp->dp.mstm;
 	NV_DEBUG(drm, "service %s\n", connector->name);
 
-- 
2.43.0

