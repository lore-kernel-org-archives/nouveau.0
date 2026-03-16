Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AAD3F53D87
	for <nouveau@archiver.kernel.org>; Mon, 16 Mar 2026 18:43:00 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id BDF7910E436;
	Mon, 16 Mar 2026 18:42:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=nppct.ru header.i=@nppct.ru header.b="DcgyILUC";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 72B9445146;
	Mon, 16 Mar 2026 18:32:12 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1773685932;
 b=atOgG4p5ushzubrLjpZPAv3bkSAhS1CVRwpUHzlfwUjRTYCSopNFZshasEp/UF4MZV0mi
 NX1hiJx/7Bix62nYkM/UFYjwqXxtT47wWuRHt3wE/H29zUCB6JjPEmqNRAWW284vo4uRr2D
 yddl9MXOSyiLWtPTJ3JYMH0neG/eSZl7OsuZhJsVfpM4ellZV5eOgAzjI/JbkC2Ey/pt29g
 VVbfF37eqV0xYiTdOHuu2zrXYZwpBzSra2XKKDLEMjwrE6TO8iS4J7EHY7bnZva4hObpoNa
 pJ8fYsLXxdilLRHBbduwA+7Fl68tkYmwvzQg6FJUbu+2d0O+SGmelfhvQbSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1773685932; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=K9lgjsrB0kJJR7dznSWCWnv4S19Sf/zJUfVR3e+tP7w=;
 b=tgNIXr1F+c5wtOH42Qeymb6fsvWEGYd0x9wPlVfpagQkNww1PINNHl6goWzI9+gzJU4Zm
 2OCj2F/rPu6of+00lkHiLFFTWQwqnE4cdcNrKtSTXl7uX1ZfWDthDHf29p3XQgDYJowMhGV
 1MPEGTUqFdUC2oDMfBDI26ftuCrKYPfPb2VrunvAXwErQw/s0F+czV8vn4reuWjVrk04SIc
 rPhEMQ9KSpmOnio9wXesngHlWgpgDvbe2fs1qN7J6GLu2F78RQN+79PUibOjnnwUNoEmZUh
 VrSMdS2qtrVebXQ2H1TSKQHwYYnWjWAUIwEyC3H4sxUWO1NakpXgJJs3L3Qg==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=nppct.ru;
  arc=none (Message is not ARC signed);
  dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=nppct.ru;
 arc=none (Message is not ARC signed); dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 715B843790
	for <nouveau@lists.freedesktop.org>; Mon, 16 Mar 2026 18:32:08 +0000 (UTC)
Received: from mail.nppct.ru (mail.nppct.ru [195.133.245.4])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 83E3C10E3D5
	for <nouveau@lists.freedesktop.org>; Mon, 16 Mar 2026 18:42:53 +0000 (UTC)
Received: from mail.nppct.ru (localhost [127.0.0.1])
	by mail.nppct.ru (Postfix) with ESMTP id 2B1411C0F92
	for <nouveau@lists.freedesktop.org>; Mon, 16 Mar 2026 21:42:52 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nppct.ru; h=
	content-transfer-encoding:mime-version:x-mailer:message-id:date
	:date:subject:subject:to:from:from; s=dkim; t=1773686564; x=
	1774550565; bh=3sBY4tW9sUTsq5I04TqNM0MDdmo2tDC1vEIhnJUCkOE=; b=D
	cgyILUCib+JY8B85kCutNSotfzh4wrV6lcqQ/yR3yzage8Hl25Z5RV0uvIL4ZSjB
	Z4OwRowCrM4y8st+CPhCdZXkdhuh7b9Lcoi/7MhpGUFu3BXUOEj7aRByzaDW+ihI
	gOCtnH/RdopOlvQjmb4JhsDPVf/GeHnW47Cc/kHhQI=
X-Virus-Scanned: Debian amavisd-new at mail.nppct.ru
Received: from mail.nppct.ru ([127.0.0.1])
	by mail.nppct.ru (mail.nppct.ru [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id wwNxooYKQOsG for <nouveau@lists.freedesktop.org>;
	Mon, 16 Mar 2026 21:42:44 +0300 (MSK)
Received: from localhost.localdomain (unknown [87.249.24.51])
	by mail.nppct.ru (Postfix) with ESMTPSA id 224FB1C0E83;
	Mon, 16 Mar 2026 21:41:59 +0300 (MSK)
From: Alexey Nepomnyashih <sdl@nppct.ru>
To: Lyude Paul <lyude@redhat.com>
Subject: [PATCH v2] drm/nouveau/disp: Fix potential NULL pointer dereference
 in nouveau_dp_irq
Date: Mon, 16 Mar 2026 18:41:41 +0000
Message-ID: <20260316184143.82894-1-sdl@nppct.ru>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 5JG2IJ3KD6P5UM3JCEPJ4LTSGSMHGW5L
X-Message-ID-Hash: 5JG2IJ3KD6P5UM3JCEPJ4LTSGSMHGW5L
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/5JG2IJ3KD6P5UM3JCEPJ4LTSGSMHGW5L/>
Archived-At: 
 <https://lore.freedesktop.org/20260316184143.82894-1-sdl@nppct.ru/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

The issue was discovered through static analysis after reviewing changes
introduced by commit 773eb04d14a1 ("drm/nouveau/disp: expose conn event
class"). Function nouveau_dp_irq() dereferences the encoder pointer before
verifying that it is valid. The drm pointer is initialized using
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

