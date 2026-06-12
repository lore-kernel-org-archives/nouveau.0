Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BDE8CD8CA8
	for <nouveau@archiver.kernel.org>; Fri, 12 Jun 2026 17:22:35 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9DB7810F60D;
	Fri, 12 Jun 2026 17:22:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="AQjTmxde";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 307A546AAD;
	Fri, 12 Jun 2026 17:08:31 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1781284111;
 b=T4EV3J7/A1VPm8IBVq6zXomx4QxmBO4sOiiKDtjFuZs8j0evZy+4L+hphI1kAdwgdZFdi
 datB/2Q2E6VyKHjp+i6UInk9DRmVD1gbKcJiUhttw3XwH80omqRuoPuXE8vEjj103kQh7Dr
 oYPpSQ8R7nR8A1Po7D+NIbV7XwNyhOLtjwKr0oCDDBbdD7in7UvSX2hrvbrg7fGGLNp9AEJ
 WbaEWNNbXCa+Qcfk3FCxwwqXlM+1eb00NK5n2NwTLBN/ioVxEho/ij6ASQh7tioydsuwWa0
 uKY8x1C026KwXfrpaQN8BpnAwh8chBKiaywD4YUS72bW8mc7DmansxM3/nQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1781284111; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=giqX5YIC/sRKfgp5Q5cEU9Sqogo3TyEDFXoM3kzv0sE=;
 b=krIXV9TeIeX/dWI34hpW1+DWs4ulksJxbaxMqK18i5OYrvAC94exvMHX2KKc1oSF/ohis
 swFcZHQN1VnVbiTeLqoGii+f8CO4ChjD3SToRm1EzpAfZ4jlhQApXg+Z7DlB9N6G+Tb1OiN
 hhnZwBAKYiq8O2UIOVgV88P06EPjQeuu/vDuKNtZ9juQA7XvSm+asxxiopsYbyHzkfjtvh5
 xqJIRj1BGPecVghyd2hvsl/nrKhFZoHNGnNFicZZk/m61RPjzxQqWuGanSSJ3jFEsbaL+FQ
 /JS66/8sjnvvXQkBO+4K6a874GCl5mDAmoA1kTohmmx2wlwY3vSMEAlhW6Pg==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=igalia.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=igalia.com
 policy.dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=igalia.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=igalia.com policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id B10A846A7C
	for <nouveau@lists.freedesktop.org>; Fri, 12 Jun 2026 17:08:28 +0000 (UTC)
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0C35510F5E0;
	Fri, 12 Jun 2026 17:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=giqX5YIC/sRKfgp5Q5cEU9Sqogo3TyEDFXoM3kzv0sE=; b=AQjTmxdenSQSLdMSarv9H5hZmG
	uNz5mgzbklXQibvDIEkg587KUAweFZSxqa7OGTG3V8+3Ay3YH8YqJVnGtyLXG+0ItxHFZCfp2msLx
	SB9q3gfqJs8sp5iogsS7pzVtiVkVUucxSyjfrX/fElEEih8ZNn3Y+CJRw3l/6yVl8FyhnxJhERDfL
	8Us1fXXv2OKI7Eq3ZIV02wfOyYsoPM23/jmIKdajKz0ARE/14i6Z63b2MNQXS1hpIIrxH7yYeQjrk
	Ja7jeQi3UOSZu7M9lqH0X+bqANgUONYzV8HX8vd0qZ7UkCPt4TxyIM5g3fTOnGt+Qu3IJSnEZgqkT
	RovFv7lQ==;
Received: from [90.240.106.137] (helo=localhost)
	by fanzine2.igalia.com with esmtpsa
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wY5aP-00Ghm9-B1; Fri, 12 Jun 2026 19:22:29 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm/nouveau: Simplify nouveau_cli_work
Date: Fri, 12 Jun 2026 18:22:27 +0100
Message-ID: <20260612172227.54893-1-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260612165409.54447-1-tvrtko.ursulin@igalia.com>
References: <20260612165409.54447-1-tvrtko.ursulin@igalia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ZQVFKB3VDA3NPB4K5WWLNFXS6OQQURW6
X-Message-ID-Hash: ZQVFKB3VDA3NPB4K5WWLNFXS6OQQURW6
X-MailFrom: tvrtko.ursulin@igalia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Philipp Stanner <phasta@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 nouveau@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/ZQVFKB3VDA3NPB4K5WWLNFXS6OQQURW6/>
Archived-At: 
 <https://lore.freedesktop.org/20260612172227.54893-1-tvrtko.ursulin@igalia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

I don't claim this fixes anything but the code certainly was a bit
roundabout and this at least cleans it up.

The only semantic difference is releasing the fence reference after
the work callback is called. Which kind of make sense anyway.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Philipp Stanner <phasta@kernel.org>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: nouveau@lists.freedesktop.org
---
v2:
 * Don't dereference work after work->func(work) frees it.
---
Not even compile tested!
---
 drivers/gpu/drm/nouveau/nouveau_drm.c | 21 ++++-----------------
 1 file changed, 4 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 42a81166f3a9..e81ec261689a 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -153,22 +153,6 @@ nouveau_name(struct drm_device *dev)
 		return nouveau_platform_name(to_platform_device(dev->dev));
 }
 
-static inline bool
-nouveau_cli_work_ready(struct dma_fence *fence)
-{
-	unsigned long flags;
-	bool ret = true;
-
-	dma_fence_lock_irqsave(fence, flags);
-	if (!dma_fence_is_signaled_locked(fence))
-		ret = false;
-	dma_fence_unlock_irqrestore(fence, flags);
-
-	if (ret == true)
-		dma_fence_put(fence);
-	return ret;
-}
-
 static void
 nouveau_cli_work(struct work_struct *w)
 {
@@ -176,9 +160,12 @@ nouveau_cli_work(struct work_struct *w)
 	struct nouveau_cli_work *work, *wtmp;
 	mutex_lock(&cli->lock);
 	list_for_each_entry_safe(work, wtmp, &cli->worker, head) {
-		if (!work->fence || nouveau_cli_work_ready(work->fence)) {
+		struct dma_fence *fence = work->fence;
+
+		if (!fence || dma_fence_is_signaled(fence)) {
 			list_del(&work->head);
 			work->func(work);
+			dma_fence_put(fence);
 		}
 	}
 	mutex_unlock(&cli->lock);
-- 
2.54.0

