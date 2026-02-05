Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BAEEECD997
	for <nouveau@archiver.kernel.org>; Thu,  5 Feb 2026 18:57:24 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id AD31810E1A3;
	Thu,  5 Feb 2026 18:57:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=darkrefraction-com.20230601.gappssmtp.com header.i=@darkrefraction-com.20230601.gappssmtp.com header.b="DjGI+eYP";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 36F4B41B4A;
	Thu,  5 Feb 2026 18:48:00 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1770317280;
 b=vfA1NjrdGBob/XKrVJ93AWLuXG5NXDDTqr3aFw2F93v7z42XBXOCQBAzR8YDK8q6i/8T3
 GUnsVkOQVWmi5HWo8ghmTxUcbR9FYaAlIsHpGEDzaInBSqtpjR3F2anuqXdEzgBr45UpX72
 mYAL6I4qfn3MUgqSFLKZN1ZH/SHToJdZBH3yW3GMA6OZHONCurOPhOm+HAB+nH/7T0rrSc5
 YSJP4W8ZpW+pSUKNJ2fxT7ApXdqnMnFLTu16dt/8ggvuQjLdO78z08bSUAk72Sx12sdNlum
 yTm2lTUNPAurHUjXlG4zkizwxGv7egSpP7SEjpfoQblhBoy7WnXr6NOKRIVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1770317280; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=PUpncIv/TvQtfgxlzLRrxAU7NOjwwDOSM1RRZlXsCLM=;
 b=UHCxwnRpeVprSmHGZCrakS0+JquJlY9i5xdq8GLcQQ02cQtlW/In+vns9Eb6dXjL8Yz2E
 8S1YR7gDipvt8A1Crmt5Qe2esp//cJVM5TRvtmXplhsjcGDmzZiuYayL4LTfHGI6u39jQsZ
 uv5LibFYX0BZS98SEJ6tU7LQZ0arRWBAci2aVv2DrYeE2e8UDPImQ4M3uZSSU98G1KEkRNn
 hvgCApfwvVuu34LTflsjJKXkFE+6SzfzAvUMcpaoTtOqANsBSySzKvY1h/Z6eKWaPfFocEc
 m/k7S2nf2aTLKcqlJGB16XcuvxNDXVCA0cXLH4p48T98DFPrTD7d0XsHIPAQ==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=darkrefraction-com.20230601.gappssmtp.com;
  arc=none (Message is not ARC signed);
  dmarc=none
Authentication-Results: mail.freedesktop.org;
 dkim=pass header.d=darkrefraction-com.20230601.gappssmtp.com;
 arc=none (Message is not ARC signed); dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 8D66041B47
	for <nouveau@lists.freedesktop.org>; Thu,  5 Feb 2026 18:47:57 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com
 [209.85.219.48])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E76EA10E013
	for <nouveau@lists.freedesktop.org>; Thu,  5 Feb 2026 18:57:17 +0000 (UTC)
Received: by mail-qv1-f48.google.com with SMTP id
 6a1803df08f44-88fca7bce90so15324736d6.3
        for <nouveau@lists.freedesktop.org>;
 Thu, 05 Feb 2026 10:57:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkrefraction-com.20230601.gappssmtp.com; s=20230601; t=1770317837;
 x=1770922637; darn=lists.freedesktop.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PUpncIv/TvQtfgxlzLRrxAU7NOjwwDOSM1RRZlXsCLM=;
        b=DjGI+eYP2q69Nm1zsYPnBOVLSm1/zAz8V2BPCLL6C4DPq4IPktnTeK7QRuCU9cvWwQ
         HrFDpt9wA9AWnAv9c1eBaH0FbE56hCXsroLguhvCGPiOg5hP80a15y+FuwfHdRn255PO
         45kIEm5XyUlStTrJ4MP8nddvidAxja4S53D2bt37YpdX1Dn0Q2VQq+ZlPWwI3e4LDJOR
         3Vs7CVG71dzaQgekrnu9wt6lPca9Lm4GBXpc37ixJPxbPLSnnaNRf3NhPmdvU0JNy3Xt
         i91B9rKAWhEH3FyQI0U/hez1aB2Yal99SMOzqnqlWIWbvHcKAucv/uPaI1KSaXFBDD6p
         Q0ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770317837; x=1770922637;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PUpncIv/TvQtfgxlzLRrxAU7NOjwwDOSM1RRZlXsCLM=;
        b=kH6kXAyUANiG2svMUE1P6Fb8mHz0mrpmYMN3AgskbiXJr5vGaVYEIQHe0zEikAv9hd
         UaJkGk6pDQA3hF33NsjVAic6rkrq1UuPjuNRYtJEYXoUOffEaRRouqvzKbtdb+BcB9pu
         tnoJpa1TP8dB1yAxQ7tD2mRCSsdUf9dzDwnbK46m1q4k77GgOiHzdHy4UV8ZBmtXz/4l
         bl//9r6iDxaj+rNXRyFDKupTcOGDcsg6aqumOhbQI2qIhGFL6mq1WboPX5ZtxrFMaoZn
         LV1E05/T8J3Ygv6bziL4dMjYO/cCcbhJr+H6Tp51mttWP8ZAtm87auyo4qfa9KVVYaJd
         8ACw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZf2nIDbLZOmIC4DMwdWEsyC8OxjK/Ah4cIDmVKxZ3BuKm8745pkST5ZZxApfIR+kim1Iqtdd/@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyIqQchu1Si6HyAJTMp3UqTtwZ9i88XKcBW+oH4oSlHgp6SZaT1
	c3f/ir6RPLzhUnNcd4uyoX61YvNP6n8HFLEmbgKs5pshyHGA0f35gcGmowC7Mx/NAg8=
X-Gm-Gg: AZuq6aLz3LyLvL/JlRmiALtg9iMD2SsdbKUZtAAF0/qyD435nwusaRJNtgldLLYJMxJ
	iX1TO2EC72rReHU5R2lmEsvYyrGXKG5laVAmGorhh1+RXw1gCHN2bjEyhEBND4ODwSwOTqYgCO7
	01R+VS3kP12TSYGHBYcjw3NBEYFk+jQPBhXnUHBRY1ZBkuklneCjDyWxt510AX5kljPO7AioKDV
	6sHIuzVBPOiHnfnXqgZGm2Y0g8vEawE/WMd5TI28qfBpLKmzn66+b3g/FcLRH87l+eIO/6F34a9
	RqiiGkMRhhQ8qp/e3f+IMw7J82SulflHpH1HbQs6H7gtqDYlGk5iMInoA6kRRdHalYu/2VbOo2n
	/XyHxmTVyKAZQGS5/VXI2SHEg1+UEXlA7qUELCTJqI+hMtlJR7bxQUF6lXP4N5pRbxBeE+l0FKq
	72nIJvID/GpCbNy2WVuyY3n2WW+o2+
X-Received: by 2002:a05:622a:14ce:b0:4ee:1c81:b1d1 with SMTP id
 d75a77b69052e-50639911568mr1586361cf.22.1770317836919;
        Thu, 05 Feb 2026 10:57:16 -0800 (PST)
Received: from [108.27.160.201] ([108.27.160.201])
        by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-506392902f9sm1678331cf.18.2026.02.05.10.57.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 10:57:16 -0800 (PST)
From: Mel Henning <mhenning@darkrefraction.com>
Date: Thu, 05 Feb 2026 13:56:11 -0500
Subject: [PATCH v2 2/2] drm/nouveau: Add DRM_IOCTL_NOUVEAU_GET_ZCULL_INFO
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260205-zcull3-v2-2-ac572f38cc7b@darkrefraction.com>
References: <20260205-zcull3-v2-0-ac572f38cc7b@darkrefraction.com>
In-Reply-To: <20260205-zcull3-v2-0-ac572f38cc7b@darkrefraction.com>
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Mary Guillemard <mary@mary.zone>
X-Mailer: b4 0.14.3
Message-ID-Hash: MDP24OLFCGT6JZBBNLF7MBSM3KCMQ4EU
X-Message-ID-Hash: MDP24OLFCGT6JZBBNLF7MBSM3KCMQ4EU
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/MDP24OLFCGT6JZBBNLF7MBSM3KCMQ4EU/>
Archived-At: 
 <https://lore.freedesktop.org/20260205-zcull3-v2-2-ac572f38cc7b@darkrefraction.com/>
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
index a3ba07fc48a0..91d6f51c5a2f 100644
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
+		return -ENODEV;
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
2.52.0

