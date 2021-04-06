Return-Path: <SRS0=Cz6h=JD=lists.freedesktop.org=nouveau-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C9D5C433B4
	for <nouveau@archiver.kernel.org>; Tue,  6 Apr 2021 08:29:59 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9BAF613BE
	for <nouveau@archiver.kernel.org>; Tue,  6 Apr 2021 08:29:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C9BAF613BE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=nouveau-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 718576E5CF;
	Tue,  6 Apr 2021 08:29:48 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6403689F2D;
 Tue,  6 Apr 2021 08:29:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id EBB41B12F;
 Tue,  6 Apr 2021 08:29:44 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, bskeggs@redhat.com, kraxel@redhat.com
Date: Tue,  6 Apr 2021 10:29:40 +0200
Message-Id: <20210406082942.24049-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210406082942.24049-1-tzimmermann@suse.de>
References: <20210406082942.24049-1-tzimmermann@suse.de>
MIME-Version: 1.0
Subject: [Nouveau] [PATCH 2/4] drm/vram-helper: Use
 drm_gem_ttm_dumb_map_offset()
X-BeenThere: nouveau@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=subscribe>
Cc: nouveau@lists.freedesktop.org, spice-devel@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

VRAM helpers now use drm_gem_ttm_dumb_map_offset() to implement
struct drm_driver.dumb_map_offset.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_gem_vram_helper.c | 48 ---------------------------
 include/drm/drm_gem_vram_helper.h     |  7 ++--
 2 files changed, 2 insertions(+), 53 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index 2b7c3a07956d..797200315854 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -245,22 +245,6 @@ void drm_gem_vram_put(struct drm_gem_vram_object *gbo)
 }
 EXPORT_SYMBOL(drm_gem_vram_put);
 
-/**
- * drm_gem_vram_mmap_offset() - Returns a GEM VRAM object's mmap offset
- * @gbo:	the GEM VRAM object
- *
- * See drm_vma_node_offset_addr() for more information.
- *
- * Returns:
- * The buffer object's offset for userspace mappings on success, or
- * 0 if no offset is allocated.
- */
-u64 drm_gem_vram_mmap_offset(struct drm_gem_vram_object *gbo)
-{
-	return drm_vma_node_offset_addr(&gbo->bo.base.vma_node);
-}
-EXPORT_SYMBOL(drm_gem_vram_mmap_offset);
-
 static u64 drm_gem_vram_pg_offset(struct drm_gem_vram_object *gbo)
 {
 	/* Keep TTM behavior for now, remove when drivers are audited */
@@ -638,38 +622,6 @@ int drm_gem_vram_driver_dumb_create(struct drm_file *file,
 }
 EXPORT_SYMBOL(drm_gem_vram_driver_dumb_create);
 
-/**
- * drm_gem_vram_driver_dumb_mmap_offset() - \
-	Implements &struct drm_driver.dumb_mmap_offset
- * @file:	DRM file pointer.
- * @dev:	DRM device.
- * @handle:	GEM handle
- * @offset:	Returns the mapping's memory offset on success
- *
- * Returns:
- * 0 on success, or
- * a negative errno code otherwise.
- */
-int drm_gem_vram_driver_dumb_mmap_offset(struct drm_file *file,
-					 struct drm_device *dev,
-					 uint32_t handle, uint64_t *offset)
-{
-	struct drm_gem_object *gem;
-	struct drm_gem_vram_object *gbo;
-
-	gem = drm_gem_object_lookup(file, handle);
-	if (!gem)
-		return -ENOENT;
-
-	gbo = drm_gem_vram_of_gem(gem);
-	*offset = drm_gem_vram_mmap_offset(gbo);
-
-	drm_gem_object_put(gem);
-
-	return 0;
-}
-EXPORT_SYMBOL(drm_gem_vram_driver_dumb_mmap_offset);
-
 /*
  * Helpers for struct drm_plane_helper_funcs
  */
diff --git a/include/drm/drm_gem_vram_helper.h b/include/drm/drm_gem_vram_helper.h
index 288055d397d9..27ed7e9243b9 100644
--- a/include/drm/drm_gem_vram_helper.h
+++ b/include/drm/drm_gem_vram_helper.h
@@ -5,6 +5,7 @@
 
 #include <drm/drm_file.h>
 #include <drm/drm_gem.h>
+#include <drm/drm_gem_ttm_helper.h>
 #include <drm/drm_ioctl.h>
 #include <drm/drm_modes.h>
 #include <drm/ttm/ttm_bo_api.h>
@@ -93,7 +94,6 @@ struct drm_gem_vram_object *drm_gem_vram_create(struct drm_device *dev,
 						size_t size,
 						unsigned long pg_align);
 void drm_gem_vram_put(struct drm_gem_vram_object *gbo);
-u64 drm_gem_vram_mmap_offset(struct drm_gem_vram_object *gbo);
 s64 drm_gem_vram_offset(struct drm_gem_vram_object *gbo);
 int drm_gem_vram_pin(struct drm_gem_vram_object *gbo, unsigned long pl_flag);
 int drm_gem_vram_unpin(struct drm_gem_vram_object *gbo);
@@ -113,9 +113,6 @@ int drm_gem_vram_fill_create_dumb(struct drm_file *file,
 int drm_gem_vram_driver_dumb_create(struct drm_file *file,
 				    struct drm_device *dev,
 				    struct drm_mode_create_dumb *args);
-int drm_gem_vram_driver_dumb_mmap_offset(struct drm_file *file,
-					 struct drm_device *dev,
-					 uint32_t handle, uint64_t *offset);
 
 /*
  * Helpers for struct drm_plane_helper_funcs
@@ -149,7 +146,7 @@ void drm_gem_vram_simple_display_pipe_cleanup_fb(
 #define DRM_GEM_VRAM_DRIVER \
 	.debugfs_init             = drm_vram_mm_debugfs_init, \
 	.dumb_create		  = drm_gem_vram_driver_dumb_create, \
-	.dumb_map_offset	  = drm_gem_vram_driver_dumb_mmap_offset, \
+	.dumb_map_offset	  = drm_gem_ttm_dumb_map_offset, \
 	.gem_prime_mmap		  = drm_gem_prime_mmap
 
 /*
-- 
2.30.2

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
