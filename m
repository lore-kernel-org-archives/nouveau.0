From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH] update man page with new chips, AccelMethod option
Date: Thu, 19 Jun 2014 02:37:45 -0400
Message-ID: <1403159865-26896-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

---
 man/nouveau.man | 29 +++++++++++++++++++++++------
 1 file changed, 23 insertions(+), 6 deletions(-)

diff --git a/man/nouveau.man b/man/nouveau.man
index 7c72907..a8dfacd 100644
--- a/man/nouveau.man
+++ b/man/nouveau.man
@@ -13,7 +13,7 @@ nouveau \- NVIDIA video driver
 .fi
 .SH DESCRIPTION
 .B nouveau
-is an __xservername__ driver for NVIDIA video cards.  The driver supports 2D 
+is an __xservername__ driver for NVIDIA video cards.  The driver supports 2D
 acceleration and provides support for the following framebuffer depths:
 (15,) 16  and 24.  TrueColor visuals are supported for these depths.
 
@@ -28,11 +28,11 @@ NV4
 .B RIVA TNT2
 NV5
 .TP 22
-.B GeForce 256, QUADRO 
+.B GeForce 256, QUADRO
 NV10
 .TP 22
 .B GeForce2, QUADRO2
-NV11 & NV15  
+NV11 & NV15
 .TP 22
 .B GeForce3, QUADRO DCC
 NV20
@@ -44,13 +44,26 @@ NV1A, NV1F
 NV17, NV18, NV25, NV28
 .TP 22
 .B GeForce FX, QUADRO FX
-NV30, NV31, NV34, NV35, NV36, NV37, NV38 
+NV30, NV31, NV34, NV35, NV36, NV37, NV38
 .TP 22
 .B GeForce 6XXX
-NV40, NV41, NV43, NV44, NV45, C51
+NV40, NV41, NV43, NV44, NV45, C51, MCP61
 .TP 22
 .B GeForce 7XXX
-G70, G71, G72, G73
+G70, G71, G72, G73, MCP67, MCP68, MCP73
+.TP 22
+.B GeForce 8XXX, 9XXX, 2XX, 3XX
+G80, G84, G86, G92, G94, G96, G98, G200, GT215, GT216, GT218, MCP77,
+MCP79, MCP89
+.TP 22
+.B GeForce 4XX, 5XX
+GF100, GF104, GF106, GF108, GF110, GF114, GF116, GF117, GF119
+.TP 22
+.B GeForce 6XX, 7XX
+GK104, GK106, GK107, GK110, GK208
+.TP 22
+.B GeForce GTX 750
+GM107
 
 .SH CONFIGURATION DETAILS
 Please refer to __xconfigfile__(__filemansuffix__) for general configuration
@@ -67,6 +80,10 @@ are supported:
 .BI "Option \*qHWCursor\*q \*q" boolean \*q
 Enable or disable the HW cursor.  Default: on.
 .TP
+.BI "Option \*qAccelMethod\*q \*q" string \*q
+Specify the acceleration method. One of \*qnone\*q, \*qexa\*q, or
+\*qglamor\*q. Default: exa, except for GMxxx which default to glamor.
+.TP
 .BI "Option \*qNoAccel\*q \*q" boolean \*q
 Disable or enable acceleration.  Default: acceleration is enabled.
 .TP
-- 
1.8.5.5
