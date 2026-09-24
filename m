Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40FBBC9831A
	for <nouveau@archiver.kernel.org>; Thu, 24 Sep 2026 09:31:13 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 19F1410F3E5;
	Thu, 24 Sep 2026 09:31:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="xOCRYUji";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="hcaG2BmB";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=suse.de header.i=@suse.de header.b="NCAQ8wlH";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="B5K7fuSR";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 8476448670;
	Thu, 24 Sep 2026 09:13:20 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1790241200;
 b=gquIKzF0QhI7BuKOPIHf61pCX7pRwiQIozhV/vOi5ZpGBnuqy9/raI4QOReoKuVmytT+L
 u2IUbPskrryVIU7H30oZEuUB/xGhNIkFqr4ab0//v5i3Loinol3Q3Zs1F/oo6wYRyLWBRoG
 sd1mruL5u8F7OO/P4YbOzFDqLO49yZ6rckXi0+Knv/vf8sP+8RrezIjCKBSv3TeLJdyOtNa
 sieaA10s1wyQOroj/5uHOaWwKZUr6HPUDp7MoaKUyve0uvYP2a3lLlKwFuz/soMU7G13KKi
 PUVPKUP4NajsXBvQ261V6OZvd3Zn8IFDxvX1a1eB5pJOLXPWJiEUEgP0F4cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1790241200; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=5qHmT8mqoU/l4reYg7Eb+0uAE5mbLL+lTgBwhE2yy78=;
 b=YGaBWpDOxLZ2EakaS31r1Gam35TkZrEcTWArVsvdCot98HjyfWM97rFSKXNH5SMwtN3bz
 CsOHgeP6YAHRCyX+DRMH6r8jRlduWXofqQS+IxoyfTorSIjHcPXQSdy5LbhKoKHBgxJKsQr
 nJ0iCozRSaw4MJfX5Yz/GesRYxP5hBP8/zPcZSxWaMD1acSiaf7cSwCTMV6ujiYnUbc3N/E
 fxpBgiP37haGLoMUmh2QHfIdtGj2tbaE/2NB1hc4ZYszYop3FQ7wqh0AYZYwBLhzPXakjdG
 K+E39ofuNACK+ClRB32MiGTVJdYK5R2KbRGWUYe+ESybO592t5KALFZ0fOcw==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=suse.de;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=suse.de policy.dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=suse.de;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=suse.de policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 78C6B485BF
	for <nouveau@lists.freedesktop.org>; Thu, 24 Sep 2026 09:13:18 +0000 (UTC)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	by gabe.freedesktop.org (Postfix) with ESMTPS id AA46B10E9B5;
	Thu, 24 Sep 2026 09:31:10 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2276621E37;
	Thu, 24 Sep 2026 09:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1790242251;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=5qHmT8mqoU/l4reYg7Eb+0uAE5mbLL+lTgBwhE2yy78=;
	b=xOCRYUji5YGOomTuwabeuv4lVWehlLnSbQO505eNnYFBDTJJHNVhtfcn7KWL9VuKtJUwUG
	U3+pSI2mEPZ3M0+9eBkpAozXKLSo5EkBpSGt7NDDehFaq3dS0x9cm18PTHFk4lJLPZWl0Q
	5UhrX93hczCoxNWG/GNyLWfbQPq0Lho=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790242251;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=5qHmT8mqoU/l4reYg7Eb+0uAE5mbLL+lTgBwhE2yy78=;
	b=hcaG2BmBN8RpCzgUImDkVhCd4jadO1K10lHG0EliOUcZ6SKQ6PIi/Dd3pLETHtlt6oEMql
	Q52sxpdwnDE6yxBw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1790242247;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=5qHmT8mqoU/l4reYg7Eb+0uAE5mbLL+lTgBwhE2yy78=;
	b=NCAQ8wlHzSjj22Mp5WtBpQSSbsGzsynKwAS9wnWJOqzDInDouS8G5yFj74601ElwpptgWz
	BFp/X23TPESlPxJYSdg897HDlOYorWZ2VSJIZ52xyLnhYfAMluAdZ1kecNmmZMT8g7E3xY
	ZjDe8kgwIAZLcbF901D6+4lVn1iSaoA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790242247;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=5qHmT8mqoU/l4reYg7Eb+0uAE5mbLL+lTgBwhE2yy78=;
	b=B5K7fuSR7zGFiT91J2r1XWZaM/q96dFA32nS7RNZ/rQQjsSspv945N1hwzYCw8IwSVBVhK
	jYelmgRKJLRWuZBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 70E0113668;
	Thu, 24 Sep 2026 09:30:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 2es5CcbttGp+IgAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Thu, 24 Sep 2026 09:30:46 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com,
	javierm@redhat.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	jani.nikula@linux.intel.com,
	Alexander.Deucher@amd.com
Subject: [PATCH v2 0/2] drm/fbdev: Move helpers to clients/ subdirectory
Date: Thu, 24 Sep 2026 11:29:12 +0200
Message-ID: <20260924093036.82356-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 2276621E37
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_TO(0.00)[redhat.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch,amd.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	R_RATELIMIT(0.00)[to_ip_from(RLgosu6qu4h11rje89ht7rjgg5)];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
Message-ID-Hash: DLM6PYLNZX3FOTLINE3ZFDFA2KDKBPS6
X-Message-ID-Hash: DLM6PYLNZX3FOTLINE3ZFDFA2KDKBPS6
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/DLM6PYLNZX3FOTLINE3ZFDFA2KDKBPS6/>
Archived-At: 
 <https://lore.freedesktop.org/20260924093036.82356-1-tzimmermann@suse.de/>
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

v2:
- update armada and docs

Thomas Zimmermann (2):
  drm/fbdev: Move fbdev module parameters next to module init
  drm/fbdev: Move fbdev helpers into client library

 Documentation/gpu/drm-kms-helpers.rst         |  6 +--
 drivers/gpu/drm/Makefile                      |  1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c   |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c       |  2 +-
 drivers/gpu/drm/armada/armada_fbdev.c         |  2 +-
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
 28 files changed, 76 insertions(+), 60 deletions(-)
 rename drivers/gpu/drm/{drm_fb_helper.c => clients/drm_fbdev_helper.c} (97%)
 rename include/drm/{drm_fb_helper.h => clients/drm_fbdev_helper.h} (99%)


base-commit: ff831af91674990f9f1814340860e96943d5df1a
-- 
2.55.0

