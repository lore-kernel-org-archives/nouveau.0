Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF941CD98DE
	for <nouveau@archiver.kernel.org>; Mon, 15 Jun 2026 09:26:18 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 21B6810E317;
	Mon, 15 Jun 2026 09:26:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="Q5II/wnL";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id B207246B28;
	Mon, 15 Jun 2026 09:12:09 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1781514729;
 b=LYRvyk2zwxd5FfQFgiAXTO8xe2bTCNQl7YVtmodHJAOW7dvwuHdEIY/R4iwvnor6YiTm6
 4r5XJWrivotI8Mwu5D/gzBCyPIexG74CWnpNsPg7ExJKKrv7JoLHeVThrqsvOJN2L6aqC1l
 iKCFFTMgjiCwwIO/I8dQCv3OZxyXy63Pe3yVp6HnzmnzlQhgZbiNvosYcLdWfWdP7j7D9qa
 afX9BsGS4wR4jOvHHCjcr5dlbhgQf2hMJhCUQl3LGy6hgq86+q597gzkw6pKYIurFegtPb8
 eLIr5UrSmZGmNcUr0hcYWE90mrrYvowpdDK2NkXYsjRQb3CG4fN9KZMFVdbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1781514729; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=AFbxkkRxzTzUXO/FNSBftteSoe9VZ2wpMdFpozFnn6I=;
 b=NMffBRC0bq0SrhsOFphl+rtYQ4YQuB3gkK8CXWYDmqfZ3Zc4ArV5Dk+lenQ3Me3RMw3ps
 ANFDZlXPwZrorJu35RCCtqk2bqB2Le4m4VumCqbATa0ooG9Lgubqz7swXCMBG4LXdAGkaPN
 Te8HyTFM9/5lxtexIyswn9KZq5FDZHK/NXrcRCbO2qq5ppv8/IpqG2IV29wjAO7lu4vYVDB
 dC0CpZsVPU+h0zfU/BNRF2VpVfR36zhLzup/JEh0SfuuA4/aAL9oDRerN3dhqLL83bcDuzZ
 Bne8wMJ1ltnYtiAYMHD3uD2GRmPhi1yL8B4ILUQp0YXRTNHURX8ZBeqj7ahQ==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=igalia.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=igalia.com
 policy.dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=igalia.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=igalia.com policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 6E65C414F9
	for <nouveau@lists.freedesktop.org>; Mon, 15 Jun 2026 09:12:06 +0000 (UTC)
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5FBAD10E306;
	Mon, 15 Jun 2026 09:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=AFbxkkRxzTzUXO/FNSBftteSoe9VZ2wpMdFpozFnn6I=; b=Q5II/wnLB1zwvkjimGARjRvI9u
	AaFY5SzxWtMGgvnfZKhoogEnIC9rP5QLjZqjwP5IXzY2kE/KKMOG+vF8xOZOBG1UJxBaOW8HRrxdA
	XGZvUut5o5a21LeYsiR188Cgx0lTXeqohTexARCfNuNou2/N8Z5w+JcK2JAWol9db/HCJaNnTnq7y
	9b9hzmPm+FBqTsm272dCso2jkMrmH/j9UDSQzEB7gQ40g17fWOV0Yu+UpnJGBUpzZJf29Bdjj73GF
	/yd13X2ud88+EnFyrokU5Fa5Tje5vR0dZLxLhqISgUznBDx3i39nZoVImUV2sTZKihpZHq70oD1kk
	gw/tvOog==;
Received: from [90.240.106.137] (helo=localhost)
	by fanzine2.igalia.com with esmtpsa
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wZ3a6-000A7X-Ii; Mon, 15 Jun 2026 11:26:10 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3] drm/nouveau: Simplify nouveau_cli_work
Date: Mon, 15 Jun 2026 10:26:07 +0100
Message-ID: <20260615092607.80917-1-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260612165409.54447-1-tvrtko.ursulin@igalia.com>
References: <20260612165409.54447-1-tvrtko.ursulin@igalia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: UUSMHZ7FJBI6ARLK3LXS6ZQ4KGXILTGN
X-Message-ID-Hash: UUSMHZ7FJBI6ARLK3LXS6ZQ4KGXILTGN
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/UUSMHZ7FJBI6ARLK3LXS6ZQ4KGXILTGN/>
Archived-At: 
 <https://lore.freedesktop.org/20260615092607.80917-1-tvrtko.ursulin@igalia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Lets simplify and make clearer the fence lock cycling workaround in
nouveau_cli_work().

The reason for the workaround is that the worker processes the list of
pending work items (and so fence callbacks) opportunisticaly, while
dma_fence_is_signaled() returns true as soon as a the fence is signaled.
It is therefore not allowed for the opportunistic processing to free the
work item, since the fence callback processing can still be in the process
of dereferencing work->cb.

This wasn't very clear in the code so clarify it with a nice comment.

In the process we replace the somewhat interleaved and not very readable
nouveau_cli_work_ready() helper with a direct dma_fence_is_signaled, which
is even faster since it removes the lock cycling from the unsignaled fence
path.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Philipp Stanner <phasta@kernel.org>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: nouveau@lists.freedesktop.org
---
v2:
 * Don't dereference work after work->func(work) frees it.

v3:
 * Put back and explain lock cycling.
---
 drivers/gpu/drm/nouveau/nouveau_drm.c | 34 +++++++++++++--------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 42a81166f3a9..7ea95ab960a0 100644
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
@@ -176,9 +160,25 @@ nouveau_cli_work(struct work_struct *w)
 	struct nouveau_cli_work *work, *wtmp;
 	mutex_lock(&cli->lock);
 	list_for_each_entry_safe(work, wtmp, &cli->worker, head) {
-		if (!work->fence || nouveau_cli_work_ready(work->fence)) {
+		struct dma_fence *fence = work->fence;
+
+		if (!fence || dma_fence_is_signaled(fence)) {
+			if (fence) {
+				unsigned long flags;
+
+				/*
+				 * Because fence can still be in the process of
+				 * processing the callback list, and the
+				 * callback references the work we are about to
+				 * free, we need to sync with the callback
+				 * processing before freeing the work.
+				 */
+				dma_fence_lock_irqsave(fence, flags);
+				dma_fence_unlock_irqrestore(fence, flags);
+			}
 			list_del(&work->head);
 			work->func(work);
+			dma_fence_put(fence);
 		}
 	}
 	mutex_unlock(&cli->lock);
-- 
2.54.0

