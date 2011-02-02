From: Xavier Chantry <chantry.xavier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: nv4c broken after october (approx.)
Date: Wed, 2 Feb 2011 23:38:06 +0100
Message-ID: <AANLkTi=Ts_vC9BP6YTqNWn93zpFTTwZCbs3__-TyHbSR@mail.gmail.com>
References: <4D499444.20009@bspu.unibel.by>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <4D499444.20009-jC57FVqSskN9IU3jSFkzTg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: mahatma-cw37gHAUgAY@public.gmane.org
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Wed, Feb 2, 2011 at 6:28 PM, Dzianis Kahanovich
<mahatma-jC57FVqSskN9IU3jSFkzTg@public.gmane.org> wrote:
> After october I got broken image on my integrated nv4c chip (are you need
> precise model?). I don't know precise time points, but now known: in Gentoo
> portage still 20101010 - good, 20101130 - bad (but I use git version before
> problems and now - without acceleration/with shadowfb). If I set 32M VRAM -
> image is semi-broken. I may to do some testings (like testing git by day or try
> to trace registers), but in first point IMHO this minimal info may help to
> developers too.
>
> Last actions was: installing current kernel (2.6.38-rc2-git8), known
> nouveau-firmware and current driver & libdrm snapshots.
>
> This is my screen: http://mahatma.bspu.unibel.by/IMG0035A.jpg
> (default it was green MJ leafs on background, terminal window and panel on top)
>
> PS Even if you omit support of old chips, this is looks semi-working but memory
> misorganized and in theory still possible to fix. Or no?
>

This is the third report I see today.. for a patch 3-4 months old. At
least according to wilder on IRC.

http://cgit.freedesktop.org/nouveau/xf86-video-nouveau/commit/?id=c88f13e25b0040c1dd0f93e0ac40f62a6005ce59

17:44   curro >> wilder: do you get the same corruption with a
1024x768 framebuffer?

So what's your resolution and can you try to force 1024x768, as
explained there :
http://nouveau.freedesktop.org/wiki/KernelModeSetting
