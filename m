From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Subject: =?j?q?=5BPATCH=202/4=5D=20nv30=3A=20use=20automake=20to=20generate=20Makefile?=
Date: Fri,  3 Aug 2012 01:53:08 +0200
Message-ID: <1343951590-31439-3-git-send-email-dev@lynxeye.de>
References: <1343951590-31439-1-git-send-email-dev@lynxeye.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1792701878=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1343951590-31439-1-git-send-email-dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
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
Cc: mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============1792701878==
Content-Type: text/plain; charset=j
Content-Transfer-Encoding: quoted-printable

---
 configure.ac                         |  1 +
 src/gallium/drivers/nv30/Makefile    | 12 ------------
 src/gallium/drivers/nv30/Makefile.am | 16 ++++++++++++++++
 3 Dateien ge=C3=A4ndert, 17 Zeilen hinzugef=C3=BCgt(+), 12 Zeilen entfer=
nt(-)
 delete mode 100644 src/gallium/drivers/nv30/Makefile
 create mode 100644 src/gallium/drivers/nv30/Makefile.am

diff --git a/configure.ac b/configure.ac
index d1fc0f3..59b4b68 100644
--- a/configure.ac
+++ b/configure.ac
@@ -2130,6 +2130,7 @@ AC_CONFIG_FILES([configs/current
 		src/gallium/state_trackers/clover/Makefile
 		src/gallium/drivers/Makefile
 		src/gallium/drivers/nouveau/Makefile
+		src/gallium/drivers/nv30/Makefile
 		src/gallium/drivers/r300/Makefile
 		src/gallium/drivers/r600/Makefile
 		src/gallium/targets/opencl/Makefile
diff --git a/src/gallium/drivers/nv30/Makefile b/src/gallium/drivers/nv30=
/Makefile
deleted file mode 100644
index de521aa..0000000
--- a/src/gallium/drivers/nv30/Makefile
+++ /dev/null
@@ -1,12 +0,0 @@
-TOP =3D ../../../..
-include $(TOP)/configs/current
-
-LIBNAME =3D nv30
-
-include Makefile.sources
-
-LIBRARY_INCLUDES =3D \
-	$(LIBDRM_CFLAGS)
-
-include ../../Makefile.template
-# DO NOT DELETE
diff --git a/src/gallium/drivers/nv30/Makefile.am b/src/gallium/drivers/n=
v30/Makefile.am
new file mode 100644
index 0000000..e4034168
--- /dev/null
+++ b/src/gallium/drivers/nv30/Makefile.am
@@ -0,0 +1,16 @@
+include Makefile.sources
+
+noinst_LIBRARIES =3D libnv30.a
+
+AM_CFLAGS =3D \
+	-I$(top_srcdir)/src/gallium/include \
+	-I$(top_srcdir)/src/gallium/auxiliary \
+	-I$(top_srcdir)/src/gallium/drivers \
+	-I$(top_srcdir)/include \
+	$(NOUVEAU_CFLAGS) \
+	$(DEFINES) \
+	$(PIC_FLAGS) \
+	$(VISIBILITY_CFLAGS)
+
+libnv30_a_SOURCES =3D \
+	$(C_SOURCES)
\ No newline at end of file
--=20
1.7.11.2


--===============1792701878==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1792701878==--
