From: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: [PATCH] drm/nouveau: fix TTM_PL_TT memtype on pre-nv50
Date: Sat, 15 Feb 2014 23:27:01 -0500
Message-ID: <1392524821-10358-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
To: Ben Skeggs <bskeggs@redhat.com>, nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@ubuntu.com>, Ronald <ronald645@gmail.com>
List-Id: nouveau.vger.kernel.org

Commit a55409066 ("drm/nv50-: map TTM_PL_SYSTEM through a BAR for CPU
access") made it possible to work with tiled memory. However
mem->mm_node is not a nouveau_mem for AGP-using pre-NV50 cards, but a
drm_mm_node, as created by the ttm_bo_manager_func. As such, extend the
untiled check to explicitly include all pre-nv50 cards.

Reported-by: Ronald <ronald645@gmail.com>
Bugzilla: https://bugs.freedesktop.org/show_bug.cgi?id=74613
Signed-off-by: Ilia Mirkin <imirkin@alum.mit.edu>
---

Hmmm... this seems like a really fragile semantic, I wonder if more
mem->mm_node usages have to be audited. But this one's quick and easy. I'd
rather see something a little more solid around dealing with these
differences, but not sure how without reading all the ttm gunk. Perhaps just
make sure it's always a nouveau_mem by wrapping the ttm_bo_manager logic?

 drivers/gpu/drm/nouveau/nouveau_bo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 488686d..4aed171 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -1249,7 +1249,7 @@ nouveau_ttm_io_mem_reserve(struct ttm_bo_device *bdev, struct ttm_mem_reg *mem)
 			mem->bus.is_iomem = !dev->agp->cant_use_aperture;
 		}
 #endif
-		if (!node->memtype)
+		if (nv_device(drm->device)->card_type < NV_50 || !node->memtype)
 			/* untiled */
 			break;
 		/* fallthrough, tiled memory */
-- 
1.8.3.2
