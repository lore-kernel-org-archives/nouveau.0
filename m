Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B646C5DF7D
	for <nouveau@archiver.kernel.org>; Tue, 18 Aug 2026 12:51:57 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E52E510EB45;
	Tue, 18 Aug 2026 12:51:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="XYup1uGb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="w7fEnJZy";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 42BEA478C5;
	Tue, 18 Aug 2026 12:35:26 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1787056526;
 b=zU5sSGLPMKVFFTBus1zzQVKUkUVuapN4GO10dRJhvPEUrev4v7lSSVNKngopXb0MM+cYy
 t85WvFDYmDK6kjLVblRp8cVJkUHDy9+e9HrXrNJ0GmWORoZ8MqTu1dvSfkdeDmfgi/4Hl6u
 KpewB1FexI1BNjTfswV1r5f7MHIaJ9h5i4EQQFi0XkNk/1Gk/yVrhkjy0qSgtcGBW4ZpEUM
 QFBFB0Z7gt8bxg90SNramD18xReelAacCCwVYGHwO91ItoeiUQgLycaqhLMVrDtmvHBWMki
 EHpobkXnV523GDopQcDEAGMHSq2Gfdx9sQza5oTVsKDfSfjvtllbTG9D8hEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1787056526; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=lurynGJFfEOjpSoiEvFLb2rSec2t0K5pgw8WURsM3ZM=;
 b=rNnGPn3XvlrQ1sAqgNLzxXMG8MNvG4TTyt3HwVYUEThdBqK+Kro1CSWdukYMQA4PRecWx
 1BlzYyaqHnPweiaX9aBNaDRnE6I+VNIcUgygTDtcLVn/7DX/MmiVXOW6pdckxru17U6xSUJ
 kEMBxKlvrwQR4vLeoQsEtyRUfrpTBjK10UGbSN9vHMivtaUDazXHva9ga7nmZDKcy2J2j3z
 Y2koiHsoQRoUFz9+gzWOXa4GnBFIvbNo8osGzZuy04GB1VvfTJQQGHSqEQR1EaD2PEua4sc
 K9AL8s+MlB97s5lO6SxUyRb/UH2OZKSKscQ2GDULo7bHxcH6xmwX/HbIB8iA==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=suse.de;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=suse.de policy.dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=suse.de;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=suse.de policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 13E9546D2B
	for <nouveau@lists.freedesktop.org>; Tue, 18 Aug 2026 12:35:23 +0000 (UTC)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7484110EB3E
	for <nouveau@lists.freedesktop.org>; Tue, 18 Aug 2026 12:51:53 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id BDB8E3E75;
	Tue, 18 Aug 2026 12:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1787057418;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lurynGJFfEOjpSoiEvFLb2rSec2t0K5pgw8WURsM3ZM=;
	b=XYup1uGbrJML4Mzy59EIa1+NKb8rhGkIloNjVQIk8cLr8NCC+flnp+SXRdO8x+0AEsBZdM
	A3wq8ctRSLTUprnpI1f9Ay56yZdS0DArlBCoYiG2ciKAIO82tvPyMeCV+//1UMbywlYmsX
	Udzky4X/z9GbC3QOXOoStuJ0Mq5D7fw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1787057418;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lurynGJFfEOjpSoiEvFLb2rSec2t0K5pgw8WURsM3ZM=;
	b=w7fEnJZyzqyNLqZ3HvZ8TEICA8+rVdi3XmaL7yk8FQOqe2nvGJ3D+rf/DlXIfppQAiuADg
	21+vbzKmmXos/4Aw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 45649362E;
	Tue, 18 Aug 2026 12:50:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id yB+4DwpVhGojIAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 18 Aug 2026 12:50:18 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com,
	javierm@redhat.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org
Subject: [PATCH 02/12] drm/panic: Make allocation of zlib workspace more
 robust
Date: Tue, 18 Aug 2026 14:28:00 +0200
Message-ID: <20260818125012.468092-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260818125012.468092-1-tzimmermann@suse.de>
References: <20260818125012.468092-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLqtkr6cif1ebgurukgmwdm7xc)]
X-Rspamd-Queue-Id: BDB8E3E75
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
Message-ID-Hash: T62463YHY6KJSAR3LJ66VMCXE64GPTIJ
X-Message-ID-Hash: T62463YHY6KJSAR3LJ66VMCXE64GPTIJ
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/T62463YHY6KJSAR3LJ66VMCXE64GPTIJ/>
Archived-At: 
 <https://lore.freedesktop.org/20260818125012.468092-3-tzimmermann@suse.de/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Test the zlib workspace size to not have a negative value. This
would be a driver bug. Also touch allocated memory so that the
pages are available upon a panic.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_panic.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
index 0685f7d8dba2..705b72bf0d83 100644
--- a/drivers/gpu/drm/drm_panic.c
+++ b/drivers/gpu/drm/drm_panic.c
@@ -634,13 +634,19 @@ static struct z_stream_s stream;
 
 static void __init drm_panic_qr_init(void)
 {
+	int wssize;
+
+	wssize = zlib_deflate_workspacesize(WINDOW_BITS, MEM_LEVEL);
+	if (WARN_ON_ONCE(wssize < 0))
+		return;
 	/* best-effort allocation; can be NULL */
-	stream.workspace = kmalloc(zlib_deflate_workspacesize(WINDOW_BITS, MEM_LEVEL),
-				   GFP_KERNEL);
+	stream.workspace = kmalloc(wssize, GFP_KERNEL);
 
 	/* touch memory so that pages are there in the case of a panic */
 	memset(qrbuf1, 0, sizeof(qrbuf1));
 	memset(qrbuf2, 0, sizeof(qrbuf2));
+	if (stream.workspace)
+		memset(stream.workspace, 0, wssize);
 }
 
 static void drm_panic_qr_exit(void)
-- 
2.55.0

