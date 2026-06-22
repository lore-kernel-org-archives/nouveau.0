Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC3EBCDB471
	for <nouveau@archiver.kernel.org>; Mon, 22 Jun 2026 02:12:27 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id EE7BF10E442;
	Mon, 22 Jun 2026 02:12:23 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id B50FB46BCC;
	Mon, 22 Jun 2026 01:58:00 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1782093480;
 b=uLnaP6xeD4PQZ/XWSi1kW/p8TqrWv2q/O8hH4LSlEcqhJX8x9hlO0KSVgnzeQJRjjGbLR
 Qi2ftRExQTJq+pVinAMDl4Pmsr+FbU8yimFBSUXu7c8Ju6r8qovbbqD3ze/KHdn+r1Rzfo+
 h/BxDzu99YvPIo7Y97EDL8IXf8kiesOBGZ84KTTD4zT/U4UwowqnjiHZ2cyt083vmJXusxR
 fX8SaemfwFKgYBt84hurbO65ib6fKdR00gaji4JemVTSqh+oFF/UFjMuCP4pnAUKrzObTzH
 mOeN07hX1hNBy8sZ6v/JI1L++MRO8FiwaozJUyAQdT3lDp7Z9wk4Q5YtCUeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1782093480; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=0lIKIh9ITL5wJ4Q9ZSRGT/5+hPs/m2EIQ5nlEvefaVM=;
 b=w631wbQvctOlpGXUmHFd0+PHyho6lhUrJrz4VL8vjD6fzKtdcUIWSQIpsiEmQk7jNChO4
 Xvbeo1GPeRrclCWsXaRccy07hlqCGfGSo9PfSfHPVrF++v267UGfPalEM0MngPZKMuQvCiE
 FMLrwHbD7MnW9wRLNfvA+vv2f5F9kEXBsP2vUajQB14qOyMWSYXbur8xmvtIinKjAMszrlD
 jPJJciXjQAGW3ESNOxyrtH6V1+V7DIglbrVyhwvVEIhsaehNimyCOe9W8HY4rBFJjoI1iwn
 7D7GBvQBShMETQlD3bzsGHbMHw09XfuRx9TJA7mhx5cJXa6N+FIkoaJIypJg==
ARC-Authentication-Results: i=1; mail.freedesktop.org; dkim=fail;
  arc=none (Message is not ARC signed);
  dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=fail;
 arc=none (Message is not ARC signed); dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 7349C46BBF
	for <nouveau@lists.freedesktop.org>; Mon, 22 Jun 2026 01:57:58 +0000 (UTC)
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	by gabe.freedesktop.org (Postfix) with ESMTPS id CF55E10E41F;
	Mon, 22 Jun 2026 02:12:19 +0000 (UTC)
X-UUID: c9b39a206ddf11f1aa26b74ffac11d73-20260622
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:7e3ba9c8-7ec6-4c9e-8374-65bb716e5af1,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:d611c3e1fbf2b713d743ae3fe90e1cbd,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|850|865|898,TC:nil,Content:0|1
	5|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: c9b39a206ddf11f1aa26b74ffac11d73-20260622
X-User: zenghongling@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zenghongling@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 212988082; Mon, 22 Jun 2026 10:12:15 +0800
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
Subject: [PATCH v3 3/5] nouveau/gsp/rm/alloc: Cleanup IS_ERR_OR_NULL usage
Date: Mon, 22 Jun 2026 10:12:05 +0800
Message-Id: <20260622021207.14764-4-zenghongling@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260622021207.14764-1-zenghongling@kylinos.cn>
References: <20260622021207.14764-1-zenghongling@kylinos.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: DF7VHK4WDR3PR5PLXYSLPNWPGNMDBTAN
X-Message-ID-Hash: DF7VHK4WDR3PR5PLXYSLPNWPGNMDBTAN
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/DF7VHK4WDR3PR5PLXYSLPNWPGNMDBTAN/>
Archived-At: 
 <https://lore.freedesktop.org/20260622021207.14764-4-zenghongling@kylinos.cn/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

r535_gsp_rpc_rm_free() calls nvkm_gsp_rpc_get() which never returns
NULL, only valid pointers or error pointers. Clean up by using IS_ERR()
instead, matching the actual return value contract.

Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/alloc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/alloc.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/alloc.c
index 46e3a29f2ad7..c9f86c0e9b25 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/alloc.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/alloc.c
@@ -35,7 +35,7 @@ r535_gsp_rpc_rm_free(struct nvkm_gsp_object *object)
 		   client->object.handle, object->handle);
 
 	rpc = nvkm_gsp_rpc_get(gsp, NV_VGPU_MSG_FUNCTION_FREE, sizeof(*rpc));
-	if (WARN_ON(IS_ERR_OR_NULL(rpc)))
+	if (WARN_ON(IS_ERR(rpc)))
 		return -EIO;
 
 	rpc->params.hRoot = client->object.handle;
-- 
2.25.1

