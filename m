Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EF36C5CFC1
	for <nouveau@archiver.kernel.org>; Fri, 14 Aug 2026 23:59:15 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2786A10F790;
	Fri, 14 Aug 2026 23:59:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NNlP0XlJ";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 4DC8747825;
	Fri, 14 Aug 2026 23:42:52 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1786750972;
 b=yr/iVvuFDOgRDV5EM598KyqvUx0kw1RrY31iaaq+dronYPdlya4Dg5+BeaKB+Hq5086hB
 jULyUOwKca9I+rjkRWn9P7mbrdjw1frPGh11K6CXmznWgjVGl075mkPbLqQufd27FaF12zJ
 N8Uj8QNycjisZnBtTcpJlN/In1A1BZ0s73xHpVnv1hOGHH00llmDdMvJJ2II0vj/Zg5IzDC
 2MRrIBOWEZpTTt6oPe+uBvYp7UpKs1gIo3XGmzwk4Yu66yORlBjkEie+R2qn3/I/ng7Tno6
 IHset7Y2VoFPyX3ulNz+SVx9Ars0alv5MKejNiufbtp7EdntZKF7ndH5P8OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1786750972; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=u0S1MWlZnT8V7WsJC3Fb0Hyhumpns/uKtAWCZnuFLhc=;
 b=ZsqzTGRqdJv1wxWPl35KrsZxtNBc2PM4ZRc98YNYTkPg/zy0zmo5qHHDptc0lhWvjlcTf
 HtVEhbnQ3pnurcH3VJIpCAOBJd0VNyAJXRN0cX2kUBE+y2CxbCa9Ejo0+8frvJqnKR/yvDF
 ScNa/i1xebTiB6rf3mSRjuQS7vjgllt7BTCsoHDomobXMvbf7iqTrk+uXhjhjgd4Ey1ZArM
 F4CCKug4wS0UThwqEyYi/HDWKWAv0CJap6tjCK+djvoDlC2Ksb00yeQrRaqHP90C3vIWowr
 3S2jEwu/fmt/FrlgARr9SrJISgevVa3/JLgP5z2VvL6CjV6Qg+xswo1426rg==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 0429947815
	for <nouveau@lists.freedesktop.org>; Fri, 14 Aug 2026 23:42:50 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
	by gabe.freedesktop.org (Postfix) with ESMTPS id ACCF310F796
	for <nouveau@lists.freedesktop.org>; Fri, 14 Aug 2026 23:59:12 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-4954a2e73a9so11277925e9.3
        for <nouveau@lists.freedesktop.org>;
 Fri, 14 Aug 2026 16:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786751951; x=1787356751;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u0S1MWlZnT8V7WsJC3Fb0Hyhumpns/uKtAWCZnuFLhc=;
        b=NNlP0XlJAjVeWJ5Td0D131d7rn3Dz7srypFder63hgmut53Tvbp7D6UVpHykBooQxt
         w5aMlHKX0F/7zt3yLnpIFb6Ee3ELi5lQY5gaffe2gOhUbxkQhsfIs16P2ZUjZahSHjkm
         efQuLkp0O5YzvFoIz5xyg85YHhBmtsD/2u3qcDnXZqfnVjGo94LO8IOxGV/Gc3GuC0GO
         tUBGnlX6QsbvJybDISQUxHq4kDc4VK47XNo5BnJ4zGy1rsItbYtnLA6eq/GJlE3mWzjp
         shLhcPX8d97w3am6SdKqFmAlVp+F8IKhsBBTNXg7VylI5uoX1P7ygqLJGY51ZPlb8LxQ
         n9Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786751951; x=1787356751;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=u0S1MWlZnT8V7WsJC3Fb0Hyhumpns/uKtAWCZnuFLhc=;
        b=Qc5UMO93ikD/FqY+GWlOUEomRZrljDMr1GWxbV2uHleO8pduTmn8uNLNh2rxE2OQaZ
         Rsk7mIoUhKaRLMOw9zN2/yyyI3Posb/qtX0fm9Joe5re2z0A4RFase7dC6SqE1EFtoFs
         CDePQRhzW/Fng3O0579F8Pw+vnSn5FZNL/MeFZJSu7etPcJxv8HIYhPHp3dHt/veSdjd
         dK8tWvs8qJDclxGgmLQY+OG6VudcakJlQyXrM4OJ/Q6cEYA6iIgLDaiXg8xi+iWleBT+
         PKGA3Oyz/EMSHWZQQ8t0p7sJvBumEu9mQL8BPpikIstSYcg98hOzr6+HXZYGoHmNJqCN
         vScw==
X-Forwarded-Encrypted: i=1;
 AHgh+RodmXr9K/Dv7JSHt8A/DIA2KrQKzA5ceWzwBV2/LbnjnYsqwF6zyS9cRDBYMelkM60aCSDw4fZe@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxIEPJuJEiiKWELrvmvFCCvV+nPjDTuCiwgZUlrSBfJPGzdriLu
	WLD8hKhzyIee7n4pb+7+8TkX5uHPHmjw8PnuvN4tKcgtJP0TXQ95rg6N
X-Gm-Gg: AR+sD13n1P/LxqCQ9j1Boifw5OpjJx8u6LQm4ETTDsWUJr4J+SX8ec/RSgTM4Xyg8jK
	OHgbFUHsNTLauLg+X97VHSWv27SiNuAzzVpOlwrWrOtzU6CkNfRSb7Z9BgPazYrIIQgdjnnrelg
	PbbCdQ3I8TOF/B3SSJAQYcNT1mzwJafqXKX5yJE8M6Mj7HS8hGCrupgDkGvnonSqvIJUWurRAeX
	lwgTmxOa4277BhAOVkS6miy5xb/VTQ2Zm2/qU9uCYQonP963B6eVmHry9EtapPWIsjkygjebve3
	SC4Uizojg+6gymmX7F+fUHb+cz7WZ2nCp4wU9d57wzEZCNiALyUrClDsuHiikVNUwheIn5Ps46r
	gXhdK7vqw8W2OxZltWcFYOYyhW+0KfoN1FGRF1GC0CBRqVkZQY0N41vsujazaZrQ2hrjTmlMWON
	uOxAxUpT1AiRjdZcR4YVh8BJbqT/Z1YdoG56CaqRy+LRci0Tj+CtA1Ci/qJO+Y48qABzU=
X-Received: by 2002:a05:600c:1d0e:b0:495:4fd4:619b with SMTP id
 5b1f17b1804b1-49987941a4amr95937065e9.1.1786751950878;
        Fri, 14 Aug 2026 16:59:10 -0700 (PDT)
Received: from fedora ([5.31.134.170])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499899753ccsm77751245e9.0.2026.08.14.16.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 16:59:10 -0700 (PDT)
From: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 7/7] nouveau: honor HF-EEODB EDIDs by converting to struct
 drm_edid
Date: Sat, 15 Aug 2026 03:57:05 +0400
Message-ID: <20260814235705.59132-8-mohamedahmedegypt2001@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814235705.59132-1-mohamedahmedegypt2001@gmail.com>
References: <20260814235705.59132-1-mohamedahmedegypt2001@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: OC3FGOOCMY6OHZGJGZUVKYEFIGKSMN6F
X-Message-ID-Hash: OC3FGOOCMY6OHZGJGZUVKYEFIGKSMN6F
X-MailFrom: mohamedahmedegypt2001@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: dri-devel@lists.freedesktop.org, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Mary Guillemard <mary@mary.zone>, nouveau@lists.freedesktop.org,
 Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/OC3FGOOCMY6OHZGJGZUVKYEFIGKSMN6F/>
Archived-At: 
 <https://lore.freedesktop.org/20260814235705.59132-8-mohamedahmedegypt2001@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

HDMI 2.1 sinks ship HF-EEODB EDIDs. Byte 126 deliberately claims one
extension block for legacy sources, and the true count lives in the CTA
block's first data block. Their high-refresh timings (e.g., 4K240, 6K165,
etc) sit in DisplayID extension blocks 2+.

The kernel already reads these EDIDs whole, and on GSP boards RM returns
the full EDID with its true size. However, nouveau then hands the buffer
to the legacy API which sizes the EDID from byte 126 so the DisplayID
blocks are not parsed/exposed and the sysfs blob truncates to 256 bytes.

Convert to the struct drm_edid API, which carries the real size.
Read via drm_edid_read_ddc()/drm_edid_read_switcheroo() where an
adapter exists, and serve RM's buffer through drm_edid_read_custom()
with a block-reading callback where not, which also routes the GSP
path through drm's block validation and the debugfs EDID override
(previously dead on GSP boards, since nothing consulted it outside
the i2c readers).

The connector keeps a borrowed const drm_edid_raw() view in ->edid, same
as i915's detect_edid so the raw-EDID consumers (SAD parsing, deep-color
flags, the DVI dual-link byte, DP CEC) are untouched. Ownership and
freeing move to the drm_edid. The OF path additionally now frees any
previous EDID itself rather than relying on the callers. MST connectors
keep their separate legacy path.

Signed-off-by: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c     |  2 +-
 drivers/gpu/drm/nouveau/nouveau_connector.c | 95 ++++++++++++++++-----
 drivers/gpu/drm/nouveau/nouveau_connector.h |  7 +-
 3 files changed, 80 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 364227f5456f..c3b7fd29c077 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -1804,7 +1804,7 @@ nv50_sor_atomic_enable(struct drm_encoder *encoder, struct drm_atomic_commit *st
 			lvds_8bpc = bios->fp.if_is_24bit;
 		} else {
 			if (nv_connector->type == DCB_CONNECTOR_LVDS_SPWG) {
-				if (((u8 *)nv_connector->edid)[121] == 2)
+				if (((const u8 *)nv_connector->edid)[121] == 2)
 					lvds_dual = true;
 			} else
 			if (mode->clock >= bios->fp.duallink_transition_clk) {
diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
index b0b0ad9a0c24..4105555151c9 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.c
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
@@ -397,7 +397,7 @@ nouveau_connector_destroy(struct drm_connector *connector)
 	struct nouveau_connector *nv_connector = nouveau_connector(connector);
 	nvif_event_dtor(&nv_connector->irq);
 	nvif_event_dtor(&nv_connector->hpd);
-	kfree(nv_connector->edid);
+	drm_edid_free(nv_connector->drm_edid);
 	drm_connector_unregister(connector);
 	drm_connector_cleanup(connector);
 	if (nv_connector->aux.transfer)
@@ -490,8 +490,11 @@ nouveau_connector_of_detect(struct drm_connector *connector)
 		int idx = name ? name[strlen(name) - 1] - 'A' : 0;
 
 		if (nv_encoder->dcb->i2c_index == idx && edid) {
+			drm_edid_free(nv_connector->drm_edid);
+			nv_connector->drm_edid =
+				drm_edid_alloc(edid, EDID_LENGTH);
 			nv_connector->edid =
-				kmemdup(edid, EDID_LENGTH, GFP_KERNEL);
+				drm_edid_raw(nv_connector->drm_edid);
 			return nv_encoder;
 		}
 	}
@@ -546,17 +549,42 @@ nouveau_connector_set_encoder(struct drm_connector *connector,
 	}
 }
 
+struct nouveau_rm_edid {
+	u8 *data;
+	int size;
+};
+
+static int
+nouveau_connector_rm_edid_block(void *context, u8 *buf, unsigned int block,
+				size_t len)
+{
+	struct nouveau_rm_edid *rm = context;
+	size_t offset = (size_t)block * EDID_LENGTH;
+
+	if (offset + len > rm->size)
+		return -EINVAL;
+
+	memcpy(buf, rm->data + offset, len);
+	return 0;
+}
+
 static void
 nouveau_connector_set_edid(struct nouveau_connector *nv_connector,
-			   struct edid *edid)
+			   const struct drm_edid *drm_edid)
 {
-	if (nv_connector->edid != edid) {
-		struct edid *old_edid = nv_connector->edid;
+	if (nv_connector->drm_edid == drm_edid)
+		return;
 
-		drm_connector_update_edid_property(&nv_connector->base, edid);
-		kfree(old_edid);
-		nv_connector->edid = edid;
-	}
+	/* Updates the EDID property and display_info with HF-EEODB-aware
+	 * sizing. The legacy helpers truncate both to what EDID byte 126
+	 * admits, hiding the DisplayID extension blocks that carry every
+	 * timing a DTD can't express (>655.35 MHz).
+	 */
+	drm_edid_connector_update(&nv_connector->base, drm_edid);
+
+	drm_edid_free(nv_connector->drm_edid);
+	nv_connector->drm_edid = drm_edid;
+	nv_connector->edid = drm_edid_raw(drm_edid);
 }
 
 static enum drm_connector_status
@@ -590,20 +618,36 @@ nouveau_connector_detect(struct drm_connector *connector, bool force)
 
 	nv_encoder = nouveau_connector_ddc_detect(connector);
 	if (nv_encoder) {
-		struct edid *new_edid = NULL;
+		const struct drm_edid *new_edid = NULL;
 
 		if (nv_encoder->i2c) {
 			if ((vga_switcheroo_handler_flags() & VGA_SWITCHEROO_CAN_SWITCH_DDC) &&
 			    nv_connector->type == DCB_CONNECTOR_LVDS)
-				new_edid = drm_get_edid_switcheroo(connector, nv_encoder->i2c);
+				new_edid = drm_edid_read_switcheroo(connector, nv_encoder->i2c);
 			else
-				new_edid = drm_get_edid(connector, nv_encoder->i2c);
+				new_edid = drm_edid_read_ddc(connector, nv_encoder->i2c);
 		} else {
-			ret = nvif_outp_edid_get(&nv_encoder->outp, (u8 **)&new_edid);
+			struct nouveau_rm_edid rm = {};
+
+			ret = nvif_outp_edid_get(&nv_encoder->outp, &rm.data);
 			if (ret < 0)
 				return connector_status_disconnected;
+
+			/* ret is RM's true buffer size: an HF-EEODB EDID is
+			 * larger than its byte 126 admits, and RM (which
+			 * owns the DDC pads on GSP boards) reads it whole.
+			 * Serve it through drm's block reader so EEODB
+			 * sizing, block validation, and the debugfs EDID
+			 * override all apply.
+			 */
+			rm.size = ret;
+			new_edid = drm_edid_read_custom(connector,
+							nouveau_connector_rm_edid_block,
+							&rm);
+			kfree(rm.data);
 		}
 
+
 		nouveau_connector_set_edid(nv_connector, new_edid);
 		if (!nv_connector->edid) {
 			NV_ERROR(drm, "DDC responded, but no EDID for %s\n",
@@ -686,7 +730,7 @@ nouveau_connector_detect_lvds(struct drm_connector *connector, bool force)
 	struct nouveau_drm *drm = nouveau_drm(dev);
 	struct nouveau_connector *nv_connector = nouveau_connector(connector);
 	struct nouveau_encoder *nv_encoder = NULL;
-	struct edid *edid = NULL;
+	const struct drm_edid *edid = NULL;
 	enum drm_connector_status status = connector_status_disconnected;
 
 	nv_encoder = find_encoder(connector, DCB_OUTPUT_LVDS);
@@ -697,7 +741,7 @@ nouveau_connector_detect_lvds(struct drm_connector *connector, bool force)
 	if (!drm->vbios.fp_no_ddc) {
 		status = nouveau_connector_detect(connector, force);
 		if (status == connector_status_connected) {
-			edid = nv_connector->edid;
+			edid = nv_connector->drm_edid;
 			goto out;
 		}
 	}
@@ -712,7 +756,13 @@ nouveau_connector_detect_lvds(struct drm_connector *connector, bool force)
 	 * valid - it's not (rh#613284)
 	 */
 	if (nv_encoder->dcb->lvdsconf.use_acpi_for_edid) {
-		edid = nouveau_acpi_edid(dev, connector);
+		struct edid *raw = nouveau_acpi_edid(dev, connector);
+
+		if (raw) {
+			edid = drm_edid_alloc(raw,
+					      EDID_LENGTH * (1 + raw->extensions));
+			kfree(raw);
+		}
 		if (edid) {
 			status = connector_status_connected;
 			goto out;
@@ -733,9 +783,10 @@ nouveau_connector_detect_lvds(struct drm_connector *connector, bool force)
 	 * stored for the panel stored in them.
 	 */
 	if (!drm->vbios.fp_no_ddc) {
-		edid = (struct edid *)nouveau_bios_embedded_edid(dev);
-		if (edid) {
-			edid = kmemdup(edid, EDID_LENGTH, GFP_KERNEL);
+		const void *embedded = nouveau_bios_embedded_edid(dev);
+
+		if (embedded) {
+			edid = drm_edid_alloc(embedded, EDID_LENGTH);
 			if (edid)
 				status = connector_status_connected;
 		}
@@ -915,7 +966,7 @@ nouveau_connector_detect_depth(struct drm_connector *connector)
 	 */
 	if (nv_connector->edid &&
 	    nv_connector->type == DCB_CONNECTOR_LVDS_SPWG)
-		duallink = ((u8 *)nv_connector->edid)[121] == 2;
+		duallink = ((const u8 *)nv_connector->edid)[121] == 2;
 	else
 		duallink = mode->clock >= bios->fp.duallink_transition_clk;
 
@@ -973,8 +1024,8 @@ nouveau_connector_get_modes(struct drm_connector *connector)
 		nv_connector->native_mode = NULL;
 	}
 
-	if (nv_connector->edid)
-		ret = drm_add_edid_modes(connector, nv_connector->edid);
+	if (nv_connector->drm_edid)
+		ret = drm_edid_connector_add_modes(connector);
 	else
 	if (nv_encoder->dcb->type == DCB_OUTPUT_LVDS &&
 	    (nv_encoder->dcb->lvdsconf.use_straps_for_mode ||
diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.h b/drivers/gpu/drm/nouveau/nouveau_connector.h
index 0608cabed058..ca8f310b3680 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.h
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.h
@@ -137,7 +137,12 @@ struct nouveau_connector {
 	int scaling_mode;
 
 	struct nouveau_encoder *detected_encoder;
-	struct edid *edid;
+	/* Borrowed decoded view of ->drm_edid for the raw-EDID consumers
+	 * (SADs, deep-colour flags, dual-link byte); do not free.
+	 */
+	const struct edid *edid;
+	/* Owner of the sink's EDID, HF-EEODB-complete. */
+	const struct drm_edid *drm_edid;
 	struct drm_display_mode *native_mode;
 #ifdef CONFIG_DRM_NOUVEAU_BACKLIGHT
 	struct nouveau_backlight *backlight;
-- 
2.55.0

