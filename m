From: =?utf-8?q?Marcin=20Ko=C5=9Bcielnicki?= <koriakin-mP9o5jsk0RY@public.gmane.org>
Subject: [PATCH] nv50/accel: Fix mangled A8+A8 shader.
Date: Fri,  5 Feb 2010 17:01:09 +0000
Message-ID: <1265389269-9520-1-git-send-email-koriakin@0x04.net>
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

Turns out we used a misaligned long instruction near the end, and the
shader was getting killed after writing R, A components. This has gone
unnoticed since the remaining G, B outputs aren't actually used.
---
 src/nv50_accel.c |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/src/nv50_accel.c b/src/nv50_accel.c
index 5fa539c..1218e18 100644
--- a/src/nv50_accel.c
+++ b/src/nv50_accel.c
@@ -291,7 +291,7 @@ NVAccelInitNV50TCL(ScrnInfoPtr pScrn)
 	OUT_RING  (chan, (0 << NV50TCL_CB_DEF_SET_BUFFER_SHIFT) | 0x4000);
 	BEGIN_RING(chan, tesla, NV50TCL_CB_ADDR, 1);
 	OUT_RING  (chan, 0);
-	BEGIN_RING_NI(chan, tesla, NV50TCL_CB_DATA(0), 15);
+	BEGIN_RING_NI(chan, tesla, NV50TCL_CB_DATA(0), 16);
 	OUT_RING  (chan, 0x80000000);
 	OUT_RING  (chan, 0x90000004);
 	OUT_RING  (chan, 0x82030208);
@@ -302,7 +302,8 @@ NVAccelInitNV50TCL(ScrnInfoPtr pScrn)
 	OUT_RING  (chan, 0x00008784);
 	OUT_RING  (chan, 0xf0400209);
 	OUT_RING  (chan, 0x00008784);
-	OUT_RING  (chan, 0xc002000c);
+	OUT_RING  (chan, 0xc002000d);
+	OUT_RING  (chan, 0x00000780);
 	OUT_RING  (chan, 0x10008600);
 	OUT_RING  (chan, 0x10008604);
 	OUT_RING  (chan, 0x10000609);
-- 
1.6.4.1
