From: Xavier Chantry <chantry.xavier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] Remove leftover in man page and nv_const.h
Date: Fri,  5 Mar 2010 00:53:47 +0100
Message-ID: <1267746827-3200-1-git-send-email-chantry.xavier@gmail.com>
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
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Signed-off-by: Xavier Chantry <chantry.xavier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 man/nouveau.man |   16 ----------------
 src/nv_const.h  |    1 -
 2 files changed, 0 insertions(+), 17 deletions(-)

diff --git a/man/nouveau.man b/man/nouveau.man
index 87f645a..cd66e9a 100644
--- a/man/nouveau.man
+++ b/man/nouveau.man
@@ -70,22 +70,6 @@ Enable or disable the HW cursor.  Default: on.
 .BI "Option \*qNoAccel\*q \*q" boolean \*q
 Disable or enable acceleration.  Default: acceleration is enabled.
 .TP
-.BI "Option \*qFPDither\*q \*q" boolean \*q
-Many digital flat panels (particularly ones on laptops) have only 6 bits 
-per component color resolution.
-This option tells the driver to dither from 8 bits per component to 6 before
-the flat panel truncates it. 
-Default: off.
-.TP
-.BI "Option \*qFPScale\*q \*q" boolean \*q 
-Supported only on GeForce4 and newer chips, this option
-tells to the driver to scale lower resolutions up to the flat panel's native
-resolution.  Default: on.
-.TP 
-.BI "Option \*qScalingMode\*q \*q" string \*q 
-Only for the randr-1.2 driver, this allows to set the DFP scaling mode.
-The options are "fullscreen", "aspect", "noscale" and "panel". Default: "aspect".
-.TP
 .BI "Option \*qShadowFB\*q \*q" boolean \*q
 Enable or disable use of the shadow framebuffer layer.  Default: off.
 .SH "SEE ALSO"
diff --git a/src/nv_const.h b/src/nv_const.h
index 767344c..09293e0 100644
--- a/src/nv_const.h
+++ b/src/nv_const.h
@@ -23,7 +23,6 @@ static const OptionInfoRec NVOptions[] = {
     { OPTION_NOACCEL,           "NoAccel",      OPTV_BOOLEAN,   {0}, FALSE },
     { OPTION_SHADOW_FB,         "ShadowFB",     OPTV_BOOLEAN,   {0}, FALSE },
     { OPTION_VIDEO_KEY,		"VideoKey",	OPTV_INTEGER,	{0}, FALSE },
-    { OPTION_EXA_PIXMAPS,	"EXAPixmaps",	OPTV_BOOLEAN,	{0}, FALSE },
     { -1,                       NULL,           OPTV_NONE,      {0}, FALSE }
 };
 
-- 
1.7.0.1
