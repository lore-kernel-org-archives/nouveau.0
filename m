From: Peter Henriksson <peter.henriksson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [Patch] Add shave support
Date: Mon, 13 Jul 2009 18:33:19 +0200
Message-ID: <1247502799.29492.3.camel@darwin.lan>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-AfGF24ZJf/1zdxZGM8I1"
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


--=-AfGF24ZJf/1zdxZGM8I1
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Patch to add shave support for cleaner output. Defaults to disabled.

// Peter

--=-AfGF24ZJf/1zdxZGM8I1
Content-Disposition: attachment; filename="0001-Add-shave-support.patch"
Content-Type: text/x-patch; name="0001-Add-shave-support.patch"; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

From b5ebca697ca25c7bc13a55be218c12120e8a145e Mon Sep 17 00:00:00 2001
From: Peter Henriksson <peter.henriksson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Date: Mon, 13 Jul 2009 18:13:27 +0200
Subject: [PATCH] Add shave support

Defaults to disabled
---
 .gitignore       |    2 +
 acinclude.m4     |   77 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 configure.ac     |    4 +++
 shave-libtool.in |   69 +++++++++++++++++++++++++++++++++++++++++++++++
 shave.in         |   79 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 231 insertions(+), 0 deletions(-)
 create mode 100644 acinclude.m4
 create mode 100644 shave-libtool.in
 create mode 100644 shave.in

diff --git a/.gitignore b/.gitignore
index 4ff1108..7580e8e 100644
--- a/.gitignore
+++ b/.gitignore
@@ -20,3 +20,5 @@ ltmain.sh
 missing
 stamp-h1
 ChangeLog
+shave
+shave-libtool
diff --git a/acinclude.m4 b/acinclude.m4
new file mode 100644
index 0000000..0a3509e
--- /dev/null
+++ b/acinclude.m4
@@ -0,0 +1,77 @@
+dnl Make automake/libtool output more friendly to humans
+dnl  Damien Lespiau <damien.lespiau-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
+dnl
+dnl SHAVE_INIT([shavedir],[default_mode])
+dnl
+dnl shavedir: the directory where the shave scripts are, it defaults to
+dnl           $(top_builddir)
+dnl default_mode: (enable|disable) default shave mode.  This parameter
+dnl               controls shave's behaviour when no option has been
+dnl               given to configure.  It defaults to disable.
+dnl
+dnl * SHAVE_INIT should be called late in your configure.(ac|in) file (just
+dnl   before AC_CONFIG_FILE/AC_OUTPUT is perfect.  This macro rewrites CC and
+dnl   LIBTOOL, you don't want the configure tests to have these variables
+dnl   re-defined.
+dnl * This macro requires GNU make's -s option.
+
+AC_DEFUN([_SHAVE_ARG_ENABLE],
+[
+  AC_ARG_ENABLE([shave],
+    AS_HELP_STRING(
+      [--enable-shave],
+      [use shave to make the build pretty [[default=$1]]]),,
+      [enable_shave=$1]
+    )
+])
+
+AC_DEFUN([SHAVE_INIT],
+[
+  dnl you can tweak the default value of enable_shave
+  m4_if([$2], [enable], [_SHAVE_ARG_ENABLE(yes)], [_SHAVE_ARG_ENABLE(no)])
+
+  if test x"$enable_shave" = xyes; then
+    dnl where can we find the shave scripts?
+    m4_if([$1],,
+      [shavedir="$ac_pwd"],
+      [shavedir="$ac_pwd/$1"])
+    AC_SUBST(shavedir)
+
+    dnl make is now quiet
+    AC_SUBST([MAKEFLAGS], [-s])
+    AC_SUBST([AM_MAKEFLAGS], ['`test -z $V && echo -s`'])
+
+    dnl we need sed
+    AC_CHECK_PROG(SED,sed,sed,false)
+
+    dnl substitute libtool
+    SHAVE_SAVED_LIBTOOL=$LIBTOOL
+    LIBTOOL="${SHELL} ${shavedir}/shave-libtool '${SHAVE_SAVED_LIBTOOL}'"
+    AC_SUBST(LIBTOOL)
+
+    dnl substitute cc/cxx
+    SHAVE_SAVED_CC=$CC
+    SHAVE_SAVED_CXX=$CXX
+    SHAVE_SAVED_FC=$FC
+    SHAVE_SAVED_F77=$F77
+    SHAVE_SAVED_OBJC=$OBJC
+    CC="${SHELL} ${shavedir}/shave cc ${SHAVE_SAVED_CC}"
+    CXX="${SHELL} ${shavedir}/shave cxx ${SHAVE_SAVED_CXX}"
+    FC="${SHELL} ${shavedir}/shave fc ${SHAVE_SAVED_FC}"
+    F77="${SHELL} ${shavedir}/shave f77 ${SHAVE_SAVED_F77}"
+    OBJC="${SHELL} ${shavedir}/shave objc ${SHAVE_SAVED_OBJC}"
+    AC_SUBST(CC)
+    AC_SUBST(CXX)
+    AC_SUBST(FC)
+    AC_SUBST(F77)
+    AC_SUBST(OBJC)
+
+    V=@
+  else
+    V=1
+  fi
+  Q='$(V:1=)'
+  AC_SUBST(V)
+  AC_SUBST(Q)
+])
+
diff --git a/configure.ac b/configure.ac
index 0e9b319..c0a9135 100644
--- a/configure.ac
+++ b/configure.ac
@@ -45,6 +45,8 @@ AC_CONFIG_AUX_DIR(.)
 
 AM_INIT_AUTOMAKE([dist-bzip2])
 
+AC_CONFIG_FILES([shave shave-libtool])
+
 # Checks for programs.
 AC_DISABLE_STATIC
 AC_PROG_LIBTOOL
@@ -118,6 +120,8 @@ AC_SUBST([DRIVER_NAME])
 XORG_MANPAGE_SECTIONS
 XORG_RELEASE_VERSION
 
+SHAVE_INIT(.,disable)
+
 AC_OUTPUT([
 	Makefile
 	src/Makefile
diff --git a/shave-libtool.in b/shave-libtool.in
new file mode 100644
index 0000000..1f3a720
--- /dev/null
+++ b/shave-libtool.in
@@ -0,0 +1,69 @@
+#!/bin/sh
+
+# we need sed
+SED=@SED@
+if test -z "$SED" ; then
+SED=sed
+fi
+
+lt_unmangle ()
+{
+   last_result=`echo $1 | $SED -e 's#.libs/##' -e 's#[0-9a-zA-Z_\-\.]*_la-##'`
+}
+
+# the real libtool to use
+LIBTOOL="$1"
+shift
+
+# if 1, don't print anything, the underlaying wrapper will do it
+pass_though=0
+
+# scan the arguments, keep the right ones for libtool, and discover the mode
+preserved_args=
+while test "$#" -gt 0; do
+    opt="$1"
+    shift
+
+    case $opt in
+    --mode=*)
+        mode=`echo $opt | $SED -e 's/[-_a-zA-Z0-9]*=//'`
+        preserved_args="$preserved_args $opt"
+        ;;
+    -o)
+        lt_output="$1"
+        preserved_args="$preserved_args $opt"
+	;;
+    *)
+        preserved_args="$preserved_args $opt"
+        ;;
+      esac
+done
+
+case "$mode" in
+compile)
+    # shave will be called and print the actual CC/CXX/LINK line
+    preserved_args="$preserved_args --shave-mode=$mode"
+    pass_though=1
+    ;;
+link)
+    preserved_args="$preserved_args --shave-mode=$mode"
+    Q="  LINK  "
+    ;;
+*)
+    # let's u
+    # echo "*** libtool: Unimplemented mode: $mode, fill a bug report"
+    ;;
+esac
+
+lt_unmangle "$lt_output"
+output=$last_result
+
+if test -z $V; then
+    if test $pass_though -eq 0; then
+        echo "$Q$output"
+    fi
+    $LIBTOOL --silent $preserved_args
+else
+    echo $LIBTOOL $preserved_args
+    $LIBTOOL $preserved_args
+fi
diff --git a/shave.in b/shave.in
new file mode 100644
index 0000000..5c16f27
--- /dev/null
+++ b/shave.in
@@ -0,0 +1,79 @@
+#!/bin/sh
+
+# we need sed
+SED=@SED@
+if test -z "$SED" ; then
+SED=sed
+fi
+
+lt_unmangle ()
+{
+   last_result=`echo $1 | $SED -e 's#.libs/##' -e 's#[0-9a-zA-Z_\-\.]*_la-##'`
+}
+
+# the tool to wrap (cc, cxx, ar, ranlib, ..)
+tool="$1"
+shift
+
+# the reel tool (to call)
+REEL_TOOL="$1"
+shift
+
+pass_through=0
+preserved_args=
+while test "$#" -gt 0; do
+    opt="$1"
+    shift
+
+    case $opt in
+    --shave-mode=*)
+        mode=`echo $opt | $SED -e 's/[-_a-zA-Z0-9]*=//'`
+	;;
+    -o)
+        lt_output="$1"
+        preserved_args="$preserved_args $opt"
+	;;
+    *)
+        preserved_args="$preserved_args $opt"
+        ;;
+      esac
+done
+
+# mode=link is handled in the libtool wrapper
+case "$mode,$tool" in
+link,*)
+    pass_through=1
+    ;;
+*,cxx)
+    Q="  CXX   "
+    ;;
+*,cc)
+    Q="  CC    "
+    ;;
+*,fc)
+    Q="  FC    "
+    ;;
+*,f77)
+    Q="  F77   "
+    ;;
+*,objc)
+    Q="  OBJC   "
+    ;;
+*,*)
+    # should not happen
+    Q="  CC    "
+    ;;
+esac
+
+lt_unmangle "$lt_output"
+output=$last_result
+
+if test -z $V; then
+    if test $pass_through -eq 0; then
+        echo "$Q$output"
+    fi
+    $REEL_TOOL $preserved_args
+else
+    echo $REEL_TOOL $preserved_args
+    $REEL_TOOL $preserved_args
+fi
-- 
1.6.3.3


--=-AfGF24ZJf/1zdxZGM8I1
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--=-AfGF24ZJf/1zdxZGM8I1--
