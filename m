Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA2C3C54F54
	for <nouveau@archiver.kernel.org>; Wed, 29 Jul 2026 02:51:47 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 03D6A10EA4E;
	Wed, 29 Jul 2026 02:51:46 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 9616747472;
	Wed, 29 Jul 2026 02:36:00 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1785292560;
 b=F5yMww6WL8OyVhdZbpbABSydEXarSIsZMsfgluYmKQzUgsEGIxrbCsDqnj5znF84/VhKy
 traRBZ2n4gWqk+5x3jBoCt8o2/fToWhUX/jCrabT51dBnMKT0l5mlH6hw11VYQsdutMk+4d
 RMNpjju2VK4vnkBxSpmI3XviDgNXVI8DR+2fvwsZuq1fKqk+f160gUXLR9FrMp3aYkITFUN
 2/y8LcGIT64eVD+PaOmnDdUIP8Ms0t48/uXfcBIiuyDsPHnCq7JJm1KB4DVvQtyrRe5k7aQ
 eHlKg1JnAP3FFlt+zOUqFuHohWN07gLs4fKoGLNW9EGs/M6aYcStlc+KxKeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1785292560; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=iWw50qXjerRjO/sPn9FRzEjmuyQdyvhAotXdmZvpDdI=;
 b=u6rpyZeRtOLdcrRKjBdRdg7LKbX+pDsm2CrWz66AqZ2QoT7vnPRJ9nFb0giDBizcmWW79
 CDV2aHIO5yPPzIyC4EWFmi7X3TT/rddA+p97hHIUfe9Ll1Q9WxKxt1FXVl7bUXmBTvoR1+3
 mciSTCD7n1vvgApGpx68dHsOpsE+OAhP2ckz7RCL7dZVwsAfPJTVrqEz4lzsKeMrVNsQ+Li
 sPrfBEeXKZ8toIQfwSfyjdN9FdEw8p82Nb1/uATW2EsNpUIniwxSwuear4pjfDSWkwNFiRt
 MBxuPm3xd+t+wnXf0WLpAdTYJ/Q5xpRI+WipQTTKnBMAJkFVwN22/dyMs6/Q==
ARC-Authentication-Results: i=1; mail.freedesktop.org; dkim=fail;
  arc=none (Message is not ARC signed);
  dmarc=fail (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=fail;
 arc=none (Message is not ARC signed);
 dmarc=fail (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 4A53D4700E
	for <nouveau@lists.freedesktop.org>; Wed, 29 Jul 2026 02:35:57 +0000 (UTC)
X-Greylist: delayed 377 seconds by postgrey-1.36 at gabe;
 Wed, 29 Jul 2026 02:51:42 UTC
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [207.211.30.44])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3EAE710E43C
	for <nouveau@lists.freedesktop.org>; Wed, 29 Jul 2026 02:51:42 +0000 (UTC)
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-169-gUGDrMVsMCygffM0hSnDkA-1; Tue,
 28 Jul 2026 22:45:22 -0400
X-MC-Unique: gUGDrMVsMCygffM0hSnDkA-1
X-Mimecast-MFC-AGG-ID: gUGDrMVsMCygffM0hSnDkA_1785293121
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 74CEF1800348;
	Wed, 29 Jul 2026 02:45:21 +0000 (UTC)
Received: from dreadlord.redhat.com (unknown [10.67.32.13])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 01DCB1956089;
	Wed, 29 Jul 2026 02:45:18 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] nouveau/instmem: handle iomapping already existing
Date: Wed, 29 Jul 2026 12:45:16 +1000
Message-ID: <20260729024516.3985008-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 4gQuIIRvehpltCUJwkZ-iRgMvXexIu568NoN1-tNszw_1785293121
X-Mimecast-Originator: gmail.com
Content-Transfer-Encoding: quoted-printable
content-type: text/plain; charset=WINDOWS-1252; x-default=true
Message-ID-Hash: YZH2DZCF4QBL7BLMHQG6JSQGARVWYCS3
X-Message-ID-Hash: YZH2DZCF4QBL7BLMHQG6JSQGARVWYCS3
X-MailFrom: airlied@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: nouveau@lists.freedesktop.org, dakr@kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/YZH2DZCF4QBL7BLMHQG6JSQGARVWYCS3/>
Archived-At: 
 <https://lore.freedesktop.org/20260729024516.3985008-1-airlied@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

From: Dave Airlie <airlied@redhat.com>

Turns out sashiko was right, and I should protect this properly

Fixes: 34e27b90552a ("nouveau/instmem: use iomapping interface for instmem =
handling")
Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c b/drivers/g=
pu/drm/nouveau/nvkm/subdev/instmem/nv50.c
index f4489efc94a7..22b0fde6ba34 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c
@@ -195,6 +195,9 @@ check_io_mapping(struct nv50_instmem *imem)
 {
 =09struct nvkm_device *device =3D imem->base.subdev.device;
=20
+=09if (imem->iomap.size)
+=09=09return true;
+
 =09return io_mapping_init_wc(&imem->iomap,
 =09=09=09=09  device->func->resource_addr(device, NVKM_BAR2_INST),
 =09=09=09=09  device->func->resource_size(device, NVKM_BAR2_INST)) !=3D NU=
LL;
--=20
2.55.0

