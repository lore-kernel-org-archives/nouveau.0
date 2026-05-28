Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59EDFCD6E45
	for <nouveau@archiver.kernel.org>; Thu, 28 May 2026 06:25:11 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id BF38310EC8E;
	Thu, 28 May 2026 06:25:07 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 945CF46579;
	Thu, 28 May 2026 06:11:39 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1779948699;
 b=hMcB5YFA8hWuGWjoV7ErhJ4hShnhVZsnXGQGtMlO+xONFRQnt0gZp3jNCObIBvcFsU5yQ
 fj19nNEVBFkybbGUa9IwOnXxpXG/7UD1JPlLknFULn1xPDGKptcBo/SVbpZOYaq10OCT4PP
 NMG6PmWd1lhzH3QJJPCNbsXGfk3v30sFxRJ6nAS1dCATYRICrJP80aYi7U73TNKw4tjKkvD
 OTbViqgiD2X89qy3w6nWi3G2MkBimjyxRQAs+PvpUyw4NOeJgE0TPHUDWqShmd+MtOE7o2g
 TRsRB8aytxapOyEmN+cgoDowREmBIO4XtIN8RljogZSXlIvVnZV/1huwoEjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1779948699; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=BzMDv/SuF0fju0rdPSsFa9CqecjBAWeaTWdpk1UTmkQ=;
 b=N8O14Nw3eiRzGCi2CGEgs6b26yt96t5bLawvPJ3Lvh3ckfI4LnYooC3Uh1DIpGwbfiF4u
 rQzQsBFJJ7XlcOzm9vBAFL1Da3f7JfGuKkFYGscGF1QYM224CMlfnep+lCKqy3uy2siRu51
 1vihH9kmDXmpaZt/GXilo5cQSVBA6Q1nnC/QhouaqIZ+hDz2STAQ3145CBegFL5RN2RDbSq
 3uYXfTeRVle0nbEoHfNwBpynEz99/EN3DzxApuwlhlRxfjMhcLkCS597eSUjW1pVRZwen7k
 Vu1vfAReSNmDtV8+eHAXBI+Mn+ZG7Z8Nb8fPwXHk8zuao2tCOThUq1EZ98Cg==
ARC-Authentication-Results: i=1; mail.freedesktop.org; dkim=fail;
  arc=none (Message is not ARC signed);
  dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=fail;
 arc=none (Message is not ARC signed); dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id C91A846463
	for <nouveau@lists.freedesktop.org>; Thu, 28 May 2026 06:11:35 +0000 (UTC)
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2000B10EC84;
	Thu, 28 May 2026 06:25:02 +0000 (UTC)
X-UUID: f2266ea05a5d11f1aa26b74ffac11d73-20260528
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:4befdb18-76bb-4b8b-82de-607da614dfa9,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:080c9840ca34efde3dffacb94ac4ce97,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|850|865|898,TC:nil,Content:0|1
	5|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: f2266ea05a5d11f1aa26b74ffac11d73-20260528
X-User: zenghongling@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zenghongling@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1984080621; Thu, 28 May 2026 14:24:56 +0800
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
Subject: [PATCH 1/5] nouveau/gsp: cleanup IS_ERR_OR_NULL in rm_alloc functions
Date: Thu, 28 May 2026 14:24:47 +0800
Message-Id: <20260528062451.54107-2-zenghongling@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260528062451.54107-1-zenghongling@kylinos.cn>
References: <20260528062451.54107-1-zenghongling@kylinos.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: NXESKB3ZTOE5YGJW733XSD4AQWQSW5WY
X-Message-ID-Hash: NXESKB3ZTOE5YGJW733XSD4AQWQSW5WY
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/NXESKB3ZTOE5YGJW733XSD4AQWQSW5WY/>
Archived-At: 
 <https://lore.freedesktop.org/20260528062451.54107-2-zenghongling@kylinos.cn/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

The underlying functions already return error pointers, so checking for
NULL with IS_ERR_OR_NULL() is redundant. Use IS_ERR() instead.

This affects:
- nvkm_gsp_rm_alloc_get()
- nvkm_gsp_rm_alloc()

Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>
---
 drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
index 64fed208e4cf..ab2bd88eebce 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
@@ -373,7 +373,7 @@ nvkm_gsp_rm_alloc_get(struct nvkm_gsp_object *parent, u32 handle, u32 oclass, u3
 	object->handle = handle;
 
 	argv = gsp->rm->api->alloc->get(object, oclass, argc);
-	if (IS_ERR_OR_NULL(argv)) {
+	if (IS_ERR(argv)) {
 		object->client = NULL;
 		return argv;
 	}
@@ -415,8 +415,8 @@ nvkm_gsp_rm_alloc(struct nvkm_gsp_object *parent, u32 handle, u32 oclass, u32 ar
 {
 	void *argv = nvkm_gsp_rm_alloc_get(parent, handle, oclass, argc, object);
 
-	if (IS_ERR_OR_NULL(argv))
-		return argv ? PTR_ERR(argv) : -EIO;
+	if (IS_ERR(argv))
+		return PTR_ERR(argv);
 
 	return nvkm_gsp_rm_alloc_wr(object, argv);
 }
-- 
2.25.1

