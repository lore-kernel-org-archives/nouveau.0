From: Richard PALO <richard-S783fYmB3Ccdnm+yROfE0A@public.gmane.org>
Subject: PATCH: Sense if git should be used (for tarball) and if
 typeof needs to be __typeof__
Date: Thu, 19 Nov 2015 21:58:28 +0100
Message-ID: <564E37F4.1000204@netbsd.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------080609080600050905070102"
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

This is a multi-part message in MIME format.
--------------080609080600050905070102
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

I'd like to submit the attached patch to configure.ac fixing two issues:
1. Packaging systems such as pkgsrc use source tarballs not git, so configure
   could try to see if it's really in a git repository else use ChangeLog
   to determine the driver date to use.  
   NB 'git log' should probably already be 'git log -1'

2. When using strict ISO C compilers, such as if using -std=c99 instead of 
   for example -std=gnu99, typeof is not a valid keyword and __typeof__ should
   be used.  Use AC_C_TYPEOF to automatically define a macro if necessary.

cheers
-- 
Richard PALO


--------------080609080600050905070102
Content-Type: text/x-patch;
 name="0001-Sense-if-git-should-be-used-for-tarball-and-if-typeo.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0001-Sense-if-git-should-be-used-for-tarball-and-if-typeo.pa";
 filename*1="tch"

From e52880d8175fafac61bb45ff0274d47d39715f50 Mon Sep 17 00:00:00 2001
From: Richard PALO <richard-qavaossjCcEdnm+yROfE0A@public.gmane.org>
Date: Thu, 19 Nov 2015 19:17:38 +0100
Subject: [PATCH] Sense if git should be used (for tarball) and if typeof needs
 to be __typeof__

Use `git log` only if not in a source tarball where ChangeLog is already
generated and git may not be present.

Check to see if __typeof__ needs to be used instead of typeof, which is
the case if strict ISO c is used (such as -std=c99)

Signed-off-by: Richard PALO <richard-qavaossjCcEdnm+yROfE0A@public.gmane.org>
---
 configure.ac | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/configure.ac b/configure.ac
index 9c77f94..71482ec 100644
--- a/configure.ac
+++ b/configure.ac
@@ -36,7 +36,7 @@ AC_DEFINE_UNQUOTED([NV_PATCHLEVEL],
                    [$(echo $PACKAGE_VERSION | sed -e 's/^[[0-9]]*\.[[0-9]]*\.\([[0-9]]*\)/\1/')],
                    [Patch version])
 AC_DEFINE_UNQUOTED([NV_DRIVER_DATE],
-                   [$(echo -n \";git log |head -3|tail -1|tr -d '\n';echo -n \")],
+		   [$(printf \"; if test -d .git; then git log; else cat ChangeLog; fi |head -3|tail -1|tr -d '\n'; printf \")],
                    [Driver date])
 
 AC_CONFIG_SRCDIR([Makefile.am])
@@ -105,6 +105,7 @@ AC_SUBST([LIBUDEV_LIBS])
 
 # Checks for header files.
 AC_HEADER_STDC
+AC_C_TYPEOF
 
 # Use -Wall all the time
 CFLAGS="$CFLAGS -Wall"
-- 
2.6.3




--------------080609080600050905070102
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--------------080609080600050905070102--
