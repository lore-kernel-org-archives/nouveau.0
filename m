From: =?iso-8859-1?Q?Edgar_Fu=DF?= <ef-o02PS0xoJP/q4qjOmvqfQQ@public.gmane.org>
Subject: Re: TDMS bandwidth limits
Date: Mon, 7 Feb 2011 12:57:48 +0100
Message-ID: <B6BAA649-2D35-4374-B7F6-568B5B749E47@math.uni-bonn.de>
References: <DE8B09DD-4ACE-499A-A33C-C12C005803F0@math.uni-bonn.de>
	<87k4hg4x0b.fsf@riseup.net>
Mime-Version: 1.0 (Apple Message framework v1082)
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <87k4hg4x0b.fsf-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

So my problem continues.

> They're based on what the nvidia proprietary driver itself refuses to do,
I see, thanks.

> though, I'm not 100% sure that I had nv44 in my sample when I made that change.
Looks like it limits to 155M in the nv44 case too, so your change is totally correct.

> It might be using a reduced-blanking mode,
Indeed it does, thanks. I had ruled out this too early as highly improbable.

> check your Xorg.0.log to be sure. See the "-logverbose" option if you don't
> get all the timings printed out with the default verbosity level.
It does tell at least on level 9, thanks.

However, what it doesn't tell is the timing actually used. Anyone more familiar with the relevant reverse engineering methods (MmioTrace or whatever) to find out?

The other problem is that nouveaufb doesn't (like matroxfb) provide a method of specifying the exact timing to use (and I would presumably need it in order not to change between FB console and X11).

One would come to think that video=1600x1200RM would result in a reduced-blanking mode, but drm.debug=7 shows it actually does not.
Reading the source of drm_fb_helper.c reveals that it's almost impossible to achieve rb=1.

Any chance of implementing implicit reduced blanking in nouveau? If someone could hint me at where to architecturally correctly put it in I will be happy to start implementing it myself.

I'm afraid more people than me will run into this and will regard the (absolutely plausible) TDMS bandwidth limiting as a regression ("Help! Help! My 1600x1200 used to work, but now it's broken!") when there's no reduced-blanking workaround.
