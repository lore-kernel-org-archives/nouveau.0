From: Eric Biggers <ebiggers3-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [REGRESSION] nouveau: 30 second boot hang after
 commit 2b700825e
Date: Tue, 1 Mar 2016 21:48:15 -0600
Message-ID: <20160302034815.GA2526@zzz>
References: <20160301074529.GA1870@zzz>
 <CAAVeFuLMwZ4Bq4mx5St3shcCwzN67ZPHdhBB1_WCahFwH1zXCA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="uAKRQypu60I7Lcqm"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAAVeFuLMwZ4Bq4mx5St3shcCwzN67ZPHdhBB1_WCahFwH1zXCA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org


--uAKRQypu60I7Lcqm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 02, 2016 at 12:22:30PM +0900, Alexandre Courbot wrote:
> Without the commit you mentioned, and with CONFIG_DEBUG_SHIRQ enabled,
> do you also see this error? Is it absolutely reproducable?

Yes, I bisected the problem to that individual commit.  The problem never occurs
before that commit and always occurs after that commit.  It's not intermittent.
The problem also still occurs on 4.4.2, which was where I initially noticed the
problem.

> Also, can you give more details about the X configuration? (display
> driver, PRIME configuration, how the NVIDIA GPU is used by your
> display manager, etc.)

I'm using the default configuration, which shuts down the NVIDIA GPU and only
uses the Intel GPU.  I've attached example Xorg and kernel logs for a "bad"
boot.

--uAKRQypu60I7Lcqm
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: attachment; filename="Xorg.0.log"
Content-Transfer-Encoding: quoted-printable

[     9.780]=20
X.Org X Server 1.18.0
Release Date: 2015-11-09
[     9.780] X Protocol Version 11, Revision 0
[     9.780] Build Operating System:  4.2.5-300.fc23.x86_64=20
[     9.780] Current Operating System: Linux zyxyz 4.2.0-rc8_bad+ #69 SMP=
 Tue Mar 1 21:34:45 CST 2016 x86_64
[     9.780] Kernel command line: BOOT_IMAGE=3D/vmlinuz-4.2.0-rc8_bad+ ro=
ot=3DUUID=3Da8dbfd80-1cdd-45b1-9d5d-47465b770ac1 ro rootflags=3Dsubvol=3D=
root vconsole.font=3Dlatarcyrheb-sun16 rd.luks.uuid=3Dluks-399488e6-689b-=
4a41-af3f-47fcebd8f54a rhgb quiet
[     9.780] Build Date: 16 November 2015  10:08:25AM
[     9.780] Build ID: xorg-x11-server 1.18.0-2.fc23=20
[     9.780] Current version of pixman: 0.34.0
[     9.780] 	Before reporting problems, check http://wiki.x.org
	to make sure that you have the latest version.
[     9.780] Markers: (--) probed, (**) from config file, (=3D=3D) defaul=
t setting,
	(++) from command line, (!!) notice, (II) informational,
	(WW) warning, (EE) error, (NI) not implemented, (??) unknown.
[     9.780] (=3D=3D) Log file: "/var/log/Xorg.0.log", Time: Tue Mar  1 2=
1:37:35 2016
[     9.786] (=3D=3D) Using config directory: "/etc/X11/xorg.conf.d"
[     9.786] (=3D=3D) Using system config directory "/usr/share/X11/xorg.=
conf.d"
[     9.786] (=3D=3D) No Layout section.  Using the first Screen section.
[     9.786] (=3D=3D) No screen section available. Using defaults.
[     9.786] (**) |-->Screen "Default Screen Section" (0)
[     9.786] (**) |   |-->Monitor "<default monitor>"
[     9.786] (=3D=3D) No monitor specified for screen "Default Screen Sec=
tion".
	Using a default monitor configuration.
[     9.786] (=3D=3D) Automatically adding devices
[     9.786] (=3D=3D) Automatically enabling devices
[     9.786] (=3D=3D) Automatically adding GPU devices
[     9.786] (=3D=3D) Max clients allowed: 256, resource mask: 0x1fffff
[     9.786] (=3D=3D) FontPath set to:
	catalogue:/etc/X11/fontpath.d,
	built-ins
[     9.786] (=3D=3D) ModulePath set to "/usr/lib64/xorg/modules"
[     9.786] (II) The server relies on udev to provide the list of input =
devices.
	If no devices become available, reconfigure udev or disable AutoAddDevic=
es.
[     9.786] (II) Loader magic: 0x81cde0
[     9.786] (II) Module ABI versions:
[     9.786] 	X.Org ANSI C Emulation: 0.4
[     9.786] 	X.Org Video Driver: 20.0
[     9.786] 	X.Org XInput driver : 22.1
[     9.786] 	X.Org Server Extension : 9.0
[     9.787] (++) using VT number 1

[     9.787] (II) systemd-logind: logind integration requires -keeptty an=
d -keeptty was not provided, disabling logind integration
[     9.788] (II) xfree86: Adding drm device (/dev/dri/card1)
[    14.130] (II) xfree86: Adding drm device (/dev/dri/card0)
[    14.135] (--) PCI:*(0:0:2:0) 8086:0416:17aa:221e rev 6, Mem @ 0xb1400=
000/4194304, 0xa0000000/268435456, I/O @ 0x00005000/64, BIOS @ 0x????????=
/131072
[    14.135] (--) PCI: (0:1:0:0) 10de:0ff6:17aa:221e rev 161, Mem @ 0xb00=
00000/16777216, 0x80000000/268435456, 0x90000000/33554432, I/O @ 0x000040=
00/128, BIOS @ 0x????????/524288
[    14.135] (II) LoadModule: "glx"
[    14.136] (II) Loading /usr/lib64/xorg/modules/extensions/libglx.so
[    14.152] (II) Module glx: vendor=3D"X.Org Foundation"
[    14.152] 	compiled for 1.18.0, module version =3D 1.0.0
[    14.152] 	ABI class: X.Org Server Extension, version 9.0
[    14.152] (=3D=3D) AIGLX enabled
[    14.152] (=3D=3D) Matched intel as autoconfigured driver 0
[    14.152] (=3D=3D) Matched nouveau as autoconfigured driver 1
[    14.152] (=3D=3D) Matched nv as autoconfigured driver 2
[    14.152] (=3D=3D) Matched intel as autoconfigured driver 3
[    14.152] (=3D=3D) Matched modesetting as autoconfigured driver 4
[    14.152] (=3D=3D) Matched fbdev as autoconfigured driver 5
[    14.152] (=3D=3D) Matched vesa as autoconfigured driver 6
[    14.152] (=3D=3D) Assigned the driver to the xf86ConfigLayout
[    14.152] (II) LoadModule: "intel"
[    14.152] (II) Loading /usr/lib64/xorg/modules/drivers/intel_drv.so
[    14.157] (II) Module intel: vendor=3D"X.Org Foundation"
[    14.157] 	compiled for 1.18.0, module version =3D 2.99.917
[    14.157] 	Module class: X.Org Video Driver
[    14.157] 	ABI class: X.Org Video Driver, version 20.0
[    14.157] (II) LoadModule: "nouveau"
[    14.157] (II) Loading /usr/lib64/xorg/modules/drivers/nouveau_drv.so
[    14.160] (II) Module nouveau: vendor=3D"X.Org Foundation"
[    14.160] 	compiled for 1.18.0, module version =3D 1.0.12
[    14.160] 	Module class: X.Org Video Driver
[    14.160] 	ABI class: X.Org Video Driver, version 20.0
[    14.160] (II) LoadModule: "nv"
[    14.160] (WW) Warning, couldn't open module nv
[    14.160] (II) UnloadModule: "nv"
[    14.160] (II) Unloading nv
[    14.160] (EE) Failed to load module "nv" (module does not exist, 0)
[    14.160] (II) LoadModule: "modesetting"
[    14.160] (II) Loading /usr/lib64/xorg/modules/drivers/modesetting_drv=
.so
[    14.161] (II) Module modesetting: vendor=3D"X.Org Foundation"
[    14.161] 	compiled for 1.18.0, module version =3D 1.18.0
[    14.161] 	Module class: X.Org Video Driver
[    14.161] 	ABI class: X.Org Video Driver, version 20.0
[    14.161] (II) LoadModule: "fbdev"
[    14.161] (II) Loading /usr/lib64/xorg/modules/drivers/fbdev_drv.so
[    14.161] (II) Module fbdev: vendor=3D"X.Org Foundation"
[    14.161] 	compiled for 1.17.99.901, module version =3D 0.4.3
[    14.161] 	Module class: X.Org Video Driver
[    14.161] 	ABI class: X.Org Video Driver, version 20.0
[    14.161] (II) LoadModule: "vesa"
[    14.161] (II) Loading /usr/lib64/xorg/modules/drivers/vesa_drv.so
[    14.161] (II) Module vesa: vendor=3D"X.Org Foundation"
[    14.161] 	compiled for 1.17.99.901, module version =3D 2.3.2
[    14.161] 	Module class: X.Org Video Driver
[    14.161] 	ABI class: X.Org Video Driver, version 20.0
[    14.161] (II) intel: Driver for Intel(R) Integrated Graphics Chipsets=
:
	i810, i810-dc100, i810e, i815, i830M, 845G, 854, 852GM/855GM, 865G,
	915G, E7221 (i915), 915GM, 945G, 945GM, 945GME, Pineview GM,
	Pineview G, 965G, G35, 965Q, 946GZ, 965GM, 965GME/GLE, G33, Q35, Q33,
	GM45, 4 Series, G45/G43, Q45/Q43, G41, B43
[    14.162] (II) intel: Driver for Intel(R) HD Graphics: 2000-6000
[    14.162] (II) intel: Driver for Intel(R) Iris(TM) Graphics: 5100, 610=
0
[    14.162] (II) intel: Driver for Intel(R) Iris(TM) Pro Graphics: 5200,=
 6200, P6300
[    14.162] (II) NOUVEAU driver=20
[    14.162] (II) NOUVEAU driver for NVIDIA chipset families :
[    14.162] 	RIVA TNT        (NV04)
[    14.162] 	RIVA TNT2       (NV05)
[    14.162] 	GeForce 256     (NV10)
[    14.162] 	GeForce 2       (NV11, NV15)
[    14.162] 	GeForce 4MX     (NV17, NV18)
[    14.162] 	GeForce 3       (NV20)
[    14.162] 	GeForce 4Ti     (NV25, NV28)
[    14.162] 	GeForce FX      (NV3x)
[    14.162] 	GeForce 6       (NV4x)
[    14.162] 	GeForce 7       (G7x)
[    14.162] 	GeForce 8       (G8x)
[    14.162] 	GeForce GTX 200 (NVA0)
[    14.162] 	GeForce GTX 400 (NVC0)
[    14.162] (II) modesetting: Driver for Modesetting Kernel Drivers: kms
[    14.162] (II) FBDEV: driver for framebuffer: fbdev
[    14.162] (II) VESA: driver for VESA chipsets: vesa
[    14.162] (II) intel(0): Using Kernel Mode Setting driver: i915, versi=
on 1.6.0 20150731
[    14.162] (II) [drm] nouveau interface version: 1.2.2
[    14.162] (WW) Falling back to old probe method for modesetting
[    14.163] (WW) Falling back to old probe method for fbdev
[    14.163] (II) Loading sub module "fbdevhw"
[    14.163] (II) LoadModule: "fbdevhw"
[    14.163] (II) Loading /usr/lib64/xorg/modules/libfbdevhw.so
[    14.163] (II) Module fbdevhw: vendor=3D"X.Org Foundation"
[    14.163] 	compiled for 1.18.0, module version =3D 0.0.2
[    14.163] 	ABI class: X.Org Video Driver, version 20.0
[    14.163] (WW) Falling back to old probe method for vesa
[    14.163] (--) intel(0): Integrated Graphics Chipset: Intel(R) HD Grap=
hics 4600
[    14.163] (--) intel(0): CPU: x86-64, sse2, sse3, ssse3, sse4.1, sse4.=
2, avx, avx2; using a maximum of 4 threads
[    14.163] (II) intel(0): Creating default Display subsection in Screen=
 section
	"Default Screen Section" for depth/fbbpp 24/32
[    14.163] (=3D=3D) intel(0): Depth 24, (--) framebuffer bpp 32
[    14.163] (=3D=3D) intel(0): RGB weight 888
[    14.163] (=3D=3D) intel(0): Default visual is TrueColor
[    14.163] (II) intel(0): Output VGA1 has no monitor section
[    14.163] (II) intel(0): Enabled output VGA1
[    14.163] (II) intel(0): Output DP1 has no monitor section
[    14.163] (II) intel(0): Enabled output DP1
[    14.163] (II) intel(0): Output HDMI1 has no monitor section
[    14.164] (II) intel(0): Enabled output HDMI1
[    14.164] (II) intel(0): Output DP2 has no monitor section
[    14.164] (II) intel(0): Enabled output DP2
[    14.164] (II) intel(0): Output HDMI2 has no monitor section
[    14.164] (II) intel(0): Enabled output HDMI2
[    14.164] (II) intel(0): Output DP3 has no monitor section
[    14.164] (II) intel(0): Enabled output DP3
[    14.164] (II) intel(0): Output HDMI3 has no monitor section
[    14.164] (II) intel(0): Enabled output HDMI3
[    14.164] (--) intel(0): Using a maximum size of 256x256 for hardware =
cursors
[    14.164] (II) intel(0): Output VIRTUAL1 has no monitor section
[    14.164] (II) intel(0): Enabled output VIRTUAL1
[    14.164] (--) intel(0): Output DP3 using initial mode 1920x1080 on pi=
pe 0
[    14.164] (=3D=3D) intel(0): TearFree disabled
[    14.164] (=3D=3D) intel(0): DPI set to (96, 96)
[    14.164] (II) Loading sub module "dri3"
[    14.164] (II) LoadModule: "dri3"
[    14.164] (II) Module "dri3" already built-in
[    14.164] (II) Loading sub module "dri2"
[    14.164] (II) LoadModule: "dri2"
[    14.164] (II) Module "dri2" already built-in
[    14.164] (II) Loading sub module "present"
[    14.164] (II) LoadModule: "present"
[    14.164] (II) Module "present" already built-in
[    14.164] (II) Loading sub module "dri2"
[    14.164] (II) LoadModule: "dri2"
[    14.164] (II) Module "dri2" already built-in
[    14.164] (--) NOUVEAU(G0): Chipset: "NVIDIA NVE7"
[    14.164] (=3D=3D) NOUVEAU(G0): Depth 24, (--) framebuffer bpp 32
[    14.164] (=3D=3D) NOUVEAU(G0): RGB weight 888
[    14.164] (=3D=3D) NOUVEAU(G0): Default visual is TrueColor
[    14.164] (=3D=3D) NOUVEAU(G0): Using HW cursor
[    14.164] (=3D=3D) NOUVEAU(G0): Allowed maximum DRI level 2.
[    14.164] (=3D=3D) NOUVEAU(G0): GLX sync to VBlank enabled.
[    14.164] (=3D=3D) NOUVEAU(G0): Page flipping enabled
[    14.164] (=3D=3D) NOUVEAU(G0): Swap limit set to 1 [Max allowed 2]
[    14.164] (=3D=3D) NOUVEAU(G0): Page flipping synced to vblank by kern=
el.
[    14.164] (II) NOUVEAU(G0): Initializing outputs ...
[    14.164] (II) NOUVEAU(G0): Output eDP-1-1 has no monitor section
[    14.196] (II) NOUVEAU(G0): Output DVI-D-1-1 has no monitor section
[    14.196] (II) NOUVEAU(G0): 2 crtcs needed for screen.
[    14.210] (II) NOUVEAU(G0): Allocated crtc nr. 0 to this screen.
[    14.211] (II) NOUVEAU(G0): Allocated crtc nr. 1 to this screen.
[    14.211] (II) NOUVEAU(G0): Allocated crtc nr. 2 to this screen.
[    14.211] (II) NOUVEAU(G0): Allocated crtc nr. 3 to this screen.
[    14.211] (II) NOUVEAU(G0): EDID for output eDP-1-1
[    14.243] (II) NOUVEAU(G0): EDID for output DVI-D-1-1
[    14.243] (II) NOUVEAU(G0): Using default gamma of (1.0, 1.0, 1.0) unl=
ess otherwise stated.
[    14.243] (--) NOUVEAU(G0): Virtual size is 1024x768 (pitch 0)
[    14.243] (**) NOUVEAU(G0):  Mode "1920x1080": 173.0 MHz (scaled from =
0.0 MHz), 67.2 kHz, 60.0 Hz
[    14.243] (II) NOUVEAU(G0): Modeline "1920x1080"x60.0  173.00  1920 20=
48 2248 2576  1080 1083 1088 1120 -hsync +vsync (67.2 kHz)
[    14.243] (=3D=3D) NOUVEAU(G0): DPI set to (96, 96)
[    14.243] (II) Loading sub module "fb"
[    14.243] (II) LoadModule: "fb"
[    14.243] (II) Loading /usr/lib64/xorg/modules/libfb.so
[    14.244] (II) Module fb: vendor=3D"X.Org Foundation"
[    14.244] 	compiled for 1.18.0, module version =3D 1.0.0
[    14.244] 	ABI class: X.Org ANSI C Emulation, version 0.4
[    14.244] (II) Loading sub module "shadowfb"
[    14.244] (II) LoadModule: "shadowfb"
[    14.244] (II) Loading /usr/lib64/xorg/modules/libshadowfb.so
[    14.244] (II) Module shadowfb: vendor=3D"X.Org Foundation"
[    14.244] 	compiled for 1.18.0, module version =3D 1.0.0
[    14.244] 	ABI class: X.Org ANSI C Emulation, version 0.4
[    14.244] (II) UnloadModule: "modesetting"
[    14.244] (II) Unloading modesetting
[    14.244] (II) UnloadModule: "fbdev"
[    14.244] (II) Unloading fbdev
[    14.244] (II) UnloadSubModule: "fbdevhw"
[    14.244] (II) Unloading fbdevhw
[    14.244] (II) UnloadModule: "vesa"
[    14.244] (II) Unloading vesa
[    14.244] (=3D=3D) Depth 24 pixmap format is 32 bpp
[    16.270] (II) NOUVEAU(G0): Channel setup complete.
[    18.295] (II) NOUVEAU(G0): [COPY] async initialised.
[    18.296] (II) NOUVEAU(G0): Hardware support for Present enabled
[    18.296] (II) NOUVEAU(G0): [DRI2] Setup complete
[    18.296] (II) NOUVEAU(G0): [DRI2]   DRI driver: nouveau
[    18.296] (II) NOUVEAU(G0): [DRI2]   VDPAU driver: nouveau
[    18.296] (II) Loading sub module "exa"
[    18.296] (II) LoadModule: "exa"
[    18.296] (II) Loading /usr/lib64/xorg/modules/libexa.so
[    18.297] (II) Module exa: vendor=3D"X.Org Foundation"
[    18.297] 	compiled for 1.18.0, module version =3D 2.6.0
[    18.297] 	ABI class: X.Org Video Driver, version 20.0
[    18.297] (II) EXA(256): Driver allocated offscreen pixmaps
[    18.297] (II) EXA(256): Driver registered support for the following o=
perations:
[    18.297] (II)         Solid
[    18.297] (II)         Copy
[    18.297] (II)         Composite (RENDER acceleration)
[    18.297] (II)         UploadToScreen
[    18.297] (II)         DownloadFromScreen
[    18.297] (=3D=3D) NOUVEAU(G0): Backing store enabled
[    18.297] (=3D=3D) NOUVEAU(G0): Silken mouse enabled
[    18.297] (II) NOUVEAU(G0): [XvMC] Associated with Nouveau GeForce 8/9=
 Textured Video.
[    18.297] (II) NOUVEAU(G0): [XvMC] Extension initialized.
[    18.297] (=3D=3D) NOUVEAU(G0): DPMS enabled
[    18.297] (II) NOUVEAU(G0): RandR 1.2 enabled, ignore the following Ra=
ndR disabled message.
[    18.297] (II) intel(0): SNA initialized with Haswell (gen7.5, gt2) ba=
ckend
[    18.297] (=3D=3D) intel(0): Backing store enabled
[    18.297] (=3D=3D) intel(0): Silken mouse enabled
[    18.297] (II) intel(0): HW Cursor enabled
[    18.297] (II) intel(0): RandR 1.2 enabled, ignore the following RandR=
 disabled message.
[    18.297] (=3D=3D) intel(0): DPMS enabled
[    18.297] (=3D=3D) intel(0): Display hotplug detection enabled
[    18.297] (II) intel(0): [DRI2] Setup complete
[    18.297] (II) intel(0): [DRI2]   DRI driver: i965
[    18.297] (II) intel(0): [DRI2]   VDPAU driver: va_gl
[    18.297] (II) intel(0): direct rendering: DRI2 DRI3 enabled
[    18.297] (II) intel(0): hardware support for Present enabled
[    18.297] (--) RandR disabled
[    18.300] (II) SELinux: Disabled on system
[    18.318] (II) AIGLX: enabled GLX_MESA_copy_sub_buffer
[    18.318] (II) AIGLX: enabled GLX_ARB_create_context
[    18.318] (II) AIGLX: enabled GLX_ARB_create_context_profile
[    18.318] (II) AIGLX: enabled GLX_EXT_create_context_es2_profile
[    18.318] (II) AIGLX: enabled GLX_INTEL_swap_event
[    18.318] (II) AIGLX: enabled GLX_SGI_swap_control and GLX_MESA_swap_c=
ontrol
[    18.318] (II) AIGLX: enabled GLX_EXT_framebuffer_sRGB
[    18.318] (II) AIGLX: enabled GLX_ARB_fbconfig_float
[    18.318] (II) AIGLX: GLX_EXT_texture_from_pixmap backed by buffer obj=
ects
[    18.318] (II) AIGLX: enabled GLX_ARB_create_context_robustness
[    18.318] (II) AIGLX: Loaded and initialized i965
[    18.318] (II) GLX: Initialized DRI2 GL provider for screen 0
[    48.318] (II) NOUVEAU(G0): NVEnterVT is called.
[    48.324] (II) intel(0): switch to mode 1920x1080@60.0 on DP3 using pi=
pe 0, position (0, 0), rotation normal, reflection none
[    48.324] (II) intel(0): Setting screen physical size to 508 x 285
[    48.367] (II) config/udev: Adding input device Power Button (/dev/inp=
ut/event2)
[    48.367] (**) Power Button: Applying InputClass "evdev keyboard catch=
all"
[    48.367] (**) Power Button: Applying InputClass "system-keyboard"
[    48.367] (II) LoadModule: "evdev"
[    48.367] (II) Loading /usr/lib64/xorg/modules/input/evdev_drv.so
[    48.369] (II) Module evdev: vendor=3D"X.Org Foundation"
[    48.369] 	compiled for 1.17.99.901, module version =3D 2.9.99
[    48.369] 	Module class: X.Org XInput Driver
[    48.369] 	ABI class: X.Org XInput driver, version 22.1
[    48.369] (II) Using input driver 'evdev' for 'Power Button'
[    48.369] (**) Power Button: always reports core events
[    48.369] (**) evdev: Power Button: Device: "/dev/input/event2"
[    48.369] (--) evdev: Power Button: Vendor 0 Product 0x1
[    48.369] (--) evdev: Power Button: Found keys
[    48.369] (II) evdev: Power Button: Configuring as keyboard
[    48.369] (**) Option "config_info" "udev:/sys/devices/LNXSYSTM:00/LNX=
PWRBN:00/input/input2/event2"
[    48.369] (II) XINPUT: Adding extended input device "Power Button" (ty=
pe: KEYBOARD, id 6)
[    48.369] (**) Option "xkb_rules" "evdev"
[    48.369] (**) Option "xkb_layout" "us,us"
[    48.369] (**) Option "xkb_variant" "dvorak,"
[    48.369] (**) Option "xkb_options" "grp:shifts_toggle,ctrl:ctrl_space=
_is_enter"
[    48.382] (II) config/udev: Adding input device Video Bus (/dev/input/=
event3)
[    48.382] (**) Video Bus: Applying InputClass "evdev keyboard catchall=
"
[    48.383] (**) Video Bus: Applying InputClass "system-keyboard"
[    48.383] (II) Using input driver 'evdev' for 'Video Bus'
[    48.383] (**) Video Bus: always reports core events
[    48.383] (**) evdev: Video Bus: Device: "/dev/input/event3"
[    48.383] (--) evdev: Video Bus: Vendor 0 Product 0x6
[    48.383] (--) evdev: Video Bus: Found keys
[    48.383] (II) evdev: Video Bus: Configuring as keyboard
[    48.383] (**) Option "config_info" "udev:/sys/devices/LNXSYSTM:00/LNX=
SYBUS:00/PNP0A08:00/LNXVIDEO:00/input/input3/event3"
[    48.383] (II) XINPUT: Adding extended input device "Video Bus" (type:=
 KEYBOARD, id 7)
[    48.383] (**) Option "xkb_rules" "evdev"
[    48.383] (**) Option "xkb_layout" "us,us"
[    48.383] (**) Option "xkb_variant" "dvorak,"
[    48.383] (**) Option "xkb_options" "grp:shifts_toggle,ctrl:ctrl_space=
_is_enter"
[    48.383] (II) config/udev: Adding input device Video Bus (/dev/input/=
event4)
[    48.383] (**) Video Bus: Applying InputClass "evdev keyboard catchall=
"
[    48.383] (**) Video Bus: Applying InputClass "system-keyboard"
[    48.383] (II) Using input driver 'evdev' for 'Video Bus'
[    48.383] (**) Video Bus: always reports core events
[    48.383] (**) evdev: Video Bus: Device: "/dev/input/event4"
[    48.383] (--) evdev: Video Bus: Vendor 0 Product 0x6
[    48.383] (--) evdev: Video Bus: Found keys
[    48.383] (II) evdev: Video Bus: Configuring as keyboard
[    48.383] (**) Option "config_info" "udev:/sys/devices/LNXSYSTM:00/LNX=
SYBUS:00/PNP0A08:00/device:09/LNXVIDEO:01/input/input4/event4"
[    48.383] (II) XINPUT: Adding extended input device "Video Bus" (type:=
 KEYBOARD, id 8)
[    48.383] (**) Option "xkb_rules" "evdev"
[    48.383] (**) Option "xkb_layout" "us,us"
[    48.383] (**) Option "xkb_variant" "dvorak,"
[    48.383] (**) Option "xkb_options" "grp:shifts_toggle,ctrl:ctrl_space=
_is_enter"
[    48.384] (II) config/udev: Adding input device Lid Switch (/dev/input=
/event0)
[    48.384] (II) No input driver specified, ignoring this device.
[    48.384] (II) This device may have been added with another device fil=
e.
[    48.384] (II) config/udev: Adding input device Sleep Button (/dev/inp=
ut/event1)
[    48.384] (**) Sleep Button: Applying InputClass "evdev keyboard catch=
all"
[    48.384] (**) Sleep Button: Applying InputClass "system-keyboard"
[    48.384] (II) Using input driver 'evdev' for 'Sleep Button'
[    48.384] (**) Sleep Button: always reports core events
[    48.384] (**) evdev: Sleep Button: Device: "/dev/input/event1"
[    48.384] (--) evdev: Sleep Button: Vendor 0 Product 0x3
[    48.384] (--) evdev: Sleep Button: Found keys
[    48.384] (II) evdev: Sleep Button: Configuring as keyboard
[    48.384] (**) Option "config_info" "udev:/sys/devices/LNXSYSTM:00/LNX=
SYBUS:00/PNP0C0E:00/input/input1/event1"
[    48.384] (II) XINPUT: Adding extended input device "Sleep Button" (ty=
pe: KEYBOARD, id 9)
[    48.384] (**) Option "xkb_rules" "evdev"
[    48.384] (**) Option "xkb_layout" "us,us"
[    48.384] (**) Option "xkb_variant" "dvorak,"
[    48.384] (**) Option "xkb_options" "grp:shifts_toggle,ctrl:ctrl_space=
_is_enter"
[    48.385] (II) config/udev: Adding input device HDA Intel HDMI HDMI/DP=
,pcm=3D3 (/dev/input/event11)
[    48.385] (II) No input driver specified, ignoring this device.
[    48.385] (II) This device may have been added with another device fil=
e.
[    48.385] (II) config/udev: Adding input device HDA Intel HDMI HDMI/DP=
,pcm=3D7 (/dev/input/event12)
[    48.385] (II) No input driver specified, ignoring this device.
[    48.385] (II) This device may have been added with another device fil=
e.
[    48.385] (II) config/udev: Adding input device HDA Intel HDMI HDMI/DP=
,pcm=3D8 (/dev/input/event13)
[    48.385] (II) No input driver specified, ignoring this device.
[    48.385] (II) This device may have been added with another device fil=
e.
[    48.385] (II) config/udev: Adding input device Microsoft Microsoft=AE=
 Nano Transceiver v1.0 (/dev/input/event7)
[    48.385] (**) Microsoft Microsoft=AE Nano Transceiver v1.0: Applying =
InputClass "evdev keyboard catchall"
[    48.385] (**) Microsoft Microsoft=AE Nano Transceiver v1.0: Applying =
InputClass "system-keyboard"
[    48.385] (II) Using input driver 'evdev' for 'Microsoft Microsoft=AE =
Nano Transceiver v1.0'
[    48.385] (**) Microsoft Microsoft=AE Nano Transceiver v1.0: always re=
ports core events
[    48.385] (**) evdev: Microsoft Microsoft=AE Nano Transceiver v1.0: De=
vice: "/dev/input/event7"
[    48.385] (--) evdev: Microsoft Microsoft=AE Nano Transceiver v1.0: Ve=
ndor 0x45e Product 0x7b2
[    48.385] (--) evdev: Microsoft Microsoft=AE Nano Transceiver v1.0: Fo=
und keys
[    48.385] (II) evdev: Microsoft Microsoft=AE Nano Transceiver v1.0: Co=
nfiguring as keyboard
[    48.385] (**) Option "config_info" "udev:/sys/devices/pci0000:00/0000=
:00:14.0/usb1/1-6/1-6:1.0/0003:045E:07B2.0001/input/input9/event7"
[    48.385] (II) XINPUT: Adding extended input device "Microsoft Microso=
ft=AE Nano Transceiver v1.0" (type: KEYBOARD, id 10)
[    48.385] (**) Option "xkb_rules" "evdev"
[    48.385] (**) Option "xkb_layout" "us,us"
[    48.385] (**) Option "xkb_variant" "dvorak,"
[    48.385] (**) Option "xkb_options" "grp:shifts_toggle,ctrl:ctrl_space=
_is_enter"
[    48.386] (II) config/udev: Adding input device Microsoft Microsoft=AE=
 Nano Transceiver v1.0 (/dev/input/event8)
[    48.386] (**) Microsoft Microsoft=AE Nano Transceiver v1.0: Applying =
InputClass "evdev pointer catchall"
[    48.386] (II) Using input driver 'evdev' for 'Microsoft Microsoft=AE =
Nano Transceiver v1.0'
[    48.386] (**) Microsoft Microsoft=AE Nano Transceiver v1.0: always re=
ports core events
[    48.386] (**) evdev: Microsoft Microsoft=AE Nano Transceiver v1.0: De=
vice: "/dev/input/event8"
[    48.437] (--) evdev: Microsoft Microsoft=AE Nano Transceiver v1.0: Ve=
ndor 0x45e Product 0x7b2
[    48.437] (--) evdev: Microsoft Microsoft=AE Nano Transceiver v1.0: Fo=
und 9 mouse buttons
[    48.437] (--) evdev: Microsoft Microsoft=AE Nano Transceiver v1.0: Fo=
und scroll wheel(s)
[    48.437] (--) evdev: Microsoft Microsoft=AE Nano Transceiver v1.0: Fo=
und relative axes
[    48.437] (--) evdev: Microsoft Microsoft=AE Nano Transceiver v1.0: Fo=
und x and y relative axes
[    48.437] (II) evdev: Microsoft Microsoft=AE Nano Transceiver v1.0: Co=
nfiguring as mouse
[    48.437] (II) evdev: Microsoft Microsoft=AE Nano Transceiver v1.0: Ad=
ding scrollwheel support
[    48.437] (**) evdev: Microsoft Microsoft=AE Nano Transceiver v1.0: YA=
xisMapping: buttons 4 and 5
[    48.437] (**) evdev: Microsoft Microsoft=AE Nano Transceiver v1.0: Em=
ulateWheelButton: 4, EmulateWheelInertia: 10, EmulateWheelTimeout: 200
[    48.437] (**) Option "config_info" "udev:/sys/devices/pci0000:00/0000=
:00:14.0/usb1/1-6/1-6:1.1/0003:045E:07B2.0002/input/input10/event8"
[    48.437] (II) XINPUT: Adding extended input device "Microsoft Microso=
ft=AE Nano Transceiver v1.0" (type: MOUSE, id 11)
[    48.437] (II) evdev: Microsoft Microsoft=AE Nano Transceiver v1.0: in=
itialized for relative axes.
[    48.437] (**) Microsoft Microsoft=AE Nano Transceiver v1.0: (accel) k=
eeping acceleration scheme 1
[    48.437] (**) Microsoft Microsoft=AE Nano Transceiver v1.0: (accel) a=
cceleration profile 0
[    48.437] (**) Microsoft Microsoft=AE Nano Transceiver v1.0: (accel) a=
cceleration factor: 2.000
[    48.437] (**) Microsoft Microsoft=AE Nano Transceiver v1.0: (accel) a=
cceleration threshold: 4
[    48.437] (II) config/udev: Adding input device Microsoft Microsoft=AE=
 Nano Transceiver v1.0 (/dev/input/mouse0)
[    48.437] (II) No input driver specified, ignoring this device.
[    48.437] (II) This device may have been added with another device fil=
e.
[    48.438] (II) config/udev: Adding input device Microsoft Microsoft=AE=
 Nano Transceiver v1.0 (/dev/input/event9)
[    48.438] (**) Microsoft Microsoft=AE Nano Transceiver v1.0: Applying =
InputClass "evdev keyboard catchall"
[    48.438] (**) Microsoft Microsoft=AE Nano Transceiver v1.0: Applying =
InputClass "system-keyboard"
[    48.438] (II) Using input driver 'evdev' for 'Microsoft Microsoft=AE =
Nano Transceiver v1.0'
[    48.438] (**) Microsoft Microsoft=AE Nano Transceiver v1.0: always re=
ports core events
[    48.438] (**) evdev: Microsoft Microsoft=AE Nano Transceiver v1.0: De=
vice: "/dev/input/event9"
[    48.438] (--) evdev: Microsoft Microsoft=AE Nano Transceiver v1.0: Ve=
ndor 0x45e Product 0x7b2
[    48.438] (--) evdev: Microsoft Microsoft=AE Nano Transceiver v1.0: Fo=
und 1 mouse buttons
[    48.438] (--) evdev: Microsoft Microsoft=AE Nano Transceiver v1.0: Fo=
und scroll wheel(s)
[    48.438] (--) evdev: Microsoft Microsoft=AE Nano Transceiver v1.0: Fo=
und relative axes
[    48.438] (--) evdev: Microsoft Microsoft=AE Nano Transceiver v1.0: Fo=
und absolute axes
[    48.438] (--) evdev: Microsoft Microsoft=AE Nano Transceiver v1.0: Fo=
und absolute multitouch axes
[    48.438] (--) evdev: Microsoft Microsoft=AE Nano Transceiver v1.0: Fa=
ke MT device detected
[    48.438] (--) evdev: Microsoft Microsoft=AE Nano Transceiver v1.0: Fo=
und x and y absolute axes
[    48.438] (--) evdev: Microsoft Microsoft=AE Nano Transceiver v1.0: Fo=
und keys
[    48.438] (II) evdev: Microsoft Microsoft=AE Nano Transceiver v1.0: Fo=
rcing relative x/y axes to exist.
[    48.438] (II) evdev: Microsoft Microsoft=AE Nano Transceiver v1.0: Co=
nfiguring as mouse
[    48.438] (II) evdev: Microsoft Microsoft=AE Nano Transceiver v1.0: Co=
nfiguring as keyboard
[    48.438] (II) evdev: Microsoft Microsoft=AE Nano Transceiver v1.0: Ad=
ding scrollwheel support
[    48.438] (**) evdev: Microsoft Microsoft=AE Nano Transceiver v1.0: YA=
xisMapping: buttons 4 and 5
[    48.438] (**) evdev: Microsoft Microsoft=AE Nano Transceiver v1.0: Em=
ulateWheelButton: 4, EmulateWheelInertia: 10, EmulateWheelTimeout: 200
[    48.438] (**) Option "config_info" "udev:/sys/devices/pci0000:00/0000=
:00:14.0/usb1/1-6/1-6:1.2/0003:045E:07B2.0003/input/input11/event9"
[    48.438] (II) XINPUT: Adding extended input device "Microsoft Microso=
ft=AE Nano Transceiver v1.0" (type: KEYBOARD, id 12)
[    48.438] (**) Option "xkb_rules" "evdev"
[    48.438] (**) Option "xkb_layout" "us,us"
[    48.438] (**) Option "xkb_variant" "dvorak,"
[    48.438] (**) Option "xkb_options" "grp:shifts_toggle,ctrl:ctrl_space=
_is_enter"
[    48.438] (II) evdev: Microsoft Microsoft=AE Nano Transceiver v1.0: in=
itialized for relative axes.
[    48.438] (WW) evdev: Microsoft Microsoft=AE Nano Transceiver v1.0: ig=
noring absolute axes.
[    48.438] (**) Microsoft Microsoft=AE Nano Transceiver v1.0: (accel) k=
eeping acceleration scheme 1
[    48.438] (**) Microsoft Microsoft=AE Nano Transceiver v1.0: (accel) a=
cceleration profile 0
[    48.438] (**) Microsoft Microsoft=AE Nano Transceiver v1.0: (accel) a=
cceleration factor: 2.000
[    48.438] (**) Microsoft Microsoft=AE Nano Transceiver v1.0: (accel) a=
cceleration threshold: 4
[    48.438] (II) config/udev: Adding input device HDA Intel PCH Dock Mic=
 (/dev/input/event14)
[    48.439] (II) No input driver specified, ignoring this device.
[    48.439] (II) This device may have been added with another device fil=
e.
[    48.439] (II) config/udev: Adding input device HDA Intel PCH Mic (/de=
v/input/event15)
[    48.439] (II) No input driver specified, ignoring this device.
[    48.439] (II) This device may have been added with another device fil=
e.
[    48.439] (II) config/udev: Adding input device HDA Intel PCH Dock Hea=
dphone (/dev/input/event16)
[    48.439] (II) No input driver specified, ignoring this device.
[    48.439] (II) This device may have been added with another device fil=
e.
[    48.439] (II) config/udev: Adding input device HDA Intel PCH Headphon=
e (/dev/input/event17)
[    48.439] (II) No input driver specified, ignoring this device.
[    48.439] (II) This device may have been added with another device fil=
e.
[    48.439] (II) config/udev: Adding input device AT Translated Set 2 ke=
yboard (/dev/input/event5)
[    48.439] (**) AT Translated Set 2 keyboard: Applying InputClass "evde=
v keyboard catchall"
[    48.439] (**) AT Translated Set 2 keyboard: Applying InputClass "syst=
em-keyboard"
[    48.439] (II) Using input driver 'evdev' for 'AT Translated Set 2 key=
board'
[    48.439] (**) AT Translated Set 2 keyboard: always reports core event=
s
[    48.439] (**) evdev: AT Translated Set 2 keyboard: Device: "/dev/inpu=
t/event5"
[    48.439] (--) evdev: AT Translated Set 2 keyboard: Vendor 0x1 Product=
 0x1
[    48.439] (--) evdev: AT Translated Set 2 keyboard: Found keys
[    48.439] (II) evdev: AT Translated Set 2 keyboard: Configuring as key=
board
[    48.439] (**) Option "config_info" "udev:/sys/devices/platform/i8042/=
serio0/input/input5/event5"
[    48.439] (II) XINPUT: Adding extended input device "AT Translated Set=
 2 keyboard" (type: KEYBOARD, id 13)
[    48.439] (**) Option "xkb_rules" "evdev"
[    48.439] (**) Option "xkb_layout" "us,us"
[    48.439] (**) Option "xkb_variant" "dvorak,"
[    48.439] (**) Option "xkb_options" "grp:shifts_toggle,ctrl:ctrl_space=
_is_enter"
[    48.440] (II) config/udev: Adding input device SynPS/2 Synaptics Touc=
hPad (/dev/input/event10)
[    48.440] (**) SynPS/2 Synaptics TouchPad: Applying InputClass "evdev =
touchpad catchall"
[    48.440] (**) SynPS/2 Synaptics TouchPad: Applying InputClass "touchp=
ad catchall"
[    48.440] (**) SynPS/2 Synaptics TouchPad: Applying InputClass "Defaul=
t clickpad buttons"
[    48.440] (**) SynPS/2 Synaptics TouchPad: Applying InputClass "Lenovo=
 TrackPoint top software buttons"
[    48.440] (**) SynPS/2 Synaptics TouchPad: Applying InputClass "touchp=
ad catchall"
[    48.440] (II) LoadModule: "synaptics"
[    48.440] (II) Loading /usr/lib64/xorg/modules/input/synaptics_drv.so
[    48.441] (II) Module synaptics: vendor=3D"X.Org Foundation"
[    48.441] 	compiled for 1.17.99.901, module version =3D 1.8.3
[    48.441] 	Module class: X.Org XInput Driver
[    48.441] 	ABI class: X.Org XInput driver, version 22.1
[    48.441] (II) Using input driver 'synaptics' for 'SynPS/2 Synaptics T=
ouchPad'
[    48.441] (**) SynPS/2 Synaptics TouchPad: always reports core events
[    48.441] (**) Option "Device" "/dev/input/event10"
[    48.469] (II) synaptics: SynPS/2 Synaptics TouchPad: found clickpad p=
roperty
[    48.469] (II) synaptics: SynPS/2 Synaptics TouchPad: found top button=
pad property
[    48.469] (--) synaptics: SynPS/2 Synaptics TouchPad: x-axis range 102=
4 - 5112 (res 42)
[    48.469] (--) synaptics: SynPS/2 Synaptics TouchPad: y-axis range 202=
4 - 4832 (res 42)
[    48.469] (--) synaptics: SynPS/2 Synaptics TouchPad: pressure range 0=
 - 255
[    48.469] (--) synaptics: SynPS/2 Synaptics TouchPad: finger width ran=
ge 0 - 15
[    48.469] (--) synaptics: SynPS/2 Synaptics TouchPad: buttons: left do=
uble triple
[    48.469] (--) synaptics: SynPS/2 Synaptics TouchPad: Vendor 0x2 Produ=
ct 0x7
[    48.469] (**) Option "HorizHysteresis" "50"
[    48.469] (**) Option "VertHysteresis" "50"
[    48.469] (**) Option "HasSecondarySoftButtons" "on"
[    48.469] (**) Option "TapButton1" "1"
[    48.469] (**) Option "TapButton2" "2"
[    48.469] (**) Option "TapButton3" "3"
[    48.469] (**) Option "PalmDetect" "on"
[    48.469] (**) Option "PalmMinWidth" "5"
[    48.469] (**) Option "PalmMinZ" "40"
[    48.469] (**) Option "MinSpeed" "0.7"
[    48.469] (**) Option "MaxSpeed" "3.0"
[    48.469] (**) Option "AccelFactor" "0.5"
[    48.469] (**) Option "SoftButtonAreas" "50% 0 0 28% 0 0 0 0"
[    48.469] (**) Option "SecondarySoftButtonAreas" "50% 0 72% 0 0 0 0 0"
[    48.469] (--) synaptics: SynPS/2 Synaptics TouchPad: touchpad found
[    48.469] (**) SynPS/2 Synaptics TouchPad: always reports core events
[    48.481] (**) Option "config_info" "udev:/sys/devices/platform/i8042/=
serio1/input/input7/event10"
[    48.481] (II) XINPUT: Adding extended input device "SynPS/2 Synaptics=
 TouchPad" (type: TOUCHPAD, id 14)
[    48.481] (**) synaptics: SynPS/2 Synaptics TouchPad: (accel) MinSpeed=
 is now constant deceleration 1.4
[    48.481] (**) synaptics: SynPS/2 Synaptics TouchPad: (accel) MaxSpeed=
 is now 4.29
[    48.481] (**) synaptics: SynPS/2 Synaptics TouchPad: (accel) AccelFac=
tor is now 0.500
[    48.481] (**) SynPS/2 Synaptics TouchPad: (accel) keeping acceleratio=
n scheme 1
[    48.481] (**) SynPS/2 Synaptics TouchPad: (accel) acceleration profil=
e 1
[    48.481] (**) SynPS/2 Synaptics TouchPad: (accel) acceleration factor=
: 2.000
[    48.481] (**) SynPS/2 Synaptics TouchPad: (accel) acceleration thresh=
old: 4
[    48.481] (--) synaptics: SynPS/2 Synaptics TouchPad: touchpad found
[    48.481] (II) config/udev: Adding input device SynPS/2 Synaptics Touc=
hPad (/dev/input/mouse1)
[    48.481] (II) No input driver specified, ignoring this device.
[    48.481] (II) This device may have been added with another device fil=
e.
[    48.481] (II) config/udev: Adding input device TPPS/2 IBM TrackPoint =
(/dev/input/event18)
[    48.481] (**) TPPS/2 IBM TrackPoint: Applying InputClass "evdev point=
er catchall"
[    48.481] (II) Using input driver 'evdev' for 'TPPS/2 IBM TrackPoint'
[    48.481] (**) TPPS/2 IBM TrackPoint: always reports core events
[    48.481] (**) evdev: TPPS/2 IBM TrackPoint: Device: "/dev/input/event=
18"
[    48.481] (--) evdev: TPPS/2 IBM TrackPoint: Vendor 0x2 Product 0xa
[    48.481] (--) evdev: TPPS/2 IBM TrackPoint: Found 3 mouse buttons
[    48.481] (--) evdev: TPPS/2 IBM TrackPoint: Found relative axes
[    48.481] (--) evdev: TPPS/2 IBM TrackPoint: Found x and y relative ax=
es
[    48.481] (II) evdev: TPPS/2 IBM TrackPoint: Configuring as mouse
[    48.481] (**) evdev: TPPS/2 IBM TrackPoint: YAxisMapping: buttons 4 a=
nd 5
[    48.481] (**) evdev: TPPS/2 IBM TrackPoint: EmulateWheelButton: 4, Em=
ulateWheelInertia: 10, EmulateWheelTimeout: 200
[    48.481] (**) Option "config_info" "udev:/sys/devices/platform/i8042/=
serio1/serio2/input/input12/event18"
[    48.481] (II) XINPUT: Adding extended input device "TPPS/2 IBM TrackP=
oint" (type: MOUSE, id 15)
[    48.481] (II) evdev: TPPS/2 IBM TrackPoint: initialized for relative =
axes.
[    48.482] (**) TPPS/2 IBM TrackPoint: (accel) keeping acceleration sch=
eme 1
[    48.482] (**) TPPS/2 IBM TrackPoint: (accel) acceleration profile 0
[    48.482] (**) TPPS/2 IBM TrackPoint: (accel) acceleration factor: 2.0=
00
[    48.482] (**) TPPS/2 IBM TrackPoint: (accel) acceleration threshold: =
4
[    48.482] (II) config/udev: Adding input device TPPS/2 IBM TrackPoint =
(/dev/input/mouse2)
[    48.482] (II) No input driver specified, ignoring this device.
[    48.482] (II) This device may have been added with another device fil=
e.
[    48.482] (II) config/udev: Adding input device ThinkPad Extra Buttons=
 (/dev/input/event6)
[    48.482] (**) ThinkPad Extra Buttons: Applying InputClass "evdev keyb=
oard catchall"
[    48.482] (**) ThinkPad Extra Buttons: Applying InputClass "system-key=
board"
[    48.482] (II) Using input driver 'evdev' for 'ThinkPad Extra Buttons'
[    48.482] (**) ThinkPad Extra Buttons: always reports core events
[    48.482] (**) evdev: ThinkPad Extra Buttons: Device: "/dev/input/even=
t6"
[    48.482] (--) evdev: ThinkPad Extra Buttons: Vendor 0x17aa Product 0x=
5054
[    48.482] (--) evdev: ThinkPad Extra Buttons: Found keys
[    48.482] (II) evdev: ThinkPad Extra Buttons: Configuring as keyboard
[    48.482] (**) Option "config_info" "udev:/sys/devices/platform/thinkp=
ad_acpi/input/input8/event6"
[    48.482] (II) XINPUT: Adding extended input device "ThinkPad Extra Bu=
ttons" (type: KEYBOARD, id 16)
[    48.482] (**) Option "xkb_rules" "evdev"
[    48.482] (**) Option "xkb_layout" "us,us"
[    48.482] (**) Option "xkb_variant" "dvorak,"
[    48.482] (**) Option "xkb_options" "grp:shifts_toggle,ctrl:ctrl_space=
_is_enter"

--uAKRQypu60I7Lcqm
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: attachment; filename=dmesg
Content-Transfer-Encoding: quoted-printable

[    0.000000] Initializing cgroup subsys cpu
[    0.000000] Linux version 4.2.0-rc8_bad+ (eric.biggers@zyxyz) (gcc ver=
sion 5.3.1 20151207 (Red Hat 5.3.1-2) (GCC) ) #69 SMP Tue Mar 1 21:34:45 =
CST 2016
[    0.000000] Command line: BOOT_IMAGE=3D/vmlinuz-4.2.0-rc8_bad+ root=3D=
UUID=3Da8dbfd80-1cdd-45b1-9d5d-47465b770ac1 ro rootflags=3Dsubvol=3Droot =
vconsole.font=3Dlatarcyrheb-sun16 rd.luks.uuid=3Dluks-399488e6-689b-4a41-=
af3f-47fcebd8f54a rhgb quiet
[    0.000000] KERNEL supported cpus:
[    0.000000]   Intel GenuineIntel
[    0.000000] x86/fpu: xstate_offset[2]: 0240, xstate_sizes[2]: 0100
[    0.000000] x86/fpu: Supporting XSAVE feature 0x01: 'x87 floating poin=
t registers'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x02: 'SSE registers'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x04: 'AVX registers'
[    0.000000] x86/fpu: Enabled xstate features 0x7, context size is 0x34=
0 bytes, using 'standard' format.
[    0.000000] x86/fpu: Using 'eager' FPU context switches.
[    0.000000] e820: BIOS-provided physical RAM map:
[    0.000000] BIOS-e820: [mem 0x0000000000000000-0x0000000000057fff] usa=
ble
[    0.000000] BIOS-e820: [mem 0x0000000000058000-0x0000000000058fff] res=
erved
[    0.000000] BIOS-e820: [mem 0x0000000000059000-0x000000000009bfff] usa=
ble
[    0.000000] BIOS-e820: [mem 0x000000000009c000-0x000000000009cfff] res=
erved
[    0.000000] BIOS-e820: [mem 0x000000000009d000-0x000000000009dfff] usa=
ble
[    0.000000] BIOS-e820: [mem 0x000000000009e000-0x00000000000bffff] res=
erved
[    0.000000] BIOS-e820: [mem 0x0000000000100000-0x000000006a0d5fff] usa=
ble
[    0.000000] BIOS-e820: [mem 0x000000006a0d6000-0x000000006a2d7fff] res=
erved
[    0.000000] BIOS-e820: [mem 0x000000006a2d8000-0x000000007a3a9fff] usa=
ble
[    0.000000] BIOS-e820: [mem 0x000000007a3aa000-0x000000007cd2efff] res=
erved
[    0.000000] BIOS-e820: [mem 0x000000007cd2f000-0x000000007ce7efff] ACP=
I NVS
[    0.000000] BIOS-e820: [mem 0x000000007ce7f000-0x000000007cefefff] ACP=
I data
[    0.000000] BIOS-e820: [mem 0x000000007ceff000-0x000000007cefffff] usa=
ble
[    0.000000] BIOS-e820: [mem 0x000000007cf00000-0x000000007f9fffff] res=
erved
[    0.000000] BIOS-e820: [mem 0x00000000b8000000-0x00000000f7ffffff] res=
erved
[    0.000000] BIOS-e820: [mem 0x00000000f80f8000-0x00000000f80f8fff] res=
erved
[    0.000000] BIOS-e820: [mem 0x00000000fed1c000-0x00000000fed1ffff] res=
erved
[    0.000000] BIOS-e820: [mem 0x0000000100000000-0x000000047e5fffff] usa=
ble
[    0.000000] NX (Execute Disable) protection: active
[    0.000000] e820: update [mem 0x6b75d018-0x6b76d057] usable =3D=3D> us=
able
[    0.000000] e820: update [mem 0x6b745018-0x6b75c657] usable =3D=3D> us=
able
[    0.000000] e820: update [mem 0x6b734018-0x6b744657] usable =3D=3D> us=
able
[    0.000000] extended physical RAM map:
[    0.000000] reserve setup_data: [mem 0x0000000000000000-0x000000000005=
7fff] usable
[    0.000000] reserve setup_data: [mem 0x0000000000058000-0x000000000005=
8fff] reserved
[    0.000000] reserve setup_data: [mem 0x0000000000059000-0x000000000009=
bfff] usable
[    0.000000] reserve setup_data: [mem 0x000000000009c000-0x000000000009=
cfff] reserved
[    0.000000] reserve setup_data: [mem 0x000000000009d000-0x000000000009=
dfff] usable
[    0.000000] reserve setup_data: [mem 0x000000000009e000-0x00000000000b=
ffff] reserved
[    0.000000] reserve setup_data: [mem 0x0000000000100000-0x000000006a0d=
5fff] usable
[    0.000000] reserve setup_data: [mem 0x000000006a0d6000-0x000000006a2d=
7fff] reserved
[    0.000000] reserve setup_data: [mem 0x000000006a2d8000-0x000000006b73=
4017] usable
[    0.000000] reserve setup_data: [mem 0x000000006b734018-0x000000006b74=
4657] usable
[    0.000000] reserve setup_data: [mem 0x000000006b744658-0x000000006b74=
5017] usable
[    0.000000] reserve setup_data: [mem 0x000000006b745018-0x000000006b75=
c657] usable
[    0.000000] reserve setup_data: [mem 0x000000006b75c658-0x000000006b75=
d017] usable
[    0.000000] reserve setup_data: [mem 0x000000006b75d018-0x000000006b76=
d057] usable
[    0.000000] reserve setup_data: [mem 0x000000006b76d058-0x000000007a3a=
9fff] usable
[    0.000000] reserve setup_data: [mem 0x000000007a3aa000-0x000000007cd2=
efff] reserved
[    0.000000] reserve setup_data: [mem 0x000000007cd2f000-0x000000007ce7=
efff] ACPI NVS
[    0.000000] reserve setup_data: [mem 0x000000007ce7f000-0x000000007cef=
efff] ACPI data
[    0.000000] reserve setup_data: [mem 0x000000007ceff000-0x000000007cef=
ffff] usable
[    0.000000] reserve setup_data: [mem 0x000000007cf00000-0x000000007f9f=
ffff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000b8000000-0x00000000f7ff=
ffff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000f80f8000-0x00000000f80f=
8fff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000fed1c000-0x00000000fed1=
ffff] reserved
[    0.000000] reserve setup_data: [mem 0x0000000100000000-0x000000047e5f=
ffff] usable
[    0.000000] efi: EFI v2.31 by Lenovo
[    0.000000] efi:  ACPI=3D0x7cefe000  ACPI 2.0=3D0x7cefe014  SMBIOS=3D0=
x7cd2e000=20
[    0.000000] SMBIOS 2.7 present.
[    0.000000] DMI: LENOVO 20BGCTO1WW/20BGCTO1WW, BIOS GNET62WW (2.10 ) 0=
2/26/2014
[    0.000000] e820: update [mem 0x00000000-0x00000fff] usable =3D=3D> re=
served
[    0.000000] e820: remove [mem 0x000a0000-0x000fffff] usable
[    0.000000] e820: last_pfn =3D 0x47e600 max_arch_pfn =3D 0x400000000
[    0.000000] MTRR default type: write-back
[    0.000000] MTRR fixed ranges enabled:
[    0.000000]   00000-9FFFF write-back
[    0.000000]   A0000-BFFFF uncachable
[    0.000000]   C0000-FFFFF write-protect
[    0.000000] MTRR variable ranges enabled:
[    0.000000]   0 base 0080000000 mask 7F80000000 uncachable
[    0.000000]   1 base 007E000000 mask 7FFE000000 uncachable
[    0.000000]   2 base 007D000000 mask 7FFF000000 uncachable
[    0.000000]   3 base 007CF00000 mask 7FFFF00000 uncachable
[    0.000000]   4 disabled
[    0.000000]   5 disabled
[    0.000000]   6 disabled
[    0.000000]   7 disabled
[    0.000000]   8 disabled
[    0.000000]   9 disabled
[    0.000000] x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WC  UC- =
WT =20
[    0.000000] e820: last_pfn =3D 0x7cf00 max_arch_pfn =3D 0x400000000
[    0.000000] Base memory trampoline at [ffff880000096000] 96000 size 24=
576
[    0.000000] Using GB pages for direct mapping
[    0.000000] init_memory_mapping: [mem 0x00000000-0x000fffff]
[    0.000000]  [mem 0x00000000-0x000fffff] page 4k
[    0.000000] BRK [0x21ebb000, 0x21ebbfff] PGTABLE
[    0.000000] BRK [0x21ebc000, 0x21ebcfff] PGTABLE
[    0.000000] BRK [0x21ebd000, 0x21ebdfff] PGTABLE
[    0.000000] init_memory_mapping: [mem 0x47e400000-0x47e5fffff]
[    0.000000]  [mem 0x47e400000-0x47e5fffff] page 2M
[    0.000000] BRK [0x21ebe000, 0x21ebefff] PGTABLE
[    0.000000] init_memory_mapping: [mem 0x460000000-0x47e3fffff]
[    0.000000]  [mem 0x460000000-0x47e3fffff] page 2M
[    0.000000] init_memory_mapping: [mem 0x440000000-0x45fffffff]
[    0.000000]  [mem 0x440000000-0x45fffffff] page 2M
[    0.000000] init_memory_mapping: [mem 0x00100000-0x6a0d5fff]
[    0.000000]  [mem 0x00100000-0x001fffff] page 4k
[    0.000000]  [mem 0x00200000-0x69ffffff] page 2M
[    0.000000]  [mem 0x6a000000-0x6a0d5fff] page 4k
[    0.000000] init_memory_mapping: [mem 0x6a2d8000-0x7a3a9fff]
[    0.000000]  [mem 0x6a2d8000-0x6a3fffff] page 4k
[    0.000000]  [mem 0x6a400000-0x7a1fffff] page 2M
[    0.000000]  [mem 0x7a200000-0x7a3a9fff] page 4k
[    0.000000] BRK [0x21ebf000, 0x21ebffff] PGTABLE
[    0.000000] BRK [0x21ec0000, 0x21ec0fff] PGTABLE
[    0.000000] init_memory_mapping: [mem 0x7ceff000-0x7cefffff]
[    0.000000]  [mem 0x7ceff000-0x7cefffff] page 4k
[    0.000000] init_memory_mapping: [mem 0x100000000-0x43fffffff]
[    0.000000]  [mem 0x100000000-0x43fffffff] page 1G
[    0.000000] RAMDISK: [mem 0x3eee9000-0x3fffafff]
[    0.000000] ACPI: Early table checksum verification disabled
[    0.000000] ACPI: RSDP 0x000000007CEFE014 000024 (v02 LENOVO)
[    0.000000] ACPI: XSDT 0x000000007CEFE170 0000E4 (v01 LENOVO TP-GN    =
00002100 PTEC 00000002)
[    0.000000] ACPI: FACP 0x000000007CEF9000 00010C (v05 LENOVO TP-GN    =
00002100 PTEC 00000002)
[    0.000000] ACPI: DSDT 0x000000007CEE1000 0120D4 (v01 LENOVO TP-GN    =
00002100 INTL 20120711)
[    0.000000] ACPI: FACS 0x000000007CE42000 000040
[    0.000000] ACPI: DBGP 0x000000007CEFC000 000034 (v01 LENOVO TP-GN    =
00002100 PTEC 00000002)
[    0.000000] ACPI: ECDT 0x000000007CEFB000 000052 (v01 LENOVO TP-GN    =
00002100 PTEC 00000002)
[    0.000000] ACPI: HPET 0x000000007CEF8000 000038 (v01 LENOVO TP-GN    =
00002100 PTEC 00000002)
[    0.000000] ACPI: APIC 0x000000007CEF7000 000098 (v01 LENOVO TP-GN    =
00002100 PTEC 00000002)
[    0.000000] ACPI: MCFG 0x000000007CEF6000 00003C (v01 LENOVO TP-GN    =
00002100 PTEC 00000002)
[    0.000000] ACPI: SSDT 0x000000007CEF5000 000033 (v01 LENOVO TP-SSDT1 =
00000100 INTL 20120711)
[    0.000000] ACPI: SSDT 0x000000007CEF4000 00044F (v01 LENOVO TP-SSDT2 =
00000200 INTL 20120711)
[    0.000000] ACPI: SSDT 0x000000007CEE0000 000B78 (v01 LENOVO SataAhci =
00001000 INTL 20120711)
[    0.000000] ACPI: SSDT 0x000000007CEDF000 0007E7 (v01 LENOVO Cpu0Ist  =
00003000 INTL 20120711)
[    0.000000] ACPI: SSDT 0x000000007CEDE000 000AD8 (v01 LENOVO CpuPm    =
00003000 INTL 20120711)
[    0.000000] ACPI: SSDT 0x000000007CEDC000 001215 (v01 LENOVO SaSsdt   =
00003000 INTL 20120711)
[    0.000000] ACPI: SSDT 0x000000007CEDB000 000379 (v01 LENOVO CppcTabl =
00001000 INTL 20120711)
[    0.000000] ACPI: PCCT 0x000000007CEDA000 00006E (v05 LENOVO TP-GN    =
00002100 PTEC 00000002)
[    0.000000] ACPI: SSDT 0x000000007CED9000 000AC4 (v01 LENOVO Cpc_Tabl =
00001000 INTL 20120711)
[    0.000000] ACPI: TCPA 0x000000007CED8000 000032 (v02 PTL    LENOVO   =
06040000 LNVO 00000001)
[    0.000000] ACPI: UEFI 0x000000007CED7000 000042 (v01 LENOVO TP-GN    =
00002100 PTEC 00000002)
[    0.000000] ACPI: MSDM 0x000000007CDAA000 000055 (v03 LENOVO TP-GN    =
00002100 PTEC 00000002)
[    0.000000] ACPI: ASF! 0x000000007CEFD000 0000A5 (v32 LENOVO TP-GN    =
00002100 PTEC 00000002)
[    0.000000] ACPI: BATB 0x000000007CED6000 000046 (v01 LENOVO TP-GN    =
00002100 PTEC 00000002)
[    0.000000] ACPI: FPDT 0x000000007CED5000 000064 (v01 LENOVO TP-GN    =
00002100 PTEC 00000002)
[    0.000000] ACPI: UEFI 0x000000007CED4000 0002E2 (v01 LENOVO TP-GN    =
00002100 PTEC 00000002)
[    0.000000] ACPI: SSDT 0x000000007CED3000 00047F (v01 LENOVO IsctTabl =
00001000 INTL 20120711)
[    0.000000] ACPI: BGRT 0x000000007CED2000 000038 (v01 LENOVO TP-GN    =
00002100 PTEC 00000002)
[    0.000000] ACPI: Local APIC address 0xfee00000
[    0.000000] No NUMA configuration found
[    0.000000] Faking a node at [mem 0x0000000000000000-0x000000047e5ffff=
f]
[    0.000000] NODE_DATA(0) allocated [mem 0x47e5e9000-0x47e5fcfff]
[    0.000000]  [ffffea0000000000-ffffea0011ffffff] PMD -> [ffff88046dc00=
000-ffff88047dbfffff] on node 0
[    0.000000] Zone ranges:
[    0.000000]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
[    0.000000]   DMA32    [mem 0x0000000001000000-0x00000000ffffffff]
[    0.000000]   Normal   [mem 0x0000000100000000-0x000000047e5fffff]
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000000001000-0x0000000000057fff]
[    0.000000]   node   0: [mem 0x0000000000059000-0x000000000009bfff]
[    0.000000]   node   0: [mem 0x000000000009d000-0x000000000009dfff]
[    0.000000]   node   0: [mem 0x0000000000100000-0x000000006a0d5fff]
[    0.000000]   node   0: [mem 0x000000006a2d8000-0x000000007a3a9fff]
[    0.000000]   node   0: [mem 0x000000007ceff000-0x000000007cefffff]
[    0.000000]   node   0: [mem 0x0000000100000000-0x000000047e5fffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000000001000-0x000000047e5=
fffff]
[    0.000000] On node 0 totalpages: 4163396
[    0.000000]   DMA zone: 64 pages used for memmap
[    0.000000]   DMA zone: 22 pages reserved
[    0.000000]   DMA zone: 3995 pages, LIFO batch:0
[    0.000000]   DMA32 zone: 7751 pages used for memmap
[    0.000000]   DMA32 zone: 496041 pages, LIFO batch:31
[    0.000000]   Normal zone: 57240 pages used for memmap
[    0.000000]   Normal zone: 3663360 pages, LIFO batch:31
[    0.000000] Reserving Intel graphics stolen memory at 0x7da00000-0x7f9=
fffff
[    0.000000] ACPI: PM-Timer IO Port: 0x1808
[    0.000000] ACPI: Local APIC address 0xfee00000
[    0.000000] ACPI: LAPIC_NMI (acpi_id[0x00] high edge lint[0x1])
[    0.000000] ACPI: LAPIC_NMI (acpi_id[0x01] high edge lint[0x1])
[    0.000000] IOAPIC[0]: apic_id 2, version 32, address 0xfec00000, GSI =
0-23
[    0.000000] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
[    0.000000] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level=
)
[    0.000000] ACPI: IRQ0 used by override.
[    0.000000] ACPI: IRQ9 used by override.
[    0.000000] Using ACPI (MADT) for SMP configuration information
[    0.000000] ACPI: HPET id: 0x8086a301 base: 0xfed00000
[    0.000000] smpboot: Allowing 8 CPUs, 0 hotplug CPUs
[    0.000000] e820: [mem 0x7fa00000-0xb7ffffff] available for PCI device=
s
[    0.000000] clocksource: refined-jiffies: mask: 0xffffffff max_cycles:=
 0xffffffff, max_idle_ns: 1910969940391419 ns
[    0.000000] setup_percpu: NR_CPUS:8 nr_cpumask_bits:8 nr_cpu_ids:8 nr_=
node_ids:1
[    0.000000] PERCPU: Embedded 30 pages/cpu @ffff88047e200000 s84824 r81=
92 d29864 u262144
[    0.000000] pcpu-alloc: s84824 r8192 d29864 u262144 alloc=3D1*2097152
[    0.000000] pcpu-alloc: [0] 0 1 2 3 4 5 6 7=20
[    0.000000] Built 1 zonelists in Node order, mobility grouping on.  To=
tal pages: 4098319
[    0.000000] Policy zone: Normal
[    0.000000] Kernel command line: BOOT_IMAGE=3D/vmlinuz-4.2.0-rc8_bad+ =
root=3DUUID=3Da8dbfd80-1cdd-45b1-9d5d-47465b770ac1 ro rootflags=3Dsubvol=3D=
root vconsole.font=3Dlatarcyrheb-sun16 rd.luks.uuid=3Dluks-399488e6-689b-=
4a41-af3f-47fcebd8f54a rhgb quiet
[    0.000000] PID hash table entries: 4096 (order: 3, 32768 bytes)
[    0.000000] Memory: 16204920K/16653584K available (7982K kernel code, =
775K rwdata, 2784K rodata, 1060K init, 924K bss, 448664K reserved, 0K cma=
-reserved)
[    0.000000] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D8,=
 Nodes=3D1
[    0.000000] Hierarchical RCU implementation.
[    0.000000] 	Build-time adjustment of leaf fanout to 64.
[    0.000000] NR_IRQS:4352 nr_irqs:488 16
[    0.000000] Console: colour dummy device 80x25
[    0.000000] console [tty0] enabled
[    0.000000] clocksource: hpet: mask: 0xffffffff max_cycles: 0xffffffff=
, max_idle_ns: 133484882848 ns
[    0.000000] hpet clockevent registered
[    0.000000] tsc: Fast TSC calibration using PIT
[    0.000000] tsc: Detected 2394.536 MHz processor
[    0.000068] Calibrating delay loop (skipped), value calculated using t=
imer frequency.. 4789.07 BogoMIPS (lpj=3D2394536)
[    0.000075] pid_max: default: 32768 minimum: 301
[    0.000085] ACPI: Core revision 20150619
[    0.039410] ACPI: All ACPI Tables successfully acquired
[    0.134001] Dentry cache hash table entries: 2097152 (order: 12, 16777=
216 bytes)
[    0.142399] Inode-cache hash table entries: 1048576 (order: 11, 838860=
8 bytes)
[    0.146039] Mount-cache hash table entries: 32768 (order: 6, 262144 by=
tes)
[    0.146080] Mountpoint-cache hash table entries: 32768 (order: 6, 2621=
44 bytes)
[    0.146599] Initializing cgroup subsys net_cls
[    0.146650] CPU: Physical Processor ID: 0
[    0.146653] CPU: Processor Core ID: 0
[    0.146662] ENERGY_PERF_BIAS: Set to 'normal', was 'performance'
[    0.146664] ENERGY_PERF_BIAS: View and update with x86_energy_perf_pol=
icy(8)
[    0.148674] mce: CPU supports 9 MCE banks
[    0.148710] CPU0: Thermal monitoring enabled (TM1)
[    0.148736] process: using mwait in idle threads
[    0.148744] Last level iTLB entries: 4KB 1024, 2MB 1024, 4MB 1024
[    0.148746] Last level dTLB entries: 4KB 1024, 2MB 1024, 4MB 1024, 1GB=
 4
[    0.149065] Freeing SMP alternatives memory: 28K (ffffffffa1dcc000 - f=
fffffffa1dd3000)
[    0.157195] ..TIMER: vector=3D0x30 apic1=3D0 pin1=3D2 apic2=3D-1 pin2=3D=
-1
[    0.167221] TSC deadline timer enabled
[    0.167232] smpboot: CPU0: Intel(R) Core(TM) i7-4700MQ CPU @ 2.40GHz (=
fam: 06, model: 3c, stepping: 03)
[    0.167268] Performance Events: PEBS fmt2+, 16-deep LBR, Haswell event=
s, full-width counters, Intel PMU driver.
[    0.167320] ... version:                3
[    0.167322] ... bit width:              48
[    0.167324] ... generic registers:      4
[    0.167327] ... value mask:             0000ffffffffffff
[    0.167329] ... max period:             0000ffffffffffff
[    0.167331] ... fixed-purpose events:   3
[    0.167334] ... event mask:             000000070000000f
[    0.168806] x86: Booting SMP configuration:
[    0.168810] .... node  #0, CPUs:      #1 #2 #3 #4 #5 #6 #7
[    0.207814] x86: Booted up 1 node, 8 CPUs
[    0.207822] smpboot: Total of 8 processors activated (38312.57 BogoMIP=
S)
[    0.226162] devtmpfs: initialized
[    0.226654] PM: Registering ACPI NVS region [mem 0x7cd2f000-0x7ce7efff=
] (1376256 bytes)
[    0.226871] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xfffff=
fff, max_idle_ns: 1911260446275000 ns
[    0.227028] xor: automatically using best checksumming function:
[    0.236746]    avx       : 11200.000 MB/sec
[    0.236776] atomic64_test: passed for x86-64 platform with CX8 and wit=
h SSE
[    0.236783] pinctrl core: initialized pinctrl subsystem
[    0.236853] RTC time: 21:37:26, date: 03/01/16
[    0.237138] NET: Registered protocol family 16
[    0.241777] cpuidle: using governor menu
[    0.242043] ACPI FADT declares the system doesn't support PCIe ASPM, s=
o disable it
[    0.242046] ACPI: bus type PCI registered
[    0.242402] PCI: MMCONFIG for domain 0000 [bus 00-3f] at [mem 0xf80000=
00-0xfbffffff] (base 0xf8000000)
[    0.242408] PCI: not using MMCONFIG
[    0.242411] PCI: Using configuration type 1 for base access
[    0.243013] perf_event_intel: PMU erratum BJ122, BV98, HSD29 worked ar=
ound, HT is on
[    0.267907] raid6: sse2x1   gen()  2562 MB/s
[    0.284960] raid6: sse2x1   xor()  2007 MB/s
[    0.302031] raid6: sse2x2   gen()  3230 MB/s
[    0.319113] raid6: sse2x2   xor()  2291 MB/s
[    0.336179] raid6: sse2x4   gen()  3781 MB/s
[    0.353256] raid6: sse2x4   xor()  2685 MB/s
[    0.370321] raid6: avx2x1   gen()  5042 MB/s
[    0.387397] raid6: avx2x2   gen()  5812 MB/s
[    0.404472] raid6: avx2x4   gen()  6839 MB/s
[    0.404475] raid6: using algorithm avx2x4 gen() 6839 MB/s
[    0.404478] raid6: using avx2x2 recovery algorithm
[    0.404582] ACPI: Added _OSI(Module Device)
[    0.404585] ACPI: Added _OSI(Processor Device)
[    0.404588] ACPI: Added _OSI(3.0 _SCP Extensions)
[    0.404591] ACPI: Added _OSI(Processor Aggregator Device)
[    0.409363] ACPI : EC: EC description table is found, configuring boot=
 EC
[    0.409386] ACPI : EC: EC started
[    0.423470] [Firmware Bug]: ACPI: BIOS _OSI(Linux) query ignored
[    0.428696] ACPI: Dynamic OEM Table Load:
[    0.428728] ACPI: SSDT 0xFFFF88046B8C1000 000436 (v01 PmRef  Cpu0Cst  =
00003001 INTL 20120711)
[    0.430483] ACPI: Dynamic OEM Table Load:
[    0.430511] ACPI: SSDT 0xFFFF88046B8C1800 0005AA (v01 PmRef  ApIst    =
00003000 INTL 20120711)
[    0.432396] ACPI: Dynamic OEM Table Load:
[    0.432419] ACPI: SSDT 0xFFFF88046BFDEC00 000119 (v01 PmRef  ApCst    =
00003000 INTL 20120711)
[    0.436728] ACPI: Interpreter enabled
[    0.436747] ACPI Exception: AE_NOT_FOUND, While evaluating Sleep State=
 [\_S1_] (20150619/hwxface-580)
[    0.436762] ACPI Exception: AE_NOT_FOUND, While evaluating Sleep State=
 [\_S2_] (20150619/hwxface-580)
[    0.436790] ACPI: (supports S0 S3 S5)
[    0.436793] ACPI: Using IOAPIC for interrupt routing
[    0.436831] PCI: MMCONFIG for domain 0000 [bus 00-3f] at [mem 0xf80000=
00-0xfbffffff] (base 0xf8000000)
[    0.437730] PCI: MMCONFIG at [mem 0xf8000000-0xfbffffff] reserved in A=
CPI motherboard resources
[    0.437771] PCI: Using host bridge windows from ACPI; if necessary, us=
e "pci=3Dnocrs" and report a bug
[    0.443210] ACPI: Power Resource [PUBS] (on)
[    0.444070] ACPI: Power Resource [NVP3] (on)
[    0.444131] ACPI: Power Resource [NVP2] (on)
[    0.446749] acpi LNXIOBAY:00: ACPI dock station (docks/bays count: 1)
[    0.453099] ACPI: PCI Interrupt Link [LNKA] (IRQs 3 4 5 6 7 9 10 11) *=
0, disabled.
[    0.453252] ACPI: PCI Interrupt Link [LNKB] (IRQs 3 4 5 6 7 9 10 11) *=
0, disabled.
[    0.453391] ACPI: PCI Interrupt Link [LNKC] (IRQs 3 4 5 6 7 9 10 11) *=
0, disabled.
[    0.453532] ACPI: PCI Interrupt Link [LNKD] (IRQs 3 4 5 6 7 9 10 11) *=
0, disabled.
[    0.453668] ACPI: PCI Interrupt Link [LNKE] (IRQs 3 4 5 6 7 9 10 11) *=
0, disabled.
[    0.453819] ACPI: PCI Interrupt Link [LNKF] (IRQs 3 4 5 6 7 9 10 11) *=
0, disabled.
[    0.453960] ACPI: PCI Interrupt Link [LNKG] (IRQs 3 4 5 6 7 9 10 11) *=
0, disabled.
[    0.454099] ACPI: PCI Interrupt Link [LNKH] (IRQs 3 4 5 6 7 9 10 11) *=
0, disabled.
[    0.454297] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-3f])
[    0.454309] acpi PNP0A08:00: _OSC: OS supports [ExtendedConfig ASPM Cl=
ockPM Segments MSI]
[    0.454571] acpi PNP0A08:00: _OSC: platform does not support [PCIeHotp=
lug AER PCIeCapability]
[    0.454683] acpi PNP0A08:00: _OSC: not requesting control; platform do=
es not support [PCIeCapability]
[    0.454689] acpi PNP0A08:00: _OSC: OS requested [PCIeHotplug PME AER P=
CIeCapability]
[    0.454693] acpi PNP0A08:00: _OSC: platform willing to grant [PME]
[    0.454697] acpi PNP0A08:00: _OSC failed (AE_SUPPORT); disabling ASPM
[    0.454902] PCI host bridge to bus 0000:00
[    0.454909] pci_bus 0000:00: root bus resource [bus 00-3f]
[    0.454914] pci_bus 0000:00: root bus resource [io  0x0000-0x0cf7 wind=
ow]
[    0.454918] pci_bus 0000:00: root bus resource [io  0x0d00-0xffff wind=
ow]
[    0.454923] pci_bus 0000:00: root bus resource [mem 0x000a0000-0x000bf=
fff window]
[    0.454927] pci_bus 0000:00: root bus resource [mem 0x000c0000-0x000c3=
fff window]
[    0.454931] pci_bus 0000:00: root bus resource [mem 0x000c4000-0x000c7=
fff window]
[    0.454934] pci_bus 0000:00: root bus resource [mem 0x000c8000-0x000cb=
fff window]
[    0.454938] pci_bus 0000:00: root bus resource [mem 0x000cc000-0x000cf=
fff window]
[    0.454942] pci_bus 0000:00: root bus resource [mem 0x000d0000-0x000d3=
fff window]
[    0.454945] pci_bus 0000:00: root bus resource [mem 0x000d4000-0x000d7=
fff window]
[    0.454949] pci_bus 0000:00: root bus resource [mem 0x000d8000-0x000db=
fff window]
[    0.454953] pci_bus 0000:00: root bus resource [mem 0x000dc000-0x000df=
fff window]
[    0.454956] pci_bus 0000:00: root bus resource [mem 0x000e0000-0x000e3=
fff window]
[    0.454960] pci_bus 0000:00: root bus resource [mem 0x000e4000-0x000e7=
fff window]
[    0.454964] pci_bus 0000:00: root bus resource [mem 0x000e8000-0x000eb=
fff window]
[    0.454967] pci_bus 0000:00: root bus resource [mem 0x000ec000-0x000ef=
fff window]
[    0.454971] pci_bus 0000:00: root bus resource [mem 0x7fa00000-0xfebff=
fff window]
[    0.454975] pci_bus 0000:00: root bus resource [mem 0xfed40000-0xfed4b=
fff window]
[    0.454993] pci 0000:00:00.0: [8086:0c04] type 00 class 0x060000
[    0.455214] pci 0000:00:01.0: [8086:0c01] type 01 class 0x060400
[    0.455297] pci 0000:00:01.0: PME# supported from D0 D3hot D3cold
[    0.455482] pci 0000:00:02.0: [8086:0416] type 00 class 0x030000
[    0.455518] pci 0000:00:02.0: reg 0x10: [mem 0xb1400000-0xb17fffff 64b=
it]
[    0.455537] pci 0000:00:02.0: reg 0x18: [mem 0xa0000000-0xafffffff 64b=
it pref]
[    0.455550] pci 0000:00:02.0: reg 0x20: [io  0x5000-0x503f]
[    0.455738] pci 0000:00:03.0: [8086:0c0c] type 00 class 0x040300
[    0.455774] pci 0000:00:03.0: reg 0x10: [mem 0xb2a30000-0xb2a33fff 64b=
it]
[    0.456033] pci 0000:00:14.0: [8086:8c31] type 00 class 0x0c0330
[    0.456105] pci 0000:00:14.0: reg 0x10: [mem 0xb2a20000-0xb2a2ffff 64b=
it]
[    0.456241] pci 0000:00:14.0: PME# supported from D3hot D3cold
[    0.456328] pci 0000:00:14.0: System wakeup disabled by ACPI
[    0.456417] pci 0000:00:16.0: [8086:8c3a] type 00 class 0x078000
[    0.456486] pci 0000:00:16.0: reg 0x10: [mem 0xb2a39000-0xb2a3900f 64b=
it]
[    0.456614] pci 0000:00:16.0: PME# supported from D0 D3hot D3cold
[    0.456807] pci 0000:00:19.0: [8086:153a] type 00 class 0x020000
[    0.456871] pci 0000:00:19.0: reg 0x10: [mem 0xb2a00000-0xb2a1ffff]
[    0.456895] pci 0000:00:19.0: reg 0x14: [mem 0xb2a3e000-0xb2a3efff]
[    0.456920] pci 0000:00:19.0: reg 0x18: [io  0x5080-0x509f]
[    0.457037] pci 0000:00:19.0: PME# supported from D0 D3hot D3cold
[    0.457127] pci 0000:00:19.0: System wakeup disabled by ACPI
[    0.457222] pci 0000:00:1b.0: [8086:8c20] type 00 class 0x040300
[    0.457285] pci 0000:00:1b.0: reg 0x10: [mem 0xb2a34000-0xb2a37fff 64b=
it]
[    0.457420] pci 0000:00:1b.0: PME# supported from D0 D3hot D3cold
[    0.457588] pci 0000:00:1c.0: [8086:8c10] type 01 class 0x060400
[    0.457745] pci 0000:00:1c.0: PME# supported from D0 D3hot D3cold
[    0.458029] pci 0000:00:1c.1: [8086:8c12] type 01 class 0x060400
[    0.458191] pci 0000:00:1c.1: PME# supported from D0 D3hot D3cold
[    0.458359] pci 0000:00:1c.1: System wakeup disabled by ACPI
[    0.458448] pci 0000:00:1c.2: [8086:8c14] type 01 class 0x060400
[    0.458604] pci 0000:00:1c.2: PME# supported from D0 D3hot D3cold
[    0.458766] pci 0000:00:1c.2: System wakeup disabled by ACPI
[    0.458870] pci 0000:00:1c.4: [8086:8c18] type 01 class 0x060400
[    0.459024] pci 0000:00:1c.4: PME# supported from D0 D3hot D3cold
[    0.459276] pci 0000:00:1d.0: [8086:8c26] type 00 class 0x0c0320
[    0.459338] pci 0000:00:1d.0: reg 0x10: [mem 0xb2a3d000-0xb2a3d3ff]
[    0.459488] pci 0000:00:1d.0: PME# supported from D0 D3hot D3cold
[    0.459579] pci 0000:00:1d.0: System wakeup disabled by ACPI
[    0.459665] pci 0000:00:1f.0: [8086:8c4f] type 00 class 0x060100
[    0.460008] pci 0000:00:1f.2: [8086:8c03] type 00 class 0x010601
[    0.460070] pci 0000:00:1f.2: reg 0x10: [io  0x50a8-0x50af]
[    0.460094] pci 0000:00:1f.2: reg 0x14: [io  0x50b4-0x50b7]
[    0.460118] pci 0000:00:1f.2: reg 0x18: [io  0x50a0-0x50a7]
[    0.460142] pci 0000:00:1f.2: reg 0x1c: [io  0x50b0-0x50b3]
[    0.460161] pci 0000:00:1f.2: reg 0x20: [io  0x5060-0x507f]
[    0.460181] pci 0000:00:1f.2: reg 0x24: [mem 0xb2a3c000-0xb2a3c7ff]
[    0.460252] pci 0000:00:1f.2: PME# supported from D3hot
[    0.460412] pci 0000:00:1f.3: [8086:8c22] type 00 class 0x0c0500
[    0.460453] pci 0000:00:1f.3: reg 0x10: [mem 0xb2a38000-0xb2a380ff 64b=
it]
[    0.460508] pci 0000:00:1f.3: reg 0x20: [io  0xefa0-0xefbf]
[    0.460783] pci 0000:01:00.0: [10de:0ff6] type 00 class 0x030000
[    0.460831] pci 0000:01:00.0: reg 0x10: [mem 0xb0000000-0xb0ffffff]
[    0.460852] pci 0000:01:00.0: reg 0x14: [mem 0x80000000-0x8fffffff 64b=
it pref]
[    0.460873] pci 0000:01:00.0: reg 0x1c: [mem 0x90000000-0x91ffffff 64b=
it pref]
[    0.460885] pci 0000:01:00.0: reg 0x24: [io  0x4000-0x407f]
[    0.460899] pci 0000:01:00.0: reg 0x30: [mem 0xfff80000-0xffffffff pre=
f]
[    0.462842] pci 0000:00:01.0: PCI bridge to [bus 01]
[    0.462849] pci 0000:00:01.0:   bridge window [io  0x4000-0x4fff]
[    0.462856] pci 0000:00:01.0:   bridge window [mem 0xb0000000-0xb10fff=
ff]
[    0.462864] pci 0000:00:01.0:   bridge window [mem 0x80000000-0x91ffff=
ff 64bit pref]
[    0.464650] pci 0000:02:00.0: [1217:8520] type 00 class 0x080501
[    0.464725] pci 0000:02:00.0: reg 0x10: [mem 0xb2901000-0xb2901fff]
[    0.464752] pci 0000:02:00.0: reg 0x14: [mem 0xb2900000-0xb29007ff]
[    0.464947] pci 0000:02:00.0: PME# supported from D3hot D3cold
[    0.468318] pci 0000:00:1c.0: PCI bridge to [bus 02]
[    0.468331] pci 0000:00:1c.0:   bridge window [mem 0xb2900000-0xb29fff=
ff]
[    0.468557] pci 0000:03:00.0: [8086:08b2] type 00 class 0x028000
[    0.468868] pci 0000:03:00.0: reg 0x10: [mem 0xb2800000-0xb2801fff 64b=
it]
[    0.469536] pci 0000:03:00.0: PME# supported from D0 D3hot D3cold
[    0.471393] pci 0000:00:1c.1: PCI bridge to [bus 03]
[    0.471410] pci 0000:00:1c.1:   bridge window [mem 0xb2800000-0xb28fff=
ff]
[    0.471526] pci 0000:00:1c.2: PCI bridge to [bus 04-05]
[    0.471538] pci 0000:00:1c.2:   bridge window [io  0x3000-0x3fff]
[    0.471551] pci 0000:00:1c.2:   bridge window [mem 0xb2000000-0xb27fff=
ff]
[    0.471568] pci 0000:00:1c.2:   bridge window [mem 0xb1800000-0xb1ffff=
ff 64bit pref]
[    0.471672] pci 0000:00:1c.4: PCI bridge to [bus 06-3f]
[    0.471689] pci 0000:00:1c.4:   bridge window [mem 0xb8000000-0xce0fff=
ff]
[    0.471706] pci 0000:00:1c.4:   bridge window [mem 0xd0000000-0xf1ffff=
ff 64bit pref]
[    0.474979] ACPI: Enabled 5 GPEs in block 00 to 3F
[    0.475129] ACPI : EC: GPE =3D 0x11, I/O: command/status =3D 0x66, dat=
a =3D 0x62
[    0.475283] vgaarb: device added: PCI:0000:00:02.0,decodes=3Dio+mem,ow=
ns=3Dmem,locks=3Dnone
[    0.475295] vgaarb: device added: PCI:0000:01:00.0,decodes=3Dio+mem,ow=
ns=3Dnone,locks=3Dnone
[    0.475298] vgaarb: loaded
[    0.475301] vgaarb: bridge control possible 0000:01:00.0
[    0.475304] vgaarb: setting as boot device: PCI:0000:00:02.0
[    0.475306] vgaarb: no bridge control possible 0000:00:02.0
[    0.475427] SCSI subsystem initialized
[    0.475465] libata version 3.00 loaded.
[    0.475479] ACPI: bus type USB registered
[    0.475523] usbcore: registered new interface driver usbfs
[    0.475543] usbcore: registered new interface driver hub
[    0.475605] usbcore: registered new device driver usb
[    0.475666] pps_core: LinuxPPS API ver. 1 registered
[    0.475668] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolf=
o Giometti <giometti-k2GhghHVRtY@public.gmane.org>
[    0.475681] PTP clock support registered
[    0.476328] wmi: Mapper loaded
[    0.476369] Advanced Linux Sound Architecture Driver Initialized.
[    0.476397] PCI: Using ACPI for IRQ routing
[    0.480148] PCI: pci_cache_line_size set to 64 bytes
[    0.481944] e820: reserve RAM buffer [mem 0x00058000-0x0005ffff]
[    0.481948] e820: reserve RAM buffer [mem 0x0009c000-0x0009ffff]
[    0.481951] e820: reserve RAM buffer [mem 0x0009e000-0x0009ffff]
[    0.481953] e820: reserve RAM buffer [mem 0x6a0d6000-0x6bffffff]
[    0.481958] e820: reserve RAM buffer [mem 0x6b734018-0x6bffffff]
[    0.481962] e820: reserve RAM buffer [mem 0x6b745018-0x6bffffff]
[    0.481965] e820: reserve RAM buffer [mem 0x6b75d018-0x6bffffff]
[    0.481969] e820: reserve RAM buffer [mem 0x7a3aa000-0x7bffffff]
[    0.481971] e820: reserve RAM buffer [mem 0x7cf00000-0x7fffffff]
[    0.481975] e820: reserve RAM buffer [mem 0x47e600000-0x47fffffff]
[    0.482375] hpet0: at MMIO 0xfed00000, IRQs 2, 8, 0, 0, 0, 0, 0, 0
[    0.482388] hpet0: 8 comparators, 64-bit 14.318180 MHz counter
[    0.484454] clocksource: Switched to clocksource hpet
[    0.484683] pnp: PnP ACPI init
[    0.485388] system 00:00: [mem 0x00000000-0x0009ffff] could not be res=
erved
[    0.485395] system 00:00: [mem 0x000f0000-0x000fffff] could not be res=
erved
[    0.485400] system 00:00: [mem 0x00100000-0x7f9fffff] could not be res=
erved
[    0.485405] system 00:00: [mem 0xfec00000-0xfed3ffff] could not be res=
erved
[    0.485409] system 00:00: [mem 0xfed4c000-0xffffffff] has been reserve=
d
[    0.485417] system 00:00: Plug and Play ACPI device, IDs PNP0c01 (acti=
ve)
[    0.485682] system 00:01: [io  0x1800-0x187f] could not be reserved
[    0.485687] system 00:01: [io  0x0800-0x087f] has been reserved
[    0.485692] system 00:01: [io  0x15e0-0x15ef] has been reserved
[    0.485696] system 00:01: [io  0x1600-0x167f] has been reserved
[    0.485700] system 00:01: [io  0x1640-0x165f] has been reserved
[    0.485706] system 00:01: [mem 0xf8000000-0xfbffffff] could not be res=
erved
[    0.485711] system 00:01: [mem 0x00000000-0x00000fff] could not be res=
erved
[    0.485716] system 00:01: [mem 0xfed1c000-0xfed1ffff] has been reserve=
d
[    0.485720] system 00:01: [mem 0xfed10000-0xfed13fff] has been reserve=
d
[    0.485725] system 00:01: [mem 0xfed18000-0xfed18fff] has been reserve=
d
[    0.485729] system 00:01: [mem 0xfed19000-0xfed19fff] has been reserve=
d
[    0.485733] system 00:01: [mem 0xfed45000-0xfed4bfff] has been reserve=
d
[    0.485739] system 00:01: Plug and Play ACPI device, IDs PNP0c02 (acti=
ve)
[    0.485848] pnp 00:02: Plug and Play ACPI device, IDs PNP0b00 (active)
[    0.485895] pnp 00:03: Plug and Play ACPI device, IDs LEN0071 PNP0303 =
(active)
[    0.485940] pnp 00:04: Plug and Play ACPI device, IDs LEN0034 PNP0f13 =
(active)
[    0.486029] pnp 00:05: Plug and Play ACPI device, IDs SMO1200 PNP0c31 =
(active)
[    0.487479] pnp: PnP ACPI: found 6 devices
[    0.496390] clocksource: acpi_pm: mask: 0xffffff max_cycles: 0xffffff,=
 max_idle_ns: 2085701024 ns
[    0.496407] pci 0000:01:00.0: can't claim BAR 6 [mem 0xfff80000-0xffff=
ffff pref]: no compatible bridge window
[    0.496498] pci 0000:00:1c.4: bridge window [io  0x1000-0x0fff] to [bu=
s 06-3f] add_size 1000
[    0.496509] pci 0000:00:1c.4: res[7]=3D[io  0x1000-0x0fff] res_to_dev_=
res add_size 1000 min_align 1000
[    0.496513] pci 0000:00:1c.4: res[7]=3D[io  0x1000-0x1fff] res_to_dev_=
res add_size 1000 min_align 1000
[    0.496523] pci 0000:00:1c.4: BAR 7: assigned [io  0x2000-0x2fff]
[    0.496531] pci 0000:01:00.0: BAR 6: assigned [mem 0xb1000000-0xb107ff=
ff pref]
[    0.496536] pci 0000:00:01.0: PCI bridge to [bus 01]
[    0.496541] pci 0000:00:01.0:   bridge window [io  0x4000-0x4fff]
[    0.496549] pci 0000:00:01.0:   bridge window [mem 0xb0000000-0xb10fff=
ff]
[    0.496557] pci 0000:00:01.0:   bridge window [mem 0x80000000-0x91ffff=
ff 64bit pref]
[    0.496566] pci 0000:00:1c.0: PCI bridge to [bus 02]
[    0.496581] pci 0000:00:1c.0:   bridge window [mem 0xb2900000-0xb29fff=
ff]
[    0.496604] pci 0000:00:1c.1: PCI bridge to [bus 03]
[    0.496620] pci 0000:00:1c.1:   bridge window [mem 0xb2800000-0xb28fff=
ff]
[    0.496642] pci 0000:00:1c.2: PCI bridge to [bus 04-05]
[    0.496653] pci 0000:00:1c.2:   bridge window [io  0x3000-0x3fff]
[    0.496668] pci 0000:00:1c.2:   bridge window [mem 0xb2000000-0xb27fff=
ff]
[    0.496681] pci 0000:00:1c.2:   bridge window [mem 0xb1800000-0xb1ffff=
ff 64bit pref]
[    0.496698] pci 0000:00:1c.4: PCI bridge to [bus 06-3f]
[    0.496708] pci 0000:00:1c.4:   bridge window [io  0x2000-0x2fff]
[    0.496723] pci 0000:00:1c.4:   bridge window [mem 0xb8000000-0xce0fff=
ff]
[    0.496736] pci 0000:00:1c.4:   bridge window [mem 0xd0000000-0xf1ffff=
ff 64bit pref]
[    0.496751] pci_bus 0000:00: resource 4 [io  0x0000-0x0cf7 window]
[    0.496755] pci_bus 0000:00: resource 5 [io  0x0d00-0xffff window]
[    0.496760] pci_bus 0000:00: resource 6 [mem 0x000a0000-0x000bffff win=
dow]
[    0.496763] pci_bus 0000:00: resource 7 [mem 0x000c0000-0x000c3fff win=
dow]
[    0.496767] pci_bus 0000:00: resource 8 [mem 0x000c4000-0x000c7fff win=
dow]
[    0.496771] pci_bus 0000:00: resource 9 [mem 0x000c8000-0x000cbfff win=
dow]
[    0.496775] pci_bus 0000:00: resource 10 [mem 0x000cc000-0x000cffff wi=
ndow]
[    0.496778] pci_bus 0000:00: resource 11 [mem 0x000d0000-0x000d3fff wi=
ndow]
[    0.496782] pci_bus 0000:00: resource 12 [mem 0x000d4000-0x000d7fff wi=
ndow]
[    0.496786] pci_bus 0000:00: resource 13 [mem 0x000d8000-0x000dbfff wi=
ndow]
[    0.496789] pci_bus 0000:00: resource 14 [mem 0x000dc000-0x000dffff wi=
ndow]
[    0.496793] pci_bus 0000:00: resource 15 [mem 0x000e0000-0x000e3fff wi=
ndow]
[    0.496797] pci_bus 0000:00: resource 16 [mem 0x000e4000-0x000e7fff wi=
ndow]
[    0.496800] pci_bus 0000:00: resource 17 [mem 0x000e8000-0x000ebfff wi=
ndow]
[    0.496804] pci_bus 0000:00: resource 18 [mem 0x000ec000-0x000effff wi=
ndow]
[    0.496808] pci_bus 0000:00: resource 19 [mem 0x7fa00000-0xfebfffff wi=
ndow]
[    0.496812] pci_bus 0000:00: resource 20 [mem 0xfed40000-0xfed4bfff wi=
ndow]
[    0.496816] pci_bus 0000:01: resource 0 [io  0x4000-0x4fff]
[    0.496820] pci_bus 0000:01: resource 1 [mem 0xb0000000-0xb10fffff]
[    0.496823] pci_bus 0000:01: resource 2 [mem 0x80000000-0x91ffffff 64b=
it pref]
[    0.496828] pci_bus 0000:02: resource 1 [mem 0xb2900000-0xb29fffff]
[    0.496832] pci_bus 0000:03: resource 1 [mem 0xb2800000-0xb28fffff]
[    0.496836] pci_bus 0000:04: resource 0 [io  0x3000-0x3fff]
[    0.496839] pci_bus 0000:04: resource 1 [mem 0xb2000000-0xb27fffff]
[    0.496843] pci_bus 0000:04: resource 2 [mem 0xb1800000-0xb1ffffff 64b=
it pref]
[    0.496847] pci_bus 0000:06: resource 0 [io  0x2000-0x2fff]
[    0.496850] pci_bus 0000:06: resource 1 [mem 0xb8000000-0xce0fffff]
[    0.496854] pci_bus 0000:06: resource 2 [mem 0xd0000000-0xf1ffffff 64b=
it pref]
[    0.496930] NET: Registered protocol family 2
[    0.497355] TCP established hash table entries: 131072 (order: 8, 1048=
576 bytes)
[    0.497917] TCP bind hash table entries: 65536 (order: 8, 1048576 byte=
s)
[    0.498174] TCP: Hash tables configured (established 131072 bind 65536=
)
[    0.498255] UDP hash table entries: 8192 (order: 6, 262144 bytes)
[    0.498379] UDP-Lite hash table entries: 8192 (order: 6, 262144 bytes)
[    0.498559] NET: Registered protocol family 1
[    0.498596] pci 0000:00:02.0: Video device with shadowed ROM
[    0.500957] PCI: CLS 64 bytes, default 64
[    0.501063] Unpacking initramfs...
[    1.295923] Freeing initrd memory: 17480K (ffff88003eee9000 - ffff8800=
3fffb000)
[    1.295962] PCI-DMA: Using software bounce buffering for IO (SWIOTLB)
[    1.295969] software IO TLB [mem 0x75dae000-0x79dae000] (64MB) mapped =
at [ffff880075dae000-ffff880079dadfff]
[    1.296196] RAPL PMU detected, API unit is 2^-32 Joules, 4 fixed count=
ers 655360 ms ovfl timer
[    1.296201] hw unit of domain pp0-core 2^-14 Joules
[    1.296204] hw unit of domain package 2^-14 Joules
[    1.296206] hw unit of domain dram 2^-14 Joules
[    1.296208] hw unit of domain pp1-gpu 2^-14 Joules
[    1.297634] sha1_ssse3: Using AVX2 optimized SHA-1 implementation
[    1.297794] sha256_ssse3: Using AVX2 optimized SHA-256 implementation
[    1.298192] sha512_ssse3: Using AVX2 optimized SHA-512 implementation
[    1.298994] futex hash table entries: 2048 (order: 5, 131072 bytes)
[    1.299040] Initialise system trusted keyring
[    1.299466] HugeTLB registered 2 MB page size, pre-allocated 0 pages
[    1.313382] Block layer SCSI generic (bsg) driver version 0.4 loaded (=
major 251)
[    1.313394] io scheduler noop registered
[    1.313403] io scheduler deadline registered
[    1.313493] io scheduler cfq registered (default)
[    1.314858] efifb: probing for efifb
[    1.314893] efifb: framebuffer at 0xa0000000, mapped to 0xffffc9000200=
0000, using 8100k, total 8100k
[    1.314897] efifb: mode is 1920x1080x32, linelength=3D7680, pages=3D1
[    1.314899] efifb: scrolling: redraw
[    1.314903] efifb: Truecolor: size=3D8:8:8:8, shift=3D24:16:8:0
[    1.328092] Console: switching to colour frame buffer device 240x67
[    1.340336] fb0: EFI VGA frame buffer device
[    1.340378] intel_idle: MWAIT substates: 0x42120
[    1.340381] intel_idle: v0.4 model 0x3C
[    1.340384] intel_idle: lapic_timer_reliable_states 0xffffffff
[    1.341444] ACPI: AC Adapter [AC] (off-line)
[    1.341587] input: Lid Switch as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0=
C0D:00/input/input0
[    1.341794] ACPI: Lid Switch [LID]
[    1.341877] input: Sleep Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PN=
P0C0E:00/input/input1
[    1.341884] ACPI: Sleep Button [SLPB]
[    1.341978] input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/in=
put/input2
[    1.341983] ACPI: Power Button [PWRF]
[    1.344330] thermal LNXTHERM:00: registered as thermal_zone0
[    1.344337] ACPI: Thermal Zone [THM0] (55 C)
[    1.344429] GHES: HEST is not enabled!
[    1.344552] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
[    1.345725] Non-volatile memory driver v1.3
[    1.345736] Linux agpgart interface v0.103
[    1.345838] [drm] Initialized drm 1.1.0 20060810
[    1.345932] i915 0000:00:02.0: enabling device (0006 -> 0007)
[    1.347067] [drm] Memory usable by graphics device =3D 2048M
[    1.347073] checking generic (a0000000 7e9000) vs hw (a0000000 1000000=
0)
[    1.347076] fb: switching to inteldrmfb from EFI VGA
[    1.347117] Console: switching to colour dummy device 80x25
[    1.347262] [drm] Replacing VGA console driver
[    1.353388] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013)=
.
[    1.353393] [drm] Driver supports precise vblank timestamp query.
[    1.353416] [drm:intel_parse_bios] *ERROR* General definiton block chi=
ld device size is too small.
[    1.353926] vgaarb: device changed decodes: PCI:0000:00:02.0,olddecode=
s=3Dio+mem,decodes=3Dnone:owns=3Dmem
[    1.354930] ACPI: Battery Slot [BAT0] (battery present)
[    1.355140] [drm:drm_calc_timestamping_constants] *ERROR* crtc 21: Can=
't calculate constants, dotclock =3D 0!
[    1.364852] ACPI: Video Device [VID] (multi-head: yes  rom: no  post: =
no)
[    1.368403] acpi device:00: registered as cooling_device8
[    1.368551] input: Video Bus as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A=
08:00/LNXVIDEO:00/input/input3
[    1.368716] ACPI: Video Device [VID1] (multi-head: yes  rom: yes  post=
: no)
[    1.371608] acpi device:0a: registered as cooling_device9
[    1.371736] input: Video Bus as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A=
08:00/device:09/LNXVIDEO:01/input/input4
[    1.371777] [drm] Initialized i915 1.6.0 20150731 for 0000:00:02.0 on =
minor 0
[    1.372067] ACPI Warning: \_SB_.PCI0.PEG_.VID_._DSM: Argument #4 type =
mismatch - Found [Buffer], ACPI requires [Package] (20150619/nsarguments-=
95)
[    1.372743] ACPI Warning: \_SB_.PCI0.PEG_.VID_._DSM: Argument #4 type =
mismatch - Found [Buffer], ACPI requires [Package] (20150619/nsarguments-=
95)
[    1.373381] pci 0000:01:00.0: optimus capabilities: enabled, status dy=
namic power, hda bios codec supported
[    1.373389] VGA switcheroo: detected Optimus DSM method \_SB_.PCI0.PEG=
_.VID_ handle
[    1.373419] nouveau 0000:01:00.0: enabling device (0004 -> 0007)
[    1.373519] nouveau 0000:01:00.0: NVIDIA GK107 (0e7360a2)
[    1.427296] [drm] GMBUS [i915 gmbus dpb] timed out, falling back to bi=
t banging on pin 5
[    1.497342] [drm] GMBUS [i915 gmbus dpd] timed out, falling back to bi=
t banging on pin 6
[    1.507450] fbcon: inteldrmfb (fb0) is primary device
[    1.536745] nouveau 0000:01:00.0: bios: version 80.07.ac.00.20
[    1.602599] Console: switching to colour frame buffer device 240x67
[    1.615068] i915 0000:00:02.0: fb0: inteldrmfb frame buffer device
[    1.802920] nouveau 0000:01:00.0: fb: 2048 MiB GDDR5
[    2.300037] tsc: Refined TSC clocksource calibration: 2394.440 MHz
[    2.300046] clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x2=
283b317649, max_idle_ns: 440795239061 ns
[    2.468818] vga_switcheroo: enabled
[    2.469105] [TTM] Zone  kernel: Available graphics memory: 8154390 kiB
[    2.469111] [TTM] Zone   dma32: Available graphics memory: 2097152 kiB
[    2.469114] [TTM] Initializing pool allocator
[    2.469124] [TTM] Initializing DMA pool allocator
[    2.469149] nouveau 0000:01:00.0: DRM: VRAM: 2048 MiB
[    2.469153] nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
[    2.469160] nouveau 0000:01:00.0: DRM: TMDS table version 2.0
[    2.469165] nouveau 0000:01:00.0: DRM: DCB version 4.0
[    2.469170] nouveau 0000:01:00.0: DRM: DCB outp 00: 08800fc6 0f420010
[    2.469175] nouveau 0000:01:00.0: DRM: DCB outp 01: 08000f82 00020010
[    2.469179] nouveau 0000:01:00.0: DRM: DCB conn 00: 01000046
[    2.523004] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013)=
.
[    2.523008] [drm] Driver supports precise vblank timestamp query.
[    2.995485] nouveau 0000:01:00.0: DRM: MM: using COPY for buffer copie=
s
[    3.027541] nouveau 0000:01:00.0: No connectors reported connected wit=
h modes
[    3.027547] [drm] Cannot find any crtc or sizes - going 1024x768
[    3.179124] nouveau 0000:01:00.0: DRM: allocated 1024x768 fb: 0x60000,=
 bo ffff880469329800
[    3.179290] nouveau 0000:01:00.0: fb1: nouveaufb frame buffer device
[    3.179301] [drm] Initialized nouveau 1.2.2 20120801 for 0000:01:00.0 =
on minor 1
[    3.180831] loop: module loaded
[    3.180921] ahci 0000:00:1f.2: version 3.0
[    3.181252] ahci 0000:00:1f.2: AHCI 0001.0300 32 slots 6 ports 6 Gbps =
0x21 impl SATA mode
[    3.181260] ahci 0000:00:1f.2: flags: 64bit ncq ilck pm led clo pio sl=
um part ems apst=20
[    3.184129] scsi host0: ahci
[    3.184463] scsi host1: ahci
[    3.184705] scsi host2: ahci
[    3.185061] scsi host3: ahci
[    3.185441] scsi host4: ahci
[    3.185824] scsi host5: ahci
[    3.185948] ata1: SATA max UDMA/133 abar m2048@0xb2a3c000 port 0xb2a3c=
100 irq 27
[    3.185952] ata2: DUMMY
[    3.185955] ata3: DUMMY
[    3.185957] ata4: DUMMY
[    3.185959] ata5: DUMMY
[    3.185968] ata6: SATA max UDMA/133 abar m2048@0xb2a3c000 port 0xb2a3c=
380 irq 27
[    3.186041] e1000e: Intel(R) PRO/1000 Network Driver - 3.2.5-k
[    3.186043] e1000e: Copyright(c) 1999 - 2015 Intel Corporation.
[    3.186382] e1000e 0000:00:19.0: Interrupt Throttling Rate (ints/sec) =
set to dynamic conservative mode
[    3.300916] clocksource: Switched to clocksource tsc
[    3.353351] e1000e 0000:00:19.0 eth0: registered PHC clock
[    3.353361] e1000e 0000:00:19.0 eth0: (PCI Express:2.5GT/s:Width x1) 5=
4:ee:75:1b:7e:50
[    3.353365] e1000e 0000:00:19.0 eth0: Intel(R) PRO/1000 Network Connec=
tion
[    3.353410] e1000e 0000:00:19.0 eth0: MAC: 11, PHY: 12, PBA No: 1000FF=
-0FF
[    3.353729] xhci_hcd 0000:00:14.0: xHCI Host Controller
[    3.353742] xhci_hcd 0000:00:14.0: new USB bus registered, assigned bu=
s number 1
[    3.353913] xhci_hcd 0000:00:14.0: hcc params 0x200077c1 hci version 0=
x100 quirks 0x00009810
[    3.353935] xhci_hcd 0000:00:14.0: cache line size of 64 is not suppor=
ted
[    3.354116] usb usb1: New USB device found, idVendor=3D1d6b, idProduct=
=3D0002
[    3.354120] usb usb1: New USB device strings: Mfr=3D3, Product=3D2, Se=
rialNumber=3D1
[    3.354124] usb usb1: Product: xHCI Host Controller
[    3.354128] usb usb1: Manufacturer: Linux 4.2.0-rc8_bad+ xhci-hcd
[    3.354132] usb usb1: SerialNumber: 0000:00:14.0
[    3.354456] hub 1-0:1.0: USB hub found
[    3.354489] hub 1-0:1.0: 15 ports detected
[    3.361046] xhci_hcd 0000:00:14.0: xHCI Host Controller
[    3.361055] xhci_hcd 0000:00:14.0: new USB bus registered, assigned bu=
s number 2
[    3.361138] usb usb2: New USB device found, idVendor=3D1d6b, idProduct=
=3D0003
[    3.361143] usb usb2: New USB device strings: Mfr=3D3, Product=3D2, Se=
rialNumber=3D1
[    3.361146] usb usb2: Product: xHCI Host Controller
[    3.361150] usb usb2: Manufacturer: Linux 4.2.0-rc8_bad+ xhci-hcd
[    3.361154] usb usb2: SerialNumber: 0000:00:14.0
[    3.361458] hub 2-0:1.0: USB hub found
[    3.361486] hub 2-0:1.0: 6 ports detected
[    3.363474] usb: failed to peer usb2-port4 and usb1-port3 by location =
(usb2-port4:none) (usb1-port3:usb2-port3)
[    3.363480] usb usb2-port4: failed to peer to usb1-port3 (-16)
[    3.363483] usb: port power management may be unreliable
[    3.364410] usb: failed to peer usb2-port6 and usb1-port3 by location =
(usb2-port6:none) (usb1-port3:usb2-port3)
[    3.364415] usb usb2-port6: failed to peer to usb1-port3 (-16)
[    3.364585] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[    3.364612] ehci-pci: EHCI PCI platform driver
[    3.364836] ehci-pci 0000:00:1d.0: EHCI Host Controller
[    3.364849] ehci-pci 0000:00:1d.0: new USB bus registered, assigned bu=
s number 3
[    3.364874] ehci-pci 0000:00:1d.0: debug port 2
[    3.368798] ehci-pci 0000:00:1d.0: cache line size of 64 is not suppor=
ted
[    3.368819] ehci-pci 0000:00:1d.0: irq 23, io mem 0xb2a3d000
[    3.374891] ehci-pci 0000:00:1d.0: USB 2.0 started, EHCI 1.00
[    3.374996] usb usb3: New USB device found, idVendor=3D1d6b, idProduct=
=3D0002
[    3.375001] usb usb3: New USB device strings: Mfr=3D3, Product=3D2, Se=
rialNumber=3D1
[    3.375005] usb usb3: Product: EHCI Host Controller
[    3.375010] usb usb3: Manufacturer: Linux 4.2.0-rc8_bad+ ehci_hcd
[    3.375013] usb usb3: SerialNumber: 0000:00:1d.0
[    3.375376] hub 3-0:1.0: USB hub found
[    3.375390] hub 3-0:1.0: 3 ports detected
[    3.375820] i8042: PNP: PS/2 Controller [PNP0303:KBD,PNP0f13:MOU] at 0=
x60,0x64 irq 1,12
[    3.378444] serio: i8042 KBD port at 0x60,0x64 irq 1
[    3.378452] serio: i8042 AUX port at 0x60,0x64 irq 12
[    3.378722] mousedev: PS/2 mouse device common for all mice
[    3.379919] i801_smbus 0000:00:1f.3: SMBus using PCI interrupt
[    3.380334] device-mapper: ioctl: 4.32.0-ioctl (2015-6-26) initialised=
: dm-devel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
[    3.380410] Intel P-state driver initializing.
[    3.381037] input: AT Translated Set 2 keyboard as /devices/platform/i=
8042/serio0/input/input5
[    3.382233] EFI Variables Facility v0.08 2004-May-17
[    3.402765] hidraw: raw HID events driver (C) Jiri Kosina
[    3.402807] usbcore: registered new interface driver usbhid
[    3.402808] usbhid: USB HID core driver
[    3.402924] thinkpad_acpi: ThinkPad ACPI Extras v0.25
[    3.402925] thinkpad_acpi: http://ibm-acpi.sf.net/
[    3.402926] thinkpad_acpi: ThinkPad BIOS GNET62WW (2.10 ), EC unknown
[    3.402927] thinkpad_acpi: Lenovo ThinkPad W540, model 20BGCTO1WW
[    3.403297] thinkpad_acpi: Unsupported brightness interface, please co=
ntact ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
[    3.403343] thinkpad_acpi: radio switch found; radios are enabled
[    3.403352] thinkpad_acpi: This ThinkPad has standard ACPI backlight b=
rightness control, supported by the ACPI video driver
[    3.403352] thinkpad_acpi: Disabling thinkpad-acpi brightness events b=
y default...
[    3.403956] thinkpad_acpi: rfkill switch tpacpi_bluetooth_sw: radio is=
 unblocked
[    3.405691] input: ThinkPad Extra Buttons as /devices/platform/thinkpa=
d_acpi/input/input8
[    3.405908] ip_tables: (C) 2000-2006 Netfilter Core Team
[    3.406026] NET: Registered protocol family 10
[    3.406172] NET: Registered protocol family 17
[    3.406179] bridge: automatic filtering via arp/ip/ip6tables has been =
deprecated. Update your scripts to load br_netfilter if you need this.
[    3.406390] AVX2 version of gcm_enc/dec engaged.
[    3.406391] AES CTR mode by8 optimization enabled
[    3.427479] Loading compiled-in X.509 certificates
[    3.427487] registered taskstats version 1
[    3.427692] Btrfs loaded
[    3.429770]   Magic number: 8:863:650
[    3.429779] scsi_host host4: hash matches
[    3.429781] scsi host4: hash matches
[    3.429833] acpi LNXCPU:03: hash matches
[    3.429856] console [netcon0] enabled
[    3.429857] netconsole: network logging started
[    3.429859] hctosys: unable to open rtc device (rtc0)
[    3.429916] ALSA device list:
[    3.429916]   No soundcards found.
[    3.490962] ata1: SATA link up 6.0 Gbps (SStatus 133 SControl 300)
[    3.490985] ata6: SATA link up 1.5 Gbps (SStatus 113 SControl 300)
[    3.491305] ata1.00: ACPI cmd ef/02:00:00:00:00:a0 (SET FEATURES) succ=
eeded
[    3.491309] ata1.00: ACPI cmd f5/00:00:00:00:00:a0 (SECURITY FREEZE LO=
CK) filtered out
[    3.491681] ata1.00: ATA-9: TOSHIBA THNSNJ512GCSU, JULA0101, max UDMA/=
100
[    3.491685] ata1.00: 1000215216 sectors, multi 16: LBA48 NCQ (depth 31=
/32), AA
[    3.492324] ata1.00: ACPI cmd ef/02:00:00:00:00:a0 (SET FEATURES) succ=
eeded
[    3.492328] ata1.00: ACPI cmd f5/00:00:00:00:00:a0 (SECURITY FREEZE LO=
CK) filtered out
[    3.492731] ata1.00: configured for UDMA/100
[    3.492851] scsi 0:0:0:0: Direct-Access     ATA      TOSHIBA THNSNJ51 =
0101 PQ: 0 ANSI: 5
[    3.493152] sd 0:0:0:0: [sda] 1000215216 512-byte logical blocks: (512=
 GB/476 GiB)
[    3.493306] sd 0:0:0:0: [sda] Write Protect is off
[    3.493310] sd 0:0:0:0: [sda] Mode Sense: 00 3a 00 00
[    3.493347] sd 0:0:0:0: [sda] Write cache: enabled, read cache: enable=
d, doesn't support DPO or FUA
[    3.494601]  sda: sda1 sda2 sda3 sda4 sda5
[    3.495040] sd 0:0:0:0: [sda] Attached SCSI disk
[    3.495210] ata6.00: ACPI cmd e3/00:1f:00:00:00:a0 (IDLE) succeeded
[    3.495410] ata6.00: ACPI cmd e3/00:02:00:00:00:a0 (IDLE) succeeded
[    3.497296] ata6.00: ATAPI: HL-DT-ST DVDRAM GU90N, LU20, max UDMA/133
[    3.501055] ata6.00: ACPI cmd e3/00:1f:00:00:00:a0 (IDLE) succeeded
[    3.501382] ata6.00: ACPI cmd e3/00:02:00:00:00:a0 (IDLE) succeeded
[    3.504636] ata6.00: configured for UDMA/133
[    3.508539] scsi 5:0:0:0: CD-ROM            HL-DT-ST DVDRAM GU90N     =
LU20 PQ: 0 ANSI: 5
[    3.521701] Freeing unused kernel memory: 1060K (ffffffffa1cc3000 - ff=
ffffffa1dcc000)
[    3.521704] Write protecting the kernel read-only data: 12288k
[    3.521866] Freeing unused kernel memory: 196K (ffff8800217cf000 - fff=
f880021800000)
[    3.522069] Freeing unused kernel memory: 1312K (ffff880021ab8000 - ff=
ff880021c00000)
[    3.549229] random: systemd urandom read with 25 bits of entropy avail=
able
[    3.549425] systemd[1]: systemd 222 running in system mode. (+PAM +AUD=
IT +SELINUX +IMA -APPARMOR +SMACK +SYSVINIT +UTMP +LIBCRYPTSETUP +GCRYPT =
+GNUTLS +ACL +XZ -LZ4 +SECCOMP +BLKID +ELFUTILS +KMOD +IDN)
[    3.549539] systemd[1]: Detected architecture x86-64.
[    3.549541] systemd[1]: Running in initial RAM disk.
[    3.549550] systemd[1]: Set hostname to <zyxyz>.
[    3.575141] systemd[1]: Reached target Swap.
[    3.575148] systemd[1]: Starting Swap.
[    3.575183] systemd[1]: Created slice -.slice.
[    3.575188] systemd[1]: Starting -.slice.
[    3.575205] systemd[1]: Listening on Journal Socket (/dev/log).
[    3.575209] systemd[1]: Starting Journal Socket (/dev/log).
[    3.575896] systemd[1]: Listening on Journal Audit Socket.
[    3.575921] systemd[1]: Listening on Journal Socket.
[    3.575927] systemd[1]: Starting Journal Socket.
[    3.575932] systemd[1]: Reached target Timers.
[    3.575936] systemd[1]: Starting Timers.
[    3.575945] systemd[1]: Reached target Local File Systems.
[    3.575951] systemd[1]: Starting Local File Systems.
[    3.575990] systemd[1]: Created slice System Slice.
[    3.576004] systemd[1]: Starting System Slice.
[    3.576024] systemd[1]: Started dracut ask for additional cmdline para=
meters.
[    3.576233] systemd[1]: Starting Journal Service...
[    3.576520] systemd[1]: Starting dracut cmdline hook...
[    3.576765] systemd[1]: Starting Setup Virtual Console...
[    3.576774] systemd[1]: Reached target Slices.
[    3.576782] systemd[1]: Starting Slices.
[    3.576855] systemd[1]: Started Load Kernel Modules.
[    3.576904] systemd[1]: Created slice system-systemd\x2dcryptsetup.sli=
ce.
[    3.576910] systemd[1]: Starting system-systemd\x2dcryptsetup.slice.
[    3.577114] systemd[1]: Starting Apply Kernel Variables...
[    3.577299] systemd[1]: Starting Create list of required static device=
 nodes for the current kernel...
[    3.577324] systemd[1]: Listening on udev Control Socket.
[    3.577329] systemd[1]: Starting udev Control Socket.
[    3.577342] systemd[1]: Listening on udev Kernel Socket.
[    3.577345] systemd[1]: Starting udev Kernel Socket.
[    3.577350] systemd[1]: Reached target Sockets.
[    3.577354] systemd[1]: Starting Sockets.
[    3.577907] systemd[1]: Started Apply Kernel Variables.
[    3.578452] systemd[1]: Started Create list of required static device =
nodes for the current kernel.
[    3.579771] systemd[1]: Starting Create Static Device Nodes in /dev...
[    3.582352] systemd[1]: Started Create Static Device Nodes in /dev.
[    3.592873] systemd[1]: Started Journal Service.
[    3.678034] usb 3-1: new high-speed USB device number 2 using ehci-pci
[    3.708489] e1000e 0000:00:19.0 enp0s25: renamed from eth0
[    3.709192] sdhci: Secure Digital Host Controller Interface driver
[    3.709194] sdhci: Copyright(c) Pierre Ossman
[    3.709328] sdhci-pci 0000:02:00.0: SDHCI controller found [1217:8520]=
 (rev 1)
[    3.711182] mmc0: Unknown controller version (3). You may experience p=
roblems.
[    3.711222] sdhci-pci 0000:02:00.0: No vmmc regulator found
[    3.711223] sdhci-pci 0000:02:00.0: No vqmmc regulator found
[    3.714921] mmc0: SDHCI controller on PCI [0000:02:00.0] using ADMA
[    3.715063] usb 1-6: new full-speed USB device number 2 using xhci_hcd
[    3.793513] usb 3-1: New USB device found, idVendor=3D8087, idProduct=3D=
8000
[    3.793516] usb 3-1: New USB device strings: Mfr=3D0, Product=3D0, Ser=
ialNumber=3D0
[    3.793737] hub 3-1:1.0: USB hub found
[    3.793872] hub 3-1:1.0: 8 ports detected
[    3.878389] psmouse serio1: synaptics: queried max coordinates: x [..5=
112], y [..3834]
[    3.884473] usb 1-6: New USB device found, idVendor=3D045e, idProduct=3D=
07b2
[    3.884476] usb 1-6: New USB device strings: Mfr=3D1, Product=3D2, Ser=
ialNumber=3D0
[    3.884478] usb 1-6: Product: Microsoft=AE Nano Transceiver v1.0
[    3.884479] usb 1-6: Manufacturer: Microsoft
[    3.887939] input: Microsoft Microsoft=AE Nano Transceiver v1.0 as /de=
vices/pci0000:00/0000:00:14.0/usb1/1-6/1-6:1.0/0003:045E:07B2.0001/input/=
input9
[    3.911482] psmouse serio1: synaptics: queried min coordinates: x [102=
4..], y [1024..]
[    3.911489] psmouse serio1: synaptics: quirked min/max coordinates: x =
[1024..5112], y [2024..4832]
[    3.938525] hid-generic 0003:045E:07B2.0001: input,hidraw0: USB HID v1=
.11 Keyboard [Microsoft Microsoft=AE Nano Transceiver v1.0] on usb-0000:0=
0:14.0-6/input0
[    3.942759] input: Microsoft Microsoft=AE Nano Transceiver v1.0 as /de=
vices/pci0000:00/0000:00:14.0/usb1/1-6/1-6:1.1/0003:045E:07B2.0002/input/=
input10
[    3.942922] hid-generic 0003:045E:07B2.0002: input,hidraw1: USB HID v1=
.11 Mouse [Microsoft Microsoft=AE Nano Transceiver v1.0] on usb-0000:00:1=
4.0-6/input1
[    3.958274] input: Microsoft Microsoft=AE Nano Transceiver v1.0 as /de=
vices/pci0000:00/0000:00:14.0/usb1/1-6/1-6:1.2/0003:045E:07B2.0003/input/=
input11
[    3.977602] psmouse serio1: synaptics: Touchpad model: 1, fw: 8.1, id:=
 0x1e2b1, caps: 0xd001a3/0x940300/0x127c00/0x0, board id: 2722, fw id: 14=
84859
[    3.977611] psmouse serio1: synaptics: serio: Synaptics pass-through p=
ort at isa0060/serio1/input0
[    4.009653] hid-generic 0003:045E:07B2.0003: input,hiddev0,hidraw2: US=
B HID v1.11 Device [Microsoft Microsoft=AE Nano Transceiver v1.0] on usb-=
0000:00:14.0-6/input2
[    4.019041] input: SynPS/2 Synaptics TouchPad as /devices/platform/i80=
42/serio1/input/input7
[    4.162491] usb 1-7: new full-speed USB device number 3 using xhci_hcd
[    4.329138] usb 1-7: New USB device found, idVendor=3D138a, idProduct=3D=
0017
[    4.329153] usb 1-7: New USB device strings: Mfr=3D0, Product=3D0, Ser=
ialNumber=3D1
[    4.329155] usb 1-7: SerialNumber: d0d58e1c7002
[    4.482744] usb 1-11: new full-speed USB device number 4 using xhci_hc=
d
[    4.648430] usb 1-11: New USB device found, idVendor=3D8087, idProduct=
=3D07dc
[    4.648434] usb 1-11: New USB device strings: Mfr=3D0, Product=3D0, Se=
rialNumber=3D0
[    4.802005] usb 1-12: new high-speed USB device number 5 using xhci_hc=
d
[    5.035676] usb 1-12: New USB device found, idVendor=3D04f2, idProduct=
=3Db39a
[    5.035684] usb 1-12: New USB device strings: Mfr=3D1, Product=3D2, Se=
rialNumber=3D0
[    5.035689] usb 1-12: Product: Integrated Camera
[    5.035692] usb 1-12: Manufacturer: SunplusIT INC.
[    5.340674] random: nonblocking pool is initialized
[    6.502853] BTRFS: device label fedora_zyxyz devid 1 transid 942784 /d=
ev/dm-0
[    6.522634] BTRFS info (device dm-0): disk space caching is enabled
[    6.658657] BTRFS: detected SSD devices, enabling SSD mode
[    6.849384] systemd-journald[211]: Received SIGTERM from PID 1 (system=
d).
[    6.887122] systemd[1]: RTC configured in localtime, applying delta of=
 -360 minutes to system time.
[    6.965240] BTRFS info (device dm-0): disk space caching is enabled
[    7.149898] rtc_cmos 00:02: RTC can wake from S4
[    7.150005] rtc_cmos 00:02: rtc core: registered rtc_cmos as rtc0
[    7.150028] rtc_cmos 00:02: alarms up to one month, y3k, 114 bytes nvr=
am, hpet irqs
[    7.182687] Intel(R) Wireless WiFi driver for Linux
[    7.182690] Copyright(c) 2003- 2015 Intel Corporation
[    7.186112] snd_hda_intel 0000:00:03.0: bound 0000:00:02.0 (ops 0xffff=
ffffa188de80)
[    7.189931] iwlwifi 0000:03:00.0: Direct firmware load for iwlwifi-726=
0-15.ucode failed with error -2
[    7.189950] iwlwifi 0000:03:00.0: Direct firmware load for iwlwifi-726=
0-14.ucode failed with error -2
[    7.199038] iwlwifi 0000:03:00.0: loaded firmware version 25.30.13.0 o=
p_mode iwlmvm
[    7.201536] input: HDA Intel HDMI HDMI/DP,pcm=3D3 as /devices/pci0000:=
00/0000:00:03.0/sound/card0/input13
[    7.201572] input: HDA Intel HDMI HDMI/DP,pcm=3D7 as /devices/pci0000:=
00/0000:00:03.0/sound/card0/input14
[    7.201603] input: HDA Intel HDMI HDMI/DP,pcm=3D8 as /devices/pci0000:=
00/0000:00:03.0/sound/card0/input15
[    7.203521] snd_hda_codec_realtek hdaudioC1D0: autoconfig for ALC3232:=
 line_outs=3D1 (0x14/0x0/0x0/0x0/0x0) type:speaker
[    7.203525] snd_hda_codec_realtek hdaudioC1D0:    speaker_outs=3D0 (0x=
0/0x0/0x0/0x0/0x0)
[    7.203527] snd_hda_codec_realtek hdaudioC1D0:    hp_outs=3D2 (0x16/0x=
15/0x0/0x0/0x0)
[    7.203529] snd_hda_codec_realtek hdaudioC1D0:    mono: mono_out=3D0x0
[    7.203531] snd_hda_codec_realtek hdaudioC1D0:    inputs:
[    7.203533] snd_hda_codec_realtek hdaudioC1D0:      Dock Mic=3D0x19
[    7.203534] snd_hda_codec_realtek hdaudioC1D0:      Mic=3D0x1a
[    7.203536] snd_hda_codec_realtek hdaudioC1D0:      Internal Mic=3D0x1=
2
[    7.225465] iwlwifi 0000:03:00.0: Detected Intel(R) Wireless N 7260, R=
EV=3D0x144
[    7.225548] iwlwifi 0000:03:00.0: L1 Enabled - LTR Enabled
[    7.225832] iwlwifi 0000:03:00.0: L1 Enabled - LTR Enabled
[    7.227428] input: HDA Intel PCH Dock Mic as /devices/pci0000:00/0000:=
00:1b.0/sound/card1/input16
[    7.227483] input: HDA Intel PCH Mic as /devices/pci0000:00/0000:00:1b=
.0/sound/card1/input17
[    7.227533] input: HDA Intel PCH Dock Headphone as /devices/pci0000:00=
/0000:00:1b.0/sound/card1/input18
[    7.227578] input: HDA Intel PCH Headphone as /devices/pci0000:00/0000=
:00:1b.0/sound/card1/input19
[    7.234402] cfg80211: World regulatory domain updated:
[    7.234406] cfg80211:  DFS Master region: unset
[    7.234408] cfg80211:   (start_freq - end_freq @ bandwidth), (max_ante=
nna_gain, max_eirp), (dfs_cac_time)
[    7.234411] cfg80211:   (2402000 KHz - 2472000 KHz @ 40000 KHz), (N/A,=
 2000 mBm), (N/A)
[    7.234413] cfg80211:   (2457000 KHz - 2482000 KHz @ 20000 KHz, 92000 =
KHz AUTO), (N/A, 2000 mBm), (N/A)
[    7.234415] cfg80211:   (2474000 KHz - 2494000 KHz @ 20000 KHz), (N/A,=
 2000 mBm), (N/A)
[    7.234417] cfg80211:   (5170000 KHz - 5250000 KHz @ 80000 KHz, 160000=
 KHz AUTO), (N/A, 2000 mBm), (N/A)
[    7.234419] cfg80211:   (5250000 KHz - 5330000 KHz @ 80000 KHz, 160000=
 KHz AUTO), (N/A, 2000 mBm), (0 s)
[    7.234421] cfg80211:   (5490000 KHz - 5730000 KHz @ 160000 KHz), (N/A=
, 2000 mBm), (0 s)
[    7.234423] cfg80211:   (5735000 KHz - 5835000 KHz @ 80000 KHz), (N/A,=
 2000 mBm), (N/A)
[    7.234425] cfg80211:   (57240000 KHz - 63720000 KHz @ 2160000 KHz), (=
N/A, 0 mBm), (N/A)
[    7.279033] EXT4-fs (sda1): mounted filesystem with ordered data mode.=
 Opts: (null)
[    7.280603] systemd-journald[636]: Received request to flush runtime j=
ournal from PID 1
[    7.290808] FAT-fs (sda2): Volume was not properly unmounted. Some dat=
a may be corrupt. Please run fsck.
[    7.433203] ieee80211 phy0: Selected rate control algorithm 'iwl-mvm-r=
s'
[    7.434996] iwlwifi 0000:03:00.0 wlp3s0: renamed from wlan0
[    7.454885] cfg80211: Regulatory domain changed to country: US
[    7.454888] cfg80211:  DFS Master region: FCC
[    7.454889] cfg80211:   (start_freq - end_freq @ bandwidth), (max_ante=
nna_gain, max_eirp), (dfs_cac_time)
[    7.454891] cfg80211:   (2402000 KHz - 2472000 KHz @ 40000 KHz), (N/A,=
 3000 mBm), (N/A)
[    7.454893] cfg80211:   (5170000 KHz - 5250000 KHz @ 80000 KHz, 160000=
 KHz AUTO), (N/A, 2300 mBm), (N/A)
[    7.454895] cfg80211:   (5250000 KHz - 5330000 KHz @ 80000 KHz, 160000=
 KHz AUTO), (N/A, 2300 mBm), (0 s)
[    7.454896] cfg80211:   (5490000 KHz - 5730000 KHz @ 160000 KHz), (N/A=
, 2300 mBm), (0 s)
[    7.454897] cfg80211:   (5735000 KHz - 5835000 KHz @ 80000 KHz), (N/A,=
 3000 mBm), (N/A)
[    7.454898] cfg80211:   (57240000 KHz - 63720000 KHz @ 2160000 KHz), (=
N/A, 4000 mBm), (N/A)
[    8.229849] psmouse serio2: trackpoint: IBM TrackPoint firmware: 0x0e,=
 buttons: 3/3
[    8.456180] input: TPPS/2 IBM TrackPoint as /devices/platform/i8042/se=
rio1/serio2/input/input12
[    8.623460] nf_conntrack version 0.5.0 (65536 buckets, 262144 max)
[    8.636345] ip6_tables: (C) 2000-2006 Netfilter Core Team
[    8.833177] ACPI Warning: \_SB_.PCI0.PEG_.VID_._DSM: Argument #4 type =
mismatch - Found [Buffer], ACPI requires [Package] (20150619/nsarguments-=
95)
[    8.833402] ACPI Warning: \_SB_.PCI0.PEG_.VID_._DSM: Argument #4 type =
mismatch - Found [Buffer], ACPI requires [Package] (20150619/nsarguments-=
95)
[    8.833700] nouveau 0000:01:00.0: DRM: suspending console...
[    8.833705] nouveau 0000:01:00.0: DRM: suspending display...
[    8.833725] nouveau 0000:01:00.0: DRM: evicting buffers...
[    8.833727] nouveau 0000:01:00.0: DRM: waiting for kernel channels to =
go idle...
[    8.833744] nouveau 0000:01:00.0: DRM: suspending client object trees.=
..
[    8.839270] nouveau 0000:01:00.0: DRM: suspending kernel object tree..=
.
[    8.847047] Netfilter messages via NETLINK v0.30.
[    9.878304] IPv6: ADDRCONF(NETDEV_UP): wlp3s0: link is not ready
[    9.880068] iwlwifi 0000:03:00.0: L1 Enabled - LTR Enabled
[    9.880334] iwlwifi 0000:03:00.0: L1 Enabled - LTR Enabled
[    9.920323] nouveau 0000:01:00.0: DRM: re-enabling device...
[    9.920333] nouveau 0000:01:00.0: DRM: resuming kernel object tree...
[   10.082305] iwlwifi 0000:03:00.0: L1 Enabled - LTR Enabled
[   10.082571] iwlwifi 0000:03:00.0: L1 Enabled - LTR Enabled
[   10.103378] IPv6: ADDRCONF(NETDEV_UP): wlp3s0: link is not ready
[   10.104466] IPv6: ADDRCONF(NETDEV_UP): enp0s25: link is not ready
[   10.184385] nouveau 0000:01:00.0: devinit: 0x64da[0]: script needs con=
nector type
[   10.307505] IPv6: ADDRCONF(NETDEV_UP): enp0s25: link is not ready
[   10.340177] IPv6: ADDRCONF(NETDEV_UP): wlp3s0: link is not ready
[   13.422926] wlp3s0: authenticate with e8:94:f6:50:6e:14
[   13.426201] wlp3s0: send auth to e8:94:f6:50:6e:14 (try 1/3)
[   13.528793] wlp3s0: authenticated
[   13.529000] wlp3s0: associate with e8:94:f6:50:6e:14 (try 1/3)
[   13.543788] wlp3s0: RX AssocResp from e8:94:f6:50:6e:14 (capab=3D0x411=
 status=3D0 aid=3D3)
[   13.544759] wlp3s0: associated
[   13.544779] IPv6: ADDRCONF(NETDEV_CHANGE): wlp3s0: link becomes ready
[   14.265952] nouveau 0000:01:00.0: DRM: resuming client object trees...
[   14.266004] nouveau 0000:01:00.0: DRM: resuming display...
[   14.266028] nouveau 0000:01:00.0: DRM: resuming console...
[   18.790286] Adjusting tsc more than 11% (8055204 vs 7777480)
[   52.821923] ACPI Warning: \_SB_.PCI0.PEG_.VID_._DSM: Argument #4 type =
mismatch - Found [Buffer], ACPI requires [Package] (20150619/nsarguments-=
95)
[   52.822562] ACPI Warning: \_SB_.PCI0.PEG_.VID_._DSM: Argument #4 type =
mismatch - Found [Buffer], ACPI requires [Package] (20150619/nsarguments-=
95)
[   52.823166] nouveau 0000:01:00.0: DRM: suspending console...
[   52.823174] nouveau 0000:01:00.0: DRM: suspending display...
[   52.823201] nouveau 0000:01:00.0: DRM: evicting buffers...
[   83.969634] nouveau 0000:01:00.0: DRM: waiting for kernel channels to =
go idle...
[   83.969663] nouveau 0000:01:00.0: DRM: suspending client object trees.=
..
[   87.978612] nouveau 0000:01:00.0: DRM: suspending kernel object tree..=
.
[   89.208749] nouveau 0000:01:00.0: DRM: re-enabling device...
[   89.208758] nouveau 0000:01:00.0: DRM: resuming kernel object tree...
[   89.472744] nouveau 0000:01:00.0: devinit: 0x64da[0]: script needs con=
nector type
[   93.567478] nouveau 0000:01:00.0: DRM: resuming client object trees...
[   97.570461] nouveau 0000:01:00.0: DRM: resuming display...
[   97.570523] nouveau 0000:01:00.0: DRM: resuming console...
[  102.887724] ACPI Warning: \_SB_.PCI0.PEG_.VID_._DSM: Argument #4 type =
mismatch - Found [Buffer], ACPI requires [Package] (20150619/nsarguments-=
95)
[  102.888088] ACPI Warning: \_SB_.PCI0.PEG_.VID_._DSM: Argument #4 type =
mismatch - Found [Buffer], ACPI requires [Package] (20150619/nsarguments-=
95)
[  102.888421] nouveau 0000:01:00.0: DRM: suspending console...
[  102.888427] nouveau 0000:01:00.0: DRM: suspending display...
[  102.888448] nouveau 0000:01:00.0: DRM: evicting buffers...
[  102.888450] nouveau 0000:01:00.0: DRM: waiting for kernel channels to =
go idle...
[  102.888477] nouveau 0000:01:00.0: DRM: suspending client object trees.=
..
[  106.897100] nouveau 0000:01:00.0: DRM: suspending kernel object tree..=
.

--uAKRQypu60I7Lcqm
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--uAKRQypu60I7Lcqm--
