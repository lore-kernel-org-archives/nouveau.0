From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: Request for help in adding a HDMI output
Date: Fri, 22 Jan 2021 13:26:24 -0500
Message-ID: <CAKb7Uvh3UOKQ14MQwoDti0Lvsey5oLM4qk_GLze3s9qBFq+19Q@mail.gmail.com>
References: <CAPpdf5-SoO4qPKg7WuvRsCMT4RGV34gNp+M0ir27a1E8Qu+s4g@mail.gmail.com>
 <CAKb7UvjfPptmKDm_jma90Q0T+JoTmETL-Y0-KzTbv9z7f=ccoA@mail.gmail.com>
 <CAPpdf59jfbS4dhRJ5kvhri7LwJL4UNEyL8rssG+qOcu7G1ZkQg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAPpdf59jfbS4dhRJ5kvhri7LwJL4UNEyL8rssG+qOcu7G1ZkQg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: o1bigtenor <o1bigtenor-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Fri, Jan 22, 2021 at 12:12 PM o1bigtenor <o1bigtenor-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
> On Fri, Jan 22, 2021 at 8:30 AM Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> wrote:
> >
> > On Thu, Jan 21, 2021 at 9:59 PM o1bigtenor <o1bigtenor-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > >
> > > Greetings
> > >
> > > Running a debian testing system
> > > $ uname -r
> > > 5.4.0-4-amd64
> > > with 2 graphics cards.
> > > The one I'm working on is a: GP 107 Nvidia  GTX 1050 Ti
> > >
> > > Asus ROG GeForce GX 1050 Ti Strix-GTX1050 Ti with 2 - DVI plus 1 DP1.4
> > > and I HDMI2.0 ports (four in total).
> > >
> > > I have been running 2 1920x1080 monitors on this card (and its
> > > previous nvidia 570) for quite some time. Been running nouveau for the
> > > last about 4 years as my last nvidia 570 (started with 3) is EOL by
> > > nvidia.
>
> > Cheers,
> >
> >   -ilia
> > > Have gotten quite comfortable using xrandr setting up the second card
> > > (the nvidia 570) and its 2 monitors. Nouveau software is:
> > > xserver-xorg-video-nouveau -> 1:1.0.16-1 ;
> > > xserver-xorg -> 1:7.7+21 ; and libdrm-nouveau2:amd64 -> 2.4.102-1 .
> > >
> > > I want to add a 4k TV onto the HDMI port on card #1.
> > > Can't seem to get the card and the TV talking.
> >
> > Unfortunately my initial attempt at supporting >340mhz modelines over
> > HDMI was incomplete -- worked in my own testing, but not for everyone.
> > (You need 597mhz to get 4k@60.)
>
> $ cvt 3840 2160
> # 3840x2160 59.98 Hz (CVT 8.29M9) hsync: 134.18 kHz; pclk: 712.75 MHz
> Modeline "3840x2160_60.00"  712.75  3840 4160 4576 5312  2160 2163
> 2168 2237 -hsync +vsync

That just plain won't work. HDMI 2.0 maxes out at 600mhz, whereas
you're giving it a 712mhz modeline. You're trying to be too clever.
This stuff should just work out of the box.

What happens if you use a 5.8 or later kernel and don't do any of
this? You should just be able to do like xrandr --output HDMI-1-2
--auto. But having a 4k display on a secondary GPU is not a great idea
-- I'd flip it around, make the GTX 1050 the primary.

Can you provide the output of "xrandr --verbose" before you've messed
around with anything like modelines/etc?

Thanks,

  -ilia
