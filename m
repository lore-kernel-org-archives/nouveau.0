From: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 6/7] configure: require xorg-macros 1.8
Date: Sat, 16 Feb 2013 20:48:46 +0000
Message-ID: <1361047727-740-7-git-send-email-emil.l.velikov@gmail.com>
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

Explicitly check for xorg-macros 1.8, as a subtle hint
to update your build deps if building your own ddx

Signed-off-by: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 configure.ac | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/configure.ac b/configure.ac
index ad5a2ea..433131d 100644
--- a/configure.ac
+++ b/configure.ac
@@ -47,6 +47,18 @@ AM_INIT_AUTOMAKE([dist-bzip2])
 
 m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])
 
+# Require X.Org macros 1.8 or later for MAN_SUBSTS set by XORG_MANPAGE_SECTIONS
+m4_ifndef([XORG_MACROS_VERSION],
+          [m4_fatal([must install xorg-macros 1.8 or later before running autoconf/autogen])])
+
+XORG_MACROS_VERSION(1.8)
+XORG_DEFAULT_OPTIONS
+
+# Require X.Org server macros (i.e. XORG_DRIVER_CHECK_EXT) to check for required modules 
+m4_ifndef([XORG_DRIVER_CHECK_EXT],
+          [m4_fatal([must install xorg-server macros before running autoconf/autogen])])
+
+
 # Checks for programs.
 AC_DISABLE_STATIC
 LT_INIT
-- 
1.8.1.3
