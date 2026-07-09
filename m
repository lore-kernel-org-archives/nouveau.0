Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09CC1C43458
	for <nouveau@archiver.kernel.org>; Thu,  9 Jul 2026 09:22:56 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id DF9E610F4AE;
	Thu,  9 Jul 2026 09:22:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="bt1nM3Vk";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Ru+n/XaS";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=suse.de header.i=@suse.de header.b="FtcF++5l";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vyEO1pTz";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 46BA046FE3;
	Thu,  9 Jul 2026 09:07:54 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1783588074;
 b=LAcHZ8vAdaneuamcrh1B04qO2J4B/YKz/dg1rR78SyvskbWpagvD1TyygVPmXuX/4niKL
 DD/Al7F2rAHIFS9dSS5iqqjE4rBEaLDvMzgDSclD5WcaFrit6knwg6ydslVmstlSlbKO6/P
 eX8LY+1cxE9CKC5btiKjCv8hhz9qppYe59N+jF6uy8RcQd3zSUj0iYMXzR/qnRjJUl2pVnu
 fHKkzybkbIUXBGprGpcOd7W7mu5WyAR+V9isdyQxadgN8njtKui7XXMR4QThm9vNweWSaMW
 DLveGKV8luj94W8cgx/+43I8SdMxG3ZovEHFg6KmcKreeInhTK/KDEhXpNfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1783588074; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=574v5c5jCuBngsqR6pYmAMULmmJYIoTEWZhr2k4Q7TQ=;
 b=rQ56UT+q3Kk9S9aPg+1a7UaKu+ZQDo/5mCmBsxDpHxTxtHTOXiq+ScOJdEgCJ98W4QB+/
 iInqeh3O8FoQnEkNw3oETtq2C4t4UnOp5RgaA689RVfHwmaDZiokVpfzHlh/dKNhODH8i1M
 Pjxtmvh8b/Ddg/JWjOIyDcpqEF0aZ2KI/nCzk96SLmYANFhorDPW608W0Jrhiiw1BESkOxT
 e1cXzqBFL0V6gqrNk8Uw3HmYleimWuM9QDs/HBiZbSQp6mLgrRjsGaxOXQJe4dxzaufP7o0
 3tJtW91eXBDOGK+ncKEcPAbi6c+oYN19Gy3TcsFxILb77JIf1uqtstael2CA==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=suse.de;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=suse.de policy.dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=suse.de;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=suse.de policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 8D3FD46B55
	for <nouveau@lists.freedesktop.org>; Thu,  9 Jul 2026 09:07:51 +0000 (UTC)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9360510F495
	for <nouveau@lists.freedesktop.org>; Thu,  9 Jul 2026 09:22:52 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E55E675DDF;
	Thu,  9 Jul 2026 09:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1783588945;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=574v5c5jCuBngsqR6pYmAMULmmJYIoTEWZhr2k4Q7TQ=;
	b=bt1nM3VkmfDThiDAbaF4BJ6mO9hxtNq8gUobBwLZRD1OvV5yqwK7JPH/oVJ+Rrz9cyBes9
	3qewIhNbeKN3Hr6wcydT9nNgrR6VFKivIYls3H8B2V8KZlvyGq8j1YUPtigGpZ8vo/Oc88
	S3Gtsxawobb00piq/epRxEZ5X4+PI+s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783588945;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=574v5c5jCuBngsqR6pYmAMULmmJYIoTEWZhr2k4Q7TQ=;
	b=Ru+n/XaSRnvME2VyrAxHuanA5vqeVXsr80d7F3thORp0G+zVqtJ17pvF1sZ16rTNSjBCNQ
	08ZRJ1O3Up/0zZCA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1783588944;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=574v5c5jCuBngsqR6pYmAMULmmJYIoTEWZhr2k4Q7TQ=;
	b=FtcF++5lmc5X4hvZIQn1X0sy54vGMJ1Nd+7QsOlilsTBw42j4SFUS50NSxg0PImGk/g/oQ
	XkxV6ODdzZcThLN4Gs3ITdeByaklTdnzy9PNR77XOxbMFplYtmkh2Ld9Aj5SIMioSaaa0c
	8jKpwejj9k7E74eOBjQ0/sUZzwpWRKg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783588944;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=574v5c5jCuBngsqR6pYmAMULmmJYIoTEWZhr2k4Q7TQ=;
	b=vyEO1pTz2UFwzodW3Lvv89Nebi05DKbH326C6DtDpSQ4YSOhipdj7fNnHk5hyCwIZkZE6M
	ItiTVx8Q9QzdYaCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5D579779AA;
	Thu,  9 Jul 2026 09:22:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 0MdcFVBoT2q6OQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Thu, 09 Jul 2026 09:22:24 +0000
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
Subject: [PATCH v2 6/7] drm: Implement vga_switcheroo_client_ops.post_switch
Date: Thu,  9 Jul 2026 11:16:02 +0200
Message-ID: <20260709092215.168172-7-tzimmermann@suse.de>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260709092215.168172-1-tzimmermann@suse.de>
References: <20260709092215.168172-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_TO(0.00)[wunner.de,redhat.com,amd.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,intel.com,ursulin.net,gmx.de];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_TWELVE(0.00)[22];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:email,suse.de:dkim,suse.de:mid];
	FROM_EQ_ENVFROM(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLgosu6qu4h11rje89ht7rjgg5)];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: E55E675DDF
Message-ID-Hash: 6P5SO7U4XJ4H3COS36QAOZMLPSQV4NP3
X-Message-ID-Hash: 6P5SO7U4XJ4H3COS36QAOZMLPSQV4NP3
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/6P5SO7U4XJ4H3COS36QAOZMLPSQV4NP3/>
Archived-At: 
 <https://lore.freedesktop.org/20260709092215.168172-7-tzimmermann@suse.de/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

An output's attached display might have changed while a DRM client's
device did not have the output switched to it.

The nouveau_switcheroo_reprobe() callback sends a hotplug notice to
DRM's internal clients, so that they can reconfigure their display
output if necessary.

As post_switch callback replaces reprobe in vga_switcheroo, update
nouveau accordingly. In the other drivers, remove the NULL-assignment
to reprobe. No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Lyude Paul <lyude@redhat.com> # nouveau
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  1 -
 drivers/gpu/drm/i915/i915_switcheroo.c     |  1 -
 drivers/gpu/drm/nouveau/nouveau_vga.c      | 19 +++++++++----------
 drivers/gpu/drm/radeon/radeon_device.c     |  1 -
 4 files changed, 9 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 87a59a79a019..5bb1567d512d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -1708,7 +1708,6 @@ static void amdgpu_switcheroo_pre_switch(struct pci_dev *pdev)
 
 static const struct vga_switcheroo_client_ops amdgpu_switcheroo_ops = {
 	.set_gpu_state = amdgpu_switcheroo_set_state,
-	.reprobe = NULL,
 	.can_switch = amdgpu_switcheroo_can_switch,
 	.pre_switch = amdgpu_switcheroo_pre_switch,
 };
diff --git a/drivers/gpu/drm/i915/i915_switcheroo.c b/drivers/gpu/drm/i915/i915_switcheroo.c
index 6b306ece0556..d97057722fde 100644
--- a/drivers/gpu/drm/i915/i915_switcheroo.c
+++ b/drivers/gpu/drm/i915/i915_switcheroo.c
@@ -69,7 +69,6 @@ static void i915_switcheroo_pre_switch(struct pci_dev *pdev)
 
 static const struct vga_switcheroo_client_ops i915_switcheroo_ops = {
 	.set_gpu_state = i915_switcheroo_set_state,
-	.reprobe = NULL,
 	.can_switch = i915_switcheroo_can_switch,
 	.pre_switch = i915_switcheroo_pre_switch,
 };
diff --git a/drivers/gpu/drm/nouveau/nouveau_vga.c b/drivers/gpu/drm/nouveau/nouveau_vga.c
index 2d2d08be8fbe..29a801124e56 100644
--- a/drivers/gpu/drm/nouveau/nouveau_vga.c
+++ b/drivers/gpu/drm/nouveau/nouveau_vga.c
@@ -54,15 +54,6 @@ nouveau_switcheroo_set_state(struct pci_dev *pdev,
 	}
 }
 
-static void
-nouveau_switcheroo_reprobe(struct pci_dev *pdev)
-{
-	struct nouveau_drm *drm = pci_get_drvdata(pdev);
-	struct drm_device *dev = drm->dev;
-
-	drm_client_dev_hotplug(dev);
-}
-
 static bool
 nouveau_switcheroo_can_switch(struct pci_dev *pdev)
 {
@@ -84,12 +75,20 @@ nouveau_switcheroo_pre_switch(struct pci_dev *pdev)
 	drm_client_dev_acquire_outputs(drm->dev);
 }
 
+static void
+nouveau_switcheroo_post_switch(struct pci_dev *pdev)
+{
+	struct nouveau_drm *drm = pci_get_drvdata(pdev);
+
+	drm_client_dev_hotplug(drm->dev);
+}
+
 static const struct vga_switcheroo_client_ops
 nouveau_switcheroo_ops = {
 	.set_gpu_state = nouveau_switcheroo_set_state,
-	.reprobe = nouveau_switcheroo_reprobe,
 	.can_switch = nouveau_switcheroo_can_switch,
 	.pre_switch = nouveau_switcheroo_pre_switch,
+	.post_switch = nouveau_switcheroo_post_switch,
 };
 
 void
diff --git a/drivers/gpu/drm/radeon/radeon_device.c b/drivers/gpu/drm/radeon/radeon_device.c
index 8697a9eb5d13..9523240110a6 100644
--- a/drivers/gpu/drm/radeon/radeon_device.c
+++ b/drivers/gpu/drm/radeon/radeon_device.c
@@ -1267,7 +1267,6 @@ static void radeon_switcheroo_pre_switch(struct pci_dev *pdev)
 
 static const struct vga_switcheroo_client_ops radeon_switcheroo_ops = {
 	.set_gpu_state = radeon_switcheroo_set_state,
-	.reprobe = NULL,
 	.can_switch = radeon_switcheroo_can_switch,
 	.pre_switch = radeon_switcheroo_pre_switch,
 };
-- 
2.54.0

