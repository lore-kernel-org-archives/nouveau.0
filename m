Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C741C5DF94
	for <nouveau@archiver.kernel.org>; Mon, 24 Aug 2026 12:54:24 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D939810E7AE;
	Mon, 24 Aug 2026 12:54:23 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id E504D47B17;
	Mon, 24 Aug 2026 12:37:39 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1787575059;
 b=jkrEoxWUq3xDRTrPky1mm7eZvB1+ut4bXLRAS0zM7CI7TWUtsmbVaVHvsayobvWuVRT+X
 wgtMjNKKaHd72MLFoyUZNU5QDHhMnAy0Kw3cBtROEp23Zc4XKY9c40oJtzzfR8pzcFCpmge
 yC/sD57VmsP/YtWVeYRBM6WgOcXkKruNOXrFms/q//f2RTBk6Otw2fdbkHJM1kJ05iPtHSW
 pkf3T8RgYmnE58vXVqAkb3QtY81AiHAaH9Qllx8ApXnPl22kumopErTl9j5jam99V7opc8f
 4N7/uDP61BIHDjIymbhh8xJaYPPgrS5GK0XZuHef1wvthNnhyqZzAoZOL90A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1787575059; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=fHcnWQis0a9YdEbj0QwnLdNo84Wg9sGXZxx3L0bx0Ig=;
 b=JMQ2FjMZDf3qStRBOGLnDynihXk6PeFZ6M1Tv2jZxr3eVtcQdthhwwgQFO0+HzkAQabLE
 OTQaXhd/xHm0YKzCx94Im8nJUFXH4LlVAyihLRfluTkzwvxhsaaWq8Gnzam8+QmzXXd2N5T
 P+igMTDnJad+f9HqrgFVCMn3NJ1+0gGF7qzuUpsThFS5U5mLIY3+hi0mLWJ96T8FEo871zy
 6NIxUJkgAgeDnufn+TfC/vkOqbsMCCS2k8shilv6usDYmyHibX/PxX09lWDjWSOK8n8nqmh
 9uGWjGm/nczZTU29uCm7N4kQW9vYm0iLjsNKB8+Jt4QChGgdJuzR2m1alBgg==
ARC-Authentication-Results: i=1; mail.freedesktop.org; dkim=fail;
  arc=none (Message is not ARC signed);
  dmarc=fail (Used From Domain Record) header.from=suse.de policy.dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=fail;
 arc=none (Message is not ARC signed);
 dmarc=fail (Used From Domain Record) header.from=suse.de policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id AC16240951
	for <nouveau@lists.freedesktop.org>; Mon, 24 Aug 2026 12:37:38 +0000 (UTC)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3D1B810E79C
	for <nouveau@lists.freedesktop.org>; Mon, 24 Aug 2026 12:54:22 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 787FB1F76B;
	Mon, 24 Aug 2026 12:52:11 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D2B67133F1;
	Mon, 24 Aug 2026 12:52:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 0DdDMnc+jGpyNwAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Mon, 24 Aug 2026 12:52:07 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com,
	javierm@redhat.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	geert@linux-m68k.org,
	rdunlap@infradead.org
Subject: [PATCH v2 04/13] drm/panic: Return errno codes if panic output fails
Date: Mon, 24 Aug 2026 14:43:35 +0200
Message-ID: <20260824125201.218863-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260824125201.218863-1-tzimmermann@suse.de>
References: <20260824125201.218863-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLqtkr6cif1ebgurukgmwdm7xc)]
X-Rspamd-Queue-Id: 787FB1F76B
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
Message-ID-Hash: PE2WJIYAPORAIUPXUSCWBHRTJ3IM2L4F
X-Message-ID-Hash: PE2WJIYAPORAIUPXUSCWBHRTJ3IM2L4F
X-MailFrom: tzimmermann@suse.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/PE2WJIYAPORAIUPXUSCWBHRTJ3IM2L4F/>
Archived-At: 
 <https://lore.freedesktop.org/20260824125201.218863-5-tzimmermann@suse.de/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Return errno codes from the panic output helpers to detect invalid
panic handling. Avoid flushing the display if an error ocured. The
unflushed display output might be helpful in debugging.

For now, test the result values in the panic test cases. A later patch
will add support for retrying failed panic output.

v2:
- forward return value of draw_panic_screen_user() (Sashiko)
- forward errno code from drm_panic_get_qr_code

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/drm_panic.c            | 47 +++++++++++++++++---------
 drivers/gpu/drm/tests/drm_panic_test.c | 16 +++++----
 2 files changed, 41 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
index 62490d32019c..cc33a2b4bb52 100644
--- a/drivers/gpu/drm/drm_panic.c
+++ b/drivers/gpu/drm/drm_panic.c
@@ -480,7 +480,7 @@ static void drm_panic_logo_draw(struct drm_scanout_buffer *sb, struct drm_rect *
 				   fg_color);
 }
 
-static void draw_panic_screen_user(struct drm_scanout_buffer *sb)
+static int draw_panic_screen_user(struct drm_scanout_buffer *sb)
 {
 	u32 fg_color = drm_draw_color_from_xrgb8888(CONFIG_DRM_PANIC_FOREGROUND_COLOR,
 						    sb->format->format);
@@ -491,7 +491,7 @@ static void draw_panic_screen_user(struct drm_scanout_buffer *sb)
 	unsigned int msg_width, msg_height;
 
 	if (!font)
-		return;
+		return -EINVAL;
 
 	r_screen = DRM_RECT_INIT(0, 0, sb->width, sb->height);
 	drm_panic_logo_rect(&r_logo, font);
@@ -510,6 +510,8 @@ static void draw_panic_screen_user(struct drm_scanout_buffer *sb)
 		drm_panic_logo_draw(sb, &r_logo, font, fg_color);
 
 	draw_txt_rectangle(sb, font, panic_msg, panic_msg_lines, true, &r_msg, fg_color);
+
+	return 0;
 }
 
 /*
@@ -549,7 +551,7 @@ static int draw_line_with_wrap(struct drm_scanout_buffer *sb, const struct font_
  * Draw the kmsg buffer to the screen, starting from the youngest message at the bottom,
  * and going up until reaching the top of the screen.
  */
-static void draw_panic_screen_kmsg(struct drm_scanout_buffer *sb)
+static int draw_panic_screen_kmsg(struct drm_scanout_buffer *sb)
 {
 	u32 fg_color = drm_draw_color_from_xrgb8888(CONFIG_DRM_PANIC_FOREGROUND_COLOR,
 						    sb->format->format);
@@ -564,7 +566,7 @@ static void draw_panic_screen_kmsg(struct drm_scanout_buffer *sb)
 	int yoffset;
 
 	if (!font || font->width > sb->width)
-		return;
+		return -EINVAL;
 
 	yoffset = sb->height - font->height - (sb->height % font->height) / 2;
 
@@ -591,6 +593,8 @@ static void draw_panic_screen_kmsg(struct drm_scanout_buffer *sb)
 			start--;
 		}
 	}
+
+	return 0;
 }
 
 #if defined(CONFIG_DRM_PANIC_SCREEN_QR_CODE)
@@ -767,7 +771,9 @@ static int _draw_panic_screen_qr_code(struct drm_scanout_buffer *sb)
 	max_qr_size = min(3 * sb->width / 4, 3 * sb->height / 4);
 
 	qr_width = drm_panic_get_qr_code(&qr_image);
-	if (qr_width <= 0)
+	if (qr_width < 0)
+		return qr_width;
+	else if (!qr_width)
 		return -ENOSPC;
 
 	qr_canvas_width = qr_width + QR_MARGIN * 2;
@@ -808,10 +814,11 @@ static int _draw_panic_screen_qr_code(struct drm_scanout_buffer *sb)
 	return 0;
 }
 
-static void draw_panic_screen_qr_code(struct drm_scanout_buffer *sb)
+static int draw_panic_screen_qr_code(struct drm_scanout_buffer *sb)
 {
 	if (_draw_panic_screen_qr_code(sb))
-		draw_panic_screen_user(sb);
+		return draw_panic_screen_user(sb);
+	return 0;
 }
 #else
 static void drm_panic_qr_init(void) {};
@@ -882,23 +889,25 @@ static bool drm_panic_is_format_supported(const struct drm_format_info *format)
 	return drm_draw_can_convert_from_xrgb8888(format->format);
 }
 
-static void draw_panic_dispatch(struct drm_scanout_buffer *sb)
+static int draw_panic_dispatch(struct drm_scanout_buffer *sb)
 {
+	int ret;
+
 	switch (drm_panic_type) {
 	case DRM_PANIC_TYPE_KMSG:
-		draw_panic_screen_kmsg(sb);
+		ret = draw_panic_screen_kmsg(sb);
 		break;
-
 #if IS_ENABLED(CONFIG_DRM_PANIC_SCREEN_QR_CODE)
 	case DRM_PANIC_TYPE_QR:
-		draw_panic_screen_qr_code(sb);
+		ret = draw_panic_screen_qr_code(sb);
 		break;
 #endif
-
 	case DRM_PANIC_TYPE_USER:
 	default:
-		draw_panic_screen_user(sb);
+		ret = draw_panic_screen_user(sb);
 	}
+
+	return ret;
 }
 
 static void drm_panic_set_description(const char *description)
@@ -945,9 +954,15 @@ static void draw_panic_plane(struct drm_plane *plane, const char *description)
 
 	drm_panic_set_description(description);
 
-	draw_panic_dispatch(&sb);
-	if (plane->helper_private->panic_flush)
-		plane->helper_private->panic_flush(plane);
+	ret = draw_panic_dispatch(&sb);
+	if (!ret) {
+		/*
+		 * Only flush if we have a panic screen to display. Otherwise
+		 * it's probably better to leave the display output as-is.
+		 */
+		if (plane->helper_private->panic_flush)
+			plane->helper_private->panic_flush(plane);
+	}
 
 	drm_panic_clear_description();
 
diff --git a/drivers/gpu/drm/tests/drm_panic_test.c b/drivers/gpu/drm/tests/drm_panic_test.c
index ad2f3a2f93b6..fdd77b0cc54c 100644
--- a/drivers/gpu/drm/tests/drm_panic_test.c
+++ b/drivers/gpu/drm/tests/drm_panic_test.c
@@ -30,7 +30,7 @@ struct drm_test_mode {
 	const int width;
 	const int height;
 	const u32 format;
-	void (*draw_screen)(struct drm_scanout_buffer *sb);
+	int (*draw_screen)(struct drm_scanout_buffer *sb);
 	const char *fname;
 };
 
@@ -87,7 +87,7 @@ static void drm_test_panic_screen_user_map(struct kunit *test)
 	const struct drm_test_mode *params = test->param_value;
 	char *fb;
 	int fb_size;
-	int i;
+	int i, ret;
 
 	sb->format = drm_format_info(params->format);
 	fb_size = params->width * params->height * sb->format->cpp[0];
@@ -102,7 +102,8 @@ static void drm_test_panic_screen_user_map(struct kunit *test)
 	sb->height = params->height;
 	sb->pitch[0] = params->width * sb->format->cpp[0];
 
-	params->draw_screen(sb);
+	ret = params->draw_screen(sb);
+	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	for (i = 0; i < fb_size; i++)
 		drm_panic_check_color_byte(test, fb[i]);
@@ -119,7 +120,7 @@ static void drm_test_panic_screen_user_page(struct kunit *test)
 {
 	struct drm_scanout_buffer *sb = test->priv;
 	const struct drm_test_mode *params = test->param_value;
-	int fb_size, p, i, npages;
+	int fb_size, p, i, npages, ret;
 	struct page **pages;
 	u8 *vaddr;
 
@@ -146,7 +147,8 @@ static void drm_test_panic_screen_user_page(struct kunit *test)
 	sb->height = params->height;
 	sb->pitch[0] = params->width * sb->format->cpp[0];
 
-	params->draw_screen(sb);
+	ret = params->draw_screen(sb);
+	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	for (p = 0; p < npages; p++) {
 		int bytes_in_page = (p == npages - 1) ? fb_size - p * PAGE_SIZE : PAGE_SIZE;
@@ -182,6 +184,7 @@ static void drm_test_panic_screen_user_set_pixel(struct kunit *test)
 {
 	struct drm_scanout_buffer *sb = test->priv;
 	const struct drm_test_mode *params = test->param_value;
+	int ret;
 
 	sb->format = drm_format_info(params->format);
 	sb->set_pixel = drm_test_panic_set_pixel;
@@ -189,7 +192,8 @@ static void drm_test_panic_screen_user_set_pixel(struct kunit *test)
 	sb->height = params->height;
 	sb->private = test;
 
-	params->draw_screen(sb);
+	ret = params->draw_screen(sb);
+	KUNIT_ASSERT_EQ(test, ret, 0);
 }
 
 static void drm_test_panic_desc(const struct drm_test_mode *t, char *desc)
-- 
2.55.0

