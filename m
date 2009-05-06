From: Peter Hjalmarsson <xake-ca8b1Tj3MiseIZ0/mPfg9Q@public.gmane.org>
Subject: Compiling xf86-video-nouveau with -Werror
Date: Wed, 06 May 2009 15:07:36 +0200
Message-ID: <1241615256.23516.8.camel@lillen.dodi>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-04Me5VL9ltb70Bp40Cj4"
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
To: nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org


--=-04Me5VL9ltb70Bp40Cj4
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hello.

I was somewhat bored and started to hunt for compilation warnings.
Attaching a patch for some rather obvious (two unused vars, one uninited
external function).

It also complains about NV10EXAFallbackInfo_real in nv10_exa.c never
being used.
It is placed with the following condition:

#if 0
#define NV10EXAFallbackInfo(X,Y,Z,S,T)
NV10EXAFallbackInfo_real(X,Y,Z,S,T)
#else
#define NV10EXAFallbackInfo(X,Y,Z,S,T) do { ; } while (0)
#endif

Since I do not know if this codepath ever is needed even during
development I did not touch this in my patch.



--=-04Me5VL9ltb70Bp40Cj4
Content-Disposition: attachment; filename="nouvea-warnings.patch"
Content-Type: text/x-patch; name="nouvea-warnings.patch"; charset="UTF-8"
Content-Transfer-Encoding: 7bit

diff --git a/src/nv50_sor.c b/src/nv50_sor.c
index 1e271a8..ea18e77 100644
--- a/src/nv50_sor.c
+++ b/src/nv50_sor.c
@@ -110,7 +110,6 @@ NV50SorSetClockMode(nouveauOutputPtr output, int clock)
 	ScrnInfoPtr pScrn = output->scrn;
 	NVPtr pNv = NVPTR(pScrn);
 	const int limit = output->dcb->type == OUTPUT_LVDS ? 112000 : 165000;
-	int ret;
 
 	xf86DrvMsg(pScrn->scrnIndex, X_INFO,
 		   "NV50SorSetClockMode is called.\n");
diff --git a/src/nv_driver.c b/src/nv_driver.c
index 92232dd..fbe4d35 100644
--- a/src/nv_driver.c
+++ b/src/nv_driver.c
@@ -964,6 +964,7 @@ NVPreInitDRM(ScrnInfoPtr pScrn)
 	 * go stomping on registers behind its back
 	 */
 #ifdef XF86DRM_MODE
+	extern int drmCheckModesettingSupported(const char *busid);
 	pNv->kms_enable = !drmCheckModesettingSupported(bus_id);
 
 	/* Additional sanity check */
diff --git a/src/nv_i2c.c b/src/nv_i2c.c
index 2725370..e8b2e29 100644
--- a/src/nv_i2c.c
+++ b/src/nv_i2c.c
@@ -85,7 +85,6 @@ NVI2CPutBits(I2CBusPtr b, int clock, int data)
 static uint32_t NV50_GetI2CPort(ScrnInfoPtr pScrn, int index)
 {
 	NVPtr pNv = NVPTR(pScrn);
-	uint32_t reg;
 
 	if (index <= 3)
 		return 0xe138 + (index * 24);

--=-04Me5VL9ltb70Bp40Cj4
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--=-04Me5VL9ltb70Bp40Cj4--
