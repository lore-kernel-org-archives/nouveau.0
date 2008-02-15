From: "Joel R. Voss" <jvoss-Cpl0xJrrQRvQT0dZR+AlfA@public.gmane.org>
Subject: Patch to fix latest mesa git undefined symbol
Date: Fri, 15 Feb 2008 08:29:48 -0800
Message-ID: <200802150829.48432.jvoss@altsci.com>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_83btH1waBune/Gh"
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

--Boundary-00=_83btH1waBune/Gh
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello,

I decided to try nouveau tonight and I followed the install instructions. 2D 
worked fine (a bit slower than nv/vesa), so I tried out 3D. I was able to get 
glxgears to work (1000 fps on my nv15) only after I patched the mesa driver. 
Attached is the patch to nouveau_screen.c that adds a stub to resolve the 
undefined symbol that all GL programs threw. I discussed it briefly with 
herve who suggested I write the stub. A full implementation of the function 
can be found in src/mesa/drivers/dri/i915/intel_screen.c. It's beyond my 
current code expertise to know if it can be copypasted. I would appreciate 
comments or questions on why this patch is needed.

Also, if you still get "Direct Rendering: No" after applying the patch, here 
is a way to debug more:
export LIBGL_DEBUG=verbose
mesa-git/progs/xdemos/glxinfo
It will tell you why Direct Rendering failed.

I like the project and I hope to work on 3D a bit with my nv15 and nv43. 
There's a lot of sample mesa programs that work partially or not at all. I 
appreciate all the hard work the team has put into this. Making 3D work for 
brave testers is a great cause in my opinion.

Regards,
Joel R. Voss
http://AltSci.com

--Boundary-00=_83btH1waBune/Gh
Content-Type: text/x-diff;
  charset="us-ascii";
  name="mesa_nouveau_dri2DriverInitScreen.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="mesa_nouveau_dri2DriverInitScreen.patch"

diff --git a/src/mesa/drivers/dri/nouveau/nouveau_screen.c b/src/mesa/drivers/dri/nouveau/nouveau_screen.c
index 4838ffc..3d253a8 100644
--- a/src/mesa/drivers/dri/nouveau/nouveau_screen.c
+++ b/src/mesa/drivers/dri/nouveau/nouveau_screen.c
@@ -349,3 +349,14 @@ __GLcontextModes *__driDriverInitScreen(__DRIscreenPrivate *psp)
 				  1);
 }
 
+/**
+ * This is the driver specific part of the createNewScreen entry point.
+ * TODO: This function has not been implemented. Adding this function 
+ * simply ensures that the driver won't fail with an undefined symbol.
+ * 
+ * \return the __GLcontextModes supported by this driver
+ */
+PUBLIC __GLcontextModes *__dri2DriverInitScreen(__DRIscreenPrivate *psp)
+{
+	return NULL;
+}

--Boundary-00=_83btH1waBune/Gh
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--Boundary-00=_83btH1waBune/Gh--
