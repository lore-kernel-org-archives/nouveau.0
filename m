From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/3] Update configure.ac with autoupdate
Date: Thu, 17 Feb 2011 14:27:14 +1000
Message-ID: <1297916840.11351.0.camel@nisroch>
References: <1297910842.31321.1.camel@ginzen>
Reply-To: skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1297910842.31321.1.camel@ginzen>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Francesco Marella <francesco.marella-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau ML <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Thu, 2011-02-17 at 03:47 +0100, Francesco Marella wrote:
> Signed-off-by: Francesco Marella <fmarl-XtQPfPCVGG7srOwW+9ziJQ@public.gmane.org>
Thank you, pushed all 3 patches.

Ben.
> ---
>  configure.ac |   15 ++++++++-------
>  1 files changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/configure.ac b/configure.ac
> index 676c2a4..6a143dc 100644
> --- a/configure.ac
> +++ b/configure.ac
> @@ -20,11 +20,11 @@
>  #
>  # Process this file with autoconf to produce a configure script
>  
> -AC_PREREQ(2.57)
> +AC_PREREQ([2.60])
>  AC_INIT([xf86-video-nouveau],
> -        0.0.16,
> +        [0.0.16],
>          [https://bugs.freedesktop.org/enter_bug.cgi?product=xorg],
> -        xf86-video-nouveau)
> +        [xf86-video-nouveau])
>  
>  AC_DEFINE_UNQUOTED([NV_MAJOR_VERSION],
>                     [$(echo $PACKAGE_VERSION | sed -e 's/^\([[0-9]]*\)\.[[0-9]]*\.[[0-9]]*/\1/')],
> @@ -40,7 +40,7 @@ AC_DEFINE_UNQUOTED([NV_DRIVER_DATE],
>                     [Driver date])
>  
>  AC_CONFIG_SRCDIR([Makefile.am])
> -AM_CONFIG_HEADER([config.h])
> +AC_CONFIG_HEADERS([config.h])
>  AC_CONFIG_AUX_DIR(.)
>  
>  AM_INIT_AUTOMAKE([dist-bzip2])
> @@ -49,13 +49,13 @@ m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])
>  
>  # Checks for programs.
>  AC_DISABLE_STATIC
> -AC_PROG_LIBTOOL
> +LT_INIT
>  AC_PROG_CC
>  
>  AH_TOP([#include "xorg-server.h"])
>  
>  AC_ARG_WITH(xorg-module-dir,
> -            AC_HELP_STRING([--with-xorg-module-dir=DIR],
> +            AS_HELP_STRING([--with-xorg-module-dir=DIR],
>                             [Default xorg module directory [[default=$libdir/xorg/modules]]]),
>              [moduledir="$withval"],
>              [moduledir="$libdir/xorg/modules"])
> @@ -113,8 +113,9 @@ AC_SUBST([DRIVER_NAME])
>  XORG_MANPAGE_SECTIONS
>  XORG_RELEASE_VERSION
>  
> -AC_OUTPUT([
> +AC_CONFIG_FILES([
>  	Makefile
>  	src/Makefile
>  	man/Makefile
>  ])
> +AC_OUTPUT
