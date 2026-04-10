Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B0DEF45A0B
	for <nouveau@archiver.kernel.org>; Fri, 10 Apr 2026 17:37:19 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8ED7B10E9D4;
	Fri, 10 Apr 2026 17:37:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="br1rhlge";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id DECE0457D9;
	Fri, 10 Apr 2026 17:25:34 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775841934;
 b=WqD+k2wdecz+2ZHSgliiqyTdVmgQwjEUf6E39QN1MgLkrfDcKFhgPhRtSo809CiDfikCe
 tmPQuZzTHZF5koRxKQXqvidKetw7lIfR7JqBjPLCyfLymMY4eVJvFX1ANsUcdeuraN55D3T
 ERH0uvFV3bXdMmr3KXiwq4yRHmdwvs7bi3613zbJ0bu0Aq4dVHcsRiKZ1gxQjInV2FDYhzN
 p56b8FZ9dd4vSdkEMgcBnf+vjRxZSvHDWxCkvxtdAOHyeN8d6ZC8soUp3oox+76oOZ6yVnB
 mmeyikKDfyJxi1o1JGiIf6WS5z2puedidUk2t8lflVLoaDjOKqq7Vdt5xRrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775841934; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=cjo43meNd5ZF9rDDbLS97J26FxqDt/TB0OImD2ifO6U=;
 b=m6Xt5JrPl0i+SrxYt5MY0MpECY3wso9C0+HQogQNIWZobUy4BIJtjP9b+9lzLIm87sSO8
 QdrqrPBjvKRsc+R0LL3C1234MHQj9ZIb+2t3nLESYNAzF4QkIpf0I/knS5pyqb4JKhdm3Ex
 z95/UUO9FtqqplFusn77ZPwMSXi2xCXVjs9u+KDk0KLkUAtVHMr2ylvJlPWrYeA5sz0vc/H
 IWMn7A7SYwEV8KV8zRx9VVt/LglBwTQqKU6emntcZHnwdGBqc3aa4gs/VBtVyB9l5Idp8rq
 N3cigDo6f1QqUXZ4czLmiRKHda3PzCkR1IDI+1BD2RJmtua46EmYgIgZjYhQ==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 5A7AF41B05
	for <nouveau@lists.freedesktop.org>; Fri, 10 Apr 2026 06:04:15 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
	by gabe.freedesktop.org (Postfix) with ESMTPS id CD8BB10E896
	for <nouveau@lists.freedesktop.org>; Fri, 10 Apr 2026 06:15:56 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-483708b697cso2178905e9.3
        for <nouveau@lists.freedesktop.org>;
 Thu, 09 Apr 2026 23:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775801755; x=1776406555;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cjo43meNd5ZF9rDDbLS97J26FxqDt/TB0OImD2ifO6U=;
        b=br1rhlgeETPSImEbYo9W3k6yfrvsztmf1TRMiQaaH6wIZ8KHHZ7+/uiK1tfkiOskBK
         PFG73VadmXtS1nXSagXBM8/a1pqTsJ4TkA/XnqA+0kSoWt+41MJXuVVc2JhMzx5uCiKx
         KtyL6OheQPEvb7igMWjW5mREKisJHK19T+tE6tEYssSQyPGB3JU4iNAGiyON01Roj6qC
         aKAgKAiBKO0S4qduRv4Kkg2omCm5+l3hnwi2kWrcDmwJpOcGk1gCkJ7V0aSMO0whi0rG
         m0V63AmvJzsCb5hSScjDL+CRZiuP1Uw+h/bqF8bo0u4Qz2wVJQDCA4xzKPByBVqW1uq4
         Blkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775801755; x=1776406555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cjo43meNd5ZF9rDDbLS97J26FxqDt/TB0OImD2ifO6U=;
        b=TAQilbnlFVZq20hUDeh+UH185ajkri7yo1ZqkOfQ1nTWQZ9lyUXvYSCZswkEJl4yML
         +v0QZpHzBDXGOwKwFeD7/I/cG7hVKW6FlH0NpDX1RCt2BD2AaBiVyw/1KXxsJ7fI1bIc
         YHN1U5eFRXeOWsccPf9rCiUnR3PyiD+98fFSi3nSokhqVXkN9jGXDU2+QQv+vEb6r0ov
         FyjzR8tpKjKY7j/uz9LTvmqdkcgXM74s9o43R/gnOgPxXzI2d3SCbkkQD5zS4h5N8Oxw
         HKYn2SMgtnx1E2YJM/eQxv7qPB9BrWEU+IKu2Mcikh8nwVJGFhO8nPozjh1wP5H+MI2m
         yP1g==
X-Gm-Message-State: AOJu0YwCq2nDOSpRGO+rAmOs92+mMkbyIwQCtKWvHo07dnw4/OuV6JTb
	OrFcEq0RMEkLn2BX5eu7nscNO/hImy2ziXM+Mz7VkCEA7uU+FWKwbV60rRSpH8D7
X-Gm-Gg: AeBDiesBMojMzXxqpIs+GhoImmiBM6DsbZiPSMoPNnXws8Xc/R5khrt6qYD//5o9X8D
	V36nRZsLPFxqDAU0CRHbrFx1RumStH+dzUZM8AQ0DujE+V9LPa2r5LaUTgnP2nfYTXnYKEl90+r
	5akqlq90cqyZpKNzjddmirAzPcKEG5Pzs9vyiWccBVOV1MlMuiDPv7UcoqMs/ARdGfwwSU9zdF5
	IwmdXqH1iohDqBOGqoYoUPkMjIDqdRgPLUxzy2VvmFkHBHw6Op7xDYf8MaCbqcuAotr2+HR/4DU
	j/JTORNkDjAkaEraogUZb4bbXe8IY02vDBk25K4tx5zIKKkgspqgEkdg4NKN0hUeapqDn25iDaF
	GYxj/gx+dWPh1uC7OrsASwjYXimAoOZRR87uz86bQhoCLLJz0uq6uHo6ZMWvW4VIhMOjixbc/so
	VIyEh98SZ/YNRnJFP8/Q5X5yCsRtX9wzNRvMJ4UMheJpPPq2bioI9m1aN+JyPjtM4ahC0N/xIxK
	V4Q0St95U4VdhN6HmXmrKSF
X-Received: by 2002:a05:600c:c4a2:b0:485:3bc7:a224 with SMTP id
 5b1f17b1804b1-488d68609e0mr11649685e9.6.1775801755183;
        Thu, 09 Apr 2026 23:15:55 -0700 (PDT)
Received: from localhost.localdomain
 (ip-078-043-200-145.um18.pools.vodafone-ip.de. [78.43.200.145])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488d5888c12sm55473955e9.3.2026.04.09.23.15.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 23:15:54 -0700 (PDT)
From: Marek Czernohous <mczernohous@gmail.com>
X-Google-Original-From: Marek Czernohous <marek@czernohous.de>
To: nouveau@lists.freedesktop.org
Subject: [PATCH 2/3] drm/nouveau/kms: add NULL check for CRTC in
 nv50_sor_atomic_disable
Date: Fri, 10 Apr 2026 08:15:51 +0200
Message-ID: <20260410061552.19056-2-marek@czernohous.de>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260410061552.19056-1-marek@czernohous.de>
References: <20260410061552.19056-1-marek@czernohous.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MailFrom: mczernohous@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: XF7LXI52DLD4QXUN3RQDTZXVOLQF23VF
X-Message-ID-Hash: XF7LXI52DLD4QXUN3RQDTZXVOLQF23VF
X-Mailman-Approved-At: Fri, 10 Apr 2026 17:25:31 +0000
CC: dri-devel@lists.freedesktop.org, Marek Czernohous <marek@czernohous.de>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/XF7LXI52DLD4QXUN3RQDTZXVOLQF23VF/>
Archived-At: 
 <https://lore.freedesktop.org/20260410061552.19056-2-marek@czernohous.de/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

nv50_sor_atomic_disable() calls nv50_head(nv_encoder->crtc) without
checking whether nv_encoder->crtc is NULL. Under Wayland compositors
that use atomic modesetting, a race condition can occur between
atomic_check and atomic_commit: the encoder's CRTC reference may
become NULL after validation but before the disable callback runs.

When this happens, nv50_head() receives a NULL drm_crtc pointer,
and container_of() produces a garbage pointer, leading to a kernel
crash (NULL pointer dereference or page fault).

Add an explicit NULL check for nv_encoder->crtc before dereferencing.
If the CRTC is already gone, release the output resource and return
early — there is nothing left to disable.

Note: checking nv50_head()'s return value would not work here because
container_of(NULL, ...) never returns NULL; the bogus pointer must be
prevented at the source.

Tested on NVAC (MCP79) with Weston --backend=drm. Without this patch,
switching VTs or closing a Wayland session triggers a kernel oops.
With this patch, Wayland session teardown and DPMS cycles are stable.

Signed-off-by: Marek Czernohous <marek@czernohous.de>
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 6c3a8712d..42080874a 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -1565,7 +1565,13 @@ static void
 nv50_sor_atomic_disable(struct drm_encoder *encoder, struct drm_atomic_state *state)
 {
 	struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
-	struct nv50_head *head = nv50_head(nv_encoder->crtc);
+	struct nv50_head *head;
+
+	if (!nv_encoder->crtc) {
+		nvif_outp_release(&nv_encoder->outp);
+		return;
+	}
+	head = nv50_head(nv_encoder->crtc);
 #ifdef CONFIG_DRM_NOUVEAU_BACKLIGHT
 	struct nouveau_connector *nv_connector = nv50_outp_get_old_connector(state, nv_encoder);
 	struct nouveau_drm *drm = nouveau_drm(nv_encoder->base.base.dev);
-- 
2.52.0

