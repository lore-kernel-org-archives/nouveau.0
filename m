From: Andreas Happe <andy-L2Gnq7z6Vd1eoWH0uzbU5w@public.gmane.org>
Subject: "Unknown LVDS configuration bits, please report" - Error
Date: Sun, 27 Apr 2008 15:29:46 +0200
Message-ID: <1209302986.2660.5.camel@wolverine>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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

Hi,
I tried to run nouveau under Ubuntu 8.04, it failed with the error
mentioned in the subject.

The graphics card in question is:
01:00.0 VGA compatible controller: nVidia Corporation Quadro NVS 135M
(rev a1)

Some X specific output:
X.Org X Server 1.4.0.90
Release Date: 5 September 2007
X Protocol Version 11, Revision 0
Build Operating System: Linux Ubuntu (xorg-server
2:1.4.1~git20080131-1ubuntu9)
Current Operating System: Linux wolverine 2.6.24-12-generic #1 SMP Wed
Mar 12 22:31:43 UTC 2008 x86_64
Build Date: 15 April 2008  05:41:18PM

dmesg output:
[34835.668083] [drm] Initialized drm 1.1.0 20060810
[34837.472582] [drm] Initialized drm 1.1.0 20060810
[34837.700618] PCI: Setting latency timer of device 0000:01:00.0 to 64
[34837.705298] [drm] Detected an NV50 generation card (0x086b00a2)
[34837.705313] [drm] Initialized nouveau 0.0.10 20060213 on minor 0
[34837.705325] [drm] Used old pci detect: framebuffer loaded

I have the Xorg.0.conf copied and can send it, as it has around 90k I do
not really want to send it to the mailing list. The lines with warnings
or errors are:

(II) NOUVEAU(0): Attempting to locate BIOS image in PROM
(WW) NOUVEAU(0): ... BIOS signature not found
..
(EE) NOUVEAU(0): ========== unknown reg 0x00021218 ========== (couple of
times)
..
(EE) NOUVEAU(0): ========== unknown reg 0x00020060 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x00089008 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x00089028 ==========

And the final lines:

(II) NOUVEAU(0): Found LVDS manufacturer table revision 4.0
(EE) NOUVEAU(0): LVDS table revision not currently supported
(EE) NOUVEAU(0): Pointers to flat panel table invalid
(II) NOUVEAU(0): Found TMDS table revision 2.0
(WW) NOUVEAU(0): TMDS table script pointers not stubbed
(II) NOUVEAU(0): Setting owner: 0x0.
(II) NOUVEAU(0): Setting owner: 0x3.
(II) NOUVEAU(0): Setting owner: 0x0.
(II) NOUVEAU(0): Display Configuration Block version 4.0 found
(II) NOUVEAU(0): DCB header length 27, with 10 possible entries
Raw DCB entry 0: 01000323 00010034
(EE) NOUVEAU(0): Unknown LVDS configuration bits, please report
(II) NOUVEAU(0): NV50DispPreInit is called.
(II) Loading sub module "i2c"
(II) LoadModule: "i2c"(II) Module "i2c" already built-in
(II) Loading sub module "ddc"
(II) LoadModule: "ddc"(II) Module "ddc" already built-in
(EE) NOUVEAU(0): 1351: No valid modes.
(II) UnloadModule: "nouveau"
(II) UnloadModule: "dri"
(II) UnloadModule: "vgahw"
(II) Unloading /usr/lib/xorg/modules//libvgahw.so
(II) UnloadModule: "int10"
(II) Unloading /usr/lib/xorg/modules//libint10.so
(EE) Screen(s) found, but none have a usable configuration.

Hope that helps, pray contact me if you need more information.

cheers,
Andreas
