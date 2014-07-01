From: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: nouveau xorg driver - compile error
Date: Tue, 01 Jul 2014 22:39:45 +0100
Message-ID: <53B32AA1.5010705@gmail.com>
References: <201407012147.46585@pali>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------010008050507060506050203"
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <201407012147.46585@pali>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: =?ISO-8859-1?Q?Pali_Roh=E1r?= <pali.rohar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: nouveau.vger.kernel.org

This is a multi-part message in MIME format.
--------------010008050507060506050203
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Pali,

If the future can you include the error message (plus a couple of lines o=
f
context) in the email ? Thanks.

Seems like the list* symbols got prefixed with xorg_ during the 1.12
development cycle (commit ca64912c02b), and your build uses 1.11.x.

I'm using xorg-server 1.15 so cannot really test this but the attached pa=
tch
should help. Can you give it a try ?

Cheers,
Emil

On 01/07/14 20:47, Pali Roh=E1r wrote:
> Hello,
>=20
> nouveau xorg driver from master git repository cannot be compiled
> on ubuntu precise. Here is build log:
>=20
> https://launchpadlibrarian.net/179062836/buildlog_ubuntu-precise-amd64.=
xserver-xorg-video-nouveau_1:1.0.10-git201407010817~ubuntu12.04.1_FAILEDT=
OBUILD.txt.gz
>=20
> Problem is somewhere in drmmode_display.c. Can somebody look at
> it and fix compile error problems?
>=20
>=20
>=20
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
>=20


--------------010008050507060506050203
Content-Type: text/x-patch;
 name="0001-xorg_list-define-the-xorg_list-symbols.patch"
Content-Disposition: attachment;
 filename="0001-xorg_list-define-the-xorg_list-symbols.patch"
Content-Transfer-Encoding: quoted-printable

From d437ca90803ddf70190cdbaf617e815f6441f134 Mon Sep 17 00:00:00 2001
From: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Date: Tue, 1 Jul 2014 22:31:47 +0100
Subject: [PATCH] xorg_list: define the xorg_list* symbols
MIME-Version: 1.0
Content-Type: text/plain; charset=3DUTF-8
Content-Transfer-Encoding: 8bit

...when building against pre 1.12 x.
The build will fail as earlier versions of X were missing the xorg_
prefix of the symbols - struct and util functions.

Reported-by: Pali Roh=C3=A1r <pali.rohar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Signed-off-by: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 configure.ac          | 13 +++++++++++++
 src/drmmode_display.c |  8 ++++++++
 src/nv_driver.c       |  5 +++++
 3 files changed, 26 insertions(+)

diff --git a/configure.ac b/configure.ac
index 92e047a..2177c24 100644
--- a/configure.ac
+++ b/configure.ac
@@ -127,6 +127,19 @@ AC_SUBST([DRIVER_NAME])
 XORG_MANPAGE_SECTIONS
 XORG_RELEASE_VERSION
=20
+AC_CHECK_HEADERS([list.h],
+                 [have_list_h=3D"yes"], [have_list_h=3D"no"],
+                 [#include <X11/Xdefs.h>
+                  #include "xorg-server.h"])
+
+if test "x$have_list_h" =3D xyes; then
+    AC_CHECK_DECL(xorg_list_init,
+                  [AC_DEFINE(HAVE_XORG_LIST, 1, [Have xorg_list API])], =
[],
+                  [#include <X11/Xdefs.h>
+                   #include "xorg-server.h"
+                   #include "list.h"])
+fi
+
 AC_MSG_CHECKING([whether to include GLAMOR support])
=20
 AC_COMPILE_IFELSE(AC_LANG_PROGRAM(
diff --git a/src/drmmode_display.c b/src/drmmode_display.c
index 58b5e07..45225ad 100644
--- a/src/drmmode_display.c
+++ b/src/drmmode_display.c
@@ -126,6 +126,14 @@ drmmode_swap(ScrnInfoPtr scrn, uint32_t next, uint32=
_t *prev)
 	drmmode->fb_id =3D next;
 }
=20
+#if !HAVE_XORG_LIST
+#define xorg_list                       list
+#define xorg_list_for_each_entry        list_for_each_entry
+#define xorg_list_for_each_entry_safe   list_for_each_entry_safe
+#define xorg_list_append                list_append
+#define xorg_list_del                   list_del
+#endif
+
 struct drmmode_event {
 	struct xorg_list head;
 	drmmode_ptr drmmode;
diff --git a/src/nv_driver.c b/src/nv_driver.c
index 44a0963..2fa3802 100644
--- a/src/nv_driver.c
+++ b/src/nv_driver.c
@@ -37,6 +37,11 @@
 #include "nouveau_present.h"
 #include "nouveau_sync.h"
=20
+#if !HAVE_XORG_LIST
+#define xorg_list_is_empty              list_is_empty
+#define xorg_list_for_each_entry        list_for_each_entry
+#endif
+
 /*
  * Forward definitions for the functions that make up the driver.
  */
--=20
2.0.0


--------------010008050507060506050203
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--------------010008050507060506050203--
