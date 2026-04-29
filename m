Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A348FF885A
	for <nouveau@archiver.kernel.org>; Wed, 29 Apr 2026 03:04:36 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id AC2AB10E521;
	Wed, 29 Apr 2026 03:04:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="by+gccDS";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 2DABA45D19;
	Wed, 29 Apr 2026 02:52:11 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1777431131;
 b=jwvS7p3Xrj+JZZc4kFr61okzKEteTaSzB4dZsvKy5hn8M3JJrVVzogKywnvOR+knmArSm
 0GxZv9QADwW8Ie2zXqR5urnRt+CgnwxyEqeuy1d/BRXKYvd4xh3tTTtDaFdY9Asv+QEORtU
 bhmEhCk2WrDMGMbaDsev2oTKF5uCX+1iUjPcn1b0fYEnM+ADv8nCzXaX59MAd2UJCVACvOI
 dcM9j3TCXClfpK+6TiqZ29uidgMI5/FVVru7jLZmi6fgqik0aq3pHx0x7QEy5viU9K+QNi+
 kVyY5DtpJFL5uVunh1+au5/0h8+iOwr3Y4gjYhjN6sFKWnQCmv+zKWpN9zcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1777431131; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=ldwwJIVF7m6VyRD35VYHAOudLjUCD6MJS07MQJZaKIw=;
 b=zPCxs7EqT62dRUFJ2LSypj3xIV0aKoL4neTFQCA9qMJq+efXsbk6BI2Mfju52xPqINLid
 u+3L6Ez80rFDBe/zc1zfj/IZ40Cn9k7Hbb54CMOewSD6P1ZvyoTySMgTbVcKznagOkUSmbD
 Fd6mDyPsnbprTwICJXb+r+RPkklqMxv7JweN4eU8pp2UjMqJd6nq0wvq2rbtHqs5Uwv/gCv
 kObvhnTyjTB+dB4b8qhAHBlQBNAtb/+uUcvdlkbALuB9uA1UpSpeHgstfNY7OZOvIeEmlz3
 saBDX33ndURq3BGeeSdQlE0pPjxk5OMqJMKGF+BUqvK1/HOD7Wub6/t7cm2g==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=redhat.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=redhat.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=redhat.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=redhat.com
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 9AED244C05
	for <nouveau@lists.freedesktop.org>; Wed, 29 Apr 2026 02:52:08 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B8BB110E4A7
	for <nouveau@lists.freedesktop.org>; Wed, 29 Apr 2026 03:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777431870;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ldwwJIVF7m6VyRD35VYHAOudLjUCD6MJS07MQJZaKIw=;
	b=by+gccDS4mBbEwyNOTScavSQHX942HRppgavzdT1hwYGLZ73HclaLh9Np518lSPPcYLjoP
	AsNjS8WbJBvlNicxzk3G2KaMmg4yO8UjbLcAaU4cTbaCnZIkkjqNrhJKpC7Q549wpmdru4
	vugVL15abgWpvfIAZBdxPAzDRYNP6/M=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-104-OmYw-u2QM62O1aSfJHEcfQ-1; Tue,
 28 Apr 2026 23:04:24 -0400
X-MC-Unique: OmYw-u2QM62O1aSfJHEcfQ-1
X-Mimecast-MFC-AGG-ID: OmYw-u2QM62O1aSfJHEcfQ_1777431862
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 94521195609F;
	Wed, 29 Apr 2026 03:04:21 +0000 (UTC)
Received: from GoldenWind.lan (unknown [10.22.88.40])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id C0B31180047F;
	Wed, 29 Apr 2026 03:04:17 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/nouveau/disp/r535: Add scanline position support + head
 state support
Date: Tue, 28 Apr 2026 23:03:40 -0400
Message-ID: <20260429030348.3930866-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-MFC-PROC-ID: znZKRRhUcdxkXRWfj9bZC0M3aFKkpDYduNB0LzMwK6o_1777431862
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: ZEW6TKXAMOWAGWUTPIQRQXEWHFAZRHVX
X-Message-ID-Hash: ZEW6TKXAMOWAGWUTPIQRQXEWHFAZRHVX
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Ben Skeggs <bskeggs@redhat.com>, Dave Airlie <airlied@redhat.com>,
 Ben Skeggs <bskeggs@nvidia.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>, Aaron Kling <webgeek1234@gmail.com>,
 Danilo Krummrich <dakr@kernel.org>, Zhang Enpei <zhang.enpei@zte.com.cn>,
 stable@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Kees Cook <kees@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Maxime Ripard <mripard@kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/ZEW6TKXAMOWAGWUTPIQRQXEWHFAZRHVX/>
Archived-At: 
 <https://lore.freedesktop.org/20260429030348.3930866-1-lyude@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

That's right! It looks like this never actually got finished, something
which I just noticed today when I saw this fun message spamming one of my
test machine's kernel logs when enabling display debug output for nouveau:

  [drm:drm_crtc_vblank_helper_get_vblank_timestamp_internal] crtc 0 : scanoutpos query failed.

So it looks like we've been falling back to DRM's core fallback for a while
now, whoops.

So, while it seems that we do have the option of doing this through GSP -
that doesn't seem like a great idea. Mainly because reading this from GSP
would involve a lot more latency then we should have for vblank handling
due to the RPC communication. So instead of implementing that, just use
gv100_head_state and gv100_head_rgpos for implementing .state and .rgpos.
It seems to work perfectly fine!

Fixes: 9e9944449023 ("drm/nouveau/disp/r535: initial support")
Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: Dave Airlie <airlied@redhat.com>
Cc: Timur Tabi <ttabi@nvidia.com>
Cc: Ben Skeggs <bskeggs@nvidia.com>
Cc: James Jones <jajones@nvidia.com>
Cc: Faith Ekstrand <faith.ekstrand@collabora.com>
Cc: Suraj Kandpal <suraj.kandpal@intel.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Aaron Kling <webgeek1234@gmail.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Zhang Enpei <zhang.enpei@zte.com.cn>
Cc: <stable@vger.kernel.org> # v6.7+
Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/engine/disp/gv100.c       | 4 ++--
 drivers/gpu/drm/nouveau/nvkm/engine/disp/head.h        | 2 ++
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c | 8 ++------
 3 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/gv100.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/gv100.c
index dbd984da75014..0608266188d3e 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/gv100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/gv100.c
@@ -253,7 +253,7 @@ gv100_head_vblank_get(struct nvkm_head *head)
 	nvkm_mask(device, 0x611d80 + (head->id * 4), 0x00000004, 0x00000004);
 }
 
-static void
+void
 gv100_head_rgpos(struct nvkm_head *head, u16 *hline, u16 *vline)
 {
 	struct nvkm_device *device = head->disp->engine.subdev.device;
@@ -263,7 +263,7 @@ gv100_head_rgpos(struct nvkm_head *head, u16 *hline, u16 *vline)
 	*hline = nvkm_rd32(device, 0x616334 + hoff) & 0x0000ffff;
 }
 
-static void
+void
 gv100_head_state(struct nvkm_head *head, struct nvkm_head_state *state)
 {
 	struct nvkm_device *device = head->disp->engine.subdev.device;
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/head.h b/drivers/gpu/drm/nouveau/nvkm/engine/disp/head.h
index 856252bf559a4..b642729c254fe 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/head.h
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/head.h
@@ -53,6 +53,8 @@ void gf119_head_rgclk(struct nvkm_head *, int);
 
 int gv100_head_cnt(struct nvkm_disp *, unsigned long *);
 int gv100_head_new(struct nvkm_disp *, int id);
+void gv100_head_state(struct nvkm_head *head, struct nvkm_head_state *state);
+void gv100_head_rgpos(struct nvkm_head *head, u16 *hline, u16 *vline);
 
 #define HEAD_MSG(h,l,f,a...) do {                                              \
 	struct nvkm_head *_h = (h);                                            \
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
index 6e63df816d855..49a1eef9bdf14 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
@@ -625,14 +625,10 @@ r535_head_vblank_get(struct nvkm_head *head)
 	nvkm_mask(device, 0x611d80 + (head->id * 4), 0x00000002, 0x00000002);
 }
 
-static void
-r535_head_state(struct nvkm_head *head, struct nvkm_head_state *state)
-{
-}
-
 static const struct nvkm_head_func
 r535_head = {
-	.state = r535_head_state,
+	.state = gv100_head_state,
+	.rgpos = gv100_head_rgpos,
 	.vblank_get = r535_head_vblank_get,
 	.vblank_put = r535_head_vblank_put,
 };

base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
-- 
2.54.0

