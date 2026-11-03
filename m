Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E51D6606A324
	for <nouveau@archiver.kernel.org>; Tue,  3 Nov 2026 22:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Asgd9/r9
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5C5B810F8F7;
	Tue,  3 Nov 2026 22:42:38 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 1333448D11;
	Tue,  3 Nov 2026 22:23:16 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1793744595;
 b=nKh/+x36EIzDVNWsbH95KIl04LDjtN/jQE8HJ8M9ZZkcFl3XeFV+Gg0D8uJ8U74+q1UGy
 28TOVULHDeBS8xeTXlqG3rAwC25N1bDuX8qwLJ0t6S4A5cdoJwXEyK+CBzSqTnjmg3lNFqN
 gTFA3tqO5DTdQBZIn7tL1yGO93lI3JueDmsitorb3T+dMryjeARSpT8G4CRLSLQlGv9aSdH
 lRkb9LsLHAqHZLgBtx3/txzG5Ew2VaOo4ZbhHx3QF/4/w27x9REgLW29Xom8PTIti9EVweh
 X1P2+32mHWeEhOAV08ZjPPzvMXxkf9Jl2UFtAO3Lx54woakMcKDQec8OMIiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1793744595; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=fvn4+ks21SRxa0VzR/PJnePhk9H00+N90WHNmNwJuzg=;
 b=039rVZyMBeCn8YAsZAObUeKBL4uYjzUeivR2My786qQd+T2ByF8bR3N+oAyDTdRSAOaXa
 rBh13lpXx56UDQTyONWNb8fyiLoErSDsgTcBft4Yn9qmQReEr8vIxnSZvM3sKpPojCwyy9K
 48ek4F4f2jQg4mjKQaSn4KO38CMVTR2JXUlQ/XXFZX9ik0HEQRqwSOFPCZPOxSFqMQ/0tL6
 lriadJ+aRQwNgdeWtuF1JoyCot6dvblb6/t291Bs4fix3AEV0Kybu3gklVFneGcjAvF38J1
 qeNuSkGtVARV9Qtg6C4IAYTniSCyXM7B+6bwAd1/a9lmx4sWoxyMRWKNjAJw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 1D9D348CFB
	for <nouveau@lists.freedesktop.org>; Tue,  3 Nov 2026 22:23:14 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D9AC810F8BE;
	Tue,  3 Nov 2026 22:42:30 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BF8AD4330D;
	Tue,  3 Nov 2026 22:42:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E85861F0093A;
	Tue,  3 Nov 2026 22:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793745750;
	bh=fvn4+ks21SRxa0VzR/PJnePhk9H00+N90WHNmNwJuzg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Asgd9/r90J3R8FJI73oD19Ga27Kg5F5In/D4tHRbxAIur5Bar5CAJ9TEBXUCA0eBI
	 OpGmg48RJComZWu5vg+M+wvcpwqVHSdcdKcbtxcrCTEwjxMNLJUTCQ5artxEFQG/Q2
	 shor6Q8/o2M09k0GBA/gxIQiPHu6yQqRk99/fGT2ZMEw6UsyFnGIU9K+E/yq4FlR8s
	 ChNfOfLiYYkQEhWExaUALO/+8lUBVpIgtQdd9MVfBKrtMBTrPjIsN4nJqxiDQMKboZ
	 QIETuRfN8axk4ULDKl5czLgT0aj/JTumQRhtSIgBtR9z7ZAxP4PxSZ1N/yBDLhRgeL
	 4muKao+gO11Sg==
From: "Mario Limonciello (AMD)" <superm1@kernel.org>
Date: Tue, 03 Nov 2026 16:42:09 -0600
Subject: [PATCH v11 08/12] drm/bridge_connector: add luminance support
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: 
 <20261103-superm1-backlight-property-v11-8-00cce7b2ba22@kernel.org>
References: 
 <20261103-superm1-backlight-property-v11-0-00cce7b2ba22@kernel.org>
In-Reply-To: 
 <20261103-superm1-backlight-property-v11-0-00cce7b2ba22@kernel.org>
To: Maxime Ripard <mripard@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>
X-Mailer: b4 0.16.0
Message-ID-Hash: YEAVJTVZQI2H6MPBYRXJCOBXTEIYPDAF
X-Message-ID-Hash: YEAVJTVZQI2H6MPBYRXJCOBXTEIYPDAF
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/YEAVJTVZQI2H6MPBYRXJCOBXTEIYPDAF/>
Archived-At: 
 <https://lore.freedesktop.org/20261103-superm1-backlight-property-v11-8-00cce7b2ba22@kernel.org/>
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

Discover the last bridge in a chain that owns brightness control, attach
its relative luminance range to the connector, and forward atomic
luminance updates to it.

Do not infer panel luminance support from a terminal panel bridge. Panels
still have direct consumers, so their connector integration must remain
explicit.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
v11:
 * Drop .disable_luminance, it clobbered the bridge's saved level; the
   bridge disable path already turns the panel off
 * Fix checkpatch line length
v10:
 * Split bridge connector integration into a separate patch
 * Do not special-case panels in the generic bridge connector
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 39 ++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 2202e60444449..18927fed83732 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -125,6 +125,13 @@ struct drm_bridge_connector {
 	 */
 	struct drm_bridge *bridge_hdmi_cec;
 
+	/**
+	 * @bridge_luminance:
+	 *
+	 * The last bridge in the chain that controls panel luminance.
+	 */
+	struct drm_bridge *bridge_luminance;
+
 	/**
 	 * @hdmi_funcs:
 	 *
@@ -421,6 +428,17 @@ static int drm_bridge_connector_atomic_check(struct drm_connector *connector,
 	return 0;
 }
 
+static void
+drm_bridge_connector_set_luminance(const struct drm_connector_state *conn_state)
+{
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(conn_state->connector);
+	struct drm_bridge *bridge = bridge_connector->bridge_luminance;
+
+	if (bridge)
+		bridge->funcs->set_luminance(bridge, conn_state->luminance);
+}
+
 static const struct drm_connector_helper_funcs drm_bridge_connector_helper_funcs = {
 	.get_modes = drm_bridge_connector_get_modes,
 	.detect_ctx = drm_bridge_connector_detect_ctx,
@@ -429,6 +447,7 @@ static const struct drm_connector_helper_funcs drm_bridge_connector_helper_funcs
 	.enable_hpd = drm_bridge_connector_enable_hpd,
 	.disable_hpd = drm_bridge_connector_disable_hpd,
 	.atomic_check = drm_bridge_connector_atomic_check,
+	.set_luminance = drm_bridge_connector_set_luminance,
 };
 
 static enum drm_mode_status
@@ -835,6 +854,7 @@ static void drm_bridge_connector_put_bridges(struct drm_device *dev, void *data)
 	drm_bridge_put(bridge_connector->bridge_hdmi_audio);
 	drm_bridge_put(bridge_connector->bridge_dp_audio);
 	drm_bridge_put(bridge_connector->bridge_hdmi_cec);
+	drm_bridge_put(bridge_connector->bridge_luminance);
 }
 
 /**
@@ -918,6 +938,13 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 			drm_bridge_put(bridge_connector->bridge_detect);
 			bridge_connector->bridge_detect = drm_bridge_get(bridge);
 		}
+		if (bridge->ops & DRM_BRIDGE_OP_LUMINANCE) {
+			if (!bridge->funcs->set_luminance)
+				return ERR_PTR(-EINVAL);
+
+			drm_bridge_put(bridge_connector->bridge_luminance);
+			bridge_connector->bridge_luminance = drm_bridge_get(bridge);
+		}
 		if (bridge->ops & DRM_BRIDGE_OP_HDMI) {
 			if (bridge_connector->bridge_hdmi)
 				return ERR_PTR(-EBUSY);
@@ -1144,6 +1171,18 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 	if (panel_bridge)
 		drm_panel_bridge_set_orientation(connector, panel_bridge);
 
+	if (IS_ENABLED(CONFIG_DRM_LUMINANCE) &&
+	    bridge_connector->bridge_luminance &&
+	    !connector->luminance_property) {
+		struct drm_bridge *bridge = bridge_connector->bridge_luminance;
+
+		ret = drm_connector_attach_luminance_property(connector, 0,
+							      bridge->luminance_max,
+							      bridge->luminance);
+		if (ret)
+			return ERR_PTR(ret);
+	}
+
 	if (support_hdcp && IS_REACHABLE(CONFIG_DRM_DISPLAY_HELPER) &&
 	    IS_ENABLED(CONFIG_DRM_DISPLAY_HDCP_HELPER))
 		drm_connector_attach_content_protection_property(connector, true);

-- 
2.53.0

