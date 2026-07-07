Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1EC7C43458
	for <nouveau@archiver.kernel.org>; Tue,  7 Jul 2026 13:57:49 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6AD7710ED48;
	Tue,  7 Jul 2026 13:57:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="QXWo++7E";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zfNjRPsu";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QXWo++7E";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zfNjRPsu";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id C6E8046F38;
	Tue,  7 Jul 2026 13:42:51 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1783431771;
 b=AUc/QSRl21cibE6I+vmb6HggLP2FPMZniAYVVgAujv8qlWSLAC3y7hv6v7udoFeK5F2An
 5B4vImvGRwsYqioqboPBr8TQW4HIEr5JOds65Jwcwv1tYzF++7YslX1ytPm4IHLhbY4k5xE
 E3bDWbmLWkHCo3X0r2a8WLYDUNqVbR2omE36ZgFKvtVUE3ujKbfdxEHY8DSQ5yrgWMPtJoL
 JuiwL4qMeb+E3qPpzY7ZD83FV0OIiA47x3EKjwWqBtXL/s6rOM6GhhkdTQ+LIZRLyrObVdA
 G7wI2On5adTAwevVAlvWt0X0u2cvXqojXNy3yeZeW58SvOmMCQD7qpb0ixAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1783431771; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=0xQQfcy1AxYzo0sLqCtimoHIHPKdZLVde37zM51Tqbo=;
 b=Rf7xgvljoEQRfUeAW2tal226LnvvhUXowycY9lYGGgWxvchzvDuZcYTXpy0+jNzVDsjSN
 aKv1xb7EeBsuoRjtKDyVZU+LPoOVr0k5PSxKUMuooNvdZy59ihykDzm3fbii1W8TZv98BZp
 joMqdKui6suDdSdlpHGoLJNubQ92wEIdDC+fyR+ZZjcE0lwLr/6ZsgQyTYSFfsvEXQ2zmVr
 UagD0Qjc3AIvYfKoFhDfwhKgYEhNZxmU+Mg23eUrsyqHY0SpyBF/L1Y1VVauuQH9Sw+kmoH
 FxUMysd+QxK9zIrJMeOfdNw4PPTkBAjs2ibX4pxgUa+JbojI7gSTUHsWhhFA==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=suse.de;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=suse.de policy.dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=suse.de;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=suse.de policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id A1C5846F2B
	for <nouveau@lists.freedesktop.org>; Tue,  7 Jul 2026 13:42:47 +0000 (UTC)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E9B1210ED75
	for <nouveau@lists.freedesktop.org>; Tue,  7 Jul 2026 13:57:44 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 23AF575A79;
	Tue,  7 Jul 2026 13:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1783432653;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0xQQfcy1AxYzo0sLqCtimoHIHPKdZLVde37zM51Tqbo=;
	b=QXWo++7EGqJhHM58pEAQP7BPnXUP60akFg1q5NHJVBi3PldICQ/u3zceLSwTpDiaVwQegl
	4gjc+gQXTpIhfat3kSiFTiLZEn1V7GDy7k5po4EWvGYdUpOIYMIt6MS7VBAJGCtqdDuW0V
	I4KgD0x2XD1VDD24pEUZj8W/RnF9K4I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783432653;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0xQQfcy1AxYzo0sLqCtimoHIHPKdZLVde37zM51Tqbo=;
	b=zfNjRPsu6ghn2y/IjMF54N2PU/lSm+Ot4cAkXYf3OXqAZxAqzkDas+Ul/pIVacWlNj5mqq
	/PCJiYJKg3ngNpBg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1783432653;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0xQQfcy1AxYzo0sLqCtimoHIHPKdZLVde37zM51Tqbo=;
	b=QXWo++7EGqJhHM58pEAQP7BPnXUP60akFg1q5NHJVBi3PldICQ/u3zceLSwTpDiaVwQegl
	4gjc+gQXTpIhfat3kSiFTiLZEn1V7GDy7k5po4EWvGYdUpOIYMIt6MS7VBAJGCtqdDuW0V
	I4KgD0x2XD1VDD24pEUZj8W/RnF9K4I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783432653;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0xQQfcy1AxYzo0sLqCtimoHIHPKdZLVde37zM51Tqbo=;
	b=zfNjRPsu6ghn2y/IjMF54N2PU/lSm+Ot4cAkXYf3OXqAZxAqzkDas+Ul/pIVacWlNj5mqq
	/PCJiYJKg3ngNpBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 90C0B779AE;
	Tue,  7 Jul 2026 13:57:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id IPH+IcwFTWoFSgAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 07 Jul 2026 13:57:32 +0000
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
Subject: [PATCH 06/10] drm/i915: Implement
 vga_switcheroo_client_ops.pre_switch
Date: Tue,  7 Jul 2026 15:38:13 +0200
Message-ID: <20260707135724.247562-7-tzimmermann@suse.de>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260707135724.247562-1-tzimmermann@suse.de>
References: <20260707135724.247562-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 23AF575A79
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.998];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:email,suse.de:mid];
	FROM_EQ_ENVFROM(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLgosu6qu4h11rje89ht7rjgg5)];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
Message-ID-Hash: MDLBXEJCGO6O7TBWXCC77KC6RTVLOMR7
X-Message-ID-Hash: MDLBXEJCGO6O7TBWXCC77KC6RTVLOMR7
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/MDLBXEJCGO6O7TBWXCC77KC6RTVLOMR7/>
Archived-At: 
 <https://lore.freedesktop.org/20260707135724.247562-7-tzimmermann@suse.de/>
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
emulation.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/i915/i915_switcheroo.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

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
-- 
2.54.0

