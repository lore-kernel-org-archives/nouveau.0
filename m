Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72EEEE6BF00
	for <nouveau@archiver.kernel.org>; Fri, 30 Jan 2026 11:32:37 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1BD6910E99E;
	Fri, 30 Jan 2026 11:32:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.b="SBx8gzWL";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="amHq7Vb8";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 9AA8A40F37;
	Fri, 30 Jan 2026 11:23:29 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1769772209;
 b=iTb1CPm9WTvhCVt8MHMVz804HagPjWY3OFvt3mA75Hy+8qAupUswcHdMYzjXwB8NQ6fj5
 vuAWCFq0KiCii/BB+SzY0K1ZIRXRbGA//YCM9inYZ8WZS/1vvfKrPtsOvkRJ32mvF11YLZh
 /ZQ+b8tsDk/c0E8D0BLCCnPgM/7XJj9XYEyLjURt3CKJeAnTE+KsZ9IipsZjq6E5giUb1nE
 f0CAJbpyCaWU7VMzWIzhunDqcUzXItpB0m5JWRZ+jOTzv/m0qqxZFTDRN55lfa9yDpPvYhG
 Nb/0yf/b7XY5fIVFze3xU+/cdY8g1vqBu1yWNoSCQCWvAOSqUJhGoISRGMvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1769772209; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=y/X4T+gcALGbtYm3GL9og2QAkAj/d8qaAdcQ1KRZKqM=;
 b=wVJYhQBkT/hgTokF/F0nHuapaiWvSfa7EnbOyn7Qxxug0MXKGuj7wlrgUHYlWyXupVWbd
 qo+5VK56AiowwoGrb8pYqR9J3nxM4NmGHXY7XnJ7WG0t+I0L2aCKoeK4oYHmdFqi6w5TC4I
 29/1ZoKNlpX0CrNsPjbC1UbgquBY26RLCy3/iESvMM2qcX/Jh2w1ZLSUoJfP7eHtqhgP+pc
 97Ni8XyYERsIj54DCC+MtVfjExw8ZA77ioDarDSKO8xPrBXyfViftMNn9R1rbURq0+NLVL5
 5qmA0+HRc+porb45gyBYN3Iyp8OcW4E07VwQ/O7XOoot9dHsao42ywf7xz3w==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=linutronix.de;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=linutronix.de
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org;
 dkim=pass header.d=linutronix.de; arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=linutronix.de
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 1628A4015A
	for <nouveau@lists.freedesktop.org>; Fri, 30 Jan 2026 11:23:27 +0000 (UTC)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 380DB10E179;
	Fri, 30 Jan 2026 11:32:33 +0000 (UTC)
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1769772751;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=y/X4T+gcALGbtYm3GL9og2QAkAj/d8qaAdcQ1KRZKqM=;
	b=SBx8gzWLJua8ca3lu90UyRq5vh+7jeD8E6IPZJVb/9NtBoP3KphV0tWdZav5wcI7RMUUsU
	Ol1uGLzoKiOn7xorYXJm1VX9Xx58E3tZxF4t1SDzSBX7OgXiWteMRs5nNXGoQNE5QnzNVd
	zKeQduTrAzIHEva4gQJoimKheg+k5AbRHELyro4z20zxuALNg2djbRAoIQI4HD2j+IxC2L
	EY5oRyWBIwDtNCq/tA/hnHhpYI1ep7K2OhEnYf0K0BKcN+bIOhDwU01wn4kYtDOgd3Pua1
	rLrfddE3uYToR/87LKhNVmH+lM6McV3PbCZh/yTQ/TQDWk+hTbb21uQvsMXEyw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1769772751;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=y/X4T+gcALGbtYm3GL9og2QAkAj/d8qaAdcQ1KRZKqM=;
	b=amHq7Vb81t23HVNxsqAe91ZH1/B2OldqENhCGBLwEFxCp1X2Ub5JhLWOTRKcyU3Zr7o6FG
	OOTyhqPfpuVxQPDg==
To: Lyude Paul <lyude@redhat.com>
Subject: [PATCH drm] Revert "drm/nouveau/disp: Set
 drm_mode_config_funcs.atomic_(check|commit)"
Date: Fri, 30 Jan 2026 12:38:08 +0106
Message-ID: <20260130113230.2311221-1-john.ogness@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 4YBQUEXWCSGXETPUKP6J2Z3MMZKEYM25
X-Message-ID-Hash: 4YBQUEXWCSGXETPUKP6J2Z3MMZKEYM25
X-MailFrom: john.ogness@linutronix.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org, Dave Airlie <airlied@redhat.com>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/4YBQUEXWCSGXETPUKP6J2Z3MMZKEYM25/>
Archived-At: 
 <https://lore.freedesktop.org/20260130113230.2311221-1-john.ogness@linutronix.de/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

This reverts commit 604826acb3f53c6648a7ee99a3914ead680ab7fb.

Apparently there is more to supporting atomic modesetting than
providing atomic_(check|commit) callbacks. Before this revert:

WARNING: [] drivers/gpu/drm/drm_plane.c:389 at .__drm_universal_plane_init+0x13c/0x794 [drm], CPU#1: modprobe/1790
BUG: Kernel NULL pointer dereference on read at 0x00000000
.drm_atomic_get_plane_state+0xd4/0x210 [drm] (unreliable)
.drm_client_modeset_commit_atomic+0xf8/0x338 [drm]
.drm_client_modeset_commit_locked+0x80/0x260 [drm]
.drm_client_modeset_commit+0x40/0x7c [drm]
.__drm_fb_helper_restore_fbdev_mode_unlocked.part.0+0xfc/0x108 [drm_kms_helper]
.drm_fb_helper_set_par+0x8c/0xb8 [drm_kms_helper]
.fbcon_init+0x31c/0x618
[...]
.__drm_fb_helper_initial_config_and_unlock+0x474/0x7f4 [drm_kms_helper]
.drm_fbdev_client_hotplug+0xb0/0x120 [drm_client_lib]
.drm_client_register+0x88/0xe4 [drm]
.drm_fbdev_client_setup+0x12c/0x19b4 [drm_client_lib]
.drm_client_setup+0x15c/0x18c [drm_client_lib]
.nouveau_drm_probe+0x19c/0x268 [nouveau]

Fixes: 604826acb3f5 ("drm/nouveau/disp: Set drm_mode_config_funcs.atomic_(check|commit)")
Reported-by: John Ogness <john.ogness@linutronix.de>
Closes: https://lore.kernel.org/lkml/87ldhf1prw.fsf@jogness.linutronix.de
Signed-off-by: John Ogness <john.ogness@linutronix.de>
---
 drivers/gpu/drm/nouveau/nouveau_display.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
index 829c2b573971c..00515623a2cc7 100644
--- a/drivers/gpu/drm/nouveau/nouveau_display.c
+++ b/drivers/gpu/drm/nouveau/nouveau_display.c
@@ -352,8 +352,6 @@ nouveau_user_framebuffer_create(struct drm_device *dev,
 
 static const struct drm_mode_config_funcs nouveau_mode_config_funcs = {
 	.fb_create = nouveau_user_framebuffer_create,
-	.atomic_commit = drm_atomic_helper_commit,
-	.atomic_check = drm_atomic_helper_check,
 };
 
 

base-commit: 63804fed149a6750ffd28610c5c1c98cce6bd377
-- 
2.47.3

