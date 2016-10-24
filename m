From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] nouveau: hide gcc-4.9 -Wmaybe-uninitialized
Date: Mon, 24 Oct 2016 17:30:38 +0200
Message-ID: <20161024153059.2713363-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Ben Skeggs <bskeggs@redhat.com>
Cc: Arnd Bergmann <arnd@arndb.de>, David Airlie <airlied@linux.ie>, Alex Deucher <alexander.deucher@amd.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Chris Wilson <chris@chris-wilson.co.uk>, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

gcc-4.9 notices that the validate_init() function returns unintialized
data when called with a zero 'nr_buffers' argument, when called with the
-Wmaybe-uninitialized flag:

drivers/gpu/drm/nouveau/nouveau_gem.c: In function ‘validate_init.isra.6’:
drivers/gpu/drm/nouveau/nouveau_gem.c:457:5: error: ‘ret’ may be used uninitialized in this function [-Werror=maybe-uninitialized]

However, the only caller of this function always passes a nonzero
argument, and gcc-6 is clever enough to take this into account and
not warn about it any more.

Adding an explicit initialization to -EINVAL here is correct even if
the caller changed, and it avoids the warning on gcc-4.9 as well.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/nouveau/nouveau_gem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
index 0bd7164bc817..4f3c5f3eaa16 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
@@ -369,7 +369,7 @@ validate_init(struct nouveau_channel *chan, struct drm_file *file_priv,
 {
 	struct nouveau_cli *cli = nouveau_cli(file_priv);
 	int trycnt = 0;
-	int ret, i;
+	int ret = -EINVAL, i;
 	struct nouveau_bo *res_bo = NULL;
 	LIST_HEAD(gart_list);
 	LIST_HEAD(vram_list);
-- 
2.9.0
