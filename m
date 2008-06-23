From: Radoslaw Szkodzinski <astralstorm-l2kB63LPSaw@public.gmane.org>
Subject: [PATCH] Fix git Mesa (Gallium) and its ebuild
Date: Mon, 23 Jun 2008 11:30:09 +0200
Message-ID: <20080623113009.265552f4@gen2.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="MP_/e33fiS1ibj1NQJbzhNrR4eL"
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

--MP_/e33fiS1ibj1NQJbzhNrR4eL
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello,

I'm attaching two trivial patches. One is against latest mesa to fix
build of nouveau dri driver, another against mesa-9999-r1 ebuild, fixing
dependencies.

Please CC me with any comments, I'm not subscribed to the list.

AstralStorm
--MP_/e33fiS1ibj1NQJbzhNrR4eL
Content-Type: text/x-patch; name=mesa-fix-ebuild-deps.patch
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=mesa-fix-ebuild-deps.patch

--- mesa-9999-r1.ebuild	2008-06-23 11:27:37.654028625 +0200
+++ mesa-9999-r1.ebuild.new	2008-06-23 11:28:08.990027627 +0200
@@ -64,7 +64,7 @@
 	x11-libs/libXi
 	x11-libs/libXmu
 	x11-libs/libXdamage
-	=x11-libs/libdrm-2.3*
+	|| ( =x11-libs/libdrm-2.3* =x11-libs/libdrm-9999 )
 	x11-libs/libICE
 	motif? ( virtual/motif )
 	doc? ( app-doc/opengl-manpages )
@@ -72,6 +72,7 @@
 	xcb? ( x11-libs/libxcb )"
 DEPEND="${RDEPEND}
 	!<=x11-proto/xf86driproto-2.0.3
+	x11-proto/dri2proto
 	dev-util/pkgconfig
 	x11-misc/makedepend
 	x11-proto/inputproto

--MP_/e33fiS1ibj1NQJbzhNrR4eL
Content-Type: text/x-patch; name=mesa-git-fix-nouveau-link.patch
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=mesa-git-fix-nouveau-link.patch

--- src/mesa/drivers/dri/nouveau/nouveau_screen.c	2008-06-23 05:29:45.000000000 +0200
+++ src/mesa/drivers/dri/nouveau/nouveau_screen.c.new	2008-06-23 07:58:19.956210585 +0200
@@ -317,9 +317,3 @@
 	.SwapBuffersMSC  = NULL,
 	.CopySubBuffer   = nouveauCopySubBuffer
 };
-
-const __DRIextension *__driDriverExtensions[] = {
-    &driCoreExtension.base,
-    &driLegacyExtension.base,
-    NULL
-};

--MP_/e33fiS1ibj1NQJbzhNrR4eL
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--MP_/e33fiS1ibj1NQJbzhNrR4eL--
