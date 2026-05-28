Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4D10CD5BD5
	for <nouveau@archiver.kernel.org>; Thu, 28 May 2026 19:29:26 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C0BAB10F5EA;
	Thu, 28 May 2026 19:29:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="DMV4YU6+";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 65DFD46612;
	Thu, 28 May 2026 19:15:57 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1779995757;
 b=ct+MyBUFpY9W8HPvCvo8It6mSVUI1Mgp3qVMweAiHNHdeUUNDBezRHZtttPSaGLY5QR9j
 KBSpaBUXf8VEM2+h43MI4xUDSLAHd5OSUZ/Z2LrEeVD3Jp0dmXThnV0NQEm4I4DDnsR0X1S
 SeUr5+LV1/lnzWGvntx3vMTyogvZ6vQ2IfaJerc8iFxlliK19KbkmPTZyJNz77MI/Ly06MB
 n3jy1tyIJ3mQZv/rovbbYdMqgzzAx6BWVHPu85rCeQHQgSj8QN1V9k+DDU+gR68XuRJp/SF
 Ly7yvq/PCWNQEppOk+RVtYYr84Vl/0TnSzevFdWSLHVTjEfEHat0TIkBZOvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1779995757; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=Oh4yR/ss5c41je5jv3EajM1W8lREAand3plKjqUGg54=;
 b=TRVltfsgWzNtV5n40MYnw1bmgDW5rlLlsNnMKLB8lmjGDJw13bGL0YslLalbBhDwyQHms
 b5XjsizhDF7WkGb0Wzp8I99zxsYxacFx7bwU0PzdGj4De8OIpI+2MNftFLhBdeSB9fV0f5u
 PzdisqoqHD9NZY5FQZTb8TjiZOQaPvHSUm53+wXEceQmvUR1rI8Z1MWFlTqDbi57frxRDnJ
 U3BkEjEixh+kTYh3gBUZnMnv+gAKNKAUGxIy/gERyLYemxRCht9Z7n94UYekMBxQJ4R98Nh
 kby2AvszY4i83UZTjH5050Qb7aalSQH2At45xuZN0yPT19F+LBhFMyEZuWEg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id BFF5A4660D
	for <nouveau@lists.freedesktop.org>; Thu, 28 May 2026 19:15:54 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id DE04C10F5E4
	for <nouveau@lists.freedesktop.org>; Thu, 28 May 2026 19:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779996563;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Oh4yR/ss5c41je5jv3EajM1W8lREAand3plKjqUGg54=;
	b=DMV4YU6+Sy9nIz/sLWU33YKkKexd0Je4Qj9p6QUpeiDOl/u0D+K2tYh/ub6JSrKMSOqNSx
	uyCJ2grJ6zTqo+SfsM+i3DBojEhnaDqKqOpMKDQSbr6Ii8bCjaJ6Xjmno6HQ7Cq0gILRCz
	afTvHEnLR4ZYgzA0Ve6KtvCj2/RoRqI=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-77-FtSbXF8VNDudUhug7YkZRw-1; Thu,
 28 May 2026 15:29:16 -0400
X-MC-Unique: FtSbXF8VNDudUhug7YkZRw-1
X-Mimecast-MFC-AGG-ID: FtSbXF8VNDudUhug7YkZRw_1779996553
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 66EAE1800622;
	Thu, 28 May 2026 19:29:13 +0000 (UTC)
Received: from GoldenWind.lan (unknown [10.22.89.248])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 5F50A19560A3;
	Thu, 28 May 2026 19:29:11 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	Timur Tabi <ttabi@nvidia.com>,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] Revert "nouveau/gsp/rm: cleanup WARN_ON(IS_ERR_OR_NULL)"
Date: Thu, 28 May 2026 15:27:17 -0400
Message-ID: <20260528192847.4077458-4-lyude@redhat.com>
In-Reply-To: <20260528192847.4077458-1-lyude@redhat.com>
References: <20260528192847.4077458-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-MFC-PROC-ID: jeZgcjkerk-GjL8EdtpjLox6r2d-FW7sm9zCWV31d_E_1779996553
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: MTJDNEFONFPDLGQY77FQW5757LEG3BHN
X-Message-ID-Hash: MTJDNEFONFPDLGQY77FQW5757LEG3BHN
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: Dave Airlie <airlied@redhat.com>, Qianfeng Rong <rongqianfeng@vivo.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Kees Cook <kees@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Maxime Ripard <mripard@kernel.org>, Hongling Zeng <zenghongling@kylinos.cn>,
 Danilo Krummrich <dakr@kernel.org>, Zhi Wang <zhiw@nvidia.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/MTJDNEFONFPDLGQY77FQW5757LEG3BHN/>
Archived-At: 
 <https://lore.freedesktop.org/20260528192847.4077458-4-lyude@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

This is probably too risky, see the discussion here:

  https://lists.freedesktop.org/archives/dri-devel/2026-May/570353.html

This reverts commit 6198977a78af8769d3f3108e830901325b97cf03.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/bar.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/bar.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/bar.c
index 9cd68f8622d36..fae08ac3b18c7 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/bar.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/bar.c
@@ -55,7 +55,7 @@ r535_bar_bar2_update_pde(struct nvkm_gsp *gsp, u8 page_shift, u64 pdbe)
 	rpc_update_bar_pde_v15_00 *rpc;
 
 	rpc = nvkm_gsp_rpc_get(gsp, NV_VGPU_MSG_FUNCTION_UPDATE_BAR_PDE, sizeof(*rpc));
-	if (WARN_ON(IS_ERR(rpc)))
+	if (WARN_ON(IS_ERR_OR_NULL(rpc)))
 		return -EIO;
 
 	rpc->info.barType = NV_RPC_UPDATE_PDE_BAR_2;
-- 
2.54.0

