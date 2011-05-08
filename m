From: Marcin Slusarz <marcin.slusarz@gmail.com>
Subject: [PATCH] gallium/nouveau: remove unused
	nouveau_screen_bo_user
Date: Mon, 9 May 2011 00:35:10 +0200
Message-ID: <20110508223510.GB10163@joi.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <mesa-dev-bounces+gcvmd-mesa3d-493=gmane.org@lists.freedesktop.org>
Content-Disposition: inline
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/mesa-dev>,
	<mailto:mesa-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/mesa-dev>
List-Post: <mailto:mesa-dev@lists.freedesktop.org>
List-Help: <mailto:mesa-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/mesa-dev>,
	<mailto:mesa-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: mesa-dev-bounces+gcvmd-mesa3d-493=gmane.org@lists.freedesktop.org
Errors-To: mesa-dev-bounces+gcvmd-mesa3d-493=gmane.org@lists.freedesktop.org
To: nouveau@lists.freedesktop.org
Cc: mesa-dev@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org


---
 src/gallium/drivers/nouveau/nouveau_screen.c |   14 --------------
 src/gallium/drivers/nouveau/nouveau_screen.h |    2 --
 2 files changed, 0 insertions(+), 16 deletions(-)

diff --git a/src/gallium/drivers/nouveau/nouveau_screen.c b/src/gallium/drivers/nouveau/nouveau_screen.c
index 401155b..223e768 100644
--- a/src/gallium/drivers/nouveau/nouveau_screen.c
+++ b/src/gallium/drivers/nouveau/nouveau_screen.c
@@ -81,20 +81,6 @@ nouveau_screen_bo_new(struct pipe_screen *pscreen, unsigned alignment,
 	return bo;
 }
 
-struct nouveau_bo *
-nouveau_screen_bo_user(struct pipe_screen *pscreen, void *ptr, unsigned bytes)
-{
-	struct nouveau_device *dev = nouveau_screen(pscreen)->device;
-	struct nouveau_bo *bo = NULL;
-	int ret;
-
-	ret = nouveau_bo_user(dev, ptr, bytes, &bo);
-	if (ret)
-		return NULL;
-
-	return bo;
-}
-
 void *
 nouveau_screen_bo_map(struct pipe_screen *pscreen,
 		      struct nouveau_bo *bo,
diff --git a/src/gallium/drivers/nouveau/nouveau_screen.h b/src/gallium/drivers/nouveau/nouveau_screen.h
index 186ada3..d910809 100644
--- a/src/gallium/drivers/nouveau/nouveau_screen.h
+++ b/src/gallium/drivers/nouveau/nouveau_screen.h
@@ -47,8 +47,6 @@ nouveau_screen(struct pipe_screen *pscreen)
 struct nouveau_bo *
 nouveau_screen_bo_new(struct pipe_screen *pscreen, unsigned alignment,
 		      unsigned usage, unsigned bind, unsigned size);
-struct nouveau_bo *
-nouveau_screen_bo_user(struct pipe_screen *pscreen, void *ptr, unsigned bytes);
 void *
 nouveau_screen_bo_map(struct pipe_screen *pscreen,
 		      struct nouveau_bo *pb,
-- 
1.7.4.1
