Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26105CD6E49
	for <nouveau@archiver.kernel.org>; Fri, 29 May 2026 04:43:54 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7686810F893;
	Fri, 29 May 2026 04:43:50 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 28E814669A;
	Fri, 29 May 2026 04:30:20 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1780029019;
 b=rqvmZz0SW0qsQ1Ohln5OPCBzmSumZz+/GqOCGt/M5FxnFdHjCz3DfIwtXXokt9c8RMKb1
 kWnJgig90/qAnkCHIt6sEXQrqG6x/+vDclTivNVVpVdoN6Z2GrIAd0Pp/HkzJAOdxJnLirw
 EZf65AwJhPSDuhGJR4r8zVK3Eqoa+eAur+dmYhAWVBwe6//qpvj7BN49896tgs9rcoFIH5o
 JspNxdIialPoz7WFAmbkIcL6WtEOa7zsaGGQXjRdhvJmrJx9O2UZjUL6oRVuEalxd/85Jyk
 gPmNOLl2nHGfFq9zEkLSFR0BfV2kxzv4DS/LysGeuQqUSBN+MzlOEc4xN/dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1780029019; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=5DADu98OdvrXWj7bwY+d9KtQM7ftrxkMNu/7fYRV7Dg=;
 b=lqYC2w44M0VRHnZ+Fx+r1khwIjTByEMnOWa8dHbNUQVp+SN+DVkvZ1H+MB/GYNrNeMmhV
 iZSK2urD9pFDXOufnVvK7DXqee9nwn1Ij12+3Se9TZAce4tPsvP92xJnAQHqZKGHVKQArYv
 U4mYIH9EPSqL546eyGyCM70RXtgOsyQU63xmCvV9+Tg1VdgVSbYvpVzvlxDaSfT8iyIPx6n
 zN6BtHPgrBOWBqG/19LqV1s66Og2SYtOoDXYupxZyT7XD+r/t41MHLn1wKJWjtAfrfISd5o
 PzZB99XBq1K30Z2hAA5jYYGlkgN9MWUPu8dWFzJ2ipZ0OHkjPevheSTR8nbw==
ARC-Authentication-Results: i=1; mail.freedesktop.org; dkim=fail;
  arc=none (Message is not ARC signed);
  dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=fail;
 arc=none (Message is not ARC signed); dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 4DEF346698
	for <nouveau@lists.freedesktop.org>; Fri, 29 May 2026 04:30:16 +0000 (UTC)
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3E4CA10F87B;
	Fri, 29 May 2026 04:43:45 +0000 (UTC)
X-UUID: f53a75e45b1811f1aa26b74ffac11d73-20260529
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:4bc93862-9aa5-4d55-a1a3-dab349dda999,IP:0,U
	RL:0,TC:0,Content:0,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:e7bac3a,CLOUDID:50a9ea194571a7af21f02bfefb4a9f8e,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|850|865|898,TC:nil,Content:0|1
	5|50,EDM:2,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:
	0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: f53a75e45b1811f1aa26b74ffac11d73-20260529
X-User: zenghongling@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zenghongling@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1194093129; Fri, 29 May 2026 12:43:37 +0800
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
Subject: [PATCH 1/7] nouveau/gsp/rm: Fix NULL return values in message receive
 functions
Date: Fri, 29 May 2026 12:43:24 +0800
Message-Id: <20260529044330.96832-2-zenghongling@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260529044330.96832-1-zenghongling@kylinos.cn>
References: <20260529044330.96832-1-zenghongling@kylinos.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: FBDU4Q7IMQPGTC7TRSY35V2Q4JFLZYSP
X-Message-ID-Hash: FBDU4Q7IMQPGTC7TRSY35V2Q4JFLZYSP
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/FBDU4Q7IMQPGTC7TRSY35V2Q4JFLZYSP/>
Archived-At: 
 <https://lore.freedesktop.org/20260529044330.96832-2-zenghongling@kylinos.cn/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Fix r535_gsp_msgq_recv() and r535_gsp_msg_recv() to return error
pointers instead of NULL. This is necessary to allow callers to use
IS_ERR() consistently without missing NULL cases.

Changes:
- r535_gsp_msgq_recv(): Return ERR_PTR(-EINVAL) when RPC size exceeds
  maximum instead of NULL
- r535_gsp_msg_recv(): Return ERR_PTR(-EIO) when message length is
  insufficient instead of NULL
- r535_gsp_msg_recv(): For the case where no reply payload is expected
  (gsp_rpc_len == 0), return ERR_PTR(-EIO) instead of NULL to maintain
  consistent error handling

This fixes potential NULL pointer dereferences when IS_ERR_OR_NULL()
is replaced with IS_ERR().

Fixes: ("nouveau/gsp/rm: cleanup IS_ERR_OR_NULL in core implementation")
Fixes: ("nouveau/gsp/rm: cleanup remaining IS_ERR_OR_NULL usage")
Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rpc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rpc.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rpc.c
index 3ca3de8f4340..ce83a867dd36 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rpc.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rpc.c
@@ -297,7 +297,7 @@ r535_gsp_msgq_recv(struct nvkm_gsp *gsp, u32 gsp_rpc_len, int *retries)
 	rpc = (struct nvfw_gsp_rpc *)mqe->data;
 
 	if (WARN_ON(rpc->length > max_rpc_size))
-		return NULL;
+		return ERR_PTR(-EINVAL);
 
 	buf = kvmalloc(max_t(u32, rpc->length, expected), GFP_KERNEL);
 	if (!buf)
@@ -488,7 +488,7 @@ r535_gsp_msg_recv(struct nvkm_gsp *gsp, int fn, u32 gsp_rpc_len)
 		}
 
 		r535_gsp_msg_done(gsp, rpc);
-		return NULL;
+		return ERR_PTR(-EIO);
 	}
 
 	for (i = 0; i < gsp->msgq.ntfy_nr; i++) {
@@ -512,7 +512,7 @@ r535_gsp_msg_recv(struct nvkm_gsp *gsp, int fn, u32 gsp_rpc_len)
 	if (*gsp->msgq.rptr != *gsp->msgq.wptr)
 		goto retry;
 
-	return NULL;
+	return ERR_PTR(-EIO);
 }
 
 int
-- 
2.25.1

