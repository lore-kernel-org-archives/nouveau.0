Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 296B2CDB471
	for <nouveau@archiver.kernel.org>; Mon, 22 Jun 2026 08:11:58 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 91CBD10E539;
	Mon, 22 Jun 2026 08:11:56 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id C601F46C3A;
	Mon, 22 Jun 2026 07:57:32 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1782115052;
 b=NpDGqNku6ftHkO3ewttr6xkc16cF9OIQwV1b+eXrrdAefq0KlWjHcnbzXCsnMGWhNQl9R
 8eMjny28r6Cq+w79pdqHZb9erVrfkwmQLc5Zu7KdqfpF9zNX0pFUp1en4O2Yf3pHqXDEkhz
 ZK4/nDeAQlXOTmH29SkdJZ3wsmCNzlD6M271+lVm1/Vt5QAa+2T1MDPppLSNeDfQKoIhU9S
 oX4Zg8Hh/1DRvx2C9WM9uhrWFMdhczNUqkr/kpgBcFDoUvPfTSdjniETXRKRe9ql+zmE0PY
 +UfqrObQoF+SCb+xorMzENuIO3TTEsBZ3r/4QSIFyS8FJDxMq8/d2cGkwaDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1782115052; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=jZGzLrSu2cDx7ddYj9deka9RVsphQzfISgn2jlQr9Kw=;
 b=n4ESXPJ/5HIDwbWfk6m3mKIjuGXqD7AkcbkYAht8hXI31k8RKaZZK8KYy4kfB2yv9XiUN
 h3OJDwEurAMtFZq4EO2XmZNNUzM8iDr4pM5kzSKRK8ZOWFIh98Q7z1I4Osg91HmqCxS48QU
 I9XC44auhNifcX032IYA1cuy9sRGuSkcI6n5sP9F/fbOTJCbpqjWveVFzoFMm7wLh7LTNda
 DHKz4guXqDvw/bLYC80PJ0tyRV6yHXTaJz1gQVMuyeg8q7p8JjWLWLaGVlS+4CiExZGl/tg
 +7xr9lz9wPLs+of4uUVsi4fUJHGQdrhL7nmh5m2X8ODHHcEKv0/ho4FrjQUw==
ARC-Authentication-Results: i=1; mail.freedesktop.org; dkim=fail;
  arc=none (Message is not ARC signed);
  dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=fail;
 arc=none (Message is not ARC signed); dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 505C446C36
	for <nouveau@lists.freedesktop.org>; Mon, 22 Jun 2026 07:57:29 +0000 (UTC)
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9343410E525;
	Mon, 22 Jun 2026 08:11:51 +0000 (UTC)
X-UUID: 024f50366e1211f1aa26b74ffac11d73-20260622
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:aac85d15-c80d-4b4b-bea9-0f4128a7ba62,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:fd36d0014e6ff5d85fe089ea4d098ad7,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|850|865|898,TC:nil,Content:0|1
	5|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 024f50366e1211f1aa26b74ffac11d73-20260622
X-User: zenghongling@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zenghongling@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1054556957; Mon, 22 Jun 2026 16:11:45 +0800
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
Subject: [PATCH v5 4/5] nouveau/gsp/rm/bar: Cleanup IS_ERR_OR_NULL usage
Date: Mon, 22 Jun 2026 16:11:35 +0800
Message-Id: <20260622081136.61695-5-zenghongling@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260622081136.61695-1-zenghongling@kylinos.cn>
References: <20260622081136.61695-1-zenghongling@kylinos.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ZWVVM2UJV6FXFJPHVQSRIB2KJXA43SFF
X-Message-ID-Hash: ZWVVM2UJV6FXFJPHVQSRIB2KJXA43SFF
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/ZWVVM2UJV6FXFJPHVQSRIB2KJXA43SFF/>
Archived-At: 
 <https://lore.freedesktop.org/20260622081136.61695-5-zenghongling@kylinos.cn/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

r535_bar_bar2_update_pde() calls nvkm_gsp_rpc_get() which never
returns NULL, only valid pointers or error pointers. Clean up by
using IS_ERR() instead, matching the actual return value contract.

Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/bar.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/bar.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/bar.c
index fae08ac3b18c..9cd68f8622d3 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/bar.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/bar.c
@@ -55,7 +55,7 @@ r535_bar_bar2_update_pde(struct nvkm_gsp *gsp, u8 page_shift, u64 pdbe)
 	rpc_update_bar_pde_v15_00 *rpc;
 
 	rpc = nvkm_gsp_rpc_get(gsp, NV_VGPU_MSG_FUNCTION_UPDATE_BAR_PDE, sizeof(*rpc));
-	if (WARN_ON(IS_ERR_OR_NULL(rpc)))
+	if (WARN_ON(IS_ERR(rpc)))
 		return -EIO;
 
 	rpc->info.barType = NV_RPC_UPDATE_PDE_BAR_2;
-- 
2.25.1

