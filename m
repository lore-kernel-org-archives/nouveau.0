From: Maarten Lankhorst <maarten.lankhorst@canonical.com>
Subject: [PATCH] drm/nouveau/mc: complain loudly if we can't call a interrupt
	handler
Date: Thu, 17 Jan 2013 14:10:39 +0100
Message-ID: <50F7F84F.5000504@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Ben Skeggs <bskeggs@redhat.com>
Cc: nouveau@lists.freedesktop.org, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
List-Id: nouveau.vger.kernel.org

I noticed that bsp, vp and ppp had no interrupt handler after investigating why 15% of my cpu time went to interrupts.

nouveau was silent about it,  but it should be an error since we have no way of acking in that case.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@canonical.com>

---

fwiw, the interrupt was 10, the exit interrupt after secret scrubber finishes..
I have absolutely no idea why, as it times out on wait before the engine initialization..

Maybe just ack it from the bsp/vp/ppp interrupt handler? Or should it be part of the base fuc class..

diff --git a/drivers/gpu/drm/nouveau/core/subdev/mc/base.c b/drivers/gpu/drm/nouveau/core/subdev/mc/base.c
index 8379aaf..16bf49c 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/mc/base.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/mc/base.c
@@ -36,8 +36,16 @@ nouveau_mc_intr(struct nouveau_subdev *subdev)
 	while (stat && map->stat) {
 		if (stat & map->stat) {
 			unit = nouveau_subdev(subdev, map->unit);
-			if (unit && unit->intr)
-				unit->intr(unit);
+			if (unit) {
+				if (unit->intr)
+					unit->intr(unit);
+				else if (printk_ratelimit())
+					nv_error(pmc,
+						 "%s has no interrupt handler, ignoring interrupt %x\n",
+						 unit->name, intr & map->stat);
+			} else if (printk_ratelimit())
+				nv_error(pmc, "subdev %u does not exist for interrupt %x\n",
+					 map->unit, intr & map->stat);
 			intr &= ~map->stat;
 		}
 		map++;
