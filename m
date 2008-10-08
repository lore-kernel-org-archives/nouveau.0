From: =?UTF-8?B?SGVydsOpIENhdXdlbGllcg==?= <herve.cauwelier-GANU6spQydw@public.gmane.org>
Subject: update for git 1.6
Date: Wed, 08 Oct 2008 11:47:33 +0200
Message-ID: <48EC81B5.1010008@free.fr>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------000301050200000003010703"
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

This is a multi-part message in MIME format.
--------------000301050200000003010703
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

I refresh my checkout and ran autoconf, and I noticed an error with git:

  ./configure: line 1976: git-log: command not found

Indeed the syntax with a dash was deprecated and has been completely
removed since version 1.6.

I found two git calls with the dash. Here is a patch to remove them.

Regards,

Herv=C3=A9

--------------000301050200000003010703
Content-Type: text/x-patch;
 name="0003--git-syntax-is-obsolete-since-git-1.6.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="0003--git-syntax-is-obsolete-since-git-1.6.patch"

From 8c5fa01316c02fa60dff718387df092cac6f773c Mon Sep 17 00:00:00 2001
From: =?utf-8?q?Herv=C3=A9=20Cauwelier?= <herve-CEGohT8qNRvQT0dZR+AlfA@public.gmane.org>
Date: Wed, 8 Oct 2008 11:39:26 +0200
Subject: [PATCH] "git-*" syntax is obsolete since git 1.6

---
 Makefile.am  |    2 +-
 configure.ac |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile.am b/Makefile.am
index 3a02f4e..4d17fd0 100644
--- a/Makefile.am
+++ b/Makefile.am
@@ -26,5 +26,5 @@ EXTRA_DIST = README.NV1 ChangeLog
 # Always regenerate the changelog
 CLEANFILES = ChangeLog
 ChangeLog: FORCE
-	git-log > ChangeLog
+	git log > ChangeLog
 FORCE:
diff --git a/configure.ac b/configure.ac
index de5fb42..814ff2f 100644
--- a/configure.ac
+++ b/configure.ac
@@ -36,7 +36,7 @@ AC_DEFINE_UNQUOTED([NV_PATCHLEVEL],
                    [$(echo $PACKAGE_VERSION | sed -e 's/^[[0-9]]\.[[0-9]]\.\([[0-9]]\)/\1/')],
                    [Patch version])
 AC_DEFINE_UNQUOTED([NV_DRIVER_DATE],
-                   [$(echo -n \";git-log |head -3|tail -1|tr -d '\n';echo -n \")],
+                   [$(echo -n \";git log |head -3|tail -1|tr -d '\n';echo -n \")],
                    [Driver date])
 
 AC_CONFIG_SRCDIR([Makefile.am])
-- 
1.6.0.2


--------------000301050200000003010703
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--------------000301050200000003010703--
