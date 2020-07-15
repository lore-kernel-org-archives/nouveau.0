From: Jing Xiangfeng <jingxiangfeng@huawei.com>
Subject: [PATCH] drm/nouveau: add the missed kfree() for nouveau_bo_alloc()
Date: Wed, 15 Jul 2020 17:30:26 +0800
Message-ID: <20200715093026.156142-1-jingxiangfeng@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: bskeggs@redhat.com, airlied@linux.ie, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org, jingxiangfeng@huawei.com
List-Id: nouveau.vger.kernel.org

nouveau_bo_alloc() misses to call kfree() in an error path. Add the
missed function call to fix it.

Signed-off-by: Jing Xiangfeng <jingxiangfeng@huawei.com>
---
 drivers/gpu/drm/nouveau/nouveau_bo.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index c40f127de3d0..abd80b1a6de3 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -276,8 +276,10 @@ nouveau_bo_alloc(struct nouveau_cli *cli, u64 *size, int *align, u32 flags,
 			break;
 	}
 
-	if (WARN_ON(pi < 0))
+	if (WARN_ON(pi < 0)) {
+		kfree(nvbo);
 		return ERR_PTR(-EINVAL);
+	}
 
 	/* Disable compression if suitable settings couldn't be found. */
 	if (nvbo->comp && !vmm->page[pi].comp) {
-- 
2.17.1
