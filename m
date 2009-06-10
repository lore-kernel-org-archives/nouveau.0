From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: [PATCH] Use nanosleep instead of usleep when waiting the
	hardware.
Date: Wed, 10 Jun 2009 17:35:03 +0200
Message-ID: <1244648103-23708-1-git-send-email-currojerez@riseup.net>
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

usleep() was being used without checking its return value. When the
server receives SIGALRM or SIGIO the waits are shortened and random
modesetting failures happen: Use nanosleep and loop around it until
the requested time has elapsed.
---
 src/nouveau_hw.c    |    2 +-
 src/nouveau_local.h |    6 ++++++
 src/nv_bios.c       |    2 +-
 src/nv_crtc.c       |    2 +-
 src/nv_include.h    |    1 +
 src/nv_output.c     |   10 +++++-----
 6 files changed, 15 insertions(+), 8 deletions(-)

diff --git a/src/nouveau_hw.c b/src/nouveau_hw.c
index 7d210d7..c2cad37 100644
--- a/src/nouveau_hw.c
+++ b/src/nouveau_hw.c
@@ -208,7 +208,7 @@ static void setPLL_single(ScrnInfoPtr pScrn, uint32_t reg,
 
 	if (chip_version < 0x17 && chip_version != 0x11)
 		/* wait a bit on older chips */
-		usleep(64000);
+		nouveau_usleep(64000);
 	NVReadRAMDAC(pNv, 0, reg);
 
 	/* then write the other half as well */
diff --git a/src/nouveau_local.h b/src/nouveau_local.h
index d44e2dc..3a8bdf7 100644
--- a/src/nouveau_local.h
+++ b/src/nouveau_local.h
@@ -43,4 +43,10 @@
 
 #define NOUVEAU_ALIGN(x,bytes) (((x) + ((bytes) - 1)) & ~((bytes) - 1))
 
+static inline void nouveau_usleep(unsigned long usec){
+        struct timespec t = { usec/1000000, (usec % 1000000)*1000 };
+
+        while (nanosleep(&t, &t) && errno == EINTR) {}
+}
+
 #endif
diff --git a/src/nv_bios.c b/src/nv_bios.c
index 182456a..b7490c1 100644
--- a/src/nv_bios.c
+++ b/src/nv_bios.c
@@ -41,7 +41,7 @@
 #define BIOSLOG(sip, fmt, arg...) NV_DEBUG(sip, fmt, ##arg)
 #define LOG_OLD_VALUE(x) //x
 
-#define BIOS_USLEEP(n) usleep(n)
+#define BIOS_USLEEP(n) nouveau_usleep(n)
 
 #define ROM16(x) le16_to_cpu(*(uint16_t *)&(x))
 #define ROM32(x) le32_to_cpu(*(uint32_t *)&(x))
diff --git a/src/nv_crtc.c b/src/nv_crtc.c
index b8524fb..1ffb267 100644
--- a/src/nv_crtc.c
+++ b/src/nv_crtc.c
@@ -212,7 +212,7 @@ nv_crtc_dpms(xf86CrtcPtr crtc, int mode)
 	seq1 |= (NVReadVgaSeq(pNv, nv_crtc->head, NV_VIO_SR_CLOCK_INDEX) & ~0x20);
 	NVWriteVgaSeq(pNv, nv_crtc->head, NV_VIO_SR_CLOCK_INDEX, seq1);
 	crtc17 |= (NVReadVgaCrtc(pNv, nv_crtc->head, NV_CIO_CR_MODE_INDEX) & ~0x80);
-	usleep(10000);
+	nouveau_usleep(10000);
 	NVWriteVgaCrtc(pNv, nv_crtc->head, NV_CIO_CR_MODE_INDEX, crtc17);
 	NVVgaSeqReset(pNv, nv_crtc->head, false);
 
diff --git a/src/nv_include.h b/src/nv_include.h
index 0409c89..46f809b 100644
--- a/src/nv_include.h
+++ b/src/nv_include.h
@@ -12,6 +12,7 @@
 #include <errno.h>
 #include <unistd.h>
 #include <stdlib.h>
+#include <time.h>
 
 /* All drivers should typically include these */
 #include "xf86.h"
diff --git a/src/nv_output.c b/src/nv_output.c
index 0979bb9..d18bcd2 100644
--- a/src/nv_output.c
+++ b/src/nv_output.c
@@ -162,7 +162,7 @@ static bool nv_legacy_load_detect(ScrnInfoPtr pScrn)
 	NVWriteRAMDAC(pNv, 0, NV_PRAMDAC_TEST_CONTROL,
 		      saved_rtest_ctrl & ~NV_PRAMDAC_TEST_CONTROL_PWRDWN_DAC_OFF);
 
-	usleep(10000);
+	nouveau_usleep(10000);
 
 	saved_pi = NVReadVgaCrtc(pNv, 0, NV_CIO_CRE_PIXEL_INDEX);
 	NVWriteVgaCrtc(pNv, 0, NV_CIO_CRE_PIXEL_INDEX,
@@ -258,7 +258,7 @@ nv_nv17_load_detect(ScrnInfoPtr pScrn, struct nouveau_encoder *nv_encoder)
 		nvWriteMC(pNv, NV_PBUS_POWERCTRL_4, saved_powerctrl_4 & 0xffffffcf);
 	}
 
-	usleep(4000);
+	nouveau_usleep(4000);
 
 	saved_routput = NVReadRAMDAC(pNv, 0, NV_PRAMDAC_DACCLK + regoffset);
 	head = (saved_routput & 0x100) >> 8;
@@ -269,7 +269,7 @@ nv_nv17_load_detect(ScrnInfoPtr pScrn, struct nouveau_encoder *nv_encoder)
 	/* nv driver and nv31 use 0xfffffeee, nv34 and 6600 use 0xfffffece */
 	NVWriteRAMDAC(pNv, 0, NV_PRAMDAC_DACCLK + regoffset,
 		      (saved_routput & 0xfffffece) | head << 8);
-	usleep(1000);
+	nouveau_usleep(1000);
 
 	temp = NVReadRAMDAC(pNv, 0, NV_PRAMDAC_DACCLK + regoffset);
 	NVWriteRAMDAC(pNv, 0, NV_PRAMDAC_DACCLK + regoffset, temp | 1);
@@ -279,7 +279,7 @@ nv_nv17_load_detect(ScrnInfoPtr pScrn, struct nouveau_encoder *nv_encoder)
 	temp = NVReadRAMDAC(pNv, head, NV_PRAMDAC_TEST_CONTROL);
 	NVWriteRAMDAC(pNv, head, NV_PRAMDAC_TEST_CONTROL,
 		      temp | NV_PRAMDAC_TEST_CONTROL_TP_INS_EN_ASSERTED);
-	usleep(1000);
+	nouveau_usleep(1000);
 
 	present = NVReadRAMDAC(pNv, 0, NV_PRAMDAC_TEST_CONTROL + regoffset) &
 			NV_PRAMDAC_TEST_CONTROL_SENSEB_ALLHI;
@@ -871,7 +871,7 @@ nv_output_prepare(xf86OutputPtr output)
 			 */
 			NVWriteRAMDAC(pNv, head, NV_PRAMDAC_FP_TG_CONTROL,
 				      FP_TG_CONTROL_OFF);
-			usleep(50000);
+			nouveau_usleep(50000);
 		}
 		/* don't inadvertently turn it on when state written later */
 		crtcstate[head].fp_control = FP_TG_CONTROL_OFF;
-- 
1.6.0.6
