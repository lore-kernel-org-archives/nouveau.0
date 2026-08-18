Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 876FBC5DF81
	for <nouveau@archiver.kernel.org>; Tue, 18 Aug 2026 23:56:59 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6037210EC08;
	Tue, 18 Aug 2026 23:56:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="TYbpDdhH";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id ACD9B47924;
	Tue, 18 Aug 2026 23:40:27 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1787096427;
 b=p8w7e3axcFcOLT5LpVDR+69ZYs7Dl2DflCmzhVJU/wts/GFvRibOtnvJF3cjKmiDs2yU9
 wGZ4v24P8OL/PF9YPrsMnQxHjJJVnCQnNGa04CVf9+/d6yzXlxojEexxKyt8QVQZtwr3LSy
 5IZKNl8JkAJ+h4IbEcBqK6/WuS73dT587uexR2qn3qcf1iPNm7+glEznw9P9CLc/cTCJvTs
 xdLxrT9+ZhYxnC0wUe/l2s5rVaGKxfzSZCF+Dqw0E+afs0a+FDlwoydUTWt4VXBW7aw9GCB
 AXomoE7CXTZLnGFEEhNrdXnzsbCD1fJCKyguT6VcA9Igd5mDwf5RN5C5MHUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1787096427; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=yQ3/ySkk4MATWRJyNja7KbHykfH+1xBTq7SfrpfOH5s=;
 b=tj1Yd9vigTPqufsraQe0kcfX+W/O+0n5nvNxJ08AsqBxBy2duCGYHPOz26+EeAvfMLCwp
 BrsSKd1PjxaBw1xcft1z519znD2UvuP0NcAd/hS+L5yYOADXvAXkSja1fc44smC3eDy+gBU
 MBswQaS6Frdz4pWOXsnoY4MqNR1GfUMHDVR6gaoe4/fkJOCVMvx06YBzQHlangJRkjuDUKH
 l6Lf3zQWzkNN5zgcvcmCbaFLRuCQTH4WZXJ0Y66gby/0lE2t1qhKFqGpIpF3VwzzPstEOCm
 2FizM6X/0YgPi6pPCE8Gow1aLCBO+O5kBAgDwJP1kDUmUPJvOqDKBfp0PB+A==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 863B643E5F
	for <nouveau@lists.freedesktop.org>; Tue, 18 Aug 2026 23:40:25 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id EFC6610E958
	for <nouveau@lists.freedesktop.org>; Tue, 18 Aug 2026 23:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787097416;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yQ3/ySkk4MATWRJyNja7KbHykfH+1xBTq7SfrpfOH5s=;
	b=TYbpDdhH79UDz4e4vzAzYzbLzKoUKDs024Cuu4dDk2NkDnbOOo+FbYqQbAxzlzrov46F+o
	HXSjsA6Nk65BdOzv3HvYJTD7m2jCGhA19dh+T0b4320l/pqVZBmDlmPx63t0uCFC2i6b4K
	+day6ZjEAmUkXFhco4JAQB5EDH0N3pE=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-135-kpkGkP4lMGm6evd75ZFzzw-1; Tue,
 18 Aug 2026 19:56:52 -0400
X-MC-Unique: kpkGkP4lMGm6evd75ZFzzw-1
X-Mimecast-MFC-AGG-ID: kpkGkP4lMGm6evd75ZFzzw_1787097410
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id D8D8A19560B4;
	Tue, 18 Aug 2026 23:56:49 +0000 (UTC)
Received: from GoldenWind.lan (unknown [10.22.80.100])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id DCF76180049F;
	Tue, 18 Aug 2026 23:56:46 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Marek Czernohous <mczernohous@gmail.com>
Subject: [PATCH 1/6] drm/nouveau/kms/nv50-: Move DPCD backlight disable into
 its own function
Date: Tue, 18 Aug 2026 19:48:43 -0400
Message-ID: <20260818235637.1738055-2-lyude@redhat.com>
In-Reply-To: <20260818235637.1738055-1-lyude@redhat.com>
References: <20260818235637.1738055-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-MFC-PROC-ID: 1qQB4J7sAY7EMKFn_2gsVvcnA2mubokFx33v-hbnI1E_1787097410
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 5XAFWNTWN2P7IWXRXV7ERMA6F2CB6LQB
X-Message-ID-Hash: 5XAFWNTWN2P7IWXRXV7ERMA6F2CB6LQB
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: stable@vger.kernel.org, Faith Ekstrand <faith.ekstrand@collabora.com>,
 Dave Airlie <airlied@redhat.com>, Marek Czernohous <marek@czernohous.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Kees Cook <kees@kernel.org>,
 Marco Crivellari <marco.crivellari@suse.com>,
 Simona Vetter <simona@ffwll.ch>, Ben Skeggs <bskeggs@redhat.com>,
 Maxime Ripard <mripard@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Jani Nikula <jani.nikula@intel.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/5XAFWNTWN2P7IWXRXV7ERMA6F2CB6LQB/>
Archived-At: 
 <https://lore.freedesktop.org/20260818235637.1738055-2-lyude@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Besides using state->dev to access the nouveau_drm device again, there
should be no functional changes here.

Fixes: f575f2bdb6c3 ("drm/nouveau/kms/nv50-: Remove (nv_encoder->crtc) checks in ->disable callbacks")
Cc: <stable@vger.kernel.org> # v5.12+
Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c | 39 +++++++++++++++++--------
 1 file changed, 27 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 2c66e480b5116..a885394f7cb92 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -1561,24 +1561,39 @@ nv50_sor_update(struct nouveau_encoder *nv_encoder, u8 head,
  * the panel backlight has been shut off? Intel doesn't seem to do this, and uses a
  * fixed time delay from the vbios…
  */
+#ifdef CONFIG_DRM_NOUVEAU_BACKLIGHT
+static inline void
+nv50_sor_atomic_disable_backlight(struct nouveau_drm *drm,
+				  struct nouveau_encoder *nv_encoder,
+				  struct drm_atomic_commit *state)
+{
+	struct nouveau_connector *nv_connector;
+	struct nouveau_backlight *backlight;
+	int ret;
+
+	nv_connector = nv50_outp_get_old_connector(state, nv_encoder);
+	if (drm_WARN_ON(drm->dev, !nv_connector))
+		return;
+	backlight = nv_connector->backlight;
+
+	if (!backlight || !backlight->uses_dpcd)
+		return;
+
+	ret = drm_edp_backlight_disable(&nv_connector->aux, &backlight->edp_info);
+	if (ret < 0)
+		NV_ERROR(drm, "Failed to disable backlight on [CONNECTOR:%d:%s]: %d\n",
+			 nv_connector->base.base.id, nv_connector->base.name, ret);
+}
+#endif
+
 static void
 nv50_sor_atomic_disable(struct drm_encoder *encoder, struct drm_atomic_commit *state)
 {
 	struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
 	struct nv50_head *head = nv50_head(nv_encoder->crtc);
-#ifdef CONFIG_DRM_NOUVEAU_BACKLIGHT
-	struct nouveau_connector *nv_connector = nv50_outp_get_old_connector(state, nv_encoder);
-	struct nouveau_drm *drm = nouveau_drm(nv_encoder->base.base.dev);
-	struct nouveau_backlight *backlight = nv_connector->backlight;
-	struct drm_dp_aux *aux = &nv_connector->aux;
-	int ret;
 
-	if (backlight && backlight->uses_dpcd) {
-		ret = drm_edp_backlight_disable(aux, &backlight->edp_info);
-		if (ret < 0)
-			NV_ERROR(drm, "Failed to disable backlight on [CONNECTOR:%d:%s]: %d\n",
-				 nv_connector->base.base.id, nv_connector->base.name, ret);
-	}
+#ifdef CONFIG_DRM_NOUVEAU_BACKLIGHT
+	nv50_sor_atomic_disable_backlight(nouveau_drm(state->dev), nv_encoder, state);
 #endif
 
 	if (nv_encoder->dcb->type == DCB_OUTPUT_TMDS && nv_encoder->hdmi.enabled) {
-- 
2.55.0

