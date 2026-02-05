Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5190ECD995
	for <nouveau@archiver.kernel.org>; Thu,  5 Feb 2026 18:57:23 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 749F110E0F9;
	Thu,  5 Feb 2026 18:57:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=darkrefraction-com.20230601.gappssmtp.com header.i=@darkrefraction-com.20230601.gappssmtp.com header.b="DdGC+Lry";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id F18E141BCA;
	Thu,  5 Feb 2026 18:47:59 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1770317279;
 b=uaYbDjH+pyVlTT9LP4VgXpsotGHQfIJLKGyl8Pzh+UMYSh3/pvlO/aL81qiWbpWCreo2X
 YYenIU0dMsMtaxXEd1k8GisEqySwamf2QA6mD2DlGain/Zflu11l8llZCIdr2VolCdtdtX1
 6JEnkBtFLJxw9y/CH/3oZwLexTSrXUbZxEPml6PZSj7dXe+pHTICYq4Wlbw8vsSAXRzZAsQ
 SUAl49JWdbGFQXtqy79kOiOpebt5hsWpZTItw64cBhnW5m2o/EPoU2eiYU0Hn9Zjc33UfjM
 jDYAMex9EEF+R1Uk88OgoCMXRc3h7SQrcjA9YTHh1fG0rmkCel0Dc7cYc84g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1770317279; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=kvSUwRHSCkNMTFJp38fcjS4kvstVy5F/PlPk1IzJJCI=;
 b=alg997U6HO5rayDzZWY43eEWFOk8YUEX9/FfProVWO2tTPAz1P2JwF9S1EyD7z58vy6Ll
 5jSWnIihirRB800bE2/p/5yssduDxBSKGNKjT3m5KpiE4W+z+Pf3emDB9oGM0cYcjP0ANyX
 tgy4ueASA5SLGjZ75HMu0Gbh9RtJxUveFpt+xvT40HwSZiWPHCnJS1JctIGLTPOVSS/V4it
 WrXCyswUhPN1aQ4u1pEDw04eA7cI0KjOI3fK5BOhrEn+1wjpBssGcANIyDWvBe4mqfvieuG
 8iko4TXoB0VQdvP3lclm+nQpL+xZVEM74Ma9nHL8HkDlM2O0sHA6TXaP5E6w==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=darkrefraction-com.20230601.gappssmtp.com;
  arc=none (Message is not ARC signed);
  dmarc=none
Authentication-Results: mail.freedesktop.org;
 dkim=pass header.d=darkrefraction-com.20230601.gappssmtp.com;
 arc=none (Message is not ARC signed); dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id B5CD8402B7
	for <nouveau@lists.freedesktop.org>; Thu,  5 Feb 2026 18:47:56 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com
 [209.85.219.46])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1C3D510E04E
	for <nouveau@lists.freedesktop.org>; Thu,  5 Feb 2026 18:57:17 +0000 (UTC)
Received: by mail-qv1-f46.google.com with SMTP id
 6a1803df08f44-89505dd3e24so17774676d6.1
        for <nouveau@lists.freedesktop.org>;
 Thu, 05 Feb 2026 10:57:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkrefraction-com.20230601.gappssmtp.com; s=20230601; t=1770317836;
 x=1770922636; darn=lists.freedesktop.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kvSUwRHSCkNMTFJp38fcjS4kvstVy5F/PlPk1IzJJCI=;
        b=DdGC+LrygDok+MXlzbUPDttt4ohjliv1szBk+fhwVlQZvoXo3K8LwZMTdGs2RvelTD
         erMSUS7W+niSVFAmRaXZ0eWtsTzTNvlMRVR5n4x5GtBsiyxoNshasiTBWvzCmysoOx7y
         GoQzdUtkpDAthm1/mmX2oJHTs58TVNmes6FOuk003Pqq9VHTL1wIdN59HJrQhyXH9X4X
         mpLLI2AihPgOC5lVtpayjw7ByS2MIrz+565mCbG9ys1Xqnqt6SSYzeVwLajRaH+MZY9N
         1IxNwWsov8uJNh9O+7WD9qsQ1XMwxg5VzVj1+jaO0axvCUnl3ZQVCL5kEpnOdrzBGm26
         ZswA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770317836; x=1770922636;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kvSUwRHSCkNMTFJp38fcjS4kvstVy5F/PlPk1IzJJCI=;
        b=RmKxkIgzfBGyZTWurXRWvlvDB9suVHeuPa/A2ZVjGugxiYQZ6vytGcf/yaCtfubNAl
         qGTMFf/yD1b1jd+TCqzGBTmcVDAiapQ/JFQ5QYHVrZk8wPNpcNVUYYdr/SlZA6lHFkwF
         ZrCRfl8pA4pxCOhBdGAdeqIDU2hHNfON9Jj8oNPdanNM1vHac60OO0kN6fGLthsvzu3v
         t8BGHwz+hrbZsMDthD/ADzMvY1WHPtx0armc5HF/EK46+ILbqkokAt6HW2AQn3cLY2QR
         wzBKcr6ED2iVvlMaAkXrToEUIAt1xFnNQlcjj5XSn/5nDAGQeZj5FMGmW57Ckl69AXWv
         vakw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV7VALflIOUriE72t8CAQXwawHJWA4eIOypehz+UwdFau75MjfUrU/JjtHMlsCH/DKj4nAU4SU7@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwW+83HM8Jrk9wJpY097AhW1YSU+QKTt2NHwaEZ/WVTgN8PsmIF
	3rU96RLPfY46DenuLXBUDmvdjWpy2OlIECpqaEWIqGEdpdJ3ywBW1+myjNbThnoMjBA=
X-Gm-Gg: AZuq6aKVSVLMJ7njIAicnL1yCmx1aCZm9eIxHPMqwky0aKWobld2yRxMoDYl2HRrQB0
	M3kRDddnLVfwdVoGQpQo2mJAe6EOMqY32vogE2JlavdcQYoTVKNTV9CuMJPzIJziL1uLiza3a6v
	HQNfNJNptFE9C5i2Fu8ZxbL200m7kGcwXatTfyY4HPpDLsFazjz/JbUjdA29gb2oLeBCcd6t7bQ
	wiiIzKBJ8wv8jhzGUvlHKYpCUlrhRz1kaHc9HG0jMMzqbtYbB4XWUWqGjDQ0NmUiyXr0N0ZccF4
	qOb7g5rdnDyfXlgeXobvNCtXMPcw4CfXltCK9gnyRmxjcWxYIM3mdnj7zgkl3+cnywxqKGhocBa
	KyWP4Ser39wWxe6K3jcwSYBfVaCDT9ZqWrO98+CBTjHELcughmL6ZviiTsSsEMbD6OI+wJheRGV
	c6e60tT0Afhdp+0JE5TXAmTcvadIm+
X-Received: by 2002:a05:6214:da5:b0:890:8c65:c67a with SMTP id
 6a1803df08f44-8953c7eac04mr1910056d6.3.1770317836045;
        Thu, 05 Feb 2026 10:57:16 -0800 (PST)
Received: from [108.27.160.201] ([108.27.160.201])
        by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-506392902f9sm1678331cf.18.2026.02.05.10.57.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 10:57:15 -0800 (PST)
From: Mel Henning <mhenning@darkrefraction.com>
Date: Thu, 05 Feb 2026 13:56:10 -0500
Subject: [PATCH v2 1/2] drm/nouveau: Fetch zcull info from device
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260205-zcull3-v2-1-ac572f38cc7b@darkrefraction.com>
References: <20260205-zcull3-v2-0-ac572f38cc7b@darkrefraction.com>
In-Reply-To: <20260205-zcull3-v2-0-ac572f38cc7b@darkrefraction.com>
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Mary Guillemard <mary@mary.zone>
X-Mailer: b4 0.14.3
Message-ID-Hash: 3KUVGK7YYT7TZXB4DU7EKRJCLYFFGZMG
X-Message-ID-Hash: 3KUVGK7YYT7TZXB4DU7EKRJCLYFFGZMG
X-MailFrom: mhenning@darkrefraction.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/3KUVGK7YYT7TZXB4DU7EKRJCLYFFGZMG/>
Archived-At: 
 <https://lore.freedesktop.org/20260205-zcull3-v2-1-ac572f38cc7b@darkrefraction.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

This information will be exposed to userspace in the following commit.

Signed-off-by: Mel Henning <mhenning@darkrefraction.com>
---
 drivers/gpu/drm/nouveau/include/nvkm/engine/gr.h   | 19 +++++++++++++
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gr.c   |  9 ++++--
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gr.c   | 32 ++++++++++++++++++++--
 .../drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/gr.h  | 19 +++++++++++++
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h    |  2 +-
 5 files changed, 75 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/engine/gr.h b/drivers/gpu/drm/nouveau/include/nvkm/engine/gr.h
index a2333cfe6955..490ce410f6cb 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/engine/gr.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/engine/gr.h
@@ -3,9 +3,28 @@
 #define __NVKM_GR_H__
 #include <core/engine.h>
 
+struct nvkm_gr_zcull_info {
+	__u32 width_align_pixels;
+	__u32 height_align_pixels;
+	__u32 pixel_squares_by_aliquots;
+	__u32 aliquot_total;
+	__u32 zcull_region_byte_multiplier;
+	__u32 zcull_region_header_size;
+	__u32 zcull_subregion_header_size;
+	__u32 subregion_count;
+	__u32 subregion_width_align_pixels;
+	__u32 subregion_height_align_pixels;
+
+	__u32 ctxsw_size;
+	__u32 ctxsw_align;
+};
+
 struct nvkm_gr {
 	const struct nvkm_gr_func *func;
 	struct nvkm_engine engine;
+
+	struct nvkm_gr_zcull_info zcull_info;
+	bool has_zcull_info;
 };
 
 u64 nvkm_gr_units(struct nvkm_gr *);
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gr.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gr.c
index ddb57d5e73d6..73844e1e7294 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gr.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gr.c
@@ -249,7 +249,7 @@ r535_gr_get_ctxbuf_info(struct r535_gr *gr, int i,
 }
 
 static int
-r535_gr_get_ctxbufs_info(struct r535_gr *gr)
+r535_gr_get_ctxbufs_and_zcull_info(struct r535_gr *gr)
 {
 	NV2080_CTRL_INTERNAL_STATIC_GR_GET_CONTEXT_BUFFERS_INFO_PARAMS *info;
 	struct nvkm_subdev *subdev = &gr->base.engine.subdev;
@@ -265,6 +265,9 @@ r535_gr_get_ctxbufs_info(struct r535_gr *gr)
 		r535_gr_get_ctxbuf_info(gr, i, &info->engineContextBuffersInfo[0].engine[i]);
 
 	nvkm_gsp_rm_ctrl_done(&gsp->internal.device.subdevice, info);
+
+	gr->base.has_zcull_info = false;
+
 	return 0;
 }
 
@@ -312,7 +315,7 @@ r535_gr_oneinit(struct nvkm_gr *base)
 	 *
 	 * Also build the information that'll be used to create channel contexts.
 	 */
-	ret = rm->api->gr->get_ctxbufs_info(gr);
+	ret = rm->api->gr->get_ctxbufs_and_zcull_info(gr);
 	if (ret)
 		goto done;
 
@@ -352,5 +355,5 @@ r535_gr_dtor(struct nvkm_gr *base)
 
 const struct nvkm_rm_api_gr
 r535_gr = {
-	.get_ctxbufs_info = r535_gr_get_ctxbufs_info,
+	.get_ctxbufs_and_zcull_info = r535_gr_get_ctxbufs_and_zcull_info,
 };
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gr.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gr.c
index b6cced9b8aa1..3e7af2ffece9 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gr.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gr.c
@@ -164,9 +164,10 @@ r570_gr_scrubber_init(struct r535_gr *gr)
 }
 
 static int
-r570_gr_get_ctxbufs_info(struct r535_gr *gr)
+r570_gr_get_ctxbufs_and_zcull_info(struct r535_gr *gr)
 {
 	NV2080_CTRL_INTERNAL_STATIC_GR_GET_CONTEXT_BUFFERS_INFO_PARAMS *info;
+	NV2080_CTRL_GR_GET_ZCULL_INFO_PARAMS *zcull_info;
 	struct nvkm_subdev *subdev = &gr->base.engine.subdev;
 	struct nvkm_gsp *gsp = subdev->device->gsp;
 
@@ -179,13 +180,40 @@ r570_gr_get_ctxbufs_info(struct r535_gr *gr)
 	for (int i = 0; i < ARRAY_SIZE(info->engineContextBuffersInfo[0].engine); i++)
 		r535_gr_get_ctxbuf_info(gr, i, &info->engineContextBuffersInfo[0].engine[i]);
 
+	NV2080_CTRL_INTERNAL_ENGINE_CONTEXT_BUFFER_INFO zcull = info->engineContextBuffersInfo[0]
+		.engine[NV0080_CTRL_FIFO_GET_ENGINE_CONTEXT_PROPERTIES_ENGINE_ID_GRAPHICS_ZCULL];
+	gr->base.zcull_info.ctxsw_size = zcull.size;
+	gr->base.zcull_info.ctxsw_align = zcull.alignment;
+
 	nvkm_gsp_rm_ctrl_done(&gsp->internal.device.subdevice, info);
+
+	zcull_info = nvkm_gsp_rm_ctrl_rd(&gsp->internal.device.subdevice,
+					 NV2080_CTRL_CMD_GR_GET_ZCULL_INFO,
+					 sizeof(*zcull_info));
+	if (WARN_ON(IS_ERR(zcull_info)))
+		return PTR_ERR(zcull_info);
+
+	gr->base.zcull_info.width_align_pixels = zcull_info->widthAlignPixels;
+	gr->base.zcull_info.height_align_pixels = zcull_info->heightAlignPixels;
+	gr->base.zcull_info.pixel_squares_by_aliquots = zcull_info->pixelSquaresByAliquots;
+	gr->base.zcull_info.aliquot_total = zcull_info->aliquotTotal;
+	gr->base.zcull_info.zcull_region_byte_multiplier = zcull_info->zcullRegionByteMultiplier;
+	gr->base.zcull_info.zcull_region_header_size = zcull_info->zcullRegionHeaderSize;
+	gr->base.zcull_info.zcull_subregion_header_size = zcull_info->zcullSubregionHeaderSize;
+	gr->base.zcull_info.subregion_count = zcull_info->subregionCount;
+	gr->base.zcull_info.subregion_width_align_pixels = zcull_info->subregionWidthAlignPixels;
+	gr->base.zcull_info.subregion_height_align_pixels = zcull_info->subregionHeightAlignPixels;
+
+	nvkm_gsp_rm_ctrl_done(&gsp->internal.device.subdevice, zcull_info);
+
+	gr->base.has_zcull_info = true;
+
 	return 0;
 }
 
 const struct nvkm_rm_api_gr
 r570_gr = {
-	.get_ctxbufs_info = r570_gr_get_ctxbufs_info,
+	.get_ctxbufs_and_zcull_info = r570_gr_get_ctxbufs_and_zcull_info,
 	.scrubber.init = r570_gr_scrubber_init,
 	.scrubber.fini = r570_gr_scrubber_fini,
 };
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/gr.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/gr.h
index feed1dabd9d2..a7a15a4de9d5 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/gr.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/gr.h
@@ -76,4 +76,23 @@ typedef struct NV2080_CTRL_INTERNAL_GR_INIT_BUG4208224_WAR_PARAMS {
 } NV2080_CTRL_INTERNAL_GR_INIT_BUG4208224_WAR_PARAMS;
 
 #define NV2080_CTRL_CMD_INTERNAL_KGR_INIT_BUG4208224_WAR (0x20800a46) /* finn: Evaluated from "(FINN_NV20_SUBDEVICE_0_INTERNAL_INTERFACE_ID << 8) | NV2080_CTRL_INTERNAL_KGR_INIT_BUG4208224_WAR_PARAMS_MESSAGE_ID" */
+
+#define NV2080_CTRL_CMD_GR_GET_ZCULL_INFO            (0x20801206U) /* finn: Evaluated from "(FINN_NV20_SUBDEVICE_0_GR_INTERFACE_ID << 8) | NV2080_CTRL_GR_GET_ZCULL_INFO_PARAMS_MESSAGE_ID" */
+
+#define NV2080_CTRL_GR_GET_ZCULL_INFO_PARAMS_SUBREGION_SUPPORTED
+#define NV2080_CTRL_GR_GET_ZCULL_INFO_PARAMS_MESSAGE_ID (0x6U)
+
+typedef struct NV2080_CTRL_GR_GET_ZCULL_INFO_PARAMS {
+    NvU32 widthAlignPixels;
+    NvU32 heightAlignPixels;
+    NvU32 pixelSquaresByAliquots;
+    NvU32 aliquotTotal;
+    NvU32 zcullRegionByteMultiplier;
+    NvU32 zcullRegionHeaderSize;
+    NvU32 zcullSubregionHeaderSize;
+    NvU32 subregionCount;
+    NvU32 subregionWidthAlignPixels;
+    NvU32 subregionHeightAlignPixels;
+} NV2080_CTRL_GR_GET_ZCULL_INFO_PARAMS;
+
 #endif
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
index 393ea775941f..0fb0e67406c6 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
@@ -124,7 +124,7 @@ struct nvkm_rm_api {
 	} *ce, *nvdec, *nvenc, *nvjpg, *ofa;
 
 	const struct nvkm_rm_api_gr {
-		int (*get_ctxbufs_info)(struct r535_gr *);
+		int (*get_ctxbufs_and_zcull_info)(struct r535_gr *);
 		struct {
 			int (*init)(struct r535_gr *);
 			void (*fini)(struct r535_gr *);

-- 
2.52.0

