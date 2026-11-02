Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18B99608C24D
	for <nouveau@archiver.kernel.org>; Mon,  2 Nov 2026 16:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=km+WsYY6
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3983A10F0E0;
	Mon,  2 Nov 2026 16:49:53 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id EDE1F48AAB;
	Mon,  2 Nov 2026 16:30:33 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1793637033;
 b=f5912g1b2LYpwfwoTbNfxm/1Io1kECRTqQ9J9w6M7BMWZUTCvEqP+jZNodeXWvc861Gec
 X+d3c+9h5mrfQ03JNpK60E6tkPgEQ2ehNQPMyOd8S6WTB1+rHmgyCrwl3j/SLzTy3Oeriaj
 rXvP2j2+tuo35ZaDtA/bC2A1R2kYHu+ETqwq4JVd1uT881QLOXSEH1kmu800rZmKvHFTSMf
 m4IQEInB/lP7ouxQExZ84C/G+ViJIYMru0u4cIoBbWBbSVfx2k13ErFxDc5xsWdP8iteL8j
 XyWKrVH071N8fVbOse7nfiTaM/ZlRn4ByjBAXDfJCVhPg+KH3m/c7L1vE9FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1793637033; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=yeR6qzcw7/AznNLkNn/kuZYVMEdlMEavCIHhHA0hw9k=;
 b=fsnhiOFQQj9DXRWqGERIhGN1wER++yDW/tR4MutSicPxvcQY3lKz5RJJ7lufMqS5xsZvh
 /IHAFw4Yqd93SyZrQlIFl/JaE+1lEisqlrjSavui2neo6Z9QVqynx7GMiDtZ/B1d9DOYdD/
 L1Z+GR0KCWPgakLIIKBd+HyduCHVRPQ8OSU7H86MjqpYc5SXzkXZcKfi3ZSKzAObMeez/DW
 M6DnBKq/P+hY49PXLArPvCXNhMpHGe72CnuqsDpC1mOtmlij4O7iuaLgXsEpa3fu0dxcU2C
 O9K7KBgZRL1edRS8M0Vlipo6ibvdAJALmhUV06AENAWdutH8qZQ/R5t/PIag==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 546FA48CA9
	for <nouveau@lists.freedesktop.org>; Mon,  2 Nov 2026 16:30:30 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5DF5710F0B3;
	Mon,  2 Nov 2026 16:49:44 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5830F43E80;
	Mon,  2 Nov 2026 16:49:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 915CE1F00A22;
	Mon,  2 Nov 2026 16:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793638184;
	bh=yeR6qzcw7/AznNLkNn/kuZYVMEdlMEavCIHhHA0hw9k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=km+WsYY6J3ixPhJEOjVdn/scW5u4CE4Lp+zGdOy8hxj+fe+XjMbPX7mDabVREJtAh
	 PxpoOmEMiCHAru+8X08KdrZwaRhlHjPWYuFZBs5sSwhb+E+90lYgAJaKbnWytpp2f+
	 3rbVwz1W7vtYQ4qgdvLAhGSrxsFGu2hnS3HSF1eIKe+RbaRJEezVcy7b4pPBiQwZvj
	 Mbx/LAfHD6gRXSpZuy0Tpk8p3bDxmva20LjwxFHiTCJ9lWytrINH5SPe6qJl7Ml4J2
	 AG7dff79aVM5fmvaflfi4uHCMG5F5CemyheCGtXbYZRd3rbrXaGez6UtbHbOMM4Udq
	 ellSAkLBjCd8Q==
From: "Mario Limonciello (AMD)" <superm1@kernel.org>
Date: Mon, 02 Nov 2026 10:49:24 -0600
Subject: [PATCH v10 08/15] drm/panel: add connector luminance forwarding
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: 
 <20261102-superm1-backlight-property-v10-8-b2a6f24131f5@kernel.org>
References: 
 <20261102-superm1-backlight-property-v10-0-b2a6f24131f5@kernel.org>
In-Reply-To: 
 <20261102-superm1-backlight-property-v10-0-b2a6f24131f5@kernel.org>
To: Maxime Ripard <mripard@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>
X-Mailer: b4 0.16.0
Message-ID-Hash: IYVCZ6V35LW5U5OXEJORAG3YOASFLSCN
X-Message-ID-Hash: IYVCZ6V35LW5U5OXEJORAG3YOASFLSCN
X-MailFrom: superm1@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Mario Limonciello <superm1@kernel.org>, Xaver Hugl <xaver.hugl@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Mario Limonciello <mario.limonciello@amd.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/IYVCZ6V35LW5U5OXEJORAG3YOASFLSCN/>
Archived-At: 
 <https://lore.freedesktop.org/20261102-superm1-backlight-property-v10-8-b2a6f24131f5@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Mario Limonciello <mario.limonciello@amd.com>

Add helpers that expose a panel backlight through the connector
LUMINANCE property and forward connector updates to the backlight
backend.

Hook the helpers into panel bridges that create their own connector.
Panels consumed directly, or by a panel bridge attached with
DRM_BRIDGE_ATTACH_NO_CONNECTOR, remain unchanged.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
v10:
 * Split panel support out of the combined panel and bridge patch
 * Limit integration to panel bridges that own their connector
---
 drivers/gpu/drm/drm_panel.c | 99 +++++++++++++++++++++++++++++++++++++++++----
 include/drm/drm_panel.h     | 39 +++---------------
 2 files changed, 97 insertions(+), 41 deletions(-)

diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
index c00529bfb706b..a5706edad9735 100644
--- a/drivers/gpu/drm/drm_panel.c
+++ b/drivers/gpu/drm/drm_panel.c
@@ -38,6 +38,19 @@ static LIST_HEAD(panel_list);
  * take look at drm_panel_bridge_add() and devm_drm_panel_bridge_add().
  */
 
+struct panel_bridge {
+	struct drm_bridge bridge;
+	struct drm_connector connector;
+	struct drm_panel *panel;
+	u32 connector_type;
+};
+
+static inline struct panel_bridge *
+drm_connector_to_panel_bridge(const struct drm_connector *connector)
+{
+	return container_of(connector, struct panel_bridge, connector);
+}
+
 static inline struct drm_panel *
 drm_bridge_to_panel(const struct drm_bridge *bridge)
 {
@@ -50,13 +63,6 @@ drm_connector_to_panel(const struct drm_connector *connector)
 	return container_of(connector, struct drm_panel, connector);
 }
 
-struct panel_bridge {
-	struct drm_bridge bridge;
-	struct drm_connector connector;
-	struct drm_panel *panel;
-	u32 connector_type;
-};
-
 static int panel_bridge_connector_get_modes(struct drm_connector *connector)
 {
 	struct drm_panel *panel = drm_connector_to_panel(connector);
@@ -64,9 +70,29 @@ static int panel_bridge_connector_get_modes(struct drm_connector *connector)
 	return drm_panel_get_modes(panel, connector);
 }
 
+static void
+panel_bridge_connector_set_luminance(const struct drm_connector_state *conn_state)
+{
+	struct panel_bridge *panel_bridge =
+		drm_connector_to_panel_bridge(conn_state->connector);
+
+	drm_panel_set_luminance(panel_bridge->panel, conn_state->luminance);
+}
+
+static void
+panel_bridge_connector_disable_luminance(const struct drm_connector_state *conn_state)
+{
+	struct panel_bridge *panel_bridge =
+		drm_connector_to_panel_bridge(conn_state->connector);
+
+	drm_panel_disable_luminance(panel_bridge->panel);
+}
+
 static const struct drm_connector_helper_funcs
 panel_bridge_connector_helper_funcs = {
 	.get_modes = panel_bridge_connector_get_modes,
+	.set_luminance = panel_bridge_connector_set_luminance,
+	.disable_luminance = panel_bridge_connector_disable_luminance,
 };
 
 static const struct drm_connector_funcs panel_bridge_connector_funcs = {
@@ -101,6 +127,10 @@ static int panel_bridge_attach(struct drm_bridge *bridge,
 
 	drm_panel_bridge_set_orientation(connector, bridge);
 
+	ret = drm_panel_attach_luminance_property(panel, connector);
+	if (ret)
+		return ret;
+
 	drm_connector_attach_encoder(connector, encoder);
 
 	if (bridge->dev->registered) {
@@ -861,6 +891,61 @@ void drm_panel_disable(struct drm_panel *panel)
 }
 EXPORT_SYMBOL(drm_panel_disable);
 
+/**
+ * drm_panel_attach_luminance_property - expose a panel backlight through DRM
+ * @panel: panel whose backlight is controlled
+ * @connector: connector on which to expose the property
+ *
+ * The backlight class device remains the internal hardware backend. When the
+ * luminance UAPI is enabled, userspace controls that backend through the DRM
+ * connector property instead.
+ *
+ * Return: 0 on success or a negative error code
+ */
+int drm_panel_attach_luminance_property(struct drm_panel *panel,
+					struct drm_connector *connector)
+{
+	struct backlight_device *backlight;
+
+	if (!IS_ENABLED(CONFIG_DRM_LUMINANCE) || !panel)
+		return 0;
+
+	backlight = panel->backlight;
+	if (!backlight)
+		return 0;
+
+	return drm_connector_attach_luminance_property(connector, 0,
+					backlight->props.max_brightness,
+					backlight->props.brightness);
+}
+EXPORT_SYMBOL(drm_panel_attach_luminance_property);
+
+/**
+ * drm_panel_set_luminance - set a panel backlight's relative luminance
+ * @panel: panel whose backlight is controlled
+ * @luminance: relative luminance level
+ */
+void drm_panel_set_luminance(struct drm_panel *panel, unsigned int luminance)
+{
+	if (!panel || !panel->backlight)
+		return;
+
+	panel->backlight->props.brightness = luminance;
+	backlight_update_status(panel->backlight);
+}
+EXPORT_SYMBOL(drm_panel_set_luminance);
+
+/**
+ * drm_panel_disable_luminance - turn off a panel backlight
+ * @panel: panel whose backlight is controlled
+ */
+void drm_panel_disable_luminance(struct drm_panel *panel)
+{
+	if (panel)
+		backlight_disable(panel->backlight);
+}
+EXPORT_SYMBOL(drm_panel_disable_luminance);
+
 /**
  * drm_panel_get_modes - probe the available display modes of a panel
  * @panel: DRM panel
diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
index 58113ea7d63a0..76d49d4485ff0 100644
--- a/include/drm/drm_panel.h
+++ b/include/drm/drm_panel.h
@@ -342,6 +342,11 @@ void drm_panel_unprepare(struct drm_panel *panel);
 void drm_panel_enable(struct drm_panel *panel);
 void drm_panel_disable(struct drm_panel *panel);
 
+int drm_panel_attach_luminance_property(struct drm_panel *panel,
+					struct drm_connector *connector);
+void drm_panel_set_luminance(struct drm_panel *panel, unsigned int luminance);
+void drm_panel_disable_luminance(struct drm_panel *panel);
+
 int drm_panel_get_modes(struct drm_panel *panel, struct drm_connector *connector);
 
 #if defined(CONFIG_OF) && IS_ENABLED(CONFIG_DRM_PANEL)
@@ -418,40 +423,6 @@ struct drm_bridge *devm_drm_panel_bridge_add_typed(struct device *dev,
 struct drm_bridge *drmm_panel_bridge_add(struct drm_device *drm,
 					 struct drm_panel *panel);
 struct drm_connector *drm_panel_bridge_connector(struct drm_bridge *bridge);
-#else
-static inline bool drm_bridge_is_panel(const struct drm_bridge *bridge)
-{
-	return false;
-}
-
-static inline int drm_panel_bridge_set_orientation(struct drm_connector *connector,
-						   struct drm_bridge *bridge)
-{
-	return -EINVAL;
-}
-#endif
-
-#if defined(CONFIG_OF) && defined(CONFIG_DRM_PANEL_BRIDGE)
-struct drm_bridge *devm_drm_of_get_bridge(struct device *dev, struct device_node *node,
-					  u32 port, u32 endpoint);
-struct drm_bridge *drmm_of_get_bridge(struct drm_device *drm, struct device_node *node,
-				      u32 port, u32 endpoint);
-#else
-static inline struct drm_bridge *devm_drm_of_get_bridge(struct device *dev,
-							struct device_node *node,
-							u32 port,
-							u32 endpoint)
-{
-	return ERR_PTR(-ENODEV);
-}
-
-static inline struct drm_bridge *drmm_of_get_bridge(struct drm_device *drm,
-						    struct device_node *node,
-						    u32 port,
-						    u32 endpoint)
-{
-	return ERR_PTR(-ENODEV);
-}
 #endif
 
 #endif

-- 
2.53.0

