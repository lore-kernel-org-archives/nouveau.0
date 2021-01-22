From: o1bigtenor <o1bigtenor-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Request for help in adding a HDMI output
Date: Fri, 22 Jan 2021 11:11:26 -0600
Message-ID: <CAPpdf59jfbS4dhRJ5kvhri7LwJL4UNEyL8rssG+qOcu7G1ZkQg@mail.gmail.com>
References: <CAPpdf5-SoO4qPKg7WuvRsCMT4RGV34gNp+M0ir27a1E8Qu+s4g@mail.gmail.com>
 <CAKb7UvjfPptmKDm_jma90Q0T+JoTmETL-Y0-KzTbv9z7f=ccoA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAKb7UvjfPptmKDm_jma90Q0T+JoTmETL-Y0-KzTbv9z7f=ccoA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Fri, Jan 22, 2021 at 8:30 AM Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> wrote:
>
> On Thu, Jan 21, 2021 at 9:59 PM o1bigtenor <o1bigtenor-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> >
> > Greetings
> >
> > Running a debian testing system
> > $ uname -r
> > 5.4.0-4-amd64
> > with 2 graphics cards.
> > The one I'm working on is a: GP 107 Nvidia  GTX 1050 Ti
> >
> > Asus ROG GeForce GX 1050 Ti Strix-GTX1050 Ti with 2 - DVI plus 1 DP1.4
> > and I HDMI2.0 ports (four in total).
> >
> > I have been running 2 1920x1080 monitors on this card (and its
> > previous nvidia 570) for quite some time. Been running nouveau for the
> > last about 4 years as my last nvidia 570 (started with 3) is EOL by
> > nvidia.

> Cheers,
>
>   -ilia
> > Have gotten quite comfortable using xrandr setting up the second card
> > (the nvidia 570) and its 2 monitors. Nouveau software is:
> > xserver-xorg-video-nouveau -> 1:1.0.16-1 ;
> > xserver-xorg -> 1:7.7+21 ; and libdrm-nouveau2:amd64 -> 2.4.102-1 .
> >
> > I want to add a 4k TV onto the HDMI port on card #1.
> > Can't seem to get the card and the TV talking.
>
> Unfortunately my initial attempt at supporting >340mhz modelines over
> HDMI was incomplete -- worked in my own testing, but not for everyone.
> (You need 597mhz to get 4k@60.)

$ cvt 3840 2160
# 3840x2160 59.98 Hz (CVT 8.29M9) hsync: 134.18 kHz; pclk: 712.75 MHz
Modeline "3840x2160_60.00"  712.75  3840 4160 4576 5312  2160 2163
2168 2237 -hsync +vsync

I've tried setting that mode into xrandr - - - - maybe I did something wrong?
(xrandr --newmode  then xrandr --addmode  then xrandr --output
>
> Ben was able to figure out what was wrong and fix it:
>
> commit a1ef8bad506e4ffa0c57ac5f8cb99ab5cbc3b1fc
> Author: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> Date:   Fri May 29 15:18:47 2020 +1000
>
>     drm/nouveau/disp/gm200-: fix NV_PDISP_SOR_HDMI2_CTRL(n) selection
>
> I believe this change is in kernel v5.8. If you don't want to upgrade,
> just ensure you pick a 30hz mode-line for that display, which should
> enable 4k to work.

> Cheers,
>
>   -ilia
I would love to 'pick a 30Hz mode-line' but there just aren't any!

In fact I have both kernel 5.5 and 5.10 on the machine. I reverted to using the
older kernel as with 5.10 it was maybe at worst a couple hours and at best
maybe a day when I would come to my machine and I just couldn't get it
to snap out of 'sleep' (AIUI) mode. Kernel 5.5 was a little better but the best
up time was still measured as less than a couple days - - very occasionally
somewhat longer - - then I had to log in from a different machine on the
network and get the m/c to reboot.

Dunno what's causing the problem there and as I use the machine all the
time for business - - - - well - - - - I wasn't prepared to spend an hour a
day setting the system back up the way I wanted it using xrandr and
starting the various other programs running.

Should I perhaps be filing a bug report?
>
> Also it looks like you have both GPUs plugged in, and slaving one off
> the other. If possible, I'd recommend to keep everything on one GPU.
> The DP port can (most likely) be used for HDMI or DVI with a passive
> converter (not sure if it can be used with HDMI 2.0 though). Having
> remote displays is not a great experience (it does work though, and
> better than nothing in cases that require it).
>

Sorta got to have both GPUs in use - - - - there already 2 monitors running
on each of the GPUs - - - - I'm trying to add a 4K to the newer graphics
card. I've read reports of others where it was a do nothing on M$ yet here
in Linux land - - - - - well it just isn't working!

I've done some more looking and have found this:

$ xrandr --output HDMI-1-2 --mode 3840x2160_60.00  --verbose
xrandr: cannot find crtc for output HDMI-1-2

digging into this it seems something might be changed:

/sys/class/drm/card0/card0-HDMI-A-1/subsystem/ttm/power/async

reads as disabled - - - - so if I change that to 'enabled' is that going
to kick the card in the pants so it will output something?
(the monitor reads -  'weak or no signal' )

TIA
