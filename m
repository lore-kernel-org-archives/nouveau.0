From: "Mariane" <mariane-n+LsquliYkMdnm+yROfE0A@public.gmane.org>
Subject: Can't "make" nouveau
Date: Sat, 4 Jun 2011 19:04:14 +0200 (CEST)
Message-ID: <157dd0bdb7e9a9d8ebae780348b77575.squirrel@webmail.no-log.org>
Reply-To: mariane-n+LsquliYkMdnm+yROfE0A@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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

Hi everyone,

I'm not used to beta programs and it's the first time I try to compile a
driver, so please excuse me if I ask silly questions. I have Ubuntu 10.10,
KDE desktop, and my nvidia card GeForce 9300 H GS seems impossible to
configure for 2 monitors with the current driver. xrandr commands fail.

I was following the instructions here:
http://nouveau.freedesktop.org/wiki/InstallNouveau

What I did was:

sudo apt-get install xserver-xorg-video-nouveau-dbg
lsmod
  check if there are nvidia drivers listed? no
sudo modprobe nouveau
lsmod
  Now I can see nouveau drivers listed
git clone git://anongit.freedesktop.org/git/nouveau/xf86-video-nouveau/
cd xf86-video-nouveau/
./autogen.sh
Problem and Solution (found on the wiki):
  sudo apt-get install xorg-dev
./autogen.sh
Problem:
  No package 'libdrm_nouveau' found
Solution1: I see there is a package called libdrm-nouveau1 so I replace:
  #PKG_CHECK_MODULES(LIBDRM_NOUVEAU, libdrm_nouveau)
by
  PKG_CHECK_MODULES(LIBDRM_NOUVEAU, libdrm-nouveau1)
It does not solve the problem.

Solution2: in configure.ac I comment out:
  # Checks for pkg-config packages
  #PKG_CHECK_MODULES(LIBDRM_NOUVEAU, libdrm_nouveau)
  #PKG_CHECK_MODULES(LIBDRM_NOUVEAU, libdrm-nouveau1)
  #AC_SUBST(LIBDRM_NOUVEAU_CFLAGS)
  #AC_SUBST(LIBDRM_NOUVEAU_LIBS)

  #PKG_CHECK_MODULES(XORG, [xorg-server >= 1.8] xproto fontsproto libdrm
xf86driproto $REQUIRED_MODULES)
  #PKG_CHECK_MODULES(XEXT, [xextproto >= 7.0.99.1],
  #		  HAVE_XEXTPROTO_71="yes"; AC_DEFINE(HAVE_XEXTPROTO_71, 1, [xextproto
7.1 available]),
  #		  HAVE_XEXTPROTO_71="no")
  #AM_CONDITIONAL(HAVE_XEXTPROTO_71, [ test "$HAVE_XEXTPROTO_71" = "yes" ])
  #sdkdir=$(pkg-config --variable=sdkdir xorg-server)
This time autogen.sh finishes.

make
Making all in src
make[2]: Entering directory `/home/alan/xf86-video-nouveau/src'
  CC     nouveau_exa.lo
gcc: @XORG_CFLAGS@: No such file or directory
gcc: @LIBDRM_NOUVEAU_CFLAGS@: No such file or directory
In file included from nv_include.h:5,
                 from nouveau_exa.c:23:
../config.h:4: fatal error: xorg-server.h: No such file or directory
compilation terminated.
make[2]: *** [nouveau_exa.lo] Error 1
make[2]: Leaving directory `/home/alan/xf86-video-nouveau/src'
make[1]: *** [all-recursive] Error 1
make[1]: Leaving directory `/home/alan/xf86-video-nouveau'
make: *** [all] Error 2

Solution:
  sudo apt-get install xserver-xorg-dev
  xserver-xorg-dev is already the newest version.
So this solution fails

What should I do next, please?

Mariane
