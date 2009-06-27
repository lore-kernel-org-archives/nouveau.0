From: Andriy Bakay <andriy-Ru+gAU1lvYpWk0Htik3J/w@public.gmane.org>
Subject: Re: External monitor is blank with nouveau driver
Date: Sat, 27 Jun 2009 14:33:10 -0400
Message-ID: <4A4665E6.5090204@irbisnet.com>
References: <4A3D0D7A.2040105@irbisnet.com>
	<586c2acd0906210856v4af3e719na6ac9f669c7bc47c@mail.gmail.com>
	<4A418844.20900@irbisnet.com>
	<586c2acd0906231917v58911ad3j11eeff7a2a08af15@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------030702080608040905080703"
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <586c2acd0906231917v58911ad3j11eeff7a2a08af15-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Younes Manton <younes.m-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

This is a multi-part message in MIME format.
--------------030702080608040905080703
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I tried minimal xorg.conf configuration (as you suggested), but I still 
have same problem. I am sending you the configuration and logs.

In my configuration I added the following subsection into "Screen":

SubSection "Display"
      Virtual   1440 1924
EndSubSection

because in auto mode the driver set virtual size to "1440 x 1440" and it
was not enough for my two displays. And I did try the auto mode ("1440 x
1440") as well and got the same results.

Please advise.

Younes Manton wrote:
> On Tue, Jun 23, 2009 at 9:58 PM, Andriy Bakay<andriy-Ru+gAU1lvYpWk0Htik3J/w@public.gmane.org> wrote:
>> Sorry, I am sending configuration and log files.
>>
>> Younes Manton wrote:
>>> On Sat, Jun 20, 2009 at 12:25 PM, Andriy Bakay<andriy-Ru+gAU1lvYpWk0Htik3J/w@public.gmane.org> wrote:
>>>> Hi Nouveau Team,
>>>>
>>>> I have the following hardware/software spec:
>>>>
>>>> ThinkPad T61
>>>> FreeBSD 7.1-RELEASE-p5 amd64
>>>> NVIDIA Quadro NVS 140M
>>>> X driver nouveau
>>>> External monitor NEC MultiSync 90GX2
>>>>
>>>> I am connecting external monitor through VGA interface. I was able to
>>>> detect it using command 'xrandr -q' and even turn it on:
>>>>
>>>> $ xrandr --output VGA-0 --auto --below LVDS-0
>>>>
>>>> the geometry of my desktop changed, but monitor remain blank.
>>>>
>>>> Please, advise.
> 
> 1) Is that log from an instance where you tried to enable the 2nd
> monitor? I don't see anything in there about attempting to output to
> the VGA port.
> 
> 2) Can you try a minimal xorg.conf file? You don't need a lot of those
> options for the display portion. Try something like this and let the
> driver do the rest:
> 
> Section "Device"
>         Identifier      "card0"
>         Driver          "nouveau"
> EndSection
> 
> Section "Screen"
>         Identifier      "screen0"
>         Device         "card0"
> EndSection


--------------030702080608040905080703
Content-Type: text/plain;
 name="xorg.mini.conf"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="xorg.mini.conf"

Section "ServerLayout"
	Identifier     "X.org Configured"
	Screen      0  "Screen0" 0 0
#	InputDevice    "Mouse0" "CorePointer"
	InputDevice    "Synaptics_Touchpad" "CorePointer"
	InputDevice    "Keyboard0" "CoreKeyboard"
	Option         "DontZap" "Off"
	Option         "AIGLX" "true"
#	Option         "NoTrapSignals" "true"
EndSection

Section "Extensions"
	Option       "Composite" "Enable"
	Option       "XVideo" "Enable"
EndSection

Section "Files"
	ModulePath   "/usr/local/lib/xorg/modules"
	FontPath     "/usr/local/lib/X11/fonts/misc/"
	FontPath     "/usr/local/lib/X11/fonts/TTF/"
	FontPath     "/usr/local/lib/X11/fonts/OTF"
	FontPath     "/usr/local/lib/X11/fonts/Type1/"
	FontPath     "/usr/local/lib/X11/fonts/100dpi/"
	FontPath     "/usr/local/lib/X11/fonts/75dpi/"
	FontPath     "/usr/local/lib/X11/fonts/URW/"
	FontPath     "/usr/local/lib/X11/fonts/freefont/"
	FontPath     "/usr/local/lib/X11/fonts/TrueType/"
	FontPath     "/usr/local/lib/X11/fonts/bitstream-vera/"
	FontPath     "/usr/local/lib/X11/fonts/cyrillic/"
	FontPath     "/usr/local/lib/X11/fonts/dejavu/"
EndSection

Section "Module"
	Load  "extmod"
	Load  "record"
	Load  "dbe"
	Load  "glx"
	Load  "dri"
	Load  "dri2"
	Load  "synaptics"
EndSection

#Section "ServerFlags"
#	Option      "AllowEmptyInput"
#EndSection

Section "InputDevice"
	Identifier  "Keyboard0"
	Driver      "kbd"
EndSection

#Section "InputDevice"
#	Identifier  "Mouse0"
#	Driver      "mouse"
#	Option	    "Protocol" "auto"
#	Option	    "Device" "/dev/sysmouse"
#	Option	    "ZAxisMapping" "4 5 6 7"
#EndSection

Section "InputDevice"
	Identifier  "Synaptics_Touchpad"
	Driver      "synaptics"

	Option      "Device"                "/dev/psm0"
	Option      "Protocol"              "psm"

	Option      "LeftEdge"              "1400"
	Option      "RightEdge"             "5600"
	Option      "TopEdge"               "1400"
	Option      "BottomEdge"            "4700"

	Option      "FingerLow"             "25"
	Option      "FingerHigh"            "30"

	Option      "MaxTapTime"            "180"
	Option      "MaxTapMove"            "220"

	Option      "VertScrollDelta"       "100"
	Option      "HorizScrollDelta"      "100"

	Option      "MinSpeed"              "0.25"
	Option      "MaxSpeed"              "0.5"
	Option      "AccelFactor"           "0.0010"
	Option      "FastTaps"              "off"

	Option      "ScrollButtonRepeat"    "100"
	Option      "UpDownScrolling"       "on"
	Option      "UpDownRepeat"          "on"
	Option      "LeftRightScrolling"    "on"
	Option      "LeftRightRepeat"       "on"

	Option      "TapButton1"            "0"
	Option      "TapButton2"            "0"
	Option      "TapButton3"            "0"

	# "SHMConfig on" seems good works with synclient(1).  But this
	# options is insecure.  I recommended "off" as default.
	Option      "SHMConfig"             "on"

	# If you use circular touchpad, uncomment them.
	#Option          "CircularPad"           "on"
	#Option          "CircularScrolling"     "on"
	#Option          "CircScrollDelta"       "0.5"
EndSection

#Section "Monitor"
#	Identifier   "Monitor0"
#	VendorName   "Monitor Vendor"
#	ModelName    "Monitor Model"
#	Option       "DPMS"
#EndSection

Section "Monitor"
	Identifier   "LVDS-0"
	Option       "DPMS"
EndSection

Section "Monitor"
	Identifier   "VGA-0"
	Option       "DPMS"
EndSection

Section "Monitor"
	Identifier   "DVI-D-0"
	Option       "DPMS"
EndSection

Section "Device"
	Identifier  "Card0"
	Driver      "nouveau"
EndSection

Section "DRI"
	Mode 0666
EndSection

Section "Screen"
	Identifier "Screen0"
	Device     "Card0"
	SubSection "Display"
		Virtual   1440 1924
	EndSubSection
EndSection


--------------030702080608040905080703
Content-Type: text/plain;
 name="Xorg.0.log"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="Xorg.0.log"


X.Org X Server 1.6.1
Release Date: 2009-4-14
X Protocol Version 11, Revision 0
Build Operating System: FreeBSD 7.2-STABLE amd64 
Current Operating System: FreeBSD prime.irbisnet.com 7.1-RELEASE-p4 FreeBSD 7.1-RELEASE-p4 #0: Sun Mar 22 09:43:46 UTC 2009     root-rZxnQxZRaBG/BOfo2XQGoTp5fKsxn2dCSH+j9UGTDgc@public.gmane.org:/usr/obj/usr/src/sys/GENERIC amd64
Build Date: 02 June 2009  06:17:57PM
 
	Before reporting problems, check http://wiki.x.org
	to make sure that you have the latest version.
Markers: (--) probed, (**) from config file, (==) default setting,
	(++) from command line, (!!) notice, (II) informational,
	(WW) warning, (EE) error, (NI) not implemented, (??) unknown.
(==) Log file: "/var/log/Xorg.0.log", Time: Sat Jun 27 10:53:40 2009
(==) Using config file: "/etc/X11/xorg.conf"
(==) ServerLayout "X.org Configured"
(**) |-->Screen "Screen0" (0)
(**) |   |-->Monitor "<default monitor>"
(**) |   |-->Device "Card0"
(==) No monitor specified for screen "Screen0".
	Using a default monitor configuration.
(**) |-->Input Device "Synaptics_Touchpad"
(**) |-->Input Device "Keyboard0"
(**) Option "DontZap" "Off"
(**) Option "AIGLX" "true"
(==) Automatically adding devices
(==) Automatically enabling devices
(**) FontPath set to:
	/usr/local/lib/X11/fonts/misc/,
	/usr/local/lib/X11/fonts/TTF/,
	/usr/local/lib/X11/fonts/OTF,
	/usr/local/lib/X11/fonts/Type1/,
	/usr/local/lib/X11/fonts/100dpi/,
	/usr/local/lib/X11/fonts/75dpi/,
	/usr/local/lib/X11/fonts/URW/,
	/usr/local/lib/X11/fonts/freefont/,
	/usr/local/lib/X11/fonts/TrueType/,
	/usr/local/lib/X11/fonts/bitstream-vera/,
	/usr/local/lib/X11/fonts/cyrillic/,
	/usr/local/lib/X11/fonts/dejavu/,
	/usr/local/lib/X11/fonts/misc/,
	/usr/local/lib/X11/fonts/TTF/,
	/usr/local/lib/X11/fonts/OTF,
	/usr/local/lib/X11/fonts/Type1/,
	/usr/local/lib/X11/fonts/100dpi/,
	/usr/local/lib/X11/fonts/75dpi/,
	built-ins
(**) ModulePath set to "/usr/local/lib/xorg/modules"
(**) Extension "Composite" is enabled
(**) Extension "XVideo" is enabled
(WW) AllowEmptyInput is on, devices using drivers 'kbd', 'mouse' or 'vmmouse' will be disabled.
(WW) Disabling Keyboard0
(II) Loader magic: 0x3560
(II) Module ABI versions:
	X.Org ANSI C Emulation: 0.4
	X.Org Video Driver: 5.0
	X.Org XInput driver : 4.0
	X.Org Server Extension : 2.0
(II) Loader running on freebsd
(--) Using syscons driver with X support (version 2.0)
(--) using VT number 9

(--) PCI:*(0@1:0:0) nVidia Corporation Quadro NVS 140M rev 161, Mem @ 0xd2000000/16777216, 0xe0000000/268435456, 0xd0000000/33554432, I/O @ 0x00002000/128, BIOS @ 0x????????/65536
(II) System resource ranges:
	[0] -1	0	0x000f0000 - 0x000fffff (0x10000) MX[B]
	[1] -1	0	0x000c0000 - 0x000effff (0x30000) MX[B]
	[2] -1	0	0x00000000 - 0x0009ffff (0xa0000) MX[B]
	[3] -1	0	0x0000ffff - 0x0000ffff (0x1) IX[B]
	[4] -1	0	0x00000000 - 0x000000ff (0x100) IX[B]
(II) "extmod" will be loaded. This was enabled by default and also specified in the config file.
(II) "dbe" will be loaded. This was enabled by default and also specified in the config file.
(II) "glx" will be loaded. This was enabled by default and also specified in the config file.
(II) "record" will be loaded. This was enabled by default and also specified in the config file.
(II) "dri" will be loaded. This was enabled by default and also specified in the config file.
(II) "dri2" will be loaded. This was enabled by default and also specified in the config file.
(II) LoadModule: "extmod"
(II) Loading /usr/local/lib/xorg/modules/extensions//libextmod.so
(II) Module extmod: vendor="X.Org Foundation"
	compiled for 1.6.1, module version = 1.0.0
	Module class: X.Org Server Extension
	ABI class: X.Org Server Extension, version 2.0
(II) Loading extension MIT-SCREEN-SAVER
(II) Loading extension XFree86-VidModeExtension
(II) Loading extension XFree86-DGA
(II) Loading extension DPMS
(II) Loading extension XVideo
(II) Loading extension XVideo-MotionCompensation
(II) Loading extension X-Resource
(II) LoadModule: "record"
(II) Loading /usr/local/lib/xorg/modules/extensions//librecord.so
(II) Module record: vendor="X.Org Foundation"
	compiled for 1.6.1, module version = 1.13.0
	Module class: X.Org Server Extension
	ABI class: X.Org Server Extension, version 2.0
(II) Loading extension RECORD
(II) LoadModule: "dbe"
(II) Loading /usr/local/lib/xorg/modules/extensions//libdbe.so
(II) Module dbe: vendor="X.Org Foundation"
	compiled for 1.6.1, module version = 1.0.0
	Module class: X.Org Server Extension
	ABI class: X.Org Server Extension, version 2.0
(II) Loading extension DOUBLE-BUFFER
(II) LoadModule: "glx"
(II) Loading /usr/local/lib/xorg/modules/extensions//libglx.so
(II) Module glx: vendor="X.Org Foundation"
	compiled for 1.6.1, module version = 1.0.0
	ABI class: X.Org Server Extension, version 2.0
(**) AIGLX enabled
(II) Loading extension GLX
(II) LoadModule: "dri"
(II) Loading /usr/local/lib/xorg/modules/extensions//libdri.so
(II) Module dri: vendor="X.Org Foundation"
	compiled for 1.6.1, module version = 1.0.0
	ABI class: X.Org Server Extension, version 2.0
(II) Loading extension XFree86-DRI
(II) LoadModule: "dri2"
(II) Loading /usr/local/lib/xorg/modules/extensions//libdri2.so
(II) Module dri2: vendor="X.Org Foundation"
	compiled for 1.6.1, module version = 1.0.0
	ABI class: X.Org Server Extension, version 2.0
(II) Loading extension DRI2
(II) LoadModule: "synaptics"
(II) Loading /usr/local/lib/xorg/modules/input//synaptics_drv.so
(II) Module synaptics: vendor="X.Org Foundation"
	compiled for 1.6.1, module version = 1.1.2
	Module class: X.Org XInput Driver
	ABI class: X.Org XInput driver, version 4.0
(II) LoadModule: "nouveau"
(II) Loading /usr/local/lib/xorg/modules/drivers//nouveau_drv.so
(II) Module nouveau: vendor="X.Org Foundation"
	compiled for 1.6.1, module version = 0.0.10
	Module class: X.Org Video Driver
	ABI class: X.Org Video Driver, version 5.0
(II) LoadModule: "synaptics"
(II) Reloading /usr/local/lib/xorg/modules/input//synaptics_drv.so
(II) NOUVEAU driver 20090514.9656762
(II) NOUVEAU driver for NVIDIA chipset families :
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
	GeForce 8   (G8x)
(II) Primary Device is: PCI 01@00:00:0
(II) resource ranges after probing:
	[0] -1	0	0x000f0000 - 0x000fffff (0x10000) MX[B]
	[1] -1	0	0x000c0000 - 0x000effff (0x30000) MX[B]
	[2] -1	0	0x00000000 - 0x0009ffff (0xa0000) MX[B]
	[3] -1	0	0x0000ffff - 0x0000ffff (0x1) IX[B]
	[4] -1	0	0x00000000 - 0x000000ff (0x100) IX[B]
(--) NOUVEAU(0): Chipset: "NVIDIA NV86"
(II) Loading sub module "int10"
(II) LoadModule: "int10"
(II) Loading /usr/local/lib/xorg/modules//libint10.so
(II) Module int10: vendor="X.Org Foundation"
	compiled for 1.6.1, module version = 1.0.0
	ABI class: X.Org Video Driver, version 5.0
(II) NOUVEAU(0): Initializing int10
(==) NOUVEAU(0): Write-combining range (0xa0000,0x20000) was already clear
(==) NOUVEAU(0): Write-combining range (0xc0000,0x40000) was already clear
(II) NOUVEAU(0): Primary V_BIOS segment is: 0xc000
(==) NOUVEAU(0): Write-combining range (0x0,0x1000) was already clear
(II) Loading sub module "dri"
(II) LoadModule: "dri"
(II) Reloading /usr/local/lib/xorg/modules/extensions//libdri.so
(II) NOUVEAU(0): Loaded DRI module
drmOpenDevice: node name is /dev/dri/card0
drmOpenDevice: open result is -1, (No such file or directory)
drmOpenDevice: open result is -1, (No such file or directory)
drmOpenDevice: Open failed
drmOpenDevice: node name is /dev/dri/card0
drmOpenDevice: open result is -1, (No such file or directory)
drmOpenDevice: open result is -1, (No such file or directory)
drmOpenDevice: Open failed
[drm] failed to load kernel module "nouveau"
(EE) [drm] drmOpen failed.
(EE) NOUVEAU(0): [drm] error opening the drm
(!!) NOUVEAU(0): Failing back to NoAccel mode
(--) NOUVEAU(0): VESA-HACK: Console VGA mode is 0x3
(==) NOUVEAU(0): Depth 24, (--) framebuffer bpp 32
(==) NOUVEAU(0): RGB weight 888
(==) NOUVEAU(0): Default visual is TrueColor
(II) Loading sub module "vgahw"
(II) LoadModule: "vgahw"
(II) Loading /usr/local/lib/xorg/modules//libvgahw.so
(II) Module vgahw: vendor="X.Org Foundation"
	compiled for 1.6.1, module version = 0.1.0
	ABI class: X.Org Video Driver, version 5.0
(==) NOUVEAU(0): Randr1.2 support enabled
(==) NOUVEAU(0): Using HW cursor
(--) NOUVEAU(0): Linear framebuffer at 0xE0000000
(--) NOUVEAU(0): MMIO registers at 0xD2000000
(II) NOUVEAU(0): Initial CRTC_OWNER is 0
(II) NOUVEAU(0): Attempting to load BIOS image from PROM
(!!) NOUVEAU(0): ... BIOS signature not found
(II) NOUVEAU(0): Attempting to load BIOS image from PRAMIN
(II) NOUVEAU(0): ... appears to be valid
(II) NOUVEAU(0): BIT BIOS found
(II) NOUVEAU(0): Bios version 60.86.3e.00
(WW) NOUVEAU(0): TMDS table revision 2.0 not currently supported
(II) NOUVEAU(0): Found Display Configuration Block version 4.0
(!!) NOUVEAU(0): Raw DCB entry 0: 01000323 00010034
(WW) NOUVEAU(0): G80+ LVDS not initialized by driver; ignoring conf bits
(!!) NOUVEAU(0): Raw DCB entry 1: 02811300 00000028
(!!) NOUVEAU(0): Raw DCB entry 2: 02822312 00010030
(!!) NOUVEAU(0): Raw DCB entry 3: 014333f1 0080c080
(!!) NOUVEAU(0): Raw DCB entry 4: 0000000e 00000000
(--) NOUVEAU(0): Parsing VBIOS init table 0 at offset 0xDD0F
(--) NOUVEAU(0): Parsing VBIOS init table 1 at offset 0xE04F
(--) NOUVEAU(0): Parsing VBIOS init table 2 at offset 0xEAA4
(--) NOUVEAU(0): Parsing VBIOS init table 3 at offset 0xEB96
(--) NOUVEAU(0): Parsing VBIOS init table 4 at offset 0xED83
(II) NOUVEAU(0): NV50DispPreInit is called.
(WW) NOUVEAU(0): DCB encoder type 1 not known
(II) NOUVEAU(0): I2C bus "LVDS-0" initialized.
(II) NOUVEAU(0): I2C bus "VGA-0" initialized.
(II) NOUVEAU(0): I2C bus "DVI-D-0" initialized.
(II) NOUVEAU(0): Output VGA-0 using monitor section VGA-0
(II) NOUVEAU(0): Output DVI-D-0 using monitor section DVI-D-0
(II) NOUVEAU(0): Output LVDS-0 using monitor section LVDS-0
(II) NOUVEAU(0): nv50_output_detect is called.
(II) NOUVEAU(0): NV50ConnectorDDCDetect is called.
(II) NOUVEAU(0): I2C device "VGA-0:E-EDID segment register" registered at address 0x60.
(II) NOUVEAU(0): I2C device "VGA-0:ddc2" registered at address 0xA0.
(II) NOUVEAU(0): Using bios provided load value of 256
(--) NOUVEAU(0): No Load present on DAC-1
(II) NOUVEAU(0): nv50_output_detect is called.
(II) NOUVEAU(0): NV50ConnectorDDCDetect is called.
(II) NOUVEAU(0): I2C device "DVI-D-0:E-EDID segment register" registered at address 0x60.
(II) NOUVEAU(0): I2C device "DVI-D-0:ddc2" registered at address 0xA0.
(II) NOUVEAU(0): nv50_output_detect is called.
(II) NOUVEAU(0): NV50ConnectorDDCDetect is called.
(II) NOUVEAU(0): I2C device "LVDS-0:E-EDID segment register" registered at address 0x60.
(II) NOUVEAU(0): I2C device "LVDS-0:ddc2" registered at address 0xA0.
(II) NOUVEAU(0): Detected a Digital output on LVDS-0
(II) NOUVEAU(0): Found a suitable output, index 0
(II) NOUVEAU(0): nv50_output_detect is called.
(II) NOUVEAU(0): NV50ConnectorDDCDetect is called.
(II) NOUVEAU(0): NV50ConnectorGetDDCModes is called.
(II) NOUVEAU(0): EDID vendor "LEN", prod id 16435
(II) NOUVEAU(0): LVDS-0: preferred mode is 1440x900
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): Output VGA-0 disconnected
(II) NOUVEAU(0): Output DVI-D-0 disconnected
(II) NOUVEAU(0): Output LVDS-0 connected
(II) NOUVEAU(0): Using exact sizes for initial modes
(II) NOUVEAU(0): Output LVDS-0 using initial mode 1440x900
(--) NOUVEAU(0): VideoRAM: 131072 kBytes
(==) NOUVEAU(0): Using gamma correction (1.0, 1.0, 1.0)
(--) NOUVEAU(0): Virtual size is 1440x1924 (pitch 1472)
(**) NOUVEAU(0):  Driver mode "1440x900": 102.0 MHz (scaled from 0.0 MHz), 55.7 kHz, 60.1 Hz
(II) NOUVEAU(0): Modeline "1440x900"x60.1  102.00  1440 1488 1520 1832  900 903 909 926 -hsync -vsync (55.7 kHz)
(**) NOUVEAU(0):  Driver mode "1440x900": 84.8 MHz (scaled from 0.0 MHz), 46.3 kHz, 50.0 Hz
(II) NOUVEAU(0): Modeline "1440x900"x50.0   84.82  1440 1488 1520 1832  900 903 909 926 -hsync -vsync (46.3 kHz)
(**) NOUVEAU(0):  Default mode "1152x864": 108.0 MHz (scaled from 0.0 MHz), 67.5 kHz, 75.0 Hz
(II) NOUVEAU(0): Modeline "1152x864"x75.0  108.00  1152 1216 1344 1600  864 865 868 900 +hsync +vsync (67.5 kHz)
(**) NOUVEAU(0):  Default mode "1024x768": 94.5 MHz (scaled from 0.0 MHz), 68.7 kHz, 85.0 Hz
(II) NOUVEAU(0): Modeline "1024x768"x85.0   94.50  1024 1072 1168 1376  768 769 772 808 +hsync +vsync (68.7 kHz)
(**) NOUVEAU(0):  Default mode "1024x768": 78.8 MHz (scaled from 0.0 MHz), 60.0 kHz, 75.0 Hz
(II) NOUVEAU(0): Modeline "1024x768"x75.0   78.75  1024 1040 1136 1312  768 769 772 800 +hsync +vsync (60.0 kHz)
(**) NOUVEAU(0):  Default mode "1024x768": 75.0 MHz (scaled from 0.0 MHz), 56.5 kHz, 70.1 Hz
(II) NOUVEAU(0): Modeline "1024x768"x70.1   75.00  1024 1048 1184 1328  768 771 777 806 -hsync -vsync (56.5 kHz)
(**) NOUVEAU(0):  Default mode "1024x768": 65.0 MHz (scaled from 0.0 MHz), 48.4 kHz, 60.0 Hz
(II) NOUVEAU(0): Modeline "1024x768"x60.0   65.00  1024 1048 1184 1344  768 771 777 806 -hsync -vsync (48.4 kHz)
(**) NOUVEAU(0):  Default mode "832x624": 57.3 MHz (scaled from 0.0 MHz), 49.7 kHz, 74.6 Hz
(II) NOUVEAU(0): Modeline "832x624"x74.6   57.28  832 864 928 1152  624 625 628 667 -hsync -vsync (49.7 kHz)
(**) NOUVEAU(0):  Default mode "800x600": 56.3 MHz (scaled from 0.0 MHz), 53.7 kHz, 85.1 Hz
(II) NOUVEAU(0): Modeline "800x600"x85.1   56.30  800 832 896 1048  600 601 604 631 +hsync +vsync (53.7 kHz)
(**) NOUVEAU(0):  Default mode "800x600": 50.0 MHz (scaled from 0.0 MHz), 48.1 kHz, 72.2 Hz
(II) NOUVEAU(0): Modeline "800x600"x72.2   50.00  800 856 976 1040  600 637 643 666 +hsync +vsync (48.1 kHz)
(**) NOUVEAU(0):  Default mode "800x600": 49.5 MHz (scaled from 0.0 MHz), 46.9 kHz, 75.0 Hz
(II) NOUVEAU(0): Modeline "800x600"x75.0   49.50  800 816 896 1056  600 601 604 625 +hsync +vsync (46.9 kHz)
(**) NOUVEAU(0):  Default mode "800x600": 40.0 MHz (scaled from 0.0 MHz), 37.9 kHz, 60.3 Hz
(II) NOUVEAU(0): Modeline "800x600"x60.3   40.00  800 840 968 1056  600 601 605 628 +hsync +vsync (37.9 kHz)
(**) NOUVEAU(0):  Default mode "800x600": 36.0 MHz (scaled from 0.0 MHz), 35.2 kHz, 56.2 Hz
(II) NOUVEAU(0): Modeline "800x600"x56.2   36.00  800 824 896 1024  600 601 603 625 +hsync +vsync (35.2 kHz)
(**) NOUVEAU(0):  Default mode "640x480": 36.0 MHz (scaled from 0.0 MHz), 43.3 kHz, 85.0 Hz
(II) NOUVEAU(0): Modeline "640x480"x85.0   36.00  640 696 752 832  480 481 484 509 -hsync -vsync (43.3 kHz)
(**) NOUVEAU(0):  Default mode "640x480": 31.5 MHz (scaled from 0.0 MHz), 37.9 kHz, 72.8 Hz
(II) NOUVEAU(0): Modeline "640x480"x72.8   31.50  640 664 704 832  480 489 492 520 -hsync -vsync (37.9 kHz)
(**) NOUVEAU(0):  Default mode "640x480": 31.5 MHz (scaled from 0.0 MHz), 37.5 kHz, 75.0 Hz
(II) NOUVEAU(0): Modeline "640x480"x75.0   31.50  640 656 720 840  480 481 484 500 -hsync -vsync (37.5 kHz)
(**) NOUVEAU(0):  Default mode "640x480": 25.2 MHz (scaled from 0.0 MHz), 31.5 kHz, 59.9 Hz
(II) NOUVEAU(0): Modeline "640x480"x59.9   25.18  640 656 752 800  480 490 492 525 -hsync -vsync (31.5 kHz)
(**) NOUVEAU(0):  Default mode "720x400": 35.5 MHz (scaled from 0.0 MHz), 37.9 kHz, 85.0 Hz
(II) NOUVEAU(0): Modeline "720x400"x85.0   35.50  720 756 828 936  400 401 404 446 -hsync +vsync (37.9 kHz)
(**) NOUVEAU(0):  Default mode "640x400": 31.5 MHz (scaled from 0.0 MHz), 37.9 kHz, 85.1 Hz
(II) NOUVEAU(0): Modeline "640x400"x85.1   31.50  640 672 736 832  400 401 404 445 -hsync +vsync (37.9 kHz)
(**) NOUVEAU(0):  Default mode "640x350": 31.5 MHz (scaled from 0.0 MHz), 37.9 kHz, 85.1 Hz
(II) NOUVEAU(0): Modeline "640x350"x85.1   31.50  640 672 736 832  350 382 385 445 +hsync -vsync (37.9 kHz)
(++) NOUVEAU(0): DPI set to (96, 96)
(II) Loading sub module "fb"
(II) LoadModule: "fb"
(II) Loading /usr/local/lib/xorg/modules//libfb.so
(II) Module fb: vendor="X.Org Foundation"
	compiled for 1.6.1, module version = 1.0.0
	ABI class: X.Org ANSI C Emulation, version 0.4
(II) Loading sub module "shadowfb"
(II) LoadModule: "shadowfb"
(II) Loading /usr/local/lib/xorg/modules//libshadowfb.so
(II) Module shadowfb: vendor="X.Org Foundation"
	compiled for 1.6.1, module version = 1.0.0
	ABI class: X.Org ANSI C Emulation, version 0.4
(--) Depth 24 pixmap format is 32 bpp
(II) do I need RAC?  No, I don't.
(II) resource ranges after preInit:
	[0] -1	0	0x000f0000 - 0x000fffff (0x10000) MX[B]
	[1] -1	0	0x000c0000 - 0x000effff (0x30000) MX[B]
	[2] -1	0	0x00000000 - 0x0009ffff (0xa0000) MX[B]
	[3] -1	0	0x0000ffff - 0x0000ffff (0x1) IX[B]
	[4] -1	0	0x00000000 - 0x000000ff (0x100) IX[B]
(==) NOUVEAU(0): Write-combining range (0xa0000,0x10000) was already clear
(==) NOUVEAU(0): Backing store disabled
(==) NOUVEAU(0): Silken mouse enabled
(II) NOUVEAU(0): NVEnterVT is called.
(II) NOUVEAU(0): NV50DispInit is called.
(II) NOUVEAU(0): nv50_output_get_crtc is called.
(II) NOUVEAU(0): NV50DacGetCurrentCrtc is called.
(II) NOUVEAU(0): nv50_output_dpms is called with mode 3.
(II) NOUVEAU(0): NV50DacSetPowerMode is called with mode 3.
(II) NOUVEAU(0): nv50_output_get_crtc is called.
(II) NOUVEAU(0): NV50SorGetCurrentCrtc is called.
(II) NOUVEAU(0): nv50_output_dpms is called with mode 3.
(II) NOUVEAU(0): NV50SorSetPowerMode is called with mode 3.
(II) NOUVEAU(0): nv50_output_get_crtc is called.
(II) NOUVEAU(0): NV50SorGetCurrentCrtc is called.
(II) NOUVEAU(0): nv50_output_dpms is called with mode 3.
(II) NOUVEAU(0): NV50SorSetPowerMode is called with mode 3.
(II) NOUVEAU(0): nv50_output_get_crtc is called.
(II) NOUVEAU(0): NV50DacGetCurrentCrtc is called.
(II) NOUVEAU(0): nv50_output_get_crtc is called.
(II) NOUVEAU(0): NV50SorGetCurrentCrtc is called.
(II) NOUVEAU(0): nv50_output_get_crtc is called.
(II) NOUVEAU(0): NV50SorGetCurrentCrtc is called.
(II) NOUVEAU(0): nv50_crtc_dpms is called with mode 3 for CRTC0.
(II) NOUVEAU(0): nv50_output_get_crtc is called.
(II) NOUVEAU(0): NV50DacGetCurrentCrtc is called.
(II) NOUVEAU(0): nv50_output_get_crtc is called.
(II) NOUVEAU(0): NV50SorGetCurrentCrtc is called.
(II) NOUVEAU(0): nv50_output_get_crtc is called.
(II) NOUVEAU(0): NV50SorGetCurrentCrtc is called.
(II) NOUVEAU(0): nv50_crtc_dpms is called with mode 3 for CRTC1.
(II) NOUVEAU(0): nv50_output_prepare is called.
(II) NOUVEAU(0): nv50_crtc_prepare is called for CRTC0.
(II) NOUVEAU(0): NV50DacModeSet is called.
(II) NOUVEAU(0): Disconnecting DAC.
(II) NOUVEAU(0): NV50SorModeSet is called.
(II) NOUVEAU(0): Disconnecting SOR.
(II) NOUVEAU(0): nv50_crtc_mode_set is called for CRTC0.
(II) NOUVEAU(0): NV50CrtcModeSet is called for CRTC0.
(II) NOUVEAU(0): NV50CrtcSetDither is called (no update).
(II) NOUVEAU(0): NV50CrtcBlank is called (unblanked) for CRTC0.
(II) NOUVEAU(0): nv50_output_mode_set is called.
(II) NOUVEAU(0): NV50SorModeSet is called.
(II) NOUVEAU(0): NV50SorSetPowerMode is called with mode 0.
(II) NOUVEAU(0): NV50CrtcSetScale is called with mode 2 for CRTC0.
(II) NOUVEAU(0): nv50_crtc_commit is called for CRTC0.
(II) NOUVEAU(0): NV50CrtcBlank is called (blanked) for CRTC1.
(II) NOUVEAU(0): NV50CrtcSetPixelClock is called for CRTC0.
(II) NOUVEAU(0): NV50CrtcSetClockMode is called for CRTC0.
(II) NOUVEAU(0): NV50SorSetClockMode is called.
(II) NOUVEAU(0): nv50_output_commit is called.
(II) NOUVEAU(0): nv50_output_dpms is called with mode 3.
(II) NOUVEAU(0): NV50DacSetPowerMode is called with mode 3.
(II) NOUVEAU(0): nv50_output_dpms is called with mode 3.
(II) NOUVEAU(0): NV50SorSetPowerMode is called with mode 3.
(II) NOUVEAU(0): nv50_crtc_dpms is called with mode 3 for CRTC1.
(II) NOUVEAU(0): DPMS enabled
(II) NOUVEAU(0): RandR 1.2 enabled, ignore the following RandR disabled message.
(II) NOUVEAU(0): nv50_crtc_gamma_set is called for CRTC0.
(II) NOUVEAU(0): NV50CrtcGammaSet is called for CRTC0.
(II) NOUVEAU(0): nv50_crtc_gamma_set is called for CRTC1.
(II) NOUVEAU(0): NV50CrtcGammaSet is called for CRTC1.
(--) RandR disabled
(II) Initializing built-in extension Generic Event Extension
(II) Initializing built-in extension SHAPE
(II) Initializing built-in extension MIT-SHM
(II) Initializing built-in extension XInputExtension
(II) Initializing built-in extension XTEST
(II) Initializing built-in extension BIG-REQUESTS
(II) Initializing built-in extension SYNC
(II) Initializing built-in extension XKEYBOARD
(II) Initializing built-in extension XC-MISC
(II) Initializing built-in extension XINERAMA
(II) Initializing built-in extension XFIXES
(II) Initializing built-in extension RENDER
(II) Initializing built-in extension RANDR
(II) Initializing built-in extension COMPOSITE
(II) Initializing built-in extension DAMAGE
(II) AIGLX: Screen 0 is not DRI2 capable
(II) AIGLX: Screen 0 is not DRI capable
(II) AIGLX: Loaded and initialized /usr/local/lib/dri/swrast_dri.so
(II) GLX: Initialized DRISWRAST GL provider for screen 0
(II) NOUVEAU(0): Setting screen physical size to 381 x 238
(II) Synaptics touchpad driver version 1.1.2
(**) Option "Device" "/dev/psm0"
(**) Option "SHMConfig" "on"
(**) Option "LeftEdge" "1400"
(**) Option "RightEdge" "5600"
(**) Option "TopEdge" "1400"
(**) Option "BottomEdge" "4700"
(**) Option "FingerLow" "25"
(**) Option "FingerHigh" "30"
(**) Option "MaxTapTime" "180"
(**) Option "MaxTapMove" "220"
(**) Option "FastTaps" "off"
(**) Option "VertScrollDelta" "100"
(**) Option "HorizScrollDelta" "100"
(**) Option "UpDownScrolling" "on"
(**) Option "LeftRightScrolling" "on"
(**) Option "ScrollButtonRepeat" "100"
(**) Option "TapButton1" "0"
(**) Option "TapButton2" "0"
(**) Option "TapButton3" "0"
(**) Option "MinSpeed" "0.25"
(**) Option "MaxSpeed" "0.5"
(**) Option "AccelFactor" "0.0010"
(--) Synaptics_Touchpad synaptics touchpad found
(--)  Synaptics Touchpad, model: 0
(--)  Firmware: 6.2
(--)  180 degree mounted touchpad
(--)  Sensor: 1
(--)  new absolute packet format
(--)  Touchpad has extended capability bits
(--)  -> multifinger detection
(--)  -> palm detection
(--)  -> pass-through port
(**) Option "CorePointer"
(**) Synaptics_Touchpad: always reports core events
(II) XINPUT: Adding extended input device "Synaptics_Touchpad" (type: TOUCHPAD)
(**) Synaptics_Touchpad: (accel) keeping acceleration scheme 1
(**) Synaptics_Touchpad: (accel) filter chain progression: 2.00
(**) Synaptics_Touchpad: (accel) filter stage 0: 20.00 ms
(**) Synaptics_Touchpad: (accel) set acceleration profile 0
(--) Synaptics_Touchpad synaptics touchpad found
(--)  Synaptics Touchpad, model: 0
(--)  Firmware: 6.2
(--)  180 degree mounted touchpad
(--)  Sensor: 1
(--)  new absolute packet format
(--)  Touchpad has extended capability bits
(--)  -> multifinger detection
(--)  -> palm detection
(--)  -> pass-through port
(WW) fcntl(8, O_ASYNC): Inappropriate ioctl for device
(II) config/hal: Adding input device AT Keyboard
(II) LoadModule: "kbd"
(II) Loading /usr/local/lib/xorg/modules/input//kbd_drv.so
(II) Module kbd: vendor="X.Org Foundation"
	compiled for 1.6.1, module version = 1.3.2
	Module class: X.Org XInput Driver
	ABI class: X.Org XInput driver, version 4.0
(**) AT Keyboard: always reports core events
(**) Option "Protocol" "standard"
(**) AT Keyboard: Protocol: standard
(**) Option "AutoRepeat" "500 30"
(**) Option "XkbRules" "xorg"
(**) AT Keyboard: XkbRules: "xorg"
(**) Option "XkbModel" "pc105"
(**) AT Keyboard: XkbModel: "pc105"
(**) Option "XkbLayout" "us"
(**) AT Keyboard: XkbLayout: "us"
(**) Option "CustomKeycodes" "off"
(**) AT Keyboard: CustomKeycodes disabled
(II) XINPUT: Adding extended input device "AT Keyboard" (type: KEYBOARD)
(II) config/hal: Adding input device PS/2 Mouse
(II) LoadModule: "mouse"
(II) Loading /usr/local/lib/xorg/modules/input//mouse_drv.so
(II) Module mouse: vendor="X.Org Foundation"
	compiled for 1.6.1, module version = 1.4.0
	Module class: X.Org XInput Driver
	ABI class: X.Org XInput driver, version 4.0
(**) PS/2 Mouse: Device: "/dev/psm0"
(==) PS/2 Mouse: Protocol: "Auto"
(**) PS/2 Mouse: always reports core events
(**) Option "Device" "/dev/psm0"
(EE) xf86OpenSerial: Cannot open device /dev/psm0
	Device busy.
(EE) PS/2 Mouse: cannot open input device
(EE) PreInit failed for input device "PS/2 Mouse"
(II) UnloadModule: "mouse"
(EE) config/hal: NewInputDeviceRequest failed (8)
(II) NOUVEAU(0): nv50_output_detect is called.
(II) NOUVEAU(0): NV50ConnectorDDCDetect is called.
(II) NOUVEAU(0): Using bios provided load value of 256
(--) NOUVEAU(0): No Load present on DAC-1
(II) NOUVEAU(0): nv50_output_detect is called.
(II) NOUVEAU(0): NV50ConnectorDDCDetect is called.
(II) NOUVEAU(0): nv50_output_detect is called.
(II) NOUVEAU(0): NV50ConnectorDDCDetect is called.
(II) NOUVEAU(0): Detected a Digital output on LVDS-0
(II) NOUVEAU(0): Found a suitable output, index 0
(II) NOUVEAU(0): nv50_output_detect is called.
(II) NOUVEAU(0): NV50ConnectorDDCDetect is called.
(II) NOUVEAU(0): EDID vendor "LEN", prod id 16435
(II) NOUVEAU(0): Printing DDC gathered Modelines:
(II) NOUVEAU(0): Modeline "1440x900"x0.0  102.00  1440 1488 1520 1832  900 903 909 926 -hsync -vsync (55.7 kHz)
(II) NOUVEAU(0): Modeline "1440x900"x0.0   84.82  1440 1488 1520 1832  900 903 909 926 -hsync -vsync (46.3 kHz)
(II) NOUVEAU(0): NV50ConnectorGetDDCModes is called.
(II) NOUVEAU(0): EDID vendor "LEN", prod id 16435
(II) NOUVEAU(0): LVDS-0: preferred mode is 1440x900
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_detect is called.
(II) NOUVEAU(0): NV50ConnectorDDCDetect is called.
(II) NOUVEAU(0): Using bios provided load value of 256
(--) NOUVEAU(0): No Load present on DAC-1
(II) NOUVEAU(0): nv50_output_detect is called.
(II) NOUVEAU(0): NV50ConnectorDDCDetect is called.
(II) NOUVEAU(0): nv50_output_detect is called.
(II) NOUVEAU(0): NV50ConnectorDDCDetect is called.
(II) NOUVEAU(0): Detected a Digital output on LVDS-0
(II) NOUVEAU(0): Found a suitable output, index 0
(II) NOUVEAU(0): nv50_output_detect is called.
(II) NOUVEAU(0): NV50ConnectorDDCDetect is called.
(II) NOUVEAU(0): EDID vendor "LEN", prod id 16435
(II) NOUVEAU(0): Printing DDC gathered Modelines:
(II) NOUVEAU(0): Modeline "1440x900"x0.0  102.00  1440 1488 1520 1832  900 903 909 926 -hsync -vsync (55.7 kHz)
(II) NOUVEAU(0): Modeline "1440x900"x0.0   84.82  1440 1488 1520 1832  900 903 909 926 -hsync -vsync (46.3 kHz)
(II) NOUVEAU(0): NV50ConnectorGetDDCModes is called.
(II) NOUVEAU(0): EDID vendor "LEN", prod id 16435
(II) NOUVEAU(0): LVDS-0: preferred mode is 1440x900
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_detect is called.
(II) NOUVEAU(0): NV50ConnectorDDCDetect is called.
(II) NOUVEAU(0): Detected a Analog output on VGA-0
(II) NOUVEAU(0): Found a suitable output, index 0
(II) NOUVEAU(0): nv50_output_detect is called.
(II) NOUVEAU(0): NV50ConnectorDDCDetect is called.
(II) NOUVEAU(0): NV50ConnectorGetDDCModes is called.
(II) NOUVEAU(0): EDID vendor "NEC", prod id 26258
(II) NOUVEAU(0): VGA-0: preferred mode is 1280x1024
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_detect is called.
(II) NOUVEAU(0): NV50ConnectorDDCDetect is called.
(II) NOUVEAU(0): nv50_output_detect is called.
(II) NOUVEAU(0): NV50ConnectorDDCDetect is called.
(II) NOUVEAU(0): Detected a Digital output on LVDS-0
(II) NOUVEAU(0): Found a suitable output, index 0
(II) NOUVEAU(0): nv50_output_detect is called.
(II) NOUVEAU(0): NV50ConnectorDDCDetect is called.
(II) NOUVEAU(0): EDID vendor "LEN", prod id 16435
(II) NOUVEAU(0): Printing DDC gathered Modelines:
(II) NOUVEAU(0): Modeline "1440x900"x0.0  102.00  1440 1488 1520 1832  900 903 909 926 -hsync -vsync (55.7 kHz)
(II) NOUVEAU(0): Modeline "1440x900"x0.0   84.82  1440 1488 1520 1832  900 903 909 926 -hsync -vsync (46.3 kHz)
(II) NOUVEAU(0): NV50ConnectorGetDDCModes is called.
(II) NOUVEAU(0): EDID vendor "LEN", prod id 16435
(II) NOUVEAU(0): LVDS-0: preferred mode is 1440x900
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_detect is called.
(II) NOUVEAU(0): NV50ConnectorDDCDetect is called.
(II) NOUVEAU(0): Detected a Analog output on VGA-0
(II) NOUVEAU(0): Found a suitable output, index 0
(II) NOUVEAU(0): nv50_output_detect is called.
(II) NOUVEAU(0): NV50ConnectorDDCDetect is called.
(II) NOUVEAU(0): NV50ConnectorGetDDCModes is called.
(II) NOUVEAU(0): EDID vendor "NEC", prod id 26258
(II) NOUVEAU(0): VGA-0: preferred mode is 1280x1024
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_detect is called.
(II) NOUVEAU(0): NV50ConnectorDDCDetect is called.
(II) NOUVEAU(0): nv50_output_detect is called.
(II) NOUVEAU(0): NV50ConnectorDDCDetect is called.
(II) NOUVEAU(0): Detected a Digital output on LVDS-0
(II) NOUVEAU(0): Found a suitable output, index 0
(II) NOUVEAU(0): nv50_output_detect is called.
(II) NOUVEAU(0): NV50ConnectorDDCDetect is called.
(II) NOUVEAU(0): EDID vendor "LEN", prod id 16435
(II) NOUVEAU(0): Printing DDC gathered Modelines:
(II) NOUVEAU(0): Modeline "1440x900"x0.0  102.00  1440 1488 1520 1832  900 903 909 926 -hsync -vsync (55.7 kHz)
(II) NOUVEAU(0): Modeline "1440x900"x0.0   84.82  1440 1488 1520 1832  900 903 909 926 -hsync -vsync (46.3 kHz)
(II) NOUVEAU(0): NV50ConnectorGetDDCModes is called.
(II) NOUVEAU(0): EDID vendor "LEN", prod id 16435
(II) NOUVEAU(0): LVDS-0: preferred mode is 1440x900
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_detect is called.
(II) NOUVEAU(0): NV50ConnectorDDCDetect is called.
(II) NOUVEAU(0): Detected a Analog output on VGA-0
(II) NOUVEAU(0): Found a suitable output, index 0
(II) NOUVEAU(0): nv50_output_detect is called.
(II) NOUVEAU(0): NV50ConnectorDDCDetect is called.
(II) NOUVEAU(0): NV50ConnectorGetDDCModes is called.
(II) NOUVEAU(0): EDID vendor "NEC", prod id 26258
(II) NOUVEAU(0): VGA-0: preferred mode is 1280x1024
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_detect is called.
(II) NOUVEAU(0): NV50ConnectorDDCDetect is called.
(II) NOUVEAU(0): nv50_output_detect is called.
(II) NOUVEAU(0): NV50ConnectorDDCDetect is called.
(II) NOUVEAU(0): Detected a Digital output on LVDS-0
(II) NOUVEAU(0): Found a suitable output, index 0
(II) NOUVEAU(0): nv50_output_detect is called.
(II) NOUVEAU(0): NV50ConnectorDDCDetect is called.
(II) NOUVEAU(0): EDID vendor "LEN", prod id 16435
(II) NOUVEAU(0): Printing DDC gathered Modelines:
(II) NOUVEAU(0): Modeline "1440x900"x0.0  102.00  1440 1488 1520 1832  900 903 909 926 -hsync -vsync (55.7 kHz)
(II) NOUVEAU(0): Modeline "1440x900"x0.0   84.82  1440 1488 1520 1832  900 903 909 926 -hsync -vsync (46.3 kHz)
(II) NOUVEAU(0): NV50ConnectorGetDDCModes is called.
(II) NOUVEAU(0): EDID vendor "LEN", prod id 16435
(II) NOUVEAU(0): LVDS-0: preferred mode is 1440x900
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_prepare is called.
(II) NOUVEAU(0): nv50_crtc_prepare is called for CRTC1.
(II) NOUVEAU(0): NV50SorModeSet is called.
(II) NOUVEAU(0): Disconnecting SOR.
(II) NOUVEAU(0): nv50_crtc_mode_set is called for CRTC1.
(II) NOUVEAU(0): NV50CrtcModeSet is called for CRTC1.
(II) NOUVEAU(0): NV50CrtcSetDither is called (no update).
(II) NOUVEAU(0): NV50CrtcBlank is called (unblanked) for CRTC1.
(II) NOUVEAU(0): nv50_output_mode_set is called.
(II) NOUVEAU(0): NV50DacModeSet is called.
(II) NOUVEAU(0): NV50DacSetPowerMode is called with mode 0.
(II) NOUVEAU(0): NV50CrtcSetScale is called with mode 0 for CRTC1.
(II) NOUVEAU(0): nv50_crtc_commit is called for CRTC1.
(II) NOUVEAU(0): NV50CrtcSetPixelClock is called for CRTC1.
(II) NOUVEAU(0): NV50CrtcSetClockMode is called for CRTC1.
(II) NOUVEAU(0): NV50DacSetClockMode is called.
(II) NOUVEAU(0): nv50_output_commit is called.
(II) NOUVEAU(0): nv50_output_dpms is called with mode 3.
(II) NOUVEAU(0): NV50SorSetPowerMode is called with mode 3.
(II) NOUVEAU(0): nv50_output_detect is called.
(II) NOUVEAU(0): NV50ConnectorDDCDetect is called.
(II) NOUVEAU(0): Detected a Analog output on VGA-0
(II) NOUVEAU(0): Found a suitable output, index 0
(II) NOUVEAU(0): nv50_output_detect is called.
(II) NOUVEAU(0): NV50ConnectorDDCDetect is called.
(II) NOUVEAU(0): NV50ConnectorGetDDCModes is called.
(II) NOUVEAU(0): EDID vendor "NEC", prod id 26258
(II) NOUVEAU(0): VGA-0: preferred mode is 1280x1024
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_detect is called.
(II) NOUVEAU(0): NV50ConnectorDDCDetect is called.
(II) NOUVEAU(0): nv50_output_detect is called.
(II) NOUVEAU(0): NV50ConnectorDDCDetect is called.
(II) NOUVEAU(0): Detected a Digital output on LVDS-0
(II) NOUVEAU(0): Found a suitable output, index 0
(II) NOUVEAU(0): nv50_output_detect is called.
(II) NOUVEAU(0): NV50ConnectorDDCDetect is called.
(II) NOUVEAU(0): EDID vendor "LEN", prod id 16435
(II) NOUVEAU(0): Printing DDC gathered Modelines:
(II) NOUVEAU(0): Modeline "1440x900"x0.0  102.00  1440 1488 1520 1832  900 903 909 926 -hsync -vsync (55.7 kHz)
(II) NOUVEAU(0): Modeline "1440x900"x0.0   84.82  1440 1488 1520 1832  900 903 909 926 -hsync -vsync (46.3 kHz)
(II) NOUVEAU(0): NV50ConnectorGetDDCModes is called.
(II) NOUVEAU(0): EDID vendor "LEN", prod id 16435
(II) NOUVEAU(0): LVDS-0: preferred mode is 1440x900
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_detect is called.
(II) NOUVEAU(0): NV50ConnectorDDCDetect is called.
(II) NOUVEAU(0): Detected a Analog output on VGA-0
(II) NOUVEAU(0): Found a suitable output, index 0
(II) NOUVEAU(0): nv50_output_detect is called.
(II) NOUVEAU(0): NV50ConnectorDDCDetect is called.
(II) NOUVEAU(0): NV50ConnectorGetDDCModes is called.
(II) NOUVEAU(0): EDID vendor "NEC", prod id 26258
(II) NOUVEAU(0): VGA-0: preferred mode is 1280x1024
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_detect is called.
(II) NOUVEAU(0): NV50ConnectorDDCDetect is called.
(II) NOUVEAU(0): nv50_output_detect is called.
(II) NOUVEAU(0): NV50ConnectorDDCDetect is called.
(II) NOUVEAU(0): Detected a Digital output on LVDS-0
(II) NOUVEAU(0): Found a suitable output, index 0
(II) NOUVEAU(0): nv50_output_detect is called.
(II) NOUVEAU(0): NV50ConnectorDDCDetect is called.
(II) NOUVEAU(0): EDID vendor "LEN", prod id 16435
(II) NOUVEAU(0): Printing DDC gathered Modelines:
(II) NOUVEAU(0): Modeline "1440x900"x0.0  102.00  1440 1488 1520 1832  900 903 909 926 -hsync -vsync (55.7 kHz)
(II) NOUVEAU(0): Modeline "1440x900"x0.0   84.82  1440 1488 1520 1832  900 903 909 926 -hsync -vsync (46.3 kHz)
(II) NOUVEAU(0): NV50ConnectorGetDDCModes is called.
(II) NOUVEAU(0): EDID vendor "LEN", prod id 16435
(II) NOUVEAU(0): LVDS-0: preferred mode is 1440x900
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_detect is called.
(II) NOUVEAU(0): NV50ConnectorDDCDetect is called.
(II) NOUVEAU(0): Detected a Analog output on VGA-0
(II) NOUVEAU(0): Found a suitable output, index 0
(II) NOUVEAU(0): nv50_output_detect is called.
(II) NOUVEAU(0): NV50ConnectorDDCDetect is called.
(II) NOUVEAU(0): NV50ConnectorGetDDCModes is called.
(II) NOUVEAU(0): EDID vendor "NEC", prod id 26258
(II) NOUVEAU(0): VGA-0: preferred mode is 1280x1024
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_detect is called.
(II) NOUVEAU(0): NV50ConnectorDDCDetect is called.
(II) NOUVEAU(0): nv50_output_detect is called.
(II) NOUVEAU(0): NV50ConnectorDDCDetect is called.
(II) NOUVEAU(0): Detected a Digital output on LVDS-0
(II) NOUVEAU(0): Found a suitable output, index 0
(II) NOUVEAU(0): nv50_output_detect is called.
(II) NOUVEAU(0): NV50ConnectorDDCDetect is called.
(II) NOUVEAU(0): EDID vendor "LEN", prod id 16435
(II) NOUVEAU(0): Printing DDC gathered Modelines:
(II) NOUVEAU(0): Modeline "1440x900"x0.0  102.00  1440 1488 1520 1832  900 903 909 926 -hsync -vsync (55.7 kHz)
(II) NOUVEAU(0): Modeline "1440x900"x0.0   84.82  1440 1488 1520 1832  900 903 909 926 -hsync -vsync (46.3 kHz)
(II) NOUVEAU(0): NV50ConnectorGetDDCModes is called.
(II) NOUVEAU(0): EDID vendor "LEN", prod id 16435
(II) NOUVEAU(0): LVDS-0: preferred mode is 1440x900
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.


--------------030702080608040905080703
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--------------030702080608040905080703--
