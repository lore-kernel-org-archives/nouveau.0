From: "Joshua J. Kugler" <joshua-2Y4XuCtZpk9BDgjK7y7TUQ@public.gmane.org>
Subject: Re: Display broken after resume from suspend
Date: Tue, 31 Mar 2020 17:12:08 -0800
Message-ID: <3797732.Ht5W2oN4fk@hosanna>
References: <18822946.zTA3u1jjGg@hosanna> <1867521.yYtKkQ1SVJ@hosanna>
 <CAKb7Uvhrx5cHTbCNx59Xfxy_+P++YBNHxOJZHp-WtbxRGJVUjA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAKb7Uvhrx5cHTbCNx59Xfxy_+P++YBNHxOJZHp-WtbxRGJVUjA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

I know what some of those words mean.... :D

Welp, I'm currently laid off, so I might have time to do some learning. I'll 
see what I can find out. :)

j

On Tuesday, March 31, 2020 4:55:21 PM AKDT Ilia Mirkin wrote:
> Sorry, haven't really looked since our initial interaction. That EDID
> decodes as:
> 
> Block 0, Base EDID:
>   EDID Structure Version & Revision: 1.0
>   Vendor & Product Identification:
>     Manufacturer: SEC
>     Model: 21569
>     Made in: 2010
>   Basic Display Parameters & Features:
>     Digital display
>     Maximum image size: 34 cm x 19 cm
>     Gamma: 2.20
>     RGB color display
>     First detailed timing is preferred timing
>   Color Characteristics:
>     Red  : 0.6201, 0.3398
>     Green: 0.3300, 0.5703
>     Blue : 0.1503, 0.0595
>     White: 0.3134, 0.3291
>   Established Timings I & II: none
>   Standard Timings: none
>   Detailed Timing Descriptors:
>     DTD 1:  1366x768    60.003 Hz 683:384  47.402 kHz  75.180 MHz (344
> mm x 194 mm)
>                  Hfront   48 Hsync  32 Hback 140 Hpol P
>                  Vfront    2 Vsync   5 Vback  15 Vpol N
>     DTD 2:  1366x768    39.999 Hz 683:384  31.599 kHz  48.220 MHz (344
> mm x 194 mm)
>                  Hfront   48 Hsync  32 Hback  80 Hpol P
>                  Vfront    2 Vsync   5 Vback  15 Vpol N
>     Alphanumeric Data String: 'T892T'
>     Manufacturer-Specified Display Descriptor (0x00): 00 00 00 00 41
> 01 19 00 00 00 00 09 01 0a 20 20 '....A.........  '
> Checksum: 0x4
> 
> ----------------
> 
> edid-decode SHA: 9bdf55523f83072f5c056953f1fbc9fcf09d9496
> 
> Warnings:
> 
> Block 0, Base EDID:
>   EDID Structure Version & Revision: EDID 1.0 is deprecated, do not use.
> 
> Failures:
> 
> Block 0, Base EDID:
>   Basic Display Parameters & Features: Digital Video Interface
> Standard set to reserved value 0x15.
>   Display Descriptor #3: Has descriptor blocks other than detailed timings.
>   Alphanumeric Data String: Non-printable character.
>   Display Descriptor #4: Has descriptor blocks other than detailed timings.
> 
> 
> 
> and in your logs you have
> 
> [  289.906506] nouveau 0000:01:00.0: disp: outp 00:0006:0344: data
> 281925 KB/s link 0 KB/s mst 0->0
> [  289.906511] nouveau 0000:01:00.0: disp: outp 00:0006:0344: link
> requirements changed
> 
> Where completely coincidentally,
> 
> 75180 * 30 / 8 = 281925
> 
> So it's clearly wanting 10bpc. And based on my reading of the logic in
> drm_edid.c, your display_info.bpc with that edid would == 0. However
> in nouveau_connector_detect_depth() we would then force it to 6. And
> in nv50_mstc_get_modes it'd become 8. So this is still a bit unclear
> to me.
> 
> If you're up to it, do some tracing, try to figure out why it's
> deciding to do 10bpc.
> 
> Cheers,
> 
>   -ilia
> 
> On Tue, Mar 31, 2020 at 8:37 PM Joshua J. Kugler <joshua-2Y4XuCtZpk9BDgjK7y7TUQ@public.gmane.org> wrote:
> > Just curious if any of the recent fixes have addressed this. :)
> > 
> > j
> > 
> > On Tuesday, January 14, 2020 1:05:28 PM AKDT Joshua J. Kugler wrote:
> > > Another log, per Lyude on #nouveau.
> > > 
> > > j
> > > 
> > > On Tuesday, January 14, 2020 8:52:51 AM AKST Joshua J. Kugler wrote:
> > > > Here we go!
> > > > 
> > > > j
> > > > 
> > > > On Tuesday, January 14, 2020 7:08:20 AM AKST Ilia Mirkin wrote:
> > > > > Hi Joshua,
> > > > > 
> > > > > Not a fix for your issue, but Ben noticed this (and fixed it):
> > > > > 
> > > > > https://github.com/skeggsb/nouveau/commit/024bda7d2b0c3b0731433d60a4
> > > > > 94c7
> > > > > 8a
> > > > > b5 8cb216
> > > > > 
> > > > > which is what causes us to even try 540MB/s link training. However
> > > > > with this fix applied, it'll just give up faster. I'm told eDP is
> > > > > generally a single lane, and you're trying to get more than 270MB/s.
> > > > > So ... the question is ... why is it trying to do 10bpc. One likely
> > > > > reason is that the display_info.bpc == 0 for some reason (and we,
> > > > > rather questionably, default to 10bpc for bandwidth determination).
> > > > > There's no concrete theory as to what that reason might be, but it
> > > > > would explain what's going on.
> > > > > 
> > > > > After resuming into a bad state, can you grab the contents of
> > > > > /sys/class/drm/card0-eDP-1/edid (you'll have to cat it or
> > > > > something)?
> > > > > My hope is that it's somehow messed up.
> > > > > 
> > > > > Also, can you add "drm.debug=0x1e" to the boot cmd line, in addition
> > > > > to the bits you have already? Should provide some more info, perhaps
> > > > > some of it will even be relevant.
> > > > > 
> > > > > Thanks,
> > > > > 
> > > > >   -ilia
> > > > > 
> > > > > On Mon, Jan 13, 2020 at 6:48 PM Joshua J. Kugler
> > > > > <joshua-2Y4XuCtZpk9BDgjK7y7TUQ@public.gmane.org>
> > > 
> > > wrote:
> > > > > > I've added debugging command-line parameters to the kernel command
> > > > > > line,
> > > > > > per skeggsb and imirkin on #nouveau.
> > > > > > 
> > > > > > root@joyful:~# cat /proc/cmdline
> > > > > > BOOT_IMAGE=/vmlinuz-5.3.0-26-generic
> > > > > > root=/dev/mapper/vgubuntu-root ro
> > > > > > quiet splash log_buf_len=8M
> > > > > > nouveau.debug=disp=trace,bios=trace,i2c=trace
> > > > > > 3
> > > > > > 
> > > > > > On this particular run, closing the lid and then opening got me
> > > > > > back
> > > > > > to
> > > > > > the
> > > > > > console, but then I tried running
> > > > > > 
> > > > > > echo mem > /sys/power/state
> > > > > > 
> > > > > > and it did not recover from that. That is, the laptop is awake, I
> > > > > > can
> > > > > > ssh
> > > > > > in, screen back-light is on; black screen.
> > > > > > 
> > > > > > j
> > > > > > 
> > > > > > On Sunday, January 12, 2020 2:02:00 PM AKST Joshua J. Kugler 
wrote:
> > > > > > > Howdy! I've been doing a lot of troubleshooting, and haven't
> > > > > > > arrived
> > > > > > > at
> > > > > > > a
> > > > > > > solution yet.
> > > > > > > 
> > > > > > > Kernel log attached. VBIOS also attached.
> > > > > > > Ubuntu 19.10
> > > > > > > 
> > > > > > > $ uname -a
> > > > > > > Linux joyful 5.3.0-26-generic #28-Ubuntu SMP Wed Dec 18 05:37:46
> > > > > > > UTC
> > > > > > > 2019
> > > > > > > x86_64 x86_64 x86_64 GNU/Linux
> > > > > > > $ dpkg -l|grep nouveau
> > > > > > > ii  libdrm-nouveau2:amd64                      2.4.99-1ubuntu1
> > > > > > > amd64        Userspace interface to nouveau-specific kernel DRM
> > > > > > > services
> > > > > > > --
> > > > > > > runtime
> > > > > > > ii  xserver-xorg-video-nouveau                 1:1.0.16-1
> > > > > > > amd64        X.Org X server -- Nouveau display driver
> > > > > > > $ lspci |grep VGA
> > > > > > > 01:00.0 VGA compatible controller: NVIDIA Corporation GT218M
> > > > > > > [NVS
> > > > > > > 3100M]
> > > > > > > (rev a2)
> > > > > > > 
> > > > > > > This is a Dell Latitude E6510, so not exactly bleeding edge. :)
> > > > > > > 
> > > > > > > The system boots just fine, and I can use the laptop without
> > > > > > > issue.
> > > > > > > Goes
> > > > > > > to
> > > > > > > sleep just fine. When I resume from sleep, the display is black,
> > > > > > > and
> > > > > > > will
> > > > > > > not come to life (the back light is on, though).  I can ssh in,
> > > > > > > and
> > > > > > > run
> > > > > > > all
> > > > > > > kinds of commands; restart the display manager does *not* bring
> > > > > > > it
> > > > > > > back
> > > > > > > to
> > > > > > > life.
> > > > > > > 
> > > > > > > Any tips would be greatly appreciated.
> > > > > > > 
> > > > > > > j
> > > > > > 
> > > > > > --
> > > > > > Joshua J. Kugler - Fairbanks, Alaska - joshua-2Y4XuCtZpk9BDgjK7y7TUQ@public.gmane.org
> > > > > > Azariah Enterprises - Programming and Website Design
> > > > > > PGP Key: http://pgp.mit.edu/  ID
> > > > > > 0x68108cbb73b13b6a_______________________________________________
> > > > > > Nouveau
> > > > > > mailing list
> > > > > > Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> > > > > > https://lists.freedesktop.org/mailman/listinfo/nouveau
> > 
> > --
> > Joshua J. Kugler - Fairbanks, Alaska - joshua-2Y4XuCtZpk9BDgjK7y7TUQ@public.gmane.org
> > Azariah Enterprises - Programming and Website Design
> > PGP Key: http://pgp.mit.edu/  ID 0x68108cbb73b13b6a
> > 
> > 
> > _______________________________________________
> > Nouveau mailing list
> > Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> > https://lists.freedesktop.org/mailman/listinfo/nouveau
> 
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau


-- 
Joshua J. Kugler - Fairbanks, Alaska - joshua-2Y4XuCtZpk9BDgjK7y7TUQ@public.gmane.org
Azariah Enterprises - Programming and Website Design
PGP Key: http://pgp.mit.edu/  ID 0x68108cbb73b13b6a
