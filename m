From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [RFC PATCH] drm/nouveau: fix i2ctable bounds checking
Date: Mon, 15 Feb 2010 23:24:49 +0100
Message-ID: <20100215222449.GC2823@joi.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
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
List-Id: nouveau.vger.kernel.org

i2c_entries seems to be the number of i2c entries,
so with index equal to this number, we could read
invalid data from i2ctable. Fix it.

Signed-off-by: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_bios.c |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bios.c b/drivers/gpu/drm/nouveau/nouveau_bios.c
index e7be506..8d6d825 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bios.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bios.c
@@ -4984,7 +4984,8 @@ read_dcb_i2c_entry(struct drm_device *dev, int dcb_version, uint8_t *i2ctable, i
 		else
 			NV_WARN(dev,
 				"DCB I2C table has more entries than indexable "
-				"(%d entries, max index 15)\n", i2ctable[2]);
+				"(%d entries, max %d)\n", i2ctable[2],
+				DCB_MAX_NUM_I2C_ENTRIES);
 		entry_len = i2ctable[3];
 		/* [4] is i2c_default_indices, read in parse_dcb_table() */
 	}
@@ -5000,7 +5001,7 @@ read_dcb_i2c_entry(struct drm_device *dev, int dcb_version, uint8_t *i2ctable, i
 
 	if (index == 0xf)
 		return 0;
-	if (index > i2c_entries) {
+	if (index >= i2c_entries) {
 		NV_ERROR(dev, "DCB I2C index too big (%d > %d)\n",
 			 index, i2ctable[2]);
 		return -ENOENT;
-- 
1.6.6.1
