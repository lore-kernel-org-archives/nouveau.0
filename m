From: Christoph Hellwig <hch@lst.de>
Subject: [PATCH 2/9] nouveau: reset dma_nr in nouveau_dmem_migrate_alloc_and_copy
Date: Thu,  8 Aug 2019 18:33:39 +0300
Message-ID: <20190808153346.9061-3-hch@lst.de>
References: <20190808153346.9061-1-hch@lst.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190808153346.9061-1-hch@lst.de>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>
Cc: Ralph Campbell <rcampbell@nvidia.com>, Bharata B Rao <bharata@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

When we start a new batch of dma_map operations we need to reset dma_nr,
as we start filling a newly allocated array.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Ralph Campbell <rcampbell@nvidia.com>
---
 drivers/gpu/drm/nouveau/nouveau_dmem.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
index 38416798abd4..e696157f771e 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
@@ -682,6 +682,7 @@ nouveau_dmem_migrate_alloc_and_copy(struct vm_area_struct *vma,
 	migrate->dma = kmalloc(sizeof(*migrate->dma) * npages, GFP_KERNEL);
 	if (!migrate->dma)
 		goto error;
+	migrate->dma_nr = 0;
 
 	/* Copy things over */
 	copy = drm->dmem->migrate.copy_func;
-- 
2.20.1
