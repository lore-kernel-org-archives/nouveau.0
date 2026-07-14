Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B72EAC43458
	for <nouveau@archiver.kernel.org>; Tue, 14 Jul 2026 21:16:33 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 94BE110EE6E;
	Tue, 14 Jul 2026 21:16:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TDVUca3h";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id C9F84471B1;
	Tue, 14 Jul 2026 21:01:19 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1784062879;
 b=Se2p3XekB9jg4oyGqho7kWkTQuPAkLvZlh6cAfUj+ydk9+ZaDwDmaj3iZL+U/NfKlotoO
 budlUEJhZlMPSE/r5zMShqvWLUz6MIO95l8ZANnVdWI2SVFf72ilTBNvGazmsNJiJGW172R
 Di0vkU6h+Wmu6G5ib7tArmMD08Viksijk+pbjlieF2chbhXiYxlFtAKawvdB46xER3RSDHO
 UTSJ1P2kUybfRuyJhjQ5uFRrjnQf45zr8DgoW3vmqJUlW9xB7u0jLDczmQjvQcEH4Q0TVOa
 +iz7o3MNv+863NMd3hDRXYplv5vXlQSZ9QQnhLENIhZapHUaby+ygiZ+MsiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1784062879; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=/0bDbsUAsCNrKRVFeKWSEZSKWRta+w0G44odHsje0xU=;
 b=dhepkzamgzMsYkKfoUs0VH65DNOP/8x+uQn9N1it7mltWsNli0Jt09tx+CGvmndL/7ezq
 8rNnGPYwI7b9TrU8A6yvfOJY1D9H+q8dsKhMIk8fRxiPnvjOkf6sTcJJHBA/9V6X15UNEdg
 QD3oCjh4fXEiDe+avlTZ8+MMqEWu2aeQr6PdIWp9nA7uNm4eVNA/Ua3p36kAIqEDvlysHaL
 quXEz4Hch+hKpXVpEkZC03DzBGC9g2mOTBzm8+4CKCBFibJ+JzXSQWztif2+1jTWHUEa4RU
 VTNJIJmaToHvC28guCBI2j2Blx2qT/Y/gXGSVsJ1fD1NVu0M0ezpKcB9kh3w==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 241FA47123
	for <nouveau@lists.freedesktop.org>; Tue, 14 Jul 2026 21:01:18 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C08AC10EE5A
	for <nouveau@lists.freedesktop.org>; Tue, 14 Jul 2026 21:16:31 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-493f140ca8eso28802905e9.1
        for <nouveau@lists.freedesktop.org>;
 Tue, 14 Jul 2026 14:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784063790; x=1784668590;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/0bDbsUAsCNrKRVFeKWSEZSKWRta+w0G44odHsje0xU=;
        b=TDVUca3hGY163A+s78reNf6YxDGDIE+4u+hZwDzj4zLfugXX6r0YERlKd7XdIN62gk
         /5pJfrhzd/IRct9dGwoKBgfah97tttHZYchPPM+FDp8dbiJyi7rg+ACuDFrmI9zJ5cHh
         xojaV/Pg6gfXSlCalWUMIK7cNPRUJ3kCLvBbGIO66Gl3GgGhoIANliEuZ7kQPcmxrSUG
         QYMsOo/UVJk7Z4P2oaCZMw93/x7F5UN6RFm8/yr1flGIyMNVWO/Y3fDAHzxNZjA/P4SW
         EY70P1rz7bC2rQ45wZLL/JnZaR9A/Vq/sxcnMvpIbBrIlEN4FEDBhRY9UgE0cZmCrJH9
         AXtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784063790; x=1784668590;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/0bDbsUAsCNrKRVFeKWSEZSKWRta+w0G44odHsje0xU=;
        b=j/Jbu6L2nrYOEt4SMqVYqhPnEESDGDXB/8+wFS4NMCEIbZoTJ/mhvlYg1j9qEArSWd
         pY7szGcsDI8NbHUlGx3QeWnFaHIWgPxl78sNjsk/Y70WcjdHjD5WNA0oi6aMkce+Oe/T
         zSk5DgSTAQ620DjaEroWUL08CJYB5XLP9eQz3RZibsZbr64qtiCqffB+FX829gNqsrws
         MSRuc5PzLC3/c1ctDCfEAzkR/pGF3Ekj/tBPF7uA5SNCFy94QThWo52I2VE2GdaIbsgh
         LahZqfw2WnJo/hiMVr6OSILqhuGnqgC37QC+XaITtG9zyNnnDenoAT+wwgYmFx2hk8gl
         /Xng==
X-Forwarded-Encrypted: i=1;
 AHgh+Rrds0iq9rfZlU+N1ArDuWhj9dUkeIfPqcRNcXrnhZOHiY+KL3YvMIEqSN9GI9uQb874eqarpJ83@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyChDKOnjsASK5hzrzUjzf6MIZjZrskPfpHSBVMX7IKKks0gwet
	VqA0pvsRUYNdq8liidtMoCAkKq4Nw+7K1l+tfVrlbPCtOxqGPr0tbZGG
X-Gm-Gg: AfdE7clUhz0RwJMjgReRCIl4f6pZXXULtTa2pZs7+m8Ye4HeOTuY9w6Hw3q/zBVDVZD
	aJbWErkDSJgdmjAXMUE3NNdBLCxsmRvevVfOReIjR03BGeM4ALEKxUJcQESA28ROq/cbRd/ZRt9
	/IRcF7bQMdoc8UdbEwO0HuNkLHp5p6ahZw5f/JdqK3M8RJKB+SUIfjgCJTfYLKYh9SKWFMP2uI8
	REKWxk3udj9V0jzVNiqhTPiHq5jxkFTylgxVxV+2/8j3050ugH+NdcJ2uY0jIF8c84ABVCSNYp9
	hs1Qj2vyMO4CCMrwISvhScboSSC4gmXRkj5u5wavTX7c3wbyZKE1gdR7SD/0+uOT/zZC2Zzf2Y3
	Uhn/XhN8NpWjCKgansRvnp/aQLPz770lN+mTctA3kWQQBkuZu2PhxKAtg02D/gaLqCirzfrBJgY
	8vpKBzc+cL4AO76aVV+vzvRK4NsPMlPmc=
X-Received: by 2002:a05:600c:c84:b0:493:ece1:86b9 with SMTP id
 5b1f17b1804b1-495389cdfbdmr41072165e9.8.1784063790070;
        Tue, 14 Jul 2026 14:16:30 -0700 (PDT)
Received: from fedora ([94.205.182.68])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4950a32a2casm149843875e9.12.2026.07.14.14.16.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 14:16:28 -0700 (PDT)
From: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 5/6] drm/nouveau: expose global VRAM size and usage via sysfs
Date: Wed, 15 Jul 2026 01:14:28 +0400
Message-ID: <20260714211429.238355-6-mohamedahmedegypt2001@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260714211429.238355-1-mohamedahmedegypt2001@gmail.com>
References: <20260714211429.238355-1-mohamedahmedegypt2001@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: KQ276MFTHU43CMYAJGBLD5S4CQ63XKYY
X-Message-ID-Hash: KQ276MFTHU43CMYAJGBLD5S4CQ63XKYY
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/KQ276MFTHU43CMYAJGBLD5S4CQ63XKYY/>
Archived-At: 
 <https://lore.freedesktop.org/20260714211429.238355-6-mohamedahmedegypt2001@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Monitoring tools want a device-wide VRAM total and current usage, but
nouveau exposed neither outside of NOUVEAU_GETPARAM ioctls, which are
awkward to use for some tools as they rely on pulling libdrm.

Add two read-only files in a device attribute group:

  mem_info_vram_total  user-accessible VRAM, i.e. NOUVEAU_GETPARAM_FB_SIZE
  mem_info_vram_used   bytes currently allocated from the VRAM TTM manager

Both read nouveau's own framebuffer and TTM accounting, the exact source
behind the FB_SIZE/VRAM_USED getparams, so they need no GSP and are
present on every board, unlike the GSP-only RUSD group. total is the size
of the pool used draws from, so used never exceeds total. used counts only
memory nouveau itself allocated and can read below firmware-reserved usage.

Signed-off-by: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
---
 .../ABI/testing/sysfs-driver-nouveau          | 17 +++++-
 drivers/gpu/drm/nouveau/nouveau_drv.h         |  1 +
 drivers/gpu/drm/nouveau/nouveau_sysfs.c       | 61 +++++++++++++++++++
 3 files changed, 78 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-driver-nouveau b/Documentation/ABI/testing/sysfs-driver-nouveau
index 947474b9955d..968c3ac0c464 100644
--- a/Documentation/ABI/testing/sysfs-driver-nouveau
+++ b/Documentation/ABI/testing/sysfs-driver-nouveau
@@ -149,4 +149,19 @@ Date:		June 2026
 Contact:	nouveau <nouveau@lists.freedesktop.org>
 Description:
 		PCIe link telemetry. pcie_gen is a packed gen/width bitfield;
-		the remaining files are link error and event counters.
\ No newline at end of file
+		the remaining files are link error and event counters.
+
+What:		/sys/class/drm/card<n>/device/mem_info_vram_total
+What:		/sys/class/drm/card<n>/device/mem_info_vram_used
+Date:		June 2026
+Contact:	nouveau <nouveau@lists.freedesktop.org>
+Description:
+		The amount of VRAM usable for allocations and the amount currently
+		in use, in bytes, world-readable and read-only. mem_info_vram_total
+		is the installed VRAM minus the region firmware reserves. This is the
+		same value as NOUVEAU_GETPARAM_FB_SIZE, so it can read slightly below
+		the card's marketed size, and it is the size of the pool that
+		mem_info_vram_used draws from (so used never exceeds total). Both
+		come from nouveau's own framebuffer and TTM accounting (the same
+		source as the FB_SIZE/VRAM_USED ioctls) and are present on every
+		nouveau board, independent of GSP-RM.
\ No newline at end of file
diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index a3e343085cc1..a8ca86556e2f 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -297,6 +297,7 @@ struct nouveau_drm {
 	struct nouveau_hwmon *hwmon;
 	struct nouveau_debugfs *debugfs;
 	bool rusd_sysfs;
+	bool mem_sysfs;
 
 	/* led management */
 	struct nouveau_led *led;
diff --git a/drivers/gpu/drm/nouveau/nouveau_sysfs.c b/drivers/gpu/drm/nouveau/nouveau_sysfs.c
index f3d9462deaba..789b3781bedc 100644
--- a/drivers/gpu/drm/nouveau/nouveau_sysfs.c
+++ b/drivers/gpu/drm/nouveau/nouveau_sysfs.c
@@ -7,11 +7,18 @@
  * file is one decoded value; nvkm owns the units and conversions. A section
  * that is not supported on this board, or has not been polled yet, reads
  * -ENODATA. See Documentation/ABI/testing/sysfs-driver-nouveau for units.
+ *
+ * Also exposes global VRAM size and usage (mem_info_vram_total/used, bytes)
+ * from nouveau's own FB/TTM accounting. Unlike RUSD these do not need GSP and
+ * are present on every board.
  */
 #include <linux/device.h>
 #include <linux/hwmon-sysfs.h>
 #include <linux/sysfs.h>
 
+#include <drm/ttm/ttm_placement.h>
+#include <drm/ttm/ttm_resource.h>
+
 #include "nouveau_drv.h"
 #include "nouveau_sysfs.h"
 
@@ -214,11 +221,60 @@ static const struct attribute_group rusd_group = {
 	.attrs = rusd_attrs,
 };
 
+/*
+ * Global VRAM size and current usage, in bytes. These use the same source as the
+ * NOUVEAU_GETPARAM_FB_SIZE/VRAM_USED ioctls, and are exposed here as a more
+ * convenient way for monitoring tools to access the data.
+ *
+ * Unlike the RUSD group these need no GSP and are present on every board.
+ */
+static ssize_t
+mem_info_vram_total_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct nouveau_drm *drm = dev_get_drvdata(dev);
+
+	return sysfs_emit(buf, "%llu\n", drm->client.device.info.ram_user);
+}
+static DEVICE_ATTR_RO(mem_info_vram_total);
+
+static ssize_t
+mem_info_vram_used_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct nouveau_drm *drm = dev_get_drvdata(dev);
+	struct ttm_resource_manager *vram = ttm_manager_type(&drm->ttm.bdev, TTM_PL_VRAM);
+
+	return sysfs_emit(buf, "%llu\n", ttm_resource_manager_usage(vram));
+}
+static DEVICE_ATTR_RO(mem_info_vram_used);
+
+static struct attribute *nouveau_mem_attrs[] = {
+	&dev_attr_mem_info_vram_total.attr,
+	&dev_attr_mem_info_vram_used.attr,
+	NULL,
+};
+
+static const struct attribute_group nouveau_mem_group = {
+	.attrs = nouveau_mem_attrs,
+};
+
 int
 nouveau_sysfs_init(struct nouveau_drm *drm)
 {
 	int ret;
 
+	/*
+	 * VRAM size/usage comes from nouveau's own accounting, so this group is
+	 * present on every board (GSP or legacy).
+	 *
+	 * The group is NOT devm-managed on drm->dev->dev: that device's devres
+	 * outlives nouveau's remove path (which frees the drm objects the files
+	 * read), so it is torn down explicitly in nouveau_sysfs_fini() before that.
+	 */
+	ret = device_add_group(drm->dev->dev, &nouveau_mem_group);
+	if (ret)
+		return ret;
+	drm->mem_sysfs = true;
+
 	/*
 	 * Only GPUs running GSP with RUSD registered (r570+) get the group. On
 	 * everything else there is nothing to expose. All files appear when RUSD
@@ -247,4 +303,9 @@ nouveau_sysfs_fini(struct nouveau_drm *drm)
 		device_remove_group(drm->dev->dev, &rusd_group);
 		drm->rusd_sysfs = false;
 	}
+
+	if (drm->mem_sysfs) {
+		device_remove_group(drm->dev->dev, &nouveau_mem_group);
+		drm->mem_sysfs = false;
+	}
 }
-- 
2.55.0

