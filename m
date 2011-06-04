From: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Can't "make" nouveau
Date: Sat, 04 Jun 2011 20:21:54 +0100
Message-ID: <op.vwkf2sdt7cbmmg@emo>
References: <157dd0bdb7e9a9d8ebae780348b77575.squirrel@webmail.no-log.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"; DelSp="yes"
Content-Transfer-Encoding: 7bit
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
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Mariane <mariane-n+LsquliYkMdnm+yROfE0A@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Sat, 04 Jun 2011 18:04:14 +0100, Mariane <mariane-n+LsquliYkMdnm+yROfE0A@public.gmane.org> wrote:

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
>   check if there are nvidia drivers listed? no
> sudo modprobe nouveau
> lsmod
>   Now I can see nouveau drivers listed
> git clone git://anongit.freedesktop.org/git/nouveau/xf86-video-nouveau/
> cd xf86-video-nouveau/
> ./autogen.sh
> Problem and Solution (found on the wiki):
>   sudo apt-get install xorg-dev
> ./autogen.sh
> Problem:
>   No package 'libdrm_nouveau' found
> Solution1: I see there is a package called libdrm-nouveau1 so I replace:
>   #PKG_CHECK_MODULES(LIBDRM_NOUVEAU, libdrm_nouveau)
> by
>   PKG_CHECK_MODULES(LIBDRM_NOUVEAU, libdrm-nouveau1)
> It does not solve the problem.
>
> Solution2: in configure.ac I comment out:
>   # Checks for pkg-config packages
>   #PKG_CHECK_MODULES(LIBDRM_NOUVEAU, libdrm_nouveau)
>   #PKG_CHECK_MODULES(LIBDRM_NOUVEAU, libdrm-nouveau1)
>   #AC_SUBST(LIBDRM_NOUVEAU_CFLAGS)
>   #AC_SUBST(LIBDRM_NOUVEAU_LIBS)
>
>   #PKG_CHECK_MODULES(XORG, [xorg-server >= 1.8] xproto fontsproto libdrm
> xf86driproto $REQUIRED_MODULES)
>   #PKG_CHECK_MODULES(XEXT, [xextproto >= 7.0.99.1],
>   #		  HAVE_XEXTPROTO_71="yes"; AC_DEFINE(HAVE_XEXTPROTO_71, 1, [xextproto
> 7.1 available]),
>   #		  HAVE_XEXTPROTO_71="no")
>   #AM_CONDITIONAL(HAVE_XEXTPROTO_71, [ test "$HAVE_XEXTPROTO_71" = "yes" ])
>   #sdkdir=$(pkg-config --variable=sdkdir xorg-server)
> This time autogen.sh finishes.
>
> make
> Making all in src
> make[2]: Entering directory `/home/alan/xf86-video-nouveau/src'
>   CC     nouveau_exa.lo
> gcc: @XORG_CFLAGS@: No such file or directory
> gcc: @LIBDRM_NOUVEAU_CFLAGS@: No such file or directory
> In file included from nv_include.h:5,
>                  from nouveau_exa.c:23:
> ../config.h:4: fatal error: xorg-server.h: No such file or directory
> compilation terminated.
> make[2]: *** [nouveau_exa.lo] Error 1
> make[2]: Leaving directory `/home/alan/xf86-video-nouveau/src'
> make[1]: *** [all-recursive] Error 1
> make[1]: Leaving directory `/home/alan/xf86-video-nouveau'
> make: *** [all] Error 2
>
> Solution:
>   sudo apt-get install xserver-xorg-dev
>   xserver-xorg-dev is already the newest version.
> So this solution fails
>
> What should I do next, please?
>
> Mariane
>
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
>

Hi Mariane,

You mentioned that you cannot get your dual head to work
I believe that it may be easier to work on that rather than
building everything from scratch

Please note that nouveau consist of four parts - kernel module,
libdrm, ddx (X driver) and 3d component(ignored at this stage).

Nevertheless, the "workarounds" you stated are not correct

What you could do is
  1. obtain everything from the xorg-edgers ppa [1] - in many
cases the packages are quite in track of upstream
  2. build *everything* from git

If you want to build everything form git, follow these steps
  1. git clone, compile and install the kernel(yes the whole kernel)
  2. git clone, compile and install libdrm
  3. git clone, compile and install ddx (xf86-nouveau-video)

For correct way to configure your build take a look at the wiki [2]
If the above sequence fails please do report a bug [3]
in our tracker

[1] https://launchpad.net/~xorg-edgers/+archive/ppa
[2] http://nouveau.freedesktop.org/wiki/InstallNouveau
[3] http://nouveau.freedesktop.org/wiki/Bugs
