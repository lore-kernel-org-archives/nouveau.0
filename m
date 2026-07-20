Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 646D3C44515
	for <nouveau@archiver.kernel.org>; Mon, 20 Jul 2026 21:52:19 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4040C10E213;
	Mon, 20 Jul 2026 21:52:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="g/1uCsF+";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 1DABA47274;
	Mon, 20 Jul 2026 21:36:52 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1784583411;
 b=TM51xUscAcm4GtcXv1sgPyUclEcgsuEZKRXhnEOCeUfUzWL6PB/XqRK5rDkkZ4Xj+aUgB
 5t5BpoM/tWCRXw+H54BwGRYIvlDn5V53/s1IdidAu8xnv7yVb6jClsi5FiSXqFWOPfLXLcZ
 MAmsa8da+5U490YOa2ifuz/4g8V2jgEid+b1K8Qcju4XFngQnug8Aa4uaeh0ZB4g0TNG5hH
 3nxJrVDZo4y/SHv+RhlM2mAien81pOhGbDH9c+KamYDJOhIK8MmgBZWwGUOGmph+8PrtneL
 X29HAAmxlylTulI4HMp2+SUiJKHmj1z4ALGkBTjGKnhMaAyq9tr7nbePmXog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1784583411; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=4Abm8mO2p2VoBX8nFEzar8JO9CYwOTrVGq6n2nwojj8=;
 b=Z9CH2F2APnmjoRPba8zbuikXvSTrou21xpbwp9euxBeNUwh1eU+GTnmSD9BGDtnZX4Yg+
 lAm2pbbIGEkJIbvciFPp4hO6CCNG7fXcmbjSqV23FKnOR68ke0AiFV/bbSeI1fwbBr9OX/5
 z2XjMlttghtpmovoJ7sCPQvJ9A5FEVFiYCnQNIOpXYDWI/6Du345+k8rmn6fggCXTrLynVS
 FgUsNlNwUv+5pea0h8dL5Lr4UoQVeQ14d1JBjVsW6VC8nsZpl3h8t4NU1zwrWuDa/PdX0+U
 xGDxLjnMtmxG3+jEOagbBPfOQe9txa/IZo33Y4c1KzOPgedOZFYnQrXLkWnQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 2A34F47266
	for <nouveau@lists.freedesktop.org>; Mon, 20 Jul 2026 21:36:49 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 07F9A10E1EB
	for <nouveau@lists.freedesktop.org>; Mon, 20 Jul 2026 21:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784584335;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4Abm8mO2p2VoBX8nFEzar8JO9CYwOTrVGq6n2nwojj8=;
	b=g/1uCsF+vdsWY5dAjMbykvSWXDO8ESirZJBI5OrIT5C5IEgq7yMpyFACcKo/5zTChHyMKn
	YuAw+zvyG1+agKmurkAIbHF551X82UMfvFFqwoB3XFWfZV8xxEnVISkaliIS9q4GBpQez0
	XD19RsrOTX8P9N31BKIFC3WUqellvF0=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-82-WZdwZoT7NWSdinl9n9f_vA-1; Mon,
 20 Jul 2026 17:52:10 -0400
X-MC-Unique: WZdwZoT7NWSdinl9n9f_vA-1
X-Mimecast-MFC-AGG-ID: WZdwZoT7NWSdinl9n9f_vA_1784584328
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 4546C1964CD2;
	Mon, 20 Jul 2026 21:52:08 +0000 (UTC)
Received: from GoldenWind.redhat.com (unknown [10.22.88.114])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id DA1F1180075F;
	Mon, 20 Jul 2026 21:52:05 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/3] drm/nouveau/kms/nv50-: Introduce
 nv50_wndw_default_state()
Date: Mon, 20 Jul 2026 17:36:17 -0400
Message-ID: <20260720215058.398210-3-lyude@redhat.com>
In-Reply-To: <20260720215058.398210-1-lyude@redhat.com>
References: <20260720215058.398210-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-MFC-PROC-ID: hOM48j7ldoXYFturNZI5gsmKryht6RkdeuHYJq1nkJo_1784584328
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: BY6IAJWQQA3LULTMIWXGQZSUSEYPJSOT
X-Message-ID-Hash: BY6IAJWQQA3LULTMIWXGQZSUSEYPJSOT
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: Faith Ekstrand <faith.ekstrand@collabora.com>,
 Dave Airlie <airlied@redhat.com>,
 Leandro Ribeiro <leandro.ribeiro@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Marco Crivellari <marco.crivellari@suse.com>, Kees Cook <kees@kernel.org>,
 Simona Vetter <simona@ffwll.ch>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Maxime Ripard <mripard@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Jani Nikula <jani.nikula@intel.com>, Daniel Stone <daniels@collabora.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/BY6IAJWQQA3LULTMIWXGQZSUSEYPJSOT/>
Archived-At: 
 <https://lore.freedesktop.org/20260720215058.398210-3-lyude@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

While we don't currently read-in the hardware state of planes, now that
we're about to start exposing blend properties for all planes that can
support alpha channels: We need to make sure that the initial atomic state
for a wndw always starts off with a supported value in pixel_blend_mode.

The easiest way to do this is to introduce a nv50_wndw_default_state()
function, and use it in nv50_display_read_hw_state() - and use that
function to enforce a valid value for pixel_blend_mode during driver
startup.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Fixes: 860e748bddcc ("drm: ensure blend mode supported if pixel format with alpha exposed")
---
V3:
* Fix incorrect bitmask checking in nv50_wndw_default_state()

 drivers/gpu/drm/nouveau/dispnv50/disp.c |  4 ++++
 drivers/gpu/drm/nouveau/dispnv50/wndw.c | 22 ++++++++++++++++++++++
 drivers/gpu/drm/nouveau/dispnv50/wndw.h |  1 +
 3 files changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 364227f5456f1..2c66e480b5116 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -2768,6 +2768,7 @@ nv50_display_read_hw_state(struct nouveau_drm *drm)
 {
 	struct drm_device *dev = drm->dev;
 	struct drm_encoder *encoder;
+	struct drm_plane *plane;
 	struct drm_modeset_acquire_ctx ctx;
 	struct nv50_disp *disp = nv50_disp(dev);
 	int ret;
@@ -2781,6 +2782,9 @@ nv50_display_read_hw_state(struct nouveau_drm *drm)
 		nv50_display_read_hw_or_state(dev, disp, nouveau_encoder(encoder));
 	}
 
+	drm_for_each_plane(plane, dev)
+		nv50_wndw_default_state(nv50_wndw(plane));
+
 	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
 }
 
diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndw.c b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
index 2635458d52acc..dfa1ba45acd99 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/wndw.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
@@ -848,6 +848,28 @@ static const u64 nv50_cursor_format_modifiers[] = {
 	DRM_FORMAT_MOD_INVALID,
 };
 
+/*
+ * Setup defaults for the atomic wndw state
+ */
+void
+nv50_wndw_default_state(struct nv50_wndw *wndw)
+{
+	struct nv50_wndw_atom *armw = nv50_wndw_atom(wndw->plane.state);
+	const unsigned int blend_modes = wndw->func->blend_modes;
+
+	drm_modeset_lock_assert_held(&wndw->plane.mutex);
+
+	/* Ensure the plane's atomic state didn't default to a pixel_blend_mode we don't support */
+	if (blend_modes && (!(BIT(armw->state.pixel_blend_mode) & blend_modes))) {
+		if (blend_modes & BIT(DRM_MODE_BLEND_COVERAGE))
+			armw->state.pixel_blend_mode = DRM_MODE_BLEND_COVERAGE;
+		else if (blend_modes & BIT(DRM_MODE_BLEND_PREMULTI))
+			armw->state.pixel_blend_mode = DRM_MODE_BLEND_PREMULTI;
+		else if (blend_modes & BIT(DRM_MODE_BLEND_PIXEL_NONE))
+			armw->state.pixel_blend_mode = DRM_MODE_BLEND_PIXEL_NONE;
+	}
+}
+
 int
 nv50_wndw_new_(const struct nv50_wndw_func *func, struct drm_device *dev,
 	       enum drm_plane_type type, const char *name, int index,
diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndw.h b/drivers/gpu/drm/nouveau/dispnv50/wndw.h
index 81af5c3369d4c..13f06b7b67611 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/wndw.h
+++ b/drivers/gpu/drm/nouveau/dispnv50/wndw.h
@@ -46,6 +46,7 @@ void nv50_wndw_flush_clr(struct nv50_wndw *, u32 *interlock, bool flush,
 			 struct nv50_wndw_atom *);
 void nv50_wndw_ntfy_enable(struct nv50_wndw *, struct nv50_wndw_atom *);
 int nv50_wndw_wait_armed(struct nv50_wndw *, struct nv50_wndw_atom *);
+void nv50_wndw_default_state(struct nv50_wndw *wndw);
 
 struct nv50_wndw_func {
 	int (*acquire)(struct nv50_wndw *, struct nv50_wndw_atom *asyw,
-- 
2.55.0

