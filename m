Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4E9DCDB46F
	for <nouveau@archiver.kernel.org>; Mon, 22 Jun 2026 02:12:26 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6C9F410E43A;
	Mon, 22 Jun 2026 02:12:22 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 31FC646BC4;
	Mon, 22 Jun 2026 01:57:59 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1782093479;
 b=QZ0dFNSXtl7hNOc5t7xYnYZT0GnmRggEZU5W+fKd7yhswLFsmVgWynelT82jPtCo8URVR
 Il7eWqojohhmz6HkWaG4WiVf35IQHqvEvWRWQ67KxtXyLv+0F1bHwMQXRZHeH7lV9TxZ497
 1zs83hpI7d8AXGzDBnZCAOjfaYe6yhCgb7UfNUh6laYfrVM9rIOBrCpZVd85K7Px5nSfvV1
 Q60J1fHcwEds5sT0YxjVeS5iUj/BU4m9LgcNCHTHS3wNfsVHfL7shRulTqSHxw6TI+svUHt
 Pa6QA1k3SW7H3RpjHqC5XhXMfcrzFHSQM9O/Go3xQoY/ZJc8cBFpVH46dtqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1782093479; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=ANNTzb2CKGOF7wgNu5biLvK+aWQN6CHHGad1qMD20g0=;
 b=rV0bM6xL6X7KkKqXl93eEB8S8I0iYkhubqeFDhuZhjuYz5QkX4v8whQvx8ZiePHQyvHkI
 cYscwqyswECy1gAZUdB1pTWlfKCQBbxghxZZaDAVXmzAC+2tU2cUZeOzvppUO+sp/x3IP/A
 gwAid0piAAPe0GRtotjTjJ4pNtEgzjAPirqzOnkrycYY/17U5pnFlGWSyZyYj0thLKaynrP
 3ohetNinrXAzkKK4omaLMB2HHlmd7Qsr/airDJeosahy7ZGrth89scw/Np3Ry0ZGTsFaq4D
 F0ox9Y60HZArafxNnAzeLCHO86EJqv5pSvlLY+zNHuZA8EmwUu+J6k+it+Ew==
ARC-Authentication-Results: i=1; mail.freedesktop.org; dkim=fail;
  arc=none (Message is not ARC signed);
  dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=fail;
 arc=none (Message is not ARC signed); dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 29EC0466F2
	for <nouveau@lists.freedesktop.org>; Mon, 22 Jun 2026 01:57:56 +0000 (UTC)
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 924D710E424;
	Mon, 22 Jun 2026 02:12:18 +0000 (UTC)
X-UUID: c92e33806ddf11f1aa26b74ffac11d73-20260622
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:c9c37de0-de34-4628-9913-be07c55ad3e3,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:3ccdedd83cde1d240e9c21782f5b8b54,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|850|865|898,TC:nil,Content:0|1
	5|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: c92e33806ddf11f1aa26b74ffac11d73-20260622
X-User: zenghongling@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zenghongling@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 325204967; Mon, 22 Jun 2026 10:12:14 +0800
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
Subject: [PATCH v3 2/5] nouveau/gsp/rpc: Cleanup incorrect IS_ERR_OR_NULL in
  rpc.c
Date: Mon, 22 Jun 2026 10:12:04 +0800
Message-Id: <20260622021207.14764-3-zenghongling@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260622021207.14764-1-zenghongling@kylinos.cn>
References: <20260622021207.14764-1-zenghongling@kylinos.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: W3H4LJEGB7JSW6BP2P4H6G55HHCMHFSM
X-Message-ID-Hash: W3H4LJEGB7JSW6BP2P4H6G55HHCMHFSM
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/W3H4LJEGB7JSW6BP2P4H6G55HHCMHFSM/>
Archived-At: 
 <https://lore.freedesktop.org/20260622021207.14764-3-zenghongling@kylinos.cn/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Clean up incorrect IS_ERR_OR_NULL() usage for functions that never
return NULL:
- r535_gsp_msgq_peek() never returns NULL
- r535_gsp_msgq_recv_one_elem() never returns NULL

These functions should be checked with IS_ERR() instead.

Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rpc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rpc.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rpc.c
index 1b125dcb279a..f6d54c4c939d 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rpc.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rpc.c
@@ -350,7 +350,7 @@ r535_gsp_msgq_recv(struct nvkm_gsp *gsp, u32 gsp_rpc_len, int *retries)
 		u32 size;
 
 		rpc = r535_gsp_msgq_peek(gsp, sizeof(*rpc), info.retries);
-		if (IS_ERR_OR_NULL(rpc)) {
+		if (IS_ERR(rpc)) {
 			kvfree(buf);
 			return rpc;
 		}
@@ -359,7 +359,7 @@ r535_gsp_msgq_recv(struct nvkm_gsp *gsp, u32 gsp_rpc_len, int *retries)
 		info.continuation = true;
 
 		rpc = r535_gsp_msgq_recv_one_elem(gsp, &info);
-		if (IS_ERR_OR_NULL(rpc)) {
+		if (IS_ERR(rpc)) {
 			kvfree(buf);
 			return rpc;
 		}
@@ -499,7 +499,7 @@ r535_gsp_msg_recv(struct nvkm_gsp *gsp, int fn, u32 gsp_rpc_len)
 
 retry:
 	rpc = r535_gsp_msgq_peek(gsp, sizeof(*rpc), &retries);
-	if (IS_ERR_OR_NULL(rpc))
+	if (IS_ERR(rpc))
 		return rpc;
 
 	rpc = r535_gsp_msgq_recv(gsp, gsp_rpc_len, &retries);
-- 
2.25.1

