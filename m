From: Lucas Stach <dev@lynxeye.de>
Subject: =?j?q?=5BPATCH=201/4=5D=20nouveau=3A=20use=20automake=20to=20generate=20Makefile?=
Date: Fri,  3 Aug 2012 01:53:07 +0200
Message-ID: <1343951590-31439-2-git-send-email-dev@lynxeye.de>
References: <1343951590-31439-1-git-send-email-dev@lynxeye.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1117127968=="
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

--===============1117127968==
Content-Type: text/plain; charset=j
Content-Transfer-Encoding: quoted-printable

---
 configure.ac                            |  1 +
 src/gallium/drivers/nouveau/Makefile    | 16 ----------------
 src/gallium/drivers/nouveau/Makefile.am | 16 ++++++++++++++++
 3 Dateien ge=C3=A4ndert, 17 Zeilen hinzugef=C3=BCgt(+), 16 Zeilen entfer=
nt(-)
 delete mode 100644 src/gallium/drivers/nouveau/Makefile
 create mode 100644 src/gallium/drivers/nouveau/Makefile.am

diff --git a/configure.ac b/configure.ac
index b6481a6..d1fc0f3 100644
--- a/configure.ac
+++ b/configure.ac
@@ -2129,6 +2129,7 @@ AC_CONFIG_FILES([configs/current
 		src/gallium/auxiliary/pipe-loader/Makefile
 		src/gallium/state_trackers/clover/Makefile
 		src/gallium/drivers/Makefile
+		src/gallium/drivers/nouveau/Makefile
 		src/gallium/drivers/r300/Makefile
 		src/gallium/drivers/r600/Makefile
 		src/gallium/targets/opencl/Makefile
diff --git a/src/gallium/drivers/nouveau/Makefile b/src/gallium/drivers/n=
ouveau/Makefile
deleted file mode 100644
index d583324..0000000
--- a/src/gallium/drivers/nouveau/Makefile
+++ /dev/null
@@ -1,16 +0,0 @@
-TOP =3D ../../../..
-include $(TOP)/configs/current
-
-LIBNAME =3D nouveau
-
-LIBRARY_INCLUDES =3D \
-	$(LIBDRM_CFLAGS) \
-	-I$(TOP)/src/gallium/drivers/nouveau/include
-
-LIBRARY_INCLUDES +=3D $(shell $(PKG_CONFIG) libdrm libdrm_nouveau --cfla=
gs-only-I)
-LIBRARY_DEFINES +=3D $(shell $(PKG_CONFIG) libdrm libdrm_nouveau --cflag=
s-only-other)
-
-# get C_SOURCES
-include Makefile.sources
-
-include ../../Makefile.template
diff --git a/src/gallium/drivers/nouveau/Makefile.am b/src/gallium/driver=
s/nouveau/Makefile.am
new file mode 100644
index 0000000..dd4a767
--- /dev/null
+++ b/src/gallium/drivers/nouveau/Makefile.am
@@ -0,0 +1,16 @@
+include Makefile.sources
+
+noinst_LIBRARIES =3D libnouveau.a
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
+libnouveau_a_SOURCES =3D \
+	$(C_SOURCES)
\ No newline at end of file
--=20
1.7.11.2


--===============1117127968==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
mesa-dev mailing list
mesa-dev@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/mesa-dev

--===============1117127968==--
