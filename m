Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 130B2607553F
	for <nouveau@archiver.kernel.org>; Mon, 19 Oct 2026 15:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=eLHhPEX/;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=5khW4cqd;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=zNQS71yM;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=ewW0O3Sh
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id EADCB10EEBB;
	Mon, 19 Oct 2026 15:46:49 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id B7D6248B2C;
	Mon, 19 Oct 2026 15:28:01 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1792423681;
 b=UblZcHl5Hs2QvuvOOnMLS8EVTmnzbfErMseHHidAXw2upb0nwKFlMsOIPfnx3IlrI1KAr
 jYO548BV1EufafQ4Kz9s3pcZmMre8stxoRWaDJrMUnubxh9o1Dookc1F0PFSDyiSJXpcHDR
 PrgrV+67EuyhfUW/dN4jugdJETFi7bczWdD+f3ZCM0DgV4MYLg+Pw/O3hEUGd6/pvW8LJHc
 B0BkeWKdht9T9i7Ah/+IzGgRrzc2KHzc9xhdY2AGnXn1wciL5GVyRy8tW6c9ODIXwS0i+RZ
 gWCTJOfov+bmcT7L38yNt4A/HQWlYSUAXKv4vXCaqgiRHxpLrqBEwVO2fuUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1792423681; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=Q5jfLHdOgauf4TJGcojCjJicBompzHEBNJH4FQng/Qg=;
 b=j53dOX2Pko0s+4WZzGPNreNDA5VmQWCedPZlkJZ7RLOji22xh9aIiyyjL58dUNuL5+lmC
 bDA/NvgbNtqSSCpOZRTb2DdNPJ7lvpTvsWDuZrmhGtKs69PTwKbXEEGpSmzUeuTiE+t6KST
 chKYzB5177Ib7FxNLHf949SitO2rEsY+QwACnJ/w1BJOivg+KK9yqcAk0d6u1LtnmfFkInH
 o/7Q6iHo3TRYLDLHuwli2E77Za+ijj4e8cJW+HBfWqBuQ1us5ckDy/HoUfNytzmOogmWDIR
 g+vRPN8G2u6N5O0IzQmJ9KjWCY2lvEQAVTs+vCXnf1EdU42a0rZ5YdciZkdw==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=suse.de;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=suse.de policy.dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=suse.de;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=suse.de policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 6339448B13
	for <nouveau@lists.freedesktop.org>; Mon, 19 Oct 2026 15:27:58 +0000 (UTC)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 56FF510E9DE;
	Mon, 19 Oct 2026 15:46:36 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C40E41F444;
	Mon, 19 Oct 2026 15:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1792424779;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=Q5jfLHdOgauf4TJGcojCjJicBompzHEBNJH4FQng/Qg=;
	b=eLHhPEX/3TCqJ/XmoqatvuqCQSdY3Pr+P5FtOt4Sv3QxwUJXgA10ALsxbhVld0eAe93ZZ4
	d6Cek9M0r++AsQeKzSIm52qOdgSQlIZCuDesVxFP3/Ea5d45QzrOgqzaA4QW8MGCsovmQ+
	jA4wv975YO/0ShG6BVHsrbXD7T6+42c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792424779;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=Q5jfLHdOgauf4TJGcojCjJicBompzHEBNJH4FQng/Qg=;
	b=5khW4cqdC699nJ5v1ujyRTIiRqIwFIwiF6OPf+6TvSoUAYYU9p+lDn2ZB/iMfgzOctVZKY
	cA1AHNoEvehaFOCA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1792424777;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=Q5jfLHdOgauf4TJGcojCjJicBompzHEBNJH4FQng/Qg=;
	b=zNQS71yM/kc2I8PjYNn19JU+kwk8G5rNHxyb/Q+1ufzMrLSOXAXbNkTdsQ1Vu6xRVVrGgs
	sMbOalMqkrOYeuWe1LON6FlwdaEAZTwI7txzBCIhoUA2gnX0jxqU2Ui87s0ABFD89IXPwR
	noquh1e0zE3+bnmhWYYumfZhud8nw2U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792424777;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=Q5jfLHdOgauf4TJGcojCjJicBompzHEBNJH4FQng/Qg=;
	b=ewW0O3ShwsL4XRU7kOgc1bRZz9WfEvSleKV+S+vmfs7Y8PT00P899HadfuKSo+f/7uoR7s
	GvmYEw2bikL52cCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 43642134B3;
	Mon, 19 Oct 2026 15:46:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id gYPgBkk71mrrPAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Mon, 19 Oct 2026 15:46:17 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	airlied@gmail.com,
	simona@ffwll.ch
Subject: [PATCH 0/4] drm: Move drawing to pixel-helper module
Date: Mon, 19 Oct 2026 17:32:41 +0200
Message-ID: <20261019154612.777074-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[redhat.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo];
	RCVD_COUNT_TWO(0.00)[2];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
Message-ID-Hash: J2DYM5OVW3JJUIBOIHWRHD74AXPWL34B
X-Message-ID-Hash: J2DYM5OVW3JJUIBOIHWRHD74AXPWL34B
X-MailFrom: tzimmermann@suse.de
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-hyperv@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 nouveau@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 virtualization@lists.linux.dev, sashiko-reviews@lists.linux.dev
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/J2DYM5OVW3JJUIBOIHWRHD74AXPWL34B/>
Archived-At: 
 <https://lore.freedesktop.org/20261019154612.777074-1-tzimmermann@suse.de/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add the new module drm_pixel_helper.ko and link existing shared code
for drawing to it. This includes format helpers, panic helpers and
drawing helpers. Update drivers. No functional changes.

The existing helpers are currently part of KMS helpers or the DRM core.
Neither is suitable for this. Adding drm_pixel_helper.ko resolves this.
The new module only depends on the DRM core and common kernel functions.

Future directions: putting pixel-related helpers into the same module
opens up the possibility of sharing more code among them. There is even
more drawing code in vkms and a few other drivers. Hopefully this could
be integrated into pixel helpers at some point.

Smoke-tested on qemu with vesadrm and bochs.

Thomas Zimmermann (4):
  drm: Add helper module for working with pixel data
  drm/pixel: Link format helpers into drm_pixel_helper.ko
  drm/pixel: Link panic helpers into drm_pixel_helper.ko
  drm/pixel: Link draw helpers into drm_pixel_helper.ko

 drivers/gpu/drm/Kconfig                       | 15 ++++++--------
 drivers/gpu/drm/Kconfig.debug                 |  2 +-
 drivers/gpu/drm/Makefile                      | 12 +++++++----
 drivers/gpu/drm/amd/amdgpu/Kconfig            |  1 +
 drivers/gpu/drm/ast/Kconfig                   |  1 +
 drivers/gpu/drm/clients/Kconfig               |  2 +-
 .../gpu/drm/{drm_draw.c => drm_draw_helper.c} |  0
 drivers/gpu/drm/drm_kms_helper_common.c       | 13 ------------
 drivers/gpu/drm/drm_panic_helper.c            |  1 +
 drivers/gpu/drm/drm_panic_internal.h          | 14 -------------
 drivers/gpu/drm/drm_pixel_helper_common.c     | 20 +++++++++++++++++++
 drivers/gpu/drm/drm_pixel_helper_internal.h   | 20 +++++++++++++++++++
 drivers/gpu/drm/gud/Kconfig                   |  1 +
 drivers/gpu/drm/hisilicon/hibmc/Kconfig       |  1 +
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_de.c    |  1 +
 drivers/gpu/drm/hyperv/Kconfig                |  1 +
 drivers/gpu/drm/i915/Kconfig                  |  1 +
 drivers/gpu/drm/imx/ipuv3/Kconfig             |  1 +
 drivers/gpu/drm/mgag200/Kconfig               |  1 +
 drivers/gpu/drm/nouveau/Kconfig               |  1 +
 drivers/gpu/drm/renesas/rcar-du/Kconfig       |  1 +
 drivers/gpu/drm/renesas/shmobile/Kconfig      |  1 +
 drivers/gpu/drm/sitronix/Kconfig              |  2 ++
 drivers/gpu/drm/solomon/Kconfig               |  1 +
 drivers/gpu/drm/sysfb/Kconfig                 |  1 +
 drivers/gpu/drm/sysfb/drm_sysfb_modeset.c     |  1 +
 drivers/gpu/drm/tidss/Kconfig                 |  1 +
 drivers/gpu/drm/tiny/Kconfig                  |  6 ++++++
 drivers/gpu/drm/tiny/bochs.c                  |  1 +
 drivers/gpu/drm/virtio/Kconfig                |  1 +
 30 files changed, 83 insertions(+), 42 deletions(-)
 rename drivers/gpu/drm/{drm_draw.c => drm_draw_helper.c} (100%)
 create mode 100644 drivers/gpu/drm/drm_pixel_helper_common.c
 create mode 100644 drivers/gpu/drm/drm_pixel_helper_internal.h


base-commit: 5b9ee97c47574138633a1cb70a32d118b6860a43
-- 
2.56.0

