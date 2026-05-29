Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88224CD5BD2
	for <nouveau@archiver.kernel.org>; Fri, 29 May 2026 04:43:52 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1330110F884;
	Fri, 29 May 2026 04:43:49 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id BD610466A0;
	Fri, 29 May 2026 04:30:18 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1780029018;
 b=lsGWv1jrO89VhH2TljBTqBFDeO1hwnauMvM8lWB9Ut6mrKzJ5wS9Xefd2KfTVEoKCzc7Q
 xe9RPoOAZjMat5UQzfNnzz7fFIAUdiapq6y3hNh6AXa/f4k7fWhpPXj41ZgvILFTyKqG1Ny
 EtSK1PDJHAz+DFuuKlbabqPDCsvfPiaDbE8cJkb/Y99n2aO2D4sgoyrk9WWqNvW+ENKkSy1
 V3NWLDdecNeMiupweERePyr9y/wVMu/Nh0NeZ/7CVjYXI2SFq2BBzsjdF77X8gF7QXjlORh
 vO5W8TLe1HtCdv9Qcrstx5Gqc+ablqYvdG0rUJBKARoXYmnTbIO6wmFBLkHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1780029018; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=prALN+Jq+ifRea1HaDiXsWQkyTmQKvVIODxjY1PJhZo=;
 b=Dlpln0nBlwOqPQZD12NQoEG6FVonNAB0L9WgLk55LJ1+Akpw+xgT6IqJhxU4pCIgotKOp
 13FWiMU5faJ246PFZgAfYLLxI4+nVYEqn68f+7chnJE3kqKIhq5KsLqh7N109Hn4Lv8vrFA
 J/Y3M9IlJLKV9kKUOkISuVstFLeIuzaqQPv3FhPb4R/7uyJh8cdXz5+Gt5EbJBm/X46vkoY
 EgVbrR8qFmh2Nr/kPXQKZgBE2PgQvkMTKW6aH+9wO26NQ3k9H36fkhnkoq3Eyluc51D2tKJ
 85ySMjBQJuRoKmw7hJy+aGVJyfY4bkWhCLMOyThitTsCk0STj3FQh+VhJFgw==
ARC-Authentication-Results: i=1; mail.freedesktop.org; dkim=fail;
  arc=none (Message is not ARC signed);
  dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=fail;
 arc=none (Message is not ARC signed); dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 694B446591
	for <nouveau@lists.freedesktop.org>; Fri, 29 May 2026 04:30:15 +0000 (UTC)
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B03B110F87A;
	Fri, 29 May 2026 04:43:44 +0000 (UTC)
X-UUID: f7d9a87e5b1811f1aa26b74ffac11d73-20260529
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:fced34c2-1af9-4e90-860c-a2f68394637b,IP:0,U
	RL:0,TC:0,Content:0,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:e7bac3a,CLOUDID:a03f045d94356b0239a41b2568ed7537,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|850|865|898,TC:nil,Content:0|1
	5|50,EDM:2,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:
	0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: f7d9a87e5b1811f1aa26b74ffac11d73-20260529
X-User: zenghongling@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zenghongling@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1487815995; Fri, 29 May 2026 12:43:42 +0800
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
Subject: [PATCH 6/7] nouveau/gsp/rm: cleanup WARN_ON(IS_ERR_OR_NULL)
Date: Fri, 29 May 2026 12:43:29 +0800
Message-Id: <20260529044330.96832-7-zenghongling@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260529044330.96832-1-zenghongling@kylinos.cn>
References: <20260529044330.96832-1-zenghongling@kylinos.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 634J3L3T4FHGSDL5KICYQ6ON5XWFD5H2
X-Message-ID-Hash: 634J3L3T4FHGSDL5KICYQ6ON5XWFD5H2
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/634J3L3T4FHGSDL5KICYQ6ON5XWFD5H2/>
Archived-At: 
 <https://lore.freedesktop.org/20260529044330.96832-7-zenghongling@kylinos.cn/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Replace WARN_ON(IS_ERR_OR_NULL()) with WARN_ON(IS_ERR()) in various
[?4mM files. The underlying functions return error pointers, so
checking for NULL is redundant.

The underlying nvkm_gsp_rpc_get() function is documented to return
error pointers only, never NULL (as per kernel-doc comment added in
previous patch).

This affects:
- r535_bar1_fini() in bar.c

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

