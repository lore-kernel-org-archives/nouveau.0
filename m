Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED7F1606AAD6
	for <nouveau@archiver.kernel.org>; Mon, 19 Oct 2026 15:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=MsrOG3oY;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=dRTjBlue
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D0ADF10EE8F;
	Mon, 19 Oct 2026 15:46:39 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 7783B48B2C;
	Mon, 19 Oct 2026 15:27:51 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1792423671;
 b=oEFyVfcqm8oOu5zTSaLFVn+ugCSckZnvo4XW954S1SvOT+nP/3/0zHYT+G6I7HV0U4lGB
 +nr6Aobv90Vsq/jxO9ns5L4hdPKDpVIQCswbj4jFacxAP8DgzExQ+HXeMpsg9VqqYUyv8lE
 8iuczZeRBCIQgf1tfHOTlnDmqeMzSeTDDD3cpeXD/8a6+vY/Fj0yal6vO0uKHKMO1iFV5JN
 rqOvW0k2nj2vUsNd1Ew4SKXTS7GQB57JNVxmPVH5ClHbj3SNYq1wDFSjH+EZqUqPfINztVq
 wPo33BzCn/d1LAYMCAaQZt77raMRVapJ1+Aqoh4NF9NYry3RqOeqkFUQh8OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1792423671; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=Q42+1LT+/kIysWR1pP52zLF3q3QDlSMlW5TUG8Jhqvg=;
 b=0M7wWX3gOx1P4GlQ21LhEDHHznAWquLfANRWLki3Rpro4tJKeYiNoMiNlaTn5Um4NOfIl
 rfvhlctSx7N3Hr/GUyFgib0da6zapgdeEMZDVIRE4zRmwHghqh7ihqP7gaBfNSUpKKBaaEI
 DY5g3invbWzqPP8VTZD7+WH3C3tgmwRSgniLXjAg+fala0hbPHlAwIB4TSsf+eb2KVfOnyr
 c8XBq74W7r36NlM5aCbRAYp5wrdQvVMOgHzJaORxSugGrCmFDcZyrXTWktbuq/P3qIwim2u
 SyWDKFI1w930Gg7vSXQ3C4X2U4JMB/Nr9vnaage0gQAmNY3/iLmXuUPYpi/Q==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=suse.de;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=suse.de policy.dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=suse.de;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=suse.de policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 51E1648B13
	for <nouveau@lists.freedesktop.org>; Mon, 19 Oct 2026 15:27:48 +0000 (UTC)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4104E10EE81;
	Mon, 19 Oct 2026 15:46:31 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2EC4621CA9;
	Mon, 19 Oct 2026 15:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1792424778;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q42+1LT+/kIysWR1pP52zLF3q3QDlSMlW5TUG8Jhqvg=;
	b=MsrOG3oYS78SNJ7/ae2AH0ESftfF09tqFOLo3hMOAUt3slapAB7RrKO6+HesSxlqe6m/ue
	QEqoOB94tRzhOxv0a2MF0h3uFdFZhqo/bEk8CDVG0YF67dcqPz2qqkDbMdCoK9GGd82iS4
	Hb00NNR9DlS/BmHreEXJsRVzOrUheGs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792424778;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q42+1LT+/kIysWR1pP52zLF3q3QDlSMlW5TUG8Jhqvg=;
	b=dRTjBlueuN5bJ8GI4kyce071TiXAh7MkIvbio8l6r7/gH0P6dezWLAj20I7JwoEJfK3dni
	+4kEw2LgrA9qYSCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AA98A1376E;
	Mon, 19 Oct 2026 15:46:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id gYPgBkk71mrrPAAAD6G6ig:T2
	(envelope-from <tzimmermann@suse.de>); Mon, 19 Oct 2026 15:46:17 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	airlied@gmail.com,
	simona@ffwll.ch
Subject: [PATCH 1/4] drm: Add helper module for working with pixel data
Date: Mon, 19 Oct 2026 17:32:42 +0200
Message-ID: <20261019154612.777074-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261019154612.777074-1-tzimmermann@suse.de>
References: <20261019154612.777074-1-tzimmermann@suse.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spam-Score: -4.00
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spam-Level: 
X-Rspamd-Queue-Id: 2EC4621CA9
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
Message-ID-Hash: VOOVP4JZBHDR7DTLQCTFC4IMBFHV33LJ
X-Message-ID-Hash: VOOVP4JZBHDR7DTLQCTFC4IMBFHV33LJ
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/VOOVP4JZBHDR7DTLQCTFC4IMBFHV33LJ/>
Archived-At: 
 <https://lore.freedesktop.org/20261019154612.777074-2-tzimmermann@suse.de/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,RCVD_IN_ZEN_BLOCKED_OPENDNS,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add drm_pixel_helper.ko. This module will contain helpers that copy
and process pixel data, such as framebuffers. Drivers that want to
use the helpers should select DRM_PIXEL_HELPER.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/Kconfig                   | 6 ++++++
 drivers/gpu/drm/Makefile                  | 4 ++++
 drivers/gpu/drm/drm_pixel_helper_common.c | 6 ++++++
 3 files changed, 16 insertions(+)
 create mode 100644 drivers/gpu/drm/drm_pixel_helper_common.c

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 61111d50b1c6..dce5e25671ee 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -49,6 +49,12 @@ config DRM_KMS_HELPER
 	help
 	  CRTC helpers for KMS drivers.
 
+config DRM_PIXEL_HELPER
+	tristate
+	depends on DRM
+	help
+	  Helpers for working with pixel data in DRM.
+
 config DRM_DRAW
 	bool
 	depends on DRM
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 2c6bc093a923..5f555a2c1a4c 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -99,6 +99,10 @@ obj-$(CONFIG_DRM_PANEL) += drm_panel.o
 obj-$(CONFIG_DRM_PANEL_ORIENTATION_QUIRKS) += drm_panel_orientation_quirks.o
 obj-$(CONFIG_DRM_PANEL_BACKLIGHT_QUIRKS) += drm_panel_backlight_quirks.o
 
+drm_pixel_helper-y := \
+	drm_pixel_helper_common.o
+obj-$(CONFIG_DRM_PIXEL_HELPER) += drm_pixel_helper.o
+
 #
 # Memory-management helpers
 #
diff --git a/drivers/gpu/drm/drm_pixel_helper_common.c b/drivers/gpu/drm/drm_pixel_helper_common.c
new file mode 100644
index 000000000000..743846e1e003
--- /dev/null
+++ b/drivers/gpu/drm/drm_pixel_helper_common.c
@@ -0,0 +1,6 @@
+// SPDX-License-Identifier: GPL-2.0 or MIT
+
+#include <linux/module.h>
+
+MODULE_DESCRIPTION("DRM pixel-data helpers");
+MODULE_LICENSE("GPL and additional rights");
-- 
2.56.0

