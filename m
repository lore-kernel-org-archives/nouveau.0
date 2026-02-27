Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C6B8FEFB50
	for <nouveau@archiver.kernel.org>; Fri, 27 Feb 2026 13:31:31 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 059EC10EB57;
	Fri, 27 Feb 2026 13:31:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="PKhvBYKJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="sGsPSxym";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=suse.de header.i=@suse.de header.b="PKhvBYKJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="sGsPSxym";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id EFE0344C92;
	Fri, 27 Feb 2026 13:21:20 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1772198480;
 b=YdhC2igxlf8RAEvHOvz1rIMSiGjIrCmb4oSw2gW0sVVcsfw78Y+1L75Ld2EVmXwbpY/Sy
 EXUxxuMdf8cJtLqxuW8URq61N3NUXKWXW+zerb6hjdIRv1ui+m7chKlIugeMxWtFduDvaI4
 GGB8x8ZYKvCOCn3xwv16DItaXhPVN93y4xeVBCXkPJIRwt8FlUls/tyViQIbRz9BluMQ5E7
 pPlLMyGVZsSeDQ+juKooR+cqVKK8Feqe+sRmIDjBwzIy7eqzqK9lwdiUNVgLPCWB7Lnw/4a
 y8oaJWAjiFQBM4cFTDXjVRp/hdOOK6jM+UOGhFHQPlwyCNoxJDL7M89OWMoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1772198480; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=BKD2WFNwPdWE9WANUWAdR8DjeSiWPM1oyxI73/9NHVs=;
 b=gNIrrsutpBLQz8sDQYzkhaVZh9k9B3Ln++FzFmUuTr96ShqODf3cu/tVd6NS4JZHwBfGz
 UOC5rYVYIgLGeU0K+EHDJSyDV/Z11bLSZlsvIXxHf7o15V7Az9jezOIcsonLu1N/eLqOTHQ
 vwnHY1awU8TkCuiaFJnHO9WnLIBfMzyF2HDjrhdPMEC63Bl2mXIfX+pymKkM/W0N2/Yb57O
 /BBawCCYjioWs0B2s+ZtgFTd6FTLGHTCNmHdYgAYlSyjz1Elap7hEhayXEohveYF+KqhvRz
 hw4WVOMDXXu8jCe4YIz8zXRPylkIceTxdKOJxS6xHtme/MD4ybTu8K+eTYMQ==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=suse.de;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=suse.de policy.dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=suse.de;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=suse.de policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 1DA7241C68
	for <nouveau@lists.freedesktop.org>; Fri, 27 Feb 2026 13:21:17 +0000 (UTC)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	by gabe.freedesktop.org (Postfix) with ESMTPS id BE41110EB4F
	for <nouveau@lists.freedesktop.org>; Fri, 27 Feb 2026 13:31:25 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 8B1CA5C22F;
	Fri, 27 Feb 2026 13:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1772199084;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=BKD2WFNwPdWE9WANUWAdR8DjeSiWPM1oyxI73/9NHVs=;
	b=PKhvBYKJ7WL92EDujJ2CjK04N3Ws2F5G+vgnPuNEeB9AMhYXBDrHLS0/Umc7Ge9L/JIdEZ
	mE+7a+QcIlhD28JbOqUNJzDrnslzdjiM4G1FDumswWiWvHk4h+WV0LWsDApHn9u4d9M04D
	SRePHstYcaIza6tFLIDXHxfYbiqeZpQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772199084;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=BKD2WFNwPdWE9WANUWAdR8DjeSiWPM1oyxI73/9NHVs=;
	b=sGsPSxymoUE2LZVNO0iBtoyOhJSNPqMkyqe1gPBk7akgAmwUyfDh2RXZPpfzz6aKJEvGWc
	Wx83v69nZK8uelDw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1772199084;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=BKD2WFNwPdWE9WANUWAdR8DjeSiWPM1oyxI73/9NHVs=;
	b=PKhvBYKJ7WL92EDujJ2CjK04N3Ws2F5G+vgnPuNEeB9AMhYXBDrHLS0/Umc7Ge9L/JIdEZ
	mE+7a+QcIlhD28JbOqUNJzDrnslzdjiM4G1FDumswWiWvHk4h+WV0LWsDApHn9u4d9M04D
	SRePHstYcaIza6tFLIDXHxfYbiqeZpQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772199084;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=BKD2WFNwPdWE9WANUWAdR8DjeSiWPM1oyxI73/9NHVs=;
	b=sGsPSxymoUE2LZVNO0iBtoyOhJSNPqMkyqe1gPBk7akgAmwUyfDh2RXZPpfzz6aKJEvGWc
	Wx83v69nZK8uelDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4EC153EA69;
	Fri, 27 Feb 2026 13:31:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id gCwUEqycoWkrLQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Fri, 27 Feb 2026 13:31:24 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	airlied@gmail.com,
	simona@ffwll.ch
Subject: [PATCH] drm/nouveau: Test for imported buffers with
 drm_gem_is_imported()
Date: Fri, 27 Feb 2026 14:31:05 +0100
Message-ID: <20260227133113.235940-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.997];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_TWO(0.00)[2];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,gmail.com,ffwll.ch];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
Message-ID-Hash: 3XVRFJX5QKLYBDF6MLOJJDQJTJG6EDR3
X-Message-ID-Hash: 3XVRFJX5QKLYBDF6MLOJJDQJTJG6EDR3
X-MailFrom: tzimmermann@suse.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: dri-devel@lists.freedesktop.org, Danilo Krummrich <dakr@kernel.org>,
 nouveau@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/3XVRFJX5QKLYBDF6MLOJJDQJTJG6EDR3/>
Archived-At: 
 <https://lore.freedesktop.org/20260227133113.235940-6-tzimmermann@suse.de/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Instead of testing import_attach for imported GEM buffers, invoke
drm_gem_is_imported() to do the test. The test itself does not change.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: nouveau@lists.freedesktop.org
---
 drivers/gpu/drm/nouveau/nouveau_bo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 3c7d2e5b3850..0e8de6d4b36f 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -144,7 +144,7 @@ nouveau_bo_del_ttm(struct ttm_buffer_object *bo)
 	nouveau_bo_del_io_reserve_lru(bo);
 	nv10_bo_put_tile_region(dev, nvbo->tile, NULL);
 
-	if (bo->base.import_attach)
+	if (drm_gem_is_imported(&bo->base))
 		drm_prime_gem_destroy(&bo->base, bo->sg);
 
 	/*
-- 
2.52.0

