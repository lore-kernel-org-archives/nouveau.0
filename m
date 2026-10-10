Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F904CA9EBD
	for <nouveau@archiver.kernel.org>; Sat, 10 Oct 2026 02:20:22 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id EBE0F10E8C6;
	Sat, 10 Oct 2026 02:20:19 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id BB66748A4D;
	Sat, 10 Oct 2026 02:01:52 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1791597712;
 b=OuQkilYRcVMGOEYDQ0qmSnn15MmPUA/L3XKrhrSGAK2E0Z0PJg0aKtR26Xsw71oJ49Mq9
 cozJMlCYT4arytGAqVjSrT408fXwwmrvuMtHOtb8gTX6Z0R7QxN6bhzDDLLUYBdWjKbrZrL
 3Kz+UUOEmtSZ18mZsWfe+pm4JTHzSWAKB63K2Biy3oA2Cbea067okOlsivTfe6IXmtADhW1
 9MkH6CJ2Gis8xkmAXqQID+uQtcy/sPMNNS3DnH/EiPTpGoTIhUgC0Bxoer8dGpOUTWG0m74
 Id5LReb+OO9tY1X9qnu2DNacB15CBrAQTwQwaxvo811yN8REJnbDg1RbwRlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1791597712; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=BrHM00jJqjlixs+9LNC6OCdXbCO9i/SFI8llaLZVoKg=;
 b=jh6eHOA3zb6qjY9lT6Fd0R9c0Ub1JuXQBLg+RvBGKEmNcy3b4AjkqqnkNPDmsMcRoLd4d
 nnHZboCf2EHAHEbZY3yeJ1KQaoqRG9cLTsxN5X/a6o3x/gYDCN8u7RZ+rPgIPwmApfnUDdz
 LUI3iESDDnctcdDXuQMXzUexOfL0fCY7FVpMtkrvndsF3RmT8eooatz6kQR9aYy+e6EfWu5
 EhbDcTN9nSHwih4OzSYf0zFCfxf466qz+Y1ysoiENZGXKKWxZ+apRbVUv56h/wUgakKku7l
 ZWut/4ZHwd8psG02YL6dr3UDh2KbpXdFXt+14xDS71pvGPdKBC93ZFVZx7Xw==
ARC-Authentication-Results: i=1; mail.freedesktop.org; dkim=fail;
  arc=none (Message is not ARC signed);
  dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=fail;
 arc=none (Message is not ARC signed); dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id EFB6548505
	for <nouveau@lists.freedesktop.org>; Sat, 10 Oct 2026 02:01:49 +0000 (UTC)
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3EB2710E558;
	Sat, 10 Oct 2026 02:20:15 +0000 (UTC)
X-UUID: 1e4b8fdac45111f19a56ed5b684f684d-20261010
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:7ba970b6-21d7-47f7-8d78-4a268cef4054,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:7db8b62,CLOUDID:11d5f0bd31c19bf17d04c2dc1443c1ac,BulkI
	D:nil,BulkQuantity:0,SF:81|82|102|136|865|898,TC:nil,Content:0|15|50|99,ED
	M:5|-100,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,
	OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 1e4b8fdac45111f19a56ed5b684f684d-20261010
X-User: liupeng01@kylinos.cn
Received: from t14 [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <liupeng01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1682849758; Sat, 10 Oct 2026 10:20:10 +0800
From: liupeng <liupeng01@kylinos.cn>
To: lyude@redhat.com,
	dakr@kernel.org
Subject: [PATCH v4 1/2] drm/nouveau: Fix memory leak in debugfs init error
 path
Date: Sat, 10 Oct 2026 10:20:05 +0800
Message-ID: <20261010022006.28263-1-liupeng01@kylinos.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <b4cd38b48d85298a7a99cf30fbd8cbbdb34a347f.camel@redhat.com>
References: <b4cd38b48d85298a7a99cf30fbd8cbbdb34a347f.camel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: YPL23OYQD2GG2E5T7GPHFTMIMIS7UKM3
X-Message-ID-Hash: YPL23OYQD2GG2E5T7GPHFTMIMIS7UKM3
X-MailFrom: liupeng01@kylinos.cn
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: maarten.lankhorst@linux.intel.com, mripard@kernel.org, simona@ffwll.ch,
 linux@roeck-us.net, nouveau@karolherbst.de, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-hwmon@vger.kernel.org, stable@vger.kernel.org,
 liupeng <liupeng01@kylinos.cn>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/YPL23OYQD2GG2E5T7GPHFTMIMIS7UKM3/>
Archived-At: 
 <https://lore.freedesktop.org/20261010022006.28263-1-liupeng01@kylinos.cn/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

In nouveau_debugfs_init(), if nvif_object_ctor() fails, the previously
allocated drm->debugfs is leaked because the function returns the
error code directly.

Fix this by freeing the allocated memory and clearing the pointer on
the error path.

Fixes: b126a200e9db ("drm/nouveau/debugfs: we need a ctrl object for debugfs")
Cc: stable@vger.kernel.org
Reviewed-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: liupeng <liupeng01@kylinos.cn>
---
Changes in v4:
- Split the debugfs and hwmon fixes into two separate patches as
  requested by Danilo, since they are unrelated fixes with different
  Fixes: tags. No functional change to this fix.

 drivers/gpu/drm/nouveau/nouveau_debugfs.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_debugfs.c b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
index 47d5579c568d..338421e52f69 100644
--- a/drivers/gpu/drm/nouveau/nouveau_debugfs.c
+++ b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
@@ -295,13 +295,21 @@ nouveau_drm_debugfs_init(struct drm_minor *minor)
 int
 nouveau_debugfs_init(struct nouveau_drm *drm)
 {
+	int ret;
+
 	drm->debugfs = kzalloc_obj(*drm->debugfs);
 	if (!drm->debugfs)
 		return -ENOMEM;
 
-	return nvif_object_ctor(&drm->client.device.object, "debugfsCtrl", 0,
-				NVIF_CLASS_CONTROL, NULL, 0,
-				&drm->debugfs->ctrl);
+	ret = nvif_object_ctor(&drm->client.device.object, "debugfsCtrl", 0,
+			       NVIF_CLASS_CONTROL, NULL, 0,
+			       &drm->debugfs->ctrl);
+	if (ret) {
+		kfree(drm->debugfs);
+		drm->debugfs = NULL;
+	}
+
+	return ret;
 }
 
 void
-- 
2.53.0

