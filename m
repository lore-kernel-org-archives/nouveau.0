Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC317C44508
	for <nouveau@archiver.kernel.org>; Wed, 21 Jan 2026 19:13:36 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 47AA210E876;
	Wed, 21 Jan 2026 19:13:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Ha1fmR0x";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 1DC05401CE;
	Wed, 21 Jan 2026 19:04:49 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1769022288;
 b=TTQBfTQ79ARUKGqPG80Z7EkAM2tgvqTlmcriSYdNSon+zhpRIGE91dl5vpU11FS/85kCh
 W/A0o15+5z/JMScf2y/m9Rqi14T5Su+dASH9rJrSXQMs8QbUQtP9S4mrDDyoESc/mGmNpWQ
 I+yJvh3Z4+9V298mVtHiCj+Dau5pQ0X5dK4rTjDNpduJV/zxuM45OCfLrodNRpn+ZlMAqQx
 GUa/QRXTtIne7b33qHxK36gxAEwZa65VZ/+u76MazzaNume59fpfoZhqRzOn4QeuBbo+BSy
 W5OuF+sQNNCIor/EZZGKv5Yf0l7VaeEIVc1UEKc8Kt11aFU+//qzHJUSLFYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1769022288; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=49OPiVw3AsdRRD7f8ruuY3VOWZX2Ei/vee0/0X9WHUQ=;
 b=evbkZ224kFpV0yGWVs6+8+drUzlm40WUszxG4y8hmQIdeAXDEqewDnR0Nrr/J6t978mH+
 aEubBu/XB0YkqpQYk2taDnKMSOqdBxbbge6ODuZ6Eo7TSRwK9ARlfbXNrsp8Qh0/qhR3d9C
 QzMoBpUMHFNKuGFBM32EnBzD1WCSu0fHplCtbj/erBIE0FCaOzzWobqSpfrq0eIxuozRCYO
 wfrQaLS4rrIvfaYCsZCu4hTYClKydfRxC1QPomZWoMBhA6HScpI/ksfxCa3YgElE8dNea2p
 BhIWRgoP+YAMwO4IgwL2ZsQNEDoV9kPvxAadMTE06h/8+SORCG46UKWr2pBw==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=redhat.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=redhat.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=redhat.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=redhat.com
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 237DF400A8
	for <nouveau@lists.freedesktop.org>; Wed, 21 Jan 2026 19:04:46 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 029E010E86E
	for <nouveau@lists.freedesktop.org>; Wed, 21 Jan 2026 19:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769022812;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=49OPiVw3AsdRRD7f8ruuY3VOWZX2Ei/vee0/0X9WHUQ=;
	b=Ha1fmR0xH4R0ppz97wSUtlPpH5mlRBLvmzcj5GA7ZnHNZQNP7oOVaCm0G7+PrmNpmvzQqN
	pcgtc4AYVlnY1hpAhbko+uWOCGQ18jk+8kWbwzUX2tfbm/vI2+iTBlyR2+jTR2J2JSVYGg
	+pziAtF8j8XLkkF2rPLx4keoUv3m/GM=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-675-mD4iWvf3PWi6QrpwgzgEdQ-1; Wed,
 21 Jan 2026 14:13:26 -0500
X-MC-Unique: mD4iWvf3PWi6QrpwgzgEdQ-1
X-Mimecast-MFC-AGG-ID: mD4iWvf3PWi6QrpwgzgEdQ_1769022805
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id A85FC1800451;
	Wed, 21 Jan 2026 19:13:24 +0000 (UTC)
Received: from GoldenWind.redhat.com (unknown [10.22.89.232])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id A32CE19560AB;
	Wed, 21 Jan 2026 19:13:22 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	nouveau@lists.freedesktop.org
Subject: [PATCH] drm/nouveau/disp: Set
 drm_mode_config_funcs.atomic_(check|commit)
Date: Wed, 21 Jan 2026 14:13:10 -0500
Message-ID: <20260121191320.210342-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Message-ID-Hash: GCHSGOHM7MR3SUCCBE74OKIHKLJVZS2H
X-Message-ID-Hash: GCHSGOHM7MR3SUCCBE74OKIHKLJVZS2H
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: stable@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Simona Vetter <simona@ffwll.ch>, Maxime Ripard <mripard@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/GCHSGOHM7MR3SUCCBE74OKIHKLJVZS2H/>
Archived-At: 
 <https://lore.freedesktop.org/20260121191320.210342-1-lyude@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Apparently we never actually filled these in, despite the fact that we do
in fact technically support atomic modesetting.

Since not having these filled in causes us to potentially forget to disable
fbdev and friends during suspend/resume, let's fix it.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Cc: stable@vger.kernel.org
---
 drivers/gpu/drm/nouveau/nouveau_display.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
index 00515623a2cc7..829c2b573971c 100644
--- a/drivers/gpu/drm/nouveau/nouveau_display.c
+++ b/drivers/gpu/drm/nouveau/nouveau_display.c
@@ -352,6 +352,8 @@ nouveau_user_framebuffer_create(struct drm_device *dev,
 
 static const struct drm_mode_config_funcs nouveau_mode_config_funcs = {
 	.fb_create = nouveau_user_framebuffer_create,
+	.atomic_commit = drm_atomic_helper_commit,
+	.atomic_check = drm_atomic_helper_check,
 };
 
 

base-commit: 68b271a3a94cfd6c7695a96b6398b52feb89e2c2
-- 
2.52.0

