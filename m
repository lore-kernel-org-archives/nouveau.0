Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2058C5DF94
	for <nouveau@archiver.kernel.org>; Mon, 24 Aug 2026 14:30:19 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 88EC710E565;
	Mon, 24 Aug 2026 14:30:19 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 6F5B447B68;
	Mon, 24 Aug 2026 14:13:35 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1787580815;
 b=w4JzC8A7eWNjbr3jgXAHUzRS6ox56pqYdKyy1+NrfzpUMHUeo26ieBbGy/DH8GGuLnjcn
 gjkPTCD/+HLenHaJN6ic0bUq1lwl9lgo4MssLL4YieIE6jbqwwYI0b/wku1Ge6LIQdCqiqt
 SH7QY8F0xlDYuMxSIxmuYMqHtzmCQJadLu7S3Id5vA4y4bUXTUCCTjuyJ9xmaC8jjtcOZ7C
 w8N6JdN9KejY3oRnTyiSBAmzvwb5sosqjSOIL3u5nJDQimOPS66TwZClUUJGFkrVKoJdbTG
 b0dFfJGQ/Vs8xrprH84oqtcMVtT8tEqEv9O5Pvn8f8BTBBo+gd/Gho2TpJWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1787580815; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=zbXhjT1Uv8v8Rb/dF/caXxtPsmwUejee903iXoKcBpE=;
 b=tXlffLfyVbHJkLK05pf4/WzG4TeOAgM69WMIVDspuZLu329EYNeXpJj2vGLeSEJFBJ6Au
 ENAUL3MbhGXEeoj8Q5R6R89YrizD9fQmOGKH0wNK+/77DMw4p1bnmBFsbtMlQ4oELMcY+Vz
 TVQiMJ/OnYI80Yc3GxrIV2xSmYtYBBg2oFv/Wue74xyVzhoi+Sh8ubbVa+E1F4nQ2cYjuQ/
 xOzJARdcgRb2qI2U8kwvHfLndkpyLu4eqSoeZtNch515VRulVzpFcG5kbM5fbYLSTeQLL35
 b8qMfWufFjWUEJQJE7miqx461vuPQwcTX09tSXSq9vuzjWJ3SI+aKbt5EDYQ==
ARC-Authentication-Results: i=1; mail.freedesktop.org; dkim=fail;
  arc=none (Message is not ARC signed);
  dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=fail;
 arc=none (Message is not ARC signed); dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 694BF406A9
	for <nouveau@lists.freedesktop.org>; Mon, 24 Aug 2026 08:48:30 +0000 (UTC)
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C53AF10E24F;
	Mon, 24 Aug 2026 09:05:12 +0000 (UTC)
X-UUID: e795010e9f9a11f19a56ed5b684f684d-20260824
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:4b0dc80c-51b4-4b0b-95e6-2555655507c5,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:7db8b62,CLOUDID:01a2156ffd7c7dfc5acc72dd072014e6,BulkI
	D:nil,BulkQuantity:0,SF:102|136|865|898,TC:nil,Content:0|15|50,EDM:5|-100,
	IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:
	0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: e795010e9f9a11f19a56ed5b684f684d-20260824
X-User: liupeng01@kylinos.cn
Received: from t14 [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <liupeng01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1125191586; Mon, 24 Aug 2026 17:05:08 +0800
From: liupeng <liupeng01@kylinos.cn>
To: Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Guenter Roeck <linux@roeck-us.net>,
	dri-devel@lists.freedesktop.org (open list:DRM DRIVER FOR NVIDIA
 GEFORCE/QUADRO GPUS),
	nouveau@lists.freedesktop.org (open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO
 GPUS),
	linux-kernel@vger.kernel.org (open list),
	linux-hwmon@vger.kernel.org (open list:HARDWARE
 MONITORING:Keyword:(devm_)?hwmon_device_(un)?register(|_with_groups|_with_info))
Subject: [PATCH] drm/nouveau: Fix memory leaks in debugfs and hwmon init error
 paths
Date: Mon, 24 Aug 2026 17:05:04 +0800
Message-ID: <20260824090505.49913-1-liupeng01@kylinos.cn>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: liupeng01@kylinos.cn
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: BEGJPNWK7QDNALB6NQUTNQXLOAOE67EU
X-Message-ID-Hash: BEGJPNWK7QDNALB6NQUTNQXLOAOE67EU
X-Mailman-Approved-At: Mon, 24 Aug 2026 14:13:32 +0000
CC: liupeng <liupeng01@kylinos.cn>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/BEGJPNWK7QDNALB6NQUTNQXLOAOE67EU/>
Archived-At: 
 <https://lore.freedesktop.org/20260824090505.49913-1-liupeng01@kylinos.cn/>
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

Signed-off-by: liupeng <liupeng01@kylinos.cn>
---
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

