From: Felix Miata <mrmazda-ihVZJaRskl1bRRN4PJnoQQ@public.gmane.org>
Subject: Re: NV40 under Debian
Date: Sat, 22 Feb 2020 19:16:04 -0500
Message-ID: <4300b272-063d-f609-4b6f-92fd524cb5ed@earthlink.net>
References: <trinity-c5570114-8f17-4b15-bb54-f6a39340ef19-1582394224520@3c-app-gmx-bs13>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <trinity-c5570114-8f17-4b15-bb54-f6a39340ef19-1582394224520@3c-app-gmx-bs13>
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

Lukas Schubert composed on 2020-02-22 12:57 (UTC-0500):
 
> my media center PC is freshly installed with Debian 10.2 "Buster". It doesn't support Geforce 6800 GT (NV40) boards through the nvidia nor the nvidia-legacy drivers any longer. The legacy drivers worked up until Debian 9 "Stretch", but no longer.
 
> I know that the hardware works because I can boot SystemRescueCD from CD and get a flawless desktop presentation on the attached full HD TV.
 
> But in Debian 10, the colours are distorted. Have a look at "Nouveau.jpg" here: https://jumpshare.com/b/Se5d7xMu5tBSsR2Zcz8p
> I can get the colours to work by starting the kernel with "nomodeset". Look at the same link, "NoModeSet.jpg".

Nomodeset causes use of fallback X video drivers that typically utilize far
less than all of the videoram, usually running in a lower resolution mode
such as 1024x768 or 1280x1024, lower than most current widescreen displays
support.

> SystemRescueCD (working nouveau version) uses an older kernel:
> root@sysresccd /root % uname -a
> Linux sysresccd 3.2.28-std300-amd64 #2 SMP Tue Aug 21 18:35:38 UTC 2012 x86_64 Intel(R) Core(TM)2 CPU 6420 @ 2.13GHz GenuineIntel GNU/Linux
 
> Debian 10.2 (distorted colours) uses this kernel:
> luker@michael:~$ uname -a
> Linux michael 4.19.0-8-amd64 #1 SMP Debian 4.19.98-1 (2020-01-26) x86_64 GNU/Linux
 
> Is there a configuration setting in nouveau that causes those weird colours?
> Bit order/byte order maybe?

Which DDX is X employing to produce that?:

	inxi -Gxx

It's quite possible your colors trouble is caused by a failing GeForce. I have
both newer and older working fine on either of the FOSS DDX, e.g.:

> inxi -SGxx
System:    Host: gx270.ij.net Kernel: 4.19.0-8-686 i686 bits: 32 compiler: gcc v: 8.3.0 Desktop: Trinity wm: Twin dm: startx
           Distro: Debian GNU/Linux 10 (buster)
Graphics:  Device-1: NVIDIA NV34 [GeForce FX 5200] driver: nouveau v: kernel bus ID: 01:00.0 chip ID: 10de:0322
           Display: server: X.Org 1.20.4 driver: nouveau unloaded: fbdev,modesetting,vesa alternate: nv
           resolution: 1680x1050~60Hz, 1920x1200~60Hz
           OpenGL: renderer: NV34 v: 1.5 Mesa 18.3.6 direct render: Yes
root@gx270:~# xrandr | egrep 'onnect|creen|\*' | grep -v disconn | sort -r
VGA-1 connected primary 1680x1050+0+0 (normal left inverted right x axis y axis) 474mm x 296mm
Screen 0: minimum 320 x 200, current 3600 x 1200, maximum 4096 x 4096
DVI-I-1 connected 1920x1200+1680+0 (normal left inverted right x axis y axis) 519mm x 324mm
   1920x1200     59.95*+
   1680x1050     59.97*+  74.89

I have in the past with NVidia and AMD cards seen similar colors disruption instead
of normal output when a card is failing.
-- 
Evolution as taught in public schools is religion, not science.

 Team OS/2 ** Reg. Linux User #211409 ** a11y rocks!

Felix Miata  ***  http://fm.no-ip.com/
