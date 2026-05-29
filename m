Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA30CCD6E4C
	for <nouveau@archiver.kernel.org>; Fri, 29 May 2026 04:43:59 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id F260510F8A9;
	Fri, 29 May 2026 04:43:53 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id AFAE746699;
	Fri, 29 May 2026 04:30:23 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1780029023;
 b=qNlxR3Uuv2Hj1HR7eeYVU5H/otwC0e9z+yQJ8d3MTB/BjY5YbQXcSt4RLaObrd2plRnwd
 w/MwBOzpp9GB9wnUJLqFcH2lxHPmKUSvaRI0cF9AtNltcGV35FdS4LPZE1nAV2MAwgIQhX7
 XMzcGHzwAYmHbXoPPeQVzQqiYMWvIcliL3wTU8AvsWriVWSglxXmZgkbVdOESkfCR0vPxHU
 j1emCV9MHGd6zxE8xTMszaOSmHnAyDIm6WQxnjoiNURvJ/OPUGGOfAF/yYH07NAohAtrJjs
 XNGhX9FVwFkYLsXQjRL9bXdcwaJcqO0gzSWY5AiDnjELL5+51y1SfKs9NK5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1780029023; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=EZoud63JO5gE/ZndhSm8n5RyEMIDppr/Smkranpvs2A=;
 b=X777jLxPOrEqGlF4nwJ/GmPZbhXevN52zIc8pvmtUonUaHJrA48PS+tS0KVpamNgEVkuT
 1WaZms3BaBPWYSJINwKywcOCEpCTeAnn6MkrZ/+HBa3hkC7JCXxZE/gKBSylehjoV+P69p0
 QZYpfW/yaoFxYU/wKCaOPeYhvBkdXuwQ7PFJBy/4kpp1jOBHhTjzJCHw7SoDBC0J3PE4U/n
 uJQA88QYBJEZ4oHEDbUBC9PKh+lpQiRy1Vo2qEPd134h4EN+LK9DbO++aWE73cK6ffxRs+/
 79GBa4B4wq9fhzifFqgo5B2X2zi/86V//i3h+bx39CxsurvUcGd1eQVfU7hw==
ARC-Authentication-Results: i=1; mail.freedesktop.org; dkim=fail;
  arc=none (Message is not ARC signed);
  dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=fail;
 arc=none (Message is not ARC signed); dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 5FF0146591
	for <nouveau@lists.freedesktop.org>; Fri, 29 May 2026 04:30:21 +0000 (UTC)
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	by gabe.freedesktop.org (Postfix) with ESMTPS id CB6A610F88E;
	Fri, 29 May 2026 04:43:49 +0000 (UTC)
X-UUID: f85f42e05b1811f1aa26b74ffac11d73-20260529
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:bc761472-dbc2-4e7d-8f11-3834b54a003c,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:10e731fdf25a11fa33b5dadc3b06c630,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|850|865|898,TC:nil,Content:0|1
	5|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: f85f42e05b1811f1aa26b74ffac11d73-20260529
X-User: zenghongling@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zenghongling@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1181299496; Fri, 29 May 2026 12:43:42 +0800
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
Subject: [PATCH 7/7] nouveau/gsp/rm: cleanup remaining IS_ERR_OR_NULL usage
Date: Fri, 29 May 2026 12:43:30 +0800
Message-Id: <20260529044330.96832-8-zenghongling@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260529044330.96832-1-zenghongling@kylinos.cn>
References: <20260529044330.96832-1-zenghongling@kylinos.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 6YHSNJIXWJ5LR2CQ6N2IXEUP5OQXJK5L
X-Message-ID-Hash: 6YHSNJIXWJ5LR2CQ6N2IXEUP5OQXJK5L
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/6YHSNJIXWJ5LR2CQ6N2IXEUP5OQXJK5L/>
Archived-At: 
 <https://lore.freedesktop.org/20260529044330.96832-8-zenghongling@kylinos.cn/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Clean up the remaining IS_ERR_OR_NULL() checks in ctrl.c and rpc.c.
The underlying functions return error pointers, so IS_ERR() is
sufficient.

The underlying functions are now documented (in previous patches):
- nvkm_gsp_rpc_push(): Returns ERR_PTR on error, never NULL
- r535_gsp_msgq_peek(): Returns ERR_PTR on error, never NULL
- r535_gsp_msg_recv(): Returns ERR_PTR on error, never NULL (fixed in
  patch 1)

This affects:
- r535_gsp_rpc_rm_ctrl_push() in ctrl.c
- r535_gsp_msg_recv() in rpc.c
- r535_gsp_rpc_handle_reply() in rpc.c

Note: With the NULL return values fixed in patch 1, these changes
are now safe and will not cause NULL pointer dereferences.

Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/ctrl.c | 2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rpc.c  | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/ctrl.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/ctrl.c
index 70b9ee911c5e..aa0ebd3dfb17 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/ctrl.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/ctrl.c
@@ -42,7 +42,7 @@ r535_gsp_rpc_rm_ctrl_push(struct nvkm_gsp_object *object, void **params, u32 rep
 	int ret = 0;
 
 	rpc = nvkm_gsp_rpc_push(gsp, rpc, NVKM_GSP_RPC_REPLY_RECV, repc);
-	if (IS_ERR_OR_NULL(rpc)) {
+	if (IS_ERR(rpc)) {
 		*params = NULL;
 		return PTR_ERR(rpc);
 	}
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rpc.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rpc.c
index 7d9a089b2f2c..0c67c82e3968 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rpc.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rpc.c
@@ -490,11 +490,11 @@ r535_gsp_msg_recv(struct nvkm_gsp *gsp, int fn, u32 gsp_rpc_len)
 
 retry:
 	rpc = r535_gsp_msgq_peek(gsp, sizeof(*rpc), &retries);
-	if (IS_ERR_OR_NULL(rpc))
+	if (IS_ERR(rpc))
 		return rpc;
 
 	rpc = r535_gsp_msgq_recv(gsp, gsp_rpc_len, &retries);
-	if (IS_ERR_OR_NULL(rpc))
+	if (IS_ERR(rpc))
 		return rpc;
 
 	if (rpc->rpc_result) {
@@ -592,7 +592,7 @@ r535_gsp_rpc_handle_reply(struct nvkm_gsp *gsp, u32 fn,
 		break;
 	case NVKM_GSP_RPC_REPLY_RECV:
 		reply = r535_gsp_msg_recv(gsp, fn, gsp_rpc_len);
-		if (!IS_ERR_OR_NULL(reply))
+		if (!IS_ERR(reply))
 			repv = reply->data;
 		else
 			repv = reply;
-- 
2.25.1

