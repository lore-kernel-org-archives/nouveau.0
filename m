Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C093BF459FC
	for <nouveau@archiver.kernel.org>; Fri, 10 Apr 2026 17:37:15 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9FA5410E9B2;
	Fri, 10 Apr 2026 17:37:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="edUXeH3m";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id F416C457F2;
	Fri, 10 Apr 2026 17:25:32 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775841932;
 b=raIwjCwz+CXBziyIuDNK/wQ8jRHA0JkST9Q5XHTimUERntOs4VWgc7DrQrkvmhZlnh98t
 kwG6LBhL3BqGtcYAzAf+CNircNJOp/O3t4k73rOv0fmGgX3/o9/p3av3azirU552iFBo7m1
 +K3mcQtav1Czlm5hpiyu+f/nRoQ7yyFugnpVyeKGGTUaR0nzURnzTNX3hLWDL6NoGj8dOHc
 +yoqaYHswzhqgyysmqzDe4auEDx7bPOCK7dNEtApJHJ3BbyaK+EXukX9nvmOFZ2c8SvYino
 AgVrrCWFMrMSDf5DzfWxifAd5/VAknxpopw6L8nGLo10Fv4ykLx5So8SaKpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775841932; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=cjo43meNd5ZF9rDDbLS97J26FxqDt/TB0OImD2ifO6U=;
 b=YACkN5StpE8HbNzulI2kAvoYn9yFLMANrbJSeZCJa4y4abCJvhnuh6HCkM7+QfTMsffbm
 pxvxG/ChhYhJWjUPwG+uvn44WPCP7Tp0Ac/eLrGDxnQbVWzr4JRINKO2aExQwX+jDIIZgNf
 WTprFXEoGgLG5oD48QlSyoDhr5aElN9cvNOoipLgKLOT6/la8yOv5mdBXUKAQxqh40g7oaZ
 j4/UIIR9s5f5B33SJzeEp+nOH1IqqyWvw55rUoNm12e5IZBs2rvUf6jYNzVgdd2bvbj33WB
 mgoNINuP6ZgIFfilynsnHoRXGQ4bSkIvvlQ+2XhjG1HCPnQnOwvAQ2JAFTxQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 78812457C7
	for <nouveau@lists.freedesktop.org>; Thu,  9 Apr 2026 17:09:52 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
	by gabe.freedesktop.org (Postfix) with ESMTPS id BD40D10E04B
	for <nouveau@lists.freedesktop.org>; Thu,  9 Apr 2026 17:21:32 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-483708b697cso1472135e9.3
        for <nouveau@lists.freedesktop.org>;
 Thu, 09 Apr 2026 10:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775755291; x=1776360091;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cjo43meNd5ZF9rDDbLS97J26FxqDt/TB0OImD2ifO6U=;
        b=edUXeH3mJHDhODJlyhizJQFqfDGvsp/igUwBBSlRvMlaCJu0Zct89UGQrxNggF/Te9
         Vy6X4HelR8wAlFiyB33WWTonG3qDB+LPM6RmQJ6PLs0wx1H4lUmvpV09VsdCpMra5ebR
         KJ0aYe9xypg3ojtjHgCsTmnBVrKkp7JqCkcoD+0kOIW4D+C/Z4ipPH9pwhJidEaGZ/G4
         AsZHZFUDa8Qrc+S8qAlMR3ru3Ac+s3pkd9Z5gXJ4Edhk7uDjXq4HtCNfQ4RJfjJVsjVM
         hydW14HK9+P/TiKMnDg5ljCgPu7N+EhU/kYBrFwxhLtGSKbtG0X6vrLuh+zR93ULFeWC
         DBpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775755291; x=1776360091;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cjo43meNd5ZF9rDDbLS97J26FxqDt/TB0OImD2ifO6U=;
        b=oJLpDCt99rBuKLHsExM5ot1gO6wiwR8CaQkb2IryekzsYhp2w++lPgKYu48KzyWSM0
         6WDE/ki45IgFLWjjEgCrvCXwZr1T/rcBuCStpq+D2q6FtYK3X4pxIgaJOrfPEujbLEqw
         kSiABHVxCesdtKhLqIZPjzHqDkO9qZH/OFwnmqoOOA2hH+182nPKG2QD2NbRE9MWx1me
         J+huAPK5I4UhFdlwoodNiDsRR1bz4QeAUsr6aMwt78GqTolsP27pNzTxljU7H10E+aJQ
         L9oX13H9Kd6G2JNVX0PF4fTBAntezyA2IKUbAPiQ3iuHsbEbNx97Vuqvs7owt+UHyJbB
         LEUg==
X-Gm-Message-State: AOJu0YyjQiRzH1XRsVb7C6GLbIXUXOFeUqCb18FbtoznANxNlOjCD+jn
	8RTRb/f6/QqKWHiUZZ8Pkv33BTkXxxJWn6ddbjYo5L7+s1Q8aPObfgGD2avaUXDU
X-Gm-Gg: AeBDieuFF0+3lH7/XmczJC0wtvjEhexGNjjY103yygup3h0eC+XcDrzk/pCVlYN+ffI
	5tv88KZeZfmvEZelTCFNCyB2RUu6Cy3dj8Sx6333w0XMXOr9VrvomhULCHoNZ2XAwhJHE0WdwUx
	3CMMTXJG6uzD4HZmaFvb/UypwV4UQUZQTFd+6hKaxgVINaBb13FHpnsB6a1IbEj6pPuElzCwKAN
	8KsbVyT5mshmFzaPW70ZdzsrrceAgcQ8k+SvHRqkjvcSHfRnlSvwHAdv6JyJUfkN6S6QzYIh3zq
	d7Ci8CZ5HrrFkJLM3gdGM1Vo3zAqcj1XugOcarX2lqjGcIx1ZqzXyANjcMLk7yhHUtV0JAqsC5a
	PMf78STEeY/OgSSWxcIIoYLeUkBmEp2jzztcKsxhQJSmsR2KKKovJpmRy7GAQs38Gi0OxLD6soq
	M07XiGljspTiKOQXxRz8nrxKO5OrGAMyMvDAPvoFKMQAAENKJjAt6w7Yy3vQ/0DaiF8ryMtZxnM
	78bvSHkQC2keg==
X-Received: by 2002:a05:600c:1381:b0:487:1fbb:5a28 with SMTP id
 5b1f17b1804b1-488996b43b5mr206703455e9.1.1775755291168;
        Thu, 09 Apr 2026 10:21:31 -0700 (PDT)
Received: from localhost.localdomain
 (ip-078-043-200-145.um18.pools.vodafone-ip.de. [78.43.200.145])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d63dec090sm367345f8f.12.2026.04.09.10.21.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 10:21:30 -0700 (PDT)
From: Marek Czernohous <mczernohous@gmail.com>
X-Google-Original-From: Marek Czernohous <marek@czernohous.de>
To: nouveau@lists.freedesktop.org
Subject: [PATCH 2/3] drm/nouveau/kms: add NULL check for CRTC in
 nv50_sor_atomic_disable
Date: Thu,  9 Apr 2026 19:21:25 +0200
Message-ID: <20260409172126.115441-3-marek@czernohous.de>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260409172126.115441-1-marek@czernohous.de>
References: <20260409172126.115441-1-marek@czernohous.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MailFrom: mczernohous@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: PBXFGIQNJWWOFOEZ2ZP32Y3RXGVO3XDO
X-Message-ID-Hash: PBXFGIQNJWWOFOEZ2ZP32Y3RXGVO3XDO
X-Mailman-Approved-At: Fri, 10 Apr 2026 17:25:31 +0000
CC: dri-devel@lists.freedesktop.org, Marek Czernohous <marek@czernohous.de>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/PBXFGIQNJWWOFOEZ2ZP32Y3RXGVO3XDO/>
Archived-At: 
 <https://lore.freedesktop.org/20260409172126.115441-3-marek@czernohous.de/>
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

