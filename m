From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: Re: Cannot compile nouveau.o in drm with kernel 2.6.26
Date: Sat, 19 Jul 2008 10:39:32 +0300
Message-ID: <20080719103932.7a35029e@ct200006>
References: <488133D7.7050808@signalpeak.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <488133D7.7050808-vVazHDhchvNCCzmm7wA0Mw@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Garnet MacPhee <garnet-vVazHDhchvNCCzmm7wA0Mw@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Fri, 18 Jul 2008 18:22:47 -0600
Garnet MacPhee <garnet-vVazHDhchvNCCzmm7wA0Mw@public.gmane.org> wrote:

> I am getting the following error when trying to compile nouveau.o in drm/linux-core on linux kernel 2.6.26. Drm itself 

By "Drm itself" I assume you are referring to libdrm.

> compiles and installs correctly. I am using the latest drm git. I cannot access bugzilla from the nouveau page because it says 
> it has an invalid security certificate.

IIRC it is just waiting for browsers to add cacert.org to trusted root
certificates, it should be fine to accept.

> root@default:~/drm/linux-core# make nouveau.o
> make DRM_MODULES=nouveau.o modules
> make[1]: Entering directory `/root/drm/linux-core'
> make -C /lib/modules/2.6.26/source  SUBDIRS=`pwd` DRMSRCDIR=`pwd` modules
> make[2]: Entering directory `/usr/src/linux-2.6.26'
>    CC [M]  /root/drm/linux-core/drm_auth.o
> In file included from include/linux/gfp.h:4,
>                   from include/linux/slab.h:12,
>                   from include/linux/percpu.h:5,
>                   from include/asm/local.h:4,
>                   from include/linux/module.h:19,
>                   from /root/drm/linux-core/drmP.h:44,
>                   from /root/drm/linux-core/drm_auth.c:36:
> include/linux/mmzone.h:18:26: error: linux/bounds.h: No such file or directory
> include/linux/mmzone.h:197:5: warning: "MAX_NR_ZONES" is not defined
> In file included from include/linux/gfp.h:4,
>                   from include/linux/slab.h:12,
>                   from include/linux/percpu.h:5,
>                   from include/asm/local.h:4,
>                   from include/linux/module.h:19,
>                   from /root/drm/linux-core/drmP.h:44,
>                   from /root/drm/linux-core/drm_auth.c:36:
> include/linux/mmzone.h:218: error: 'MAX_NR_ZONES' undeclared here (not in a function)
> In file included from include/asm/pci.h:4,
>                   from include/linux/pci.h:948,
>                   from /root/drm/linux-core/drmP.h:51,
>                   from /root/drm/linux-core/drm_auth.c:36:
> include/linux/mm.h:429:63: warning: "NR_PAGEFLAGS" is not defined

These look funny. Did you build your kernel from the same source tree
the DRM is using (/lib/modules/2.6.26/source)?
I haven't seen these errors before, but my first guess would be an
unconfigured or never-compiled kernel source tree. Hmm, yes, at least
include/linux/bounds.h is a build-time generated file.

If you are using a precompiled kernel image from your favourite
distribution, you might need to install also another package which allows
building custom kernel modules. This is distro specific.

-- 
Pekka Paalanen
http://www.iki.fi/pq/
