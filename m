From: Matthew Garrett <mjg@redhat.com>
Subject: [PATCH 3/4] nouveau: Reorder instmem init and generic vram setup
Date: Fri,  3 Feb 2012 13:22:21 -0500
Message-ID: <1328293342-1643-3-git-send-email-mjg@redhat.com>
References: <1328293342-1643-1-git-send-email-mjg@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <1328293342-1643-1-git-send-email-mjg@redhat.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: nouveau@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Matthew Garrett <mjg@redhat.com>
List-Id: nouveau.vger.kernel.org

The instmem setup code may allocate from the region that's currently being
scanned out, but we can't allocate a buffer object to cover that until the
generic vram code has been run. Flip the order to make this possible.

Signed-off-by: Matthew Garrett <mjg@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_state.c |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_state.c b/drivers/gpu/drm/nouveau/nouveau_state.c
index aff3b8d..65e4c21 100644
--- a/drivers/gpu/drm/nouveau/nouveau_state.c
+++ b/drivers/gpu/drm/nouveau/nouveau_state.c
@@ -620,17 +620,17 @@ nouveau_card_init(struct drm_device *dev)
 	if (ret)
 		goto out_gpio;
 
-	ret = engine->instmem.init(dev);
+	ret = nouveau_mem_vram_init(dev);
 	if (ret)
 		goto out_gpuobj;
 
-	ret = nouveau_mem_vram_init(dev);
+	ret = engine->instmem.init(dev);
 	if (ret)
-		goto out_instmem;
+		goto out_ttmvram;
 
 	ret = nouveau_mem_gart_init(dev);
 	if (ret)
-		goto out_ttmvram;
+		goto out_instmem;
 
 	if (!dev_priv->noaccel) {
 		switch (dev_priv->card_type) {
@@ -791,10 +791,10 @@ out_engine:
 		}
 	}
 	nouveau_mem_gart_fini(dev);
-out_ttmvram:
-	nouveau_mem_vram_fini(dev);
 out_instmem:
 	engine->instmem.takedown(dev);
+out_ttmvram:
+	nouveau_mem_vram_fini(dev);
 out_gpuobj:
 	nouveau_gpuobj_takedown(dev);
 out_gpio:
-- 
1.7.7.6
