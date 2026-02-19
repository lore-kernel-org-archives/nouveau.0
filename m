Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55F78C531CB
	for <nouveau@archiver.kernel.org>; Thu, 19 Feb 2026 20:06:25 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0387310E756;
	Thu, 19 Feb 2026 20:06:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=darkrefraction-com.20230601.gappssmtp.com header.i=@darkrefraction-com.20230601.gappssmtp.com header.b="vzls+yU4";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 3469443437;
	Thu, 19 Feb 2026 19:56:30 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1771530990;
 b=XR30VRUeqpYt2wP7pRVqlpuKJrrgXW8cBoa40Kh/MUF5IMjc/z2InvujvpzIuo43JF165
 bvxIkcuaAzooVkd3Vfy6RZK4BNXGRC6uj+kG8pIQZPeupqk5AVjYYS3/jvzXQ37BCgoHb4F
 IWfYKNsFdtp4+vm82ivPVYAIYFY9u1UFh65Re4UdK9+D4UWWwFja4ts2dSa0G2WIqxjBhUH
 JeCoIvS58SRP/U5GqeeGncrvfYUGNEC7yfXMbk8HmYCAClBUMQODrha4U4LZR6UH5RVmzOI
 aOxnJqmUV2xl5o0l5KDP3GenHUkX5MUbsSVPRrijoUfRF/OAQfmarDoAQgZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1771530990; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=LXWvhKY40NwAh0sJpltiG5AWknO8aVooYAaWfER0QVg=;
 b=QCmHpOGS22cu+mAhIYrjDEw8+pyuKqfXp5tMAtzYtWmMeBGgOhz2pK0ZJYf+KUyDoGpQc
 66Z8oLw3A0cbxfqDyQbuZS1CcJwZZl6MEKNGywyf3L8E2yYx+ulD+/iJCXEMQdmXds8ZsY1
 r2LKNmztwnnFpUTvKzezTgmVsUPI6e37YczE+b7sp05HvfiX8PyDbKdlg5pudbIcmmUIgWE
 hwe62+I34wZWdPLYMqpovbWSETSHb7BtKT2PAEH2VoGbDb33VF998M+Lbpl4k1iFF7Zjmhy
 NYTBUCNBLZIhkKGMBHCPnKTNGuQECdpIplToMwtMTw9jWCoPbViVmYNCKmRQ==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=darkrefraction-com.20230601.gappssmtp.com;
  arc=none (Message is not ARC signed);
  dmarc=none
Authentication-Results: mail.freedesktop.org;
 dkim=pass header.d=darkrefraction-com.20230601.gappssmtp.com;
 arc=none (Message is not ARC signed); dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id C965B43430
	for <nouveau@lists.freedesktop.org>; Thu, 19 Feb 2026 19:56:26 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com
 [209.85.219.54])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 757BE10E195
	for <nouveau@lists.freedesktop.org>; Thu, 19 Feb 2026 20:06:18 +0000 (UTC)
Received: by mail-qv1-f54.google.com with SMTP id
 6a1803df08f44-896fb37d1f0so22096176d6.2
        for <nouveau@lists.freedesktop.org>;
 Thu, 19 Feb 2026 12:06:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkrefraction-com.20230601.gappssmtp.com; s=20230601; t=1771531577;
 x=1772136377; darn=lists.freedesktop.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LXWvhKY40NwAh0sJpltiG5AWknO8aVooYAaWfER0QVg=;
        b=vzls+yU4Q2gVX9+r1teBY4Xj0xBVGOumLh1V04M+Cgizk1vtoXezLsHe8VWO8GnpGO
         XlI3da/wfoKVrv7mBXdc+zTjqzyH1AdEcxFWGd1bfZY7MPArXqLbfnEwbfWqqy8a33Z/
         sxm8W7ESEp9B4FHKwG8cbkdZgdouxB+BQ5kZEy/SFnXCPcccjTiaLaLZGdB7ch/+CfMe
         J+magnT5Qy1WwhFHHGKq3kfU2vo+Q/SH6UHw6dtaLkr7qk1H+erONalXguhoYD3HTu+s
         qC8JP7w4f8jGEaaNENg6FMVM3DYtxFOkt5NKidRDPWnrmnj/0VxAZqFkUIV+ICKWPGNp
         CcgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771531577; x=1772136377;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LXWvhKY40NwAh0sJpltiG5AWknO8aVooYAaWfER0QVg=;
        b=UsxBhJrBVjtl5Zt4cwv3XkSJcqnQYoIWLEEgkj8Fu8S04zKRgm8p++e+ifPGtfILMU
         O+BcRt/7T6i/yyCeJa4X2GiuoZhUODGRsAEteFFc8hMJHmsi7veD38UYn8Bl2nbcoRq5
         peElgeXVX0JhSH1qEymJnLZst4CHMR78fMeq/GMS7b+8IQI2tntVvI2NNsFogV4w+GTD
         6uFWfPEdDRaQoLSS/DibwoBzPpLMzsgM03F7t2w7bx+ptsME2ovJRDs/e0kSE334SzgO
         P8Kw+FsDuipa7rHW60YTcor1BIw5CdpVsAejgVtZuF9sFB+Dq/74oQ9hTkjvTuxlFJ2g
         rYfw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWxCmLUhKu/VJBLk9JhJifPe9okVaQ7L2eTKe+8Pbc0HKIo6erobPGW//c37Asc3HxkIkJoNk6A@lists.freedesktop.org
X-Gm-Message-State: AOJu0YydtpJ5FsOrHW5SllZv0zLvmWQz2fN+dusW4ThGtYioB2H60oLO
	DEhdaiy0HFLzObmKA0vsePBphP1T9KmVrsSTahW2Jl6HBeZghoshfSDw6tMkgtLNZ1Y=
X-Gm-Gg: AZuq6aI83FAiCEJtHDWaGFTKjndpHxayrhsQSRcw69Bq2lYzNO3Se7oiB50usCrQpKE
	sXpiWDwhg9O8UEShS3dQYerwvS40d40a7zzkObJjj2tD+3kyG2SzeiqgtiuWDKsDY94fNxMx9AX
	9elhEy1yS1bKl13X82Hxi18rmVWI1rZxIJ4Zi4djcoxrKKBYYK3+/jfBJqpLDTyYAoo52rm+LyQ
	wMpjksKEtUc0xJKp+VwF1mRCSKTubfbvJ2d9i2ByL/2nygPYLDqFFISDIkNDqx1mKqb0tD++21h
	xUyQT8rlnNJH33TyecjS6NtZK6hDNIUffJPguADYkiMqVCxzqMQ0NlxbQTz39MKeakmjO4Kku0T
	58oxeXswxK7iNtS/tSwGr4hLTXP26FDwe+CDiTNvxkHeR0NGJ7qmGYMgZhe92z/3D4M/nc7wozf
	Eyq4bH0gKldEhWx/yQ9ck9Nw8yQvg12xc3Zp8rC0Zvv4E2/3dwm/z94Yy+8mQbtk/TZBYo7/Em4
	djsdeckRA==
X-Received: by 2002:ad4:5d66:0:b0:894:68fa:37e6 with SMTP id
 6a1803df08f44-897404c9f34mr300821276d6.58.1771531577432;
        Thu, 19 Feb 2026 12:06:17 -0800 (PST)
Received: from [96.232.40.90] (pool-96-232-40-90.nycmny.fios.verizon.net.
 [96.232.40.90])
        by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8971c8e60a0sm216675066d6.0.2026.02.19.12.06.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 12:06:16 -0800 (PST)
From: Mel Henning <mhenning@darkrefraction.com>
Date: Thu, 19 Feb 2026 15:05:54 -0500
Subject: [PATCH v3 2/2] drm/nouveau: Add DRM_IOCTL_NOUVEAU_GET_ZCULL_INFO
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260219-zcull3-v3-2-dbe6a716f104@darkrefraction.com>
References: <20260219-zcull3-v3-0-dbe6a716f104@darkrefraction.com>
In-Reply-To: <20260219-zcull3-v3-0-dbe6a716f104@darkrefraction.com>
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Mary Guillemard <mary@mary.zone>
X-Mailer: b4 0.14.3
Message-ID-Hash: BFCOICFOXBKDE7CGTSKRAINPIDHYLEY7
X-Message-ID-Hash: BFCOICFOXBKDE7CGTSKRAINPIDHYLEY7
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/BFCOICFOXBKDE7CGTSKRAINPIDHYLEY7/>
Archived-At: 
 <https://lore.freedesktop.org/20260219-zcull3-v3-2-dbe6a716f104@darkrefraction.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Add kernel-side support for using the zcull hardware in nvidia gpus.
zcull aims to improve memory bandwidth by using an early approximate
depth test, similar to hierarchical Z on an AMD card.

Add a new ioctl that exposes zcull information that has been read
from the hardware. Userspace uses each of these parameters either
in a heuristic for determining zcull region parameters or in the
calculation of a buffer size.

It appears the hardware hasn't changed its structure for these
values since FERMI_C (circa 2011), so the assumption is that it
won't change on us too quickly, and is therefore reasonable to
include in UAPI.

This bypasses the nvif layer and instead accesses nvkm_gr directly,
which mirrors existing usage of nvkm_gr_units(). There is no nvif
object for nvkm_gr yet, and adding one is not trivial.

Signed-off-by: Mel Henning <mhenning@darkrefraction.com>
---
 drivers/gpu/drm/nouveau/nouveau_abi16.c | 29 +++++++++++++++
 drivers/gpu/drm/nouveau/nouveau_abi16.h |  1 +
 drivers/gpu/drm/nouveau/nouveau_drm.c   |  1 +
 include/uapi/drm/nouveau_drm.h          | 66 +++++++++++++++++++++++++++++++++
 4 files changed, 97 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.c b/drivers/gpu/drm/nouveau/nouveau_abi16.c
index a3ba07fc48a0..5f3e7560a84e 100644
--- a/drivers/gpu/drm/nouveau/nouveau_abi16.c
+++ b/drivers/gpu/drm/nouveau/nouveau_abi16.c
@@ -333,6 +333,35 @@ nouveau_abi16_ioctl_getparam(ABI16_IOCTL_ARGS)
 	return 0;
 }
 
+int
+nouveau_abi16_ioctl_get_zcull_info(ABI16_IOCTL_ARGS)
+{
+	struct nouveau_drm *drm = nouveau_drm(dev);
+	struct nvkm_gr *gr = nvxx_gr(drm);
+	struct drm_nouveau_get_zcull_info *out = data;
+
+	if (gr->has_zcull_info) {
+		const struct nvkm_gr_zcull_info *i = &gr->zcull_info;
+
+		out->width_align_pixels = i->width_align_pixels;
+		out->height_align_pixels = i->height_align_pixels;
+		out->pixel_squares_by_aliquots = i->pixel_squares_by_aliquots;
+		out->aliquot_total = i->aliquot_total;
+		out->zcull_region_byte_multiplier = i->zcull_region_byte_multiplier;
+		out->zcull_region_header_size = i->zcull_region_header_size;
+		out->zcull_subregion_header_size = i->zcull_subregion_header_size;
+		out->subregion_count = i->subregion_count;
+		out->subregion_width_align_pixels = i->subregion_width_align_pixels;
+		out->subregion_height_align_pixels = i->subregion_height_align_pixels;
+		out->ctxsw_size = i->ctxsw_size;
+		out->ctxsw_align = i->ctxsw_align;
+
+		return 0;
+	} else {
+		return -ENOTTY;
+	}
+}
+
 int
 nouveau_abi16_ioctl_channel_alloc(ABI16_IOCTL_ARGS)
 {
diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.h b/drivers/gpu/drm/nouveau/nouveau_abi16.h
index af6b4e1cefd2..134b3ab58719 100644
--- a/drivers/gpu/drm/nouveau/nouveau_abi16.h
+++ b/drivers/gpu/drm/nouveau/nouveau_abi16.h
@@ -6,6 +6,7 @@
 	struct drm_device *dev, void *data, struct drm_file *file_priv
 
 int nouveau_abi16_ioctl_getparam(ABI16_IOCTL_ARGS);
+int nouveau_abi16_ioctl_get_zcull_info(ABI16_IOCTL_ARGS);
 int nouveau_abi16_ioctl_channel_alloc(ABI16_IOCTL_ARGS);
 int nouveau_abi16_ioctl_channel_free(ABI16_IOCTL_ARGS);
 int nouveau_abi16_ioctl_grobj_alloc(ABI16_IOCTL_ARGS);
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 1527b801f013..b698ac38e947 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -1272,6 +1272,7 @@ nouveau_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(NOUVEAU_GROBJ_ALLOC, nouveau_abi16_ioctl_grobj_alloc, DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(NOUVEAU_NOTIFIEROBJ_ALLOC, nouveau_abi16_ioctl_notifierobj_alloc, DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(NOUVEAU_GPUOBJ_FREE, nouveau_abi16_ioctl_gpuobj_free, DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(NOUVEAU_GET_ZCULL_INFO, nouveau_abi16_ioctl_get_zcull_info, DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(NOUVEAU_SVM_INIT, nouveau_svmm_init, DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(NOUVEAU_SVM_BIND, nouveau_svmm_bind, DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(NOUVEAU_GEM_NEW, nouveau_gem_ioctl_new, DRM_RENDER_ALLOW),
diff --git a/include/uapi/drm/nouveau_drm.h b/include/uapi/drm/nouveau_drm.h
index dd87f8f30793..1fa82fa6af38 100644
--- a/include/uapi/drm/nouveau_drm.h
+++ b/include/uapi/drm/nouveau_drm.h
@@ -432,6 +432,69 @@ struct drm_nouveau_exec {
 	__u64 push_ptr;
 };
 
+struct drm_nouveau_get_zcull_info {
+	/**
+	 * @width_align_pixels: required alignment for region widths, in pixels
+	 * (typically #TPC's * 16).
+	 */
+	__u32 width_align_pixels;
+	/**
+	 * @height_align_pixels: required alignment for region heights, in
+	 * pixels (typically 32).
+	 */
+	__u32 height_align_pixels;
+	/**
+	 * @pixel_squares_by_aliquots: the pixel area covered by an aliquot
+	 * (typically #Zcull_banks * 16 * 16).
+	 */
+	__u32 pixel_squares_by_aliquots;
+	/**
+	 * @aliquot_total: the total aliquot pool available in hardware
+	 */
+	__u32 aliquot_total;
+	/**
+	 * @zcull_region_byte_multiplier: the size of an aliquot in bytes, which
+	 * is used for save/restore operations on a region
+	 */
+	__u32 zcull_region_byte_multiplier;
+	/**
+	 * @zcull_region_header_size: the region header size in bytes, which is
+	 * used for save/restore operations on a region
+	 */
+	__u32 zcull_region_header_size;
+	/**
+	 * @zcull_subregion_header_size: the subregion header size in bytes,
+	 * which is used for save/restore operations on a region
+	 */
+	__u32 zcull_subregion_header_size;
+	/**
+	 * @subregion_count: the total number of subregions the hardware
+	 * supports
+	 */
+	__u32 subregion_count;
+	/**
+	 * @subregion_width_align_pixels: required alignment for subregion
+	 * widths, in pixels (typically #TPC's * 16).
+	 */
+	__u32 subregion_width_align_pixels;
+	/**
+	 * @subregion_height_align_pixels: required alignment for subregion
+	 * heights, in pixels
+	 */
+	__u32 subregion_height_align_pixels;
+
+	/**
+	 * @ctxsw_size: the size, in bytes, of a zcull context switching region.
+	 * Will be zero if the kernel does not support zcull context switching.
+	 */
+	__u32 ctxsw_size;
+	/**
+	 * @ctxsw_align: the alignment, in bytes, of a zcull context switching
+	 * region
+	 */
+	__u32 ctxsw_align;
+};
+
 #define DRM_NOUVEAU_GETPARAM           0x00
 #define DRM_NOUVEAU_SETPARAM           0x01 /* deprecated */
 #define DRM_NOUVEAU_CHANNEL_ALLOC      0x02
@@ -445,6 +508,7 @@ struct drm_nouveau_exec {
 #define DRM_NOUVEAU_VM_INIT            0x10
 #define DRM_NOUVEAU_VM_BIND            0x11
 #define DRM_NOUVEAU_EXEC               0x12
+#define DRM_NOUVEAU_GET_ZCULL_INFO     0x13
 #define DRM_NOUVEAU_GEM_NEW            0x40
 #define DRM_NOUVEAU_GEM_PUSHBUF        0x41
 #define DRM_NOUVEAU_GEM_CPU_PREP       0x42
@@ -513,6 +577,8 @@ struct drm_nouveau_svm_bind {
 #define DRM_IOCTL_NOUVEAU_VM_INIT            DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_VM_INIT, struct drm_nouveau_vm_init)
 #define DRM_IOCTL_NOUVEAU_VM_BIND            DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_VM_BIND, struct drm_nouveau_vm_bind)
 #define DRM_IOCTL_NOUVEAU_EXEC               DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_EXEC, struct drm_nouveau_exec)
+
+#define DRM_IOCTL_NOUVEAU_GET_ZCULL_INFO     DRM_IOR (DRM_COMMAND_BASE + DRM_NOUVEAU_GET_ZCULL_INFO, struct drm_nouveau_get_zcull_info)
 #if defined(__cplusplus)
 }
 #endif

-- 
2.53.0

