Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBF53C531CD
	for <nouveau@archiver.kernel.org>; Thu, 19 Feb 2026 20:06:24 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id AC1C910E74F;
	Thu, 19 Feb 2026 20:06:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=darkrefraction-com.20230601.gappssmtp.com header.i=@darkrefraction-com.20230601.gappssmtp.com header.b="WIg426Cl";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id E07ED43438;
	Thu, 19 Feb 2026 19:56:29 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1771530989;
 b=QTD/gBx/acVzv6A4hPsQRai57VOzwrfXEo13SWfXAJJTyKYqNspkOliMTK74XrInR9fI/
 Yl1mq4XK1EAWiUjmr0bz2Cgyuo7nB6kHykWR4bnV0pEDSijZ98IUs/FPSCnp+eOvIVVTEwy
 B7MQ0/HTjLFf+MmoKxunJ6ozrFxKJeW5p+U4r6FMfxdHRMPpzR7BRFy6HT6+Kn9UWRm/kUK
 WBcAnPbpOTanbYLttHuf7ErBQb+Og9WdmVs5PSBLxqvkAk5OySZK/IjUo1GP6s7vB1nSySs
 dyNzAx9VCsu/P38d/5KXXRuqqbAF+h6/PrB+lhDt3YUFAZ+MmINVfbHJ+lgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1771530989; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=7Uncv38UxGm72QGhelQ6NKI/QxXN75cHDpbsTnqtowY=;
 b=pQ6n1ZOuwsXNUIkkaCcVzGu6VeW4h15oj71ZFHtw8DpQ1nadk9eJiNzo6Anq35FYjBxYm
 /ri9bkikhnErMugrxqaILC8ZQ5iY/OAngXB0yyNQZ9TGIXtng/PBvIHtBYOblMUfd8X7MQp
 J4MhHm1uXW5hbWDrUje4hn0OcqCZD7rHjiuVpSDTbo7p8kn59hoRc+2Oj0XY8pT0SD0PK3T
 VtFOk2vquyTY6zogq0D7EuVNoUUCBZVl3ajcSxcLZAsqVXN3Kads0ykB9MbQyU0mmbH1Pt1
 OoSHYe6KKc8yoACxBue9ZjrZK3rzrCBhjlxk2Cb5zDmceGuYbX49kN6oiRtg==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=darkrefraction-com.20230601.gappssmtp.com;
  arc=none (Message is not ARC signed);
  dmarc=none
Authentication-Results: mail.freedesktop.org;
 dkim=pass header.d=darkrefraction-com.20230601.gappssmtp.com;
 arc=none (Message is not ARC signed); dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 0BC98433BE
	for <nouveau@lists.freedesktop.org>; Thu, 19 Feb 2026 19:56:26 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com
 [209.85.219.47])
	by gabe.freedesktop.org (Postfix) with ESMTPS id ACD9210E744
	for <nouveau@lists.freedesktop.org>; Thu, 19 Feb 2026 20:06:17 +0000 (UTC)
Received: by mail-qv1-f47.google.com with SMTP id
 6a1803df08f44-89473dca8aaso16264346d6.0
        for <nouveau@lists.freedesktop.org>;
 Thu, 19 Feb 2026 12:06:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkrefraction-com.20230601.gappssmtp.com; s=20230601; t=1771531576;
 x=1772136376; darn=lists.freedesktop.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7Uncv38UxGm72QGhelQ6NKI/QxXN75cHDpbsTnqtowY=;
        b=WIg426ClXs4sbJALu3+/jlIQTQw1meW4JXfgfyxO4cTbdwhrkkvlEVzE2JswTTXfMh
         njepPOgVmLDk5PV2Y6MezSpbIlpO0+UCHbXVHVrpXszniw5nc8DMgqXy0V9LfOfTE0xj
         oSqS6UPLZ7oPTt9Lmgjas2+LbfH+n2OsrJOFAO8WOG4z1kYfhmYbFlerkcDFRBeAqZGk
         403t2q31WmlOinrkjHx0lVxKKWrVKbYqrhMKI5zxEysWqJ0Zae7PyCFwVnjwfeZcyxRJ
         fJw2JFz1tYnSlTHiiYyZQ6a07+kTKDn6GLwRooK+CWnpbX+tgBM3NIns6nRkJxI0qMBS
         ZUKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771531576; x=1772136376;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7Uncv38UxGm72QGhelQ6NKI/QxXN75cHDpbsTnqtowY=;
        b=dwteUvqcjKL0an6xLYdJZYodwbXLQD8H0LCInO92Q3ZbnzO9cRGvIj6K/pEmvv8+eV
         Dlx3YB457ArWXbvskShxUoyu3OGUHiQlFVbXLO672ihX+F73XV/Bf/Mj8o3cHKz3Gho0
         MifdeDow10V1+pa8ASylvcOOWPvUnfcXe6js6m8Pm9OaJUhnI96Aqk/s7vUjdHyGTJfu
         kHOrAeWKbaGGcPsWdEJ26OK/eeYIHVKywsrOuNUdIi1zubr3GQAMHb41g5HX+fZVaYbh
         kJl+pnoLPsYnCqmZ6lRooCPATcNkcCC5MexrMWPz4FG7WXb9EW4NgF8Fnw9dBa8YJYTd
         2fhw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWsGZeNFVeMrwzvtmS4Pnxoc2Q8wHeZn+R+oJ2uuQtqrxELyFyXsO2CQhCqfXuprd39dgqn14kh@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy8QBqW8cBRj4NJRdPGw8htFrFSc6rXCO18ynwEOYPd9SA0R5vk
	15g7w5EhAmfeQ0BUZm13sQ9/z43tLpNn/fXCXY5DvQPUfBSCv0zN8mf/vAnDF24Bc58=
X-Gm-Gg: AZuq6aKyUKfLLQwvF4DDIiAwKcIYrkcnMBqwNDS0VeFHzUa5WolHtqAJEYj7wbu2Z1E
	/nXB+85QFPxFwzQE5Asygi1SPuY7kCHF9gpz5LIV8leFpkzpPdDf7TSenuyVKyWwA0RBoFIejgX
	iG472WrUbcqyxPQjYMlmOY/zDMKnehv45sFY+gSx9etE6VYmX172WgaS+OcNjSxpwkGFX4jA9AZ
	NWFhLImsrSrNcuyCEqAkVVDS3zmmNX+JL7egqUwd/RhEO6j/TeWJFsyHPbgD0aWqdexG2QWjMJr
	UkGGZ/qrmLgTr41CJNGVbX6MyIZ/PVwQtxiL84JVVzt0Q/kngryruw5mL3fD92/SoWu9UKVPscA
	0gItIeovQHbkYkX8rULOcXO9NKGWIvqpEo5Mw642wodfnTbd0QeXlH+d20zKnFqK8u/x5KKp/UL
	Tdk07Mud+64dPfDwi4+XQ8Xw0EsqPkYy36SdYwGqYpHutnBorvFtVfcvIRiIGdZKG8253wuk/0E
	OOxp3cqnA==
X-Received: by 2002:a05:6214:4109:b0:896:f3de:cc29 with SMTP id
 6a1803df08f44-89740302432mr273211576d6.16.1771531576414;
        Thu, 19 Feb 2026 12:06:16 -0800 (PST)
Received: from [96.232.40.90] (pool-96-232-40-90.nycmny.fios.verizon.net.
 [96.232.40.90])
        by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8971c8e60a0sm216675066d6.0.2026.02.19.12.06.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 12:06:15 -0800 (PST)
From: Mel Henning <mhenning@darkrefraction.com>
Date: Thu, 19 Feb 2026 15:05:53 -0500
Subject: [PATCH v3 1/2] drm/nouveau: Fetch zcull info from device
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260219-zcull3-v3-1-dbe6a716f104@darkrefraction.com>
References: <20260219-zcull3-v3-0-dbe6a716f104@darkrefraction.com>
In-Reply-To: <20260219-zcull3-v3-0-dbe6a716f104@darkrefraction.com>
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Mary Guillemard <mary@mary.zone>
X-Mailer: b4 0.14.3
Message-ID-Hash: 75TUFQ6RLJHF3J2GJCLFPCBOAJUOVAWO
X-Message-ID-Hash: 75TUFQ6RLJHF3J2GJCLFPCBOAJUOVAWO
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/75TUFQ6RLJHF3J2GJCLFPCBOAJUOVAWO/>
Archived-At: 
 <https://lore.freedesktop.org/20260219-zcull3-v3-1-dbe6a716f104@darkrefraction.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

This information will be exposed to userspace in the following commit.

Add struct nvkm_gr_zcull_info, which serves as abstraction layer between
the corresponding uAPI (added in a subsequent patch) and the firmware
structure.

Extend the existing get_ctxbufs callback to also fill in zcull info.
ctxsw_size and ctxsw_align come from
NV2080_CTRL_CMD_INTERNAL_STATIC_KGR_GET_CONTEXT_BUFFERS_INFO, which is
already called by r570_gr_get_ctxbufs, while the rest of the zcull
info comes from
NV0080_CTRL_FIFO_GET_ENGINE_CONTEXT_PROPERTIES_ENGINE_ID_GRAPHICS_ZCULL.
Adding a separate callback for zcull info would require us to either:

1) Call GET_CONTEXT_BUFFERS_INFO twice, once for each callback. This
is a little slower and more verbose than calling it once.
or
2) Fill out zcull_info partially in r570_gr_get_ctxbufs and partially
in the new callback. Since we fill out only some of the info in each
we now need to handle edge cases where one function is called but not
the other as well as them being called in an arbitrary order.

Because of this, it's simplest to combine them in a single call
(get_ctxbufs_and_zcull_info), which avoids repeated rpc calls
to the gpu without the complexity of handling partially complete states.

Signed-off-by: Mel Henning <mhenning@darkrefraction.com>
---
 drivers/gpu/drm/nouveau/include/nvkm/engine/gr.h   | 19 ++++++++++++
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gr.c   |  9 ++++--
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gr.c   | 34 ++++++++++++++++++++--
 .../drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/gr.h  | 19 ++++++++++++
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h    |  2 +-
 5 files changed, 77 insertions(+), 6 deletions(-)

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
index b6cced9b8aa1..8dd4552aeaa5 100644
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
 
@@ -179,13 +180,42 @@ r570_gr_get_ctxbufs_info(struct r535_gr *gr)
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
+	if (IS_ERR(zcull_info)) {
+		nvdev_error(gr->base.engine.subdev.device, "could not fetch zcull info\n");
+		return PTR_ERR(zcull_info);
+	}
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
2.53.0

