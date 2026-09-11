Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60E00C88E53
	for <nouveau@archiver.kernel.org>; Fri, 11 Sep 2026 22:25:58 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 313A910F70A;
	Fri, 11 Sep 2026 22:25:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="OTS4Kr43";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 53D6D4606B;
	Fri, 11 Sep 2026 22:08:33 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1789164513;
 b=EzOS73UP7Niwaqn4EIbDbSQnftsjG0pC5LfECmDjm56BcbpWRbaWyMIOcmCJI4Em8BC7g
 z5TvGvYwfdoPYLku1nhLNMxqjAf+MipDL1t7lyistkXwEkHlRETQJ+uO5wtrMUvRmno3Wgz
 Y2YcDkcMPeFYnjwjoFIjE2y+6TT/ZtOrOe8+jqjDPmrdz+WXlkLjOLV72s/7ML0/MluKvNg
 19pTE7ftsQbA/vrJw3iLzI+CSDacbAiOKLgdBkvcVp4eKR5wgX013ABfUS/38fYKh1KJJ0V
 41IVPhr+u0Qo++ad2QQjNsP44sCRcNACMJk4pJ5JERj8nEM6Y6BlvvZcZmNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1789164513; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=GtArxXaEurV8BVvM6EYTOe2CdrYTeBsQq9cRZ1ZIWsc=;
 b=tptvZD6gjfrY1t8dhNCdNxYbwc0lIBst0pQ82dmG0O1VWmnLaQ3ugAtSChhNp/Udqbl1O
 i/92RphUCDxVeCeLaYR9kbEzScFqnTxQn24zzlSHJuHOvKEDabgluwo8bLfrZ+bGdL7AJQT
 e8uyyuwvcSg0v5kShX9NZXLdGuwshgq54W9qmpKzZ/nu4twpW9q3Py8Ri05khn3KAeW9uyU
 bTUz+bcTi7pCuzTbkUHsSpa4DV9fDN8T+IMB+iezGK6XP7FxgmCBJEU7+rR+k8ApBvk/vvI
 F4nrFwCWxLHdwWWG0lo+d5rTjPDkZGiE93EQTisht2gtjrUa9CSMbrhXOLTg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 5485445E50
	for <nouveau@lists.freedesktop.org>; Fri, 11 Sep 2026 22:08:30 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E6FB110E57A
	for <nouveau@lists.freedesktop.org>; Fri, 11 Sep 2026 22:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789165554;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GtArxXaEurV8BVvM6EYTOe2CdrYTeBsQq9cRZ1ZIWsc=;
	b=OTS4Kr43Gpcwin02fVnf2PSmJYhCOcd1IAc4KgSsNazvoc6mj8gHXa/jAoDElVeCLP8XCk
	ogaJXtQBsp7lg2hNw5UaXB5/FlJ7stcAtbwRvhfhxk//9RU81MQQfzUQoR3f9JkjssbG3S
	8JTXtPNhEI01oX2IFLOh2fNRtOJ1kFo=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-551-fejDwOKiPECHD579vnd4cQ-1; Fri,
 11 Sep 2026 18:25:50 -0400
X-MC-Unique: fejDwOKiPECHD579vnd4cQ-1
X-Mimecast-MFC-AGG-ID: fejDwOKiPECHD579vnd4cQ_1789165548
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id C55061800A3B;
	Fri, 11 Sep 2026 22:25:48 +0000 (UTC)
Received: from GoldenWind.redhat.com (unknown [10.22.88.4])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 8A23819560AB;
	Fri, 11 Sep 2026 22:25:46 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] drm/nouveau/gsp/r570: Enable Gcoff in fbsr again
Date: Fri, 11 Sep 2026 17:49:58 -0400
Message-ID: <20260911222428.752641-6-lyude@redhat.com>
In-Reply-To: <20260911222428.752641-1-lyude@redhat.com>
References: <20260911222428.752641-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-MFC-PROC-ID: SbKb9AH4DZdaQLSr559K1SjKekB99pI4ZFTSEr1D1fI_1789165548
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: SMXBMWQ6AJPAU4EDSOGE4U3LOXWJCDJU
X-Message-ID-Hash: SMXBMWQ6AJPAU4EDSOGE4U3LOXWJCDJU
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: Dave Airlie <airlied@redhat.com>,
 Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Kees Cook <kees@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Maxime Ripard <mripard@kernel.org>, Hongling Zeng <zenghongling@kylinos.cn>,
 Danilo Krummrich <dakr@kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/SMXBMWQ6AJPAU4EDSOGE4U3LOXWJCDJU/>
Archived-At: 
 <https://lore.freedesktop.org/20260911222428.752641-6-lyude@redhat.com/>
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
---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/fbsr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/fbsr.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/fbsr.c
index 58f426ba81191..8545be1dde6ed 100644
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

