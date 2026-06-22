Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B732CDB46B
	for <nouveau@archiver.kernel.org>; Mon, 22 Jun 2026 08:11:54 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id BFD4210E529;
	Mon, 22 Jun 2026 08:11:52 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id DD95A46C36;
	Mon, 22 Jun 2026 07:57:28 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1782115048;
 b=vAKOO+P2+SAL+I/EpHXL4AdcEzzG0epfUKoT6bffH/S2EiwHZlGh2rmdTguZhgBbMlIfo
 DP6gX57+5xC+GiWK+mrpPjCisOAjYpNxIk5S1QD+AisPs/ldfW847D3vU5TQa59XR0qMlSA
 GCIo+Lhrmn6W6INtChrtw8MumCJTuob8WWcdIu4tZkg5IrXssAvGXWHjC7vXSFGwTSOXlj3
 sxL/IhNIAkMgWcmvZj5DoKcNp+tcPnpEfKIJWuz19jfO2sZVRBDpAncosYknr2pJinW+vzq
 eKdB0s/LPJ7Dw9811+eiS4kgYRaX2yliax4/GD0GLwusq1JjFLT/bvU5flhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1782115048; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=0lIKIh9ITL5wJ4Q9ZSRGT/5+hPs/m2EIQ5nlEvefaVM=;
 b=xfJ7na3UeUN8dkpBZYpd93DdDBajcEIJCIo9U2G7WOlnn95wIuxTSazfGYpIJpf4vd/eg
 O6NrBjBXtTUhk2WZXmI0nubmCRq2jQG92uJH18lh6W4TVNko2dB5PVqO6dHmfOEpTnunKWG
 L8CrQwC6bOjj/BuCnP6OOYUskumO8+ZgKsJcUVFQTiZXoNMTtNDTiG86N3OF7s8JXffh9NS
 0l3e74I+fIv8k4L2YEfLe1yT4hKtqTX9cxeEpnnx8gh0D3uuSF69K86jJyjGhWakEENNr3t
 0JLUaD9EARELBsJrjmtISgSUvEvcfVLr+wAAuIzJWvXTnP9vCxZIVwZTkuqA==
ARC-Authentication-Results: i=1; mail.freedesktop.org; dkim=fail;
  arc=none (Message is not ARC signed);
  dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=fail;
 arc=none (Message is not ARC signed); dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id ED68246C2C
	for <nouveau@lists.freedesktop.org>; Mon, 22 Jun 2026 07:57:25 +0000 (UTC)
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	by gabe.freedesktop.org (Postfix) with ESMTPS id DA77110E518;
	Mon, 22 Jun 2026 08:11:48 +0000 (UTC)
X-UUID: 01c9d46a6e1211f1aa26b74ffac11d73-20260622
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:0ddd9140-c4ed-43ba-93aa-6e213fca5ef9,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:fe42c26d41720937a6057bb9e605c53f,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|850|865|898,TC:nil,Content:0|1
	5|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 01c9d46a6e1211f1aa26b74ffac11d73-20260622
X-User: zenghongling@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zenghongling@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1375912396; Mon, 22 Jun 2026 16:11:44 +0800
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
Subject: [PATCH v5 3/5] nouveau/gsp/rm/alloc: Cleanup IS_ERR_OR_NULL usage
Date: Mon, 22 Jun 2026 16:11:34 +0800
Message-Id: <20260622081136.61695-4-zenghongling@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260622081136.61695-1-zenghongling@kylinos.cn>
References: <20260622081136.61695-1-zenghongling@kylinos.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: BBE5MNYW5UML534GWNJSM3UBBILL5JDE
X-Message-ID-Hash: BBE5MNYW5UML534GWNJSM3UBBILL5JDE
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/BBE5MNYW5UML534GWNJSM3UBBILL5JDE/>
Archived-At: 
 <https://lore.freedesktop.org/20260622081136.61695-4-zenghongling@kylinos.cn/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

r535_gsp_rpc_rm_free() calls nvkm_gsp_rpc_get() which never returns
NULL, only valid pointers or error pointers. Clean up by using IS_ERR()
instead, matching the actual return value contract.

Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/alloc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/alloc.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/alloc.c
index 46e3a29f2ad7..c9f86c0e9b25 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/alloc.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/alloc.c
@@ -35,7 +35,7 @@ r535_gsp_rpc_rm_free(struct nvkm_gsp_object *object)
 		   client->object.handle, object->handle);
 
 	rpc = nvkm_gsp_rpc_get(gsp, NV_VGPU_MSG_FUNCTION_FREE, sizeof(*rpc));
-	if (WARN_ON(IS_ERR_OR_NULL(rpc)))
+	if (WARN_ON(IS_ERR(rpc)))
 		return -EIO;
 
 	rpc->params.hRoot = client->object.handle;
-- 
2.25.1

