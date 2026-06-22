Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2930CCD98F6
	for <nouveau@archiver.kernel.org>; Mon, 22 Jun 2026 03:55:18 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A154A10E466;
	Mon, 22 Jun 2026 03:55:12 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 3FF5546C11;
	Mon, 22 Jun 2026 03:40:49 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1782099649;
 b=o90UyMg3Y8TQTo3JS6k5icDBgMRWyseiMh9Pff70W2KEK2iAHrZaAB6LjzXuIOrF9I7qh
 Wz9q6j99so6SOjvd31r+W6IKsDv+c6SEo0mOFjULWvxqfpal6VNANcjKZ+CYL/YS7mPZ4mk
 aOEQMf+Txr3qxcz5pgZdl375n486XxLCAtUMp9mAn8j28zXLi42Ne53c1bXyzfOeXdkkyJ7
 bxG+nP9qazVUAs2Uh7NsMEgtzZyuI30JTakjRURJfH1GRC/M85cWb1KeCllil97jWoPe8ef
 1CXX/ch6haU9UqSKnLaE5BsqTESDxk6XljmfRwneMc32ZVoY2p8h0y89nAOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1782099649; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=IK6b6ba54ROD+JFvXgQpGSrF8xItuVVfzQrcudSV+IA=;
 b=iLN7uklZXYY98HNV55hDnfxJmQTyYBOANn8r75w9VMerBoFMqENZ+9GGBRrS6aLkaDHwP
 hexXnFLfQGraUbQ8yZy4aCf7VBUCROff6b8YYDZUvoFEEVJX77k/6usYfrczs8YlQ5IKGI3
 NHnQ9xImDQBu0V8NidtgkRD3SgSYMAEI0Jgpxd/Rgj43wpQxxrdL3bE1rlmVFIZrsLOfgjz
 SN8prpOsqbAtcXs6D/+/SgB0X8JSprKAhrDRqiiysu75ATR5CLtvLyuhH/X6ImNd4GXqC5T
 vpX4ryqT+YisRDxUX3EIxQ1r6mqw5op79w1P2cL83fPqLFAWUaKoyJtcRnGg==
ARC-Authentication-Results: i=1; mail.freedesktop.org; dkim=fail;
  arc=none (Message is not ARC signed);
  dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=fail;
 arc=none (Message is not ARC signed); dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 6B92046C0C
	for <nouveau@lists.freedesktop.org>; Mon, 22 Jun 2026 03:40:46 +0000 (UTC)
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0049110E43E;
	Mon, 22 Jun 2026 03:55:08 +0000 (UTC)
X-UUID: 26865e466dee11f1aa26b74ffac11d73-20260622
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:a32b6330-608b-45c9-96ed-2a2693414b0b,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:c3c2543dbde0fbe9143c8c4ea091d7af,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|850|865|898,TC:nil,Content:0|1
	5|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 26865e466dee11f1aa26b74ffac11d73-20260622
X-User: zenghongling@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zenghongling@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 454079752; Mon, 22 Jun 2026 11:55:04 +0800
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
Subject: [PATCH v4 5/5] nouveau/gsp: Cleanup IS_ERR_OR_NULL in
  nvkm_gsp_rpc_rd()
Date: Mon, 22 Jun 2026 11:54:54 +0800
Message-Id: <20260622035454.28003-6-zenghongling@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260622035454.28003-1-zenghongling@kylinos.cn>
References: <20260622035454.28003-1-zenghongling@kylinos.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: FFJNCPVKT7ECZ7DDBDTRYC4SMHCP6VC6
X-Message-ID-Hash: FFJNCPVKT7ECZ7DDBDTRYC4SMHCP6VC6
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/FFJNCPVKT7ECZ7DDBDTRYC4SMHCP6VC6/>
Archived-At: 
 <https://lore.freedesktop.org/20260622035454.28003-6-zenghongling@kylinos.cn/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

nvkm_gsp_rpc_rd() calls nvkm_gsp_rpc_get() which never returns NULL,
only valid pointers or error pointers. Clean up by using IS_ERR()
instead, matching the actual return value contract.

Note: nvkm_gsp_rpc_push() can return NULL when policy is NOWAIT or
NOSEQ, but nvkm_gsp_rpc_rd() uses RECV policy which expects a reply.
If the RPC fails to get a reply, it should return an error pointer,
not NULL.

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

