Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FAA1CD6E4A
	for <nouveau@archiver.kernel.org>; Thu, 28 May 2026 18:33:19 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 083EC10F537;
	Thu, 28 May 2026 18:33:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Qq7e+g2U";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id AAE22465E6;
	Thu, 28 May 2026 18:19:49 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1779992389;
 b=DsfCvBZIozHK9mlkDnX21nGD0KfdalZFOIHRkHgBSbI3aN7rTwdsCElw6YTkOmDrpT4Nf
 KcuPYIT3Of6vzEV5vG3ahYe1o+b83ftVv1Zn50gOg7i0Lj7cSph7r/C67DkwJoNMayOV6wG
 IFPZb6TKthTdiFeHMkVGSJmZRDkJWs8GIzMFuJtAdVHTd5jTmvhvpty0utJf2tbi8yqfG16
 ECHPpOLEWNrZryTgAT7p1J9OcZVfqxXVtElSdlrZtkfROQA2jwX006Fo4mzjFmpjzqNzWa2
 pu2OC75kOsJybw4IrmUcPDsxzjdkOWcJNPE22DxaK+575omPb9b0I3+Pn+2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1779992389; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=P8xQYAjs5DtPCuCpT2PrJS1UzcTFSVvXTrRvI9W1Hn0=;
 b=xhox+cTCzcyzQhyRUzPbcYLyBgp7KDNuxm7Cjj3K52G6L5gBXBt+FMVyeeMqmu7ADqfno
 YTz+8Lv8RFAurjsSlcPDw4/NBWc8TKwm7Yma1xxGKQz0c3Emy/PgVwLZBlFKjiwC4VbLF/4
 w3lmfH81yPFy+SJjoBA2nF9UOYw31J9lE74RtUMqytlCK+RWcq4GqD4TXDsY5s38pCyplPI
 chOSmU8SvuHpLKh2nS/nTls6si9oURTki4y97kpJt0EhqNzdQ+dExoyBkHCH7kUAtblBr3e
 JIIbauVFFrl7EJob/F14lvJPoUq5j94sYf+UqnYtuKzSnKEgPzsdymJu4crg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id A5B844021F
	for <nouveau@lists.freedesktop.org>; Thu, 28 May 2026 18:19:46 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A7C0B10F52F
	for <nouveau@lists.freedesktop.org>; Thu, 28 May 2026 18:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779993194;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=P8xQYAjs5DtPCuCpT2PrJS1UzcTFSVvXTrRvI9W1Hn0=;
	b=Qq7e+g2UuYRXrexbvzV0XfzMeW/kuoInViw1IJzyNSwT4l7Ub38RFnp5s0/E84MFFmOyis
	qJrZDbp6T8mDiUOIgfVpwVbLdajiD4FWl8iM1D1SbnR+AumWyfH4kncdaK60LSV8gi0Rxo
	KgGsprPa42rMr96iDYsL+MVumAnyHNY=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-607-QGNVMmK-P5-_nzvWm5zdow-1; Thu,
 28 May 2026 14:33:10 -0400
X-MC-Unique: QGNVMmK-P5-_nzvWm5zdow-1
X-Mimecast-MFC-AGG-ID: QGNVMmK-P5-_nzvWm5zdow_1779993188
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 52C6B1956088;
	Thu, 28 May 2026 18:33:07 +0000 (UTC)
Received: from GoldenWind.lan (unknown [10.22.89.248])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 4769D19560AB;
	Thu, 28 May 2026 18:33:04 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	dakr@kernel.org,
	nouveau@lists.freedesktop.org
Subject: [PATCH] Revert "nouveau/gsp/rm: cleanup remaining IS_ERR_OR_NULL
 usage"
Date: Thu, 28 May 2026 14:33:00 -0400
Message-ID: <20260528183302.3924510-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-MFC-PROC-ID: ty2lFjEMwV75cGGP9ilvWTV-0VXGb4wsb0q0254OxXQ_1779993188
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: OOJ3KP6PSGTFHQFX2B5UNRSB6ONJ3DVD
X-Message-ID-Hash: OOJ3KP6PSGTFHQFX2B5UNRSB6ONJ3DVD
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: Dave Airlie <airlied@redhat.com>, Qianfeng Rong <rongqianfeng@vivo.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 linux-kernel@vger.kernel.org, Simona Vetter <simona@ffwll.ch>,
 Maxime Ripard <mripard@kernel.org>, Hongling Zeng <zenghongling@kylinos.cn>,
 Zhi Wang <zhiw@nvidia.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/OOJ3KP6PSGTFHQFX2B5UNRSB6ONJ3DVD/>
Archived-At: 
 <https://lore.freedesktop.org/20260528183302.3924510-1-lyude@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

This reverts commit 1a80c009e27b42e8c202d4c5dbd9dad9e22af742.

Embarassingly, it seems that I completely missed a pretty big issue this
patch causes according to Danilo and Sashiko:

https://lists.freedesktop.org/archives/dri-devel/2026-May/570353.html

Where it seems this causes some machines to segfault during nouveau probe.

So, revert this for the time being.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/ctrl.c | 2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rpc.c  | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/ctrl.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/ctrl.c
index aa0ebd3dfb17d..70b9ee911c5e7 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/ctrl.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/ctrl.c
@@ -42,7 +42,7 @@ r535_gsp_rpc_rm_ctrl_push(struct nvkm_gsp_object *object, void **params, u32 rep
 	int ret = 0;
 
 	rpc = nvkm_gsp_rpc_push(gsp, rpc, NVKM_GSP_RPC_REPLY_RECV, repc);
-	if (IS_ERR(rpc)) {
+	if (IS_ERR_OR_NULL(rpc)) {
 		*params = NULL;
 		return PTR_ERR(rpc);
 	}
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rpc.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rpc.c
index 0c9657cb2dd72..41301f19729cf 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rpc.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rpc.c
@@ -459,11 +459,11 @@ r535_gsp_msg_recv(struct nvkm_gsp *gsp, int fn, u32 gsp_rpc_len)
 
 retry:
 	rpc = r535_gsp_msgq_peek(gsp, sizeof(*rpc), &retries);
-	if (IS_ERR(rpc))
+	if (IS_ERR_OR_NULL(rpc))
 		return rpc;
 
 	rpc = r535_gsp_msgq_recv(gsp, gsp_rpc_len, &retries);
-	if (IS_ERR(rpc))
+	if (IS_ERR_OR_NULL(rpc))
 		return rpc;
 
 	if (rpc->rpc_result) {
@@ -561,7 +561,7 @@ r535_gsp_rpc_handle_reply(struct nvkm_gsp *gsp, u32 fn,
 		break;
 	case NVKM_GSP_RPC_REPLY_RECV:
 		reply = r535_gsp_msg_recv(gsp, fn, gsp_rpc_len);
-		if (!IS_ERR(reply))
+		if (!IS_ERR_OR_NULL(reply))
 			repv = reply->data;
 		else
 			repv = reply;
-- 
2.54.0

