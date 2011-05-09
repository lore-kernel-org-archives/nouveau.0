From: Marcin Slusarz <marcin.slusarz@gmail.com>
Subject: [PATCH v2] nv50/nvc0: make transfers aware of
 PIPE_TRANSFER_MAP_DIRECTLY
Date: Mon, 9 May 2011 20:12:38 +0200
Message-ID: <20110509181238.GA3018@joi.lan>
References: <20110508223900.GF10163@joi.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <mesa-dev-bounces+gcvmd-mesa3d-493=gmane.org@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <20110508223900.GF10163@joi.lan>
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

If state tracker asked us to map resource directly and we can't
do it (because of tiling), return NULL instead of doing full transfer
- state tracker should handle it and fallback to some other method
or repeat transfer without PIPE_TRANSFER_MAP_DIRECTLY.

It greatly improves performance of xorg state tracker on nv50+,
because its fallback (DFS/UTS) is much faster than full transfer.
---
 src/gallium/drivers/nv50/nv50_transfer.c |    3 +++
 src/gallium/drivers/nvc0/nvc0_transfer.c |    3 +++
 2 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/src/gallium/drivers/nv50/nv50_transfer.c b/src/gallium/drivers/nv50/nv50_transfer.c
index 7486977..d9fb22aa 100644
--- a/src/gallium/drivers/nv50/nv50_transfer.c
+++ b/src/gallium/drivers/nv50/nv50_transfer.c
@@ -209,6 +209,9 @@ nv50_miptree_transfer_new(struct pipe_context *pctx,
    uint32_t w, h, d, z, layer;
    int ret;
 
+   if (usage & PIPE_TRANSFER_MAP_DIRECTLY)
+      return NULL;
+
    if (mt->layout_3d) {
       z = box->z;
       d = u_minify(res->depth0, level);
diff --git a/src/gallium/drivers/nvc0/nvc0_transfer.c b/src/gallium/drivers/nvc0/nvc0_transfer.c
index 7bbfe05..0509113 100644
--- a/src/gallium/drivers/nvc0/nvc0_transfer.c
+++ b/src/gallium/drivers/nvc0/nvc0_transfer.c
@@ -246,6 +246,9 @@ nvc0_miptree_transfer_new(struct pipe_context *pctx,
    uint32_t w, h, d, z, layer;
    int ret;
 
+   if (usage & PIPE_TRANSFER_MAP_DIRECTLY)
+      return NULL;
+
    tx = CALLOC_STRUCT(nvc0_transfer);
    if (!tx)
       return NULL;
-- 
1.7.4.1
