Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12833C5DF84
	for <nouveau@archiver.kernel.org>; Tue, 18 Aug 2026 12:52:37 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id DF2D910EB4E;
	Tue, 18 Aug 2026 12:52:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="1BrdL15U";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8lO1FicI";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 3EA0E478CD;
	Tue, 18 Aug 2026 12:36:06 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1787056566;
 b=a2BCsNXG4Q//uAwFSAELr+fWAC9qBvK1sgj/uTMAIF3XJqrYOf/Ux204wsslD7uhO4O0e
 yuVpjGv8E7s6Qp4tCa2MrahZW0tLqB6QI7OOG60B4MJtdeQAJ7/Ua+t/CFZ5bS+cfjrUMDk
 FqIfCEffaGqjRwPO8CiVTJ0E2TrlzhyJgBzcim0WtXpTB8LxaewZD53GEW8cBLACnE0teTF
 fZ9oSWZ/OA7o6mONjrHViP49BiNz04BEodLnuGvkJWdeK8wFDL7+mg2dcBqvi/6WrSuR3PD
 m9CBx4Y95S8ivEFNzaub6snnRlvki1tCprY2ZAQ9sZvDaBoxmvPjPHklfmNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1787056566; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=u8IqCQOqqUuUFHpoEOXhbZW/FspccDI1QJCCvL42ZHA=;
 b=dkuaD6f4RXpFyVnUmuaO+7qE4l8xH5rFacP8XUY3AZ1PFUupFCYBufy5xNDwb0vblEY+D
 XfYJUouU8XQbzN2iOfOlKTSlXxbj1pRX5SXFuUofsrDLXXNE0V8kqduez0CBPQk+ox0hPPr
 BTiooONkbJxLuX3gHraMyxXd7zvKb57oRJiNYpo+3axm8f8B+aM0WqCt4eKoVE1PJHIypn5
 IQiybJ8Brz9x0nakHAsYQYNIcehf3TbUcrAqXfpVebNLHUZzivp5eup7MSnSGJ7jW/20MJr
 Ov93mV6kPPt+/s/UXVnCRs1iwfn/HDRoqWg10AOz/CAqYWV0jwCCf59Cmapg==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=suse.de;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=suse.de policy.dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=suse.de;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=suse.de policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 4B74046D2B
	for <nouveau@lists.freedesktop.org>; Tue, 18 Aug 2026 12:36:04 +0000 (UTC)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	by gabe.freedesktop.org (Postfix) with ESMTPS id AC39B10EB43
	for <nouveau@lists.freedesktop.org>; Tue, 18 Aug 2026 12:52:34 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 44D933ED8;
	Tue, 18 Aug 2026 12:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1787057419;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u8IqCQOqqUuUFHpoEOXhbZW/FspccDI1QJCCvL42ZHA=;
	b=1BrdL15UwroVesls4EULdHsOTV75kUzJKP1pg2YXeeUgTcjIF1WP8dXEqwRH1zKGflWk0g
	LHn0qmnbeUNqI+j4adkjPPK7fWF3/6/kpx9BB+3jBSOimpNvsv49Ymk8pQs1lI5/zBTNBD
	PHkoXliBA3u++PJwa85zx6bYb6qzt5M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1787057419;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u8IqCQOqqUuUFHpoEOXhbZW/FspccDI1QJCCvL42ZHA=;
	b=8lO1FicIygnJMTdzvhzHz8LEBplLXv9TdnrzfciOJ5LFmyqFm2TPn00LcJVVkyNM0N28Yi
	OH0MUu4ZUsv7ZaAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BD6D2364F;
	Tue, 18 Aug 2026 12:50:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id WMwNLQpVhGojIAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 18 Aug 2026 12:50:18 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com,
	javierm@redhat.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org
Subject: [PATCH 03/12] drm/panic: Return -EINVAL if font is not available
Date: Tue, 18 Aug 2026 14:28:01 +0200
Message-ID: <20260818125012.468092-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260818125012.468092-1-tzimmermann@suse.de>
References: <20260818125012.468092-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 44D933ED8
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLqtkr6cif1ebgurukgmwdm7xc)]
X-Rspamd-Action: no action
Message-ID-Hash: KWC4B3OGVF2HYE6ANYRVNCPSHAXAKZSY
X-Message-ID-Hash: KWC4B3OGVF2HYE6ANYRVNCPSHAXAKZSY
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/KWC4B3OGVF2HYE6ANYRVNCPSHAXAKZSY/>
Archived-At: 
 <https://lore.freedesktop.org/20260818125012.468092-4-tzimmermann@suse.de/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Font lookup does not allocate memory. Hence reporting ENOMEM on
failed lookups is misleading. Report EINVAL instead.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_panic.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
index 705b72bf0d83..96d238bfceee 100644
--- a/drivers/gpu/drm/drm_panic.c
+++ b/drivers/gpu/drm/drm_panic.c
@@ -757,8 +757,10 @@ static int _draw_panic_screen_qr_code(struct drm_scanout_buffer *sb)
 	int qr_width, qr_canvas_width, qr_pitch, v_margin;
 	u8 *qr_image;
 
-	if (!font || !stream.workspace)
+	if (!stream.workspace)
 		return -ENOMEM;
+	if (!font)
+		return -EINVAL;
 
 	r_screen = DRM_RECT_INIT(0, 0, sb->width, sb->height);
 
-- 
2.55.0

