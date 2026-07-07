Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF784C44501
	for <nouveau@archiver.kernel.org>; Tue,  7 Jul 2026 13:57:37 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3D46110ED3C;
	Tue,  7 Jul 2026 13:57:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="JZMcKQXP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="C+RyRdWP";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=suse.de header.i=@suse.de header.b="JZMcKQXP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="C+RyRdWP";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 8C8E046F30;
	Tue,  7 Jul 2026 13:42:37 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1783431757;
 b=kjl+rQ5Hm4QwSftMRL06dpEYXh5yGtIIzxbAGwtmocdL1kXSljgBri7+rY9bpOW+P5Ma9
 phC8HjWULcxzT7MMdTZNMJxSUItK0R+yOxAo5T9t9ezSWgqu4p8sPtYlkL/A0Q60VqFgBOx
 MndBv6XwrF97eIHshIgxjQO6PiDU55EWQyFqTydOnRaxOdx7mLSYsJANahXgGh1pOdT9ZD4
 71g19g8IP6yo5EbQv4Z4o/pOxQ0Hw9EniVU885SnBjSyJIEKnWm8OQ9te3l8gQD7SjLRpbq
 uxlRc9s+jE62CKYqQawLKTg9dhQt5U6L2g6jcfUWdlxa/KGfuOllBNql/Ffw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1783431757; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=/BZajym9uebxwqSIz0M7fPVZU/Sl2uebGIt4iYrAV9g=;
 b=FZ3atljQbdmG2yFmrfqPEbufK3Z/unH+F6l0QKpbninkhhjrIUhsJp/Wngxn3ZgwgV+eT
 UHYte6nYxP6c0kv8gcg9cpcYdXPVB/nvxrjQzEq72cFaHEdHjoC9DlFs6Idd3qLNfIbcE+d
 6atwtZ9J94nY6FoW9nBnsvPxojNlUsab4748LqjdaXrEA15JN7rv/G2uL1g0amvgOFcDmHJ
 vOi60P5D1OdqXQf9raiLMCw3/M9zWpXnZc20fbD0cULLa2Ob8EMroQEJ+4SbIAeNurDh2rS
 rAtv3NMGRYiYMg2ie3fgUZRR4fOYEexhq+9FnTDVjd9DkcoTlzYRlTYsaEpQ==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=suse.de;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=suse.de policy.dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=suse.de;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=suse.de policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 1D152415A7
	for <nouveau@lists.freedesktop.org>; Tue,  7 Jul 2026 13:42:34 +0000 (UTC)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1BF9810ED39
	for <nouveau@lists.freedesktop.org>; Tue,  7 Jul 2026 13:57:31 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9DF37726F2;
	Tue,  7 Jul 2026 13:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1783432649;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=/BZajym9uebxwqSIz0M7fPVZU/Sl2uebGIt4iYrAV9g=;
	b=JZMcKQXPD3wy5PFRcdEITfw+miSKvKJ5RTlRAuxpEpPsS5l8wPBhu7f94fvq1bAr/WOr+0
	pUsglwjcyaxwYnrT281uqhdnEzEsoLSpufH5gEu8rNbl0G+vLT7wj+TNMpLAvAf9fzIZ7E
	SO+h0aYfew01KkkLL+kgOIcGFv6WVZE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783432649;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=/BZajym9uebxwqSIz0M7fPVZU/Sl2uebGIt4iYrAV9g=;
	b=C+RyRdWPPLFcwhiNscmhIGQS0IMWLqWZiaNhJ0EJauZjg3KpsekXPUg7vgQhjJxISCOmvl
	+TLK6kAXvGZsgVAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1783432649;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=/BZajym9uebxwqSIz0M7fPVZU/Sl2uebGIt4iYrAV9g=;
	b=JZMcKQXPD3wy5PFRcdEITfw+miSKvKJ5RTlRAuxpEpPsS5l8wPBhu7f94fvq1bAr/WOr+0
	pUsglwjcyaxwYnrT281uqhdnEzEsoLSpufH5gEu8rNbl0G+vLT7wj+TNMpLAvAf9fzIZ7E
	SO+h0aYfew01KkkLL+kgOIcGFv6WVZE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783432649;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=/BZajym9uebxwqSIz0M7fPVZU/Sl2uebGIt4iYrAV9g=;
	b=C+RyRdWPPLFcwhiNscmhIGQS0IMWLqWZiaNhJ0EJauZjg3KpsekXPUg7vgQhjJxISCOmvl
	+TLK6kAXvGZsgVAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 19C6C779AE;
	Tue,  7 Jul 2026 13:57:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 1EnlBMkFTWoFSgAAD6G6ig
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
Subject: [PATCH 00/10] vga_switcheroo,
 drm: Push fbcon handling into DRM clients
Date: Tue,  7 Jul 2026 15:38:07 +0200
Message-ID: <20260707135724.247562-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 9DF37726F2
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.998];
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
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
Message-ID-Hash: 5DH526NLBPYPOJK6A6EPHAPZL4L73E6T
X-Message-ID-Hash: 5DH526NLBPYPOJK6A6EPHAPZL4L73E6T
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/5DH526NLBPYPOJK6A6EPHAPZL4L73E6T/>
Archived-At: 
 <https://lore.freedesktop.org/20260707135724.247562-1-tzimmermann@suse.de/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Vga_switcheroo currently invokes fb_switch_outputs() to inform fbcon
about switching of the physical outputs among framebuffer devices. But
new DRM clients to not use fbdev/fbcon and might require their own
vga_switcheroo support. Let's strictly separate them from each other.

Remove fbdev/fbcon from vga_switcheroo. Introduce a pre_switch callback
for vga_switcheroo clients to do the fbcon update. Allows for removing
all direct interactions between vga_switcheroo and fbdev/fbcon.

Also replace the existing reprobe hook with post_switch for symetry.

At the same time, push the fbcon update into DRM's client for fbdev
emulation. Do this with the new DRM client callback acquire_outputs,
so that other clients can have their own handling of vga_switcheroo.

There are only four drivers that support vga_switcheroo: amdgpu,
radeon, i915 and nouveau. Update each of them with the new callbacks.
When vga_switcheroo now invokes pre_switch, each DRM driver forwards
to aquire_outputs and lets the DRM clients handle the new outputs.

Tested with radeon on a notebook with Radeon HD 4225 and HD 5430.

Thomas Zimmermann (10):
  drm/edid: Include <linux/fb.h>
  drm/client: Add acquire_outputs callback; implement for fbdev
    emulation
  vga_switcheroo: Add pre_switch callback to client ops
  vga_switcheroo: Add post_switch callback to client ops
  drm/amdgpu: Implement struct vga_switcheroo_client_ops.pre_switch
  drm/i915: Implement vga_switcheroo_client_ops.pre_switch
  drm/nouveau: Implement vga_switcheroo_client_ops.pre_switch
  drm/nouveau: Implement vga_switcheroo_client_ops.post_switch
  drm/radeon: Implement struct vga_switcheroo_client_ops.pre_switch
  vga-switcheroo: Remove unused interfaces

 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  9 ++++-
 drivers/gpu/drm/clients/drm_fbdev_client.c | 23 ++++++++----
 drivers/gpu/drm/drm_client_event.c         | 18 ++++++++++
 drivers/gpu/drm/drm_edid.c                 |  1 +
 drivers/gpu/drm/i915/i915_switcheroo.c     | 11 +++++-
 drivers/gpu/drm/nouveau/nouveau_vga.c      | 28 +++++++++------
 drivers/gpu/drm/radeon/radeon_device.c     |  9 ++++-
 drivers/gpu/vga/vga_switcheroo.c           | 41 +++++-----------------
 drivers/video/fbdev/core/fbcon.c           |  8 -----
 include/drm/drm_client.h                   | 14 ++++++++
 include/drm/drm_client_event.h             |  3 ++
 include/linux/vga_switcheroo.h             | 30 +++++++++-------
 12 files changed, 122 insertions(+), 73 deletions(-)


base-commit: cd8abe2554ec7eba16c1d48ab508732bf93534eb
-- 
2.54.0

