Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA0E5C44525
	for <nouveau@archiver.kernel.org>; Wed, 21 Jan 2026 12:57:09 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9389710E765;
	Wed, 21 Jan 2026 12:57:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="R4A+PMNi";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=suse.com header.i=@suse.com header.b="R4A+PMNi";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id DEED840221;
	Wed, 21 Jan 2026 12:48:22 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1768999702;
 b=ETW4QbchBWDNWwPQJxmVIZ0uJPohryV0m4DHknNqzuhxGdUgTs5KfUKvq1f/RZoS7fiwx
 itiVnXW2zIlu/FWB18xZRhsCH24GZlho6VZsUenO44M6V8Z0dI79j+rW1p3u21ZEMvyV6iI
 MAV2SrIuPJBjhs9iq7Z3oidawKDxADB+B/NfhXJ4N6T1CI0EVNBYxsWoyK2TfIWhl9GFEIq
 mLzizTqqy/dfzKl4Yyd9Yb+dzK1ND67c9eJT3fJsU8pX6eoViwCHbzGjhNQ3BkF/DJL0sOy
 QbzayNp9xU+LcVFIShueNWfFpmMjIBA67Kcor01qovmIwZlhNG7hujABYcXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1768999702; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=Q6cpBlQu0Ap+fT+JaqOV2zSr1RCFwBggI0A+6THe6Gs=;
 b=px8cMcEu0BJcXJayptEZcEf8agCGDfGpAc9wlnWVbr/KkUs6708Ic2VOtUIwqCkmiG7jK
 OxAg0z6dLtdycv6xXVkV/iclPuxqJzrDnZABiEomc0AI+hx0PwsvHfbLtc3q1634COHPRQZ
 aqNP3sY3D1aZQBUYWARqmCqGaM+hh5Lu/uPzWiJdsc0WMARf5p4WR2pFc/fP07BRnM7+jEv
 ri3xs84yYACqy5Atg3cm8NC43HVfYlM/m2pq4D8ldulImQlsZIrFxqMP+25E6oX+t1gyuRg
 OVGuU3Hyk3tjoNOfmGY8P/2qIQ26DEB1fxmwCCeC8bCdZhT150nOOyDjC/Rg==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=suse.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=suse.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=suse.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=suse.com
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 2147F44CA1
	for <nouveau@lists.freedesktop.org>; Tue, 20 Jan 2026 08:20:07 +0000 (UTC)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	by gabe.freedesktop.org (Postfix) with ESMTPS id BC38310E57D
	for <nouveau@lists.freedesktop.org>; Tue, 20 Jan 2026 08:28:50 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 623B2337C0;
	Tue, 20 Jan 2026 08:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1768897729;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q6cpBlQu0Ap+fT+JaqOV2zSr1RCFwBggI0A+6THe6Gs=;
	b=R4A+PMNiMN3Hwix5ayoiKJUrTVlfduigtxPZ34/x26fpUxxGJEHEIcHdjjj50H2MCfs11w
	kwZcDIZNAzAYYt9LAEgUBYEPPUioc124NZa6/lxEcjUknpZbsxzIfnNBd5YM/7/AdwvsKJ
	R2JGq9ed7ZoPQXSllWjffD2FbNyAm0w=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1768897729;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q6cpBlQu0Ap+fT+JaqOV2zSr1RCFwBggI0A+6THe6Gs=;
	b=R4A+PMNiMN3Hwix5ayoiKJUrTVlfduigtxPZ34/x26fpUxxGJEHEIcHdjjj50H2MCfs11w
	kwZcDIZNAzAYYt9LAEgUBYEPPUioc124NZa6/lxEcjUknpZbsxzIfnNBd5YM/7/AdwvsKJ
	R2JGq9ed7ZoPQXSllWjffD2FbNyAm0w=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 23A103EA65;
	Tue, 20 Jan 2026 08:28:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 6AlSB8E8b2k0dwAAD6G6ig
	(envelope-from <tzimmermann@suse.com>); Tue, 20 Jan 2026 08:28:49 +0000
From: Thomas Zimmermann <tzimmermann@suse.com>
To: kernel-kabi@suse.de
Subject: [PATCH 1/2] drm, fbcon,
 vga_switcheroo: Avoid race condition in fbcon setup
Date: Tue, 20 Jan 2026 09:28:04 +0100
Message-ID: <20260120082841.11381-2-tzimmermann@suse.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260120082841.11381-1-tzimmermann@suse.com>
References: <20260120082841.11381-1-tzimmermann@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:url,suse.com:mid,imap1.dmz-prg2.suse.org:helo,suse.de:email,lists.freedesktop.org:email];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-MailFrom: tzimmermann@suse.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: 6TPDSVZP2WUBGEP4QSLD25LPF5UE2NLP
X-Message-ID-Hash: 6TPDSVZP2WUBGEP4QSLD25LPF5UE2NLP
X-Mailman-Approved-At: Wed, 21 Jan 2026 12:48:20 +0000
CC: Javier Martinez Canillas <javierm@redhat.com>,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, stable@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/6TPDSVZP2WUBGEP4QSLD25LPF5UE2NLP/>
Archived-At: 
 <https://lore.freedesktop.org/20260120082841.11381-2-tzimmermann@suse.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

From: Thomas Zimmermann <tzimmermann@suse.de>

Protect vga_switcheroo_client_fb_set() with console lock. Avoids OOB
access in fbcon_remap_all(). Without holding the console lock the call
races with switching outputs.

VGA switcheroo calls fbcon_remap_all() when switching clients. The fbcon
function uses struct fb_info.node, which is set by register_framebuffer().
As the fb-helper code currently sets up VGA switcheroo before registering
the framebuffer, the value of node is -1 and therefore not a legal value.
For example, fbcon uses the value within set_con2fb_map() [1] as an index
into an array.

Moving vga_switcheroo_client_fb_set() after register_framebuffer() can
result in VGA switching that does not switch fbcon correctly.

Therefore move vga_switcheroo_client_fb_set() under fbcon_fb_registered(),
which already holds the console lock. Fbdev calls fbcon_fb_registered()
from within register_framebuffer(). Serializes the helper with VGA
switcheroo's call to fbcon_remap_all().

Although vga_switcheroo_client_fb_set() takes an instance of struct fb_info
as parameter, it really only needs the contained fbcon state. Moving the
call to fbcon initialization is therefore cleaner than before. Only amdgpu,
i915, nouveau and radeon support vga_switcheroo. For all other drivers,
this change does nothing.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Link: https://elixir.bootlin.com/linux/v6.17/source/drivers/video/fbdev/core/fbcon.c#L2942 # [1]
Fixes: 6a9ee8af344e ("vga_switcheroo: initial implementation (v15)")
Acked-by: Javier Martinez Canillas <javierm@redhat.com>
Acked-by: Alex Deucher <alexander.deucher@amd.com>
Cc: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org
Cc: linux-fbdev@vger.kernel.org
Cc: <stable@vger.kernel.org> # v2.6.34+
Link: https://patch.msgid.link/20251105161549.98836-1-tzimmermann@suse.de
(cherry picked from commit eb76d0f5553575599561010f24c277cc5b31d003)
---
 drivers/gpu/drm/drm_fb_helper.c            | 6 ------
 drivers/gpu/drm/i915/display/intel_fbdev.c | 2 --
 drivers/gpu/drm/radeon/radeon_fbdev.c      | 3 ---
 drivers/video/fbdev/core/fbcon.c           | 9 +++++++++
 4 files changed, 9 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index b507c1c008a3e..3915a8b17bc4c 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -32,7 +32,6 @@
 #include <linux/console.h>
 #include <linux/pci.h>
 #include <linux/sysrq.h>
-#include <linux/vga_switcheroo.h>
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_drv.h>
@@ -1668,7 +1667,6 @@ static int drm_fb_helper_find_sizes(struct drm_fb_helper *fb_helper,
 static int drm_fb_helper_single_fb_probe(struct drm_fb_helper *fb_helper)
 {
 	struct drm_client_dev *client = &fb_helper->client;
-	struct drm_device *dev = fb_helper->dev;
 	struct drm_fb_helper_surface_size sizes;
 	int ret;
 
@@ -1687,10 +1685,6 @@ static int drm_fb_helper_single_fb_probe(struct drm_fb_helper *fb_helper)
 
 	strcpy(fb_helper->fb->comm, "[fbcon]");
 
-	/* Set the fb info for vgaswitcheroo clients. Does nothing otherwise. */
-	if (dev_is_pci(dev->dev))
-		vga_switcheroo_client_fb_set(to_pci_dev(dev->dev), fb_helper->info);
-
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
index 31d0d695d5671..8bad7e7909f7b 100644
--- a/drivers/gpu/drm/i915/display/intel_fbdev.c
+++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
@@ -36,7 +36,6 @@
 #include <linux/string.h>
 #include <linux/sysrq.h>
 #include <linux/tty.h>
-#include <linux/vga_switcheroo.h>
 
 #include <drm/drm_crtc.h>
 #include <drm/drm_fb_helper.h>
@@ -337,7 +336,6 @@ static int intelfb_create(struct drm_fb_helper *helper,
 	ifbdev->vma_flags = flags;
 
 	intel_runtime_pm_put(&dev_priv->runtime_pm, wakeref);
-	vga_switcheroo_client_fb_set(pdev, info);
 	return 0;
 
 out_unpin:
diff --git a/drivers/gpu/drm/radeon/radeon_fbdev.c b/drivers/gpu/drm/radeon/radeon_fbdev.c
index fb70de29545c6..730efabe05f6b 100644
--- a/drivers/gpu/drm/radeon/radeon_fbdev.c
+++ b/drivers/gpu/drm/radeon/radeon_fbdev.c
@@ -303,7 +303,6 @@ static void radeon_fbdev_client_unregister(struct drm_client_dev *client)
 	struct radeon_device *rdev = dev->dev_private;
 
 	if (fb_helper->info) {
-		vga_switcheroo_client_fb_set(rdev->pdev, NULL);
 		drm_helper_force_disable_all(dev);
 		drm_fb_helper_unregister_info(fb_helper);
 	} else {
@@ -342,8 +341,6 @@ static int radeon_fbdev_client_hotplug(struct drm_client_dev *client)
 	if (ret)
 		goto err_drm_fb_helper_fini;
 
-	vga_switcheroo_client_fb_set(rdev->pdev, fb_helper->info);
-
 	return 0;
 
 err_drm_fb_helper_fini:
diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index 79525ee90e3b2..57b21b6869231 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -64,6 +64,7 @@
 #include <linux/console.h>
 #include <linux/string.h>
 #include <linux/kd.h>
+#include <linux/pci.h>
 #include <linux/slab.h>
 #include <linux/fb.h>
 #include <linux/fbcon.h>
@@ -75,6 +76,7 @@
 #include <linux/interrupt.h>
 #include <linux/crc32.h> /* For counting font checksums */
 #include <linux/uaccess.h>
+#include <linux/vga_switcheroo.h>
 #include <asm/irq.h>
 
 #include "fbcon.h"
@@ -2909,6 +2911,9 @@ void fbcon_fb_unregistered(struct fb_info *info)
 
 	console_lock();
 
+	if (info->device && dev_is_pci(info->device))
+		vga_switcheroo_client_fb_set(to_pci_dev(info->device), info);
+
 	fbcon_registered_fb[info->node] = NULL;
 	fbcon_num_registered_fb--;
 
@@ -3042,6 +3047,10 @@ static int do_fb_registered(struct fb_info *info)
 		}
 	}
 
+	/* Set the fb info for vga_switcheroo clients. Does nothing otherwise. */
+	if (info->device && dev_is_pci(info->device))
+		vga_switcheroo_client_fb_set(to_pci_dev(info->device), NULL);
+
 	return ret;
 }
 
-- 
2.52.0

