From: Robert Millan <rmh-pC/4jmrOO5FBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH] verify SDL_Init
Date: Mon, 24 Sep 2007 16:58:28 +0200
Message-ID: <20070924145828.GA29161@thorin>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="h31gzZEtNLTqOjlF"
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
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


--h31gzZEtNLTqOjlF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


Skipping SDL_Init failure leads to segfault in further SDL calls.  This
patch makes the situation easier to understand to the user.

-- 
Robert Millan

<GPLv2> I know my rights; I want my phone call!
<DRM> What use is a phone call, if you are unable to speak?
(as seen on /.)

--h31gzZEtNLTqOjlF
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="renouveau_init.diff"

Index: re.c
===================================================================
RCS file: /cvsroot/nouveau/renouveau/re.c,v
retrieving revision 1.125
diff -u -r1.125 re.c
--- re.c	28 Aug 2007 11:41:31 -0000	1.125
+++ re.c	24 Sep 2007 13:42:21 -0000
@@ -53,7 +53,10 @@
  */
 void setup_SDL(int opengl)
 {
-	SDL_Init(SDL_INIT_VIDEO);
+	if (SDL_Init(SDL_INIT_VIDEO)) {
+                fprintf (stderr, "Failed to initialise SDL video output.\n");
+                exit (1);
+        }
 	if (opengl) {
 		//SDL_GL_SetAttribute(SDL_GL_STEREO,1);
 		SDL_GL_SetAttribute(SDL_GL_DOUBLEBUFFER,0);

--h31gzZEtNLTqOjlF
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--h31gzZEtNLTqOjlF--
