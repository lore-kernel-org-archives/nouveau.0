Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 386DAC44503
	for <nouveau@archiver.kernel.org>; Tue,  7 Jul 2026 13:57:38 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 68C6F10ED48;
	Tue,  7 Jul 2026 13:57:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="J6wpNNM/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="68iXdv7V";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=suse.de header.i=@suse.de header.b="J6wpNNM/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="68iXdv7V";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id CB40F46F2F;
	Tue,  7 Jul 2026 13:42:37 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1783431757;
 b=AZYHoEiyYW+gQB4H+aPsK0lD4TWOVGP2j0xCp2t7evSA7w57tU8vEVjebqeVqXBCulPlH
 5XZv88GiYPHRZMILEw6u7ZZ7pBRzXq/CUSgMsVAL4dFj36/Z88GfgTVczYeNAH7mYuWgH17
 9DYQykEHuio239/07HUlqNNC5BHQtqiM1sv38SeXvZbnPGWT0gfFDfH5DugGsf+TOMZap7K
 +J87EMltvK65e8UOR3FgkicdQllbPF7DaY16rnDzEWRcG9mR/xiWXoifwCcDt0WFw1+hUNV
 713VuXXnZt477zcwn14N+JVYtRrAf2nsVA5XC5VwvGPPukEmJEuXz1sQ85NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1783431757; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=XctuVESh7ZeNSsRmaxqwIzT4LaneT22++w9e8ig4CGA=;
 b=IoL0vdy3rd9cDcInkDvFPvQuN8U5dATqoc5qEbbA7OWwXoCVvAUiq75QxYqguF5p+y/O2
 1P738SfuqNsYVfu6NFdoXPb/fa+Pk85qtvGa8fpT7FCGgNnEsq/QYBMy8h/0OP7C+OsDsby
 HrxJATI8gUpAjMNF2TXtaD8Ef9UzC4kDkN9GgN/r3gdGwl1oUhpi2sv6+Nn6hd4Ipz0iSN2
 F/dqHYy4BS3HOAzeAUv5SeQ/iyxAGtLhbehK2pRjVjGxKoZbvlS4PMW9mG9OlJE/7phy7Xi
 +QQxloMVVKMmoZnm/zP0eQs6EMfKA0uSimhvuJZ6aeouH3bvdhBS6sw1eeBg==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=suse.de;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=suse.de policy.dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=suse.de;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=suse.de policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 63191415A7
	for <nouveau@lists.freedesktop.org>; Tue,  7 Jul 2026 13:42:34 +0000 (UTC)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B1F7C10ED38
	for <nouveau@lists.freedesktop.org>; Tue,  7 Jul 2026 13:57:31 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 4171B759D1;
	Tue,  7 Jul 2026 13:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1783432650;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XctuVESh7ZeNSsRmaxqwIzT4LaneT22++w9e8ig4CGA=;
	b=J6wpNNM/Ut2sYlZlD0xseOall5lm0rzwyt2Tn12vpUbDkQqLjaZmaIYDq8MXXCSsMzJnKl
	T5TcfVDr5IC9ydVjHFjSksqh7RWAOQ3eqU/8mum9Rn7SfvGBf6liJ0hzimtxjrcL/48GOc
	GGJYihbwClC0PMlyeH7rmVbF/WvP+HM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783432650;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XctuVESh7ZeNSsRmaxqwIzT4LaneT22++w9e8ig4CGA=;
	b=68iXdv7VpVpEib/TDsAtlN5u5sb7jnb0Wjb20OErKJ3VYGCdssuNiwk68Dmo3CNZI730fc
	+szfA+09I8JMfvCg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1783432650;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XctuVESh7ZeNSsRmaxqwIzT4LaneT22++w9e8ig4CGA=;
	b=J6wpNNM/Ut2sYlZlD0xseOall5lm0rzwyt2Tn12vpUbDkQqLjaZmaIYDq8MXXCSsMzJnKl
	T5TcfVDr5IC9ydVjHFjSksqh7RWAOQ3eqU/8mum9Rn7SfvGBf6liJ0hzimtxjrcL/48GOc
	GGJYihbwClC0PMlyeH7rmVbF/WvP+HM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783432650;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XctuVESh7ZeNSsRmaxqwIzT4LaneT22++w9e8ig4CGA=;
	b=68iXdv7VpVpEib/TDsAtlN5u5sb7jnb0Wjb20OErKJ3VYGCdssuNiwk68Dmo3CNZI730fc
	+szfA+09I8JMfvCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A5A29779AF;
	Tue,  7 Jul 2026 13:57:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id GGwnJ8kFTWoFSgAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 07 Jul 2026 13:57:29 +0000
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
Subject: [PATCH 01/10] drm/edid: Include <linux/fb.h>
Date: Tue,  7 Jul 2026 15:38:08 +0200
Message-ID: <20260707135724.247562-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260707135724.247562-1-tzimmermann@suse.de>
References: <20260707135724.247562-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.78 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.18)[-0.913];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_TO(0.00)[wunner.de,redhat.com,amd.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,intel.com,ursulin.net,gmx.de];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]
Message-ID-Hash: ZUN4HVROTMEJIXJUHNKXJOR6ISDFE3G6
X-Message-ID-Hash: ZUN4HVROTMEJIXJUHNKXJOR6ISDFE3G6
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/ZUN4HVROTMEJIXJUHNKXJOR6ISDFE3G6/>
Archived-At: 
 <https://lore.freedesktop.org/20260707135724.247562-2-tzimmermann@suse.de/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

We currently get <linux/fb.h> via <linux/vga_switcheroo.h>. Include it
explicitly.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_edid.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 07970e5b5f65..86ae2d8d4de2 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -32,6 +32,7 @@
 #include <linux/byteorder/generic.h>
 #include <linux/cec.h>
 #include <linux/export.h>
+#include <linux/fb.h> /* for KHZ2PICOS() */
 #include <linux/hdmi.h>
 #include <linux/i2c.h>
 #include <linux/kernel.h>
-- 
2.54.0

