From: Sebastian Glita <glseba-/E1597aS9LQAvxtiuMwx3w@public.gmane.org>
Subject: no start with latest modules from git
Date: Wed, 24 Feb 2010 02:02:17 -0800 (PST)
Message-ID: <919223.18542.qm@web57008.mail.re3.yahoo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
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

Hello,

Using code from git a week is since I cannot start Xorg with nouveau on a Quatro NVS 290.

Commits from git.freedesktop.org:

xorg-server - db4f676f25c6d8e58263d5151942be730592d444
xf86-video-nouveau - 70d0a48b6c3f1a817bf850acd3bae48d063e56b9
libdrm - 3130f94c6ee32668cb9f0b96b6c8e308a7bb3b11
mesa - e16f0c14f353cc04ad6cbcf99e3b95ccb1d2c06b

A similar problem for xf86-video-intel solved meanwhile by updates to the above.

Thanks for any help,
s.

File /var/log/Xorg.log.0 content:

<<<
[383234.171] X.Org X Server 1.7.99.901 (1.8.0 RC 1) Release Date: 2010-02-12
[383234.171] X Protocol Version 11, Revision 0
[383234.171] Build Operating System: Linux 2.6.33-rc8 x86_64 
[383234.171] Current Operating System: Linux job 2.6.33-rc8 #2 SMP Sun Feb 14 14:30:15 EET 2010 x86_64
[383234.171] Build Date: 24 February 2010  10:51:55AM
[383234.171]  
[383234.171] Current version of pixman: 0.17.7

[383234.178] (--) PCI:*(0:1:0:0) 10de:042f:10de:0492 nVidia Corporation G86 [Quadro NVS 290] rev 161, Mem @ 0xf2000000/16777216, 0xe0000000/268435456, 0xf0000000/33554432, I/O @ 0x00002100/128

[383234.179] (II) Loading extension DRI2
[383234.179] (II) LoadModule: "nouveau"
[383234.179] (II) Loading /usr/lib/xorg/modules/drivers/nouveau_drv.so
[383234.180] (II) Module nouveau: vendor="X.Org Foundation"
[383234.180]     compiled for 1.7.99.901, module version = 0.0.15
[383234.180]     Module class: X.Org Video Driver
[383234.180]     ABI class: X.Org Video Driver, version 7.0
[383234.180] (II) NOUVEAU driver Date:   Tue Feb 23 15:08:13 2010 +1000
[383234.180] (II) NOUVEAU driver for NVIDIA chipset families :

[382273.712] (II) Primary Device is: PCI 01@00:00:0
[382273.712] drmOpenDevice: node name is /dev/dri/card0
[382273.712] drmOpenDevice: open result is 8, (OK)
[382273.712] drmOpenByBusid: Searching for BusID pci:0000:01:00.0
[382273.712] drmOpenDevice: node name is /dev/dri/card0
[382273.712] drmOpenDevice: open result is 8, (OK)
[382273.712] drmOpenByBusid: drmOpenMinor returns 8
[382273.712] drmOpenByBusid: drmGetBSection "Device"
[382273.712] (EE) [drm] failed to open device
[382273.712] (EE) No devices detected.
[382273.712] Fatal server error:
[382273.712] no screens found
>>>



File /etc/X11/xorg.conf content:

<<<
Section "Screen"
    Identifier    "SingleView0"
    Device        "NVIDIA C. Quadro NVS 290 (SingleView)"
    Monitor        "HP L1950 LCD"
    DefaultDepth    24

    Option        "TwinView"        "false"

    SubSection    "Display"
        Visual        "TrueColor"
        Depth        24
        Modes        "1024x1280 1280x1024"
        ViewPort    0 0
        Virtual        2560 1280
    EndSubSection
EndSection

Section "ServerFlags"
    Option        "DefaultServerLayout"    "SV"
    Option        "UseDefaultFontPath"    "false"
    Option        "AIGLX"            "on"
EndSection

Section "ServerLayout"
    Identifier    "SV"
    Screen        "SingleView0"        Absolute 0 0
EndSection

Section "Device"
    Identifier    "NVIDIA C. Quadro NVS 290 (SingleView)"
    VendorName    "NVIDIA Corp"
    BoardName    "Quadro NVS 290 (Rev A1)"
    Driver        "nouveau"
EndSection
>>>
