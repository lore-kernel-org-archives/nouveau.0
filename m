Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99C00CD6E4A
	for <nouveau@archiver.kernel.org>; Thu, 28 May 2026 06:25:12 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4404E10EC97;
	Thu, 28 May 2026 06:25:09 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 157E4465A1;
	Thu, 28 May 2026 06:11:41 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1779948700;
 b=X+dbeCeeRWSTkyEX1GF79q4Qlk1dTZpWkGXg5URrxXQlg91im9ZQ60fN0wrW/GjwsdAmx
 zGWk4KF60N2C6tLMNUheOOFa/8TAZ72UorsGsedkyH0ceDdeafGt0+L/cIrF5LskvGgkcKm
 xbD/HnYx9bd7w96kR/9mF2I+bou2oSFc9ynv9x352nSr/DKMEwxBBRiztBb5NYXkv4AnAmI
 HbVz9Q3yzBToipSgVg1ltyJsYkJOFqetYdHfMBfrxaHlUZJRjxXAfyWkL2CNB0DWEU4UUq0
 n2bSiUGkeQ8uxRwi/e1fN8zcA4pAKV0ULtadawVu8AmusrLCSPF9S44czUQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1779948700; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=6dhG4kisBuwjnLN9ICrQJMi/qIdz3+cBn6TcDm9kPmo=;
 b=hTX4iqt8pvAmLf+uM5CD0LNqfDxtmY+fOtvbylrlWl9kN8SQAE7fTB+g6qL1jr6+xALpF
 W7oYaOllO3u0dWkJQ3YQpdumvMBtTDtWtzMMf49Bfk28ciZC4e/RppKe4qBBXWF6xsXe29C
 TlDaq5Ah+KBcBm3mDSPNVEaHoVftBxO6FgcbjL/NYXxpe3Dw/dtPaIAI64hAV7ADrfl3BTR
 9khl8EAUo2sm2ox8iiT52+Bd/JQtWANJrg+128GhkAQJ0qULUyAQwmoxfKWqv8aGPnvXkzp
 x++pdfFXlOEajGhcuRoLe1IXtlfOvWYPjGJXAdhC5C+zEWeZmaK6ovtau6PA==
ARC-Authentication-Results: i=1; mail.freedesktop.org; dkim=fail;
  arc=none (Message is not ARC signed);
  dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=fail;
 arc=none (Message is not ARC signed); dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id DCB2346588
	for <nouveau@lists.freedesktop.org>; Thu, 28 May 2026 06:11:37 +0000 (UTC)
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2BF8010EC86;
	Thu, 28 May 2026 06:25:04 +0000 (UTC)
X-UUID: f3d510585a5d11f1aa26b74ffac11d73-20260528
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:1686bf7d-1494-4038-93ef-1ffac0fab008,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:822283d2ea4af24794fd77fd28eadf8a,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|850|865|898,TC:nil,Content:0|1
	5|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: f3d510585a5d11f1aa26b74ffac11d73-20260528
X-User: zenghongling@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zenghongling@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 233428923; Thu, 28 May 2026 14:24:59 +0800
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
Subject: [PATCH 4/5] nouveau/gsp/rm: cleanup WARN_ON(IS_ERR_OR_NULL)
Date: Thu, 28 May 2026 14:24:50 +0800
Message-Id: <20260528062451.54107-5-zenghongling@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260528062451.54107-1-zenghongling@kylinos.cn>
References: <20260528062451.54107-1-zenghongling@kylinos.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: CBBELO5GY4NRR5MD2QOZP5HBSMBCUY3P
X-Message-ID-Hash: CBBELO5GY4NRR5MD2QOZP5HBSMBCUY3P
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/CBBELO5GY4NRR5MD2QOZP5HBSMBCUY3P/>
Archived-At: 
 <https://lore.freedesktop.org/20260528062451.54107-5-zenghongling@kylinos.cn/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Replace WARN_ON(IS_ERR_OR_NULL()) with WARN_ON(IS_ERR()) in various
GSP-RM files. The underlying functions return error pointers, so
checking for NULL is redundant.

This affects:
- r535_bar_bar2_update_pde() in bar.c

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

