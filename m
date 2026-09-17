Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A908AC88E72
	for <nouveau@archiver.kernel.org>; Thu, 17 Sep 2026 17:02:11 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6433510F007;
	Thu, 17 Sep 2026 17:02:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="WX5TWwI3";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id AC359481C7;
	Thu, 17 Sep 2026 16:44:33 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1789663473;
 b=Qa4HIeujY5wJEq50NWjreB3FEVJkWRk/cxreVfTc8LICClXMyMzh7YiT0NyWWbAzEKs8m
 ufWkdj7v4cKBoWcMhDFA3QABJCMTXCGctgMpvN4gci6WGTSxkxGuLCFSQO3tGjpAHWoscIr
 oEPNPtABRKxsumIM8opDiRRKE5d1KhHNjsPUXTtZcPj0nwB65NkFKALYqqKbjsaAQVKRCmk
 but6u4lVWwZ1R29EfypItkz6p0Y59GCrDX9Q3bRYmKC/UvW6q96B2RW7VbKm07lvFRUmNTB
 FBhkQMoCKJeVExCExjxQsNjhrN+uEjOHoAxu8/+W6N8dRBkQeIm9WxBt9aZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1789663473; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=4ZLSwLuQl37xTTXPl3smRd+44VFQmLk3YryksgVUFqw=;
 b=Tav/Oxq1t+6T6xYiTDMcUARpa0RjuwrTAPr2lVaaMeQ8+TpKtYlZP6k6IUP/6btMDZdcJ
 zAKgZ3D8dkvnLJnXB8XJMzw7QJyXSJ3U0XBbn2QSFbMKkSF8YRiBFGlP/+4rfddHvKj5wni
 htnNIHwWHR5pT7t4xgEwmFNN1nual7id3R8DW7RVM3UDuZjySOZwMucBmCtcmDQqhMP5u7k
 sM8lELHLyUfzqQJPScI+MOSQ8WQVFxjwtZIomq/lCZSvL6VjEH/gu7Ldl67DYfzqynSX7P2
 VXGAOogcGP/zuZ9ARx07SbfYZUo65KKdw1h7uOIQK+R1buXyTCQRf/IRxVNg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id C2FB2481BB
	for <nouveau@lists.freedesktop.org>; Thu, 17 Sep 2026 16:44:30 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3215E10F004
	for <nouveau@lists.freedesktop.org>; Thu, 17 Sep 2026 17:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789664527;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4ZLSwLuQl37xTTXPl3smRd+44VFQmLk3YryksgVUFqw=;
	b=WX5TWwI37frIUQSp2NjHR04Ohd4ohTw4eMhU0Xcdpba5+fap9ljTSF8UZnXqgy1vL+wm9o
	Mg6cKpGv76t3RXxB7RkR3mGt+dnFnsbpu4RIJNhcy1sKzWzxTXwFPCZiVHPRLddMEa8Ny+
	j/6IxF5Ckuu3Q2bQgI336iq4UU+Bj3k=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-617-zcun155HP1SPUUHemSdCPQ-1; Thu,
 17 Sep 2026 13:02:02 -0400
X-MC-Unique: zcun155HP1SPUUHemSdCPQ-1
X-Mimecast-MFC-AGG-ID: zcun155HP1SPUUHemSdCPQ_1789664520
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id E459118E9B2F;
	Thu, 17 Sep 2026 17:01:59 +0000 (UTC)
Received: from GoldenWind.lan (unknown [10.22.64.177])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 8C26D30002C7;
	Thu, 17 Sep 2026 17:01:57 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 5/5] drm/nouveau/gsp/r570: Enable Gcoff in fbsr again
Date: Thu, 17 Sep 2026 12:58:36 -0400
Message-ID: <20260917170042.440276-6-lyude@redhat.com>
In-Reply-To: <20260917170042.440276-1-lyude@redhat.com>
References: <20260917170042.440276-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: muijBOFH162r52cU96mO9bwpU5uPGn1eOLVZkZkuZrQ_1789664520
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: UL5V6UXAJ4DMUCWXNP6D5TLSSYRR6U55
X-Message-ID-Hash: UL5V6UXAJ4DMUCWXNP6D5TLSSYRR6U55
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: Dave Airlie <airlied@redhat.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Kees Cook <kees@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Maxime Ripard <mripard@kernel.org>, Hongling Zeng <zenghongling@kylinos.cn>,
 Danilo Krummrich <dakr@kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/UL5V6UXAJ4DMUCWXNP6D5TLSSYRR6U55/>
Archived-At: 
 <https://lore.freedesktop.org/20260917170042.440276-6-lyude@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Now that we're properly saving the compbit backing stores on fbsr init, we
can start setting bEnteringGcOff = 1 again without things breaking, which
brings us closer to following the exact same code-paths OpenRM does for
fbsr.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Reviewed-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/fbsr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/fbsr.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/fbsr.c
index a93a39ef7c690..469e7eed1d6f8 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/fbsr.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/fbsr.c
@@ -135,7 +135,7 @@ r570_fbsr_init(struct nvkm_gsp *gsp, struct sg_table *sgt, u64 size)
 	ctrl->hClient = gsp->internal.client.object.handle;
 	ctrl->hSysMem = memlist.handle;
 	ctrl->sysmemAddrOfSuspendResumeData = gsp->sr.meta.addr;
-	ctrl->bEnteringGcoffState = 0;
+	ctrl->bEnteringGcoffState = 1;
 
 	ret = nvkm_gsp_rm_ctrl_wr(&gsp->internal.device.subdevice, ctrl);
 	if (ret)
-- 
2.55.0

