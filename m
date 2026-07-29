Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93F3EC54F55
	for <nouveau@archiver.kernel.org>; Wed, 29 Jul 2026 04:17:25 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7380910E84C;
	Wed, 29 Jul 2026 04:17:25 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id EC63747483;
	Wed, 29 Jul 2026 04:01:39 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1785297699;
 b=NaarYJJYGdTgAycFzaOW3D7QFCTNZ0TVKnUV/0zVxBgrYzouZmUNxC+3tq8JRVPhCEx8k
 mszYO+7hIHzzu7PJA87xqCiqXIJtu79VoDfAVxOZtgsgUO+xQLrZRMMFFKtgzjYYNSYn/vh
 R8KkQIYtl3zR/6baCS+kG5EwpSTAW3Wt0JFtE2WTTUeuHLC/xsoOsH3bqCqUWoB3YhHLDZn
 uaHGwKPfChDn1LotmCFmtLLtdFwADr50WkUJU/6zUrDh10tkvpsA5YiVipKKUAYb2WB6vUb
 Key3retikOuY2ltjLSccqYEMhQyS1nlZdx2/X0Da+xfXFM9Jah64weg716og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1785297699; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=3WbqFYjpn5kP7WV7Yxk8J559lqKHmk++1NYuW7cI4Kw=;
 b=f0yX+fFhEQ9A7XEAmpIoD2PhO2wLtTID1TlBtbxYq2HAndDcUYe7mFZTeoTLerizAHD7B
 l+kkuWgjw+/TDYyNO4RnKUz5bJhJMqXyCZjEdmg0nhVfnV3VHlQhIcZRqfR0cIzurXX7nEY
 p1umFzGIsVXXs5UBAbMMOyE6klzV8yV2QaMLmF/Lr5nwEJ/N+MBIeQigdC3vvhlTtKBZQ0M
 CXsyr0mq1Kh3YMz2xir0dosXOO663Voarm/dmAq25RJaGFg5zD+Gz1/eOYEBqyyi4kFV1Pf
 9iEi3m+FwZToND0aPca33/XeROvvkl5LONJ0xWktV9Mrfjd4NGyGVEmRr+Xg==
ARC-Authentication-Results: i=1; mail.freedesktop.org; dkim=fail;
  arc=none (Message is not ARC signed);
  dmarc=fail (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=fail;
 arc=none (Message is not ARC signed);
 dmarc=fail (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 7A2B34747F
	for <nouveau@lists.freedesktop.org>; Wed, 29 Jul 2026 04:01:37 +0000 (UTC)
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9629510E1FF
	for <nouveau@lists.freedesktop.org>; Wed, 29 Jul 2026 04:17:22 +0000 (UTC)
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-690-ZCxJOolrPnGyDvXi0TI7Iw-1; Wed,
 29 Jul 2026 00:17:19 -0400
X-MC-Unique: ZCxJOolrPnGyDvXi0TI7Iw-1
X-Mimecast-MFC-AGG-ID: ZCxJOolrPnGyDvXi0TI7Iw_1785298638
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id C3EB1180049F;
	Wed, 29 Jul 2026 04:17:18 +0000 (UTC)
Received: from dreadlord.redhat.com (unknown [10.67.32.13])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 833C61800480;
	Wed, 29 Jul 2026 04:17:16 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 6/6] nouveau: set wpr boost flags like open driver does.
Date: Wed, 29 Jul 2026 14:15:30 +1000
Message-ID: <20260729041653.3985549-7-airlied@gmail.com>
In-Reply-To: <20260729041653.3985549-1-airlied@gmail.com>
References: <20260729041653.3985549-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: kQwIsb0LyexcThqmeIWgfRYGfnGn-tUknmTrU4qrDkk_1785298638
X-Mimecast-Originator: gmail.com
Content-Transfer-Encoding: quoted-printable
content-type: text/plain; charset=WINDOWS-1252; x-default=true
Message-ID-Hash: UGIRGUVMGNLZHNNIMCKU5IHV6JXNIT2M
X-Message-ID-Hash: UGIRGUVMGNLZHNNIMCKU5IHV6JXNIT2M
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/UGIRGUVMGNLZHNNIMCKU5IHV6JXNIT2M/>
Archived-At: 
 <https://lore.freedesktop.org/20260729041653.3985549-7-airlied@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

From: Dave Airlie <airlied@redhat.com>

I think this might just boot GSP faster, but maybe it has some
other effects. This is only set on Turing/Ampere/Ada.

This corresponds to what the openrm drivers does.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 .../drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c   |  3 +++
 .../drm/nouveau/nvkm/subdev/gsp/rm/r570/gsp.c   | 17 +++++++++++++++++
 .../nouveau/nvkm/subdev/gsp/rm/r570/nvrm/gsp.h  |  7 +++++++
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h |  2 ++
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c |  2 ++
 5 files changed, 31 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c b/driver=
s/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
index 77a5a1882472..6f1a934a6afe 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
@@ -1740,6 +1740,9 @@ r535_gsp_fini(struct nvkm_gsp *gsp, enum nvkm_suspend=
_state suspend)
 =09=09sr->sysmemAddrOfSuspendResumeData =3D gsp->sr.radix3.lvl0.addr;
 =09=09sr->sizeOfSuspendResumeData =3D len;
=20
+=09=09if (gsp->rm->api->gsp->set_sr_boost_flags)
+=09=09=09gsp->rm->api->gsp->set_sr_boost_flags(gsp, sr, gsp->wpr_meta.data=
);
+
 =09=09ret =3D rm->api->fbsr->suspend(gsp, suspend =3D=3D NVKM_RUNTIME_SUSP=
END);
 =09=09if (ret) {
 =09=09=09nvkm_gsp_mem_dtor(&gsp->sr.meta);
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gsp.c b/driver=
s/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gsp.c
index 857eda1e7439..5ff886485774 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gsp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gsp.c
@@ -290,10 +290,27 @@ r570_gsp_libos_init(struct nvkm_gsp *gsp)
 =09return 0;
 }
=20
+static void
+r570_gsp_set_wpr_boost_flags(struct nvkm_gsp *gsp, void *data)
+{
+=09GspFwWprMeta *meta =3D data;
+=09meta->flags =3D GSP_FW_FLAGS_CLOCK_BOOST;
+}
+
+static void
+r570_gsp_set_sr_boost_flags(struct nvkm_gsp *gsp, void *sr_ptr, void *meta=
_ptr)
+{
+=09GspFwWprMeta *meta =3D meta_ptr;
+=09GspFwSRMeta *sr =3D sr_ptr;
+=09sr->flags =3D meta->flags;
+}
+
 const struct nvkm_rm_api_gsp
 r570_gsp =3D {
 =09.libos_init =3D r570_gsp_libos_init,
 =09.set_rmargs =3D r570_gsp_set_rmargs,
+=09.set_wpr_boost_flags =3D r570_gsp_set_wpr_boost_flags,
+=09.set_sr_boost_flags =3D r570_gsp_set_sr_boost_flags,
 =09.set_system_info =3D r570_gsp_set_system_info,
 =09.get_static_info =3D r570_gsp_get_static_info,
 =09.xlat_mc_engine_idx =3D r570_gsp_xlat_mc_engine_idx,
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/gsp.h b/d=
rivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/gsp.h
index 23c30cbdefff..895ed3b85c31 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/gsp.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/gsp.h
@@ -494,6 +494,13 @@ typedef struct
=20
 #define GSP_FW_WPR_META_REVISION  1
=20
+#define GSP_FW_FLAGS                                       8:0
+#define GSP_FW_FLAGS_CLOCK_BOOST                           BIT(0)
+#define GSP_FW_FLAGS_RECOVERY_MARGIN_PRESENT               BIT(1)
+#define GSP_FW_FLAGS_PPCIE_ENABLED                         BIT(2)
+#define GSP_FW_FLAGS_MULTI_GPU_NVLE_ENABLED                BIT(3)
+#define GSP_FW_FLAGS_SCAN_RECOVERY_MARGIN                  BIT(4)
+
 typedef struct {
     NvU64 sharedMemPhysAddr;
     NvU32 pageTableEntryCount;
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h b/drivers/gpu/=
drm/nouveau/nvkm/subdev/gsp/rm/rm.h
index b71ba74eec12..e8231a589e56 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
@@ -48,6 +48,8 @@ struct nvkm_rm_api {
 =09const struct nvkm_rm_api_gsp {
 =09=09int (*libos_init)(struct nvkm_gsp *);
 =09=09void (*set_rmargs)(struct nvkm_gsp *, bool resume);
+=09=09void (*set_wpr_boost_flags)(struct nvkm_gsp *, void *meta);
+=09=09void (*set_sr_boost_flags)(struct nvkm_gsp *, void *sr, void *meta);
 =09=09int (*set_system_info)(struct nvkm_gsp *);
 =09=09int (*get_static_info)(struct nvkm_gsp *);
 =09=09bool (*xlat_mc_engine_idx)(u32 mc_engine_idx, enum nvkm_subdev_type =
*, int *inst);
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c b/drivers/gpu/=
drm/nouveau/nvkm/subdev/gsp/tu102.c
index 11a37963bd4e..5cb65fc0dc9f 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c
@@ -224,6 +224,8 @@ tu102_gsp_wpr_meta_init(struct nvkm_gsp *gsp)
 =09meta->magic =3D GSP_FW_WPR_META_MAGIC;
 =09meta->revision =3D GSP_FW_WPR_META_REVISION;
=20
+=09if (gsp->rm->api->gsp->set_wpr_boost_flags)
+=09=09gsp->rm->api->gsp->set_wpr_boost_flags(gsp, meta);
 =09meta->sysmemAddrOfRadix3Elf =3D gsp->radix3.lvl0.addr;
 =09meta->sizeOfRadix3Elf =3D gsp->fb.wpr2.elf.size;
=20
--=20
2.55.0

