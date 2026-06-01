Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5976CD6E60
	for <nouveau@archiver.kernel.org>; Mon,  1 Jun 2026 09:54:25 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 71A81113141;
	Mon,  1 Jun 2026 09:54:21 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 1A8F94670B;
	Mon,  1 Jun 2026 09:40:44 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1780306843;
 b=GgsqOwqouFOcRjcULprVRpFDQbNXQMxkziAiHbtlMM7t8sl2a0YJLd/NlPFEc/+pamQzY
 6hcArUq6XnlA7ao1OMx8QscYLM9+895DXBJ90bG6peeaISksl1D3k1vtUTZ4NsrugmTdh0P
 jH+bAwJmpn1dFxdngIgCQtVTcx5l98mBsE+Kd44Rq6+wEItlsw7cA0KL/FlooJpQkVLAyGe
 QuSU/mP58a8wtN/vZ2E0gn7xcvmIA7lp55+qODxj6gkmx2kL0wx36Yu4i5LCIpc2AkfbWir
 O0Hq47lq07IDRt3qo9Qs5Nzo/rD8LSvOBA6tCjwRIM5RocUsssfQxWHNjJSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1780306843; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=jZGzLrSu2cDx7ddYj9deka9RVsphQzfISgn2jlQr9Kw=;
 b=GyzL6yA4VIHO03OKvAaVdBBLRaN3v9uvQ1F8ujloVapbIATMpmHBwu6IIYH/TB5mdw+Wx
 rr4QUuLM4vqUCYtZVLWyv0AauCVHxtomplkUzIFrCJhf1R14aihkVDW0eDUIRM7kvKo7fbZ
 kZCecF/TI/tl0HeI/REVoN4cBTYvmC9WfKSkKzD5A9RbqzDqzbqiFZxHrvcVCawZKA+1tX7
 k/rvCNgfg/3UVEkUXDN+nygz2GuxbiyakFUNv0ll2I2f1e9ebA3UrO8+i/w3Snvdf2NTqLD
 fYCuVFoBq+y16KrsmCycqLbKG1ZbWCFTzGgqDdL15NEDwI8xirC4LDgBIFnA==
ARC-Authentication-Results: i=1; mail.freedesktop.org; dkim=fail;
  arc=none (Message is not ARC signed);
  dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=fail;
 arc=none (Message is not ARC signed); dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 01A5346706
	for <nouveau@lists.freedesktop.org>; Mon,  1 Jun 2026 09:40:40 +0000 (UTC)
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7B469113119;
	Mon,  1 Jun 2026 09:54:16 +0000 (UTC)
X-UUID: d74873225d9f11f1aa26b74ffac11d73-20260601
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:e7d1782e-22d5-4d34-8a38-784ecb4fa854,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:a6cb9a86db4fa3008853817328e2774f,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|850|865|898,TC:nil,Content:0|1
	5|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: d74873225d9f11f1aa26b74ffac11d73-20260601
X-User: zenghongling@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zenghongling@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1062215437; Mon, 01 Jun 2026 17:54:11 +0800
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
Subject: [PATCH v2 4/5] nouveau/gsp/rm/bar: Cleanup IS_ERR_OR_NULL usage
Date: Mon,  1 Jun 2026 17:54:02 +0800
Message-Id: <20260601095403.228220-5-zenghongling@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260601095403.228220-1-zenghongling@kylinos.cn>
References: <20260601095403.228220-1-zenghongling@kylinos.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: QPFGJMJZ6V23YF624W57EHYZBT32MPYO
X-Message-ID-Hash: QPFGJMJZ6V23YF624W57EHYZBT32MPYO
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/QPFGJMJZ6V23YF624W57EHYZBT32MPYO/>
Archived-At: 
 <https://lore.freedesktop.org/20260601095403.228220-5-zenghongling@kylinos.cn/>
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

