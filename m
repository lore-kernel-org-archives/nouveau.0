From: Garnet MacPhee <garnet-vVazHDhchvNCCzmm7wA0Mw@public.gmane.org>
Subject: Re: Cannot compile nouveau.o in drm with kernel 2.6.26
Date: Sat, 19 Jul 2008 05:42:41 -0600
Message-ID: <4881D331.3070901@signalpeak.net>
References: <488133D7.7050808@signalpeak.net>
	<20080719103932.7a35029e@ct200006>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20080719103932.7a35029e@ct200006>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Pekka Paalanen wrote:
> On Fri, 18 Jul 2008 18:22:47 -0600
> Garnet MacPhee <garnet-vVazHDhchvNCCzmm7wA0Mw@public.gmane.org> wrote:
> 
>> I am getting the following error when trying to compile nouveau.o in drm/linux-core on linux kernel 2.6.26. Drm itself 
> 
> By "Drm itself" I assume you are referring to libdrm.

Yes, thats right.
> 
> 
>> root@default:~/drm/linux-core# make nouveau.o
>> make DRM_MODULES=nouveau.o modules
>> make[1]: Entering directory `/root/drm/linux-core'
>> make -C /lib/modules/2.6.26/source  SUBDIRS=`pwd` DRMSRCDIR=`pwd` modules
>> make[2]: Entering directory `/usr/src/linux-2.6.26'
>>    CC [M]  /root/drm/linux-core/drm_auth.o
>> In file included from include/linux/gfp.h:4,
>>                   from include/linux/slab.h:12,
>>                   from include/linux/percpu.h:5,
>>                   from include/asm/local.h:4,
>>                   from include/linux/module.h:19,
>>                   from /root/drm/linux-core/drmP.h:44,
>>                   from /root/drm/linux-core/drm_auth.c:36:
>> include/linux/mmzone.h:18:26: error: linux/bounds.h: No such file or directory
>> include/linux/mmzone.h:197:5: warning: "MAX_NR_ZONES" is not defined
>> In file included from include/linux/gfp.h:4,
>>                   from include/linux/slab.h:12,
>>                   from include/linux/percpu.h:5,
>>                   from include/asm/local.h:4,
>>                   from include/linux/module.h:19,
>>                   from /root/drm/linux-core/drmP.h:44,
>>                   from /root/drm/linux-core/drm_auth.c:36:
>> include/linux/mmzone.h:218: error: 'MAX_NR_ZONES' undeclared here (not in a function)
>> In file included from include/asm/pci.h:4,
>>                   from include/linux/pci.h:948,
>>                   from /root/drm/linux-core/drmP.h:51,
>>                   from /root/drm/linux-core/drm_auth.c:36:
>> include/linux/mm.h:429:63: warning: "NR_PAGEFLAGS" is not defined
> 
> These look funny. Did you build your kernel from the same source tree
> the DRM is using (/lib/modules/2.6.26/source)?

Yes, /lib/modules/2.6.26/source is actually a pointer, and it points to /usr/src/linux-2.6.26 just like it should.

> I haven't seen these errors before, but my first guess would be an
> unconfigured or never-compiled kernel source tree. Hmm, yes, at least
> include/linux/bounds.h is a build-time generated file.
> 
> If you are using a precompiled kernel image from your favourite
> distribution, you might need to install also another package which allows
> building custom kernel modules. This is distro specific.
> 
I am running Slackware 12.1, and I compile my own custom kernel, I do not use the precompiled ones (they are 2.6.24 vintage). 
The kernel has indeed been compiled, and I can run X using the nv driver.

Also, the same drm git will build correctly with kernel 2.6.25.
