Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D26F5CDB46F
	for <nouveau@archiver.kernel.org>; Mon, 22 Jun 2026 03:55:18 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2B37810E46F;
	Mon, 22 Jun 2026 03:55:14 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id C023946C0F;
	Mon, 22 Jun 2026 03:40:50 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1782099650;
 b=rO61MecNCWAFhudhOLdalIWxEnxCcszaRA5eVyLswXdaVi94eMOxt9sBQakoDR8weW9IZ
 8YKJSa2/GWUeXmOXJTj5KeGtme84yPfQxb5JitPhQJCBBDm6UB7hhcP+VUvF2usIZ7jz/oM
 M28azq2le/TqzaKqZleabVZfSg18nTg3grbf8Q28Czrj046WnfzkUDVQ9izB+z9kUYR5b57
 vJCkI4IYxxqMqTUMdN+PXbwz6+yt8BnSJKVzPw2xyFD98vaWzRQiprXZASqgq8wUXosDq19
 nozaSTKnvC1JvHSsE5irERvdZx1a65YdOPg9gPBP0x4BcVYxvt2TmMDBl7/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1782099650; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=jZGzLrSu2cDx7ddYj9deka9RVsphQzfISgn2jlQr9Kw=;
 b=kDsjJFzZN7cdvVkRY6T6ENfg2Br2jXDtNqOUVEka3MYCRcTFugbjpSBT7tyo1Zy6eiTmh
 acetDM3PRdcA7ADVmCXfd+gWWr1ldGoP5+33zfLfRsxqX4GvIankNbmOswbTw4oPQfgUDid
 UPlL/HtxRe+ZG2UIjnzpQRh3YaKRYama2vViaPAp1CrfEfp+3TkN2IdrVs8IpWdJuAy3Qks
 2AYk9qxBTtwnY9TXxoAhykZQcGRguwOyY9CUGkceSXPXcQHkJ+7zQSYvNLACBC8TzT67eoe
 kBhE+yjknroitGkngashnRvA8uoO0BssOQVF8iFuppIGbTejVyJq9S1jYx7w==
ARC-Authentication-Results: i=1; mail.freedesktop.org; dkim=fail;
  arc=none (Message is not ARC signed);
  dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=fail;
 arc=none (Message is not ARC signed); dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 9A40746BFA
	for <nouveau@lists.freedesktop.org>; Mon, 22 Jun 2026 03:40:47 +0000 (UTC)
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1D59410E44A;
	Mon, 22 Jun 2026 03:55:09 +0000 (UTC)
X-UUID: 26018c486dee11f1aa26b74ffac11d73-20260622
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:1e8abc01-8a91-4b42-94da-3f2d8bb513d6,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:bf5e19cf5edd81c6fc7ef25119387cd0,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|850|865|898,TC:nil,Content:0|1
	5|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 26018c486dee11f1aa26b74ffac11d73-20260622
X-User: zenghongling@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zenghongling@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 334610327; Mon, 22 Jun 2026 11:55:03 +0800
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
Subject: [PATCH v4 4/5] nouveau/gsp/rm/bar: Cleanup IS_ERR_OR_NULL usage
Date: Mon, 22 Jun 2026 11:54:53 +0800
Message-Id: <20260622035454.28003-5-zenghongling@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260622035454.28003-1-zenghongling@kylinos.cn>
References: <20260622035454.28003-1-zenghongling@kylinos.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: DZLCEHYGWDU3Q4QWNRTB44PTQ5RBE4EZ
X-Message-ID-Hash: DZLCEHYGWDU3Q4QWNRTB44PTQ5RBE4EZ
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/DZLCEHYGWDU3Q4QWNRTB44PTQ5RBE4EZ/>
Archived-At: 
 <https://lore.freedesktop.org/20260622035454.28003-5-zenghongling@kylinos.cn/>
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

