From: Bernhard Kaindl <bk-l3A5Bk7waGM@public.gmane.org>
Subject: Re: Xvideo blitter with randr12 enabled
Date: Wed, 5 Sep 2007 18:49:03 +0200 (CEST)
Message-ID: <alpine.LNX.0.9999-openSUSE-5.0709051841520.24186@jbgna.fhfr.qr>
References: <alpine.LNX.0.999-openSUSE-1.0709031945560.22918@jbgna.fhfr.qr>
	<20070904211539.b46ae32d.arthur.huillet@free.fr>
	<alpine.LNX.0.999-openSUSE-1.0709042248510.8889@jbgna.fhfr.qr>
	<20070904231611.9363b0d0.arthur.huillet@free.fr>
	<alpine.LNX.0.999-openSUSE-1.0709042333450.19641@jbgna.fhfr.qr>
	<alpine.LNX.0.999-openSUSE-1.0709050114480.25400@jbgna.fhfr.qr>
	<alpine.LNX.0.999-openSUSE-1.0709050142010.25400@jbgna.fhfr.qr>
	<alpine.LNX.0.999-openSUSE-1.0709050203240.25400@jbgna.fhfr.qr>
	<20070905024520.d5c28cb8.arthur.huillet@free.fr>
	<alpine.LNX.0.999-openSUSE-1.0709050256200.25400@jbgna.fhfr.qr>
	<20070905032343.c6b0989e.arthur.huillet@free.fr>
	<alpine.LNX.0.999-openSUSE-1.0709050352050.29379@jbgna.fhfr.qr>
	<20070905115247.91d1ad03.arthur.huillet@free.fr>
	<alpine.LNX.0.999-openSUSE-1.0709051212550.21447@jbgna.fhfr.qr>
	<20070905171148.996b0c44.arthur.huillet@free.fr>
	<alpine.LNX.0.9999-openSUSE-5.0709051715010.24186@jbgna.fhfr.qr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <alpine.LNX.0.9999-openSUSE-5.0709051715010.24186-aORvohZ8rX8NvFgr0RP9cw@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Arthur Huillet <arthur.huillet-GANU6spQydw@public.gmane.org>
List-Id: nouveau.vger.kernel.org

> PS: DPMS also does not bring the display back when I after I have put
> the mointors side by side with xrandr. For me this DPMS issue could
> be easyer to debug, I hope, but first I would like to get the console
> switch working as it should and as I had it with my patch to the randr
> branch.

I can trick mplayer with Xv to work now side-by-side by doing chvt 1 and
chvt7 (with the chvt fix which I just sent) before starting using mplayer.
I slight guess that this is might be related to the DPMS fix/hack with
last_mode which I sent initially because DPMS also works again after a
VC switch when the monitors are side-by-side. I guess that last_mode might
be wrongly set in that case, will check.

--
Bernhard Kaindl
