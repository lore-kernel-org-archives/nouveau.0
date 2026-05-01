Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 133E9CD3423
	for <nouveau@archiver.kernel.org>; Fri,  1 May 2026 21:59:14 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 67EBF10F63C;
	Fri,  1 May 2026 21:59:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="iw4zNM9C";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id AE0DB45D94;
	Fri,  1 May 2026 21:46:42 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1777672002;
 b=J3zrJEpDBNPxpAAGOMjqLK1UYfXn7rx7jeSit1RSlsTl7GOdX7i4JUCNqGy+/5NHYGfoP
 bgmUFvOVRN6wegrc0mhHtByiKpqn2HPOj7mGvW9oCCrOvdvclS6fWuzHJa+cA7OX4JS6Nxj
 zmw2G923qu6OVilzD9SLwadmV3u2mSIR5M4jYJIC7LQovCgQEGtUR7TU8+HeotfeKJwZu3y
 K/XPUWqf/hZy6vKSoL9+za0tJdBPigc/CDMryyXU5vCsAEeF4XbO9LMBqSIoRBQRzB+6rtZ
 3TPxgpd1rXaMXDcVkuEC9ttzPZYWeyVSUYMJWLq7AJrJI5TSWT9g+l02ZUtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1777672002; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=/w4qNCZg0K61tLxc2dmtZAH4YsoauH0iGhCHk3w+L3w=;
 b=xLSw751NJvDbZ142q3QV0HXIED/a5h0bh2S0pg910bhu2AjPpEHimmvpJef0la9qVEKnh
 cIgEOx+fFjLpJm/q+uj05jcc+5qSD1nKE1zcT/FmgYovUZZUo0BKSKzq8AWlOONGaLT5BN1
 uG+2nde90iME7H7d/wzqqinvz1awmMMij8591cMlqnj9X9/VyjnAVHcmr0Ich/zuIIPmeX7
 KA/aclYcgLhcGDXZMNzHR6S5bU6mqxAxvUiadYF+WrYWnEy8iNM/pLxCAr03ZT3VkzgTt65
 R7ybSFQmhmzikhwjW4FNhjFbxSasnU1NosWAqIzVbqtovh0/JRus4z1fOGKQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 708E945C3C
	for <nouveau@lists.freedesktop.org>; Fri,  1 May 2026 21:46:40 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id CFC5710F634
	for <nouveau@lists.freedesktop.org>; Fri,  1 May 2026 21:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777672749;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/w4qNCZg0K61tLxc2dmtZAH4YsoauH0iGhCHk3w+L3w=;
	b=iw4zNM9Cxp4z6ENEg93g3UUjQ/jSKokzox0T+rLkrj+jpKEicHqd5Cxz9xjRC0QlNsPuz0
	yhgPY6T0bSVSa0aYSKhtATxEz0qPtd6oJ2T6t66UE15TpdlqU+BV2RKB4uw+8HY3FIrYB4
	gHjenjbmjYGb8hVV6LFF3lBHgYEQdHQ=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-628-EOEI6xEhPveiyKAC_70A7w-1; Fri,
 01 May 2026 17:59:07 -0400
X-MC-Unique: EOEI6xEhPveiyKAC_70A7w-1
X-Mimecast-MFC-AGG-ID: EOEI6xEhPveiyKAC_70A7w_1777672745
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 6533D1800473;
	Fri,  1 May 2026 21:59:04 +0000 (UTC)
Received: from GoldenWind.lan (unknown [10.22.64.61])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id D382130001A1;
	Fri,  1 May 2026 21:59:01 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/nouveau/kms/nvd9-: Use contiguous memory for CRC notifier
 context
Date: Fri,  1 May 2026 17:58:55 -0400
Message-ID: <20260501215856.840898-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: gDJWBtyAGUeykYKI7P5wfZYciwAecqydrW9YFq2_SwQ_1777672745
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: XK4J6BGNSH2ZB4VSFVUFLC4KT5OEKROU
X-Message-ID-Hash: XK4J6BGNSH2ZB4VSFVUFLC4KT5OEKROU
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Danilo Krummrich <dakr@kernel.org>, Dave Airlie <airlied@redhat.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>, stable@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Ben Skeggs <bskeggs@nvidia.com>, Simona Vetter <simona@ffwll.ch>,
 Maxime Ripard <mripard@kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/XK4J6BGNSH2ZB4VSFVUFLC4KT5OEKROU/>
Archived-At: 
 <https://lore.freedesktop.org/20260501215856.840898-1-lyude@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

It looks like CRC read back has been slightly broken for a while now, in
particular on GPUs using GSP. On my test machines, it's worked normally
when attempting to use it from fbcon. After gnome-shell gets started
however, attempting to read /sys/kernel/debug/dri/$CARD/$CRTC/crc/data just
returns -EINVAL.

It turns out what's been happening is that since we've been using
nvif_mem_ctor_map() to both allocate and map the CRC notifier region - we
haven't actually asked for a contiguous allocation, and simply ask for
whatever type of memory allocation nouveau can find first. This doesn't
work because the CRC engine on nvidia GPUs doesn't support non-contiguous
allocations, which also causes us to fail setting up the kmsCrcNtfyCtxDma
object on pre-blackwell platforms since we don't have a single memory
address we can point nvif_object_ctor() to. Instead, ctx->mem.addr gets set
to ~0ULL.

It does however, seem to work when fbcon is running. The only reason I can
think of this is that before we start up a display environment, there is
pretty much nothing allocated in our VRAM that wasn't allocated by nouveau
itself - making it dramatically more likely that we end up finding a
contiguous allocation by default.

So, fix this by manually requesting a contiguous allocation when we
allocate our context notifiers.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Fixes: 12885ecbfe62 ("drm/nouveau/kms/nvd9-: Add CRC support")
Cc: Lyude Paul <lyude@redhat.com>
Cc: Dave Airlie <airlied@gmail.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Dave Airlie <airlied@redhat.com>
Cc: Timur Tabi <ttabi@nvidia.com>
Cc: Suraj Kandpal <suraj.kandpal@intel.com>
Cc: James Jones <jajones@nvidia.com>
Cc: Faith Ekstrand <faith.ekstrand@collabora.com>
Cc: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v5.9+
---
 drivers/gpu/drm/nouveau/dispnv50/crc.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/crc.c b/drivers/gpu/drm/nouveau/dispnv50/crc.c
index deb6af40ef328..5817f39934a8b 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/crc.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/crc.c
@@ -10,6 +10,7 @@
 #include <nvif/class.h>
 #include <nvif/cl0002.h>
 #include <nvif/timer.h>
+#include <nvif/if900b.h>
 
 #include <nvhw/class/cl907d.h>
 
@@ -499,16 +500,24 @@ nv50_crc_raster_type(enum nv50_crc_source source)
  * notifier needs it's own handle
  */
 static inline int
-nv50_crc_ctx_init(struct nv50_head *head, struct nvif_mmu *mmu,
+nv50_crc_ctx_init(struct drm_device *dev, struct nv50_head *head, struct nvif_mmu *mmu,
 		  struct nv50_crc_notifier_ctx *ctx, size_t len, int idx)
 {
-	struct nv50_core *core = nv50_disp(head->base.base.dev)->core;
+	struct nv50_core *core = nv50_disp(dev)->core;
 	int ret;
 
-	ret = nvif_mem_ctor_map(mmu, "kmsCrcNtfy", NVIF_MEM_VRAM, len, &ctx->mem);
+	/* The display engine requires a contiguous region of memory for the CRC notifier context */
+	ret = nvif_mem_ctor(mmu, "kmsCrcNtfy", mmu->mem, NVIF_MEM_VRAM | NVIF_MEM_MAPPABLE, 0, len,
+			    &(struct gf100_mem_v0) {
+				.contig = true,
+			    }, sizeof(struct gf100_mem_v0), &ctx->mem);
 	if (ret)
 		return ret;
 
+	ret = nvif_object_map(&ctx->mem.object, NULL, 0);
+	if (ret)
+		goto fail_fini;
+
 	/* No CTXDMAs on Blackwell. */
 	if (core->chan.base.user.oclass >= GB202_DISP_CORE_CHANNEL_DMA)
 		return 0;
@@ -576,7 +585,7 @@ int nv50_crc_set_source(struct drm_crtc *crtc, const char *source_str)
 
 	if (source) {
 		for (i = 0; i < ARRAY_SIZE(head->crc.ctx); i++) {
-			ret = nv50_crc_ctx_init(head, mmu, &crc->ctx[i],
+			ret = nv50_crc_ctx_init(dev, head, mmu, &crc->ctx[i],
 						func->notifier_len, i);
 			if (ret)
 				goto out_ctx_fini;

base-commit: 29d6da40d0b8bf3bbc3dcd1d2198434a0e1f71b0
-- 
2.54.0

