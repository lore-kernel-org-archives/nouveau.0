From: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Subject: Re: 2.6.33 vs. NVIDIA GForce GT 220
Date: Tue, 26 Jan 2010 10:47:40 +0100
Message-ID: <20100126094740.GC10858@atrey.karlin.mff.cuni.cz>
References: <20100112134335.GA21783@atrey.karlin.mff.cuni.cz>
	<20100123181817.GA2909@joi.lan>
	<201001231828.00557.koriakin@0x04.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <201001231828.00557.koriakin-mP9o5jsk0RY@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Marcin Ko?cielnicki <koriakin-mP9o5jsk0RY@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Hi!

> > > I tried enabling staging nvidia driver on GT220, but apparently driver
> > > does not know about it. Unfortunately, I have one of those cards here.
> > >
> > > (I wonder... is there better mailing list? MAINTAINERS only lists
> > > linux-fbdev....)
> 
> The list is nouveau-PD4FTy7X32lNgt0PjOBp9xlNPtJONSTn@public.gmane.org And driver knows about GT220 just 
> fine, I've been using it for a month or two on GT220 already. Don't
> bother 

Perhaps nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org should be added to MAINTAINERS?

> about the "supported cards" lists in xf86-video-nouveau or wherever else, the 
> driver will happily bind to any nvidia video card with known generation, even 
> if nobody has seen that precise model before.

Unfortunately, the driver does not seem happy:

Jan 18 12:56:38 pma kernel: [    0.491073] nvidiafb 0000:01:00.0: PCI
INT A -> GSI 16 (level, low) -> IRQ 16
Jan 18 12:56:38 pma kernel: [    0.491507] nvidiafb: Device ID:
10de0a20 
Jan 18 12:56:38 pma kernel: [    0.491546] Chipset is 10de0a20
Jan 18 12:56:38 pma kernel: [    0.491584] nvidiafb: unknown NV_ARCH
Jan 18 12:56:38 pma kernel: [    0.492119] vga16fb: initializing


> One thing that could happen, however, is missing ctxprog for your chipset. In 
> this case, you'll be stuck with non-accelerated nouveau until somebody 
> extracts the ctxprog from blob mmiotrace on your card -- come to freenode.net 
> IRC channel #nouveau if you need help with that. However, that shouldn't 
> happen, since the GT220 chipset is already supported.

I don't really need 3D acceleration, I'd just like to use whole size
of screen... (and found out how to do that even now, after X update
with vesa driver).
									Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
