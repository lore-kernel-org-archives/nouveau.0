Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28B2ECD6E49
	for <nouveau@archiver.kernel.org>; Fri, 29 May 2026 16:31:44 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A8737112236;
	Fri, 29 May 2026 16:31:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="d+mF7kLD";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 4DF75466BE;
	Fri, 29 May 2026 16:18:11 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1780071491;
 b=eaV28ULv82LqNgdzyYt1tAq9CXCM0ziSrzk9555HhsweOf/iRt2q095PCCeKuIdjVAdTt
 3/W8AR9VSBaQ9DOanbQwrBoKDmOodh5jLHSAWniNDjLCJ5RwZy52yRQp2fPdmdJC71ARDi4
 plfqlx/s8kipxDoO/LMNEXdVFWSQvsYtCeJY304IWZzKN89HTR9PgcGwCh09wSEwK0Yw0V4
 OxiXlckto3DRxwB5uA8tQkBtC0fl0WOamwmtBMxI0d9SUNHMAL2JFCc5ZAlFcIT/Rc8BTTE
 2IpejTO3wMFIrfJhiYjMXtHF5zX58lV9RP9Z8PL3Czzvy11jkyiEWhNDgQhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1780071491; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=5pgYK/c6yag7oUDNjB7BB4xzOjsTGZrrPSqPB/w4kuc=;
 b=qSu41C9fwCROHKLeLIRao8K07H73LItkui+pfSUrMSdZy16tVhSAjD9jZQxTJBfPaKwYz
 6e+JMCxn0ujB+NeVVz3bfhKe82g7wtjWLwGzNLmeKS97M0eHOpjwgeXAdOROnNxiKqTTGHJ
 q+x3u51SRXkzlQL04t5hpwCWUIZlnPslh7yBI6Fqq2hvhbRkf9ZMa00U4zuOv8yR/91rOU3
 c25phZBd1EtkQm5tqPMThPiS7zjYtSjVG8dzU3OvakJFRxIa3Pu1YYPlKog+ZOSRuKjNkzK
 I2hL1507Du7COGrKF479B7mdHRJC1sKO4g8kiwenxhRodFOhlY287iSPFkMg==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=fail header.d=163.com;
  arc=none (Message is not ARC signed);
  dmarc=fail (Used From Domain Record) header.from=163.com policy.dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=fail header.d=163.com;
 arc=none (Message is not ARC signed);
 dmarc=fail (Used From Domain Record) header.from=163.com policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 28DC840087
	for <nouveau@lists.freedesktop.org>; Thu, 28 May 2026 13:18:23 +0000 (UTC)
X-Greylist: delayed 372 seconds by postgrey-1.36 at gabe;
 Thu, 28 May 2026 13:31:50 UTC
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A9D6E10F194;
	Thu, 28 May 2026 13:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=5p
	gYK/c6yag7oUDNjB7BB4xzOjsTGZrrPSqPB/w4kuc=; b=d+mF7kLDMSPHVOx4ac
	9At9SR0dImadwnBqzVBea+cwFkKbGVatTvcfEPvqQ/2UJiDWd637lsozUEiDDMS/
	A8p+h2VJZFI2nfU3OIhu4lDe/dCCL8ejedvK3fs4/JfRElk404KZ7RYTSHpN93LA
	SMB6NAjUMB4pABhtV2yDBe2ug=
Received: from China-163-team (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id
 _____wD373KaQBhq1y1jAA--.16331S3;
	Thu, 28 May 2026 21:18:25 +0800 (CST)
From: Wenshan Lan <jetlan9@163.com>
To: gregkh@linuxfoundation.org,
	sashal@kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 6.6.y 2/2] drm, fbcon,
 vga_switcheroo: Avoid race condition in fbcon setup
Date: Thu, 28 May 2026 21:18:17 +0800
Message-ID: <20260528131817.59900-2-jetlan9@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260528131817.59900-1-jetlan9@163.com>
References: <20260528131817.59900-1-jetlan9@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD373KaQBhq1y1jAA--.16331S3
X-Coremail-Antispam: 1Uf129KBjvJXoW3Ary7AF13Cry7ZrWxXw4fXwb_yoW7Xw1kpF
	sIkFW5KrZ5JF4ruw1Dua12ya43Aan7Cry8XrWxG3WYvw12yryF9Fs5Ary5u345Grs7Jr1j
	q34Syw18uryDCaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pt2NR_UUUUU=
X-Originating-IP: [47.95.114.252]
X-CM-SenderInfo: xmhwztjqz6il2tof0z/xtbC6wLYoWoYQKLvZgAA3J
X-MailFrom: jetlan9@163.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: AAJOU7BYQ4WJJLYJ3QD5IINTSHZLFDFP
X-Message-ID-Hash: AAJOU7BYQ4WJJLYJ3QD5IINTSHZLFDFP
X-Mailman-Approved-At: Fri, 29 May 2026 16:18:09 +0000
CC: linux-kernel@vger.kernel.org,
 Javier Martinez Canillas <javierm@redhat.com>,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, Wenshan Lan <jetlan9@163.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/AAJOU7BYQ4WJJLYJ3QD5IINTSHZLFDFP/>
Archived-At: 
 <https://lore.freedesktop.org/20260528131817.59900-2-jetlan9@163.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

From: Thomas Zimmermann <tzimmermann@suse.de>

[ Upstream commit eb76d0f5553575599561010f24c277cc5b31d003 ]

Protect vga_switcheroo_client_fb_set() with console lock. Avoids OOB
access in fbcon_remap_all(). Without holding the console lock the call
races with switching outputs.

VGA switcheroo calls fbcon_remap_all() when switching clients. The fbcon
function uses struct fb_info.node, which is set by register_framebuffer().
As the fb-helper code currently sets up VGA switcheroo before registering
the framebuffer, the value of node is -1 and therefore not a legal value.
For example, fbcon uses the value within set_con2fb_map() [1] as an index
into an array.

Moving vga_switcheroo_client_fb_set() after register_framebuffer() can
result in VGA switching that does not switch fbcon correctly.

Therefore move vga_switcheroo_client_fb_set() under fbcon_fb_registered(),
which already holds the console lock. Fbdev calls fbcon_fb_registered()
from within register_framebuffer(). Serializes the helper with VGA
switcheroo's call to fbcon_remap_all().

Although vga_switcheroo_client_fb_set() takes an instance of struct fb_info
as parameter, it really only needs the contained fbcon state. Moving the
call to fbcon initialization is therefore cleaner than before. Only amdgpu,
i915, nouveau and radeon support vga_switcheroo. For all other drivers,
this change does nothing.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Link: https://elixir.bootlin.com/linux/v6.17/source/drivers/video/fbdev/core/fbcon.c#L2942 # [1]
Fixes: 6a9ee8af344e ("vga_switcheroo: initial implementation (v15)")
Acked-by: Javier Martinez Canillas <javierm@redhat.com>
Acked-by: Alex Deucher <alexander.deucher@amd.com>
Cc: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org
Cc: linux-fbdev@vger.kernel.org
Cc: <stable@vger.kernel.org> # v2.6.34+
Link: https://patch.msgid.link/20251105161549.98836-1-tzimmermann@suse.de
[ Minor context conflict resolved. ]
Signed-off-by: Wenshan Lan <jetlan9@163.com>
---
 drivers/gpu/drm/drm_fb_helper.c  | 14 --------------
 drivers/video/fbdev/core/fbcon.c |  9 +++++++++
 2 files changed, 9 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index eee7b56d441f..9691c93f19a0 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -30,9 +30,7 @@
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include <linux/console.h>
-#include <linux/pci.h>
 #include <linux/sysrq.h>
-#include <linux/vga_switcheroo.h>
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_drv.h>
@@ -575,11 +573,6 @@ EXPORT_SYMBOL(drm_fb_helper_release_info);
  */
 void drm_fb_helper_unregister_info(struct drm_fb_helper *fb_helper)
 {
-	struct fb_info *info = fb_helper->info;
-	struct device *dev = info->device;
-
-	if (dev_is_pci(dev))
-		vga_switcheroo_client_fb_set(to_pci_dev(dev), NULL);
 	unregister_framebuffer(fb_helper->info);
 }
 EXPORT_SYMBOL(drm_fb_helper_unregister_info);
@@ -1673,7 +1666,6 @@ static int drm_fb_helper_single_fb_probe(struct drm_fb_helper *fb_helper)
 {
 	struct drm_client_dev *client = &fb_helper->client;
 	struct drm_fb_helper_surface_size sizes;
-	struct fb_info *info;
 	int ret;
 
 	ret = drm_fb_helper_find_sizes(fb_helper, &sizes);
@@ -1691,12 +1683,6 @@ static int drm_fb_helper_single_fb_probe(struct drm_fb_helper *fb_helper)
 
 	strcpy(fb_helper->fb->comm, "[fbcon]");
 
-	info = fb_helper->info;
-
-	/* Set the fb info for vgaswitcheroo clients. Does nothing otherwise. */
-	if (dev_is_pci(info->device))
-		vga_switcheroo_client_fb_set(to_pci_dev(info->device), info);
-
 	return 0;
 }
 
diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index 703c4e851612..d1ac4e45eea6 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -64,6 +64,7 @@
 #include <linux/console.h>
 #include <linux/string.h>
 #include <linux/kd.h>
+#include <linux/pci.h>
 #include <linux/slab.h>
 #include <linux/fb.h>
 #include <linux/fbcon.h>
@@ -75,6 +76,7 @@
 #include <linux/interrupt.h>
 #include <linux/crc32.h> /* For counting font checksums */
 #include <linux/uaccess.h>
+#include <linux/vga_switcheroo.h>
 #include <asm/irq.h>
 
 #include "fbcon.h"
@@ -2914,6 +2916,9 @@ void fbcon_fb_unregistered(struct fb_info *info)
 
 	console_lock();
 
+	if (info->device && dev_is_pci(info->device))
+		vga_switcheroo_client_fb_set(to_pci_dev(info->device), NULL);
+
 	fbcon_registered_fb[info->node] = NULL;
 	fbcon_num_registered_fb--;
 
@@ -3047,6 +3052,10 @@ static int do_fb_registered(struct fb_info *info)
 		}
 	}
 
+	/* Set the fb info for vga_switcheroo clients. Does nothing otherwise. */
+	if (info->device && dev_is_pci(info->device))
+		vga_switcheroo_client_fb_set(to_pci_dev(info->device), info);
+
 	return ret;
 }
 
-- 
2.43.0

