Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9EFECD6E4B
	for <nouveau@archiver.kernel.org>; Thu, 28 May 2026 06:25:12 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8FC8410EC9E;
	Thu, 28 May 2026 06:25:09 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 6211C465A0;
	Thu, 28 May 2026 06:11:41 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1779948701;
 b=ACm/yz7SO7GalqVGXNUWHIlZV/sux3wF5KSIg7eS7hKOPdmCr89MLxew1p5O88HNTP7ab
 qzuIBUpaJTFBjbAm41SVAhS0cZcxBQ2Q2o9mqbi3SKmvzNy6/gVVMwfmKBTRaZywKR0aHoq
 7wqDjUHUND84zxpiSJL/NUW3yOYvZhHLp+3pS4+jf66pGheCvemhx0AtMzm1/aXInY747+H
 SHQ71trJgwRgZ9LWhREIYFrXyyZbYrhyGY3NEizpa+NLhISyU8qntrXIjWivOKts2E3C1CA
 52NCMTdp8j9k8p2NTv5izeZBHdPFrsgrF6l2wVNj4UXZ+HiEgz5WkklBRZOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1779948701; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=IeeA5T+HY5OMRGbwPc4NebyAjxi07cOWzqcK3bPYWsA=;
 b=CTYEsECcgnSWlKto+mK6dYGhaIY+KXrr+yq9LoT6ZjvdfueUkSlMm9/2YRCfpPS2Hk7uW
 cStbm055N/yW/Pgy3AOJ4Nn2ZWk3sHIr3sOHi06kqUcQIaWX0eQueAwbWF45xUbKzMJXI7L
 2yUXSATqN7u6dGkBX0g5yWCSjqfOD00TuDsd5HIqaKeEVOc3UMJtw+784MyIb1WcIdtt9dq
 HxXjbAQgBxYqP6vlyJ9uOj1Qc9ZPzPIOszqrxVqxwC1s32fQePYAilan3TG+w1kULjbrn9x
 TMrVRNXeGwTivwReWTzpmpVo47pDtHJs+YrRSAYF7wH8VKbdvEeyV3Dp877Q==
ARC-Authentication-Results: i=1; mail.freedesktop.org; dkim=fail;
  arc=none (Message is not ARC signed);
  dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=fail;
 arc=none (Message is not ARC signed); dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 3A57E46597
	for <nouveau@lists.freedesktop.org>; Thu, 28 May 2026 06:11:38 +0000 (UTC)
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 25F9410EC85;
	Thu, 28 May 2026 06:25:04 +0000 (UTC)
X-UUID: f2abc3ac5a5d11f1aa26b74ffac11d73-20260528
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:2d39bf62-f083-4767-9cec-351212bb6733,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:3b6723f88d13c7d06c549c92b6c50ff7,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|850|865|898,TC:nil,Content:0|1
	5|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: f2abc3ac5a5d11f1aa26b74ffac11d73-20260528
X-User: zenghongling@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zenghongling@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 388258965; Thu, 28 May 2026 14:24:57 +0800
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
Subject: [PATCH 2/5] nouveau/gsp: cleanup IS_ERR_OR_NULL in rpc_rd
Date: Thu, 28 May 2026 14:24:48 +0800
Message-Id: <20260528062451.54107-3-zenghongling@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260528062451.54107-1-zenghongling@kylinos.cn>
References: <20260528062451.54107-1-zenghongling@kylinos.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: SPVOD4PHSR5DDGJTJUN7JQJPEMKWAONG
X-Message-ID-Hash: SPVOD4PHSR5DDGJTJUN7JQJPEMKWAONG
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/SPVOD4PHSR5DDGJTJUN7JQJPEMKWAONG/>
Archived-At: 
 <https://lore.freedesktop.org/20260528062451.54107-3-zenghongling@kylinos.cn/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

The underlying nvkm_gsp_rpc_get() function returns error pointers,
so checking for NULL with IS_ERR_OR_NULL() is redundant. Use IS_ERR()
instead.

This affects nvkm_gsp_rpc_rd().

Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>
---
 drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
index ab2bd88eebce..d771134fa410 100644
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

