Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 504E1CD6E45
	for <nouveau@archiver.kernel.org>; Thu, 28 May 2026 19:29:33 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 10F5410F5E2;
	Thu, 28 May 2026 19:29:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="VH490Xs7";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id A7B9246616;
	Thu, 28 May 2026 19:16:03 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1779995763;
 b=0J4tktaYp+ESpj2u0BJVquiRdM9wHDH2B7D0xM5/9nifHyN+Xac5p84sIAokRjTivxc/P
 2Mg1pvK/eHjKMguYAtdK6w3rDy8GhT+pHbPvKgYXPa/GuZue2pKO1BR7/ulBwDLTqiA+fLW
 Ceo9Vt57SolWSJaz7nSAZJHMgbExKbG7ARGNJgaEATU1i1+zelDr9+8nvnzdTDP+BgVOzo8
 RWAMEEBC7AaoGrM0gM+msHiWlvh33q8V5PHFVo6p3bHArFZLIgYTokLG2LhsZqCMIpaWShv
 TsmWdInKUacnvbkUFK+XeA6Iq88rSkq2hY6aFS8Mz6JauXP0mdTF2QsXNgUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1779995763; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=gGfaGZgQK2EIkOvWGdoTrr3vJzngofE2sFgYRG2RXHY=;
 b=zhmlsonC/eWIBBieB4svkvm44edDyxHXqcShoNRKFGAv+075W8tXl6jNqPi3xc5Ln2JYS
 pa2QwF6gjH7Cxy6Evj2izhoHz1E4KvWw1ZgC0foWbbpYnyCjnoKRBwPnihJJpScQ6g4F7on
 /5p0TJ78L0U7klE1tkr/FSaZ3IYzR5sgJ5KZJq5TyaThTb4NDQfUUGpLRzWn4E+Qr20sc2E
 +0t4h2vcB/fV8Mq4NP1x1ogqSsNsWBVIPONSxr9GIrD5CphzUP8XELnm0hgtlg71zSrdQvq
 u0q4vl1kjRI6fbU6lvfXTho0AzE0YNk2b49UwPEMiR/Ap324XbUjvmsJGuCg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id A6EC3401C5
	for <nouveau@lists.freedesktop.org>; Thu, 28 May 2026 19:16:00 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id BFB4510F5E1
	for <nouveau@lists.freedesktop.org>; Thu, 28 May 2026 19:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779996568;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gGfaGZgQK2EIkOvWGdoTrr3vJzngofE2sFgYRG2RXHY=;
	b=VH490Xs7ulvGuREgT2Ol/3VM6fwQWs1J73Qnrr/Qf2W9wL7g0pXmZEvMG46EAUjj3BqXJ5
	wi/nPPs96aons4qzHohFvTAa+ZsGb3Uxg31s4Tyo9tf8tBsvtnQO7yzoaomo8RKpAioVMG
	pJfPpdgEfP1ecn7+HGvpWxspnnLhqGg=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-284-6qb3SPAJPx-mzyPXeG3-Iw-1; Thu,
 28 May 2026 15:29:25 -0400
X-MC-Unique: 6qb3SPAJPx-mzyPXeG3-Iw-1
X-Mimecast-MFC-AGG-ID: 6qb3SPAJPx-mzyPXeG3-Iw_1779996563
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id E4AC219560B2;
	Thu, 28 May 2026 19:29:19 +0000 (UTC)
Received: from GoldenWind.lan (unknown [10.22.89.248])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 997DA19560B2;
	Thu, 28 May 2026 19:29:17 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	Timur Tabi <ttabi@nvidia.com>,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] Revert "nouveau/gsp: cleanup IS_ERR_OR_NULL in rpc_rd"
Date: Thu, 28 May 2026 15:27:18 -0400
Message-ID: <20260528192847.4077458-5-lyude@redhat.com>
In-Reply-To: <20260528192847.4077458-1-lyude@redhat.com>
References: <20260528192847.4077458-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-MFC-PROC-ID: nuSPGkNmy6D6VF4-rkcdVNB2TE8ulfRO4KYIbQboNaM_1779996563
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: EPPIWHRJTJJWEETWXNJSD27CZEZJMZCS
X-Message-ID-Hash: EPPIWHRJTJJWEETWXNJSD27CZEZJMZCS
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/EPPIWHRJTJJWEETWXNJSD27CZEZJMZCS/>
Archived-At: 
 <https://lore.freedesktop.org/20260528192847.4077458-5-lyude@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

This is probably much too risky. See the discussion here:

  https://lists.freedesktop.org/archives/dri-devel/2026-May/570353.html

This reverts commit 47f15f6cf068c14d1a5054066c445bee23f6047e.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
index d771134fa4107..ab2bd88eebce5 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
@@ -293,7 +293,7 @@ nvkm_gsp_rpc_rd(struct nvkm_gsp *gsp, u32 fn, u32 argc)
 {
 	void *argv = nvkm_gsp_rpc_get(gsp, fn, argc);
 
-	if (IS_ERR(argv))
+	if (IS_ERR_OR_NULL(argv))
 		return argv;
 
 	return nvkm_gsp_rpc_push(gsp, argv, NVKM_GSP_RPC_REPLY_RECV, argc);
-- 
2.54.0

