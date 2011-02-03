From: Dzianis Kahanovich <mahatma-jC57FVqSskN9IU3jSFkzTg@public.gmane.org>
Subject: Re: nv4c broken after october (approx.)
Date: Thu, 03 Feb 2011 21:26:34 +0200
Message-ID: <4D4B016A.2040704@bspu.unibel.by>
References: <4D499444.20009@bspu.unibel.by>
	<AANLkTi=Ts_vC9BP6YTqNWn93zpFTTwZCbs3__-TyHbSR@mail.gmail.com>
Reply-To: mahatma-cw37gHAUgAY@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <AANLkTi=Ts_vC9BP6YTqNWn93zpFTTwZCbs3__-TyHbSR-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Xavier Chantry <chantry.xavier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Xavier Chantry wrote:

>> After october I got broken image on my integrated nv4c chip (are you need
>> precise model?). I don't know precise time points, but now known: in Gentoo
...
> This is the third report I see today.. for a patch 3-4 months old. At
> least according to wilder on IRC.
> 
> http://cgit.freedesktop.org/nouveau/xf86-video-nouveau/commit/?id=c88f13e25b0040c1dd0f93e0ac40f62a6005ce59

Thanx! I reverse this patch and return to accelerated...

> 17:44   curro >> wilder: do you get the same corruption with a
> 1024x768 framebuffer?
> 
> So what's your resolution and can you try to force 1024x768, as
> explained there :
> http://nouveau.freedesktop.org/wiki/KernelModeSetting

Not so trivial, becouse fb.ko (fbmem.c) module not listen for cmdline. But I use
harcoded into drm_fb_helper.c (this is faster then full rebuild to integrate
fb.ko). So, all combinations pairs - fb 1024x768,1280x1024 and xorg.conf
1024x768,1280x1024 make same corruption without patch rollback.

-- 
WBR, Dzianis Kahanovich AKA Denis Kaganovich, http://mahatma.bspu.unibel.by/
