Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C32B8C9830C
	for <nouveau@archiver.kernel.org>; Wed, 23 Sep 2026 11:06:08 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8F06310EFC4;
	Wed, 23 Sep 2026 11:06:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="ePtxV5xp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="J+WdkfMv";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=suse.de header.i=@suse.de header.b="m5yKt4a2";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vsplEf8y";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 0CAB3485E8;
	Wed, 23 Sep 2026 10:48:18 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1790160497;
 b=dkwTV3GUFcetaEEpYvsjB6/S4aSe6BgjV2w3nz2+XzOMxZnCjrsBD2uS0m8bDjAt92Pi+
 bZvn8/aKKbIlRPiFBwqbJJ8sa4032YisY5RzJy3kt44kUTm37oh6Jh58OjFYCmgyXMxy9ia
 pU0OS1zGY/2VBTia+9tzJwLyEd+JUBQ9AQoAo0QGjdDCJJZmWWk0dGAhRrO+84tD0EiCLlb
 7vZj1+rHQSzDI+yCJNBjvu+l/Wh17asitin2cMVy51Go89sKTxhZaDkWtvX7EHKtU2cye8n
 GLfkonM+WYfQphR/P4RFKFhgudYz1Cp+9E3TQIMbPvA5taxyw3JUZ6JEvzaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1790160497; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=yig4P1nR/KUuXfkyUGF4O2Z2u6hzgy5a9b/28nBUgkg=;
 b=PMrpzg3c8d/ztLPRQp29hjZqh9NveT2JlALeyuqVde6jNEudtq1s3T4KnfYhyHNgwWcqm
 EOJ3flGTU70LugN9O16B8kCQYRTRLK5IXVDKmSwM1jAQCkI8GZ1jxjHueDxUVuDhk/njnv7
 58Nou2KuNK79VMCHfV0/aRjmyRiQlYJtNwvCqjVg5BC1TsSQ2fQWNP70i4mXmu8hoqOu7lg
 Q+JLh3iR7ZDo/pN4qcPcrZvtKfU/7GdE2g19EpqFQ5PbPlUls6dxTezkNBNpx3BuzwFqyJl
 MwF/ud2K057qTBcCnpXV8YR5I142sYXzpmmHl18UZ73GguNol2zi0M74SSmg==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=suse.de;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=suse.de policy.dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=suse.de;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=suse.de policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 6F04448338
	for <nouveau@lists.freedesktop.org>; Wed, 23 Sep 2026 10:48:14 +0000 (UTC)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8C6E210EFCF;
	Wed, 23 Sep 2026 11:06:04 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E84C321C07;
	Wed, 23 Sep 2026 11:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1790161546;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=yig4P1nR/KUuXfkyUGF4O2Z2u6hzgy5a9b/28nBUgkg=;
	b=ePtxV5xpT8kK69c6QxNDO4furdu3M40140REdmVhxy9as5dPbyUr/uRJe4N4go7xr2pmJl
	l0v8XBmVn1yllU9MKy1JgKgxZKHJx50yXMCUuy9q4gyrdSLjvQfb97KAN/hknQugGtRkag
	0+PLjCx0AqRtQKcBf5pWdIuMgaQNU2E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790161546;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=yig4P1nR/KUuXfkyUGF4O2Z2u6hzgy5a9b/28nBUgkg=;
	b=J+WdkfMvtx3Z6FGXkOBbFg76sR2NA+Es/PJiyFaiCgBuoWQ17D0vNc9YnSYL/TpED8BzRx
	gINVHglNrjfPlBAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1790161542;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=yig4P1nR/KUuXfkyUGF4O2Z2u6hzgy5a9b/28nBUgkg=;
	b=m5yKt4a2fXeCzHw3ipzn/lBSRUYdp4k+kJ2mRUn6c5+U5r36PMvgsOZm+jr+0CnafI7kg/
	QXnk4w90i0Mpc340hjS4jh//qAF7Co8aKR9Tcu65KB6N3wQTYuBqfT6CxPP70pew59GWa/
	KuenZdsmc6j4ZiSTH0FZeNbuL9d5kUk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790161542;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=yig4P1nR/KUuXfkyUGF4O2Z2u6hzgy5a9b/28nBUgkg=;
	b=vsplEf8yfCWyorb1CPQA1FraVVbOxPtSXYOyp7RR2I/wEotb7KJZ/+630wDBb9sEMz2oTV
	ezeJIaUYCNypgTBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 54EFA13432;
	Wed, 23 Sep 2026 11:05:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id VCF1C4Wys2qeBAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Wed, 23 Sep 2026 11:05:41 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com,
	javierm@redhat.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	airlied@gmail.com,
	simona@ffwll.ch
Subject: [PATCH 0/2] drm/fbdev: Move helpers to clients/ subdirectory
Date: Wed, 23 Sep 2026 12:59:08 +0200
Message-ID: <20260923110537.451614-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: E84C321C07
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_TO(0.00)[redhat.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLqtkr6cif1ebgurukgmwdm7xc)];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
Message-ID-Hash: F7KL4ZLBMKLLHIQA2VBLRZRUHVGW5TYD
X-Message-ID-Hash: F7KL4ZLBMKLLHIQA2VBLRZRUHVGW5TYD
X-MailFrom: tzimmermann@suse.de
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-tegra@vger.kernel.org, sashiko-reviews@lists.linux.dev
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/F7KL4ZLBMKLLHIQA2VBLRZRUHVGW5TYD/>
Archived-At: 
 <https://lore.freedesktop.org/20260923110537.451614-1-tzimmermann@suse.de/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Helpers for fbdev emulation are still linked into drm_kms_helper.ko,
which is for mode setting. Move the source and header files to the
clients/ subdirectory and link them into drm_client_lib.ko. This has
some fallout throughout drivers, but it's all trivial.

There are 3 module parameters to drm_kms_helper.ko that control fbdev
emulation. For compatibility with existing installations, leave them
in this module.

Thomas Zimmermann (2):
  drm/fbdev: Move fbdev module parameters next to module init
  drm/fbdev: Move fbdev helpers into client library

 drivers/gpu/drm/Makefile                      |  1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c   |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c       |  2 +-
 drivers/gpu/drm/clients/Makefile              |  3 +-
 drivers/gpu/drm/clients/drm_fbdev_client.c    |  2 +-
 .../drm_fbdev_helper.c}                       | 34 +---------------
 drivers/gpu/drm/drm_crtc_helper_internal.h    |  9 +++++
 drivers/gpu/drm/drm_fbdev_dma.c               |  2 +-
 drivers/gpu/drm/drm_fbdev_shmem.c             |  2 +-
 drivers/gpu/drm/drm_fbdev_ttm.c               |  2 +-
 drivers/gpu/drm/drm_kms_helper_common.c       | 39 +++++++++++++++++++
 drivers/gpu/drm/exynos/exynos_drm_fbdev.c     |  2 +-
 drivers/gpu/drm/gma500/fbdev.c                |  2 +-
 drivers/gpu/drm/i915/display/intel_fbdev.c    |  2 +-
 drivers/gpu/drm/msm/msm_debugfs.c             |  2 +-
 drivers/gpu/drm/msm/msm_fbdev.c               |  2 +-
 drivers/gpu/drm/nouveau/dispnv50/disp.c       |  1 -
 drivers/gpu/drm/omapdrm/omap_debugfs.c        |  2 +-
 drivers/gpu/drm/omapdrm/omap_fbdev.c          |  2 +-
 drivers/gpu/drm/radeon/radeon_device.c        |  2 +-
 drivers/gpu/drm/radeon/radeon_fbdev.c         |  2 +-
 drivers/gpu/drm/rockchip/rockchip_drm_gem.c   |  2 +-
 drivers/gpu/drm/sitronix/st7571.c             |  1 -
 drivers/gpu/drm/tegra/fbdev.c                 |  2 +-
 drivers/gpu/drm/vboxvideo/vbox_mode.c         |  2 +-
 .../drm_fbdev_helper.h}                       |  4 +-
 26 files changed, 72 insertions(+), 56 deletions(-)
 rename drivers/gpu/drm/{drm_fb_helper.c => clients/drm_fbdev_helper.c} (97%)
 rename include/drm/{drm_fb_helper.h => clients/drm_fbdev_helper.h} (99%)

-- 
2.55.0

