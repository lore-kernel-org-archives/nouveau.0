From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Cannot compile origin/for-airlied against kernel
 2.6.34
Date: Thu, 20 May 2010 07:57:14 +1000
Message-ID: <1274306234.3548.1.camel@nisroch>
References: <4BF42628.9020506@gmx.de>  <4BF42AE4.6050603@gmx.de>
Reply-To: skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <4BF42AE4.6050603-Mmb7MZpHnFY@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Johannes Obermayr <johannesobermayr-Mmb7MZpHnFY@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Wed, 2010-05-19 at 20:16 +0200, Johannes Obermayr wrote:
> Am 19.05.2010 19:55, schrieb Johannes Obermayr: 
> > Hi,
> > 
> > As summary says I cannot compile latest origin/for-airlied against
> > kernel 2.6.34 on openSUSE.
Why are you trying to even do this?  That branch is intended for airlied
to pull from when getting nouveau updates for the latest linux kernel
builds.

And yes, it won't build against 2.6.34 as some of the drm updates depend
on updates elsewhere in the kernel.

Ben.
> > 
> > My archive:
> > git archive origin/for-airlied drivers/gpu/ include/drm/
> > --prefix=drm-all/ | bzip2 >../drm-nouveau.tar.bz2
> > (So all necessary things should be in it ...)
> > 
> > If you need further information:
> > https://build.opensuse.org/package/show?package=drm-nouveau&project=home%3Ajobermayr
> > (I think the website is self-explaining ...)
> > 
> > Thanks.
> > Johannes
> > 
> > CC [M]  /usr/src/packages/BUILD/drm-all-20100519/drm-all/obj/default/drm/drm_edid.o
> > /usr/src/packages/BUILD/drm-all-20100519/drm-all/obj/default/drm/drm_edid.c:215: error: conflicting types for 'drm_do_probe_ddc_edid'
> > /usr/src/linux-2.6.34-34/include/drm/drm_crtc.h:669: note: previous declaration of 'drm_do_probe_ddc_edid' was here
> > /usr/src/packages/BUILD/drm-all-20100519/drm-all/obj/default/drm/drm_edid.c: In function 'drm_mode_std':
> > /usr/src/packages/BUILD/drm-all-20100519/drm-all/obj/default/drm/drm_edid.c:889: error: implicit declaration of function 'drm_gtf_mode_complex'
> > /usr/src/packages/BUILD/drm-all-20100519/drm-all/obj/default/drm/drm_edid.c:894: warning: assignment makes pointer from integer without a cast
> > make[4]: *** [/usr/src/packages/BUILD/drm-all-20100519/drm-all/obj/default/drm/drm_edid.o] Error 1
> > make[3]: *** [/usr/src/packages/BUILD/drm-all-20100519/drm-all/obj/default/drm] Error 2
> > make[2]: *** [_module_/usr/src/packages/BUILD/drm-all-20100519/drm-all/obj/default] Error 2
> > make[1]: *** [sub-make] Error 2
> > make: *** [all] Error 2
> > make: Leaving directory `/usr/src/linux-2.6.34-34-obj/i386/default'
> > 
> I could fix above build failure - it was a wrong includedir (sorry).
> But now I have this error:
> 
> CC [M]  /usr/src/packages/BUILD/drm-nouveau-20100519/drm-all/obj/default/drm/i915/intel_fb.o
> /usr/src/packages/BUILD/drm-nouveau-20100519/drm-all/obj/default/drm/i915/intel_fb.c: In function 'intelfb_create':
> /usr/src/packages/BUILD/drm-nouveau-20100519/drm-all/obj/default/drm/i915/intel_fb.c:131: error: 'struct fb_info' has no member named 'apertures'
> /usr/src/packages/BUILD/drm-nouveau-20100519/drm-all/obj/default/drm/i915/intel_fb.c:131: error: implicit declaration of function 'alloc_apertures'
> /usr/src/packages/BUILD/drm-nouveau-20100519/drm-all/obj/default/drm/i915/intel_fb.c:132: error: 'struct fb_info' has no member named 'apertures'
> /usr/src/packages/BUILD/drm-nouveau-20100519/drm-all/obj/default/drm/i915/intel_fb.c:136: error: 'struct fb_info' has no member named 'apertures'
> /usr/src/packages/BUILD/drm-nouveau-20100519/drm-all/obj/default/drm/i915/intel_fb.c:138: error: 'struct fb_info' has no member named 'apertures'
> /usr/src/packages/BUILD/drm-nouveau-20100519/drm-all/obj/default/drm/i915/intel_fb.c:140: error: 'struct fb_info' has no member named 'apertures'
> make[5]: *** [/usr/src/packages/BUILD/drm-nouveau-20100519/drm-all/obj/default/drm/i915/intel_fb.o] Error 1
> make[4]: *** [/usr/src/packages/BUILD/drm-nouveau-20100519/drm-all/obj/default/drm/i915] Error 2
> make[3]: *** [/usr/src/packages/BUILD/drm-nouveau-20100519/drm-all/obj/default/drm] Error 2
> make[2]: *** [_module_/usr/src/packages/BUILD/drm-nouveau-20100519/drm-all/obj/default] Error 2
> make[1]: *** [sub-make] Error 2
> make: *** [all] Error 2
> make: Leaving directory `/usr/src/linux-2.6.34-34-obj/i386/default'
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
