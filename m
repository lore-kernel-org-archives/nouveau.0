From: Edgar =?iso-8859-1?B?RnXf?= <ef-o02PS0xoJP/q4qjOmvqfQQ@public.gmane.org>
Subject: Re: TDMS bandwidth limits
Date: Mon, 7 Feb 2011 15:51:15 +0100
Message-ID: <20110207145115.GV26554@gumme.math.uni-bonn.de>
References: <DE8B09DD-4ACE-499A-A33C-C12C005803F0@math.uni-bonn.de>
	<87k4hg4x0b.fsf@riseup.net>
	<B6BAA649-2D35-4374-B7F6-568B5B749E47@math.uni-bonn.de>
	<87pqr4vxnf.fsf@riseup.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <87pqr4vxnf.fsf-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
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

> A register dump [1] would be the easiest way to find out the exact timings,
OK, I'll ask a colleague to give this a try. The problem is to set up a machine that both runs the proprietary driver and a recent enough Debian to have libpciaccess available.

> but any standard 1600x1200 reduced-blanking mode should do it.
Yes, but having the exact same timings on the FB console and X11 results a smoother switch between the two modes.

> You could just use the same CVT reduced-blanking mode on both X and the
> framebuffer console.
Sorry for the apperantly dumb question, but how do tell X to use the CVT mode?

> Well, that works for me, can I have a look at your kernel logs?
Hm. I tried to reproduce the problem I faced on friday, but it disappeared. Now I get the "reduced blanking" message in the drm_fb_helper_connector_parse_command_line debug output. Strange.

Now I tried to give the modeline the drm debug output to xorg.conf, but it doesn't pick it up. I must be doing something stupidly wrong again:

[...]
Section "Monitor"
	Identifier	"Bildschirm"
	Option		"DPMS"
	ModeLine	"reduced"	130 1600 1648 1680 1760 1200 1203 1207 1235
EndSection

Section "Screen"
[...]
	Monitor		"Bildschirm"
	DefaultDepth	24
	SubSection	"Display"
		Depth	24
		Virtual	1600 1200
		Modes	"reduced"
	EndSubSection
EndSection

Section "ServerLayout"
	Identifier	"Server"
	Screen		"Schrirm"
[...]
EndSection
