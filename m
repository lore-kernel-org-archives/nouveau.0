From: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: [PATCH 12/12] nv50: count wrapped textures towards the
	tex_obj count
Date: Tue, 20 May 2014 19:40:06 -0400
Message-ID: <1400629206-4447-13-git-send-email-imirkin@alum.mit.edu>
References: <1400629206-4447-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <mesa-dev-bounces@lists.freedesktop.org>
In-Reply-To: <1400629206-4447-1-git-send-email-imirkin@alum.mit.edu>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/mesa-dev>,
 <mailto:mesa-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/mesa-dev>
List-Post: <mailto:mesa-dev@lists.freedesktop.org>
List-Help: <mailto:mesa-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/mesa-dev>,
 <mailto:mesa-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: mesa-dev-bounces@lists.freedesktop.org
Sender: "mesa-dev" <mesa-dev-bounces@lists.freedesktop.org>
To: mesa-dev@lists.freedesktop.org, nouveau@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

From: Joakim Sindholt <opensource@zhasha.com>

But don't count their size towards the allocated memory, since that
belongs to whoever created it.

Reviewed-by: Ilia Mirkin <imirkin@alum.mit.edu>
---
 src/gallium/drivers/nouveau/nv50/nv50_miptree.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/src/gallium/drivers/nouveau/nv50/nv50_miptree.c b/src/gallium/drivers/nouveau/nv50/nv50_miptree.c
index 513d8f9..4c55179 100644
--- a/src/gallium/drivers/nouveau/nv50/nv50_miptree.c
+++ b/src/gallium/drivers/nouveau/nv50/nv50_miptree.c
@@ -404,6 +404,8 @@ nv50_miptree_from_handle(struct pipe_screen *pscreen,
    mt->level[0].offset = 0;
    mt->level[0].tile_mode = mt->base.bo->config.nv50.tile_mode;
 
+   NOUVEAU_DRV_STAT(nouveau_screen(pscreen), tex_obj_current_count, 1);
+
    /* no need to adjust bo reference count */
    return &mt->base.base;
 }
-- 
1.8.5.5
