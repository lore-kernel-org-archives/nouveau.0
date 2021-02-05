Return-Path: <SRS0=NGGM=HH=lists.freedesktop.org=nouveau-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 962F7C433E0
	for <nouveau@archiver.kernel.org>; Fri,  5 Feb 2021 16:55:15 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1700764F06
	for <nouveau@archiver.kernel.org>; Fri,  5 Feb 2021 16:55:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1700764F06
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=emersion.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=nouveau-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9662D6F49D;
	Fri,  5 Feb 2021 16:55:14 +0000 (UTC)
Received: from mslow2.mail.gandi.net (mslow2.mail.gandi.net [217.70.178.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 806336F49D
 for <nouveau@lists.freedesktop.org>; Fri,  5 Feb 2021 16:55:13 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (unknown [217.70.183.196])
 by mslow2.mail.gandi.net (Postfix) with ESMTP id A09983A1FA8
 for <nouveau@lists.freedesktop.org>; Fri,  5 Feb 2021 16:45:47 +0000 (UTC)
X-Originating-IP: 86.247.11.12
Received: from haruko.lan (lfbn-idf2-1-654-12.w86-247.abo.wanadoo.fr
 [86.247.11.12]) (Authenticated sender: schroder@emersion.fr)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 6F826E0005;
 Fri,  5 Feb 2021 16:45:24 +0000 (UTC)
From: Simon Ser <contact@emersion.fr>
To: nouveau@lists.freedesktop.org
Date: Fri,  5 Feb 2021 17:45:15 +0100
Message-Id: <20210205164515.4622-1-contact@emersion.fr>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Subject: [Nouveau] [PATCH] nouveau/dispnv50: add cursor size/pitch checks
X-BeenThere: nouveau@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=subscribe>
Cc: Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

The hardware needs a FB which is packed and not too large. Add
checks to make sure this is the case.

While at it, add a debug log for the existing check. This allows
user-space to more easily figure out why a configuration is
rejected.

This commit depends on "drm/nouveau/kms/nv50-: Report max cursor
size to userspace", otherwise mode_config.cursor_{width,height}
is zero.

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: Ilia Mirkin <imirkin@alum.mit.edu>
---
 drivers/gpu/drm/nouveau/dispnv50/curs507a.c | 22 ++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/curs507a.c b/drivers/gpu/drm/nouveau/dispnv50/curs507a.c
index 54fbd6fe751d..9a401751c56d 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/curs507a.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/curs507a.c
@@ -99,6 +99,7 @@ curs507a_acquire(struct nv50_wndw *wndw, struct nv50_wndw_atom *asyw,
 		 struct nv50_head_atom *asyh)
 {
 	struct nv50_head *head = nv50_head(asyw->state.crtc);
+	struct drm_device *dev = head->base.base.dev;
 	int ret;
 
 	ret = drm_atomic_helper_check_plane_state(&asyw->state, &asyh->state,
@@ -109,8 +110,27 @@ curs507a_acquire(struct nv50_wndw *wndw, struct nv50_wndw_atom *asyw,
 	if (ret || !asyh->curs.visible)
 		return ret;
 
-	if (asyw->image.w != asyw->image.h)
+	if (asyw->image.w != asyw->image.h) {
+		drm_dbg_atomic(dev,
+			       "Invalid cursor image size: width (%d) must match height (%d)",
+			       asyw->image.w, asyw->image.h);
 		return -EINVAL;
+	}
+	if (asyw->image.w > dev->mode_config.cursor_width ||
+	    asyw->image.h > dev->mode_config.cursor_height) {
+		drm_dbg_atomic(dev,
+			       "Invalid cursor image size: too large (%dx%d > %dx%d)",
+			       asyw->image.w, asyw->image.h,
+			       dev->mode_config.cursor_width,
+			       dev->mode_config.cursor_height);
+		return -EINVAL;
+	}
+	if (asyw->image.pitch[0] != asyw->image.w * 4) {
+		drm_dbg_atomic(dev,
+			       "Invalid cursor image pitch: image must be packed (pitch = %d, width = %d)",
+			       asyw->image.pitch[0], asyw->image.w);
+		return -EINVAL;
+	}
 
 	ret = head->func->curs_layout(head, asyw, asyh);
 	if (ret)
-- 
2.30.0

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
