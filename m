From: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: nouveau interrupts firewire ISO streaming
Date: Tue, 2 Feb 2010 14:35:04 +0100
Message-ID: <6d4bc9fc1002020535m37223f74o60d081a85990586e@mail.gmail.com>
References: <20100202131549.GI9700@ltw.loris.tv>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20100202131549.GI9700-hmr3i4qI1nLZbNGZteT6vg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Adrian Knoth <adi-5gjw4BGRu82yAo/rNOIehoJPQCENF9+z@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Tue, Feb 2, 2010 at 2:15 PM, Adrian Knoth <adi-5gjw4BGRu82yAo/rNOIehoJPQCENF9+z@public.gmane.org> wr=
ote:
> Hi!
>
> After switching from UMS (dated 20090701+c0bf670) to KMS (as of
> 2010-02-01), almost any X activity causes buffer underruns on my
> firewire soundcard.
>
> When the X pointer changes from arrow to the vertical text selection
> bar, firewire streaming is interrupted. Same with scrolling in firefox
> or hovering over a link, thus changing the pointer to "hand".
>
> Looks like nouveau is disabling interrupts now and then, which leads to
> stalled firewire ISO streaming. I don't know what nouveau's actually
> doing, I'm just guessing. ;)

I don't think interrupts are disabled for uploading a cursor, more
likely is that your firewire driver depends on the big kernel lock. At
the moment we still hold that. That said, i don't think nouveau can
make any kind of latency garuantees. We do intend to go to a design
that doesn't rely on the BKL at some point, but i wouldn't expect that
to happen this month.

>
> Firewire audio streaming (www.ffado.org) requires precisely timed DMA
> transfers. If the kernel/controller/scheduler fails to deliver those
> packets in time, e.g. =A0due to a ressource with high interrupt load, the
> audio stream is interrupted and you get audible glitches.
>
> I see this behaviour on
>
> 06:00.0 VGA compatible controller: nVidia Corporation G71 [GeForce 7300
> GS] (rev a1)
>
> with Dual-Head (VGA+DVI).
>
>
> I've also uploaded kern.log and Xorg log, though I guess they're not
> really helpful to trace this problem:
>
> =A0 http://adi.loris.tv/nouveau-xorg.log
>
> =A0 http://adi.loris.tv/nouveau-kern.log
>
> Note that kern.log also includes an Oops at Feb =A01 20:22:43, but I'm not
> really reporting this issue here. ;) (I rmmod'ed nouveau remotely)
>
>
>
> Cheerio
>
>
>
> PS: I (sometimes) have two mouse cursors. My screen layout is
>
> =A0 =A0 xrandr --output DVI-I-1 --right-of VGA-1
>
> and when moving the mouse from the left screen to the right, a static
> (not moving) cursor stays on the left screen. It changes its appearance
> simultaneously with the real (moving) cursor on the right screen, that
> is, if the right pointer is a hand, the left pointer also becomes a
> hand, a.s.o.
>
> Moving the mouse back to the left screen re-activates movement of the
> left cursor and no additional cursor is left on the right screen.
>
> But I'm not reporting this issue here, the firewire stuff is more
> important.
>
>
> PPS: If you prefer Bugzilla, I can re-report there. I just started with
> the mailinglist in case the ISO streaming requires some extended
> discussion.
>
> --
> mail: adi-KgVc3FjDepk@public.gmane.org =A0 =A0 =A0 http://adi.thur.de =A0 =A0 =A0PGP/GPG: key =
via keyserver
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
>
