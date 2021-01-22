From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: Request for help in adding a HDMI output
Date: Fri, 22 Jan 2021 09:30:29 -0500
Message-ID: <CAKb7UvjfPptmKDm_jma90Q0T+JoTmETL-Y0-KzTbv9z7f=ccoA@mail.gmail.com>
References: <CAPpdf5-SoO4qPKg7WuvRsCMT4RGV34gNp+M0ir27a1E8Qu+s4g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAPpdf5-SoO4qPKg7WuvRsCMT4RGV34gNp+M0ir27a1E8Qu+s4g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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

On Thu, Jan 21, 2021 at 9:59 PM o1bigtenor <o1bigtenor-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
> Greetings
>
> Running a debian testing system
> $ uname -r
> 5.4.0-4-amd64
> with 2 graphics cards.
> The one I'm working on is a: GP 107 Nvidia  GTX 1050 Ti
>
> Asus ROG GeForce GX 1050 Ti Strix-GTX1050 Ti with 2 - DVI plus 1 DP1.4
> and I HDMI2.0 ports (four in total).
>
> I have been running 2 1920x1080 monitors on this card (and its
> previous nvidia 570) for quite some time. Been running nouveau for the
> last about 4 years as my last nvidia 570 (started with 3) is EOL by
> nvidia.
> Have gotten quite comfortable using xrandr setting up the second card
> (the nvidia 570) and its 2 monitors. Nouveau software is:
> xserver-xorg-video-nouveau -> 1:1.0.16-1 ;
> xserver-xorg -> 1:7.7+21 ; and libdrm-nouveau2:amd64 -> 2.4.102-1 .
>
> I want to add a 4k TV onto the HDMI port on card #1.
> Can't seem to get the card and the TV talking.

Unfortunately my initial attempt at supporting >340mhz modelines over
HDMI was incomplete -- worked in my own testing, but not for everyone.
(You need 597mhz to get 4k@60.)

Ben was able to figure out what was wrong and fix it:

commit a1ef8bad506e4ffa0c57ac5f8cb99ab5cbc3b1fc
Author: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Date:   Fri May 29 15:18:47 2020 +1000

    drm/nouveau/disp/gm200-: fix NV_PDISP_SOR_HDMI2_CTRL(n) selection

I believe this change is in kernel v5.8. If you don't want to upgrade,
just ensure you pick a 30hz mode-line for that display, which should
enable 4k to work.

Also it looks like you have both GPUs plugged in, and slaving one off
the other. If possible, I'd recommend to keep everything on one GPU.
The DP port can (most likely) be used for HDMI or DVI with a passive
converter (not sure if it can be used with HDMI 2.0 though). Having
remote displays is not a great experience (it does work though, and
better than nothing in cases that require it).

Cheers,

  -ilia
