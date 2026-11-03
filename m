Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 142E2606A32F
	for <nouveau@archiver.kernel.org>; Tue,  3 Nov 2026 22:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L7N1Rr7Y
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 788CB10F8EA;
	Tue,  3 Nov 2026 22:42:36 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 7B5A148D06;
	Tue,  3 Nov 2026 22:23:14 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1793744594;
 b=t3d1UIhrQor9aDwG919+DsGA5i1AvgHWCMC6bxwkZx2yAQsKCB4KeXNE2O331lWvbzKjZ
 TdtkSwLfdPCHyz0x6V74D0epyvlczo+G2BTHENVJuVs4VAEgCWDZPm0BQQHBTTN6H1pWq8Y
 NT+PEhWglft2c5Lb5Sxh0n07/n9t2fihJxg8h7N3ZEa+Q0pneeh31lZArrPnX3zu1VUo06C
 uTwBZ0OaEoahSbSLkEcNlHH4r49+jqz1eoHL7tWtzfVSePgFrdVDa8thAtcFo3C5knHHhWS
 RucLYvsS7+orlQo3MjfahspzyaGixKLZvC842v+HX2JsU1xWUsmvP0zjjtAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1793744594; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=7uMkYbECLUxTM5pa0kbpXZQUVRouDnrW7EIXtuo+nfk=;
 b=EsxPj2dYXN1s0GZqE+D83SGPfMW51KlQKPmUDnJG6BWf4/cMs8iOSqjIMobyEncDAKgd5
 PJYNG1QK0uCUEUJcgPvDsFrUrerhMyh/Xw0YUhr6T60QJ7BQC5UbvkfgG+iw6yyvsYd9e0y
 9Fx3rRW+SZX5jB7w4YySwQ9lzz+kVxh4ocJ8rcoZWA8PkXcBOd24px6HgTbkQ80KHJkk4GN
 Dy/RXi2bFNlVwYw8E9SPvKufig4ObhUUFJN4bc7VuEM/0R+WsNw7MfrDjq+d3PMJdHdqLd0
 udApTR3MO0pN0R3hp1ppJcKl5EHZ6tteW8YOz0fugbNMRMozpZcooHbhE4xg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id E6E8A48D16
	for <nouveau@lists.freedesktop.org>; Tue,  3 Nov 2026 22:23:10 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8A1C010F770;
	Tue,  3 Nov 2026 22:42:27 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0EA4360A90;
	Tue,  3 Nov 2026 22:42:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1519F1F00A15;
	Tue,  3 Nov 2026 22:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793745746;
	bh=7uMkYbECLUxTM5pa0kbpXZQUVRouDnrW7EIXtuo+nfk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=L7N1Rr7YXLGtfentC4e92qKHIdhSAESR8rBOSUSaDNmbU41lY7iWvzXdWmT+2nLcs
	 DrCzNGclNax/V7Hq1Yl6/+PNjpSC8PGctGeERhD0wdN/5oZIC0faJVkEnVbU3JkPqQ
	 nPPnzro08OLFCw1TIOA3zKpYa62DNimUl1ISjiq0+YhlMaPo+aY/swuP/Hg3J8z85d
	 edlbWvL5m+Xsi0dG7yadtPyLCfVcW2TYEoNC0y9dHKqc2pMiBDi31zvk1make2Joao
	 UrX9eojlOPxY62hz0nPNkf2WadHW2C4BmDZmZk3HgLIOwvACEdJM5QnI2cXiZOZrmI
	 5gbad6ha0vboA==
From: "Mario Limonciello (AMD)" <superm1@kernel.org>
Date: Tue, 03 Nov 2026 16:42:07 -0600
Subject: [PATCH v11 06/12] drm/bridge: add connector luminance operations
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: 
 <20261103-superm1-backlight-property-v11-6-00cce7b2ba22@kernel.org>
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
Message-ID-Hash: K6KUBKZJ4WYRXG44733K4GLZKMY7TFGB
X-Message-ID-Hash: K6KUBKZJ4WYRXG44733K4GLZKMY7TFGB
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/K6KUBKZJ4WYRXG44733K4GLZKMY7TFGB/>
Archived-At: 
 <https://lore.freedesktop.org/20261103-superm1-backlight-property-v11-6-00cce7b2ba22@kernel.org/>
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
v11:
 * Drop panel bridge declarations re-added by a bad rebase (Sashiko)
 * Document @luminance as the initial level
v10:
 * Split bridge operations out of the combined panel and bridge patch
---
 include/drm/drm_bridge.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 1981d24a700d2..240a69c1233e7 100644
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
+	/** @luminance: Initial relative luminance level. */
+	unsigned int luminance;
 	/**
 	 * @type: Type of the connection at the bridge output
 	 * (DRM_MODE_CONNECTOR_*). For bridges at the end of this chain this

-- 
2.53.0

