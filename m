Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2B45608C244
	for <nouveau@archiver.kernel.org>; Mon,  2 Nov 2026 16:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Bak8PR33
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B93F810F0E8;
	Mon,  2 Nov 2026 16:49:51 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 76B5348CB1;
	Mon,  2 Nov 2026 16:30:32 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1793637032;
 b=gjqB2yAZAfJGmv0WUWASTjk1GuDfxy1eRmLTAW9gO9fOlgJmjj6Caui5jePgVG894+sEr
 /pS5gqe49WHW4QBBd++bECy3t39xB9bzGwbFhwjah+WeMngiVqVrYSSzsOHLTEXa9vnxeBg
 KkIDuE+/FKt5jQm6hF4aqBizGiFG0OuZxq8zDXorrEeh1acT9UYxXACHJapuvG8JF6AuFND
 pKfVe+neSAEBZcsonWHoLyKZ1wBczv7IUZQMHOmM0KQNMgFw2SJjw79F48wDuPKoWRyyxHt
 wPw9L9kkRHdHQlDk0QDCFM8OQ1bxkhXOfWUJaXsZ0lyntmnhaiI0i9y/C84w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1793637032; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=hI1MJq4K8L5jI0+LOV3XfRn/TD9k2MaKrMvKNdRDEoU=;
 b=pprnVxCifRea778WZliz4MnfTMEP5A+oX0fcXLN2lBdOjvtE/kCRTxFy0AVShGDt6D61y
 THXpo2qxBEBsXrjOKcCEXW4a0QOVDGhiPYia419YPpnqCNe88tEibmBNACEOTPNzOqDpDe6
 chWvFWpcXeLbMBNAFNFLOCKyfhzosRyQ96gQpK4FmTNU0eOHEDgwA0TRYLUOKJpsBeN/XlX
 PmoZA5Ug9bWtrB0LWS31AEoK8zZxww4jd7OBZLe3tt12K8gOjLSYFo9kuGKE3k4mLqFtTlO
 qAPstulghILt5jZBhu3vNvXpdXuph0KXaHhLpKg/ma05/17Ncx/erPbO3pRg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 9A0F548CA3
	for <nouveau@lists.freedesktop.org>; Mon,  2 Nov 2026 16:30:28 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 82DFB10F0C6;
	Mon,  2 Nov 2026 16:49:42 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6DEE944510;
	Mon,  2 Nov 2026 16:49:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9D691F00A1A;
	Mon,  2 Nov 2026 16:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793638182;
	bh=hI1MJq4K8L5jI0+LOV3XfRn/TD9k2MaKrMvKNdRDEoU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Bak8PR33p6oWgFybUkZoLevJ2evrRwZLe86BX79lDY+3foHj7EE2Zs6nlKZ+K67oc
	 wAKdmTFo/LotMoKeXC8KRqSpoEIpQSpngubonYVfJFzWda/yf9YOoUX8ZPDE7mVlx/
	 OxAV6pAhOPgcn+TNQ1MN+S9ZULeDUAFTET1VqaDy4e+mqQNMOWhrNbPuFvdwh9LKHb
	 1jwmW4azVC+VLAC3G1H9PN8k8MiftCEX0zrFmGJaj6XZlBKsTiF3qiK2JXyuQ35Y6Q
	 ijGETtfoKU8JQGt3bV694yhBfUToAYTd3wh0NdIOFX8SJ/FE8TSXq5qgO/Dy7S9EjE
	 EXmHIhbwKy6Zg==
From: "Mario Limonciello (AMD)" <superm1@kernel.org>
Date: Mon, 02 Nov 2026 10:49:23 -0600
Subject: [PATCH v10 07/15] drm/bridge: add connector luminance operations
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: 
 <20261102-superm1-backlight-property-v10-7-b2a6f24131f5@kernel.org>
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
Message-ID-Hash: CD7NHSI5GVFTV6G6EW6GTRJFMJQG3G34
X-Message-ID-Hash: CD7NHSI5GVFTV6G6EW6GTRJFMJQG3G34
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/CD7NHSI5GVFTV6G6EW6GTRJFMJQG3G34/>
Archived-At: 
 <https://lore.freedesktop.org/20261102-superm1-backlight-property-v10-7-b2a6f24131f5@kernel.org/>
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

Allow bridges that own brightness control to advertise a luminance
operation and its supported relative range.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
v10:
 * Split bridge operations out of the combined panel and bridge patch
---
 include/drm/drm_bridge.h | 74 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 1981d24a700d2..95f5c2b8656cd 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -62,6 +62,15 @@ enum drm_bridge_attach_flags {
  * struct drm_bridge_funcs - drm_bridge control functions
  */
 struct drm_bridge_funcs {
+	/**
+	 * @set_luminance:
+	 *
+	 * Apply a relative luminance level to a bridge that controls panel
+	 * emission. Bridges implementing this callback shall set
+	 * @DRM_BRIDGE_OP_LUMINANCE.
+	 */
+	void (*set_luminance)(struct drm_bridge *bridge, unsigned int luminance);
+
 	/**
 	 * @attach:
 	 *
@@ -1021,6 +1030,11 @@ enum drm_bridge_ops {
 	 * &drm_bridge_funcs->hdmi_clear_spd_infoframe callbacks.
 	 */
 	DRM_BRIDGE_OP_HDMI_SPD_INFOFRAME = BIT(10),
+
+	/**
+	 * @DRM_BRIDGE_OP_LUMINANCE: The bridge controls panel luminance.
+	 */
+	DRM_BRIDGE_OP_LUMINANCE = BIT(11),
 };
 
 /**
@@ -1071,6 +1085,12 @@ struct drm_bridge {
 	void *driver_private;
 	/** @ops: bitmask of operations supported by the bridge */
 	enum drm_bridge_ops ops;
+
+	/** @luminance_max: Maximum relative luminance level. */
+	unsigned int luminance_max;
+
+	/** @luminance: Current relative luminance level. */
+	unsigned int luminance;
 	/**
 	 * @type: Type of the connection at the bridge output
 	 * (DRM_MODE_CONNECTOR_*). For bridges at the end of this chain this
@@ -1522,6 +1542,60 @@ void drm_bridge_hpd_disable(struct drm_bridge *bridge);
 void drm_bridge_hpd_notify(struct drm_bridge *bridge,
 			   enum drm_connector_status status);
 
+#ifdef CONFIG_DRM_PANEL_BRIDGE
+bool drm_bridge_is_panel(const struct drm_bridge *bridge);
+struct drm_bridge *drm_panel_bridge_add(struct drm_panel *panel);
+struct drm_bridge *drm_panel_bridge_add_typed(struct drm_panel *panel,
+					      u32 connector_type);
+void drm_panel_bridge_remove(struct drm_bridge *bridge);
+int drm_panel_bridge_set_orientation(struct drm_connector *connector,
+				     struct drm_bridge *bridge);
+struct drm_bridge *devm_drm_panel_bridge_add(struct device *dev,
+					     struct drm_panel *panel);
+struct drm_bridge *devm_drm_panel_bridge_add_typed(struct device *dev,
+						   struct drm_panel *panel,
+						   u32 connector_type);
+struct drm_bridge *drmm_panel_bridge_add(struct drm_device *drm,
+					     struct drm_panel *panel);
+struct drm_connector *drm_panel_bridge_connector(struct drm_bridge *bridge);
+#else
+static inline bool drm_bridge_is_panel(const struct drm_bridge *bridge)
+{
+	return false;
+}
+
+static inline int drm_panel_bridge_set_orientation(struct drm_connector *connector,
+						   struct drm_bridge *bridge)
+{
+	return -EINVAL;
+}
+
+#endif
+
+#if defined(CONFIG_OF) && defined(CONFIG_DRM_PANEL_BRIDGE)
+struct drm_bridge *devm_drm_of_get_bridge(struct device *dev, struct device_node *node,
+					  u32 port, u32 endpoint);
+struct drm_bridge *drmm_of_get_bridge(struct drm_device *drm, struct device_node *node,
+					  u32 port, u32 endpoint);
+#else
+static inline struct drm_bridge *devm_drm_of_get_bridge(struct device *dev,
+							struct device_node *node,
+							u32 port,
+							u32 endpoint)
+{
+	return ERR_PTR(-ENODEV);
+}
+
+static inline struct drm_bridge *drmm_of_get_bridge(struct drm_device *drm,
+						     struct device_node *node,
+						     u32 port,
+						     u32 endpoint)
+{
+	return ERR_PTR(-ENODEV);
+}
+#endif
+
+void devm_drm_put_bridge(struct device *dev, struct drm_bridge *bridge);
 void drm_bridge_debugfs_params(struct dentry *root);
 void drm_bridge_debugfs_encoder_params(struct dentry *root, struct drm_encoder *encoder);
 

-- 
2.53.0

