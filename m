From: =?UTF-8?q?Ch=C3=AD-Thanh=20Christopher=20Nguy=E1=BB=85n?=
 <chithanh-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: [PATCH] Make building of glamor optional
Date: Thu, 23 Oct 2014 16:54:01 +0200
Message-ID: <1414076041-23619-1-git-send-email-chithanh@gentoo.org>
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
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

---
 configure.ac | 30 +++++++++++++++++++++---------
 1 file changed, 21 insertions(+), 9 deletions(-)

diff --git a/configure.ac b/configure.ac
index ccf320a..56b08ee 100644
--- a/configure.ac
+++ b/configure.ac
@@ -140,17 +140,29 @@ if test "x$have_list_h" = xyes; then
                    #include "list.h"])
 fi
 
-AC_CHECK_HEADERS([glamor.h],[found_glamor_header=yes],[found_glamor_header=no],
-		 [#include "xorg-server.h"])
-AC_MSG_CHECKING([whether to include GLAMOR support])
-if test "x$found_glamor_header" = xyes && pkg-config --exists "xorg-server >= 1.15.99.901"
-then
-	AC_DEFINE(HAVE_GLAMOR, 1, [Build support for glamor acceleration])
-	AC_MSG_RESULT([yes])
-else
-	AC_MSG_RESULT([no])
+AC_ARG_ENABLE(glamor,
+		AS_HELP_STRING([--enable-glamor],
+				[Enable glamor, a new GL-based acceleration [default=auto]]),
+		[GLAMOR="$enableval"],
+		[GLAMOR=auto])
+
+if test "x$GLAMOR" != "xno"; then
+	AC_CHECK_HEADERS([glamor.h],[found_glamor_header=yes],[found_glamor_header=no],
+			 [#include "xorg-server.h"])
+	AC_MSG_CHECKING([whether to include GLAMOR support])
+	if test "x$found_glamor_header" = xyes && pkg-config --exists "xorg-server >= 1.15.99.901"
+	then
+		AC_DEFINE(HAVE_GLAMOR, 1, [Build support for glamor acceleration])
+		AC_MSG_RESULT([yes])
+	else
+		AC_MSG_RESULT([no])
+		if test "x$GLAMOR" != "xauto"; then
+			AC_MSG_ERROR([failed to find required Xorg headers for glamor])
+		fi
+	fi
 fi
 
+
 AC_CONFIG_FILES([
 	Makefile
 	src/Makefile
-- 
2.0.4
