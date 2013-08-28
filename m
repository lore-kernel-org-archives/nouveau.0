From: Sam Varshavchik <mrsam-W1w4QoW4mIDgLSHwZvcCBg@public.gmane.org>
Subject: Re:
	=?utf-8?q?=22Stuttering=22_display=2C_NVA0_chipset=2E?=
Date: Wed, 28 Aug 2013 19:09:40 -0400
Message-ID: <cone.1377731380.859852.3656.1000@monster.email-scan.com>
References: <cone.1377727433.415855.3656.1000@monster.email-scan.com>
	<521E7A7B.4030409@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1214013919=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

This is a MIME GnuPG-signed message.  If you see this text, it means that
your E-mail or Usenet software does not support MIME signed messages.
The Internet standard for MIME PGP messages, RFC 2015, was published in 1996.
To open this message correctly you will need to install E-mail or Usenet
software that supports modern Internet standards.

--===============1214013919==
Content-Type: multipart/signed;
    boundary="=_monster.email-scan.com-3656-1377731380-0003";
    micalg=pgp-sha1; protocol="application/pgp-signature"

This is a MIME GnuPG-signed message.  If you see this text, it means that
your E-mail or Usenet software does not support MIME signed messages.
The Internet standard for MIME PGP messages, RFC 2015, was published in 1996.
To open this message correctly you will need to install E-mail or Usenet
software that supports modern Internet standards.

--=_monster.email-scan.com-3656-1377731380-0003
Content-Type: text/plain; format=flowed; delsp=yes; charset="UTF-8"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

Emil Velikov writes:

> On 28/08/13 23:03, Sam Varshavchik wrote:
> > I'm running xorg-x11-drv-nouveau-1.0.9-1.fc19.x86_64 and
> > xorg-x11-server-Xorg-1.14.2-9.fc19.x86_64
> >
> > On the following chipset, the display suffers from "stuttering":
> >
> > 06:00.0 VGA compatible controller: NVIDIA Corporation GT200b [GeForce
> > GTX 285] (rev a1) (prog-if 00 [VGA controller])
> >        Subsystem: Gigabyte Technology Co., Ltd Device 34c9
> >        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop-
> > ParErr+ Stepping- SERR+ FastB2B- DisINTx-
> >        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
> > <TAbort- <MAbort- >SERR- <PERR- INTx-
> >        Latency: 0, Cache Line Size: 256 bytes
> >        Interrupt: pin A routed to IRQ 24
> >        Region 0: Memory at f7000000 (32-bit, non-prefetchable) [size=16M]
> >        Region 1: Memory at d0000000 (64-bit, prefetchable) [size=256M]
> >        Region 3: Memory at f8000000 (64-bit, non-prefetchable) [size=32M]
> >        Region 5: I/O ports at dc00 [size=128]
> >        Expansion ROM at f6f80000 [disabled] [size=512K]
> >        Capabilities: <access denied>
> >        Kernel driver in use: nouveau
> >
> > [   531.742] (--) NOUVEAU(0): Chipset: "NVIDIA NVA0"
> >
> > By "stutters" I mean that at random intervals, at least several times a
> > minute, the entire display completely freezes, for an interval ranging
> > between about quarter of a second, to sometimes as long as 5-6 seconds.
> >
> > By "freezes" I mean that it just stops updating. No artifacts, just a
> > frozen display.
> >
> > When the display eventually becomes unstuck, it's completely up to date.
> > Everything that should be rendered, to that point, is rendered. It's as
> > if the framebuffer continues to get updated normally, but the display is
> > not being refreshed. Except for the mouse pointer! When the display is
> > not refreshing, the mouse pointer continues to be responsive.
> >
> > Basically, if I'm playing some video, the audio keeps going, the video
> > stops for 1-6 seconds, then continues running, synchronized with the
> > audio. Or, if I'm typing something on the terminal, after the display
> > unsticks itself, everything that was typed in the interim, is where it
> > should be. That's the best way I can describe it.
> >
> Hello Sam,
>
> To be honest I've experienced something similar although my issue was
> caused by the kernel swapping like crazy. There is a memory leak
> somewhere on my system that causes X to consume ~800MiB of RES memory
> after ~10days.
>
> That said you could try connecting remotely to the system (ssh) and see
> what is causing the issue - htop and perf would be some of the tools you
> can use.

There's no need to connect remotely. The system is running normally. Like I  
described, the display only freezes for a few seconds, at the most, then the  
system resumes running normally.

I does look like it's thrashing, and, now that I look at it, I am not  
swapping, 0 swap used. It does look a bit suspicious that gnome-shell is  
using up almost 3 gigs of RAM, and virt-manager another 1.5gb, but I've got  
16 gigs, and there's no swap being used..

>
> > I see no complaints in /var/log/messages, nor in Xorg.0.log
> >
> When you say "complains" I'm not sure what exactly you are looking for
> or expecting to see. Nouveau kernel Errors and warnings are indicated as
> "nouveau E" and "nouveau W" respectively.
> In general the output of dmesg is more reliable source of information
> than /var/log/messages.

I was looking for complaints about lost hardware interrupts, DMA errors,  
stuff like that.


--=_monster.email-scan.com-3656-1377731380-0003
Content-Type: application/pgp-signature
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.14 (GNU/Linux)

iQIcBAABAgAGBQJSHoM0AAoJEGs6Yr4nnb8lFhUP/3oWRq9Xq9J+RtdGj2n4jZSi
QdX/vEfjyy6Ff4ovLQDL0RHQPEr3uctQh/ZVXV53Ygt72rNrA38bwanTF1ROyKog
a520QJwnlg7f1QEEGk4TIrPU72jA9RifOPy1orz7pVnFFcsLw78ALSn75O2PM5eL
sEirTyPRH8Qq8FVzLUmhmOrN6p2QFqcn43gnrHesO7q3ZX1L+qiKf0CYsINPVT3c
hEcK6LXjjkcGh93yrcGefDL93E0KVyq7Y4WLpf7N/ObkOi4AI1IchY7CAKL65lfJ
FrWMMfjA9l8xFkn8KvuaHmc5gPISuUGhS3HiuOXnc2EGyz28DX3WgZ2iRGDexPXE
vBtIXilz1eG7RptlfYAlL7Ikv2cossOe0PhPBXHIVKgl4vbmKW8tGw0/V6sHqkog
Wfyj8iMrRV56GrsO4gWpVCVpURx3BQEk+nhEiivhXfFffCn34fyy+fC0+m+ZCNw2
1amP0NyGV3MEK8C81cQ9ZRr/0rQse62n+Zx8oIq0Dz/NZ2b/INuDwOwvQvI8ue7E
Fr4Ez1iab+46rFf5GsN7LqtbCkFPBt0d0BEplb7Ka0DiLWWwyS5cG5bPid3PKJ80
DRYJKTb/QedbylVCVr2A9Ox7hOfxEpW4V55oYTEX/XW3PzdhKcfCw2tmEK0skbck
vw9GvOUbL6HZ3RxJ3WrN
=oNGq
-----END PGP SIGNATURE-----

--=_monster.email-scan.com-3656-1377731380-0003--

--===============1214013919==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1214013919==--
