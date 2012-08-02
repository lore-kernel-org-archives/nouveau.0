From: Lucas Stach <dev@lynxeye.de>
Subject: =?j?q?=5BPATCH=200/4=5D=20Convert=20Nouveau=20gallium=20drivers=20to=20automake?=
Date: Fri,  3 Aug 2012 01:53:06 +0200
Message-ID: <1343951590-31439-1-git-send-email-dev@lynxeye.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1119992056=="
Return-path: <mesa-dev-bounces+gcvmd-mesa3d-493=gmane.org@lists.freedesktop.org>
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

--===============1119992056==
Content-Type: text/plain; charset=j
Content-Transfer-Encoding: quoted-printable

Trivial series to convert Nouveau gallium drivers to automake
in order to generate Makefiles.

This is just the general direction in which the MESA buildsystem
is moving. Aside from this it makes the "make" output a lot more
readable and therefore helps to spot compiler warnings more easily.

Lucas Stach (4):
  nouveau: use automake to generate Makefile
  nv30: use automake to generate Makefile
  nv50: use automake to generate Makefile
  nvc0: use automake to generate Makefile

 configure.ac                            |  4 ++++
 src/gallium/drivers/nouveau/Makefile    | 16 ----------------
 src/gallium/drivers/nouveau/Makefile.am | 16 ++++++++++++++++
 src/gallium/drivers/nv30/Makefile       | 12 ------------
 src/gallium/drivers/nv30/Makefile.am    | 16 ++++++++++++++++
 src/gallium/drivers/nv50/Makefile       | 12 ------------
 src/gallium/drivers/nv50/Makefile.am    | 25 +++++++++++++++++++++++++
 src/gallium/drivers/nvc0/Makefile       | 12 ------------
 src/gallium/drivers/nvc0/Makefile.am    | 25 +++++++++++++++++++++++++
 9 Dateien ge=C3=A4ndert, 86 Zeilen hinzugef=C3=BCgt(+), 52 Zeilen entfer=
nt(-)
 delete mode 100644 src/gallium/drivers/nouveau/Makefile
 create mode 100644 src/gallium/drivers/nouveau/Makefile.am
 delete mode 100644 src/gallium/drivers/nv30/Makefile
 create mode 100644 src/gallium/drivers/nv30/Makefile.am
 delete mode 100644 src/gallium/drivers/nv50/Makefile
 create mode 100644 src/gallium/drivers/nv50/Makefile.am
 delete mode 100644 src/gallium/drivers/nvc0/Makefile
 create mode 100644 src/gallium/drivers/nvc0/Makefile.am

--=20
1.7.11.2


--===============1119992056==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
mesa-dev mailing list
mesa-dev@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/mesa-dev

--===============1119992056==--
