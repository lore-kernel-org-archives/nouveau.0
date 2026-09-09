Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 667E6C88E4C
	for <nouveau@archiver.kernel.org>; Fri, 11 Sep 2026 08:52:03 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3924110E981;
	Fri, 11 Sep 2026 08:52:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="NccCFDqs";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="GnsmpT5O";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=suse.de header.i=@suse.de header.b="usdY7FK9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="J3lxxEvf";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 90A71405B0;
	Fri, 11 Sep 2026 08:34:39 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1789115679;
 b=ItoduWmqrk2o2TZ60zq5FE/yjI5hrU3asSLkbwZ2Xd5wqhoAQOnFNYjTdZk1P/3iDqWf6
 v0H0o8i6vqTajhrLZjAC4OcvysbjEzcq/Lt6bXE97hSd4JJmqT+q1rl2RflpsqxyFsHRIcy
 ImfCrktgWa23EEX+OmY/ic5aK+hpcXZz0QPfygsWqqiIiu6txSH+oumf0ME4x7cFgDCN9/C
 q6FwWpmYtOUnpgBEXZNvb18BW5PZSRz02wXze/eBbHLQwDd0s0B+W+a4KiKy8yT/ktF3cwZ
 LLKnKrDMUqdB1WMFillgA8bR2d98R1t5f0IvnRAaXOScapqgCIvvtR2LmnqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1789115679; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=gsWLQEdcATIle94yz8MRU++IKgHyVQ6YJUtwZxHl2sM=;
 b=p/jBXj2G4R1xJV1CcDaeb3fBszTskyF0SHWf6xZ8V7snHQd3k/JjHzmwhirMtczBxtBoV
 P2FqX2bxH7sr2PizpBXOPzp7SqunMM26smP6SIi2AGZ4QnDoO1+pPl25KNT3bB0GG8uMGXR
 oVWaMdTTHgwzi1SXayxmbYoeXmia3aWdoMTkugoMx5/DxA4kDANk8skYTU/u7OFlLboskEH
 8x+83H+BxcERDwf3eEYTVHHkzWxfrplrtx8i4oQWiMyf2KNZbBmA30oKTlX2dKqpYj+iZua
 /rephqlwNpf8Y1wrSCrGOJu2uOkqt15GUuzQVKIU/TmEQkX1IsSdDR/DzpBA==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=suse.de;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=suse.de policy.dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=suse.de;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=suse.de policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id C02A440397
	for <nouveau@lists.freedesktop.org>; Fri, 11 Sep 2026 08:34:07 +0000 (UTC)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3BFCA10F00B
	for <nouveau@lists.freedesktop.org>; Wed,  9 Sep 2026 08:59:52 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8726E21A5F;
	Wed,  9 Sep 2026 08:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1788944325;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gsWLQEdcATIle94yz8MRU++IKgHyVQ6YJUtwZxHl2sM=;
	b=NccCFDqsrqKaG1Eag6hQalVcMIrchdpGnfcDM+Zi21IBxRNC73Iw8fwm1AO346ve58R9IT
	Rzqu95WN4vkiEgdUFjKK0mAgeSiyqkp5yszOn7gzBUSl7egzWXEav5t5jAJvrmFefxpVwo
	Fj9rkKFTBN8VlZUqUnp4HfLYy6folys=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788944325;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gsWLQEdcATIle94yz8MRU++IKgHyVQ6YJUtwZxHl2sM=;
	b=GnsmpT5OYEul/ejHrSbkGfWJuWPIVQ4MGx77l8WK4wqBwpNjmKtVkV6bHtGFp1y5waEgiF
	+zobpdAYfpDD22DA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1788944321;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gsWLQEdcATIle94yz8MRU++IKgHyVQ6YJUtwZxHl2sM=;
	b=usdY7FK9MgxMP2nFuX9gptMYDk2o59aCgFXW9DBuV7/ovPVG9HXg2ev00kru/eIxfmhJ0+
	r3/8+6ZAffVkY8YbxZAyBxqWLLSxxDn8HqCpDr0Ygyh1s1jIogA46oCvbQBARgbHujl8fD
	HB35cYeQCstsnBchPBqzSUwVYiNCcN4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788944321;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gsWLQEdcATIle94yz8MRU++IKgHyVQ6YJUtwZxHl2sM=;
	b=J3lxxEvf5jZpwMPIXMum31vmIJgYcwek8AQudtcP+qJYBuF4/72VYvqRFpaaFaaD4ApXps
	IFsFUiiY8l9bAmCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 43CDA13939;
	Wed,  9 Sep 2026 08:58:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id eA8yD7wfoWoVUQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Wed, 09 Sep 2026 08:58:36 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com,
	javierm@redhat.com,
	airlied@gmail.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	geert@linux-m68k.org,
	rdunlap@infradead.org
Subject: [PATCH v4 08/14] drm/panic: Retry in dispatch function if panic
 output fails
Date: Wed,  9 Sep 2026 10:55:23 +0200
Message-ID: <20260909085826.64529-9-tzimmermann@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260909085826.64529-1-tzimmermann@suse.de>
References: <20260909085826.64529-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 8726E21A5F
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	URIBL_BLOCKED(0.00)[suse.de:dkim,suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	TO_DN_SOME(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	FREEMAIL_TO(0.00)[redhat.com,gmail.com,linux.intel.com,kernel.org,linux-m68k.org,infradead.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLo585esf9b7txaosbn5shab9z)];
	DKIM_TRACE(0.00)[suse.de:+]
Message-ID-Hash: 4OF732S5YHUWNALLBJJCXUYMSJ2KOA6O
X-Message-ID-Hash: 4OF732S5YHUWNALLBJJCXUYMSJ2KOA6O
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/4OF732S5YHUWNALLBJJCXUYMSJ2KOA6O/>
Archived-At: 
 <https://lore.freedesktop.org/20260909085826.64529-9-tzimmermann@suse.de/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On failed output of QR codes and kmsg buffers, fall back to a user
message. QR-code output already did this internally, but now formally
support it in drm_panic_dispatch(). Streamlines the existing logic.

With the implicit fallback removed from QR-code support, the tests
cases fail for thr smallest output size (300x200). This is because the
QR code requires a minimal output size. Increase the size to 494x494,
which is the minimum supported size for QR output.

v3:
- update outdated commit description (Sashiko)
v2:
- fix minimum test size (Sashiko)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/drm_panic.c            | 24 ++++++++++++------------
 drivers/gpu/drm/tests/drm_panic_test.c |  2 +-
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
index b1cd5e5865a0..ce4606cac7e2 100644
--- a/drivers/gpu/drm/drm_panic.c
+++ b/drivers/gpu/drm/drm_panic.c
@@ -740,9 +740,9 @@ static int drm_panic_get_qr_code(u8 **qr_image, unsigned int qr_version)
 /*
  * Draw the panic message at the center of the screen, with a QR Code
  */
-static int _draw_panic_screen_qr_code(struct drm_scanout_buffer *sb,
-				      u32 fg_color, u32 bg_color,
-				      unsigned int qr_version)
+static int draw_panic_screen_qr_code(struct drm_scanout_buffer *sb,
+				     u32 fg_color, u32 bg_color,
+				     unsigned int qr_version)
 {
 	const struct font_desc *font = get_default_font(sb->width, sb->height, NULL, NULL);
 	struct drm_rect r_screen, r_logo, r_msg, r_qr, r_qr_canvas;
@@ -812,15 +812,6 @@ static int _draw_panic_screen_qr_code(struct drm_scanout_buffer *sb,
 	drm_panic_blit(sb, &r_qr, qr_image, qr_pitch, scale, fg_color);
 	return 0;
 }
-
-static int draw_panic_screen_qr_code(struct drm_scanout_buffer *sb,
-				     u32 fg_color, u32 bg_color,
-				     unsigned int qr_version)
-{
-	if (_draw_panic_screen_qr_code(sb, fg_color, bg_color, qr_version))
-		return draw_panic_screen_user(sb, fg_color, bg_color);
-	return 0;
-}
 #else
 static void drm_panic_qr_init(void) {};
 static void drm_panic_qr_exit(void) {};
@@ -895,13 +886,22 @@ static int draw_panic_dispatch(struct drm_scanout_buffer *sb, enum drm_panic_typ
 {
 	int ret;
 
+retry:
 	switch (panic_type) {
 	case DRM_PANIC_TYPE_KMSG:
 		ret = draw_panic_screen_kmsg(sb, fg_color, bg_color);
+		if (ret) {
+			panic_type = DRM_PANIC_TYPE_USER;
+			goto retry;
+		}
 		break;
 #if IS_ENABLED(CONFIG_DRM_PANIC_SCREEN_QR_CODE)
 	case DRM_PANIC_TYPE_QR:
 		ret = draw_panic_screen_qr_code(sb, fg_color, bg_color, qr_version);
+		if (ret) {
+			panic_type = DRM_PANIC_TYPE_USER;
+			goto retry;
+		}
 		break;
 #endif
 	case DRM_PANIC_TYPE_USER:
diff --git a/drivers/gpu/drm/tests/drm_panic_test.c b/drivers/gpu/drm/tests/drm_panic_test.c
index 196496238d23..55d77bc203df 100644
--- a/drivers/gpu/drm/tests/drm_panic_test.c
+++ b/drivers/gpu/drm/tests/drm_panic_test.c
@@ -32,7 +32,7 @@ struct drm_test_mode {
  */
 #define DRM_TEST_MODE_LIST(func) \
 	DRM_PANIC_TEST_MODE(1024, 768, DRM_FORMAT_XRGB8888, func) \
-	DRM_PANIC_TEST_MODE(300, 200, DRM_FORMAT_XRGB8888, func) \
+	DRM_PANIC_TEST_MODE(494, 494, DRM_FORMAT_XRGB8888, func) \
 	DRM_PANIC_TEST_MODE(1920, 1080, DRM_FORMAT_XRGB8888, func) \
 	DRM_PANIC_TEST_MODE(1024, 768, DRM_FORMAT_RGB565, func) \
 	DRM_PANIC_TEST_MODE(1024, 768, DRM_FORMAT_RGB888, func) \
-- 
2.55.0

