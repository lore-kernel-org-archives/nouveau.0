Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DA15CD6E45
	for <nouveau@archiver.kernel.org>; Fri, 29 May 2026 04:43:53 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C9A3F10F88D;
	Fri, 29 May 2026 04:43:49 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 81C8B4669A;
	Fri, 29 May 2026 04:30:19 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1780029019;
 b=DaYLmufNbGwfIFIYxb1Ey8ccCLXQq3JVpLz7CB1sOr7dD5ucd20OksVtKnh0Xc7kF0/kF
 XcOlrQVW+D8snoKdQ5trU5+LdQ7nYZG1VA+wqY2R/AMNKAYttnQUkFJkTkZIKq9Gb6Hd6gA
 QouZAOiVBLftD2xoBp+u45CUqUtUkhM5IOwnbCo1ss7fN530ognXQ1FdfO4p5BFzT9fTHak
 4B6yV7Vmvaoai5ye5iJiICqVfD5d2vuZiS9A9jFBHsTbd8j/h/UcTZYHWXZeEcV6DeYyXzF
 gYRTNHffC0l8bNzlzgk7ZiOwWEQM0xvhm0U4Jfxk1fi9BP0OFH6fk7N+6Rag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1780029019; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=EnjSg5LzQNRG2NAGGVL6FNq9TiU/00xWlmLjN6X/aUU=;
 b=sjQuz+a7I+EWkgn2NT55XPLHIIyMAb8WPXzNNrQIGAf+CnRhlPsAedN0vPQtZQN5dR8Om
 bEX9hwz6n002YJwlbUb0eqnl6p3eyW/DnvZvtLQsV+4grlzo9z9ezuICG3Q0FaBHeHS8etY
 buMjroIa9Ui5Xn/ZambGsCmDnbc0bQih9TnVThEiDsrD84yB2JozKZ/f2+P8EAUV01Dd5Rq
 tio8KIBFkXp3P9nPnYmc0IGUUfPrEUmTYkXe4w2q21vLAvEsJ2dsIT0FqVgDrpIqR8rg6iN
 pbUonAsugEGiPhrdUDcTKXK7Bs7d4tW8TxxRIIbP6J+ogi5JkpVfzBH0lL7Q==
ARC-Authentication-Results: i=1; mail.freedesktop.org; dkim=fail;
  arc=none (Message is not ARC signed);
  dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=fail;
 arc=none (Message is not ARC signed); dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 0DEC746598
	for <nouveau@lists.freedesktop.org>; Fri, 29 May 2026 04:30:16 +0000 (UTC)
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5D79E10F87C;
	Fri, 29 May 2026 04:43:45 +0000 (UTC)
X-UUID: f6470b005b1811f1aa26b74ffac11d73-20260529
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:a0eb791c-a88d-4a94-8bd8-c1d78bb7ded7,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:fb736539e9216e15ebf69ba07d0bb577,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|850|865|898,TC:nil,Content:0|1
	5|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: f6470b005b1811f1aa26b74ffac11d73-20260529
X-User: zenghongling@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zenghongling@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1240982023; Fri, 29 May 2026 12:43:39 +0800
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
Subject: [PATCH 3/7] nouveau/gsp: cleanup IS_ERR_OR_NULL in rpc_rd
Date: Fri, 29 May 2026 12:43:26 +0800
Message-Id: <20260529044330.96832-4-zenghongling@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260529044330.96832-1-zenghongling@kylinos.cn>
References: <20260529044330.96832-1-zenghongling@kylinos.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: C56SWGL733OJIYCRRU5SSZEZGAH5ZGE6
X-Message-ID-Hash: C56SWGL733OJIYCRRU5SSZEZGAH5ZGE6
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/C56SWGL733OJIYCRRU5SSZEZGAH5ZGE6/>
Archived-At: 
 <https://lore.freedesktop.org/20260529044330.96832-4-zenghongling@kylinos.cn/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

The underlying nvkm_gsp_rpc_get() function returns error pointers,
not NULL. This is now documented in the function's kernel-doc comment
(added in previous patch).
Therefore, checking for NULL with IS_ERR_OR_NULL() is redundant and
IS_ERR() is sufficient.

This affects nvkm_gsp_rpc_rd().

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

