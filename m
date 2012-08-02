From: Lucas Stach <dev@lynxeye.de>
Subject: =?j?q?=5BPATCH=204/4=5D=20nvc0=3A=20use=20automake=20to=20generate=20Makefile?=
Date: Fri,  3 Aug 2012 01:53:10 +0200
Message-ID: <1343951590-31439-5-git-send-email-dev@lynxeye.de>
References: <1343951590-31439-1-git-send-email-dev@lynxeye.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1271178864=="
Return-path: <mesa-dev-bounces+gcvmd-mesa3d-493=gmane.org@lists.freedesktop.org>
In-Reply-To: <1343951590-31439-1-git-send-email-dev@lynxeye.de>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/mesa-dev>,
	<mailto:mesa-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/mesa-dev>
List-Post: <mailto:mesa-dev@lists.freedesktop.org>
List-Help: <mailto:mesa-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/mesa-dev>,
	<mailto:mesa-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: mesa-dev-bounces+gcvmd-mesa3d-493=gmane.org@lists.freedesktop.org
Errors-To: mesa-dev-bounces+gcvmd-mesa3d-493=gmane.org@lists.freedesktop.org
To: nouveau@lists.freedesktop.org
Cc: mesa-dev@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

--===============1271178864==
Content-Type: text/plain; charset=j
Content-Transfer-Encoding: quoted-printable

---
 configure.ac                         |  1 +
 src/gallium/drivers/nvc0/Makefile    | 12 ------------
 src/gallium/drivers/nvc0/Makefile.am | 25 +++++++++++++++++++++++++
 3 Dateien ge=C3=A4ndert, 26 Zeilen hinzugef=C3=BCgt(+), 12 Zeilen entfer=
nt(-)
 delete mode 100644 src/gallium/drivers/nvc0/Makefile
 create mode 100644 src/gallium/drivers/nvc0/Makefile.am

diff --git a/configure.ac b/configure.ac
index aa20393..dca7352 100644
--- a/configure.ac
+++ b/configure.ac
@@ -2132,6 +2132,7 @@ AC_CONFIG_FILES([configs/current
 		src/gallium/drivers/nouveau/Makefile
 		src/gallium/drivers/nv30/Makefile
 		src/gallium/drivers/nv50/Makefile
+		src/gallium/drivers/nvc0/Makefile
 		src/gallium/drivers/r300/Makefile
 		src/gallium/drivers/r600/Makefile
 		src/gallium/targets/opencl/Makefile
diff --git a/src/gallium/drivers/nvc0/Makefile b/src/gallium/drivers/nvc0=
/Makefile
deleted file mode 100644
index c412625..0000000
--- a/src/gallium/drivers/nvc0/Makefile
+++ /dev/null
@@ -1,12 +0,0 @@
-TOP =3D ../../../..
-include $(TOP)/configs/current
-
-LIBNAME =3D nvc0
-
-# get C/CPP_SOURCES
-include Makefile.sources
-
-LIBRARY_INCLUDES =3D \
-	$(LIBDRM_CFLAGS)
-
-include ../../Makefile.template
diff --git a/src/gallium/drivers/nvc0/Makefile.am b/src/gallium/drivers/n=
vc0/Makefile.am
new file mode 100644
index 0000000..8d60c6e
--- /dev/null
+++ b/src/gallium/drivers/nvc0/Makefile.am
@@ -0,0 +1,25 @@
+include Makefile.sources
+
+noinst_LIBRARIES =3D libnvc0.a
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
+=09
+AM_CXXFLAGS =3D \
+	-I$(top_srcdir)/src/gallium/include \
+	-I$(top_srcdir)/src/gallium/auxiliary \
+	-I$(top_srcdir)/src/gallium/drivers \
+	$(DEFINES) \
+	$(PIC_FLAGS) \
+	$(VISIBILITY_CFLAGS)
+
+libnvc0_a_SOURCES =3D \
+	$(C_SOURCES) \
+	$(CPP_SOURCES)
\ No newline at end of file
--=20
1.7.11.2


--===============1271178864==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
mesa-dev mailing list
mesa-dev@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/mesa-dev

--===============1271178864==--
