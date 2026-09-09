Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93A51C88E4C
	for <nouveau@archiver.kernel.org>; Fri, 11 Sep 2026 08:51:43 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5D0A010E24D;
	Fri, 11 Sep 2026 08:51:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="1dm1xO1x";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="AyB9DOLf";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=suse.de header.i=@suse.de header.b="U4OeGi32";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="AorCwKKY";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id B6EF240364;
	Fri, 11 Sep 2026 08:34:19 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1789115659;
 b=A+rUXVHV4AJySnYI5hPFQQy7Cw2iLgErz1ag3OX5K7HCAO5mr2DeV1UGna6u7qtEna6xZ
 qxzLxJXWoDHaytDwCyT7BeAc7sjWPAURMcdJ3YjviC2hwjLh07LDUw8THGjqugyRW9p+/7W
 bLg5r6sFKROvdBphcTYghZ1nOCe+lnlA/YDTDXOy0WTt0d6kJ70ccB8jM+DhXCgKngTWFcb
 KlJGt0OdD6WVIVUshLza4UeqB0aW/6wscREferiOhw9pSXS+ySu2FxF4f0/x0Ym1bzbz8A2
 rn1uN9G0mt3CsbKBpXBGLV/xG0EvfT0RdEv4sbQgHFIwHAyl8Nwsnp5ZxrKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1789115659; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=/yw/+e2gzQxo9H+pdwIa/AXa45ESt2VPejHwf9N8gL4=;
 b=FhEAcUPO3R8iNk7r3U6+EYF7+TuPk0W0ZqFX0Y3XWLC3E5tJZ1jWjNI/NDu7C4BkiKIwC
 58+BsHziHupxc0dNkFDEBUPblxBtqgHS6FLoMJS2+rTLsurCYVTBFtEz1W6c3yOwvnAC+nR
 e9H9vaxjW3SOcRJmSC7TNJCcMGuVylhC/c124rGIoDNar56aFen36jQeIM6YLPGFwYF39an
 6WK3cGefgvgVkMVVrwxqDIwqpIzTYYyvS1e7vMCut2t1tDAuo2Asf7Xru2/0cwNHOzF/jMC
 cF96j0tGTD7iuLwj5yK04ytEwCeiWF6Z7Sw2cTsy8rEeW8ZdgWn1V7MNjjhw==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=suse.de;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=suse.de policy.dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=suse.de;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=suse.de policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 338DD402F3
	for <nouveau@lists.freedesktop.org>; Fri, 11 Sep 2026 08:34:06 +0000 (UTC)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1D1DE10F01B
	for <nouveau@lists.freedesktop.org>; Wed,  9 Sep 2026 09:00:11 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2F45721A7E;
	Wed,  9 Sep 2026 08:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1788944326;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/yw/+e2gzQxo9H+pdwIa/AXa45ESt2VPejHwf9N8gL4=;
	b=1dm1xO1x3hLqRrsmVizHSExZ08U5t0vJ59xO7zwq3xHt3LAATOhHEKpTiL3uxciWMvCbPs
	8w8e73ZsrNlOZYbGexGKNE0XJ6vF2JSxro+4Mv7aIYB6kKF4dXPO9haQJ+7MYSBpnUd6fg
	RtLDXwUfhBCScXS5cO3Wj+3HTtn8gDE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788944326;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/yw/+e2gzQxo9H+pdwIa/AXa45ESt2VPejHwf9N8gL4=;
	b=AyB9DOLf/MsVeP4truED/BqsipN0gXwRUM8uKJpuTrrmkz5mQZmznl1nmIH1JzbnP0Nso1
	14PP0j3oCMA5z3DQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1788944322;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/yw/+e2gzQxo9H+pdwIa/AXa45ESt2VPejHwf9N8gL4=;
	b=U4OeGi32J/zKC0WnRfvdYuh7OGEVPH8zZWZh1n+7OguBQEayIbkmI4H4kQpxze9qi5rHl9
	iZm2xO0v47xQyvBGKKryLTD6hR7MwdEXAe5WSvPmM9PfnnpOkw4tP8HdChhqpRl9cdBTYw
	KXCtnJQA3+rTp4o+rMZCr12GwMqQzic=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788944322;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/yw/+e2gzQxo9H+pdwIa/AXa45ESt2VPejHwf9N8gL4=;
	b=AorCwKKY3gSBU8990Mrshvx+tOznGvCi8rGQl7B4okGlFGOFBgRPOaKyYhMk9K0qi2ufkH
	ZFdu/y6iH8gQ/TAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 670BB1396B;
	Wed,  9 Sep 2026 08:58:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id wE3GF70foWoVUQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Wed, 09 Sep 2026 08:58:37 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com,
	javierm@redhat.com,
	airlied@gmail.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	geert@linux-m68k.org,
	rdunlap@infradead.org
Subject: [PATCH v4 10/14] drm/panic: Restrict to primary planes
Date: Wed,  9 Sep 2026 10:55:25 +0200
Message-ID: <20260909085826.64529-11-tzimmermann@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260909085826.64529-1-tzimmermann@suse.de>
References: <20260909085826.64529-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 2F45721A7E
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
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
	URIBL_BLOCKED(0.00)[suse.de:dkim,suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:email,suse.de:mid];
	FREEMAIL_TO(0.00)[redhat.com,gmail.com,linux.intel.com,kernel.org,linux-m68k.org,infradead.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLo585esf9b7txaosbn5shab9z)];
	DKIM_TRACE(0.00)[suse.de:+]
Message-ID-Hash: PUR6VBOGSTG4P3JYEUAAYPWJUMKWIJDK
X-Message-ID-Hash: PUR6VBOGSTG4P3JYEUAAYPWJUMKWIJDK
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/PUR6VBOGSTG4P3JYEUAAYPWJUMKWIJDK/>
Archived-At: 
 <https://lore.freedesktop.org/20260909085826.64529-11-tzimmermann@suse.de/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Restrict panic handling to primary displays. Overlays and cursors
should not display panic output. If there are exceptions, they can
be registered by the driver itself.

v3:
- also update drm_panic_is_enabled() (Sashiko)
- still do some testing when unregistering (Sashiko)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/drm_panic.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
index 809d51ad78a8..522ea990a2e9 100644
--- a/drivers/gpu/drm/drm_panic.c
+++ b/drivers/gpu/drm/drm_panic.c
@@ -1059,9 +1059,13 @@ bool drm_panic_is_enabled(struct drm_device *dev)
 	if (!dev->mode_config.num_total_plane)
 		return false;
 
-	drm_for_each_plane(plane, dev)
-		if (plane->helper_private && plane->helper_private->get_scanout_buffer)
-			return true;
+	drm_for_each_plane(plane, dev) {
+		if (plane->type != DRM_PLANE_TYPE_PRIMARY)
+			continue;
+		if (!plane->helper_private || !plane->helper_private->get_scanout_buffer)
+			continue;
+		return true;
+	}
 	return false;
 }
 EXPORT_SYMBOL(drm_panic_is_enabled);
@@ -1079,6 +1083,8 @@ void drm_panic_register(struct drm_device *dev)
 		return;
 
 	drm_for_each_plane(plane, dev) {
+		if (plane->type != DRM_PLANE_TYPE_PRIMARY)
+			continue;
 		if (!plane->helper_private || !plane->helper_private->get_scanout_buffer)
 			continue;
 		plane->kmsg_panic.dump = drm_panic;
@@ -1106,6 +1112,8 @@ void drm_panic_unregister(struct drm_device *dev)
 		return;
 
 	drm_for_each_plane(plane, dev) {
+		if (plane->type != DRM_PLANE_TYPE_PRIMARY)
+			continue;
 		if (!plane->helper_private || !plane->helper_private->get_scanout_buffer)
 			continue;
 		kmsg_dump_unregister(&plane->kmsg_panic);
-- 
2.55.0

