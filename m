Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D6ABC5DF7D
	for <nouveau@archiver.kernel.org>; Tue, 18 Aug 2026 12:54:00 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 64E3710EB54;
	Tue, 18 Aug 2026 12:54:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="WtRbbjD5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="b6dG+b2d";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rmc/OcSo";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Ow20X9GA";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id B64CD478DA;
	Tue, 18 Aug 2026 12:37:29 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1787056649;
 b=zjSfsv3tysLY+PbD3ooJ/Q0OMIfnljUj5gpD0E5/iSNZx5SXBKNyoREWTfBfFNzP+5Ou8
 pBSktX0WEHFOiSLfO6wQdXMiWCesfbuuBD3KxxN0VQupkYhUb9EGlJF8F5JSn7DOwGm+y2w
 UtmsS/7iMjF+hTOAHnSGVOlSVSTCJSbEN6KF0YzIuKcPQkRCgaq0dg9k3j5Sf1BXXG0oZKl
 rkthHhV6c2fCvDWs11Tq8EjaJ+8CW8O+l97j93vsaKChvBYwunnKTVAkld0c3kV14L581t9
 qfJ6yhkMDDIwUSVA+PB7FYIEiclAu7QYzKmGrg7bN3zqbierMbHfGTOU9aWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1787056649; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=tXEPLdTUm/AKmZbYsSgjmgTTHgREX9J88BQwqhijCoM=;
 b=IOE/hLctPW5ZAfEHrSv+Xos15dahBmq4Z51Urwfo0EMqvfgl5nZc1WiFLV2hLAy5OyU6Z
 Tmkv/pjLTzYFEs9yz/VAt+m4tm0K+kpIXHH7ig9Bs418ogYCY6zw1WExRWyo3NtsapNv0/6
 OF2QAJZgLJsSR8lyfqc7Fm7DPAtXfy/YJcr8oo6ciaDFrxWl/3F19SVxDNxjGQ2G4T45hmR
 yRj4EL2AYohaZZ3hStRUaLvT7hzIpFy4419tJKvw97j6htkaGIe9y0p3yPTp1j65sRyDj62
 6Rn+/oRP5Y2Ntyqgu2pH/kbvaCVUgbVqx04C/HerJS37NecsmDSmjorJ/7og==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=suse.de;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=suse.de policy.dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=suse.de;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=suse.de policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 33DB2478CA
	for <nouveau@lists.freedesktop.org>; Tue, 18 Aug 2026 12:37:26 +0000 (UTC)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 947C210EB3C
	for <nouveau@lists.freedesktop.org>; Tue, 18 Aug 2026 12:53:56 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 403883E37;
	Tue, 18 Aug 2026 12:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1787057422;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tXEPLdTUm/AKmZbYsSgjmgTTHgREX9J88BQwqhijCoM=;
	b=WtRbbjD5n8KC2PFZrwTrkjyP5Xg1pQAY3BCpeb8LrGH/5+2W28lKWehD1iTfUyKpsYf6z8
	f7sqamPFu8vhi+mNdaUZ4BcRbhh0Si/uIqWJDfveWpuLgELCnzmDXrZW5O+TwpUVvBRLEn
	6UVHlFWyDbnxj2xmfWTtjQEf3/NKseg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1787057422;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tXEPLdTUm/AKmZbYsSgjmgTTHgREX9J88BQwqhijCoM=;
	b=b6dG+b2dD2A8xTeUIEvPfCQ74Zr1KjYfX+zs8L7ZR6dMDegYR2B4Z9Gp+3aMF6FmcVxi6b
	N9OLjjOFJx+vnkAg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1787057418;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tXEPLdTUm/AKmZbYsSgjmgTTHgREX9J88BQwqhijCoM=;
	b=rmc/OcSowIv0NuMZ9fFZnEdtGcprQSB0uibqA58splqn9xtSP377YcvFJzA2ieU+8UlMVc
	C4J6oEGutrfQxRq/D8rlfog1gZfDOF//FmR6B90k3mb8Q4P/fZklW5nqF09hNc6BZv/xNZ
	G9JcO3DbiCT0KFR1g9q4tNGm9DPwCJI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1787057418;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tXEPLdTUm/AKmZbYsSgjmgTTHgREX9J88BQwqhijCoM=;
	b=Ow20X9GAjNJcDzwnIJtHlmJJBvZxOA8QBvo/ISQCbU5QdNvULbC4hPZqkFPDJKr5lR5wmM
	35ktHTGfhpGh1XBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BF578339C;
	Tue, 18 Aug 2026 12:50:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id SGOVLQlVhGojIAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 18 Aug 2026 12:50:17 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com,
	javierm@redhat.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org
Subject: [PATCH 01/12] drm/panic: Allocate QR-code buffers statically
Date: Tue, 18 Aug 2026 14:27:59 +0200
Message-ID: <20260818125012.468092-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260818125012.468092-1-tzimmermann@suse.de>
References: <20260818125012.468092-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-6.80 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.998];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_TO(0.00)[redhat.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCVD_TLS_ALL(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLqirfcw6gnbcr9a9yhi49fhi6)];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
Message-ID-Hash: XN2TOMB5TKB7MLOLGDTV65UZUSHL3WG6
X-Message-ID-Hash: XN2TOMB5TKB7MLOLGDTV65UZUSHL3WG6
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/XN2TOMB5TKB7MLOLGDTV65UZUSHL3WG6/>
Archived-At: 
 <https://lore.freedesktop.org/20260818125012.468092-2-tzimmermann@suse.de/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Declare qrbuf1 and qrbuf2 as static arrays so that the module loader
allocates them for us. Avoids the kmalloc later on. Also allows for
using sizeof() to get the number of bytes in each array. Access the
arrays once with memset, so that the physical pages are available on
a panic.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_panic.c | 41 ++++++++++++++++++++-----------------
 1 file changed, 22 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
index e576c4791861..0685f7d8dba2 100644
--- a/drivers/gpu/drm/drm_panic.c
+++ b/drivers/gpu/drm/drm_panic.c
@@ -628,24 +628,23 @@ MODULE_PARM_DESC(panic_qr_version, "maximum version (size) of the QR code");
 #define WINDOW_BITS 12
 #define MEM_LEVEL 4
 
-static char *qrbuf1;
-static char *qrbuf2;
+static u8 qrbuf1[QR_BUFFER1_SIZE];
+static u8 qrbuf2[QR_BUFFER2_SIZE];
 static struct z_stream_s stream;
 
 static void __init drm_panic_qr_init(void)
 {
-	qrbuf1 = kmalloc(QR_BUFFER1_SIZE, GFP_KERNEL);
-	qrbuf2 = kmalloc(QR_BUFFER2_SIZE, GFP_KERNEL);
+	/* best-effort allocation; can be NULL */
 	stream.workspace = kmalloc(zlib_deflate_workspacesize(WINDOW_BITS, MEM_LEVEL),
 				   GFP_KERNEL);
+
+	/* touch memory so that pages are there in the case of a panic */
+	memset(qrbuf1, 0, sizeof(qrbuf1));
+	memset(qrbuf2, 0, sizeof(qrbuf2));
 }
 
 static void drm_panic_qr_exit(void)
 {
-	kfree(qrbuf1);
-	qrbuf1 = NULL;
-	kfree(qrbuf2);
-	qrbuf2 = NULL;
 	kfree(stream.workspace);
 	stream.workspace = NULL;
 }
@@ -656,13 +655,17 @@ static int drm_panic_get_qr_code_url(u8 **qr_image)
 	char url[256];
 	size_t kmsg_len, max_kmsg_size;
 	char *kmsg;
-	int max_qr_data_size, url_len;
+	int ret;
+	size_t max_qr_data_size, url_len;
 
-	url_len = snprintf(url, sizeof(url), CONFIG_DRM_PANIC_SCREEN_QR_CODE_URL "?a=%s&v=%s&z=",
-			   utsname()->machine, utsname()->release);
+	ret = snprintf(url, sizeof(url), CONFIG_DRM_PANIC_SCREEN_QR_CODE_URL "?a=%s&v=%s&z=",
+		       utsname()->machine, utsname()->release);
+	if (ret >= sizeof(url))
+		return -EINVAL;
+	url_len = ret;
 
 	max_qr_data_size = drm_panic_qr_max_data_size(panic_qr_version, url_len);
-	max_kmsg_size = min(MAX_ZLIB_RATIO * max_qr_data_size, QR_BUFFER1_SIZE);
+	max_kmsg_size = min(MAX_ZLIB_RATIO * max_qr_data_size, sizeof(qrbuf1));
 
 	/* get kmsg to buffer 1 */
 	kmsg_dump_rewind(&iter);
@@ -681,7 +684,7 @@ static int drm_panic_get_qr_code_url(u8 **qr_image)
 	stream.avail_in = kmsg_len;
 	stream.total_in = 0;
 	stream.next_out = qrbuf2;
-	stream.avail_out = QR_BUFFER2_SIZE;
+	stream.avail_out = sizeof(qrbuf2);
 	stream.total_out = 0;
 
 	if (zlib_deflate(&stream, Z_FINISH) != Z_STREAM_END)
@@ -703,8 +706,8 @@ static int drm_panic_get_qr_code_url(u8 **qr_image)
 	*qr_image = qrbuf2;
 
 	/* generate qr code image in buffer2 */
-	return drm_panic_qr_generate(url, qrbuf2, stream.total_out, QR_BUFFER2_SIZE,
-				     qrbuf1, QR_BUFFER1_SIZE);
+	return drm_panic_qr_generate(url, qrbuf2, stream.total_out, sizeof(qrbuf2),
+				     qrbuf1, sizeof(qrbuf1));
 }
 
 static int drm_panic_get_qr_code_raw(u8 **qr_image)
@@ -712,7 +715,7 @@ static int drm_panic_get_qr_code_raw(u8 **qr_image)
 	struct kmsg_dump_iter iter;
 	size_t kmsg_len;
 	size_t max_kmsg_size = min(drm_panic_qr_max_data_size(panic_qr_version, 0),
-				   QR_BUFFER1_SIZE);
+				   sizeof(qrbuf1));
 
 	kmsg_dump_rewind(&iter);
 	kmsg_dump_get_buffer(&iter, false, qrbuf1, max_kmsg_size, &kmsg_len);
@@ -720,8 +723,8 @@ static int drm_panic_get_qr_code_raw(u8 **qr_image)
 		return -ENODATA;
 
 	*qr_image = qrbuf1;
-	return drm_panic_qr_generate(NULL, qrbuf1, kmsg_len, QR_BUFFER1_SIZE,
-				     qrbuf2, QR_BUFFER2_SIZE);
+	return drm_panic_qr_generate(NULL, qrbuf1, kmsg_len, sizeof(qrbuf1),
+				     qrbuf2, sizeof(qrbuf2));
 }
 
 static int drm_panic_get_qr_code(u8 **qr_image)
@@ -748,7 +751,7 @@ static int _draw_panic_screen_qr_code(struct drm_scanout_buffer *sb)
 	int qr_width, qr_canvas_width, qr_pitch, v_margin;
 	u8 *qr_image;
 
-	if (!font || !qrbuf1 || !qrbuf2 || !stream.workspace)
+	if (!font || !stream.workspace)
 		return -ENOMEM;
 
 	r_screen = DRM_RECT_INIT(0, 0, sb->width, sb->height);
-- 
2.55.0

