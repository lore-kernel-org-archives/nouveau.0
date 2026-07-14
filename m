Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 342FDC44507
	for <nouveau@archiver.kernel.org>; Tue, 14 Jul 2026 21:16:12 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 081A010EE69;
	Tue, 14 Jul 2026 21:16:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="pwW33CHP";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 387DA471A8;
	Tue, 14 Jul 2026 21:00:58 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1784062858;
 b=P58prgRm4R2qTV12EzuXvpxMVEmBGRYgxO+/lgRR0vFL0TCSH9Ju7FsqloJRmcqagderO
 kkUdK+IG6xnK5X3GzBdf9GtgvQk/Mj2jdZeiDqK2/4/FS0hf1+M1Z5majm7C53R7btz329q
 k+rYn3fVBSuIfp8aSXemK9W/IjWwRc4s8w1f1qPBkJ+WQoWTx3VvkWkx/SHe5ZIvhye1LVB
 hl1k76HfaR4FDcErAiQKUqIywvnJ18U7uEybFxX3GKrFkrtCommyY+uBeVrSIEFGVayy6N1
 n5zzXlPzp66Pkn6hkltbRBvxgkySwrdkZS0vZs+MmUi86XLZVEoXRLOGtu+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1784062858; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=bz9kHIGdnWOPLJJAKqHaqyiFFf2vvIYbS2hXbNMvzaM=;
 b=mHqK+lv6a2AL70my806XLG4/bYptqZZh1RilK3d/ZrlcZolrjf8xvEE01qZy++p/ruFJG
 D3bccWT0nGKu0JEZJ1ONIv5Beub+h8feQB0Bol5jwyqnH31qEs4eVjL502W0grGbSXzZMaR
 85ZX18IhvCVCZ5XC2cXsHrDanQDPILFsJALKRCvMRuhom+EQB0lC/zulW5W7jBxUuqpCiJ+
 U+qgV+phFQwuEuJ0vUsDzhVMD5Db0cajZe2G5ClJDRUC8v9O7xw50F+m1B2/Pa7VkCe/o78
 3wVlFSbAN2C5X/dZOnBZ615ULwd6io4thGeZbfVILqWT8jLBsz9ttnW5YvZA==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id DECCE47123
	for <nouveau@lists.freedesktop.org>; Tue, 14 Jul 2026 21:00:54 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6FE1110EE4C
	for <nouveau@lists.freedesktop.org>; Tue, 14 Jul 2026 21:16:08 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-493e4ccccc2so30291135e9.2
        for <nouveau@lists.freedesktop.org>;
 Tue, 14 Jul 2026 14:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784063767; x=1784668567;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bz9kHIGdnWOPLJJAKqHaqyiFFf2vvIYbS2hXbNMvzaM=;
        b=pwW33CHPJE1+Vg+MvchuEpxsZbgdNwn7UP+AJutBB+EgqljZFB/46l30o/+tymWbv6
         jWNf0mfQpEvl6czjw+hXlBYc2Kvmcu0xa+Tce2NtmVtajQaYcWH9G+KqbRIWnqBQn6uT
         uS8XyYsRDqjSfuRIwY+JQKmPtbtabrDT/gpHrdxLrSMukS8hnkXXTBMGFJcf55fcBBQn
         qVexHrdtTe6kSxT/ThSPGU6RrIGUVDxXv9hT1b2NOUDqK3j6dtiAVsFp1NCjF1c+bNo5
         g42DXEM7LXqdR7pl5aRdJtKJvEPtFxEvT9GYBuj/VBzC18/RaWY0+2/dnc6JtWgrM73Y
         I2LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784063767; x=1784668567;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bz9kHIGdnWOPLJJAKqHaqyiFFf2vvIYbS2hXbNMvzaM=;
        b=otiMlzhuxeVWnLK6Jeo0n0lGvK/8E2kRwoAxEoY1E+vlZy4trfi7cURdkhDupAKt2w
         kaVHEcfmjYXFSwXRI039ItBi8wEQrG3zzbofs5VL5Yo23EjjjX9g5ciP7PM0EXQWvtD8
         UMvRv8DSqC+Oeh17q40SbCZQRvltaPYMn8SdvKgTeUK9yxUymhdYkllQG5OXtczDsynl
         u7P8OROLeZ/TeF+cna2Qd1U0KTI1rU2AsakaOmGD9uIwrZtfxfd2+cKoGGvNznqcxL0J
         a/pqU5nmtxx4W/X66JLNclfxuYj8jss5WQLZwCWTRA034KIqBjxRK3HZDIe+u2T9vs+B
         5Dxg==
X-Forwarded-Encrypted: i=1;
 AHgh+RpPdbzhJjNE26+EiQASXX8kn7AOWVCUC9gDw3jLWZP/NkTrWf4J2CvUu7xnUoMB/CO/tngoqqUY@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzoF2JZkWo4zbf3pM5ySWG2qOPBDkMnwVvAW3D3qG69WNoDtJvf
	2ULJa06jiLe/jn/mx9j4ST8xpAIC9WaBzxeBVZbGV24VzOuImgdkQ9CT
X-Gm-Gg: AfdE7cn4UTMWOUInVRgtw0McdJ0g70cM03gbVs/vuTNPul9jwTYHpD8DjPbiy+rWEX1
	DpfbtWcA4+sKgtMJCVWb7vTh7OIo8hFuTBdDKZ87n3/bfhP03arDDd8WZ0RxboyFZy66QAjDuLi
	r1GHT/mV+Y7WhUVRBRHrWiUaZiyCAGC9y/9k5ttzhmtacBpzwWIvkhWsLv0zRiIU9VtxATlgP5f
	l4OZiyjxkV81rIMd4TEqXU78L2yDId1bkCUfvxV4ufmanlUQ+ZIm/tlfhHNO3RCJI7LvWrkdAyO
	Hulwc6/M60hyZEDc866VQ+pQfjA0aQu7zgWygU3Jsg9Y7gOzT7dOULc/KxuSDv7cpWSbsSVnf6R
	1x9lTtht0kPybdfJNMiM2Wps9D/P8U55cn1ZBtUXo/WtdOa9B5fsJi0nKjIJIs1MGv/+3DotzW5
	m0r+CqCztC/bD8aOFuEkJ3
X-Received: by 2002:a05:600d:6454:10b0:493:f764:1f69 with SMTP id
 5b1f17b1804b1-49538992d06mr33976505e9.8.1784063766675;
        Tue, 14 Jul 2026 14:16:06 -0700 (PDT)
Received: from fedora ([94.205.182.68])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4950a32a2casm149843875e9.12.2026.07.14.14.16.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 14:16:05 -0700 (PDT)
From: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 3/6] drm/nouveau: add GSP hwmon support
Date: Wed, 15 Jul 2026 01:14:26 +0400
Message-ID: <20260714211429.238355-4-mohamedahmedegypt2001@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260714211429.238355-1-mohamedahmedegypt2001@gmail.com>
References: <20260714211429.238355-1-mohamedahmedegypt2001@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 3TZ3QZNQFM23HZ5CBBENYXRW7TU6IB4S
X-Message-ID-Hash: 3TZ3QZNQFM23HZ5CBBENYXRW7TU6IB4S
X-MailFrom: mohamedahmedegypt2001@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: dri-devel@lists.freedesktop.org, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Mary Guillemard <mary@mary.zone>, nouveau@lists.freedesktop.org,
 Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/3TZ3QZNQFM23HZ5CBBENYXRW7TU6IB4S/>
Archived-At: 
 <https://lore.freedesktop.org/20260714211429.238355-4-mohamedahmedegypt2001@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

GSP boards currently register no hwmon device at all, so every Turing
through Blackwell user has been running without any temperature or power
readout. Wire the RUSD telemetry up as the first one:

  temp1_input/_label   "gpu"    temperatures[GPU]
  temp2_input/_label   "vram"   temperatures[HBM], HBM boards only
  power1_input/average "gpu"    inst/avg GPU power
  power1_cap                    enforced power limit (read-only)
  power2_input/average "board"  module power, where supported
  power3_average       "vram"   memory rail average, where supported
  update_interval               the programmed RUSD poll interval

All channels are standard hwmon ABI, per-channel visibility is decided
at registration time from live section validity, since support varies
per SKU at runtime. If nothing becomes valid, no hwmon device is
registered, matching today's behaviour on GSP boards.

The legacy therm/volt/iccsense paths are untouched and the new
channels and attributes are gated on RUSD, so pre-GSP boards see no
change.

Signed-off-by: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
---
 drivers/gpu/drm/nouveau/nouveau_hwmon.c | 375 +++++++++++++++++++-----
 1 file changed, 294 insertions(+), 81 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_hwmon.c b/drivers/gpu/drm/nouveau/nouveau_hwmon.c
index 726397ab035d..d449431d4a40 100644
--- a/drivers/gpu/drm/nouveau/nouveau_hwmon.c
+++ b/drivers/gpu/drm/nouveau/nouveau_hwmon.c
@@ -25,6 +25,8 @@
 #ifdef CONFIG_ACPI
 #include <linux/acpi.h>
 #endif
+#include <linux/delay.h>
+#include <linux/jiffies.h>
 #include <linux/power_supply.h>
 #include <linux/hwmon.h>
 #include <linux/hwmon-sysfs.h>
@@ -32,6 +34,7 @@
 #include "nouveau_drv.h"
 #include "nouveau_hwmon.h"
 
+#include <nvkm/subdev/gsp.h>
 #include <nvkm/subdev/iccsense.h>
 #include <nvkm/subdev/volt.h>
 
@@ -215,10 +218,11 @@ static const struct hwmon_channel_info * const nouveau_info[] = {
 	HWMON_CHANNEL_INFO(chip,
 			   HWMON_C_UPDATE_INTERVAL),
 	HWMON_CHANNEL_INFO(temp,
-			   HWMON_T_INPUT |
+			   HWMON_T_INPUT | HWMON_T_LABEL |
 			   HWMON_T_MAX | HWMON_T_MAX_HYST |
 			   HWMON_T_CRIT | HWMON_T_CRIT_HYST |
-			   HWMON_T_EMERGENCY | HWMON_T_EMERGENCY_HYST),
+			   HWMON_T_EMERGENCY | HWMON_T_EMERGENCY_HYST,
+			   HWMON_T_INPUT | HWMON_T_LABEL),
 	HWMON_CHANNEL_INFO(fan,
 			   HWMON_F_INPUT),
 	HWMON_CHANNEL_INFO(in,
@@ -228,7 +232,10 @@ static const struct hwmon_channel_info * const nouveau_info[] = {
 	HWMON_CHANNEL_INFO(pwm,
 			   HWMON_PWM_INPUT | HWMON_PWM_ENABLE),
 	HWMON_CHANNEL_INFO(power,
-			   HWMON_P_INPUT | HWMON_P_CAP_MAX | HWMON_P_CRIT),
+			   HWMON_P_INPUT | HWMON_P_MAX | HWMON_P_CRIT |
+			   HWMON_P_AVERAGE | HWMON_P_CAP | HWMON_P_LABEL,
+			   HWMON_P_INPUT | HWMON_P_AVERAGE | HWMON_P_LABEL,
+			   HWMON_P_AVERAGE | HWMON_P_LABEL),
 	NULL
 };
 
@@ -243,52 +250,144 @@ nouveau_chip_is_visible(const void *data, u32 attr, int channel)
 	}
 }
 
-static umode_t
-nouveau_power_is_visible(const void *data, u32 attr, int channel)
+static bool
+nouveau_rusd_ok(struct nvkm_gsp *gsp, enum nvkm_gsp_rusd_item item)
 {
-	struct nouveau_drm *drm = nouveau_drm((struct drm_device *)data);
-	struct nvkm_iccsense *iccsense = nvxx_iccsense(drm);
+	int retries = 3;
+	s64 val;
+	int ret;
 
-	if (!iccsense || !iccsense->data_valid || list_empty(&iccsense->rails))
-		return 0;
+	/* Visibility decisions are made only once at registration. So retry
+	 * to avoid letting racing a GSP write window (-EAGAIN) hide a channel
+	 * for good.
+	 */
+	do {
+		ret = nvkm_gsp_rusd_read(gsp, item, &val);
+		if (ret != -EAGAIN)
+			break;
+		usleep_range(100, 200);
+	} while (--retries);
+
+	return ret == 0;
+}
 
+static umode_t
+nouveau_rusd_power_is_visible(struct nvkm_gsp *gsp, u32 attr, int channel)
+{
 	switch (attr) {
 	case hwmon_power_input:
-		return 0444;
-	case hwmon_power_max:
-		if (iccsense->power_w_max)
+		if (channel == 0 && nouveau_rusd_ok(gsp, NVKM_GSP_RUSD_POWER_GPU))
+			return 0444;
+		if (channel == 1 && nouveau_rusd_ok(gsp, NVKM_GSP_RUSD_POWER_BOARD))
+			return 0444;
+		return 0;
+	case hwmon_power_average:
+		if (channel == 0 && nouveau_rusd_ok(gsp, NVKM_GSP_RUSD_POWER_GPU_AVG))
+			return 0444;
+		if (channel == 1 && nouveau_rusd_ok(gsp, NVKM_GSP_RUSD_POWER_BOARD_AVG))
+			return 0444;
+		if (channel == 2 && nouveau_rusd_ok(gsp, NVKM_GSP_RUSD_POWER_VRAM_AVG))
 			return 0444;
 		return 0;
-	case hwmon_power_crit:
-		if (iccsense->power_w_crit)
+	case hwmon_power_cap:
+		/* The enforced limit is only telemetry here. Setting it needs ctrls nouveau
+		 * doesn't implement.
+		 */
+		if (channel == 0 && nouveau_rusd_ok(gsp, NVKM_GSP_RUSD_POWER_CAP))
 			return 0444;
 		return 0;
+	case hwmon_power_label:
+		switch (channel) {
+		case 0:
+			if (nouveau_rusd_ok(gsp, NVKM_GSP_RUSD_POWER_GPU) ||
+			    nouveau_rusd_ok(gsp, NVKM_GSP_RUSD_POWER_GPU_AVG) ||
+			    nouveau_rusd_ok(gsp, NVKM_GSP_RUSD_POWER_CAP))
+				return 0444;
+			break;
+		case 1:
+			if (nouveau_rusd_ok(gsp, NVKM_GSP_RUSD_POWER_BOARD) ||
+			    nouveau_rusd_ok(gsp, NVKM_GSP_RUSD_POWER_BOARD_AVG))
+				return 0444;
+			break;
+		case 2:
+			if (nouveau_rusd_ok(gsp, NVKM_GSP_RUSD_POWER_VRAM_AVG))
+				return 0444;
+			break;
+		}
+		return 0;
 	default:
 		return 0;
 	}
 }
 
 static umode_t
-nouveau_temp_is_visible(const void *data, u32 attr, int channel)
+nouveau_power_is_visible(const void *data, u32 attr, int channel)
 {
 	struct nouveau_drm *drm = nouveau_drm((struct drm_device *)data);
-	struct nvkm_therm *therm = nvxx_therm(drm);
+	struct nvkm_iccsense *iccsense = nvxx_iccsense(drm);
+	struct nvkm_device *device = drm->nvkm;
+	struct nvkm_gsp *gsp = device->gsp;
 
-	if (!therm || !therm->attr_get || nvkm_therm_temp_get(therm) < 0)
-		return 0;
+	if (nvkm_gsp_rusd(gsp))
+		return nouveau_rusd_power_is_visible(gsp, attr, channel);
+	else {
+		if (!iccsense || !iccsense->data_valid || list_empty(&iccsense->rails))
+			return 0;
 
-	switch (attr) {
-	case hwmon_temp_input:
-		return 0444;
-	case hwmon_temp_max:
-	case hwmon_temp_max_hyst:
-	case hwmon_temp_crit:
-	case hwmon_temp_crit_hyst:
-	case hwmon_temp_emergency:
-	case hwmon_temp_emergency_hyst:
-		return 0644;
-	default:
-		return 0;
+		switch (attr) {
+		case hwmon_power_input:
+			return 0444;
+		case hwmon_power_max:
+			if (iccsense->power_w_max)
+				return 0444;
+			return 0;
+		case hwmon_power_crit:
+			if (iccsense->power_w_crit)
+				return 0444;
+			return 0;
+		default:
+			return 0;
+		}
+	}
+}
+
+static umode_t
+nouveau_temp_is_visible(const void *data, u32 attr, int channel)
+{
+	struct nouveau_drm *drm = nouveau_drm((struct drm_device *)data);
+	struct nvkm_therm *therm = nvxx_therm(drm);
+	struct nvkm_device *device = drm->nvkm;
+	struct nvkm_gsp *gsp = device->gsp;
+
+	if (nvkm_gsp_rusd(gsp)) {
+		switch (attr) {
+		case hwmon_temp_input:
+		case hwmon_temp_label:
+			if (nouveau_rusd_ok(gsp, channel ? NVKM_GSP_RUSD_TEMP_HBM :
+							   NVKM_GSP_RUSD_TEMP_GPU))
+				return 0444;
+			return 0;
+		default:
+			/* No threshold data in the RUSD buffer. */
+			return 0;
+		}
+	} else {
+		if (!therm || !therm->attr_get || nvkm_therm_temp_get(therm) < 0)
+			return 0;
+
+		switch (attr) {
+		case hwmon_temp_input:
+			return 0444;
+		case hwmon_temp_max:
+		case hwmon_temp_max_hyst:
+		case hwmon_temp_crit:
+		case hwmon_temp_crit_hyst:
+		case hwmon_temp_emergency:
+		case hwmon_temp_emergency_hyst:
+			return 0644;
+		default:
+			return 0;
+		}
 	}
 }
 
@@ -351,9 +450,13 @@ nouveau_fan_is_visible(const void *data, u32 attr, int channel)
 static int
 nouveau_chip_read(struct device *dev, u32 attr, int channel, long *val)
 {
+	struct nouveau_drm *drm = nouveau_drm(dev_get_drvdata(dev));
+	struct nvkm_device *device = drm->nvkm;
+	struct nvkm_gsp *gsp = device->gsp;
+
 	switch (attr) {
 	case hwmon_chip_update_interval:
-		*val = 1000;
+		*val = nvkm_gsp_rusd(gsp) ? gsp->rusd.poll_ms : 1000;
 		break;
 	default:
 		return -EOPNOTSUPP;
@@ -368,47 +471,67 @@ nouveau_temp_read(struct device *dev, u32 attr, int channel, long *val)
 	struct drm_device *drm_dev = dev_get_drvdata(dev);
 	struct nouveau_drm *drm = nouveau_drm(drm_dev);
 	struct nvkm_therm *therm = nvxx_therm(drm);
+	struct nvkm_device *device = drm->nvkm;
+	struct nvkm_gsp *gsp = device->gsp;
 	int ret;
 
-	if (!therm || !therm->attr_get)
-		return -EOPNOTSUPP;
+	if (nvkm_gsp_rusd(gsp)) {
+		s64 value;
+
+		if (attr != hwmon_temp_input)
+			return -EOPNOTSUPP;
 
-	switch (attr) {
-	case hwmon_temp_input:
 		if (drm_dev->switch_power_state != DRM_SWITCH_POWER_ON)
 			return -EINVAL;
-		ret = nvkm_therm_temp_get(therm);
-		*val = ret < 0 ? ret : (ret * 1000);
-		break;
-	case hwmon_temp_max:
-		*val = therm->attr_get(therm, NVKM_THERM_ATTR_THRS_DOWN_CLK)
-					* 1000;
-		break;
-	case hwmon_temp_max_hyst:
-		*val = therm->attr_get(therm, NVKM_THERM_ATTR_THRS_DOWN_CLK_HYST)
-					* 1000;
-		break;
-	case hwmon_temp_crit:
-		*val = therm->attr_get(therm, NVKM_THERM_ATTR_THRS_CRITICAL)
-					* 1000;
-		break;
-	case hwmon_temp_crit_hyst:
-		*val = therm->attr_get(therm, NVKM_THERM_ATTR_THRS_CRITICAL_HYST)
-					* 1000;
-		break;
-	case hwmon_temp_emergency:
-		*val = therm->attr_get(therm, NVKM_THERM_ATTR_THRS_SHUTDOWN)
-					* 1000;
-		break;
-	case hwmon_temp_emergency_hyst:
-		*val = therm->attr_get(therm, NVKM_THERM_ATTR_THRS_SHUTDOWN_HYST)
-					* 1000;
-		break;
-	default:
-		return -EOPNOTSUPP;
-	}
 
-	return 0;
+		ret = nvkm_gsp_rusd_read(gsp, channel ? NVKM_GSP_RUSD_TEMP_HBM :
+							NVKM_GSP_RUSD_TEMP_GPU, &value);
+		if (ret)
+			return ret;
+
+		*val = value;
+		return 0;
+	} else {
+		if (!therm || !therm->attr_get)
+			return -EOPNOTSUPP;
+
+		switch (attr) {
+		case hwmon_temp_input:
+			if (drm_dev->switch_power_state != DRM_SWITCH_POWER_ON)
+				return -EINVAL;
+			ret = nvkm_therm_temp_get(therm);
+			*val = ret < 0 ? ret : (ret * 1000);
+			break;
+		case hwmon_temp_max:
+			*val = therm->attr_get(therm, NVKM_THERM_ATTR_THRS_DOWN_CLK)
+						* 1000;
+			break;
+		case hwmon_temp_max_hyst:
+			*val = therm->attr_get(therm, NVKM_THERM_ATTR_THRS_DOWN_CLK_HYST)
+						* 1000;
+			break;
+		case hwmon_temp_crit:
+			*val = therm->attr_get(therm, NVKM_THERM_ATTR_THRS_CRITICAL)
+						* 1000;
+			break;
+		case hwmon_temp_crit_hyst:
+			*val = therm->attr_get(therm, NVKM_THERM_ATTR_THRS_CRITICAL_HYST)
+						* 1000;
+			break;
+		case hwmon_temp_emergency:
+			*val = therm->attr_get(therm, NVKM_THERM_ATTR_THRS_SHUTDOWN)
+						* 1000;
+			break;
+		case hwmon_temp_emergency_hyst:
+			*val = therm->attr_get(therm, NVKM_THERM_ATTR_THRS_SHUTDOWN_HYST)
+						* 1000;
+			break;
+		default:
+			return -EOPNOTSUPP;
+		}
+
+		return 0;
+	}
 }
 
 static int
@@ -492,34 +615,84 @@ nouveau_pwm_read(struct device *dev, u32 attr, int channel, long *val)
 }
 
 static int
-nouveau_power_read(struct device *dev, u32 attr, int channel, long *val)
+nouveau_rusd_power_read(struct drm_device *drm_dev, struct nvkm_gsp *gsp,
+			u32 attr, int channel, long *val)
 {
-	struct drm_device *drm_dev = dev_get_drvdata(dev);
-	struct nouveau_drm *drm = nouveau_drm(drm_dev);
-	struct nvkm_iccsense *iccsense = nvxx_iccsense(drm);
-
-	if (!iccsense)
-		return -EOPNOTSUPP;
+	enum nvkm_gsp_rusd_item item;
+	s64 value;
+	int ret;
 
 	switch (attr) {
 	case hwmon_power_input:
-		if (drm_dev->switch_power_state != DRM_SWITCH_POWER_ON)
-			return -EINVAL;
-		*val = nvkm_iccsense_read_all(iccsense);
+		if (channel == 2)
+			return -EOPNOTSUPP;
+		item = channel ? NVKM_GSP_RUSD_POWER_BOARD :
+				 NVKM_GSP_RUSD_POWER_GPU;
 		break;
-	case hwmon_power_max:
-		*val = iccsense->power_w_max;
+	case hwmon_power_average:
+		if (channel == 0)
+			item = NVKM_GSP_RUSD_POWER_GPU_AVG;
+		else if (channel == 1)
+			item = NVKM_GSP_RUSD_POWER_BOARD_AVG;
+		else
+			item = NVKM_GSP_RUSD_POWER_VRAM_AVG;
 		break;
-	case hwmon_power_crit:
-		*val = iccsense->power_w_crit;
+	case hwmon_power_cap:
+		if (channel)
+			return -EOPNOTSUPP;
+		item = NVKM_GSP_RUSD_POWER_CAP;
 		break;
 	default:
 		return -EOPNOTSUPP;
 	}
 
+	if (drm_dev->switch_power_state != DRM_SWITCH_POWER_ON)
+		return -EINVAL;
+
+	ret = nvkm_gsp_rusd_read(gsp, item, &value);
+	if (ret)
+		return ret;
+
+	*val = value;
+
 	return 0;
 }
 
+static int
+nouveau_power_read(struct device *dev, u32 attr, int channel, long *val)
+{
+	struct drm_device *drm_dev = dev_get_drvdata(dev);
+	struct nouveau_drm *drm = nouveau_drm(drm_dev);
+	struct nvkm_iccsense *iccsense = nvxx_iccsense(drm);
+	struct nvkm_device *device = drm->nvkm;
+	struct nvkm_gsp *gsp = device->gsp;
+
+	if (nvkm_gsp_rusd(gsp))
+		return nouveau_rusd_power_read(drm_dev, gsp, attr, channel, val);
+	else {
+		if (!iccsense)
+			return -EOPNOTSUPP;
+
+		switch (attr) {
+		case hwmon_power_input:
+			if (drm_dev->switch_power_state != DRM_SWITCH_POWER_ON)
+				return -EINVAL;
+			*val = nvkm_iccsense_read_all(iccsense);
+			break;
+		case hwmon_power_max:
+			*val = iccsense->power_w_max;
+			break;
+		case hwmon_power_crit:
+			*val = iccsense->power_w_crit;
+			break;
+		default:
+			return -EOPNOTSUPP;
+		}
+
+		return 0;
+	}
+}
+
 static int
 nouveau_temp_write(struct device *dev, u32 attr, int channel, long val)
 {
@@ -597,6 +770,8 @@ nouveau_is_visible(const void *data, enum hwmon_sensor_types type, u32 attr,
 }
 
 static const char input_label[] = "GPU core";
+static const char * const nouveau_temp_labels[] = { "gpu", "vram" };
+static const char * const nouveau_power_labels[] = { "gpu", "board", "vram" };
 
 static int
 nouveau_read_string(struct device *dev, enum hwmon_sensor_types type, u32 attr,
@@ -607,6 +782,18 @@ nouveau_read_string(struct device *dev, enum hwmon_sensor_types type, u32 attr,
 		return 0;
 	}
 
+	if (type == hwmon_temp && attr == hwmon_temp_label &&
+	    channel < ARRAY_SIZE(nouveau_temp_labels)) {
+		*buf = nouveau_temp_labels[channel];
+		return 0;
+	}
+
+	if (type == hwmon_power && attr == hwmon_power_label &&
+	    channel < ARRAY_SIZE(nouveau_power_labels)) {
+		*buf = nouveau_power_labels[channel];
+		return 0;
+	}
+
 	return -EOPNOTSUPP;
 }
 
@@ -667,13 +854,39 @@ nouveau_hwmon_init(struct drm_device *dev)
 	struct nvkm_iccsense *iccsense = nvxx_iccsense(drm);
 	struct nvkm_therm *therm = nvxx_therm(drm);
 	struct nvkm_volt *volt = nvxx_volt(drm);
+	struct nvkm_device *device = drm->nvkm;
+	struct nvkm_gsp *gsp = device->gsp;
 	const struct attribute_group *special_groups[N_ATTR_GROUPS];
 	struct nouveau_hwmon *hwmon;
 	struct device *hwmon_dev;
+	bool rusd_active = false;
 	int ret = 0;
 	int i = 0;
 
-	if (!iccsense && !therm && !volt) {
+	if (nvkm_gsp_rusd(gsp)) {
+		/* Per-channel visibility is latched below from live RUSD
+		 * section validity, so wait for GSP-RM's first poll of both
+		 * requested groups (thermal, power). It is normally completed
+		 * long before we get here and this is a last resort.
+		 */
+		unsigned long timeout = jiffies +
+			msecs_to_jiffies(2 * gsp->rusd.poll_ms);
+		bool thermal, power;
+
+		for (;;) {
+			thermal = nouveau_rusd_ok(gsp, NVKM_GSP_RUSD_TEMP_GPU);
+			power = nouveau_rusd_ok(gsp, NVKM_GSP_RUSD_POWER_GPU) ||
+				nouveau_rusd_ok(gsp, NVKM_GSP_RUSD_POWER_GPU_AVG) ||
+				nouveau_rusd_ok(gsp, NVKM_GSP_RUSD_POWER_CAP);
+			if ((thermal && power) || !time_before(jiffies, timeout))
+				break;
+			msleep(20);
+		}
+
+		rusd_active = thermal || power;
+	}
+
+	if (!iccsense && !therm && !volt && !rusd_active) {
 		NV_DEBUG(drm, "Skipping hwmon registration\n");
 		return 0;
 	}
-- 
2.55.0

