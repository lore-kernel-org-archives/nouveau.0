Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E89DFC43602
	for <nouveau@archiver.kernel.org>; Tue,  7 Jul 2026 13:57:50 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D49D910ED53;
	Tue,  7 Jul 2026 13:57:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="rNMil2yW";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rPINwQjy";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rNMil2yW";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rPINwQjy";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 2E8E646F37;
	Tue,  7 Jul 2026 13:42:52 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1783431772;
 b=YLj3YX70ujCm7ppBk488YtYAIxfUWCKXoA9IUxtfcvyKUk2VLciSt9weM94b85Wv0vVt2
 pZRJw+uCxSTOq4Qc+uTZ04apFcTA2uz0F2orD8om+L7uU2BHZKo/kdgFDsO+rfq4MmOKSuP
 aw3LAEUW0A2y7fQ1uAt8k0uhOUwH0eaqGjyBjFkpt3aDA0I+7apU5XrQ3dW9jL7fAdLFhl0
 fMRTtBmOTRTvWsPYhqIjjWmSFemGBT8VZN5bZ7upOpAz3hD4/Y80HaCDmr1aZeUAehhGO8k
 MFEHyneYOyOi29zFVqZx4v6NmqOn5bXBcp+WOjjSSl/ZI69ve15m6RXUyiHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1783431772; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=qFUchqMhh+t88EmA37o1LKVkZo6s4o6ys1Cb0qM5+6w=;
 b=n6aVNggA7KDKW3JdYUyRYKabVl9PJ8pI3WEoxUylDbJUM502H2TCsrT8ffxBao4/mxzSr
 jHdpW5rH6bFUdvNYjLdRaP6WVsycfOSl3/G8KFV6NUAXSIB75vwB6c9Kkh752If/rLW+8vB
 utjWvr2L5VL3Mn0zTpYzN0xPfcG3TW74g8+25zPWqoRJM8jyskiOMEPPZb9ssfsN4pZ2A7i
 XmNz91+V7cPgDAXg4IKm7oeY8oPWkAQc0vMZl17aLxiz5UiURvxA1mI81p9uQtYFeZ/Fn/m
 XWGa4axQ8+uQDn3EubsJJn089r0UGw62N4zwz0UpdHyA/xPD8BUPpTW314rQ==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=suse.de;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=suse.de policy.dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=suse.de;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=suse.de policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id C565246F2B
	for <nouveau@lists.freedesktop.org>; Tue,  7 Jul 2026 13:42:47 +0000 (UTC)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	by gabe.freedesktop.org (Postfix) with ESMTPS id DFEC710ED73
	for <nouveau@lists.freedesktop.org>; Tue,  7 Jul 2026 13:57:44 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A9692759E6;
	Tue,  7 Jul 2026 13:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1783432653;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qFUchqMhh+t88EmA37o1LKVkZo6s4o6ys1Cb0qM5+6w=;
	b=rNMil2yWhkhaOEzJSsGr929ThkYpkbds2CNXZLwyBehgqYMsr65/9OdLn9tERy76JYGWjq
	QnF+KAC39DFVdOZ1hUBTwrlggsoodT+mdvDbVDna7EU+grUWkc3Iaw4vbVT+pEPz+eBNCO
	p97WoHfwMtz5K5xk6JdRXSVN94MREmc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783432653;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qFUchqMhh+t88EmA37o1LKVkZo6s4o6ys1Cb0qM5+6w=;
	b=rPINwQjy0njGzzXFrtjih2udJr2gbC2XL9H3KDlMifpyy94/8D3CbykW0PCVnB8tqo6Fud
	SXcsjJjL4p3/DhDA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1783432653;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qFUchqMhh+t88EmA37o1LKVkZo6s4o6ys1Cb0qM5+6w=;
	b=rNMil2yWhkhaOEzJSsGr929ThkYpkbds2CNXZLwyBehgqYMsr65/9OdLn9tERy76JYGWjq
	QnF+KAC39DFVdOZ1hUBTwrlggsoodT+mdvDbVDna7EU+grUWkc3Iaw4vbVT+pEPz+eBNCO
	p97WoHfwMtz5K5xk6JdRXSVN94MREmc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783432653;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qFUchqMhh+t88EmA37o1LKVkZo6s4o6ys1Cb0qM5+6w=;
	b=rPINwQjy0njGzzXFrtjih2udJr2gbC2XL9H3KDlMifpyy94/8D3CbykW0PCVnB8tqo6Fud
	SXcsjJjL4p3/DhDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 295C1779AF;
	Tue,  7 Jul 2026 13:57:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id mLX0CM0FTWoFSgAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 07 Jul 2026 13:57:33 +0000
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
Subject: [PATCH 07/10] drm/nouveau: Implement
 vga_switcheroo_client_ops.pre_switch
Date: Tue,  7 Jul 2026 15:38:14 +0200
Message-ID: <20260707135724.247562-8-tzimmermann@suse.de>
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
	NEURAL_HAM_SHORT(-0.18)[-0.911];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_TWELVE(0.00)[22];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[wunner.de,redhat.com,amd.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,intel.com,ursulin.net,gmx.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLq3cifbxyhc6qbbynzfc6amns)];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]
Message-ID-Hash: Q7EYSWO7VDZPI7PKQRYCTLHTPMNRI5EM
X-Message-ID-Hash: Q7EYSWO7VDZPI7PKQRYCTLHTPMNRI5EM
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/Q7EYSWO7VDZPI7PKQRYCTLHTPMNRI5EM/>
Archived-At: 
 <https://lore.freedesktop.org/20260707135724.247562-8-tzimmermann@suse.de/>
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
 drivers/gpu/drm/nouveau/nouveau_vga.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_vga.c b/drivers/gpu/drm/nouveau/nouveau_vga.c
index a6c375a24154..2d2d08be8fbe 100644
--- a/drivers/gpu/drm/nouveau/nouveau_vga.c
+++ b/drivers/gpu/drm/nouveau/nouveau_vga.c
@@ -76,11 +76,20 @@ nouveau_switcheroo_can_switch(struct pci_dev *pdev)
 	return atomic_read(&drm->dev->open_count) == 0;
 }
 
+static void
+nouveau_switcheroo_pre_switch(struct pci_dev *pdev)
+{
+	struct nouveau_drm *drm = pci_get_drvdata(pdev);
+
+	drm_client_dev_acquire_outputs(drm->dev);
+}
+
 static const struct vga_switcheroo_client_ops
 nouveau_switcheroo_ops = {
 	.set_gpu_state = nouveau_switcheroo_set_state,
 	.reprobe = nouveau_switcheroo_reprobe,
 	.can_switch = nouveau_switcheroo_can_switch,
+	.pre_switch = nouveau_switcheroo_pre_switch,
 };
 
 void
-- 
2.54.0

