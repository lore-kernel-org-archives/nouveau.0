From: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: strange change in commit
	38c34b28f04518fec8ec474a6530d0fb37002cf5
Date: Thu, 3 Dec 2009 22:57:57 +0100
Message-ID: <6d4bc9fc0912031357w323cfe58v5dbe26fbc4a4aeca@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

diff --git a/drivers/gpu/drm/nouveau/nv10_fifo.c
b/drivers/gpu/drm/nouveau/nv10_fifo.c
index 877f00e..ed7f466 100644
--- a/drivers/gpu/drm/nouveau/nv10_fifo.c
+++ b/drivers/gpu/drm/nouveau/nv10_fifo.c
@@ -216,7 +216,7 @@ nv10_fifo_init_ramxx(struct drm_device *dev)
 				       (dev_priv->ramht_offset >> 8));
 	nv_wr32(dev, NV03_PFIFO_RAMRO, dev_priv->ramro_offset>>8);

-	if (dev_priv->card_type > NV_11) {
+	if (dev_priv->chipset < 0x17) {
 		nv_wr32(dev, NV03_PFIFO_RAMFC, (dev_priv->ramfc_offset >> 8) |
 					       (1 << 16) /* 64 Bytes entry*/);
 		/* XXX nvidia blob set bit 18, 21,23 for nv20 & nv30 */



That strikes me as somewhat odd.

Maarten.
