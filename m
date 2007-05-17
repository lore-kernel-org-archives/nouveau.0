From: "Pascal Schoenhardt" <stoanhart-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: NV43 (6600 Go) Report
Date: Thu, 17 May 2007 10:15:14 +0100
Message-ID: <438b0cc70705170215s60fa9ff9l74fda2724f783953@mail.gmail.com>
References: <438b0cc70705150323q2356c42flb70d4f0675bbc478@mail.gmail.com>
	<20070515211717.3a386fc8@daedalus.pq.iki.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20070515211717.3a386fc8-cxYvVS3buNOdIgDiPM52R8c4bpwCjbIv@public.gmane.org>
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

OK, so I have compiled and installed the randr1.2 branch of nouveau.
The problem I am having is the following: with just the laptop
flatpanel display connected, x won't start; with an external device
connected, x starts but all displays remain blank.

With just the laptop panel on its own, X fails with:
  (EE) NOUVEAU(0): No valid modes.
  (EE) Screen(s) found, but none have a usable configuration.

I have tried the following settings for xorg.conf:
  -Same settings as before (non-randr1.2 version)
  -Removed all "Display" subsections, to let modes be autodetected
  -All monitor options removed, except the identifier
  -No modes in "Display" subsection, just one large virtual, big
enough to span all my display devices

None of these have helped. Here is a full log output, with non-nouveau
stuff stripped out:

(II) LoadModule: "nouveau"
(II) Loading /usr/lib/xorg/modules/drivers//nouveau_drv.so
(II) Module nouveau: vendor="X.Org Foundation"
	compiled for 1.3.0, module version = 1.2.0
	Module class: X.Org Video Driver
	ABI class: X.Org Video Driver, version 1.2
(II) NOUVEAU driver Date:   Sun May 6 17:30:30 2007 +1000
(II) NOUVEAU driver for NVIDIA chipset families :
	RIVA 128    (NV03)
	RIVA TNT    (NV04)
	RIVA TNT2   (NV05)
	GeForce 256 (NV10)
	GeForce 2   (NV11, NV15)
	GeForce 4MX (NV17, NV18)
	GeForce 3   (NV20)
	GeForce 4Ti (NV25, NV28)
	GeForce FX  (NV3x)
	GeForce 6   (NV4x)
	GeForce 7   (G7x)
(II) Primary Device is: PCI 01:00:0
(--) Chipset GeForce Go 6600 found
(II) Setting vga for screen 0.
(II) NOUVEAU(0): Initializing int10
(WW) NOUVEAU(0): Bad V_BIOS checksum
(II) NOUVEAU(0): Primary V_BIOS segment is: 0xc000
(--) NOUVEAU(0): Chipset: "GeForce Go 6600"
(**) NOUVEAU(0): Depth 24, (--) framebuffer bpp 32
(==) NOUVEAU(0): RGB weight 888
(==) NOUVEAU(0): Default visual is TrueColor
(==) NOUVEAU(0): Using HW cursor
(==) NOUVEAU(0): Using EXA acceleration method
(--) NOUVEAU(0): Linear framebuffer at 0xC0000000
(--) NOUVEAU(0): MMIO registers at 0xFD000000
(II) Loading sub module "dri"
(II) LoadModule: "dri"
(II) Reloading /usr/lib/xorg/modules/extensions//libdri.so
(II) NOUVEAU(0): Loaded DRI module
drmOpenDevice: node name is /dev/dri/card0
drmOpenDevice: open result is 7, (OK)
drmOpenByBusid: Searching for BusID pci:0000:01:00.0
drmOpenDevice: node name is /dev/dri/card0
drmOpenDevice: open result is 7, (OK)
drmOpenByBusid: drmOpenMinor returns 7
drmOpenByBusid: drmGetBusid reports pci:0000:01:00.0
(II) NOUVEAU(0): [dri] Found DRI library version 1.3.0 and kernel
module version 0.0.6
(II) NOUVEAU(0): BIOS signature not found!
(II) NOUVEAU(0): vtowner is 0
(II) Loading sub module "i2c"
(II) LoadModule: "i2c"(II) Module already built-in
(II) Loading sub module "ddc"
(II) LoadModule: "ddc"(II) Module already built-in
(II) NOUVEAU(0): I2C bus "DDC1" initialized.
(II) NOUVEAU(0): I2C bus "DDC2" initialized.
(II) NOUVEAU(0): I2C bus "TV" initialized.
(II) NOUVEAU(0): Output Analog-0 using monitor section Laptop FlatPanel
(--) NOUVEAU(0): Adding output Analog-0
(II) NOUVEAU(0): Output Analog-1 has no monitor section
(--) NOUVEAU(0): Adding output Analog-1
(II) NOUVEAU(0): Output Digital-0 has no monitor section
(--) NOUVEAU(0): Adding output Digital-0
(II) NOUVEAU(0): I2C device "DDC1:ddc2" registered at address 0xA0.
(II) NOUVEAU(0): I2C device "DDC1:ddc2" removed.
(--) NOUVEAU(0): CRT detect returned 0
(II) NOUVEAU(0): Output Analog-0 disconnected
(II) NOUVEAU(0): EDID for output Analog-0
(II) NOUVEAU(0): I2C device "DDC2:ddc2" registered at address 0xA0.
(II) NOUVEAU(0): I2C device "DDC2:ddc2" removed.
(II) NOUVEAU(0): Output Analog-1 disconnected
(II) NOUVEAU(0): EDID for output Analog-1
(II) NOUVEAU(0): I2C device "DDC1:ddc2" registered at address 0xA0.
(II) NOUVEAU(0): I2C device "DDC1:ddc2" removed.
(II) NOUVEAU(0): Output Digital-0 disconnected
(II) NOUVEAU(0): EDID for output Digital-0
(II) NOUVEAU(0): Output Analog-0 disconnected
(II) NOUVEAU(0): Output Analog-1 disconnected
(II) NOUVEAU(0): Output Digital-0 disconnected
(EE) NOUVEAU(0): No valid modes.
(II) UnloadModule: "nouveau"
(II) UnloadModule: "dri"
(EE) Screen(s) found, but none have a usable configuration.

Fatal server error:
no screens found

=========================

Now, when I connect another screen, X actually starts. Reading the log
files, nouveau is getting the EDID info from the external screen
(1024x768@70 LCD), and determining the correct modeline (after quite a
lot of probing). As for the internal panel, it seems not to provide
any EDID info. However, nouveau does seem to want to choose 1680x1050,
provided I have specified a virtual large enough to fit that and the
external screen in the xorg.conf (2704x1050).

Once X is started, both monitors are black. However, I can hear the
"please enter your loging credentials" tone you get with ubuntu, and I
can blindly log in to a normal session.

I am guessing that this is just because this branch of nouvea is even
more experimental than the whole project is, so there probably isn't
much to do but wait for it to improve. However, hopefully this is
useful information to some of the devs. And if someone has a tip on
getting this to work, I'm all ears.

Here is a full log of X starting, using a modeline for the internal
panel, defining a virtual screen large enough for the two displays,
and with the external display connected and turned on. This is too
large to post as text, so here's a link:

http://www.pascals.ca/files/xorg-modeline-virt2704x1050-VGAConnectedOn.log

Thanks!

Pascal
