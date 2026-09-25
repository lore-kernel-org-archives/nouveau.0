Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35A52C98326
	for <nouveau@archiver.kernel.org>; Fri, 25 Sep 2026 07:20:00 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0A57C10F8C7;
	Fri, 25 Sep 2026 07:20:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="Ep+P9Kdb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5Q3vXGM4";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 773EC4869D;
	Fri, 25 Sep 2026 07:02:05 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1790319725;
 b=STq6OmdVDD0uhh0IQj63JU13dIclMyPtokkZQEJW6SLyoE0Y8Vn0Qlps6zcrzPrl5kRgV
 YpSgHFk7fH0HbH4k3otCks3mJr3DlTl3tLbdDbZP7v2MXNmIsdx1nP3b80zivyoDj74dHm+
 tl98hrDMu6ffaCyY6lh+xBJhWoPkcBOX3ptd67HO0CfInpq4by7QTEWjWBzlS2n28xDXXbZ
 e1oFhQMVsIed64+vQrwnGxM7kE+iR2Mo2yE7c/ch89V2oY/Y4P3lJBGX/zv0NX82BawwKEt
 RoBWvSxgj3O+djYEmne+s+vOKi0K4dcs9cYV1DlhhtMdTLAgnJyza9ajrQWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1790319725; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=NrwHL2kcG+Vt4W3ByUonzTmcHea4Q9dyMEh/DeXT5Ok=;
 b=AJuUzK+MXFg2eZ/Snt02Brfbr7rIVuW520rIFrLEpx1OU01fwGjBb+C7Ob8BI8Tm89PrL
 eRzKbLbGqzy3W4rnq4EShWk5XB1vw+JSnQ21U3WNBpfY+SOzV6QlEUdTmm8UhfO3HLKJjk8
 JunTXyt6D4cUMJsuyzCxhNGduvPOYpFt/rZ5ZNmhJVH5BMnOO/pYtViu6RxxeHjTgznlYwc
 KT+V+W3U7vQy/5kp3Sx1j+UqEHKck7kDkvKDQOmcfDTF/2bsgDdriHiMwsiTfmkkjmhjqIq
 hIqiBgUIqETDUeH6fNjUBVrdZV3TDuHkFfUfvEfZ3GnA85E32R/yLKEDKmAg==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=suse.de;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=suse.de policy.dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=suse.de;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=suse.de policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 7A1F247C2F
	for <nouveau@lists.freedesktop.org>; Fri, 25 Sep 2026 07:02:03 +0000 (UTC)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8AB9B10F8C1;
	Fri, 25 Sep 2026 07:19:57 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 2672A1FE05;
	Fri, 25 Sep 2026 07:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1790320778;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NrwHL2kcG+Vt4W3ByUonzTmcHea4Q9dyMEh/DeXT5Ok=;
	b=Ep+P9KdbBV1MwfAV+EVSM+XHvYokB1fuYKtSyEidHOytqSEzdwm6aTml+p9gEr4r4a8xgE
	CWQTaAZPKjR+iG7HSqL8t7F4UWkhIwgOknXtL54U/fehBA7O7Belzn232Cm3TIcVJFRYEh
	HXNMxQpoiBAg0fkiqtyDBmFrQWOa+rY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790320778;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NrwHL2kcG+Vt4W3ByUonzTmcHea4Q9dyMEh/DeXT5Ok=;
	b=5Q3vXGM4I9spI5/CLeote8OUvbbBwR85Xj6u8e8lEn2II6Wy/Pvux2V8/0MdxZFYtXUSKy
	X4UUiWha6U180JDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 53135138A7;
	Fri, 25 Sep 2026 07:19:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 5u4JJoggtmpbBQAAD6G6ig:T2
	(envelope-from <tzimmermann@suse.de>); Fri, 25 Sep 2026 07:19:37 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com,
	javierm@redhat.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	jani.nikula@linux.intel.com,
	Alexander.Deucher@amd.com
Subject: [PATCH v3 1/2] drm/fbdev: Move fbdev module parameters next to module
 init
Date: Fri, 25 Sep 2026 09:17:49 +0200
Message-ID: <20260925071933.44283-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260925071933.44283-1-tzimmermann@suse.de>
References: <20260925071933.44283-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 2672A1FE05
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
Message-ID-Hash: BLIJG65F7NM6GQHQ4SPAZZEDJ2GSDT2C
X-Message-ID-Hash: BLIJG65F7NM6GQHQ4SPAZZEDJ2GSDT2C
X-MailFrom: tzimmermann@suse.de
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-tegra@vger.kernel.org, sashiko-reviews@lists.linux.dev,
 Alex Deucher <alexander.deucher@amd.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/BLIJG65F7NM6GQHQ4SPAZZEDJ2GSDT2C/>
Archived-At: 
 <https://lore.freedesktop.org/20260925071933.44283-2-tzimmermann@suse.de/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Define the parameters for fbdev emulation in the source file with the
module-initialization and exit code of drm_kms_helper.ko. The parameters
control some aspects of DRM's fbdev emulation. Common usage looks like

  drm_kms_helper.drm_fbdev_overalloc=200

on the kernel's command line. This has been possible for many years
and changing it would likely upset users.

The emulation code is supposed to be moved into the module for DRM
clients. Keeping the parameters in drm_kms_helper.ko avoids breaking
systems the use them in the way described above.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/drm_crtc_helper_internal.h |  9 +++++
 drivers/gpu/drm/drm_fb_helper.c            | 32 +-----------------
 drivers/gpu/drm/drm_kms_helper_common.c    | 39 ++++++++++++++++++++++
 3 files changed, 49 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/drm_crtc_helper_internal.h b/drivers/gpu/drm/drm_crtc_helper_internal.h
index bae73936acf9..adcc9a2e24ee 100644
--- a/drivers/gpu/drm/drm_crtc_helper_internal.h
+++ b/drivers/gpu/drm/drm_crtc_helper_internal.h
@@ -29,6 +29,8 @@
 #ifndef __DRM_CRTC_HELPER_INTERNAL_H__
 #define __DRM_CRTC_HELPER_INTERNAL_H__
 
+#include <linux/types.h>
+
 enum drm_mode_status;
 struct drm_connector;
 struct drm_crtc;
@@ -36,6 +38,13 @@ struct drm_display_mode;
 struct drm_encoder;
 struct drm_modeset_acquire_ctx;
 
+/* drm_kms_helper_common.c */
+#if IS_ENABLED(CONFIG_DRM_FBDEV_EMULATION)
+extern bool drm_fbdev_emulation;
+extern int drm_fbdev_overalloc;
+extern bool drm_leak_fbdev_smem;
+#endif
+
 /* drm_probe_helper.c */
 enum drm_mode_status drm_crtc_mode_valid(struct drm_crtc *crtc,
 					 const struct drm_display_mode *mode);
diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index d4664ed468b2..76195410db60 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -43,39 +43,9 @@
 #include <drm/drm_vblank.h>
 
 #include "drm_internal.h"
+#include "drm_crtc_helper_internal.h"
 #include "drm_crtc_internal.h"
 
-static bool drm_fbdev_emulation = true;
-module_param_named(fbdev_emulation, drm_fbdev_emulation, bool, 0600);
-MODULE_PARM_DESC(fbdev_emulation,
-		 "Enable legacy fbdev emulation [default=true]");
-
-static int drm_fbdev_overalloc = CONFIG_DRM_FBDEV_OVERALLOC;
-module_param(drm_fbdev_overalloc, int, 0444);
-MODULE_PARM_DESC(drm_fbdev_overalloc,
-		 "Overallocation of the fbdev buffer (%) [default="
-		 __MODULE_STRING(CONFIG_DRM_FBDEV_OVERALLOC) "]");
-
-/*
- * In order to keep user-space compatibility, we want in certain use-cases
- * to keep leaking the fbdev physical address to the user-space program
- * handling the fbdev buffer.
- *
- * This is a bad habit, essentially kept to support closed-source OpenGL
- * drivers that should really be moved into open-source upstream projects
- * instead of using legacy physical addresses in user space to communicate
- * with other out-of-tree kernel modules.
- *
- * This module_param *should* be removed as soon as possible and be
- * considered as a broken and legacy behaviour from a modern fbdev device.
- */
-static bool drm_leak_fbdev_smem;
-#if IS_ENABLED(CONFIG_DRM_FBDEV_LEAK_PHYS_SMEM)
-module_param_unsafe(drm_leak_fbdev_smem, bool, 0600);
-MODULE_PARM_DESC(drm_leak_fbdev_smem,
-		 "Allow unsafe leaking fbdev physical smem address [default=false]");
-#endif
-
 /**
  * DOC: fbdev helpers
  *
diff --git a/drivers/gpu/drm/drm_kms_helper_common.c b/drivers/gpu/drm/drm_kms_helper_common.c
index b5d5b469b444..1e55ecac4698 100644
--- a/drivers/gpu/drm/drm_kms_helper_common.c
+++ b/drivers/gpu/drm/drm_kms_helper_common.c
@@ -25,10 +25,49 @@
  *
  */
 
+#include <linux/export.h>
 #include <linux/module.h>
+#include <linux/moduleparam.h>
 
+#include "drm_crtc_helper_internal.h"
 #include "drm_panic_internal.h"
 
+#if IS_ENABLED(CONFIG_DRM_FBDEV_EMULATION)
+bool drm_fbdev_emulation = true;
+EXPORT_SYMBOL(drm_fbdev_emulation);
+module_param_named(fbdev_emulation, drm_fbdev_emulation, bool, 0600);
+MODULE_PARM_DESC(fbdev_emulation, "Enable legacy fbdev emulation [default=true]");
+
+int drm_fbdev_overalloc = CONFIG_DRM_FBDEV_OVERALLOC;
+EXPORT_SYMBOL(drm_fbdev_overalloc);
+module_param(drm_fbdev_overalloc, int, 0444);
+MODULE_PARM_DESC(drm_fbdev_overalloc,
+		 "Overallocation of the fbdev buffer (%) [default="
+		 __MODULE_STRING(CONFIG_DRM_FBDEV_OVERALLOC) "]");
+
+/*
+ * In order to keep user-space compatibility, we want in certain use-cases
+ * to keep leaking the fbdev physical address to the user-space program
+ * handling the fbdev buffer.
+ *
+ * This is a bad habit, essentially kept to support closed-source OpenGL
+ * drivers that should really be moved into open-source upstream projects
+ * instead of using legacy physical addresses in user space to communicate
+ * with other out-of-tree kernel modules.
+ *
+ * This module_param *should* be removed as soon as possible and be
+ * considered as a broken and legacy behaviour from a modern fbdev device.
+ */
+bool drm_leak_fbdev_smem;
+EXPORT_SYMBOL(drm_leak_fbdev_smem);
+#if IS_ENABLED(CONFIG_DRM_FBDEV_LEAK_PHYS_SMEM)
+module_param_unsafe(drm_leak_fbdev_smem, bool, 0600);
+MODULE_PARM_DESC(drm_leak_fbdev_smem,
+		 "Allow unsafe leaking fbdev physical smem address [default=false]");
+#endif
+
+#endif
+
 static int __init drm_kms_helper_init(void)
 {
 	return drm_panic_helper_init();
-- 
2.55.0

