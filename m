From: =?windows-1252?Q?Christian_K=F6nig?= <deathsimple@vodafone.de>
Subject: Re: [PATCH] libdrm: hide all private symbols
Date: Wed, 30 Jul 2014 12:16:23 +0200
Message-ID: <53D8C5F7.6040908@vodafone.de>
References: <53D8BCF8.9020908@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <53D8BCF8.9020908@canonical.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Maarten Lankhorst <maarten.lankhorst@canonical.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, Emil Velikov <emil.l.velikov@gmail.com>, Julien Cristau <jcristau@debian.org>
List-Id: nouveau.vger.kernel.org

[CCing Emil as well]

Am 30.07.2014 um 11:38 schrieb Maarten Lankhorst:
> Using -export-symbols-regex all private symbols are hidden, resulting in the following changes:

Wasn't "-export-symbols-regex" exactly that stuff we are trying to avoid 
in mesa?

Christian.

>
> libkms: removes all driver specific exports
> radeon: removes the bof_* exports
> nouveau: removes the abi16_* exports
> freedreno: remove the *kgsl_* and msm_* exports
> intel: removes the drm_mm* exports
> omap/exynos: unchanged as far as I can tell
>   
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@canonical.com>
> ---
>
> diff --git a/exynos/Makefile.am b/exynos/Makefile.am
> index 0a2663a..0cd753d 100644
> --- a/exynos/Makefile.am
> +++ b/exynos/Makefile.am
> @@ -7,7 +7,8 @@ AM_CFLAGS = \
>   
>   libdrm_exynos_la_LTLIBRARIES = libdrm_exynos.la
>   libdrm_exynos_ladir = $(libdir)
> -libdrm_exynos_la_LDFLAGS = -version-number 1:0:0 -no-undefined
> +libdrm_exynos_la_LDFLAGS = -version-number 1:0:0 -no-undefined \
> +	-export-symbols-regex '^(exynos|g2d)_'
>   libdrm_exynos_la_LIBADD = ../libdrm.la @PTHREADSTUBS_LIBS@
>   
>   libdrm_exynos_la_SOURCES = \
> diff --git a/freedreno/Makefile.am b/freedreno/Makefile.am
> index 7903e5b..5fdee22 100644
> --- a/freedreno/Makefile.am
> +++ b/freedreno/Makefile.am
> @@ -9,7 +9,8 @@ AM_CFLAGS = \
>   
>   libdrm_freedreno_la_LTLIBRARIES = libdrm_freedreno.la
>   libdrm_freedreno_ladir = $(libdir)
> -libdrm_freedreno_la_LDFLAGS = -version-number 1:0:0 -no-undefined
> +libdrm_freedreno_la_LDFLAGS = -version-number 1:0:0 -no-undefined \
> +	-export-symbols-regex '^fd_'
>   libdrm_freedreno_la_LIBADD = ../libdrm.la @PTHREADSTUBS_LIBS@
>   
>   libdrm_freedreno_la_SOURCES = \
> diff --git a/intel/Makefile.am b/intel/Makefile.am
> index f49b099..2b9ee48 100644
> --- a/intel/Makefile.am
> +++ b/intel/Makefile.am
> @@ -33,7 +33,8 @@ AM_CFLAGS = \
>   
>   libdrm_intel_la_LTLIBRARIES = libdrm_intel.la
>   libdrm_intel_ladir = $(libdir)
> -libdrm_intel_la_LDFLAGS = -version-number 1:0:0 -no-undefined
> +libdrm_intel_la_LDFLAGS = -version-number 1:0:0 -no-undefined \
> +	-export-symbols-regex '^drm_intel_'
>   libdrm_intel_la_LIBADD = ../libdrm.la \
>   	@PTHREADSTUBS_LIBS@ \
>   	@PCIACCESS_LIBS@ \
> diff --git a/libkms/Makefile.am b/libkms/Makefile.am
> index 449a73b..e3c727a 100644
> --- a/libkms/Makefile.am
> +++ b/libkms/Makefile.am
> @@ -5,7 +5,8 @@ AM_CFLAGS = \
>   
>   libkms_la_LTLIBRARIES = libkms.la
>   libkms_ladir = $(libdir)
> -libkms_la_LDFLAGS = -version-number 1:0:0 -no-undefined
> +libkms_la_LDFLAGS = -version-number 1:0:0 -no-undefined \
> +	-export-symbols-regex '^kms_'
>   libkms_la_LIBADD = ../libdrm.la
>   
>   #if HAVE_LIBUDEV
> diff --git a/nouveau/Makefile.am b/nouveau/Makefile.am
> index 206e892..257cab9 100644
> --- a/nouveau/Makefile.am
> +++ b/nouveau/Makefile.am
> @@ -8,7 +8,8 @@ AM_CFLAGS = \
>   
>   libdrm_nouveau_la_LTLIBRARIES = libdrm_nouveau.la
>   libdrm_nouveau_ladir = $(libdir)
> -libdrm_nouveau_la_LDFLAGS = -version-number 2:0:0 -no-undefined
> +libdrm_nouveau_la_LDFLAGS = -version-number 2:0:0 -no-undefined \
> +	-export-symbols-regex '^nouveau_'
>   libdrm_nouveau_la_LIBADD = ../libdrm.la @PTHREADSTUBS_LIBS@
>   
>   libdrm_nouveau_la_SOURCES = nouveau.c \
> diff --git a/omap/Makefile.am b/omap/Makefile.am
> index c77520b..bcbe98e 100644
> --- a/omap/Makefile.am
> +++ b/omap/Makefile.am
> @@ -7,7 +7,8 @@ AM_CFLAGS = \
>   
>   libdrm_omap_la_LTLIBRARIES = libdrm_omap.la
>   libdrm_omap_ladir = $(libdir)
> -libdrm_omap_la_LDFLAGS = -version-number 1:0:0 -no-undefined
> +libdrm_omap_la_LDFLAGS = -version-number 1:0:0 -no-undefined \
> +	-export-symbols-regex '^omap_'
>   libdrm_omap_la_LIBADD = ../libdrm.la @PTHREADSTUBS_LIBS@
>   
>   libdrm_omap_la_SOURCES = omap_drm.c
> diff --git a/radeon/Makefile.am b/radeon/Makefile.am
> index a8cd100..9fa19a8 100644
> --- a/radeon/Makefile.am
> +++ b/radeon/Makefile.am
> @@ -31,7 +31,8 @@ AM_CFLAGS = \
>   
>   libdrm_radeon_la_LTLIBRARIES = libdrm_radeon.la
>   libdrm_radeon_ladir = $(libdir)
> -libdrm_radeon_la_LDFLAGS = -version-number 1:0:1 -no-undefined
> +libdrm_radeon_la_LDFLAGS = -version-number 1:0:1 -no-undefined \
> +	-export-symbols-regex '^radeon_'
>   libdrm_radeon_la_LIBADD = ../libdrm.la @PTHREADSTUBS_LIBS@
>   
>   libdrm_radeon_la_SOURCES = \
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
