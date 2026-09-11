Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BD69C88E56
	for <nouveau@archiver.kernel.org>; Fri, 11 Sep 2026 12:46:25 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6BB8E10F5CE;
	Fri, 11 Sep 2026 12:46:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="PW8Tgfjv";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6d0ixILu";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 64EE5423F5;
	Fri, 11 Sep 2026 12:29:01 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1789129741;
 b=wE4rzil8uM/b4VWwatio/C5FOosknts/bDMcgr2hjVbpgK4GE2TDkAXAweB8QifNjCCig
 BbmxdbKdKzMZ+KH/qLBYbX/EBQIqEcL8nBA89/8OSz3qjU/3PWJ5txJ4oRFrAmTuDPlpubL
 rWaaIcJvYb41wWxwxTQf2mLiyegZ2V/hdka8MspuuGvB9ZK3dZTcmqlTa6wyrJFajISuJO2
 PP7g+alE9QuQm62JyxDmwc23e7owRkZF2SJme/N9eHWt8JkihqOLHvcyLwBUA+RoFUwyJVD
 SNpXQABs6FdyMi3zCf2XDrfxIAcr/uaqh/hwXIBxuSPn6HgBQlmgl+W6dTlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1789129741; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=SnvK6SDSqRaczPeuHNPtlErQ77C4BU5i8ISwXQWL8II=;
 b=dEFEcy/Qmn8h3zdK2bm1zj0ctJSePKmGmdY0hiF0EbpTv57lGVY+0xTV9kW8ojQwaGnaE
 UJoVmA5hn/3YsdEQlFrfTN0t6QCd0Ggmtfh/9XRdn4wjz4h9/IDVBp9SGk+Qe+7KcofZtIJ
 bR1uwNo0kN0ROD0PwasW2CPNMJiYhSxT/5q/3VlvitouSPXvBQ2NJuyrb4//eCMqoG7us95
 sKVYg5yMYwlRT0D/kAuFU9EQPzbgf7ey9koKV2RzvCf+Jfh3MSLDdTq670kXCY7kJRxTQqR
 EtTIItvVL8tH18Gcdyv954JfcZ728DyrMn9w7l8hiAtOCAulPiP4xhKUT+ZQ==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=suse.de;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=suse.de policy.dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=suse.de;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=suse.de policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id BA6E14203B
	for <nouveau@lists.freedesktop.org>; Fri, 11 Sep 2026 12:28:58 +0000 (UTC)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7050910F5B1
	for <nouveau@lists.freedesktop.org>; Fri, 11 Sep 2026 12:46:22 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id BEDD91FE76;
	Fri, 11 Sep 2026 12:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1789130747;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SnvK6SDSqRaczPeuHNPtlErQ77C4BU5i8ISwXQWL8II=;
	b=PW8TgfjvIstBD9399q7YSvx+2i/FGZUl3rJltk8jc8Lr+ufRqmThDu/eCIyPZenENvBx9s
	DH0TM+g3HHDMOY1y8L13rn3Pa/z1SqGdVQMxHCBC/ZptxRr4K/i7qXRLMJpS9sNT3wgp55
	VIIPPSW8m9eU9hATB0tE/LIA+GjJ/zM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789130747;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SnvK6SDSqRaczPeuHNPtlErQ77C4BU5i8ISwXQWL8II=;
	b=6d0ixILuG3io/xxjsylDalXvRVdoUUZ8JX2BGO0WcTVPY9+P7JMONBsDWKueLA3cyeoAf2
	kKPhjiVx6ujhXHCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1AA2213794;
	Fri, 11 Sep 2026 12:45:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 6G9NBfv3o2r8EQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Fri, 11 Sep 2026 12:45:47 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com,
	javierm@redhat.com,
	airlied@gmail.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	geert@linux-m68k.org,
	rdunlap@infradead.org
Subject: [PATCH v5 03/14] drm/panic: Return -EINVAL if font is not available
Date: Fri, 11 Sep 2026 14:43:56 +0200
Message-ID: <20260911124540.279841-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260911124540.279841-1-tzimmermann@suse.de>
References: <20260911124540.279841-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: BEDD91FE76
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLo585esf9b7txaosbn5shab9z)]
X-Rspamd-Action: no action
Message-ID-Hash: 7IX3C2MUAYJDDCZKFNHBTNFZ7R6PWVZS
X-Message-ID-Hash: 7IX3C2MUAYJDDCZKFNHBTNFZ7R6PWVZS
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/7IX3C2MUAYJDDCZKFNHBTNFZ7R6PWVZS/>
Archived-At: 
 <https://lore.freedesktop.org/20260911124540.279841-4-tzimmermann@suse.de/>
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
Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/drm_panic.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
index d28ce8878e05..62490d32019c 100644
--- a/drivers/gpu/drm/drm_panic.c
+++ b/drivers/gpu/drm/drm_panic.c
@@ -751,8 +751,10 @@ static int _draw_panic_screen_qr_code(struct drm_scanout_buffer *sb)
 	int qr_width, qr_canvas_width, qr_pitch, v_margin;
 	u8 *qr_image;
 
-	if (!font || !qrbuf1 || !qrbuf2 || !stream.workspace)
+	if (!qrbuf1 || !qrbuf2 || !stream.workspace)
 		return -ENOMEM;
+	if (!font)
+		return -EINVAL;
 
 	r_screen = DRM_RECT_INIT(0, 0, sb->width, sb->height);
 
-- 
2.55.0

