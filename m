From: Jasmin <jasmin.pm-g/b1ySJe57IN+BqQ9rBEUg@public.gmane.org>
Subject: Re: DP MST with GK107 and lenovo ultra dock
Date: Mon, 02 Mar 2020 00:40:28 +0000
Message-ID: <D-hdgPgWmiyZfEPUXCL_D132ZWmQVAopKtR2up1uwjNtaxsXUkRzrVNBTNLNM_tMLRaa_dv7s25AhRW5xRfSxhqJC39Ngw04rIbGoHnFRAI=@protonmail.com>
References: <QoDOhTStpq2yEF5SaIbKoDh3i_nTSTVGy5rrV-8827WSM5NlVnXJ8pQ9HTvQnOL-XfnXry0duLHZgOyq2qD2Xg7RWqpswmIZ_O_wicapPrs=@protonmail.com>
 <CAKb7UviVqPZKuZ-Mj94FSDV=3+FDjEzk0RfENacMmU-3Nd2GqQ@mail.gmail.com>
Reply-To: Jasmin <jasmin.pm-g/b1ySJe57IN+BqQ9rBEUg@public.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAKb7UviVqPZKuZ-Mj94FSDV=3+FDjEzk0RfENacMmU-3Nd2GqQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Hi Ilia,

thanks for your reply.

> DP-MST support was first added to nouveau for precisely these kinds of
> setups. It does, generally, work, so that means there's something
> extra-special about your setup.

Yes... this is what it looks like.

Even the proprietary driver, which works after bootup, has its problems with the setup after multiple consecutive VT switches (e.g. after 8-12 times).
At some stage, the external displays do not switch on again. VT switches take > 30-60s in this case, and only the internal display (reverse PRIME) comes back/system is extremly slow then.
In this case, even a reboot does not help. The system needs to be powered off completely(!). Something "bad" stored in the video memory?
After turning it back on, everything is normal/stable again; even for several months uptime.

Perhaps this behavior of the dock in conjunction with the proprietary driver is somehow related to the displays not recognized at all when using nouveau...

> > Feb 28 23:07:11 laptop kernel: [ 13.746813] nouveau 0000:01:00.0: DRM: DCB conn 00: 01000046
>
> This is the DP connector.

The NVIDIA Doc mentions some bits for AUX I2C GPIO... which are not set here. But that is probably nothing unusual.

> I think it may be interesting to boot with
>
> drm.debug=0x1e nouveau.debug=i2c=trace,aux=trace,disp=trace

I have just made that trace:
https://pastebin.com/7GZLRY8F


Mar  1 21:30:59 laptop kernel: [   14.228427] nouveau 0000:01:00.0: disp: init running...
Mar  1 21:30:59 laptop kernel: [   14.228427] nouveau 0000:01:00.0: disp: one-time init running...
Mar  1 21:30:59 laptop kernel: [   14.228432] nouveau 0000:01:00.0: disp: outp 00:0006:0f48: type 06 loc 0 or 8 link 1 con 0 edid c bus 0 head f
Mar  1 21:30:59 laptop kernel: [   14.228435] nouveau 0000:01:00.0: disp: outp 00:0006:0f48: bios dp 40 13 00 00
Mar  1 21:30:59 laptop kernel: [   14.228437] nouveau 0000:01:00.0: disp: outp 01:0002:0f48: type 02 loc 0 or 8 link 1 con 0 edid 8 bus 0 head f
Mar  1 21:30:59 laptop kernel: [   14.228439] nouveau 0000:01:00.0: disp: conn ffffffff:00ff: type ff loc 0 hpd 00 dp 0 di 0 sr 0 lcdid 0
Mar  1 21:30:59 laptop kernel: [   14.228440] nouveau 0000:01:00.0: disp: conn ffffffff:00ff: type ff loc 0 hpd 00 dp 0 di 0 sr 0 lcdid 0
Mar  1 21:30:59 laptop kernel: [   14.228461] nouveau 0000:01:00.0: disp:   Head(s): 4 (0f)
Mar  1 21:30:59 laptop kernel: [   14.228462] nouveau 0000:01:00.0: disp: head-0: ctor
Mar  1 21:30:59 laptop kernel: [   14.228463] nouveau 0000:01:00.0: disp: head-1: ctor
Mar  1 21:30:59 laptop kernel: [   14.228463] nouveau 0000:01:00.0: disp: head-2: ctor
Mar  1 21:30:59 laptop kernel: [   14.228464] nouveau 0000:01:00.0: disp: head-3: ctor
Mar  1 21:30:59 laptop kernel: [   14.228468] nouveau 0000:01:00.0: disp:    DAC(s): 4 (02)
Mar  1 21:30:59 laptop kernel: [   14.228469] nouveau 0000:01:00.0: disp: DAC-1: ctor
Mar  1 21:30:59 laptop kernel: [   14.228473] nouveau 0000:01:00.0: disp:    SOR(s): 8 (0f)
Mar  1 21:30:59 laptop kernel: [   14.228473] nouveau 0000:01:00.0: disp: SOR-0: ctor
Mar  1 21:30:59 laptop kernel: [   14.228474] nouveau 0000:01:00.0: disp: SOR-1: ctor
Mar  1 21:30:59 laptop kernel: [   14.228474] nouveau 0000:01:00.0: disp: SOR-2: ctor
Mar  1 21:30:59 laptop kernel: [   14.228475] nouveau 0000:01:00.0: disp: SOR-3: ctor
Mar  1 21:30:59 laptop kernel: [   14.228522] nouveau 0000:01:00.0: disp: one-time init completed in 94us
Mar  1 21:30:59 laptop kernel: [   14.228526] nouveau 0000:01:00.0: disp: outp 00:0006:0f48: no heads (0 3 4)

"4 Heads" looks not-so-bad... but, at least when trying to configure it (e.g. with arandr/xrandr), there is only "one" display available on that port, which does not work.
I hope this is not a xorg.conf configuration-issue?
At least ddcutil shows "no display detected".

> Also, after everything boots up, can you look at what "grep .
> /sys/class/drm/-/status" produces?

Here is the output:

/sys/class/drm/card0-DP-1/status:disconnected
/sys/class/drm/card0-DP-2/status:disconnected
/sys/class/drm/card0-eDP-1/status:connected
/sys/class/drm/card0-HDMI-A-1/status:disconnected
/sys/class/drm/card0-HDMI-A-2/status:disconnected
/sys/class/drm/card0-VGA-1/status:disconnected
/sys/class/drm/card1-DVI-D-1/status:disconnected
/sys/class/drm/card1-eDP-2/status:connected

> I suspect figuring this out will require some amount of back and
> forth, and I'm not really the best person for display issues. Try
> #nouveau on irc.freenode.net on a week day.

OK... if the trace does not obviously (more or less ^^) show what the cause is, I will try that.

Best
Jasmin
