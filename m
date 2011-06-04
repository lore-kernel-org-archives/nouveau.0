From: Younes Manton <younes.m-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Can't "make" nouveau
Date: Sat, 4 Jun 2011 13:55:33 -0400
Message-ID: <BANLkTikZHRX1Bq8wFATNiezr3QRYs+TSwQ@mail.gmail.com>
References: <157dd0bdb7e9a9d8ebae780348b77575.squirrel@webmail.no-log.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <157dd0bdb7e9a9d8ebae780348b77575.squirrel-2RFepEojUI2f4uyq6WJiQx2eb7JE58TQ@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: mariane-n+LsquliYkMdnm+yROfE0A@public.gmane.org
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Sat, Jun 4, 2011 at 1:04 PM, Mariane <mariane-n+LsquliYkMdnm+yROfE0A@public.gmane.org> wrote:
> Hi everyone,
>
> I'm not used to beta programs and it's the first time I try to compile a
> driver, so please excuse me if I ask silly questions. I have Ubuntu 10.10,
> KDE desktop, and my nvidia card GeForce 9300 H GS seems impossible to
> configure for 2 monitors with the current driver. xrandr commands fail.
>
> I was following the instructions here:
> http://nouveau.freedesktop.org/wiki/InstallNouveau
>
> What I did was:
>
> sudo apt-get install xserver-xorg-video-nouveau-dbg
> lsmod
> =A0check if there are nvidia drivers listed? no
> sudo modprobe nouveau
> lsmod
> =A0Now I can see nouveau drivers listed
> git clone git://anongit.freedesktop.org/git/nouveau/xf86-video-nouveau/
> cd xf86-video-nouveau/
> ./autogen.sh
> Problem and Solution (found on the wiki):
> =A0sudo apt-get install xorg-dev
> ./autogen.sh
> Problem:
> =A0No package 'libdrm_nouveau' found
> Solution1: I see there is a package called libdrm-nouveau1 so I replace:
> =A0#PKG_CHECK_MODULES(LIBDRM_NOUVEAU, libdrm_nouveau)
> by
> =A0PKG_CHECK_MODULES(LIBDRM_NOUVEAU, libdrm-nouveau1)
> It does not solve the problem.
>
> Solution2: in configure.ac I comment out:
> =A0# Checks for pkg-config packages
> =A0#PKG_CHECK_MODULES(LIBDRM_NOUVEAU, libdrm_nouveau)
> =A0#PKG_CHECK_MODULES(LIBDRM_NOUVEAU, libdrm-nouveau1)
> =A0#AC_SUBST(LIBDRM_NOUVEAU_CFLAGS)
> =A0#AC_SUBST(LIBDRM_NOUVEAU_LIBS)
>
> =A0#PKG_CHECK_MODULES(XORG, [xorg-server >=3D 1.8] xproto fontsproto libd=
rm
> xf86driproto $REQUIRED_MODULES)
> =A0#PKG_CHECK_MODULES(XEXT, [xextproto >=3D 7.0.99.1],
> =A0# =A0 =A0 =A0 =A0 =A0 =A0 =A0 HAVE_XEXTPROTO_71=3D"yes"; AC_DEFINE(HAV=
E_XEXTPROTO_71, 1, [xextproto
> 7.1 available]),
> =A0# =A0 =A0 =A0 =A0 =A0 =A0 =A0 HAVE_XEXTPROTO_71=3D"no")
> =A0#AM_CONDITIONAL(HAVE_XEXTPROTO_71, [ test "$HAVE_XEXTPROTO_71" =3D "ye=
s" ])
> =A0#sdkdir=3D$(pkg-config --variable=3Dsdkdir xorg-server)
> This time autogen.sh finishes.
>
> make
> Making all in src
> make[2]: Entering directory `/home/alan/xf86-video-nouveau/src'
> =A0CC =A0 =A0 nouveau_exa.lo
> gcc: @XORG_CFLAGS@: No such file or directory
> gcc: @LIBDRM_NOUVEAU_CFLAGS@: No such file or directory
> In file included from nv_include.h:5,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from nouveau_exa.c:23:
> ../config.h:4: fatal error: xorg-server.h: No such file or directory
> compilation terminated.
> make[2]: *** [nouveau_exa.lo] Error 1
> make[2]: Leaving directory `/home/alan/xf86-video-nouveau/src'
> make[1]: *** [all-recursive] Error 1
> make[1]: Leaving directory `/home/alan/xf86-video-nouveau'
> make: *** [all] Error 2
>
> Solution:
> =A0sudo apt-get install xserver-xorg-dev
> =A0xserver-xorg-dev is already the newest version.
> So this solution fails
>
> What should I do next, please?

You can't simply comment out the dependency checks if they fail, you
need to actually have the correct software installed.

Anyhow, if you're having trouble with mode setting I don't think
installing a newer xf86-video-nouveau will help, you should likely try
a newer nouveau kernel module, since that's where the mode setting
mostly is done. Alternatively, you can try to figure out why xrandr
fails. What was the error message?
