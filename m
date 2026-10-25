Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20B65606A31A
	for <nouveau@archiver.kernel.org>; Mon, 26 Oct 2026 14:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=LLyjpEmk
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E736B10EF26;
	Mon, 26 Oct 2026 14:05:13 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 5F87948BB3;
	Mon, 26 Oct 2026 13:46:10 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1793022370;
 b=q64VpQ/gaJnO9RRKJy+ZvAAosnWHGzKzNKCD+KikxunPdNbUvXvtH+qryOmym6kqGMRUa
 CHcYQ+SIt+VSbmjnEAb045DKD6OkYvMBsu2NuwVZ5KslyWyo1QV8OHvnNHM8dVHDOzCI8Js
 yxYEDGWE+2cVOlg1ww6NRGinhAINZ74RMYWHQhBjGZB2qVZnjJUAuZb3YcVmGw6Ymm4LvKM
 fnGJQQMZ5odLWAS6Ou7FsHXE1Dw9Q14SVw+KxTw2D4Sq8PStocs82bR97HW/iGGa3MGga9N
 dYrwMJ9Kp/VjAAbFfScimKQMKK7JObG57gyjztr3Oraxsa9IDH6ab0Ua/1+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1793022370; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=jj1MjgOd7ph17eSLnFe4gEdUh/YrPp8vDaEc/Ca1zL4=;
 b=fynou4inwByQLhevB+L+HgINr23fIgO/XFhxxK1r7AASW6960TJoJi3c2U+O0OEXx1s3i
 zS9mEf/sV5Et7dV9FRQYoY0y8eO0QDdHijcDKLTiCUk6BkFPnLWQQQmJM+djVT7gEdQmyAk
 4DufuW0AqbVX0OKDnr7jv5rsV1m4r7eELMv48KL2IE4VoYW+kJMuih6VBZkoiwuGgyQUnY+
 r5jvliVx7us5RDPO7bos3VutbQ4ZjPQafOIKXT9sKekKZDsmcVvc2aiSjSv7yRKQpFMm7Zx
 2ySkrIvvOZeKp2eJC+JXzG76bpbQbDM5REHTMuJ+hPgQNMumaPbLI0Bdy7CA==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=nabladev.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=nabladev.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=nabladev.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=nabladev.com
 policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 980F74713D
	for <nouveau@lists.freedesktop.org>; Sun, 25 Oct 2026 21:16:58 +0000 (UTC)
X-Greylist: delayed 316 seconds by postgrey-1.36 at gabe;
 Sun, 25 Oct 2026 21:35:55 UTC
Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 42E0710E27D
	for <nouveau@lists.freedesktop.org>; Sun, 25 Oct 2026 21:35:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 150DF10B4D8;
	Sun, 25 Oct 2026 22:30:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1792963832;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=jj1MjgOd7ph17eSLnFe4gEdUh/YrPp8vDaEc/Ca1zL4=;
	b=LLyjpEmki+TFrSIFf1nvZW/KdeHT7Z9a+irrY2XsElQfX3WG2r0KNb2xz0K2zocLSUTdKp
	rAlCnHRQYdYd/lALV7La4xrDOxXmKndkILZ9LYMgNaYlv0X9qH+WQl27vcox9hd3EYERYL
	1/dR7tqwq/TJrKqeNzgh2emioedvGMpu6erdkIekOHw2dTfrps++mrWRPhVnZL/UlR33gW
	oZzHE3mql/gmN2H+axAs9YYgxGMyprGtHsQjH8vILTbLmP4A7zwWo1OlNrgn/skvJLbmv3
	3jr5T1b8BhoUUnGS0gLyWbzfF0pSUYQ+bcQIQdGmXjkWMneA+koXf41KS9KGZA==
From: Marek Vasut <marex@nabladev.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] Revert "nouveau: pci: quiesce GPU on shutdown"
Date: Sun, 25 Oct 2026 22:30:06 +0100
Message-ID: <20261025213027.842978-1-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-MailFrom: marex@nabladev.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: 6HB53OLUZIMXTJG2Q3ZND6X5CDMKOOBN
X-Message-ID-Hash: 6HB53OLUZIMXTJG2Q3ZND6X5CDMKOOBN
X-Mailman-Approved-At: Mon, 26 Oct 2026 13:46:08 +0000
CC: Marek Vasut <marex@nabladev.com>, Danilo Krummrich <dakr@kernel.org>,
 Li Chen <me@linux.beauty>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Ole Carlsen <ole.carlsen@tutamail.com>,
 Simona Vetter <simona@ffwll.ch>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@debian.org>,
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/6HB53OLUZIMXTJG2Q3ZND6X5CDMKOOBN/>
Archived-At: 
 <https://lore.freedesktop.org/20261025213027.842978-1-marex@nabladev.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This reverts commit 310326bb7df4bba094a3fc60364c641c547fd923.

This breaks shutdown on ThinkPad W510, without the offending commit
the system normally powers off, with the offending commit the system
ends up spinning indefinitely and the CPU fan goes full throttle on
shutdown.

The behavior was already reported in debian bugtracker multiple times
for various other computers too, and git bisect lands as this commit.
https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1141969
https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1146033

I tested the revert with Linux 7.2.12 from debian unstable, not next
or drm trees, mainly because it was easier with debian test-patches
script on that machine.

Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Li Chen <me@linux.beauty>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Ole Carlsen <ole.carlsen@tutamail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Uwe Kleine-König <ukleinek@debian.org>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Cc: nouveau@lists.freedesktop.org
---
NOTE: Maybe the revert is not the ideal solution, but it does fix my
      problem, and I think being able to shut computer down is a good
      functionality to have.
---
 drivers/gpu/drm/nouveau/nouveau_drm.c | 32 ---------------------------
 1 file changed, 32 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 5e1336615cf6d..36c74f9edaa83 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -1090,37 +1090,6 @@ nouveau_pmops_resume(struct device *dev)
 	return ret;
 }
 
-static void
-nouveau_drm_shutdown(struct pci_dev *pdev)
-{
-	struct nouveau_drm *drm = pci_get_drvdata(pdev);
-	int ret;
-
-	if (!drm)
-		return;
-
-	if (drm->dev->switch_power_state == DRM_SWITCH_POWER_OFF ||
-	    drm->dev->switch_power_state == DRM_SWITCH_POWER_DYNAMIC_OFF)
-		return;
-
-	ret = nouveau_do_suspend(drm, false);
-	if (ret)
-		NV_ERROR(drm, "shutdown suspend failed with: %d\n", ret);
-
-	pci_save_state(pdev);
-	pci_disable_device(pdev);
-	pci_set_power_state(pdev, PCI_D3hot);
-	/*
-	 *  This is just to give the pci power transition time to settle
-	 *  before an immediate kexec jump. it’s mirroring the existing
-	 *  nouveau_pmops_suspend() behavior, which already does
-	 *  udelay(200) right after pci_set_power_state(..., pci_d3hot). In
-	 *  ->shutdown() we’re allowed to sleep, so I used usleep_range()
-	 *  instead of a busy-wait udelay().
-	 */
-	usleep_range(200, 400);
-}
-
 static int
 nouveau_pmops_freeze(struct device *dev)
 {
@@ -1480,7 +1449,6 @@ nouveau_drm_pci_driver = {
 	.id_table = nouveau_drm_pci_table,
 	.probe = nouveau_drm_probe,
 	.remove = nouveau_drm_remove,
-	.shutdown = nouveau_drm_shutdown,
 	.driver.pm = &nouveau_pm_ops,
 };
 
-- 
2.53.0

