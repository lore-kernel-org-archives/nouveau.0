Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15A77CA9EBB
	for <nouveau@archiver.kernel.org>; Fri,  9 Oct 2026 11:52:08 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D844D1120B7;
	Fri,  9 Oct 2026 11:52:06 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 06609489EE;
	Fri,  9 Oct 2026 11:33:41 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1791545620;
 b=HWuAmS5FFSabKF0OSBc5QBWrjVnzLCwvbWWqEVW/ATPvuTcIIBLnFvChcIHK5Z/pE7ILT
 Vn9Kp9FnThniv5cN+L2oKUpEdWZg2NmgclsgGdl+43HOVuxe1nrDnjCHKs90oheDeEJb/wM
 BvDzdl0KDD91VStIrG6n74c6eFqJt4RbgpXuBTc593pVIjkFGAX77HPRHem9g2JNw6+gD/o
 yUzLEmIIAvvfkPlHbRH89x1yAVfclSOu7zz8wy6WWcaXxv194Sr3PSof42t+BPIP9saO016
 JU/ybHDF808w1lfG1FhRI79eRlgkmczJ5u3vQEr3GK+c6Fp91RyH6EjvIFjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1791545620; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=ZRsZi7sHn7Nex9ImTTa7NUY7tLsvdF7CQoZAmljfEtE=;
 b=thCiKnrJBn71Y2daXUyv4VE8A7RqO+ETA+9BA+RbldKx5IxU+i9uQ83dX1u7Ec3MpSsGg
 32iAvgmlZ7i+qxN7OXWqEWtCwsP3o2gxXsh/tsnbTrtAoN8BdJ3meEzA/DHBLdiksLHvUp/
 p6omu3sG3q+tKzYm2tl/dEgxzZt2JMMo9RyCP6ScZKrYEe/UCmy/MuxgpUiZweCPNMRgGxs
 cGgCSVIwTrX8Xuxh5i96oanUAAVrJYvHkURx5Z26uxBc4XWQkvO9bz7OumxNElL9P3a0I6v
 xPjlAUalrb3TUhxTgsqRjfq9oultWYs5EdayPyKaKA7q3PfWSb7fjKAp50ow==
ARC-Authentication-Results: i=1; mail.freedesktop.org; dkim=fail;
  arc=none (Message is not ARC signed);
  dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=fail;
 arc=none (Message is not ARC signed); dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 747ED489E7
	for <nouveau@lists.freedesktop.org>; Fri,  9 Oct 2026 11:33:38 +0000 (UTC)
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6A4F21120A2;
	Fri,  9 Oct 2026 11:52:03 +0000 (UTC)
X-UUID: d2798a54c3d711f19a56ed5b684f684d-20261009
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:c691bcf6-e7dd-4ae4-8863-0b37bebbeaeb,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:7db8b62,CLOUDID:ceed06e202d5449ce84cc283a9489a01,BulkI
	D:nil,BulkQuantity:0,SF:81|82|102|136|865|898,TC:nil,Content:0|15|50|99,ED
	M:5|-100,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,
	OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: d2798a54c3d711f19a56ed5b684f684d-20261009
X-User: liupeng01@kylinos.cn
Received: from t14 [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <liupeng01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 551343682; Fri, 09 Oct 2026 19:51:54 +0800
From: liupeng <liupeng01@kylinos.cn>
To: lyude@redhat.com,
	dakr@kernel.org
Subject: [PATCH v3] drm/nouveau: Fix memory leaks in debugfs and hwmon init
 error paths
Date: Fri,  9 Oct 2026 19:51:51 +0800
Message-ID: <20261009115151.13877-1-liupeng01@kylinos.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <ea9a1d374cf3127e5047bc73807ce821022e026e.camel@redhat.com>
References: <ea9a1d374cf3127e5047bc73807ce821022e026e.camel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: EFSXGZCHMDLJXNWRGZEALIQA3OD2IUJE
X-Message-ID-Hash: EFSXGZCHMDLJXNWRGZEALIQA3OD2IUJE
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/EFSXGZCHMDLJXNWRGZEALIQA3OD2IUJE/>
Archived-At: 
 <https://lore.freedesktop.org/20261009115151.13877-1-liupeng01@kylinos.cn/>
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
Reviewed-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: liupeng <liupeng01@kylinos.cn>
---
Changes in v3:
- Drop the extra return in nouveau_debugfs_init() as suggested by Lyude.
- Add Reviewed-by tag.

 drivers/gpu/drm/nouveau/nouveau_debugfs.c | 14 +++++++++++---
 drivers/gpu/drm/nouveau/nouveau_hwmon.c   |  2 ++
 2 files changed, 13 insertions(+), 3 deletions(-)

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

