Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C38CC54F55
	for <nouveau@archiver.kernel.org>; Wed, 29 Jul 2026 04:17:19 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D644010E6D4;
	Wed, 29 Jul 2026 04:17:17 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 634D047477;
	Wed, 29 Jul 2026 04:01:32 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1785297692;
 b=fxwFmYMfUL/BVok1yBzzEHJcXmZIXeDSR0pcty78XdG0BgspfLl7F0GgHqnSvcHEFCZrH
 V3A+GSdLl3fxYhrwSPiaC272/lVSwfA8flgixpeVZwHwv/17GF8m2RWhNqW3OnYC1MSVB1W
 EqFWobAmFKlls7+Gd4xj+asu1AsE8FBpXHIGCb8KU+bniJ3hXzJYfP45cl0VYav5o8+Pz4y
 RnFX9EGwFEUyIYUkLedJrtU9vyP/yWI0CId9YdPqrzHl2eCizpcslQ27R0CpvbxDqvYxDV/
 PMI+KvkwUuOjx20bWi2/Jn4sn7o9U5Mc85OLV9nsDQub7TSl5+2t1KbDKAlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1785297692; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=ALU6iqJkYeVVI15gfLOMLWC5zdSBaDazyEMLUiAOjLE=;
 b=LbW5hKPGv8pkcDOJtySycxUGc6Flo9lPLo7EyISQfDxvx/mVNmapoWJJPNGWoiGzAIT5c
 n7Oa5swVLyl/TnUKEXuelW3AOYmuzCAZ4WUzJdu/BlgjwgII7+RMsetWkueXYyLgq30CLCs
 XF4NSNo0R8a7Il4Mil18YtscaCmjQyPRQpre8Sb3WuEyunWPcCZzCTSBIINffY26N1IadI3
 2iVmePZGEuYvgxChfVYD9sTtGLdFtafR11tbezmLGucKP5iWLf819lP9o5znd0vAWn525mb
 Q3Gw0zdEzJ1Y3eIuykR2HOowAJmnmrMl2LwCoEAah7/rtQnsplgx6eekvcOA==
ARC-Authentication-Results: i=1; mail.freedesktop.org; dkim=fail;
  arc=none (Message is not ARC signed);
  dmarc=fail (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=fail;
 arc=none (Message is not ARC signed);
 dmarc=fail (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id DD6AB463F9
	for <nouveau@lists.freedesktop.org>; Wed, 29 Jul 2026 04:01:29 +0000 (UTC)
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 06B9110E42F
	for <nouveau@lists.freedesktop.org>; Wed, 29 Jul 2026 04:17:14 +0000 (UTC)
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-50-lFiVfnobNOaF5Fsl5L7Yyw-1; Wed,
 29 Jul 2026 00:17:10 -0400
X-MC-Unique: lFiVfnobNOaF5Fsl5L7Yyw-1
X-Mimecast-MFC-AGG-ID: lFiVfnobNOaF5Fsl5L7Yyw_1785298629
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 54F53195604D;
	Wed, 29 Jul 2026 04:17:09 +0000 (UTC)
Received: from dreadlord.redhat.com (unknown [10.67.32.13])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 179071800480;
	Wed, 29 Jul 2026 04:17:06 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/6] nouveau/gsp: add logging entries for r570
Date: Wed, 29 Jul 2026 14:15:27 +1000
Message-ID: <20260729041653.3985549-4-airlied@gmail.com>
In-Reply-To: <20260729041653.3985549-1-airlied@gmail.com>
References: <20260729041653.3985549-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: aaRKXxeWxoriTc-LtxatOvH0u3oVNgPDaoQAA-KO23w_1785298629
X-Mimecast-Originator: gmail.com
Content-Transfer-Encoding: quoted-printable
content-type: text/plain; charset=WINDOWS-1252; x-default=true
Message-ID-Hash: HZKDVTJUPQO5MA7AXFTA2MEQ5KRTB5GB
X-Message-ID-Hash: HZKDVTJUPQO5MA7AXFTA2MEQ5KRTB5GB
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/HZKDVTJUPQO5MA7AXFTA2MEQ5KRTB5GB/>
Archived-At: 
 <https://lore.freedesktop.org/20260729041653.3985549-4-airlied@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

From: Dave Airlie <airlied@redhat.com>

r570 adds logmnoc and logkrnl. logkrnl is only used for libos3, so
add a flag to pick libos2 out and not init on that.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 .../gpu/drm/nouveau/include/nvkm/subdev/gsp.h |  2 ++
 .../drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c |  2 ++
 .../drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c  |  1 +
 .../drm/nouveau/nvkm/subdev/gsp/rm/r570/gsp.c | 23 +++++++++++++++----
 .../drm/nouveau/nvkm/subdev/gsp/rm/r570/rm.c  |  1 +
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h   |  1 +
 6 files changed, 25 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h b/drivers/gp=
u/drm/nouveau/include/nvkm/subdev/gsp.h
index 64fed208e4cf..d45351ce08a1 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
@@ -145,6 +145,8 @@ struct nvkm_gsp {
 =09struct nvkm_gsp_mem loginit;
 =09struct nvkm_gsp_mem logintr;
 =09struct nvkm_gsp_mem logrm;
+=09struct nvkm_gsp_mem logmnoc;
+=09struct nvkm_gsp_mem logkrnl;
 =09struct nvkm_gsp_mem rmargs;
=20
 =09struct nvkm_gsp_mem wpr_meta;
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c b/driver=
s/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
index 8e1ad2e79d3e..77a5a1882472 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
@@ -2108,6 +2108,8 @@ r535_gsp_dtor(struct nvkm_gsp *gsp)
=20
 =09r535_gsp_libos_debugfs_fini(gsp);
=20
+=09nvkm_gsp_mem_dtor(&gsp->logkrnl);
+=09nvkm_gsp_mem_dtor(&gsp->logmnoc);
 =09nvkm_gsp_mem_dtor(&gsp->loginit);
 =09nvkm_gsp_mem_dtor(&gsp->logintr);
 =09nvkm_gsp_mem_dtor(&gsp->logrm);
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c b/drivers=
/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c
index a4190676e1ad..e198212df9c5 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c
@@ -11,6 +11,7 @@ r535_wpr_libos2 =3D {
 =09.os_carveout_size =3D GSP_FW_HEAP_PARAM_OS_SIZE_LIBOS2,
 =09.base_size =3D GSP_FW_HEAP_PARAM_BASE_RM_SIZE_TU10X,
 =09.heap_size_min =3D GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS2_MIN_MB,
+=09.is_libos2 =3D true,
 };
=20
 static const struct nvkm_rm_wpr
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gsp.c b/driver=
s/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gsp.c
index 64011430f4c0..d9786830153d 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gsp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gsp.c
@@ -236,6 +236,7 @@ r570_gsp_libos_init(struct nvkm_gsp *gsp)
 {
 =09LibosMemoryRegionInitArgument *args;
 =09int ret;
+=09int idx;
=20
 =09ret =3D nvkm_gsp_mem_ctor(gsp, 0x1000, &gsp->libos);
 =09if (ret)
@@ -255,15 +256,27 @@ r570_gsp_libos_init(struct nvkm_gsp *gsp)
 =09if (ret)
 =09=09return ret;
=20
+=09ret =3D gsp_fill_libos_entry(gsp, &args[3], 0x10000, &gsp->logmnoc, "LO=
GMNOC");
+=09if (ret)
+=09=09return ret;
+
+=09idx =3D 4;
+=09if (!gsp->rm->wpr->is_libos2) {
+=09=09ret =3D gsp_fill_libos_entry(gsp, &args[idx], 0x10000, &gsp->logkrnl=
, "LOGKRNL");
+=09=09if (ret)
+=09=09=09return ret;
+=09=09idx++;
+=09}
+
 =09ret =3D r535_gsp_rmargs_init(gsp, false);
 =09if (ret)
 =09=09return ret;
=20
-=09args[3].id8  =3D r535_gsp_libos_id8("RMARGS");
-=09args[3].pa   =3D gsp->rmargs.addr;
-=09args[3].size =3D gsp->rmargs.size;
-=09args[3].kind =3D LIBOS_MEMORY_REGION_CONTIGUOUS;
-=09args[3].loc  =3D LIBOS_MEMORY_REGION_LOC_SYSMEM;
+=09args[idx].id8  =3D r535_gsp_libos_id8("RMARGS");
+=09args[idx].pa   =3D gsp->rmargs.addr;
+=09args[idx].size =3D gsp->rmargs.size;
+=09args[idx].kind =3D LIBOS_MEMORY_REGION_CONTIGUOUS;
+=09args[idx].loc  =3D LIBOS_MEMORY_REGION_LOC_SYSMEM;
=20
 #ifdef CONFIG_DEBUG_FS
 =09r535_gsp_libos_debugfs_init(gsp);
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/rm.c b/drivers=
/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/rm.c
index 498658d0c60c..fa012756a731 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/rm.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/rm.c
@@ -11,6 +11,7 @@ r570_wpr_libos2 =3D {
 =09.os_carveout_size =3D GSP_FW_HEAP_PARAM_OS_SIZE_LIBOS2,
 =09.base_size =3D GSP_FW_HEAP_PARAM_BASE_RM_SIZE_TU10X,
 =09.heap_size_min =3D GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS2_MIN_MB,
+=09.is_libos2 =3D true,
 };
=20
 static const struct nvkm_rm_wpr
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h b/drivers/gpu/=
drm/nouveau/nvkm/subdev/gsp/rm/rm.h
index cc9f33202673..b77059e0ac12 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
@@ -28,6 +28,7 @@ struct nvkm_rm_wpr {
 =09u32 heap_size_non_wpr;
 =09u32 rsvd_size_pmu;
 =09bool offset_set_by_acr;
+=09bool is_libos2;
 };
=20
 struct nvkm_rm_api {
--=20
2.55.0

