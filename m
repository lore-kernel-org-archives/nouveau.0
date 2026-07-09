Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E071AC44501
	for <nouveau@archiver.kernel.org>; Thu,  9 Jul 2026 09:22:41 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 935BE10F49B;
	Thu,  9 Jul 2026 09:22:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="op2z4Q0R";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ZZ5juEth";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=suse.de header.i=@suse.de header.b="op2z4Q0R";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ZZ5juEth";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id E4D5846FD5;
	Thu,  9 Jul 2026 09:07:39 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1783588059;
 b=GE0gsXjCcCTA3Xb1f2bnXv3TMpdBw/+Q/yj6M1OkQcOXSBN8ZocfXODUuwMvQqEr1IpGa
 mPSka2ipkdcD8DzOsY8MRfwprTjpJym7zHxm996p1D0FGELUUJDvBj9ObRuyLXOBXjUEegt
 MhAIUHtJEjWg8yrJ8bylp+yMqKpsQz+tqcSpe2Etk56H01f6hsOgTOaeswZhI5RIcsvTQfm
 GqT1pHziOa1OWAazyPNlT6vohS8lG4fkRNPGiIHjVRlgSYdPxQa6f7TVE5EDh2ugtCqiELD
 IMjlgeYHW+4ln3Ci7nuprUx8MA0/VDZPJ3B5Xte8tE5W5v2uV2YQR/Ix5eEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1783588059; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=XctuVESh7ZeNSsRmaxqwIzT4LaneT22++w9e8ig4CGA=;
 b=JgHZRADxUy+6JmAmAGKyOsm+QQHRHtKK5R/xMjokKbPJW5+FDXNceWyFPWQz0mDiO4/44
 eyZI/GAIlwDJQ4G4UsfeaNZXLztxOC0ul4+TBdPw6DzdGLGUyO0F7ME66L6WD7Y933Or0ax
 2V00J3fF3LG9wetHMUuTJGzbPRlmvtpBUx87nJjq/hbyT9K5DPayOpfvkSu+dp+YTlHN60g
 /ItYmQB2+/aeV5JQkd0MrHoBkBMBnFBSsnZIRP01MMJObaCj2qGFr0lejzigUbQcmJkiF4Z
 zH9NAlRU43n//xPYYlnXiwq55ZDCjzSWzZg81FOqNoeRZUrW2udYHA1N/c+w==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=suse.de;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=suse.de policy.dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=suse.de;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=suse.de policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 10B7E46FCB
	for <nouveau@lists.freedesktop.org>; Thu,  9 Jul 2026 09:07:36 +0000 (UTC)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4DBDD10F494
	for <nouveau@lists.freedesktop.org>; Thu,  9 Jul 2026 09:22:37 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0794075DD6;
	Thu,  9 Jul 2026 09:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1783588942;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XctuVESh7ZeNSsRmaxqwIzT4LaneT22++w9e8ig4CGA=;
	b=op2z4Q0R1GtDJWs9M/UmRPpW4foEZymAub5JGiIQGa7ZZsKoVuQpFpmANagyA47CpOTdKa
	UfNHGRbifZlIcvTR6Ks1OBiY7UyZloG1zAtedvhfuYEuXg3nykX04ClP+0T1Ibvz0oJG2R
	oMdAG2vZYBmB8cLxxsM27myciFsri6M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783588942;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XctuVESh7ZeNSsRmaxqwIzT4LaneT22++w9e8ig4CGA=;
	b=ZZ5juEthq9K6s18XhYQtSLOM5zOn1k08diDvnNtcgvRQaGRvYtYKvYf7Ys+rVTtSdtmxJU
	vtXvkfOqwPtcefDg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1783588942;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XctuVESh7ZeNSsRmaxqwIzT4LaneT22++w9e8ig4CGA=;
	b=op2z4Q0R1GtDJWs9M/UmRPpW4foEZymAub5JGiIQGa7ZZsKoVuQpFpmANagyA47CpOTdKa
	UfNHGRbifZlIcvTR6Ks1OBiY7UyZloG1zAtedvhfuYEuXg3nykX04ClP+0T1Ibvz0oJG2R
	oMdAG2vZYBmB8cLxxsM27myciFsri6M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783588942;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XctuVESh7ZeNSsRmaxqwIzT4LaneT22++w9e8ig4CGA=;
	b=ZZ5juEthq9K6s18XhYQtSLOM5zOn1k08diDvnNtcgvRQaGRvYtYKvYf7Ys+rVTtSdtmxJU
	vtXvkfOqwPtcefDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 68B1D779AC;
	Thu,  9 Jul 2026 09:22:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id AA4+GE1oT2q6OQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Thu, 09 Jul 2026 09:22:21 +0000
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
Subject: [PATCH v2 1/7] drm/edid: Include <linux/fb.h>
Date: Thu,  9 Jul 2026 11:15:57 +0200
Message-ID: <20260709092215.168172-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260709092215.168172-1-tzimmermann@suse.de>
References: <20260709092215.168172-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 0794075DD6
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[wunner.de,redhat.com,amd.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,intel.com,ursulin.net,gmx.de];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_TWELVE(0.00)[22];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	FROM_EQ_ENVFROM(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLgosu6qu4h11rje89ht7rjgg5)];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
Message-ID-Hash: ELDQBXYKX7GDRD4C7X2V5EONPCNWJEKI
X-Message-ID-Hash: ELDQBXYKX7GDRD4C7X2V5EONPCNWJEKI
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/ELDQBXYKX7GDRD4C7X2V5EONPCNWJEKI/>
Archived-At: 
 <https://lore.freedesktop.org/20260709092215.168172-2-tzimmermann@suse.de/>
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

