Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22930C5DF86
	for <nouveau@archiver.kernel.org>; Thu, 20 Aug 2026 16:51:17 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B2F6510F127;
	Thu, 20 Aug 2026 16:51:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QpGWam1G";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 445BB479FD;
	Thu, 20 Aug 2026 16:34:41 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1787243681;
 b=R5msE5nm4PvFAEHS8FeoRcUzTp9CuLXzxOZh1QxzKfUDkt88wuX6fx/5EkOzRlZep4j72
 xgCf/aE/GvnT+0EV6cGcvVrSeLd6P/5JdcaSbOJX693g+GSQvTsCCKvZDn7tbPrP+yMw0zT
 JqhXrI1LD7Ls8e4L8oRZBYTiWrl5YxpIBUg7ksYKRru0nijm9sgU99vgx9GfIvPJ3gr+G/d
 MmEWh6TbomRLmZnzSwW2uuvrTbsn/QBCULdXHyIZPPS2jHWkEGTsGjjOWaZ6zedn/pSl2Qh
 Spsc1FVpXf/RwkKRLpvBoJSqKHVcU13ND0x4yFM6akzB20DYFiCvLHfR29RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1787243681; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=Rrx+hjGGRBi6QEFoHXTNw/rycuz8rCyp2ooSpQ0sJ88=;
 b=lcpRRUKGfD73fc022139kEoe7PV9ZzSlb1/vy4A8BVS9l80a/vS3fWt/yuCqylZxT93FR
 TAb8FzWhf6nuAonkx/lklnqm8fXCDf/weRHdolOUaxjVhJQYuHTpRct8HHgHP2JjN/nHOiA
 kdcN4vD4fCGXXVtcomSMmVqFY5uJR7IUEOLX+N0QCGL2Ne7KNZpA/VG1AMP0RE6XmsuX8gV
 BWE++3oTrPosIbukozQKzlCtCKA4hvNR9NDwf6OiMiMqJnfmVsl6RnOicIdZxezzyQNcO1O
 UChZqDSR0Dfm65v4ev8xnIMTVhXIgMKsaVim9ZxF//zTwaRa4cUyiY32MgUA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 10F6A479F8
	for <nouveau@lists.freedesktop.org>; Thu, 20 Aug 2026 16:34:38 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 422B210F123
	for <nouveau@lists.freedesktop.org>; Thu, 20 Aug 2026 16:51:13 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-47c2b362ee2so118476f8f.1
        for <nouveau@lists.freedesktop.org>;
 Thu, 20 Aug 2026 09:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787244672; x=1787849472;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rrx+hjGGRBi6QEFoHXTNw/rycuz8rCyp2ooSpQ0sJ88=;
        b=QpGWam1GWgiKL8Lz6W+mkKT765y4ro4nC1V9PpXEbK+8v/WLltC/05dye+nqJ+ZI7C
         z9GJ6tTXYm7MAr6LU9J8Xrrhjgi0OO0/8Pt+vKgt4m3m0PULtIolDXVZhxDpti5XqH4U
         EU1LuHUVHL1Jhrbi+Ekah0RvPzjaW5HSKs5KDXK0+fsU+ZA+eXxnUzsa59U6HZx7fFLy
         aJhMMRH+sWPHc4PJ0SBL53IWYE/yiIi3nawt7TrW0Dm/5JiuptCR5W/jB5bpYV2pOAUz
         qzxV9l5uaP/65KzRPxhCh3PxDrBA6ReA4rWoHJ6sbvG8arMZE35m2YY0hBb5/wNASQfp
         moHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787244672; x=1787849472;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Rrx+hjGGRBi6QEFoHXTNw/rycuz8rCyp2ooSpQ0sJ88=;
        b=Qvuhn+Wci3dlrC4jSjoTIjdx/xA7uVTAFUK/zzPlBiSQbRmoSebHfoMkVQOD0oz/g/
         pVAm1KNDXwMqCs0Ay+A+msIfZRCNsAtQ1MDvJFCbSbVqnRjEziNI0260c4TPcXlcduzR
         6E+MTsp8CNj7NczF8/FXl1mfTXTz7ajh52lmndRfL5gwBfI6ZO00vhj9JPFwvNtY96od
         0C0KXJ955ofPNBnSPkaZWV/rtzBD6neY8I0612LQYPzvuR/uEMSX1p+iSFjUecdKBfBL
         46794ErcdVYFsmcHd4C25z9JlT9n8TT9FSceAVIKMJ3wq4/oiEKm7qug6S6OcF0LylYO
         Dawg==
X-Forwarded-Encrypted: i=1;
 AHgh+RqRObbp/rwjQ3JdkRwZODaA6N096nQVJsq4WHbmk3m6phhj0tBhIIMxxxHzOzvlRGYTO1WdMJBh@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxxkl4x9INDBZbZRou2ohCZZsLkRNS5u800mD1CN4vbxvB55bjc
	lIH8zVgTMXWbPH1KvzLrzU0Fmkrcn7/iP1Xrw0ZlKwBE/ZbUZc6V5gh1
X-Gm-Gg: AR+sD13oZlEAV6hOQSWenKjjEGYNYh+SG0X/Xzy4Rtc3L/cyxhayQg5ApA8ffFJW3yV
	svKxzRwtbjUEhPNpDu5oiz2eE36bAKB1jcZv/hn+u3UlShKkaclaajb0H/6vqpPZ45RRqc+Yq2Q
	LDzUdRe4bxPo4Gi3quTUncSUrsoKTdQxM/CTUsDgFCaaw8+F0EyMmWXYriYZO18M/GTTFrKQZOj
	hWNpi2BEXYwzeSWIJ181i+TV0lXGJ5/kxN25pIy8cI0ni/BAwfjcSqoHEcAPXYK5JrnWv+ndx1l
	Y9eGQ+RiB820YC4X6FbH4aMA3HRV/iSPKMO0yLITKOrp9PRaOtRcG01W0/tAmD8OmNLNgu7qWCH
	KnsqSIwL1GrBX6u4/6mWigu3wERltVQuLfxKhBel8P9Sdk0ToQugG0ZcrOKmUfZNtLlfdqKiDET
	Pm8VtiJ9BU5+OW3fGFTclesXq35AEv9xSlL9jb40AtFCz6RiuKb1C9RHgof4IIqNgazXe3bzs9M
	4jIMg==
X-Received: by 2002:a05:600c:46d1:b0:492:4e09:9fc1 with SMTP id
 5b1f17b1804b1-499b8469f20mr2469975e9.15.1787244671464;
        Thu, 20 Aug 2026 09:51:11 -0700 (PDT)
Received: from fedora ([5.31.134.170])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499aa1111b2sm205307545e9.5.2026.08.20.09.51.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 09:51:09 -0700 (PDT)
From: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 10/10] drm/nouveau: honor HF-EEODB EDIDs by converting to
 struct drm_edid
Date: Thu, 20 Aug 2026 20:49:29 +0400
Message-ID: <20260820164929.17117-11-mohamedahmedegypt2001@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260820164929.17117-1-mohamedahmedegypt2001@gmail.com>
References: <20260820164929.17117-1-mohamedahmedegypt2001@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: HAMHIXLCPOHI4D6HL22JPSF26EGT76GN
X-Message-ID-Hash: HAMHIXLCPOHI4D6HL22JPSF26EGT76GN
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/HAMHIXLCPOHI4D6HL22JPSF26EGT76GN/>
Archived-At: 
 <https://lore.freedesktop.org/20260820164929.17117-11-mohamedahmedegypt2001@gmail.com/>
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
block's first data block. Their high-refresh timings sit in DisplayID
extension blocks 2+.

The kernel already reads these EDIDs whole, and on GSP boards RM returns
the full EDID with its true size. However, nouveau then hands the buffer
to the legacy API which sizes the EDID from byte 126 so the DisplayID
blocks are not parsed/exposed and the sysfs blob truncates to 256 bytes.
The mode list then tops out at the CTA VICs.

Convert to the struct drm_edid API, which carries the real size.
Read via drm_edid_read_ddc()/drm_edid_read_switcheroo() where an
adapter exists, and serve RM's buffer through drm_edid_read_custom()
with a block-reading callback where not, which also routes the GSP
path through drm's block validation and the debugfs EDID override.

A failed RM read now takes the same "no EDID" path as an empty DDC read
which stops it from leaking the runtime-PM reference detect() holds. The
property, display_info, and mode list go through
drm_edid_connector_update()/_add_modes() and every EDID source is
funneled through nouveau_connector_set_edid() so all of them reach the
property that drm_edid_connector_add_modes() reads from.

nouveau_acpi_edid() now returns a drm_edid sized from the EDID's
extension count but never past the length _DDC actually returned, so
padded buffers pass and truncated ones are rejected, and every
firmware-provided EDID (OF, ACPI, VBIOS-embedded) is validated with
drm_edid_valid(). An invalid one is treated as no EDID. get_modes()
re-syncs the property from the connector's copy when the probe helper
has cleared it for a forced-off connector, before adding modes.

The few raw EDID readers are converted along with it, so no raw struct
edid pointer is kept. Ownership and freeing move to the drm_edid. MST
connectors keep their separate legacy path.

Signed-off-by: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
---
 drivers/gpu/drm/nouveau/dispnv04/dfp.c      |   5 +-
 drivers/gpu/drm/nouveau/dispnv50/disp.c     |   4 +-
 drivers/gpu/drm/nouveau/nouveau_acpi.c      |  21 ++-
 drivers/gpu/drm/nouveau/nouveau_acpi.h      |  10 +-
 drivers/gpu/drm/nouveau/nouveau_connector.c | 147 +++++++++++++++-----
 drivers/gpu/drm/nouveau/nouveau_connector.h |  12 +-
 6 files changed, 151 insertions(+), 48 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv04/dfp.c b/drivers/gpu/drm/nouveau/dispnv04/dfp.c
index c9f96ec8455d..00eb2aacbe93 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/dfp.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/dfp.c
@@ -344,9 +344,8 @@ static void nv04_dfp_mode_set(struct drm_encoder *encoder,
 		regp->fp_control |= (2 << 24);
 	if (nv_encoder->dcb->type == DCB_OUTPUT_LVDS) {
 		bool duallink = false, dummy;
-		if (nv_connector->edid &&
-		    nv_connector->type == DCB_CONNECTOR_LVDS_SPWG) {
-			duallink = (((u8 *)nv_connector->edid)[121] == 2);
+		if (nv_connector->spwg_links) {
+			duallink = nv_connector->spwg_links == 2;
 		} else {
 			nouveau_bios_parse_lvds_table(dev, output_mode->clock,
 						      &duallink, &dummy);
diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 2c66e480b511..add19d479ebe 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -1803,8 +1803,8 @@ nv50_sor_atomic_enable(struct drm_encoder *encoder, struct drm_atomic_commit *st
 			lvds_dual = bios->fp.dual_link;
 			lvds_8bpc = bios->fp.if_is_24bit;
 		} else {
-			if (nv_connector->type == DCB_CONNECTOR_LVDS_SPWG) {
-				if (((u8 *)nv_connector->edid)[121] == 2)
+			if (nv_connector->spwg_links) {
+				if (nv_connector->spwg_links == 2)
 					lvds_dual = true;
 			} else
 			if (mode->clock >= bios->fp.duallink_transition_clk) {
diff --git a/drivers/gpu/drm/nouveau/nouveau_acpi.c b/drivers/gpu/drm/nouveau/nouveau_acpi.c
index 21b56cc7605c..ab2868edd42b 100644
--- a/drivers/gpu/drm/nouveau/nouveau_acpi.c
+++ b/drivers/gpu/drm/nouveau/nouveau_acpi.c
@@ -360,9 +360,10 @@ void nouveau_unregister_dsm_handler(void) {}
 void nouveau_switcheroo_optimus_dsm(void) {}
 #endif
 
-void *
+const struct drm_edid *
 nouveau_acpi_edid(struct drm_device *dev, struct drm_connector *connector)
 {
+	const struct drm_edid *drm_edid;
 	struct acpi_device *acpidev;
 	int type, ret;
 	void *edid;
@@ -384,7 +385,23 @@ nouveau_acpi_edid(struct drm_device *dev, struct drm_connector *connector)
 	if (ret < 0)
 		return NULL;
 
-	return edid;
+	/* Never let the EDID's own extension count reach past what _DDC
+	 * actually returned. Drop the padding some firmware appends so the
+	 * container is exactly the EDID, then validate it like the DDC
+	 * readers would.
+	 */
+	if (ret >= EDID_LENGTH)
+		ret = min_t(int, ret, EDID_LENGTH *
+				      (1 + ((const struct edid *)edid)->extensions));
+	drm_edid = drm_edid_alloc(edid, ret);
+	kfree(edid);
+
+	if (drm_edid && !drm_edid_valid(drm_edid)) {
+		drm_dbg_kms(dev, "Invalid EDID from ACPI _DDC\n");
+		drm_edid_free(drm_edid);
+		drm_edid = NULL;
+	}
+	return drm_edid;
 }
 
 bool nouveau_acpi_video_backlight_use_native(void)
diff --git a/drivers/gpu/drm/nouveau/nouveau_acpi.h b/drivers/gpu/drm/nouveau/nouveau_acpi.h
index e39dd8b94b8b..bc3ccca7b338 100644
--- a/drivers/gpu/drm/nouveau/nouveau_acpi.h
+++ b/drivers/gpu/drm/nouveau/nouveau_acpi.h
@@ -4,13 +4,15 @@
 
 #define ROM_BIOS_PAGE 4096
 
+struct drm_edid;
+
 #if defined(CONFIG_ACPI) && defined(CONFIG_X86)
 bool nouveau_is_optimus(void);
 bool nouveau_is_v1_dsm(void);
 void nouveau_register_dsm_handler(void);
 void nouveau_unregister_dsm_handler(void);
 void nouveau_switcheroo_optimus_dsm(void);
-void *nouveau_acpi_edid(struct drm_device *, struct drm_connector *);
+const struct drm_edid *nouveau_acpi_edid(struct drm_device *, struct drm_connector *);
 bool nouveau_acpi_video_backlight_use_native(void);
 void nouveau_acpi_video_register_backlight(void);
 #else
@@ -19,7 +21,11 @@ static inline bool nouveau_is_v1_dsm(void) { return false; };
 static inline void nouveau_register_dsm_handler(void) {}
 static inline void nouveau_unregister_dsm_handler(void) {}
 static inline void nouveau_switcheroo_optimus_dsm(void) {}
-static inline void *nouveau_acpi_edid(struct drm_device *dev, struct drm_connector *connector) { return NULL; }
+static inline const struct drm_edid *
+nouveau_acpi_edid(struct drm_device *dev, struct drm_connector *connector)
+{
+	return NULL;
+}
 static inline bool nouveau_acpi_video_backlight_use_native(void) { return true; }
 static inline void nouveau_acpi_video_register_backlight(void) {}
 #endif
diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
index b0b0ad9a0c24..55912da83cd0 100644
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
@@ -469,6 +469,36 @@ nouveau_connector_ddc_detect(struct drm_connector *connector)
 	return found;
 }
 
+static void
+nouveau_connector_set_edid(struct nouveau_connector *nv_connector,
+			   const struct drm_edid *drm_edid)
+{
+	if (nv_connector->drm_edid == drm_edid)
+		return;
+
+	/* Updates the EDID property and display_info with HF-EEODB-aware
+	 * sizing. The legacy helpers truncate both to what EDID byte 126
+	 * admits, hiding the DisplayID extension blocks that carry the
+	 * high-refresh timings.
+	 */
+	drm_edid_connector_update(&nv_connector->base, drm_edid);
+
+	drm_edid_free(nv_connector->drm_edid);
+	nv_connector->drm_edid = drm_edid;
+
+	/* The SPWG link-count byte lives in a vendor descriptor drm has no
+	 * accessor for. Peek at it once here so nothing else needs the raw
+	 * EDID.
+	 */
+	nv_connector->spwg_links = 0;
+	if (nv_connector->type == DCB_CONNECTOR_LVDS_SPWG) {
+		const u8 *raw = (const u8 *)drm_edid_raw(drm_edid);
+
+		if (raw)
+			nv_connector->spwg_links = raw[121] == 2 ? 2 : 1;
+	}
+}
+
 static struct nouveau_encoder *
 nouveau_connector_of_detect(struct drm_connector *connector)
 {
@@ -490,8 +520,17 @@ nouveau_connector_of_detect(struct drm_connector *connector)
 		int idx = name ? name[strlen(name) - 1] - 'A' : 0;
 
 		if (nv_encoder->dcb->i2c_index == idx && edid) {
-			nv_connector->edid =
-				kmemdup(edid, EDID_LENGTH, GFP_KERNEL);
+			const struct drm_edid *drm_edid =
+				drm_edid_alloc(edid, EDID_LENGTH);
+
+			/* Firmware-provided, so validate it like the DDC
+			 * readers would.
+			 */
+			if (drm_edid && !drm_edid_valid(drm_edid)) {
+				drm_edid_free(drm_edid);
+				drm_edid = NULL;
+			}
+			nouveau_connector_set_edid(nv_connector, drm_edid);
 			return nv_encoder;
 		}
 	}
@@ -546,17 +585,23 @@ nouveau_connector_set_encoder(struct drm_connector *connector,
 	}
 }
 
-static void
-nouveau_connector_set_edid(struct nouveau_connector *nv_connector,
-			   struct edid *edid)
+struct nouveau_rm_edid {
+	u8 *data;
+	size_t size;
+};
+
+static int
+nouveau_connector_rm_edid_block(void *context, u8 *buf, unsigned int block,
+				size_t len)
 {
-	if (nv_connector->edid != edid) {
-		struct edid *old_edid = nv_connector->edid;
+	struct nouveau_rm_edid *rm = context;
+	size_t offset = (size_t)block * EDID_LENGTH;
 
-		drm_connector_update_edid_property(&nv_connector->base, edid);
-		kfree(old_edid);
-		nv_connector->edid = edid;
-	}
+	if (offset + len > rm->size)
+		return -EINVAL;
+
+	memcpy(buf, rm->data + offset, len);
+	return 0;
 }
 
 static enum drm_connector_status
@@ -590,22 +635,37 @@ nouveau_connector_detect(struct drm_connector *connector, bool force)
 
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
-			if (ret < 0)
-				return connector_status_disconnected;
+			struct nouveau_rm_edid rm = {};
+
+			/* RM (which owns the DDC pads on GSP boards) reads the
+			 * EDID whole and returns its true size, which for an
+			 * HF-EEODB EDID exceeds what byte 126 admits. Serve it
+			 * through drm's block reader so EEODB sizing, block
+			 * validation, and the debugfs EDID override all apply.
+			 * A failed read is treated like an empty DDC read,
+			 * which releases the runtime-PM reference.
+			 */
+			ret = nvif_outp_edid_get(&nv_encoder->outp, &rm.data);
+			if (ret >= 0) {
+				rm.size = ret;
+				new_edid = drm_edid_read_custom(connector,
+								nouveau_connector_rm_edid_block,
+								&rm);
+				kfree(rm.data);
+			}
 		}
 
 		nouveau_connector_set_edid(nv_connector, new_edid);
-		if (!nv_connector->edid) {
+		if (!nv_connector->drm_edid) {
 			NV_ERROR(drm, "DDC responded, but no EDID for %s\n",
 				 connector->name);
 			goto detect_analog;
@@ -626,7 +686,7 @@ nouveau_connector_detect(struct drm_connector *connector, bool force)
 				    nv_partner->dcb->type == DCB_OUTPUT_TMDS) ||
 				   (nv_encoder->dcb->type == DCB_OUTPUT_TMDS &&
 				    nv_partner->dcb->type == DCB_OUTPUT_ANALOG))) {
-			if (nv_connector->edid->input & DRM_EDID_INPUT_DIGITAL)
+			if (drm_edid_is_digital(nv_connector->drm_edid))
 				type = DCB_OUTPUT_TMDS;
 			else
 				type = DCB_OUTPUT_ANALOG;
@@ -638,7 +698,8 @@ nouveau_connector_detect(struct drm_connector *connector, bool force)
 		conn_status = connector_status_connected;
 
 		if (nv_encoder->dcb->type == DCB_OUTPUT_DP)
-			drm_dp_cec_set_edid(&nv_connector->aux, nv_connector->edid);
+			drm_dp_cec_attach(&nv_connector->aux,
+					  connector->display_info.source_physical_address);
 
 		goto out;
 	} else {
@@ -670,7 +731,7 @@ nouveau_connector_detect(struct drm_connector *connector, bool force)
 	}
 
  out:
-	if (!nv_connector->edid)
+	if (!nv_connector->drm_edid)
 		drm_dp_cec_unset_edid(&nv_connector->aux);
 
 	pm_runtime_mark_last_busy(dev->dev);
@@ -686,7 +747,7 @@ nouveau_connector_detect_lvds(struct drm_connector *connector, bool force)
 	struct nouveau_drm *drm = nouveau_drm(dev);
 	struct nouveau_connector *nv_connector = nouveau_connector(connector);
 	struct nouveau_encoder *nv_encoder = NULL;
-	struct edid *edid = NULL;
+	const struct drm_edid *edid = NULL;
 	enum drm_connector_status status = connector_status_disconnected;
 
 	nv_encoder = find_encoder(connector, DCB_OUTPUT_LVDS);
@@ -697,7 +758,7 @@ nouveau_connector_detect_lvds(struct drm_connector *connector, bool force)
 	if (!drm->vbios.fp_no_ddc) {
 		status = nouveau_connector_detect(connector, force);
 		if (status == connector_status_connected) {
-			edid = nv_connector->edid;
+			edid = nv_connector->drm_edid;
 			goto out;
 		}
 	}
@@ -733,9 +794,17 @@ nouveau_connector_detect_lvds(struct drm_connector *connector, bool force)
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
+			/* Firmware-provided, so validate it like the DDC
+			 * readers would.
+			 */
+			if (edid && !drm_edid_valid(edid)) {
+				drm_edid_free(edid);
+				edid = NULL;
+			}
 			if (edid)
 				status = connector_status_connected;
 		}
@@ -886,7 +955,7 @@ nouveau_connector_detect_depth(struct drm_connector *connector)
 	bool duallink;
 
 	/* if the edid is feeling nice enough to provide this info, use it */
-	if (nv_connector->edid && connector->display_info.bpc)
+	if (nv_connector->drm_edid && connector->display_info.bpc)
 		return;
 
 	/* EDID 1.4 is *supposed* to be supported on eDP, but, Apple... */
@@ -913,9 +982,8 @@ nouveau_connector_detect_depth(struct drm_connector *connector)
 	/* LVDS: DDC panel, need to first determine the number of links to
 	 * know which if_is_24bit flag to check...
 	 */
-	if (nv_connector->edid &&
-	    nv_connector->type == DCB_CONNECTOR_LVDS_SPWG)
-		duallink = ((u8 *)nv_connector->edid)[121] == 2;
+	if (nv_connector->spwg_links)
+		duallink = nv_connector->spwg_links == 2;
 	else
 		duallink = mode->clock >= bios->fp.duallink_transition_clk;
 
@@ -973,12 +1041,17 @@ nouveau_connector_get_modes(struct drm_connector *connector)
 		nv_connector->native_mode = NULL;
 	}
 
-	if (nv_connector->edid)
-		ret = drm_add_edid_modes(connector, nv_connector->edid);
-	else
-	if (nv_encoder->dcb->type == DCB_OUTPUT_LVDS &&
-	    (nv_encoder->dcb->lvdsconf.use_straps_for_mode ||
-	     drm->vbios.fp_no_ddc) && nouveau_bios_fp_mode(dev, NULL)) {
+	if (nv_connector->drm_edid) {
+		/* The probe helper clears the property and display_info for
+		 * a forced-off connector without calling detect(). Re-sync
+		 * from our copy then, since add_modes() reads the property.
+		 */
+		if (!connector->edid_blob_ptr)
+			drm_edid_connector_update(connector, nv_connector->drm_edid);
+		ret = drm_edid_connector_add_modes(connector);
+	} else if (nv_encoder->dcb->type == DCB_OUTPUT_LVDS &&
+		   (nv_encoder->dcb->lvdsconf.use_straps_for_mode ||
+		    drm->vbios.fp_no_ddc) && nouveau_bios_fp_mode(dev, NULL)) {
 		struct drm_display_mode mode;
 
 		nouveau_bios_fp_mode(dev, &mode);
diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.h b/drivers/gpu/drm/nouveau/nouveau_connector.h
index 0608cabed058..eb292d2ba4bc 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.h
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.h
@@ -43,7 +43,7 @@
 
 struct nvkm_i2c_port;
 struct dcb_output;
-struct edid;
+struct drm_edid;
 
 #ifdef CONFIG_DRM_NOUVEAU_BACKLIGHT
 struct nouveau_backlight {
@@ -121,6 +121,13 @@ struct nouveau_connector {
 	struct drm_connector base;
 	enum dcb_connector_type type;
 	u8 index;
+	/* LVDS_SPWG panels state their link count in EDID descriptor 4 (SPWG
+	 * byte 0x79), cached by nouveau_connector_set_edid() so nothing else
+	 * needs the raw EDID. 0 = unknown (not an SPWG panel, or no EDID) and
+	 * callers fall back to their transition-clock/VBIOS heuristics;
+	 * 1 = single link; 2 = dual link.
+	 */
+	u8 spwg_links;
 
 	struct nvif_conn conn;
 	u64 hpd_pending;
@@ -137,7 +144,8 @@ struct nouveau_connector {
 	int scaling_mode;
 
 	struct nouveau_encoder *detected_encoder;
-	struct edid *edid;
+	/* Owner of the sink's EDID, HF-EEODB-complete. */
+	const struct drm_edid *drm_edid;
 	struct drm_display_mode *native_mode;
 #ifdef CONFIG_DRM_NOUVEAU_BACKLIGHT
 	struct nouveau_backlight *backlight;
-- 
2.55.0

