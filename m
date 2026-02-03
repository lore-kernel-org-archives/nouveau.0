Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C83C9E83058
	for <nouveau@archiver.kernel.org>; Tue,  3 Feb 2026 05:24:54 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 498AF10E545;
	Tue,  3 Feb 2026 05:24:54 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 8005E41B48;
	Tue,  3 Feb 2026 05:15:39 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1770095739;
 b=wdoKcMZabap41OaWeHQTmk4HLsjaoZNsC/rp/s4Lvg05DnN2dAJrI6E94vW1nZ0QK8KPo
 cdDeD0X1OnoVB2S1Z/kIUlewQ+W4aUxYamW7NHJTLd1Rzaph9w/HxYFY7hgi7A/k6HCUCBU
 EZlXv4rJbdpPtKTTXupUefmaOkt6XOZa2nCz0kosOxZhxdytX5/v4crszB7MbhkmkkvfhyL
 qawv9xfeGiiPa8GY3ELRo1P3+ll9smCC1sJ9YIOZB6TNd+HaKEddDtQTZezNLYUK24mt0MF
 qQ3piTFp71+KrG4OGkVA+TvF93/fnj/nOZfv8dpJNZXB4PjHQyHRVzM/91Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1770095739; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=xSeZNG9GCeiweRuDR+31Oj1AoRicLds2W9d7+80P7us=;
 b=BAuy4/ezWotjtUHhGO4sf9MG2ED+oJekco2IbFxTVP2e3qoVPhOSbz6t2TzoCICHmardo
 jn2WJq/b205N2FOSqXPDdYuQMiFr88MP8RYhowT0mFsCCJU8TRKudL1G35q2Wh6vQD3ofjl
 He4NQW7ZFLbM9QwDOhsMUwfmW4iqtBmojur6N+qWEiw5+t7Kc1vMmGh8Vy2+ZQLFJrKj1iK
 ZCcOTK2PhKO8LLdDJzNeFd88qNK3eyL8cR0HnEI2FKvVsbwsVWOk6dKHNgt89BWQwWE1RjY
 MCX1ErUlx0MgAa9ac6dpZCDGYCAjG3rdQUO6adnYFYFHmaBJiit+62gBAjeA==
ARC-Authentication-Results: i=1; mail.freedesktop.org; dkim=fail;
  arc=none (Message is not ARC signed);
  dmarc=fail (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=fail;
 arc=none (Message is not ARC signed);
 dmarc=fail (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 3240241A0C
	for <nouveau@lists.freedesktop.org>; Tue,  3 Feb 2026 05:15:37 +0000 (UTC)
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [207.211.30.44])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A05C810E53E
	for <nouveau@lists.freedesktop.org>; Tue,  3 Feb 2026 05:24:51 +0000 (UTC)
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-589-YhQNwizKN5mhsBjUvdj2Nw-1; Tue,
 03 Feb 2026 00:24:49 -0500
X-MC-Unique: YhQNwizKN5mhsBjUvdj2Nw-1
X-Mimecast-MFC-AGG-ID: YhQNwizKN5mhsBjUvdj2Nw_1770096288
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 33E0A1956089;
	Tue,  3 Feb 2026 05:24:48 +0000 (UTC)
Received: from dreadlord.redhat.com (unknown [10.67.32.75])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 2EE361800285;
	Tue,  3 Feb 2026 05:24:45 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/3] nouveau/gsp: fix suspend/resume regression on r570
 firmware
Date: Tue,  3 Feb 2026 15:21:13 +1000
Message-ID: <20260203052431.2219998-4-airlied@gmail.com>
In-Reply-To: <20260203052431.2219998-1-airlied@gmail.com>
References: <20260203052431.2219998-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: QX8gpiJkPZLIJvylF4xwYyNicsMa9sT6ZO0UZhaDiSI_1770096288
X-Mimecast-Originator: gmail.com
Content-Transfer-Encoding: quoted-printable
content-type: text/plain; charset=WINDOWS-1252; x-default=true
Message-ID-Hash: 4KRMHBN2MBO2NXDNNKJ5K25MKLBWOS7B
X-Message-ID-Hash: 4KRMHBN2MBO2NXDNNKJ5K25MKLBWOS7B
X-MailFrom: airlied@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: nouveau@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/4KRMHBN2MBO2NXDNNKJ5K25MKLBWOS7B/>
Archived-At: 
 <https://lore.freedesktop.org/20260203052431.2219998-4-airlied@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

From: Dave Airlie <airlied@redhat.com>

The r570 firmware with certain GPUs (at least RTX6000) needs this
flag to reflect the suspend vs runtime PM state of the driver.

This uses that info to set the correct flags to the firmware.

This fixes a regression on RTX6000 and other GPUs since r570 firmware
was enabled.

Signed-off-by: Dave Airlie <airlied@redhat.com>
Fixes: 53dac0623853 ("drm/nouveau/gsp: add support for 570.144")
Cc: <stable@vger.kernel.org>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fbsr.c | 2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c  | 2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/fbsr.c | 8 ++++----
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h        | 2 +-
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fbsr.c b/drive=
rs/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fbsr.c
index 150e22fde2ac..e962d0e8f837 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fbsr.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fbsr.c
@@ -208,7 +208,7 @@ r535_fbsr_resume(struct nvkm_gsp *gsp)
 }
=20
 static int
-r535_fbsr_suspend(struct nvkm_gsp *gsp)
+r535_fbsr_suspend(struct nvkm_gsp *gsp, bool runtime)
 {
 =09struct nvkm_subdev *subdev =3D &gsp->subdev;
 =09struct nvkm_device *device =3D subdev->device;
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c b/driver=
s/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
index 2f028a30e07d..7fb13434c051 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
@@ -1748,7 +1748,7 @@ r535_gsp_fini(struct nvkm_gsp *gsp, enum nvkm_suspend=
_state suspend)
 =09=09sr->sysmemAddrOfSuspendResumeData =3D gsp->sr.radix3.lvl0.addr;
 =09=09sr->sizeOfSuspendResumeData =3D len;
=20
-=09=09ret =3D rm->api->fbsr->suspend(gsp);
+=09=09ret =3D rm->api->fbsr->suspend(gsp, suspend =3D=3D NVKM_RUNTIME_SUSP=
END);
 =09=09if (ret) {
 =09=09=09nvkm_gsp_mem_dtor(&gsp->sr.meta);
 =09=09=09nvkm_gsp_radix3_dtor(gsp, &gsp->sr.radix3);
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/fbsr.c b/drive=
rs/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/fbsr.c
index 2945d5b4e570..8ef8b4f65588 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/fbsr.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/fbsr.c
@@ -62,7 +62,7 @@ r570_fbsr_resume(struct nvkm_gsp *gsp)
 }
=20
 static int
-r570_fbsr_init(struct nvkm_gsp *gsp, struct sg_table *sgt, u64 size)
+r570_fbsr_init(struct nvkm_gsp *gsp, struct sg_table *sgt, u64 size, bool =
runtime)
 {
 =09NV2080_CTRL_INTERNAL_FBSR_INIT_PARAMS *ctrl;
 =09struct nvkm_gsp_object memlist;
@@ -81,7 +81,7 @@ r570_fbsr_init(struct nvkm_gsp *gsp, struct sg_table *sgt=
, u64 size)
 =09ctrl->hClient =3D gsp->internal.client.object.handle;
 =09ctrl->hSysMem =3D memlist.handle;
 =09ctrl->sysmemAddrOfSuspendResumeData =3D gsp->sr.meta.addr;
-=09ctrl->bEnteringGcoffState =3D 1;
+=09ctrl->bEnteringGcoffState =3D runtime ? 1 : 0;
=20
 =09ret =3D nvkm_gsp_rm_ctrl_wr(&gsp->internal.device.subdevice, ctrl);
 =09if (ret)
@@ -92,7 +92,7 @@ r570_fbsr_init(struct nvkm_gsp *gsp, struct sg_table *sgt=
, u64 size)
 }
=20
 static int
-r570_fbsr_suspend(struct nvkm_gsp *gsp)
+r570_fbsr_suspend(struct nvkm_gsp *gsp, bool runtime)
 {
 =09struct nvkm_subdev *subdev =3D &gsp->subdev;
 =09struct nvkm_device *device =3D subdev->device;
@@ -133,7 +133,7 @@ r570_fbsr_suspend(struct nvkm_gsp *gsp)
 =09=09return ret;
=20
 =09/* Initialise FBSR on RM. */
-=09ret =3D r570_fbsr_init(gsp, &gsp->sr.fbsr, size);
+=09ret =3D r570_fbsr_init(gsp, &gsp->sr.fbsr, size, runtime);
 =09if (ret) {
 =09=09nvkm_gsp_sg_free(device, &gsp->sr.fbsr);
 =09=09return ret;
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h b/drivers/gpu/=
drm/nouveau/nvkm/subdev/gsp/rm/rm.h
index 393ea775941f..4f0ae6cc085c 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
@@ -78,7 +78,7 @@ struct nvkm_rm_api {
 =09} *device;
=20
 =09const struct nvkm_rm_api_fbsr {
-=09=09int (*suspend)(struct nvkm_gsp *);
+=09=09int (*suspend)(struct nvkm_gsp *, bool runtime);
 =09=09void (*resume)(struct nvkm_gsp *);
 =09} *fbsr;
=20
--=20
2.52.0

