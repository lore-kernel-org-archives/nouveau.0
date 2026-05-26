Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D75F1CD5BB1
	for <nouveau@archiver.kernel.org>; Tue, 26 May 2026 15:09:32 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9320C10E506;
	Tue, 26 May 2026 15:09:31 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 036884644C;
	Tue, 26 May 2026 14:56:07 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1779807366;
 b=zxxbB/JInEuM1I+reFjVT4+dD3MxT8X42N9/wOo/Ry+7CMdYnkGeatDw7npVsAaKO5Alq
 iDKgRy1SIjAivGLoQkkiqsDumwZL6FiIToGF368B7YUeulL8S8gC44FGFzaiUbZ+cMfqcKx
 jW7fIsxFuGISBFdB7EKpy8Yw/UFSYn+MmY4IKa9wezirT3NYKuqhgk6OdeNv0HzDas8ajkG
 fXsBjb8BVoxHipaYf4VJbWC1wGfXTqM2GjzVTDlzNj8TdAxzDyY7alzqmAOVoWIofcKkIrM
 KGZWZSuXJj3CHBqrk9/CSnBSInuunATIkMqQnOCUTRVYfGuJj5BugjPqhLLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1779807366; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=dDRPmRfM2iDmd+BnBQqZ07gJLCLMMaZVCkLxYiEXn9k=;
 b=G7mFYN1u4Q3qFs7R+942Jtv9L8RIuXqpi52Xkn98epCFCU5WyNn+ojE3uUfcr/P6W/q4Y
 Pvu3fq8DCulzyPBCotHO/YRYYeLF1LTaM6/eRHtwiMRTYn9Omrbtrqh0ky9K8zf9GJ935W7
 Pd448S8BCJNBoSbYFQECMlDMKoYXC1HJ4pUdU/GC6yn4APAeQWkYhfR45uf8zqtRCOLhWGM
 de0PlAZ4IMUMTZJtrRnNdjlOShdaG74/Swzgj/AWOJwwvSoDZv9Kd2eQpQ3/oFg4NJzg4hw
 Ok/1SAUzVaDQLY8ZOArs8xt8RDidf8ti1EmOSta9kZNUQWZX5mn8NYc9RBRA==
ARC-Authentication-Results: i=1; mail.freedesktop.org; dkim=fail;
  arc=none (Message is not ARC signed);
  dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=fail;
 arc=none (Message is not ARC signed); dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 9DA1A4150B
	for <nouveau@lists.freedesktop.org>; Tue, 26 May 2026 01:34:09 +0000 (UTC)
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 190AD10E432;
	Tue, 26 May 2026 01:47:31 +0000 (UTC)
X-UUID: d8dd33c658a411f1aa26b74ffac11d73-20260526
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:f2a4c120-bc7d-45c2-ad90-49a96698b607,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:e7bac3a,CLOUDID:2f75ae6802a4740e16f1367a3d665be0,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850|865|898,TC:nil,Content:0|15|50,E
	DM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA
	:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: d8dd33c658a411f1aa26b74ffac11d73-20260526
X-User: zenghongling@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zenghongling@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 830269961; Tue, 26 May 2026 09:47:26 +0800
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
Subject: [PATCH] nouveau/gsp: fix NULL pointer dereference in r535 nvenc/ofs
 alloc
Date: Tue, 26 May 2026 09:47:21 +0800
Message-Id: <20260526014721.13299-1-zenghongling@kylinos.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: zenghongling@kylinos.cn
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: Z66HSNIKVWNWOGTTDBH2RIDFVV5SUIUK
X-Message-ID-Hash: Z66HSNIKVWNWOGTTDBH2RIDFVV5SUIUK
X-Mailman-Approved-At: Tue, 26 May 2026 14:56:03 +0000
CC: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 zhongling0719@126.com, Hongling Zeng <zenghongling@kylinos.cn>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/Z66HSNIKVWNWOGTTDBH2RIDFVV5SUIUK/>
Archived-At: 
 <https://lore.freedesktop.org/20260526014721.13299-1-zenghongling@kylinos.cn/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

nvkm_gsp_rm_alloc_get() can return NULL as well as error pointers.
The current code only checks for error pointers with IS_ERR(), which
would lead to a NULL pointer dereference if NULL is returned.

Fix by using IS_ERR_OR_NULL() instead of IS_ERR(), matching the
pattern used in nvkm_gsp_rm_alloc().

Fixes: 7c2d25f1e408 ("drm/nouveau/gsp: add common code for engines/engine objects")
Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvenc.c | 4 ++--
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/ofa.c   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvenc.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvenc.c
index acb3ce8bb9de..a67cc65abfcf 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvenc.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvenc.c
@@ -30,8 +30,8 @@ r535_nvenc_alloc(struct nvkm_gsp_object *chan, u32 handle, u32 class, int inst,
 	NV_MSENC_ALLOCATION_PARAMETERS *args;
 
 	args = nvkm_gsp_rm_alloc_get(chan, handle, class, sizeof(*args), nvenc);
-	if (WARN_ON(IS_ERR(args)))
-		return PTR_ERR(args);
+	if (WARN_ON(IS_ERR_OR_NULL(args)))
+		return args ? PTR_ERR(args) : -EIO;
 
 	args->size = sizeof(*args);
 	args->engineInstance = inst;
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/ofa.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/ofa.c
index 2156808cba4f..6d3b554108f9 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/ofa.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/ofa.c
@@ -30,8 +30,8 @@ r535_ofa_alloc(struct nvkm_gsp_object *chan, u32 handle, u32 class, int inst,
 	NV_OFA_ALLOCATION_PARAMETERS *args;
 
 	args = nvkm_gsp_rm_alloc_get(chan, handle, class, sizeof(*args), ofa);
-	if (WARN_ON(IS_ERR(args)))
-		return PTR_ERR(args);
+	if (WARN_ON(IS_ERR_OR_NULL(args)))
+		return args ? PTR_ERR(args) : -EIO;
 
 	args->size = sizeof(*args);
 
-- 
2.25.1

