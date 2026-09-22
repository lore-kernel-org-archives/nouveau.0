Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC77BC982FE
	for <nouveau@archiver.kernel.org>; Tue, 22 Sep 2026 04:41:02 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 559A410E92F;
	Tue, 22 Sep 2026 04:40:59 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id A1732484FF;
	Tue, 22 Sep 2026 04:23:11 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1790050991;
 b=CobuuOneLAOSIyT7c40Q9om9Xd/OreZz2zn9pzlCjF7xzwQjz8lTgp6NSzssTzZ+HjsUJ
 WBbeqiVtzxQBizYTX5auu434S/hWnfRBZxi0N+KiuXwgwAlaYb5i3m/jnpCteer/qfIxy9h
 n66JG7x3VcbvnBx/1GiDaK1RhTVNt5rmEYdlNrBIH2911DQ2AJUm6DxYGLIyo1xi2KiyYps
 MgIclvc9dH106x2kQYPSBeS8PQXdj3UYgB9cFrrjWEZmfFUWzzUT0u8p7gPs5mBKnV0DoWl
 cioRNY49peWe694DKRzFI+aKVCNExpXQjV/r+hHKwfYxzRHEMuekHXSm5oBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1790050991; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=MHA6tWZCW9VBLrwjBD+6Eu0qi2QhP61GBy54kREIAio=;
 b=NO7FmMNaWJjZX4rZ31xXZ7TXtN9uHhp7It5Wgmg3B3f5kH5k89EBDETWyWozwc//ksAWG
 lYPALxQS0X5WehHz6q3GhQ3c8skhZFkG1ntjfxNeN6RuHGRgOw+R6LWct7ODVHgI5q24qLy
 uoAs3kDLjJuJHLz5M5gWzF56thV5lbXqX8EIYhnOfxUiuyfrPAEgXvhY/qMZbrytrqlhRlJ
 FvNcsywCfv8EWQp1TWbwffusuTJ5RJKfWj7LMTP3cFM1ZKHJZWcNyPGTf0lHWTAGamA5hDW
 WE3tr/n8MGxWDMt7Ty+/T8KDN+rIq3ZK/ZoIS7qehaOkHqYOd8tlBkrgwKGw==
ARC-Authentication-Results: i=1; mail.freedesktop.org; dkim=fail;
  arc=none (Message is not ARC signed);
  dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=fail;
 arc=none (Message is not ARC signed); dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id AB818473C8
	for <nouveau@lists.freedesktop.org>; Tue, 22 Sep 2026 04:23:08 +0000 (UTC)
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7301F10E0A9;
	Tue, 22 Sep 2026 04:40:53 +0000 (UTC)
X-UUID: c79e001ab63f11f19a56ed5b684f684d-20260922
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:99fb1a02-cb72-41ec-a2b8-5ae9963baf8a,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:7db8b62,CLOUDID:f9727c3a18b6fcdb0b306d270e58f5f1,BulkI
	D:nil,BulkQuantity:0,SF:81|82|102|136|865|898,TC:nil,Content:0|15|50|99,ED
	M:5|-100,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,
	OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: c79e001ab63f11f19a56ed5b684f684d-20260922
X-User: liupeng01@kylinos.cn
Received: from t14 [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <liupeng01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 109217882; Tue, 22 Sep 2026 12:40:47 +0800
From: liupeng <liupeng01@kylinos.cn>
To: lyude@redhat.com,
	dakr@kernel.org
Subject: [PATCH v2] drm/nouveau: Fix memory leaks in debugfs and hwmon init
 error paths
Date: Tue, 22 Sep 2026 12:40:44 +0800
Message-ID: <20260922044044.21442-1-liupeng01@kylinos.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <ff3015a1c4b08088b0638b00670e86d612a27978.camel@redhat.com>
References: <ff3015a1c4b08088b0638b00670e86d612a27978.camel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: SKFO7VPRRTPA3BJGMQU7DZ7MUKCQHIXP
X-Message-ID-Hash: SKFO7VPRRTPA3BJGMQU7DZ7MUKCQHIXP
X-MailFrom: liupeng01@kylinos.cn
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: maarten.lankhorst@linux.intel.com, mripard@kernel.org, simona@ffwll.ch,
 linux@roeck-us.net, nouveau@karolherbst.de, bskeggs@redhat.com,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
 stable@vger.kernel.org, liupeng <liupeng01@kylinos.cn>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/SKFO7VPRRTPA3BJGMQU7DZ7MUKCQHIXP/>
Archived-At: 
 <https://lore.freedesktop.org/20260922044044.21442-1-liupeng01@kylinos.cn/>
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

In nouveau_hwmon_init(), if hwmon_device_register_with_info() fails,
the allocated hwmon structure is leaked because the function returns
the error code directly.

Fix both by freeing the allocated memory and clearing the pointer on
the error paths.

Fixes: b126a200e9db ("drm/nouveau/debugfs: we need a ctrl object for debugfs")
Fixes: b9ed919f1c8f ("drm/nouveau/drm/pm: remove everything except the hwmon interfaces to THERM")
Cc: stable@vger.kernel.org
Signed-off-by: liupeng <liupeng01@kylinos.cn>
---
Changes in v2:
- Add Fixes: tags for the commits that introduced the leaks
- Add Cc: stable@vger.kernel.org for stable backporting

 drivers/gpu/drm/nouveau/nouveau_debugfs.c | 15 ++++++++++++---
 drivers/gpu/drm/nouveau/nouveau_hwmon.c   |  2 ++
 2 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_debugfs.c b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
index 47d5579c568d..88223931f382 100644
--- a/drivers/gpu/drm/nouveau/nouveau_debugfs.c
+++ b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
@@ -295,13 +295,22 @@ nouveau_drm_debugfs_init(struct drm_minor *minor)
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
+		return ret;
+	}
+
+	return 0;
 }
 
 void
diff --git a/drivers/gpu/drm/nouveau/nouveau_hwmon.c b/drivers/gpu/drm/nouveau/nouveau_hwmon.c
index 726397ab035d..ffbe7f542ab0 100644
--- a/drivers/gpu/drm/nouveau/nouveau_hwmon.c
+++ b/drivers/gpu/drm/nouveau/nouveau_hwmon.c
@@ -697,6 +697,8 @@ nouveau_hwmon_init(struct drm_device *dev)
 	if (IS_ERR(hwmon_dev)) {
 		ret = PTR_ERR(hwmon_dev);
 		NV_ERROR(drm, "Unable to register hwmon device: %d\n", ret);
+		drm->hwmon = NULL;
+		kfree(hwmon);
 		return ret;
 	}
 
-- 
2.53.0

