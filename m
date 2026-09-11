Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA1A3C88E50
	for <nouveau@archiver.kernel.org>; Fri, 11 Sep 2026 12:46:44 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 88ACC10F5CC;
	Fri, 11 Sep 2026 12:46:44 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 8581F42724;
	Fri, 11 Sep 2026 12:29:20 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1789129760;
 b=bJSKShKAHUF24zMEH7uEJ6k6H7a/cObWAhSDFnkBS0S78JZKD6wKCrWzCdN/4UyUqoVhB
 cQITVTb5u5KlSRu0dhdZuDjT7+AA8her8PmD+4YwwSxr5GVDKoC5ZVEQ+e3wQhUhOEXIzoA
 5joYhb8vKPlfvmQt8se21d/XXWIFX1jw89R764uBPXkRNRs4jdyHfT5GCiWqR2Dq9IN+D2o
 zh3/9JIny/As1G919caWDJSCyvIgWHCqisc44aO9kb9as+i0fniQbJBZzzrq7St1rme+99t
 40c/mJ0vnbTasvoMRWSqSKWpqi4TIpLlS7YQVmE4pg3/VLR4UTeIklxopJkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1789129760; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=yP1qP9oEfRwqZz2UmA4hsRnPHC9gYON0rEKlw9gceFk=;
 b=FWbjr1IpMyjkckD9gwmUd6XXomzzJjrkoqS6/+4SAy3rPtk7SUP5quSNujaM839SCvf6T
 bZDLWYmcKjGNXN8KwpkX56AmBU3xjcjHMU+VcnQakw6/15Gcign3yzKhtgOwtnAJdOwaGVR
 A0H7pexqBk+p8IpBy7Z95pgFDARvP4bHZO7o89aXbC1SUcbWR6R04aRceA5N7yVrvfYSthu
 7UnVhusZbcY+SEb0g7kksPlLnu6Krgwc0gbJWogqn8/G7XLuE9LJXRplXspLGdpEllpvkv/
 LXBO+rFi7LGYWQmOQeCAMoxvtExb4rIMreL4vW4vJ0F4bygasZBAukEoWt/Q==
ARC-Authentication-Results: i=1; mail.freedesktop.org; dkim=fail;
  arc=none (Message is not ARC signed);
  dmarc=fail (Used From Domain Record) header.from=suse.de policy.dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=fail;
 arc=none (Message is not ARC signed);
 dmarc=fail (Used From Domain Record) header.from=suse.de policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id E89CD4243A
	for <nouveau@lists.freedesktop.org>; Fri, 11 Sep 2026 12:29:17 +0000 (UTC)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7986110F5D3
	for <nouveau@lists.freedesktop.org>; Fri, 11 Sep 2026 12:46:41 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B54A01FD88;
	Fri, 11 Sep 2026 12:45:52 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0FD8D13794;
	Fri, 11 Sep 2026 12:45:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id +LysAgD4o2r8EQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Fri, 11 Sep 2026 12:45:52 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com,
	javierm@redhat.com,
	airlied@gmail.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	geert@linux-m68k.org,
	rdunlap@infradead.org
Subject: [PATCH v5 12/14] drm/panic: Internalize panic locking in DRM core and
 helpers
Date: Fri, 11 Sep 2026 14:44:05 +0200
Message-ID: <20260911124540.279841-13-tzimmermann@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260911124540.279841-1-tzimmermann@suse.de>
References: <20260911124540.279841-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: B54A01FD88
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLo585esf9b7txaosbn5shab9z)]
X-Rspamd-Action: no action
Message-ID-Hash: VABDONXK5OZAZ7G2EBLSNOXGACS5XIRZ
X-Message-ID-Hash: VABDONXK5OZAZ7G2EBLSNOXGACS5XIRZ
X-MailFrom: tzimmermann@suse.de
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-hyperv@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, nouveau@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, virtualization@lists.linux.dev,
 sashiko-reviews@lists.linux.dev
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/VABDONXK5OZAZ7G2EBLSNOXGACS5XIRZ/>
Archived-At: 
 <https://lore.freedesktop.org/20260911124540.279841-13-tzimmermann@suse.de/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

None of the DRM drivers handles panic locking. Declare the interfaces
in an internal header file. Move the trylock required during the panic
into the DRM core's sources.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 Documentation/gpu/drm-kms.rst        |  3 ++
 MAINTAINERS                          |  3 +-
 drivers/gpu/drm/drm_atomic_helper.c  |  2 +-
 drivers/gpu/drm/drm_drv.c            |  2 +-
 drivers/gpu/drm/drm_panic.c          |  4 ++
 drivers/gpu/drm/drm_panic_internal.h | 55 +++++++++++++++++++++++
 include/drm/drm_panic.h              | 65 ----------------------------
 7 files changed, 66 insertions(+), 68 deletions(-)
 create mode 100644 drivers/gpu/drm/drm_panic_internal.h

diff --git a/Documentation/gpu/drm-kms.rst b/Documentation/gpu/drm-kms.rst
index 0dd440a14946..8988fd64369b 100644
--- a/Documentation/gpu/drm-kms.rst
+++ b/Documentation/gpu/drm-kms.rst
@@ -421,6 +421,9 @@ Plane Panic Functions Reference
 .. kernel-doc:: include/drm/drm_panic.h
    :internal:
 
+.. kernel-doc:: drivers/gpu/drm/drm_panic_internal.h
+   :internal:
+
 .. kernel-doc:: drivers/gpu/drm/drm_panic.c
    :export:
 
diff --git a/MAINTAINERS b/MAINTAINERS
index 2e01cc9ff176..eb7ee0bfc6af 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9124,7 +9124,8 @@ S:	Supported
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	drivers/gpu/drm/drm_draw.c
 F:	drivers/gpu/drm/drm_draw_internal.h
-F:	drivers/gpu/drm/drm_panic*.c
+F:	drivers/gpu/drm/drm_panic.c
+F:	drivers/gpu/drm/drm_panic_internal.h
 F:	drivers/gpu/drm/tests/drm_panic_test.c
 F:	include/drm/drm_panic.h
 F:	include/drm/drm_panic_helper.h
diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 285aac3554df..af3934df3313 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -41,7 +41,6 @@
 #include <drm/drm_drv.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_atomic_helper.h>
-#include <drm/drm_panic.h>
 #include <drm/drm_print.h>
 #include <drm/drm_self_refresh_helper.h>
 #include <drm/drm_vblank.h>
@@ -49,6 +48,7 @@
 
 #include "drm_crtc_helper_internal.h"
 #include "drm_crtc_internal.h"
+#include "drm_panic_internal.h"
 
 /**
  * DOC: overview
diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 8c0879c336e5..64055514acbf 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -51,13 +51,13 @@
 #include <drm/drm_file.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_mode_object.h>
-#include <drm/drm_panic.h>
 #include <drm/drm_print.h>
 #include <drm/drm_privacy_screen_machine.h>
 #include <drm/drm_ras_genl_family.h>
 
 #include "drm_crtc_internal.h"
 #include "drm_internal.h"
+#include "drm_panic_internal.h"
 
 MODULE_AUTHOR("Gareth Hughes, Leif Delgass, José Fonseca, Jon Smirl");
 MODULE_DESCRIPTION("DRM shared core routines");
diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
index 2bb172231dd0..4836e974f86d 100644
--- a/drivers/gpu/drm/drm_panic.c
+++ b/drivers/gpu/drm/drm_panic.c
@@ -35,6 +35,7 @@
 
 #include "drm_crtc_internal.h"
 #include "drm_draw_internal.h"
+#include "drm_panic_internal.h"
 
 MODULE_AUTHOR("Jocelyn Falempe");
 MODULE_DESCRIPTION("DRM panic handler");
@@ -975,6 +976,9 @@ int drm_plane_helper_display_panic_screen(struct drm_plane *plane, const char *d
 }
 EXPORT_SYMBOL(drm_plane_helper_display_panic_screen);
 
+#define drm_panic_trylock(dev, flags) \
+	raw_spin_trylock_irqsave(&(dev)->mode_config.panic_lock, flags)
+
 static void drm_panic_display_panic_screen(struct drm_plane *plane, const char *description)
 {
 #if defined(CONFIG_DRM_PANIC_FOREGROUND_COLOR)
diff --git a/drivers/gpu/drm/drm_panic_internal.h b/drivers/gpu/drm/drm_panic_internal.h
new file mode 100644
index 000000000000..c68d64c56e15
--- /dev/null
+++ b/drivers/gpu/drm/drm_panic_internal.h
@@ -0,0 +1,55 @@
+/* SPDX-License-Identifier: GPL-2.0 or MIT */
+
+/*
+ * Copyright (c) 2024 Intel
+ * Copyright (c) 2024 Red Hat
+ */
+
+#ifndef __DRM_PANIC_INTERNAL_H__
+#define __DRM_PANIC_INTERNAL_H__
+
+#include <linux/spinlock.h>
+
+struct drm_device;
+
+#ifdef CONFIG_DRM_PANIC
+
+/**
+ * drm_panic_lock - protect panic printing relevant state
+ * @dev: struct drm_device
+ * @flags: unsigned long irq flags you need to pass to the unlock() counterpart
+ *
+ * This function must be called to protect software and hardware state that the
+ * panic printing code must be able to rely on. The protected sections must be
+ * as small as possible. It uses the irqsave/irqrestore variant, and can be
+ * called from irq handler. Examples include:
+ *
+ * - Access to peek/poke or other similar registers, if that is the way the
+ *   driver prints the pixels into the scanout buffer at panic time.
+ *
+ * - Updates to pointers like &drm_plane.state, allowing the panic handler to
+ *   safely deference these. This is done in drm_atomic_helper_swap_state().
+ *
+ * - An state that isn't invariant and that the driver must be able to access
+ *   during panic printing.
+ */
+#define drm_panic_lock(dev, flags) \
+	raw_spin_lock_irqsave(&(dev)->mode_config.panic_lock, flags)
+
+/**
+ * drm_panic_unlock - end of the panic printing critical section
+ * @dev: struct drm_device
+ * @flags: irq flags that were returned when acquiring the lock
+ *
+ * Unlocks the raw spinlock acquired by either drm_panic_lock() or
+ * drm_panic_trylock().
+ */
+#define drm_panic_unlock(dev, flags) \
+	raw_spin_unlock_irqrestore(&(dev)->mode_config.panic_lock, flags)
+
+#else
+static inline void drm_panic_lock(struct drm_device *dev, unsigned long flags) {}
+static inline void drm_panic_unlock(struct drm_device *dev, unsigned long flags) {}
+#endif
+
+#endif /* __DRM_PANIC_INTERNAL_H__ */
diff --git a/include/drm/drm_panic.h b/include/drm/drm_panic.h
index 430df536de14..99572b7eeab9 100644
--- a/include/drm/drm_panic.h
+++ b/include/drm/drm_panic.h
@@ -8,11 +8,9 @@
 #ifndef __DRM_PANIC_H__
 #define __DRM_PANIC_H__
 
-#include <linux/module.h>
 #include <linux/types.h>
 #include <linux/iosys-map.h>
 
-#include <drm/drm_device.h>
 #include <drm/drm_fourcc.h>
 
 struct page;
@@ -85,71 +83,8 @@ struct drm_scanout_buffer {
 	 * set_pixel()
 	 */
 	void *private;
-
 };
 
-#ifdef CONFIG_DRM_PANIC
-
-/**
- * drm_panic_trylock - try to enter the panic printing critical section
- * @dev: struct drm_device
- * @flags: unsigned long irq flags you need to pass to the unlock() counterpart
- *
- * The panic-printing code calls this function. The panic printing attempt must
- * be aborted if the trylock fails.
- *
- * Return:
- * %0 when failing to acquire the raw spinlock, nonzero on success.
- */
-#define drm_panic_trylock(dev, flags) \
-	raw_spin_trylock_irqsave(&(dev)->mode_config.panic_lock, flags)
-
-/**
- * drm_panic_lock - protect panic printing relevant state
- * @dev: struct drm_device
- * @flags: unsigned long irq flags you need to pass to the unlock() counterpart
- *
- * This function must be called to protect software and hardware state that the
- * panic printing code must be able to rely on. The protected sections must be
- * as small as possible. It uses the irqsave/irqrestore variant, and can be
- * called from irq handler. Examples include:
- *
- * - Access to peek/poke or other similar registers, if that is the way the
- *   driver prints the pixels into the scanout buffer at panic time.
- *
- * - Updates to pointers like &drm_plane.state, allowing the panic handler to
- *   safely deference these. This is done in drm_atomic_helper_swap_state().
- *
- * - An state that isn't invariant and that the driver must be able to access
- *   during panic printing.
- */
-
-#define drm_panic_lock(dev, flags) \
-	raw_spin_lock_irqsave(&(dev)->mode_config.panic_lock, flags)
-
-/**
- * drm_panic_unlock - end of the panic printing critical section
- * @dev: struct drm_device
- * @flags: irq flags that were returned when acquiring the lock
- *
- * Unlocks the raw spinlock acquired by either drm_panic_lock() or
- * drm_panic_trylock().
- */
-#define drm_panic_unlock(dev, flags) \
-	raw_spin_unlock_irqrestore(&(dev)->mode_config.panic_lock, flags)
-
-#else
-
-static inline bool drm_panic_trylock(struct drm_device *dev, unsigned long flags)
-{
-	return true;
-}
-
-static inline void drm_panic_lock(struct drm_device *dev, unsigned long flags) {}
-static inline void drm_panic_unlock(struct drm_device *dev, unsigned long flags) {}
-
-#endif
-
 #if defined(CONFIG_DRM_PANIC_SCREEN_QR_CODE)
 size_t drm_panic_qr_max_data_size(u8 version, size_t url_len);
 
-- 
2.55.0

