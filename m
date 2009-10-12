From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: [PATCH 2/2] drm/nouveau: fix init_condition_time()
	reporting
Date: Mon, 12 Oct 2009 21:30:45 +0300
Message-ID: <1255372245-16461-2-git-send-email-pq@iki.fi>
References: <1255372245-16461-1-git-send-email-pq@iki.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1255372245-16461-1-git-send-email-pq-X3B1VOXEql0@public.gmane.org>
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

The function reported bogus wait time, if the condition was never
fulfilled. Fix it.

Also do some style fixes in this function and fix a typo.

Signed-off-by: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_bios.c |   13 +++++++++----
 1 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bios.c b/drivers/gpu/drm/nouveau/nouveau_bios.c
index adfd263..aee862e 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bios.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bios.c
@@ -1672,6 +1672,7 @@ init_condition_time(struct nvbios *bios, uint16_t offset,
 
 	uint8_t cond = bios->data[offset + 1];
 	uint16_t retries = bios->data[offset + 2] * 50;
+	unsigned cnt;
 
 	if (!iexec->execute)
 		return true;
@@ -1682,19 +1683,23 @@ init_condition_time(struct nvbios *bios, uint16_t offset,
 	BIOSLOG(bios, "0x%04X: Condition: 0x%02X, Retries: 0x%02X\n",
 		offset, cond, retries);
 
-	for (; retries > 0; retries--)
+	for (cnt = 0; cnt < retries; cnt++) {
 		if (bios_condition_met(bios, offset, cond)) {
-			BIOSLOG(bios, "0x%04X: Condition met, continuing\n", offset);
+			BIOSLOG(bios, "0x%04X: Condition met, continuing\n",
+								offset);
 			break;
 		} else {
-			BIOSLOG(bios, "0x%04X: Condition not met, sleeping for 20ms\n", offset);
+			BIOSLOG(bios, "0x%04X: "
+				"Condition not met, sleeping for 20ms\n",
+								offset);
 			msleep(20);
 		}
+	}
 
 	if (!bios_condition_met(bios, offset, cond)) {
 		NV_WARN(bios->dev,
 			"0x%04X: Condition still not met after %dms, "
-			"skiping following opcodes\n", offset, 20 * retries);
+			"skipping following opcodes\n", offset, 20 * retries);
 		iexec->execute = false;
 	}
 
-- 
1.6.4.4
