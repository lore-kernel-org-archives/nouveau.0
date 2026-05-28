Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87CADCD5BD5
	for <nouveau@archiver.kernel.org>; Thu, 28 May 2026 06:25:11 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0577A10EC94;
	Thu, 28 May 2026 06:25:08 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id D0B614659E;
	Thu, 28 May 2026 06:11:39 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1779948699;
 b=tNxbhnJKH+LjT1e4BFHhii3U1irrFn20Ql+1hpIC42m6gULGO/2/tdNPdS8yL+D0nh8+6
 ytloA01JmrQKyxt6a40esoirMjoAAMSlhFng4RWly50IKHQ3logjbyQXckPuSA6Bs/a58lW
 4QWG6AMKVJW8MbncFZhz/3R722tbw6duRL89yt9vq1qnr2qbzzvJyIp5Y4oTiD8IRcfiaPD
 hroLWATpj51Ufie2U0Rg3JG9glSIH2rwZvxImDWZqwu6L4IrVcxDcHvYjzdU4suEaj3cchG
 DuNio2UWsWMTjYeW+2+SxgLhbRRDIFZ+k91YrIbxbAbUfapcwYyNzCE1WoKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1779948699; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=Pp0WQEPMJnKAALu7IjFISYYsgvEFGm2bwFXoPCibNWs=;
 b=pjSTTMfdN2hRLwY8k32AWbT+4hDfclL9h7xMFFpk9fBnGeOcTjfBEoAJtqcD4Oeux3ngd
 uIJTgSJnzD6QfLCWyXTjnEL0LxMidJtKfsdLlrn8DDDs3QHGhy0svC8GnH9nCykPwfjANO/
 GSA6rwyCdJFz1CuoSuU3EtYuR2zMgq3xd2GGcm5uLZ0T/eClvdWcN91v+jCFv3jAeCuTn9t
 ZpHDKh4TpM0GkYfBg6JZKp+dcR6VHFaeKmOREwnua4VHh5cOZVyD4xfCWxFceYM6+zBFqmS
 xOvyWywxMuhzIHpnN15BvFBZ51uEo42F7SCvRE8xzzJTWiRWCz1GLNulKMcQ==
ARC-Authentication-Results: i=1; mail.freedesktop.org; dkim=fail;
  arc=none (Message is not ARC signed);
  dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=fail;
 arc=none (Message is not ARC signed); dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id B4FDD46463
	for <nouveau@lists.freedesktop.org>; Thu, 28 May 2026 06:11:36 +0000 (UTC)
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	by gabe.freedesktop.org (Postfix) with ESMTPS id EFDBC10EC83;
	Thu, 28 May 2026 06:25:03 +0000 (UTC)
X-UUID: f3311d865a5d11f1aa26b74ffac11d73-20260528
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:59d9e592-3901-45bd-8369-183d48beaa98,IP:0,U
	RL:0,TC:0,Content:0,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:e7bac3a,CLOUDID:d2a58d478bdb96f8bd3c1b3d27336dd7,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|850|865|898,TC:nil,Content:0|1
	5|50,EDM:2,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:
	0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: f3311d865a5d11f1aa26b74ffac11d73-20260528
X-User: zenghongling@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zenghongling@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1507177808; Thu, 28 May 2026 14:24:58 +0800
From: Hongling Zeng <zenghongling@kylinos.cn>
To: lyude@redhat.com,
	dakr@kernel.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	airlied@redhat.com,
	ttabi@nvidia.com,
	bskeggs@nvidia.com,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 3/5] nouveau/gsp/rm: cleanup IS_ERR_OR_NULL in core
 implementation
Date: Thu, 28 May 2026 14:24:49 +0800
Message-Id: <20260528062451.54107-4-zenghongling@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260528062451.54107-1-zenghongling@kylinos.cn>
References: <20260528062451.54107-1-zenghongling@kylinos.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: YSWXXUVC2I5MXKRWOE4NSWB5TMDSRWNW
X-Message-ID-Hash: YSWXXUVC2I5MXKRWOE4NSWB5TMDSRWNW
X-MailFrom: zenghongling@kylinos.cn
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 zhongling0719@126.com, Hongling Zeng <zenghongling@kylinos.cn>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/YSWXXUVC2I5MXKRWOE4NSWB5TMDSRWNW/>
Archived-At: 
 <https://lore.freedesktop.org/20260528062451.54107-4-zenghongling@kylinos.cn/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Clean up IS_ERR_OR_NULL() checks in the core RPC and alloc
implementation files. The underlying functions return error pointers,
so IS_ERR() is sufficient.

This affects:
- r535_gsp_rpc_rm_free() in alloc.c
- r535_gsp_rpc_rm_alloc_push() in alloc.c
- r535_gsp_msgq_recv() in rpc.c

Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/alloc.c | 4 ++--
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rpc.c   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/alloc.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/alloc.c
index 46e3a29f2ad7..27f275d2e151 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/alloc.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/alloc.c
@@ -35,7 +35,7 @@ r535_gsp_rpc_rm_free(struct nvkm_gsp_object *object)
 		   client->object.handle, object->handle);
 
 	rpc = nvkm_gsp_rpc_get(gsp, NV_VGPU_MSG_FUNCTION_FREE, sizeof(*rpc));
-	if (WARN_ON(IS_ERR_OR_NULL(rpc)))
+	if (WARN_ON(IS_ERR(rpc)))
 		return -EIO;
 
 	rpc->params.hRoot = client->object.handle;
@@ -60,7 +60,7 @@ r535_gsp_rpc_rm_alloc_push(struct nvkm_gsp_object *object, void *params)
 	void *ret = NULL;
 
 	rpc = nvkm_gsp_rpc_push(gsp, rpc, NVKM_GSP_RPC_REPLY_RECV, sizeof(*rpc));
-	if (IS_ERR_OR_NULL(rpc))
+	if (IS_ERR(rpc))
 		return rpc;
 
 	if (rpc->status) {
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rpc.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rpc.c
index 3ca3de8f4340..41301f19729c 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rpc.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rpc.c
@@ -324,7 +324,7 @@ r535_gsp_msgq_recv(struct nvkm_gsp *gsp, u32 gsp_rpc_len, int *retries)
 		u32 size;
 
 		rpc = r535_gsp_msgq_peek(gsp, sizeof(*rpc), info.retries);
-		if (IS_ERR_OR_NULL(rpc)) {
+		if (IS_ERR(rpc)) {
 			kvfree(buf);
 			return rpc;
 		}
@@ -333,7 +333,7 @@ r535_gsp_msgq_recv(struct nvkm_gsp *gsp, u32 gsp_rpc_len, int *retries)
 		info.continuation = true;
 
 		rpc = r535_gsp_msgq_recv_one_elem(gsp, &info);
-		if (IS_ERR_OR_NULL(rpc)) {
+		if (IS_ERR(rpc)) {
 			kvfree(buf);
 			return rpc;
 		}
-- 
2.25.1

