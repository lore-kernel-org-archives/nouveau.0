From: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 7/7] configure: printout the configuration info
Date: Sat, 16 Feb 2013 20:48:47 +0000
Message-ID: <1361047727-740-8-git-send-email-emil.l.velikov@gmail.com>
References: <1361047727-740-1-git-send-email-emil.l.velikov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1361047727-740-1-git-send-email-emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Let the bikeshedding begin

Signed-off-by: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 configure.ac | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/configure.ac b/configure.ac
index 433131d..50219e9 100644
--- a/configure.ac
+++ b/configure.ac
@@ -132,3 +132,21 @@ AC_CONFIG_FILES([
 	man/Makefile
 ])
 AC_OUTPUT
+
+dnl
+dnl Output some configuration info for the user
+dnl
+echo ""
+echo "        prefix:              $prefix"
+echo "        exec_prefix:         $exec_prefix"
+echo "        libdir:              $libdir"
+echo "        includedir:          $includedir"
+
+echo ""
+echo "        CFLAGS:              $CFLAGS"
+echo "        CXXFLAGS:            $CXXFLAGS"
+echo "        Macros:              $DEFINES"
+
+echo ""
+echo "        Run '${MAKE-make}' to build xf86-video-nouveau"
+echo ""
-- 
1.8.1.3
