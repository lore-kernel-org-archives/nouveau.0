From: Adrian Knoth <adi-5gjw4BGRu82yAo/rNOIehoJPQCENF9+z@public.gmane.org>
Subject: nouveau interrupts firewire ISO streaming
Date: Tue, 2 Feb 2010 14:15:49 +0100
Message-ID: <20100202131549.GI9700@ltw.loris.tv>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Hi!

After switching from UMS (dated 20090701+c0bf670) to KMS (as of
2010-02-01), almost any X activity causes buffer underruns on my
firewire soundcard.

When the X pointer changes from arrow to the vertical text selection
bar, firewire streaming is interrupted. Same with scrolling in firefox
or hovering over a link, thus changing the pointer to "hand".

Looks like nouveau is disabling interrupts now and then, which leads to
stalled firewire ISO streaming. I don't know what nouveau's actually
doing, I'm just guessing. ;) 

Firewire audio streaming (www.ffado.org) requires precisely timed DMA
transfers. If the kernel/controller/scheduler fails to deliver those
packets in time, e.g.  due to a ressource with high interrupt load, the
audio stream is interrupted and you get audible glitches.

I see this behaviour on 

06:00.0 VGA compatible controller: nVidia Corporation G71 [GeForce 7300
GS] (rev a1)

with Dual-Head (VGA+DVI).


I've also uploaded kern.log and Xorg log, though I guess they're not
really helpful to trace this problem:

   http://adi.loris.tv/nouveau-xorg.log

   http://adi.loris.tv/nouveau-kern.log

Note that kern.log also includes an Oops at Feb  1 20:22:43, but I'm not
really reporting this issue here. ;) (I rmmod'ed nouveau remotely)



Cheerio



PS: I (sometimes) have two mouse cursors. My screen layout is 

     xrandr --output DVI-I-1 --right-of VGA-1

and when moving the mouse from the left screen to the right, a static
(not moving) cursor stays on the left screen. It changes its appearance
simultaneously with the real (moving) cursor on the right screen, that
is, if the right pointer is a hand, the left pointer also becomes a
hand, a.s.o.

Moving the mouse back to the left screen re-activates movement of the
left cursor and no additional cursor is left on the right screen.

But I'm not reporting this issue here, the firewire stuff is more
important.


PPS: If you prefer Bugzilla, I can re-report there. I just started with
the mailinglist in case the ISO streaming requires some extended
discussion.

-- 
mail: adi-KgVc3FjDepk@public.gmane.org  	http://adi.thur.de	PGP/GPG: key via keyserver
