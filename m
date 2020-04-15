From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 5.5 066/106] drm/nouveau/svm: fix vma range check for migration
Date: Wed, 15 Apr 2020 07:41:46 -0400
Message-ID: <20200415114226.13103-66-sashal@kernel.org>
References: <20200415114226.13103-1-sashal@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20200415114226.13103-1-sashal@kernel.org>
Sender: stable-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: Ralph Campbell <rcampbell@nvidia.com>, Ben Skeggs <bskeggs@redhat.com>, Sasha Levin <sashal@kernel.org>, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

From: Ralph Campbell <rcampbell@nvidia.com>

[ Upstream commit b92103b559c77abc5f8b7bec269230a219c880b7 ]

find_vma_intersection(mm, start, end) only guarantees that end is greater
than or equal to vma->vm_start but doesn't guarantee that start is
greater than or equal to vma->vm_start. The calculation for the
intersecting range in nouveau_svmm_bind() isn't accounting for this and
can call migrate_vma_setup() with a starting address less than
vma->vm_start. This results in migrate_vma_setup() returning -EINVAL for
the range instead of nouveau skipping that part of the range and migrating
the rest.

Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/nouveau/nouveau_svm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
index 3ec5da025bea7..c567526b75b83 100644
--- a/drivers/gpu/drm/nouveau/nouveau_svm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
@@ -184,6 +184,7 @@ nouveau_svmm_bind(struct drm_device *dev, void *data,
 		if (!vma)
 			break;
 
+		addr = max(addr, vma->vm_start);
 		next = min(vma->vm_end, end);
 		/* This is a best effort so we ignore errors */
 		nouveau_dmem_migrate_vma(cli->drm, vma, addr, next);
-- 
2.20.1
