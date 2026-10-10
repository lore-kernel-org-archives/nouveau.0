Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CC3ACA9EBB
	for <nouveau@archiver.kernel.org>; Sat, 10 Oct 2026 02:20:23 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 303D410EB69;
	Sat, 10 Oct 2026 02:20:23 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 06D5B48A4D;
	Sat, 10 Oct 2026 02:01:56 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1791597715;
 b=ne1aPwNpH8YSNM73PUYkEUPOSXFmTic4FR+iCXdYpjwgj8kUAC9ADjhrWnRhuDVaB5Hqw
 ejClY8E2TXTA4jV1qdyoxVQtkCCVuqJu6Uht/+Qa0Qa90ubK7DfOEtOzKHolRItXmzyyczV
 88pLrzDZlUsm7QJ94AMTa7uhk2w/qFx8F/vnK2HpJEvaFM0ZSmLg0Y/DxdFMIRQjpXTfccf
 V4TybWpmktwHBdZPWeLyqCOUQPSg42zcLxKk6bJiN9PSNpxvSy9A5KxlgG/RbQ+NXRT6vob
 c6Vjdt4G4J8UdTx2kXHKgXX5lXeJYjhxIJqq89TxVfIZjpqoMLtSXzk8qawg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1791597715; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=7TZRiOCetK/jqyur49g2HoCsgtNfmazO85vbNp3S2+8=;
 b=N6VYcap3llYdV+Rb9K9I6DcRryUXF3ELzTvYzlwgiTh/1Jruz+J4S34MDJcnmzd7si5cd
 6liEH8uqpXuf18TgwnGf+gr/REcD0SqhYGPjjQdHr7pm5wpb/XOvdz6Q35KeAPRiRzgIP5x
 ChTo4+Y0kLjEYEK1eisoY8xDqeSd65GMvZ75bypmy6tmTg+O+EXttMUTpVI0WVDekaW0dAJ
 bqWnWZQKVLwkIklGghcn8AwO+m+A+jwpUB9IM2Tr1fhqf2F3/uKet8A/asngcNl0XyXk7st
 u8X00J4mJX6TrK2rr2mt9Avm5lv5EdD8zcdRPLYQl2HOO4zFHHaMd3WpcMOw==
ARC-Authentication-Results: i=1; mail.freedesktop.org; dkim=fail;
  arc=none (Message is not ARC signed);
  dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=fail;
 arc=none (Message is not ARC signed); dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 4CEE748505
	for <nouveau@lists.freedesktop.org>; Sat, 10 Oct 2026 02:01:54 +0000 (UTC)
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5E62810EB63;
	Sat, 10 Oct 2026 02:20:20 +0000 (UTC)
X-UUID: 1f7bef4ec45111f19a56ed5b684f684d-20261010
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:ecee74a2-1e55-4a6b-b0a6-44bafed3e660,IP:0,U
	RL:0,TC:0,Content:-5,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:20
X-CID-META: VersionHash:7db8b62,CLOUDID:18ca962c9afe14172961c7209937d7a0,BulkI
	D:nil,BulkQuantity:0,SF:81|82|102|136|865|898,TC:nil,Content:0|15|50|99,ED
	M:5|-100,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,
	OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 1f7bef4ec45111f19a56ed5b684f684d-20261010
X-User: liupeng01@kylinos.cn
Received: from t14 [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <liupeng01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 954129788; Sat, 10 Oct 2026 10:20:12 +0800
From: liupeng <liupeng01@kylinos.cn>
To: lyude@redhat.com,
	dakr@kernel.org
Subject: [PATCH v4 2/2] drm/nouveau: Fix memory leak in hwmon init error path
Date: Sat, 10 Oct 2026 10:20:06 +0800
Message-ID: <20261010022006.28263-2-liupeng01@kylinos.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261010022006.28263-1-liupeng01@kylinos.cn>
References: <b4cd38b48d85298a7a99cf30fbd8cbbdb34a347f.camel@redhat.com>
 <20261010022006.28263-1-liupeng01@kylinos.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: RSGW62MSX3OKECLBUYDQP2DHFI3E2EFE
X-Message-ID-Hash: RSGW62MSX3OKECLBUYDQP2DHFI3E2EFE
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/RSGW62MSX3OKECLBUYDQP2DHFI3E2EFE/>
Archived-At: 
 <https://lore.freedesktop.org/20261010022006.28263-2-liupeng01@kylinos.cn/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

In nouveau_hwmon_init(), if hwmon_device_register_with_info() fails,
the allocated hwmon structure is leaked because the function returns
the error code directly.

Fix this by freeing the allocated memory and clearing the pointer on
the error path.

Fixes: b9ed919f1c8f ("drm/nouveau/drm/pm: remove everything except the hwmon interfaces to THERM")
Cc: stable@vger.kernel.org
Reviewed-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: liupeng <liupeng01@kylinos.cn>
---
Changes in v4:
- Split the debugfs and hwmon fixes into two separate patches as
  requested by Danilo, since they are unrelated fixes with different
  Fixes: tags. No functional change to this fix.

 drivers/gpu/drm/nouveau/nouveau_hwmon.c | 2 ++
 1 file changed, 2 insertions(+)

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

