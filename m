Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2891ECD6E62
	for <nouveau@archiver.kernel.org>; Mon,  1 Jun 2026 09:54:27 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A91E7113144;
	Mon,  1 Jun 2026 09:54:22 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 4F12E4670F;
	Mon,  1 Jun 2026 09:40:45 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1780306845;
 b=uDwNeS6Dj94SA9VPz02HM23Phym/bgqrIfunGF/yGldZmpzcOw3XaEEA2vDFj+vuws3xI
 BJBoxbaCVq+r50/zJjX8gn5tw9hD7LYSPBVefG5KHaifWunTJjzA0sZuLmgcnB+zthK0/mQ
 40wDzhyQ82DNkbmc2D/5TLnQbc9E2dx+sLBXuAr0/hVKpU0WF+4289dOKX7NOJhVxI5kakn
 KNd2Z6MV7/fHGHCLYJkU+lANJO1RLB/POchzpNm1kSMfvipulAnrbakyNhgPV1DfvAZooot
 ntjpGWvhnqjVLuPHi19vTB5qBF0k4RYkOk5BFB3m2dIDAhNza2elV+BHcwiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1780306845; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=IK6b6ba54ROD+JFvXgQpGSrF8xItuVVfzQrcudSV+IA=;
 b=zXTTDbW4NDcXRGWJ/VTU2coPzvfSuIfTEJ8EaVVsQkimMkGGJ9+kzf4GLSz8MMmC/TFnt
 VRr8mfjzlfkFP6Rn4CSXEinBMY+A7tnE0dAR3hnUnBccKX9dU/2REpL+HZy8xNYww6eFt+V
 EjUnjcMSBC7vEdiQVRd7atG4GhlnrkQyj2C5CyIj9N+STuMMPqWNpkafJ0Bw0ywYaCfde+r
 5MXA3o+lE4xgDeBMzTaSo/1YwGpXJVhlGlCVf9MCZ8zXHNFzBj4ksok5NyvsbMyFFCKO0WL
 +GWS2A5fnOQ2tFat214rXZKnAaIXfPnrI9alPwMsJ0/VIj2biypIOiYnHLzA==
ARC-Authentication-Results: i=1; mail.freedesktop.org; dkim=fail;
  arc=none (Message is not ARC signed);
  dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=fail;
 arc=none (Message is not ARC signed); dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 2037846708
	for <nouveau@lists.freedesktop.org>; Mon,  1 Jun 2026 09:40:41 +0000 (UTC)
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 97D45113120;
	Mon,  1 Jun 2026 09:54:17 +0000 (UTC)
X-UUID: d7f52e965d9f11f1aa26b74ffac11d73-20260601
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:73283eee-304d-48da-a363-7393821e65fd,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:3fec95b3d873b147590022ed1e9a3cbe,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|850|865|898,TC:nil,Content:0|1
	5|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: d7f52e965d9f11f1aa26b74ffac11d73-20260601
X-User: zenghongling@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zenghongling@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 684301902; Mon, 01 Jun 2026 17:54:12 +0800
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
Subject: [PATCH v2 5/5] nouveau/gsp: Cleanup IS_ERR_OR_NULL in
  nvkm_gsp_rpc_rd()
Date: Mon,  1 Jun 2026 17:54:03 +0800
Message-Id: <20260601095403.228220-6-zenghongling@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260601095403.228220-1-zenghongling@kylinos.cn>
References: <20260601095403.228220-1-zenghongling@kylinos.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: USCGZDYTVPYUHWO6HDTDDOUMC6RO5UF2
X-Message-ID-Hash: USCGZDYTVPYUHWO6HDTDDOUMC6RO5UF2
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/USCGZDYTVPYUHWO6HDTDDOUMC6RO5UF2/>
Archived-At: 
 <https://lore.freedesktop.org/20260601095403.228220-6-zenghongling@kylinos.cn/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

nvkm_gsp_rpc_rd() calls nvkm_gsp_rpc_get() which never returns NULL,
only valid pointers or error pointers. Clean up by using IS_ERR()
instead, matching the actual return value contract.

Note: nvkm_gsp_rpc_push() can return NULL when policy is NOWAIT or
NOSEQ, but nvkm_gsp_rpc_rd() uses RECV policy which expects a reply.
If the RPC fails to get a reply, it should return an error pointer,
not NULL.

Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>
---
 drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
index 64fed208e4cf..a061779e0107 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
@@ -293,7 +293,7 @@ nvkm_gsp_rpc_rd(struct nvkm_gsp *gsp, u32 fn, u32 argc)
 {
 	void *argv = nvkm_gsp_rpc_get(gsp, fn, argc);
 
-	if (IS_ERR_OR_NULL(argv))
+	if (IS_ERR(argv))
 		return argv;
 
 	return nvkm_gsp_rpc_push(gsp, argv, NVKM_GSP_RPC_REPLY_RECV, argc);
-- 
2.25.1

