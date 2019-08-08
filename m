From: Christoph Hellwig <hch@lst.de>
Subject: [PATCH 5/9] nouveau: remove a few function stubs
Date: Thu,  8 Aug 2019 18:33:42 +0300
Message-ID: <20190808153346.9061-6-hch@lst.de>
References: <20190808153346.9061-1-hch@lst.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190808153346.9061-1-hch@lst.de>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>
Cc: Ralph Campbell <rcampbell@nvidia.com>, Bharata B Rao <bharata@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

nouveau_dmem_migrate_vma and nouveau_dmem_convert_pfn are only called
when CONFIG_DRM_NOUVEAU_SVM is enabled, so there is no need to provide
!CONFIG_DRM_NOUVEAU_SVM stubs for them.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/gpu/drm/nouveau/nouveau_dmem.h | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.h b/drivers/gpu/drm/nouveau/nouveau_dmem.h
index 9d97d756fb7d..92394be5d649 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dmem.h
+++ b/drivers/gpu/drm/nouveau/nouveau_dmem.h
@@ -45,16 +45,5 @@ static inline void nouveau_dmem_init(struct nouveau_drm *drm) {}
 static inline void nouveau_dmem_fini(struct nouveau_drm *drm) {}
 static inline void nouveau_dmem_suspend(struct nouveau_drm *drm) {}
 static inline void nouveau_dmem_resume(struct nouveau_drm *drm) {}
-
-static inline int nouveau_dmem_migrate_vma(struct nouveau_drm *drm,
-					   struct vm_area_struct *vma,
-					   unsigned long start,
-					   unsigned long end)
-{
-	return 0;
-}
-
-static inline void nouveau_dmem_convert_pfn(struct nouveau_drm *drm,
-					    struct hmm_range *range) {}
 #endif /* IS_ENABLED(CONFIG_DRM_NOUVEAU_SVM) */
 #endif
-- 
2.20.1
