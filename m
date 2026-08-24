Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6F39C5DF81
	for <nouveau@archiver.kernel.org>; Mon, 24 Aug 2026 12:52:45 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7E07410E78F;
	Mon, 24 Aug 2026 12:52:45 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 87FAF47193;
	Mon, 24 Aug 2026 12:36:01 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1787574961;
 b=UKCDDQE18hiCahF25bY/Un7qs0fm2r2PmH4p6UhJR1BGj0oArIpn72IMA2xLgKJfK1v38
 ByzOzH+8zk3Rs4M4WfAIHPEKeRVDrt9mUx35DDqRmO8LoLmFY/cldpfR83lZp1vFWdINJ38
 P1UasjTVdk9r/NAxoDmE6PIttYHYOfUhSBdtdPgECHTFLO0DyNanVW6u3HibNXyaNwZS98K
 u1Z1bg0Yb9usq2eZ3QfU9LRVQiuVOUaG9z3KfiBEuCDS77uI+eEJ7+PrT52mbVtGnAewsQg
 Q3ujEVZXxZoIJkkmXunPGBahn8MJKfrHybGZxyS5u5lGcb92UXUBBEo4+Zgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1787574961; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=qQvLeJqvaSKGAjRKWWzrEIrvz+PY52tPM09VH4yW1IM=;
 b=JuT1YTxD3HbOcXyzisCHCrRyc/Uvam/Kzr4FGWw3In7WiWonoKAT/0Qku6nve7T9wb1N3
 4/DQ0W9/Z/bqQuo0fGp1pH6Qx6GxKjRgLgxmCsC1ZresXrJoUT01AjjtWfAtWpY935ZJ7tN
 wHIUojkLWnYpHetVb158cbFBiyoB/aZhIpKIOBczLaoQdGiQR4GylKKNuQlbSfdtAHzlS1x
 p6jQL/o/UX5N5Dxsc5ylVf2WLs5XbmfvTwa9M3hOZ9LOYxYTyMEZSGoe1TE1RrCob0mJXrM
 N6M1CuBKIcGVWMbkYr/I/HFsFPbg5phouibK5pLq0av+tdvh9Gfh9kIFah6g==
ARC-Authentication-Results: i=1; mail.freedesktop.org; dkim=fail;
  arc=none (Message is not ARC signed);
  dmarc=fail (Used From Domain Record) header.from=suse.de policy.dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=fail;
 arc=none (Message is not ARC signed);
 dmarc=fail (Used From Domain Record) header.from=suse.de policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 8E87340951
	for <nouveau@lists.freedesktop.org>; Mon, 24 Aug 2026 12:35:59 +0000 (UTC)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 425EC10E78B
	for <nouveau@lists.freedesktop.org>; Mon, 24 Aug 2026 12:52:43 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 98D7D86833;
	Mon, 24 Aug 2026 12:52:11 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 76CE81340F;
	Mon, 24 Aug 2026 12:52:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id YNnDG3o+jGpyNwAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Mon, 24 Aug 2026 12:52:10 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com,
	javierm@redhat.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	geert@linux-m68k.org,
	rdunlap@infradead.org
Subject: [PATCH v2 09/13] drm/panic: Restrict to primary planes;
 unconditionally unregister
Date: Mon, 24 Aug 2026 14:43:40 +0200
Message-ID: <20260824125201.218863-10-tzimmermann@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260824125201.218863-1-tzimmermann@suse.de>
References: <20260824125201.218863-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Rspamd-Queue-Id: 98D7D86833
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
Message-ID-Hash: TL4KFFYXRVRO7S5FOTO33MSZ6TA6E44M
X-Message-ID-Hash: TL4KFFYXRVRO7S5FOTO33MSZ6TA6E44M
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/TL4KFFYXRVRO7S5FOTO33MSZ6TA6E44M/>
Archived-At: 
 <https://lore.freedesktop.org/20260824125201.218863-10-tzimmermann@suse.de/>
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

For cleanup, unregister each plane unconditionally. The kmsg dumper
already keeps track of the registration status so DRM doesn't have
to.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/drm_panic.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
index 2048a3bf736f..7dbbcc1c219f 100644
--- a/drivers/gpu/drm/drm_panic.c
+++ b/drivers/gpu/drm/drm_panic.c
@@ -1079,6 +1079,8 @@ void drm_panic_register(struct drm_device *dev)
 		return;
 
 	drm_for_each_plane(plane, dev) {
+		if (plane->type != DRM_PLANE_TYPE_PRIMARY)
+			continue;
 		if (!plane->helper_private || !plane->helper_private->get_scanout_buffer)
 			continue;
 		plane->kmsg_panic.dump = drm_panic;
@@ -1105,11 +1107,8 @@ void drm_panic_unregister(struct drm_device *dev)
 	if (!dev->mode_config.num_total_plane)
 		return;
 
-	drm_for_each_plane(plane, dev) {
-		if (!plane->helper_private || !plane->helper_private->get_scanout_buffer)
-			continue;
+	drm_for_each_plane(plane, dev)
 		kmsg_dump_unregister(&plane->kmsg_panic);
-	}
 }
 
 /**
-- 
2.55.0

