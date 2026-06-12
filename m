Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A79C6CD98D6
	for <nouveau@archiver.kernel.org>; Fri, 12 Jun 2026 16:54:22 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4AB7510EAED;
	Fri, 12 Jun 2026 16:54:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="FSroCaAL";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id CEAE046AA0;
	Fri, 12 Jun 2026 16:40:19 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1781282419;
 b=dk6o4hMm508XKO48Eo2IIUK5fDCArGqSzCH9n6RYOX0M8RurAKDmznJL/5KJ95IQVp4oX
 KpIinIgwIMsm4zbwtJVs+d0Ne2TnXQ2RP1TBJvqjOuGv4AcZv+JCvIEPfaqRQdkUqk7joKp
 axVGoYLWQcGSw23L4xPG+53LRBOcnc8DcjKxw0aVLoIOS+Amr6fHCGdZDo0maEZgGZ1Ljdv
 RrnxZn36y7EApImZyosEwP52tEw6kpEDPrBFSh7/D27dUH1KPz84g+ITprX/lLMydeBwx1z
 PrCcXAWC8h2vXUniNazq/WH/Qu13evftdfWhIpvL3cKlMc1XLQlN8GGulVcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1781282419; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=Tebs/xgqnTOnOgdsbaKqWAXW45iBX4qAzlBi8lJe+NA=;
 b=fkE6shVn+DUJT5vhcYZc3CikEHVIbJE7d95HLBlitBbpKy3xvDk6JcgFWx3PRIqpW0OKI
 VepMa2UjCs3mcbpmzcRbB4AGAY+ALERlC44kL7q0HMevquIG+rjWEvof2UMwcOGeA5fmXY/
 AVNhXjzN4CfVk7cVUnSIpP+GgwyYRqlkpZfwNi9ed1U5rzxiMonnGUceuVgs1XoNyskCNOs
 8lFYevuMHAGlNzMHaVuQXls8KWn22CPxkFyv/RkgzsJO7oGI/stbidmH8LagYLcmjNiKoLt
 HE3GjO5ySEfaPeheiNKCuTmFEtcUzubnZGGwNRL3L2SWiwjrrbvwA5a1c0uA==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=igalia.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=igalia.com
 policy.dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=igalia.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=igalia.com policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 1552A46A7C
	for <nouveau@lists.freedesktop.org>; Fri, 12 Jun 2026 16:40:16 +0000 (UTC)
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6C2C110EAD1;
	Fri, 12 Jun 2026 16:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=Tebs/xgqnTOnOgdsbaKqWAXW45iBX4qAzlBi8lJe+NA=; b=FSroCaALJBuMVi6mRFKsOtBDWf
	Ef23eWXWA75WpHFrNgHBMwQ930rQba5Hj/M1rY1RyeJwl/3CWT7Y9THKt4gD59tBjIpMXZX+4Gkrv
	8aUgM5yNI4lPQtEOp2gmUmvNOGRFT3jbOGU46jYmO4yvRdMaKqrpaK2hiqG4mzUHS/CW94zICygCY
	XXugD2P2sXpcj246HilbjTf43wtN3wlRM44tcSr4YHkGf2Nr4/YY8sahbP3Cup+2UGDecHRBrbCZQ
	CNwKLtlMZ43DP9oYYGD6ftOnTldvzThPuGa7n7tjzbodiEP7kjjRS3QDO4oO+3s8amgsBCUrPza1o
	3WbkFB/Q==;
Received: from [90.240.106.137] (helo=localhost)
	by fanzine2.igalia.com with esmtpsa
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wY593-00GhBq-FW; Fri, 12 Jun 2026 18:54:13 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/nouveau: Simplify nouveau_cli_work
Date: Fri, 12 Jun 2026 17:54:09 +0100
Message-ID: <20260612165409.54447-1-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: NQ6E3KMCFMKTEJ5CIOB4PIHS3IUFVVZ4
X-Message-ID-Hash: NQ6E3KMCFMKTEJ5CIOB4PIHS3IUFVVZ4
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/NQ6E3KMCFMKTEJ5CIOB4PIHS3IUFVVZ4/>
Archived-At: 
 <https://lore.freedesktop.org/20260612165409.54447-1-tvrtko.ursulin@igalia.com/>
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
 drivers/gpu/drm/nouveau/nouveau_drm.c | 19 ++-----------------
 1 file changed, 2 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 42a81166f3a9..7de174537fc7 100644
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
@@ -176,9 +160,10 @@ nouveau_cli_work(struct work_struct *w)
 	struct nouveau_cli_work *work, *wtmp;
 	mutex_lock(&cli->lock);
 	list_for_each_entry_safe(work, wtmp, &cli->worker, head) {
-		if (!work->fence || nouveau_cli_work_ready(work->fence)) {
+		if (!work->fence || dma_fence_is_signaled(work->fence)) {
 			list_del(&work->head);
 			work->func(work);
+			dma_fence_put(work->fence);
 		}
 	}
 	mutex_unlock(&cli->lock);
-- 
2.54.0

