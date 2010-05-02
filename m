From: Xavier Chantry <chantry.xavier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: nv50 dxt / s3tc
Date: Mon, 3 May 2010 00:44:38 +0200
Message-ID: <i2lb67489df1005021544nd1f76f7dxb80119984554427f@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau <Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

flightgear now dies with :
Mesa warning: external dxt library not available: texstore_rgba_dxt3
util/u_format_s3tc.c:66:util_format_dxt3_rgba_fetch_stub: Assertion `0' fai=
led.

I don't really understand what these stubs are about, they were
introduced by following commit :
commit d96e87c3c513f8ed350ae24425edb74b6d6fcc13
Author: Jos=E9 Fonseca <jfonseca-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org>
Date:   Wed Apr 7 20:47:38 2010 +0100

    util: Use stubs for the dynamically loaded S3TC functions.

    Loosely based on Luca Barbieri's commit
    52e9b990a192a9329006d5f7dd2ac222effea5a5.

Looking at llvm and r300 code and trying to guess, I came up with the
following patch that allows flightgear to start again. But I don't
really understand that stuff so it could be wrong.
nvfx is probably affected as well.


diff --git a/src/gallium/drivers/nouveau/nouveau_screen.c
b/src/gallium/drivers/nouveau/nouveau_screen.c
index 233a91a..a91b00b 100644
--- a/src/gallium/drivers/nouveau/nouveau_screen.c
+++ b/src/gallium/drivers/nouveau/nouveau_screen.c
@@ -5,6 +5,7 @@
 #include "util/u_memory.h"
 #include "util/u_inlines.h"
 #include "util/u_format.h"
+#include "util/u_format_s3tc.h"

 #include <stdio.h>
 #include <errno.h>
@@ -248,6 +249,8 @@ nouveau_screen_init(struct nouveau_screen *screen,
struct nouveau_device *dev)
 	pscreen->fence_signalled =3D nouveau_screen_fence_signalled;
 	pscreen->fence_finish =3D nouveau_screen_fence_finish;

+	util_format_s3tc_init();
+
 	return 0;
 }

diff --git a/src/gallium/drivers/nv50/nv50_screen.c
b/src/gallium/drivers/nv50/nv50_screen.c
index 2dd1042..0d74c90 100644
--- a/src/gallium/drivers/nv50/nv50_screen.c
+++ b/src/gallium/drivers/nv50/nv50_screen.c
@@ -20,6 +20,7 @@
  * SOFTWARE.
  */

+#include "util/u_format_s3tc.h"
 #include "pipe/p_screen.h"

 #include "nv50_context.h"
@@ -72,10 +73,6 @@ nv50_screen_is_format_supported(struct pipe_screen *pscr=
een,
 		case PIPE_FORMAT_A8_UNORM:
 		case PIPE_FORMAT_I8_UNORM:
 		case PIPE_FORMAT_L8A8_UNORM:
-		case PIPE_FORMAT_DXT1_RGB:
-		case PIPE_FORMAT_DXT1_RGBA:
-		case PIPE_FORMAT_DXT3_RGBA:
-		case PIPE_FORMAT_DXT5_RGBA:
 		case PIPE_FORMAT_S8_USCALED_Z24_UNORM:
 		case PIPE_FORMAT_Z24_UNORM_S8_USCALED:
 		case PIPE_FORMAT_Z32_FLOAT:
@@ -85,6 +82,11 @@ nv50_screen_is_format_supported(struct pipe_screen *pscr=
een,
 		case PIPE_FORMAT_R16G16_SNORM:
 		case PIPE_FORMAT_R16G16_UNORM:
 			return TRUE;
+		case PIPE_FORMAT_DXT1_RGB:
+		case PIPE_FORMAT_DXT1_RGBA:
+		case PIPE_FORMAT_DXT3_RGBA:
+		case PIPE_FORMAT_DXT5_RGBA:
+			return util_format_s3tc_enabled;
 		default:
 			break;
 		}
