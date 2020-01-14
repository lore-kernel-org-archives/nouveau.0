From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: Display broken after resume from suspend
Date: Tue, 14 Jan 2020 11:08:20 -0500
Message-ID: <CAKb7Uvijz2hopSSrD7h28uxgMY1YGPXbf9H+hCKb-Lk27N_SXA@mail.gmail.com>
References: <18822946.zTA3u1jjGg@hosanna> <3275761.aAKvXfyuvj@hosanna>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <3275761.aAKvXfyuvj@hosanna>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: "Joshua J. Kugler" <joshua-2Y4XuCtZpk9BDgjK7y7TUQ@public.gmane.org>
Cc: nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Hi Joshua,

Not a fix for your issue, but Ben noticed this (and fixed it):

https://github.com/skeggsb/nouveau/commit/024bda7d2b0c3b0731433d60a494c78ab58cb216

which is what causes us to even try 540MB/s link training. However
with this fix applied, it'll just give up faster. I'm told eDP is
generally a single lane, and you're trying to get more than 270MB/s.
So ... the question is ... why is it trying to do 10bpc. One likely
reason is that the display_info.bpc == 0 for some reason (and we,
rather questionably, default to 10bpc for bandwidth determination).
There's no concrete theory as to what that reason might be, but it
would explain what's going on.

After resuming into a bad state, can you grab the contents of
/sys/class/drm/card0-eDP-1/edid (you'll have to cat it or something)?
My hope is that it's somehow messed up.

Also, can you add "drm.debug=0x1e" to the boot cmd line, in addition
to the bits you have already? Should provide some more info, perhaps
some of it will even be relevant.

Thanks,

  -ilia

On Mon, Jan 13, 2020 at 6:48 PM Joshua J. Kugler <joshua-2Y4XuCtZpk9BDgjK7y7TUQ@public.gmane.org> wrote:
>
> I've added debugging command-line parameters to the kernel command line, per
> skeggsb and imirkin on #nouveau.
>
> root@joyful:~# cat /proc/cmdline
> BOOT_IMAGE=/vmlinuz-5.3.0-26-generic root=/dev/mapper/vgubuntu-root ro quiet
> splash log_buf_len=8M nouveau.debug=disp=trace,bios=trace,i2c=trace 3
>
> On this particular run, closing the lid and then opening got me back to the
> console, but then I tried running
>
> echo mem > /sys/power/state
>
> and it did not recover from that. That is, the laptop is awake, I can ssh in,
> screen back-light is on; black screen.
>
> j
>
>
> On Sunday, January 12, 2020 2:02:00 PM AKST Joshua J. Kugler wrote:
> > Howdy! I've been doing a lot of troubleshooting, and haven't arrived at a
> > solution yet.
> >
> > Kernel log attached. VBIOS also attached.
> > Ubuntu 19.10
> >
> > $ uname -a
> > Linux joyful 5.3.0-26-generic #28-Ubuntu SMP Wed Dec 18 05:37:46 UTC 2019
> > x86_64 x86_64 x86_64 GNU/Linux
> > $ dpkg -l|grep nouveau
> > ii  libdrm-nouveau2:amd64                      2.4.99-1ubuntu1
> > amd64        Userspace interface to nouveau-specific kernel DRM services --
> > runtime
> > ii  xserver-xorg-video-nouveau                 1:1.0.16-1
> > amd64        X.Org X server -- Nouveau display driver
> > $ lspci |grep VGA
> > 01:00.0 VGA compatible controller: NVIDIA Corporation GT218M [NVS 3100M]
> > (rev a2)
> >
> > This is a Dell Latitude E6510, so not exactly bleeding edge. :)
> >
> > The system boots just fine, and I can use the laptop without issue. Goes to
> > sleep just fine. When I resume from sleep, the display is black, and will
> > not come to life (the back light is on, though).  I can ssh in, and run all
> > kinds of commands; restart the display manager does *not* bring it back to
> > life.
> >
> > Any tips would be greatly appreciated.
> >
> > j
>
>
> --
> Joshua J. Kugler - Fairbanks, Alaska - joshua-2Y4XuCtZpk9BDgjK7y7TUQ@public.gmane.org
> Azariah Enterprises - Programming and Website Design
> PGP Key: http://pgp.mit.edu/  ID 0x68108cbb73b13b6a_______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
