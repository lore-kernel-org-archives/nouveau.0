Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69DCBC43458
	for <nouveau@archiver.kernel.org>; Thu,  9 Jul 2026 09:22:37 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 12B8A10F48D;
	Thu,  9 Jul 2026 09:22:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="sE4+TLtW";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="QVjwdbBH";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=suse.de header.i=@suse.de header.b="sE4+TLtW";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="QVjwdbBH";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 6F20B46FD4;
	Thu,  9 Jul 2026 09:07:34 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1783588054;
 b=yswwK8qxz5jzcUfO28qljqPkwQAoWiELy8MURI20oUwu/u6nbNLy0pEtr5baYWmlZiHWA
 HzyrUpS+/m0pH4jl+xWR45ihQw02Ml2udhv17V5V4xzkaAOoCVOTG2mMN2Dbcev7jECxsaE
 DGtz/oQA7hwWyu+ErtzeGyce+PFkUFde7bY+4PVe6c/P/YlhU7Dper26ZyH3SG9g62ZyKEr
 nIyLLvxjGjWXGyye8uHbKGrp+6U9tNcAe2rXjKsHq37UhWPIhFNqoAkqqrUEj1lAJOH/N5D
 ENfLP1Kw8oIE+sM0y0PBftzmUaHjNakpwRklFlZGfdd4MmyASfYRKoxecWYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1783588054; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=uhNPr//6EXgm9VrVu7+PlKBN0iXdbwRNj3HZA+yCD6k=;
 b=kPqrjVNrT28jG2lFvr3Pg1YNZxa55kU9w5TH7sx15VydO5dEU9yVCajl3ZYO09ihLXNtl
 tebre59wYEEUoJ7yw9Lqlk2SuP2/eWkXBq+rAK31d7gX8R4Uzx2iKoLxL4U0SMjhyjY4y3A
 AQy8LI/ARk47XZUc2AbfkRo0gmhbxC7enkGzgTXZivLIUjxcMgvHxD0QyrIpJRcEF8yXKXj
 2iLPtFnRcdGHBTPuX1sp6yeNOvdWZOLBXK2BJXB22F9TDySRui9ckx78DKWNXujVXGi8cgB
 EcCfkqs1yxmZM3sM94CBWpUpY4ytw9CTZWx41oQ0WkPbsg6A9f4tZtWO+jRw==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=suse.de;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=suse.de policy.dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=suse.de;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=suse.de policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id D606E46F95
	for <nouveau@lists.freedesktop.org>; Thu,  9 Jul 2026 09:07:31 +0000 (UTC)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8378210F3EE
	for <nouveau@lists.freedesktop.org>; Thu,  9 Jul 2026 09:22:32 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 561997609F;
	Thu,  9 Jul 2026 09:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1783588944;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uhNPr//6EXgm9VrVu7+PlKBN0iXdbwRNj3HZA+yCD6k=;
	b=sE4+TLtWhuoD7VCwCWsNgBRU6aBwFp4k6WJ4Q6JOVQsGZZJT4CiZ1Xb7eVGsGFLaeoE5jP
	l1UanYsmKcQE8UotaWq7CQ8L8boYgJrTuaYFmXbTHT6Sww6nRXG1kBcVVmEw8fljzp4cC3
	pFgP5Iod/lFc8I2cwIOflZcqBX95C5g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783588944;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uhNPr//6EXgm9VrVu7+PlKBN0iXdbwRNj3HZA+yCD6k=;
	b=QVjwdbBHfVDABlSTgp4BqNyqG41yEMlg3tQGSWDPnluviby9THlU97sMCljpwr40v4H87t
	6uLTpyPPv+pv72BA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1783588944;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uhNPr//6EXgm9VrVu7+PlKBN0iXdbwRNj3HZA+yCD6k=;
	b=sE4+TLtWhuoD7VCwCWsNgBRU6aBwFp4k6WJ4Q6JOVQsGZZJT4CiZ1Xb7eVGsGFLaeoE5jP
	l1UanYsmKcQE8UotaWq7CQ8L8boYgJrTuaYFmXbTHT6Sww6nRXG1kBcVVmEw8fljzp4cC3
	pFgP5Iod/lFc8I2cwIOflZcqBX95C5g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783588944;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uhNPr//6EXgm9VrVu7+PlKBN0iXdbwRNj3HZA+yCD6k=;
	b=QVjwdbBHfVDABlSTgp4BqNyqG41yEMlg3tQGSWDPnluviby9THlU97sMCljpwr40v4H87t
	6uLTpyPPv+pv72BA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C3BC8779AC;
	Thu,  9 Jul 2026 09:22:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 6ERtLk9oT2q6OQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Thu, 09 Jul 2026 09:22:23 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: lukas@wunner.de,
	jfalempe@redhat.com,
	alexander.deucher@amd.com,
	christian.koenig@amd.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	jani.nikula@linux.intel.com,
	joonas.lahtinen@linux.intel.com,
	rodrigo.vivi@intel.com,
	tursulin@ursulin.net,
	lyude@redhat.com,
	dakr@kernel.org,
	deller@gmx.de
Subject: [PATCH v2 5/7] drm: Implement struct
 vga_switcheroo_client_ops.pre_switch
Date: Thu,  9 Jul 2026 11:16:01 +0200
Message-ID: <20260709092215.168172-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260709092215.168172-1-tzimmermann@suse.de>
References: <20260709092215.168172-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 561997609F
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[wunner.de,redhat.com,amd.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,intel.com,ursulin.net,gmx.de];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_TWELVE(0.00)[22];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	FROM_EQ_ENVFROM(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLgosu6qu4h11rje89ht7rjgg5)];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
Message-ID-Hash: UMBNYTTTPSBFPGANL5ZHTKOMVFKFMRW3
X-Message-ID-Hash: UMBNYTTTPSBFPGANL5ZHTKOMVFKFMRW3
X-MailFrom: tzimmermann@suse.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, sashiko-reviews@lists.linux.dev
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/UMBNYTTTPSBFPGANL5ZHTKOMVFKFMRW3/>
Archived-At: 
 <https://lore.freedesktop.org/20260709092215.168172-6-tzimmermann@suse.de/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Call drm_client_dev_acquire_outputs() from vga_switcheroo's pre_switch
callback. Pushes fbcon updates from vga_switcheroo into DRM's fbdev
emulation. This affects amdgpu, i915, nouveau and radeon. No other
drivers implement vga_switcheroo.

Also remove the calls to vga_switcheroo_client_fb_set() from fbcon. It
is called from the DRM client's hotplug and sets the fbcon's framebuffer
at vga_switcheroo. Running pre_switch and hotplug concurrently could
result in a deadlock between clientlist_mutex and vgasr_mutex. Hence
clean up fbcon here as well.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Lyude Paul <lyude@redhat.com> # nouveau
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  8 ++++++++
 drivers/gpu/drm/i915/i915_switcheroo.c     | 10 ++++++++++
 drivers/gpu/drm/nouveau/nouveau_vga.c      |  9 +++++++++
 drivers/gpu/drm/radeon/radeon_device.c     |  8 ++++++++
 drivers/video/fbdev/core/fbcon.c           |  8 --------
 5 files changed, 35 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 78c96c7102e4..87a59a79a019 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -1699,10 +1699,18 @@ static bool amdgpu_switcheroo_can_switch(struct pci_dev *pdev)
 	return atomic_read(&dev->open_count) == 0;
 }
 
+static void amdgpu_switcheroo_pre_switch(struct pci_dev *pdev)
+{
+	struct drm_device *dev = pci_get_drvdata(pdev);
+
+	drm_client_dev_acquire_outputs(dev);
+}
+
 static const struct vga_switcheroo_client_ops amdgpu_switcheroo_ops = {
 	.set_gpu_state = amdgpu_switcheroo_set_state,
 	.reprobe = NULL,
 	.can_switch = amdgpu_switcheroo_can_switch,
+	.pre_switch = amdgpu_switcheroo_pre_switch,
 };
 
 /**
diff --git a/drivers/gpu/drm/i915/i915_switcheroo.c b/drivers/gpu/drm/i915/i915_switcheroo.c
index 7e0791024282..6b306ece0556 100644
--- a/drivers/gpu/drm/i915/i915_switcheroo.c
+++ b/drivers/gpu/drm/i915/i915_switcheroo.c
@@ -5,6 +5,7 @@
 
 #include <linux/vga_switcheroo.h>
 
+#include <drm/drm_client_event.h>
 #include <drm/drm_print.h>
 
 #include "display/intel_display_device.h"
@@ -58,10 +59,19 @@ static bool i915_switcheroo_can_switch(struct pci_dev *pdev)
 		atomic_read(&i915->drm.open_count) == 0;
 }
 
+static void i915_switcheroo_pre_switch(struct pci_dev *pdev)
+{
+	struct drm_i915_private *i915 = pdev_to_i915(pdev);
+
+	if (i915 && intel_display_device_present(i915->display))
+		drm_client_dev_acquire_outputs(&i915->drm);
+}
+
 static const struct vga_switcheroo_client_ops i915_switcheroo_ops = {
 	.set_gpu_state = i915_switcheroo_set_state,
 	.reprobe = NULL,
 	.can_switch = i915_switcheroo_can_switch,
+	.pre_switch = i915_switcheroo_pre_switch,
 };
 
 int i915_switcheroo_register(struct drm_i915_private *i915)
diff --git a/drivers/gpu/drm/nouveau/nouveau_vga.c b/drivers/gpu/drm/nouveau/nouveau_vga.c
index a6c375a24154..2d2d08be8fbe 100644
--- a/drivers/gpu/drm/nouveau/nouveau_vga.c
+++ b/drivers/gpu/drm/nouveau/nouveau_vga.c
@@ -76,11 +76,20 @@ nouveau_switcheroo_can_switch(struct pci_dev *pdev)
 	return atomic_read(&drm->dev->open_count) == 0;
 }
 
+static void
+nouveau_switcheroo_pre_switch(struct pci_dev *pdev)
+{
+	struct nouveau_drm *drm = pci_get_drvdata(pdev);
+
+	drm_client_dev_acquire_outputs(drm->dev);
+}
+
 static const struct vga_switcheroo_client_ops
 nouveau_switcheroo_ops = {
 	.set_gpu_state = nouveau_switcheroo_set_state,
 	.reprobe = nouveau_switcheroo_reprobe,
 	.can_switch = nouveau_switcheroo_can_switch,
+	.pre_switch = nouveau_switcheroo_pre_switch,
 };
 
 void
diff --git a/drivers/gpu/drm/radeon/radeon_device.c b/drivers/gpu/drm/radeon/radeon_device.c
index 705c012fcf9e..8697a9eb5d13 100644
--- a/drivers/gpu/drm/radeon/radeon_device.c
+++ b/drivers/gpu/drm/radeon/radeon_device.c
@@ -1258,10 +1258,18 @@ static bool radeon_switcheroo_can_switch(struct pci_dev *pdev)
 	return atomic_read(&dev->open_count) == 0;
 }
 
+static void radeon_switcheroo_pre_switch(struct pci_dev *pdev)
+{
+	struct drm_device *dev = pci_get_drvdata(pdev);
+
+	drm_client_dev_acquire_outputs(dev);
+}
+
 static const struct vga_switcheroo_client_ops radeon_switcheroo_ops = {
 	.set_gpu_state = radeon_switcheroo_set_state,
 	.reprobe = NULL,
 	.can_switch = radeon_switcheroo_can_switch,
+	.pre_switch = radeon_switcheroo_pre_switch,
 };
 
 /**
diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index 9f5c4c101581..974c7dcf5251 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -78,7 +78,6 @@
 #include <linux/interrupt.h>
 #include <linux/crc32.h> /* For counting font checksums */
 #include <linux/uaccess.h>
-#include <linux/vga_switcheroo.h>
 #include <asm/irq.h>
 
 #include "fbcon.h"
@@ -2851,9 +2850,6 @@ void fbcon_fb_unregistered(struct fb_info *info)
 
 	console_lock();
 
-	if (info->device && dev_is_pci(info->device))
-		vga_switcheroo_client_fb_set(to_pci_dev(info->device), NULL);
-
 	fbcon_registered_fb[info->node] = NULL;
 	fbcon_num_registered_fb--;
 
@@ -2987,10 +2983,6 @@ static int do_fb_registered(struct fb_info *info)
 		}
 	}
 
-	/* Set the fb info for vga_switcheroo clients. Does nothing otherwise. */
-	if (info->device && dev_is_pci(info->device))
-		vga_switcheroo_client_fb_set(to_pci_dev(info->device), info);
-
 	return ret;
 }
 
-- 
2.54.0

