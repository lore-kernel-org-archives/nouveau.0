Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B124C43602
	for <nouveau@archiver.kernel.org>; Tue,  7 Jul 2026 13:57:56 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 43E9C10ED75;
	Tue,  7 Jul 2026 13:57:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="zrv2jo0Y";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="nA3CUPqh";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=suse.de header.i=@suse.de header.b="zrv2jo0Y";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="nA3CUPqh";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id A763E46F43;
	Tue,  7 Jul 2026 13:42:58 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1783431778;
 b=J3qLavMoaJEopr5OZvWPZMel23wAyMR9JWRRLeFX3TnkhbUS3aLE+chxR9b6C08qxRFKB
 4KUUhR4+U2pk69YwWp9ozavtBRDXtGGjtJwnrElo01iXpgn6/SPEcYDTDBKkqU1DAZPtZ5k
 zwHZ4ZPVL6bquow9dSKJ3jvljk9WpW2TtE6p4EILln4LUaPOUymcWNRvIUb0366/KQwl+BP
 af1KbHBvlqkfcQObuasyl1Foef1C83M+vl9WvsVEpjdKYhB1pjoLVvJ+0mmcjAysn+2iQnV
 DB+Kgr1ZJl+/AbjuzHy4GGWrSMJ7Bw2NPqGCIa+0PpOCev0238+Hqppu+M3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1783431778; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=Gezhe42hCPuf8EJ5YT9wfwNAIh+Y34zKtMBp5FToaFc=;
 b=Uko3Aftu6BcUG2D+N5rupLcOB7vT81VAQ2VvA03Ed7yRDmnFmoG9j4zVe5sb9NfCML0q8
 vzIW3kgz2U5CTH5aw8CIUopE9d022ZAMR3SeJy+NNArGvPNABtgigPik80+RdowpSDEPc2U
 V5QsHsZC5nPwpyw0SWaMSfSHXBwLMrU7OZ3cva/QopuhiUVqJsB1M8IoRcr16eNVeBHesi2
 v4VRgCxQsYaEWConldvsOlFGaxnYfXO0Eia5tnO6aOjVxY7gUzS3I5F0AnhA6A+TbVigYSt
 5xlkpLnm6opQon3/txtHgQ3iS/07GXcEYlWGMovKrFoSQDBvBvXm3p3qlo+w==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=suse.de;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=suse.de policy.dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=suse.de;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=suse.de policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 4B36E46F3F
	for <nouveau@lists.freedesktop.org>; Tue,  7 Jul 2026 13:42:56 +0000 (UTC)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9242910ED75
	for <nouveau@lists.freedesktop.org>; Tue,  7 Jul 2026 13:57:53 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 2DC9D75CC4;
	Tue,  7 Jul 2026 13:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1783432655;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Gezhe42hCPuf8EJ5YT9wfwNAIh+Y34zKtMBp5FToaFc=;
	b=zrv2jo0Y9kQ8hic3l6dlQwiACP+CSHn3K9S8zHi0UAHt2qeH+2JfmKogqKEQB7lwPGQg9b
	NNufZTCUl5VV5EPL9+6+x3EpEkIOrFtxUYccLmTsyvyBxkumHzfBdNGoAGnP1h1siaF8RY
	2uDGAu+ycwXVH6J+3jcmhS/p4YDtsIw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783432655;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Gezhe42hCPuf8EJ5YT9wfwNAIh+Y34zKtMBp5FToaFc=;
	b=nA3CUPqhNNZV29K9KCZwdEMICNzKf14++DVHz3lQM1in+eCBjFVcXK0dtBAOWTcAmlDoGB
	TzyOEyioQpKHp/Bw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1783432655;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Gezhe42hCPuf8EJ5YT9wfwNAIh+Y34zKtMBp5FToaFc=;
	b=zrv2jo0Y9kQ8hic3l6dlQwiACP+CSHn3K9S8zHi0UAHt2qeH+2JfmKogqKEQB7lwPGQg9b
	NNufZTCUl5VV5EPL9+6+x3EpEkIOrFtxUYccLmTsyvyBxkumHzfBdNGoAGnP1h1siaF8RY
	2uDGAu+ycwXVH6J+3jcmhS/p4YDtsIw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783432655;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Gezhe42hCPuf8EJ5YT9wfwNAIh+Y34zKtMBp5FToaFc=;
	b=nA3CUPqhNNZV29K9KCZwdEMICNzKf14++DVHz3lQM1in+eCBjFVcXK0dtBAOWTcAmlDoGB
	TzyOEyioQpKHp/Bw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 40AA1779AF;
	Tue,  7 Jul 2026 13:57:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id AISQDs4FTWoFSgAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 07 Jul 2026 13:57:34 +0000
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
Subject: [PATCH 09/10] drm/radeon: Implement struct
 vga_switcheroo_client_ops.pre_switch
Date: Tue,  7 Jul 2026 15:38:16 +0200
Message-ID: <20260707135724.247562-10-tzimmermann@suse.de>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260707135724.247562-1-tzimmermann@suse.de>
References: <20260707135724.247562-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 2DC9D75CC4
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
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
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:email,suse.de:mid];
	FROM_EQ_ENVFROM(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLgosu6qu4h11rje89ht7rjgg5)];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
Message-ID-Hash: XNIGDPMF3RZZT7ZSEAISBMYMXZKLYCQU
X-Message-ID-Hash: XNIGDPMF3RZZT7ZSEAISBMYMXZKLYCQU
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/XNIGDPMF3RZZT7ZSEAISBMYMXZKLYCQU/>
Archived-At: 
 <https://lore.freedesktop.org/20260707135724.247562-10-tzimmermann@suse.de/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Call drm_client_dev_acquire_outputs() from vga_switcheroo's pre_switch
callback. Pushes fbcon updates from vga_switcheroo into DRM's fbdev
emulation.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/radeon/radeon_device.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/radeon/radeon_device.c b/drivers/gpu/drm/radeon/radeon_device.c
index 705c012fcf9e..8697a9eb5d13 100644
--- a/drivers/gpu/drm/radeon/radeon_device.c
+++ b/drivers/gpu/drm/radeon/radeon_device.c
@@ -1258,10 +1258,18 @@ static bool radeon_switcheroo_can_switch(struct pci_dev *pdev)
 	return atomic_read(&dev->open_count) == 0;
 }
 
+static void radeon_switcheroo_pre_switch(struct pci_dev *pdev)
+{
+	struct drm_device *dev = pci_get_drvdata(pdev);
+
+	drm_client_dev_acquire_outputs(dev);
+}
+
 static const struct vga_switcheroo_client_ops radeon_switcheroo_ops = {
 	.set_gpu_state = radeon_switcheroo_set_state,
 	.reprobe = NULL,
 	.can_switch = radeon_switcheroo_can_switch,
+	.pre_switch = radeon_switcheroo_pre_switch,
 };
 
 /**
-- 
2.54.0

