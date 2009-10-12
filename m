From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: [PATCH 1/2] drm/nouveau: rework bios delays
Date: Mon, 12 Oct 2009 21:30:44 +0300
Message-ID: <1255372245-16461-1-git-send-email-pq@iki.fi>
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
List-Id: nouveau.vger.kernel.org

Replace the BIOS_USLEEP() macro with appropriate calls to udelay() and
msleep(). BIOS_USLEEP() was implemented with mdelay(), which is a
busy-wait. msleep() on the other hand can reschedule, so these paths
cannot be called from interrupt or atomic context.

In init_reset(), BIOS_USLEEP(10) was a no-op, since the delay was
rounded off to zero. This was probably a bug in porting the DDX code to
the kernel. The delay is restored.

In init_time(), since the delay is variable with a large range, it is
implemented as a busy-wait for <1ms, and msleep() otherwise rounding
mostly to the next integer milliseconds.

call_lvds_manufacturer_script() contained a bug in the wait: the delay
was executed in microseconds, when it should be milliseconds. Fixed.

Signed-off-by: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_bios.c |   20 +++++++++++---------
 1 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bios.c b/drivers/gpu/drm/nouveau/nouveau_bios.c
index 2cf4134..adfd263 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bios.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bios.c
@@ -40,8 +40,6 @@
 #define BIOSLOG(sip, fmt, arg...) NV_DEBUG(sip->dev, fmt, ##arg)
 #define LOG_OLD_VALUE(x)
 
-#define BIOS_USLEEP(n) mdelay((n)/1000)
-
 #define ROM16(x) le16_to_cpu(*(uint16_t *)&(x))
 #define ROM32(x) le32_to_cpu(*(uint32_t *)&(x))
 
@@ -286,7 +284,7 @@ static void still_alive(void)
 {
 #if 0
 	sync();
-	BIOS_USLEEP(2000);
+	msleep(2);
 #endif
 }
 
@@ -1690,7 +1688,7 @@ init_condition_time(struct nvbios *bios, uint16_t offset,
 			break;
 		} else {
 			BIOSLOG(bios, "0x%04X: Condition not met, sleeping for 20ms\n", offset);
-			BIOS_USLEEP(20000);
+			msleep(20);
 		}
 
 	if (!bios_condition_met(bios, offset, cond)) {
@@ -1939,7 +1937,7 @@ init_reset(struct nvbios *bios, uint16_t offset, struct init_exec *iexec)
 	bios_wr32(bios, NV_PBUS_PCI_NV_19, 0);
 	bios_wr32(bios, reg, value1);
 
-	BIOS_USLEEP(10);
+	udelay(10);
 
 	bios_wr32(bios, reg, value2);
 	bios_wr32(bios, NV_PBUS_PCI_NV_19, pci_nv_19);
@@ -2339,7 +2337,7 @@ init_time(struct nvbios *bios, uint16_t offset, struct init_exec *iexec)
 	 * Sleep for "time" microseconds.
 	 */
 
-	uint16_t time = ROM16(bios->data[offset + 1]);
+	unsigned time = ROM16(bios->data[offset + 1]);
 
 	if (!iexec->execute)
 		return true;
@@ -2347,7 +2345,10 @@ init_time(struct nvbios *bios, uint16_t offset, struct init_exec *iexec)
 	BIOSLOG(bios, "0x%04X: Sleeping for 0x%04X microseconds\n",
 		offset, time);
 
-	BIOS_USLEEP(time);
+	if (time < 1000)
+		udelay(time);
+	else
+		msleep((time + 900) / 1000);
 
 	return true;
 }
@@ -3154,9 +3155,10 @@ static int call_lvds_manufacturer_script(struct drm_device *dev, struct dcb_entr
 
 	run_digital_op_script(dev, scriptofs, dcbent, head, bios->fp.dual_link);
 
-	if (script == LVDS_PANEL_OFF)
+	if (script == LVDS_PANEL_OFF) {
 		/* off-on delay in ms */
-		BIOS_USLEEP(ROM16(bios->data[bios->fp.xlated_entry + 7]));
+		msleep(ROM16(bios->data[bios->fp.xlated_entry + 7]));
+	}
 #ifdef __powerpc__
 	/* Powerbook specific quirks */
 	if (script == LVDS_RESET && ((dev->pci_device & 0xffff) == 0x0179 || (dev->pci_device & 0xffff) == 0x0329))
-- 
1.6.4.4
