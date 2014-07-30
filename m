From: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] libdrm: hide all private symbols
Date: Wed, 30 Jul 2014 13:35:25 +0100
Message-ID: <53D8E68D.3090503@gmail.com>
References: <53D8BCF8.9020908@canonical.com> <53D8C5F7.6040908@vodafone.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <53D8C5F7.6040908-ANTagKRnAhcb1SvskN2V4Q@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: =?windows-1252?Q?Christian_K=F6nig?= <deathsimple-ANTagKRnAhcb1SvskN2V4Q@public.gmane.org>, Maarten Lankhorst <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Julien Cristau <jcristau-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On 30/07/14 11:16, Christian K=F6nig wrote:
> [CCing Emil as well]
> =

> Am 30.07.2014 um 11:38 schrieb Maarten Lankhorst:
>> Using -export-symbols-regex all private symbols are hidden, resulting in=
 the
>> following changes:
> =

> Wasn't "-export-symbols-regex" exactly that stuff we are trying to avoid =
in mesa?
> =

IMHO we should try to pick up Thierry visibility patches, as these are the
best solution + BSD's ld lacks version-script support. Then use a
version-script over export-symbols-regex, as the latter messes up local
symbols apart from the exported ones.

-Emil

> Christian.
> =

>>
>> libkms: removes all driver specific exports
>> radeon: removes the bof_* exports
>> nouveau: removes the abi16_* exports
>> freedreno: remove the *kgsl_* and msm_* exports
>> intel: removes the drm_mm* exports
>> omap/exynos: unchanged as far as I can tell
>>   Signed-off-by: Maarten Lankhorst <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
>> ---
>>
>> diff --git a/exynos/Makefile.am b/exynos/Makefile.am
>> index 0a2663a..0cd753d 100644
>> --- a/exynos/Makefile.am
>> +++ b/exynos/Makefile.am
>> @@ -7,7 +7,8 @@ AM_CFLAGS =3D \
>>     libdrm_exynos_la_LTLIBRARIES =3D libdrm_exynos.la
>>   libdrm_exynos_ladir =3D $(libdir)
>> -libdrm_exynos_la_LDFLAGS =3D -version-number 1:0:0 -no-undefined
>> +libdrm_exynos_la_LDFLAGS =3D -version-number 1:0:0 -no-undefined \
>> +    -export-symbols-regex '^(exynos|g2d)_'
>>   libdrm_exynos_la_LIBADD =3D ../libdrm.la @PTHREADSTUBS_LIBS@
>>     libdrm_exynos_la_SOURCES =3D \
>> diff --git a/freedreno/Makefile.am b/freedreno/Makefile.am
>> index 7903e5b..5fdee22 100644
>> --- a/freedreno/Makefile.am
>> +++ b/freedreno/Makefile.am
>> @@ -9,7 +9,8 @@ AM_CFLAGS =3D \
>>     libdrm_freedreno_la_LTLIBRARIES =3D libdrm_freedreno.la
>>   libdrm_freedreno_ladir =3D $(libdir)
>> -libdrm_freedreno_la_LDFLAGS =3D -version-number 1:0:0 -no-undefined
>> +libdrm_freedreno_la_LDFLAGS =3D -version-number 1:0:0 -no-undefined \
>> +    -export-symbols-regex '^fd_'
>>   libdrm_freedreno_la_LIBADD =3D ../libdrm.la @PTHREADSTUBS_LIBS@
>>     libdrm_freedreno_la_SOURCES =3D \
>> diff --git a/intel/Makefile.am b/intel/Makefile.am
>> index f49b099..2b9ee48 100644
>> --- a/intel/Makefile.am
>> +++ b/intel/Makefile.am
>> @@ -33,7 +33,8 @@ AM_CFLAGS =3D \
>>     libdrm_intel_la_LTLIBRARIES =3D libdrm_intel.la
>>   libdrm_intel_ladir =3D $(libdir)
>> -libdrm_intel_la_LDFLAGS =3D -version-number 1:0:0 -no-undefined
>> +libdrm_intel_la_LDFLAGS =3D -version-number 1:0:0 -no-undefined \
>> +    -export-symbols-regex '^drm_intel_'
>>   libdrm_intel_la_LIBADD =3D ../libdrm.la \
>>       @PTHREADSTUBS_LIBS@ \
>>       @PCIACCESS_LIBS@ \
>> diff --git a/libkms/Makefile.am b/libkms/Makefile.am
>> index 449a73b..e3c727a 100644
>> --- a/libkms/Makefile.am
>> +++ b/libkms/Makefile.am
>> @@ -5,7 +5,8 @@ AM_CFLAGS =3D \
>>     libkms_la_LTLIBRARIES =3D libkms.la
>>   libkms_ladir =3D $(libdir)
>> -libkms_la_LDFLAGS =3D -version-number 1:0:0 -no-undefined
>> +libkms_la_LDFLAGS =3D -version-number 1:0:0 -no-undefined \
>> +    -export-symbols-regex '^kms_'
>>   libkms_la_LIBADD =3D ../libdrm.la
>>     #if HAVE_LIBUDEV
>> diff --git a/nouveau/Makefile.am b/nouveau/Makefile.am
>> index 206e892..257cab9 100644
>> --- a/nouveau/Makefile.am
>> +++ b/nouveau/Makefile.am
>> @@ -8,7 +8,8 @@ AM_CFLAGS =3D \
>>     libdrm_nouveau_la_LTLIBRARIES =3D libdrm_nouveau.la
>>   libdrm_nouveau_ladir =3D $(libdir)
>> -libdrm_nouveau_la_LDFLAGS =3D -version-number 2:0:0 -no-undefined
>> +libdrm_nouveau_la_LDFLAGS =3D -version-number 2:0:0 -no-undefined \
>> +    -export-symbols-regex '^nouveau_'
>>   libdrm_nouveau_la_LIBADD =3D ../libdrm.la @PTHREADSTUBS_LIBS@
>>     libdrm_nouveau_la_SOURCES =3D nouveau.c \
>> diff --git a/omap/Makefile.am b/omap/Makefile.am
>> index c77520b..bcbe98e 100644
>> --- a/omap/Makefile.am
>> +++ b/omap/Makefile.am
>> @@ -7,7 +7,8 @@ AM_CFLAGS =3D \
>>     libdrm_omap_la_LTLIBRARIES =3D libdrm_omap.la
>>   libdrm_omap_ladir =3D $(libdir)
>> -libdrm_omap_la_LDFLAGS =3D -version-number 1:0:0 -no-undefined
>> +libdrm_omap_la_LDFLAGS =3D -version-number 1:0:0 -no-undefined \
>> +    -export-symbols-regex '^omap_'
>>   libdrm_omap_la_LIBADD =3D ../libdrm.la @PTHREADSTUBS_LIBS@
>>     libdrm_omap_la_SOURCES =3D omap_drm.c
>> diff --git a/radeon/Makefile.am b/radeon/Makefile.am
>> index a8cd100..9fa19a8 100644
>> --- a/radeon/Makefile.am
>> +++ b/radeon/Makefile.am
>> @@ -31,7 +31,8 @@ AM_CFLAGS =3D \
>>     libdrm_radeon_la_LTLIBRARIES =3D libdrm_radeon.la
>>   libdrm_radeon_ladir =3D $(libdir)
>> -libdrm_radeon_la_LDFLAGS =3D -version-number 1:0:1 -no-undefined
>> +libdrm_radeon_la_LDFLAGS =3D -version-number 1:0:1 -no-undefined \
>> +    -export-symbols-regex '^radeon_'
>>   libdrm_radeon_la_LIBADD =3D ../libdrm.la @PTHREADSTUBS_LIBS@
>>     libdrm_radeon_la_SOURCES =3D \
>>
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
>> http://lists.freedesktop.org/mailman/listinfo/dri-devel
> =
