From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 27905] New: DVI monitor is blank - DVI detected as
 Display Port ?
Date: Thu, 29 Apr 2010 15:37:40 -0700 (PDT)
Message-ID: <bug-27905-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
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
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

https://bugs.freedesktop.org/show_bug.cgi?id=27905

           Summary: DVI monitor is blank - DVI detected as Display Port ?
           Product: xorg
           Version: 7.5
          Platform: x86 (IA32)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: felash-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=35336)
 --> (https://bugs.freedesktop.org/attachment.cgi?id=35336)
Xorg log

Hi,

I tried the driver nouveau now that it is in Debian'sunstable.
It works very well except for one think : the monitor connected on the
DVI port stays blank;
This monitor shows the normal boot until gdm is starting (and nouveau
kernel driver I guess).

This works perfectly with the good old nv driver.

What's strange is that it seems that the kernel detects a DisplayPort
port instead of a DVI port. BTW the name of the port is DP-1.

I use a laptop with an integrated nVidia card :
01:00.0 VGA compatible controller: nVidia Corporation G98M [Quadro NVS
160M] (rev a1)

It's in the NV50 series.

I use Debian's kernel image 2.6.32-4-686-bigmem version 2.6.32-11. This version
has drm from 2.6.33.

I didn't try newer kernel images or nouveau drivers. Please tell me if
this would be useful.

It could be related to bug 26797.

Thanks !
-- 
Julien

PS: Below is all stuff Debian's reportbug gathered, plus full dmesg boot log.

-- Package-specific info:
/var/lib/x11/X.roster does not exist.

/var/lib/x11/X.md5sum does not exist.

X server symlink status:
lrwxrwxrwx 1 root root 13 May 29  2009 /etc/X11/X -> /usr/bin/Xorg
-rwxr-xr-x 1 root root 1712764 Mar 23 23:13 /usr/bin/Xorg

/var/lib/x11/xorg.conf.roster does not exist.

VGA-compatible devices on PCI bus:
01:00.0 VGA compatible controller: nVidia Corporation G98M [Quadro NVS
160M] (rev a1)

/var/lib/x11/xorg.conf.md5sum does not exist.

Xorg X server configuration file status:
-rw-r--r-- 1 root root 60 Apr 29 19:22 /etc/X11/xorg.conf

Contents of /etc/X11/xorg.conf:
Section "Device"
Identifier "n"
Driver "nouveau"
EndSection

udev information:
P: /devices/platform/i8042/serio0/input/input0/event0
N: input/event0
S: char/13:64
S: input/by-path/platform-i8042-serio-0-event-kbd
E: UDEV_LOG=3
E: DEVPATH=/devices/platform/i8042/serio0/input/input0/event0
E: MAJOR=13
E: MINOR=64
E: DEVNAME=/dev/input/event0
E: SUBSYSTEM=input
E: ID_INPUT=1
E: ID_INPUT_KEY=1
E: ID_INPUT_KEYBOARD=1
E: ID_SERIAL=noserial
E: ID_PATH=platform-i8042-serio-0
E: XKBMODEL=pc105
E: XKBLAYOUT=fr
E: XKBVARIANT=latin9
E: XKBOPTIONS=lv3:ralt_switch
E: x11_driver=evdev
E: DMI_VENDOR=Dell Inc.
E: DEVLINKS=/dev/char/13:64 /dev/input/by-path/platform-i8042-serio-0-event-kbd

P: /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0D:00/input/input1/event1
N: input/event1
S: char/13:65
E: UDEV_LOG=3
E: DEVPATH=/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0D:00/input/input1/event1
E: MAJOR=13
E: MINOR=65
E: DEVNAME=/dev/input/event1
E: SUBSYSTEM=input
E: ID_INPUT=1
E: DMI_VENDOR=Dell Inc.
E: DEVLINKS=/dev/char/13:65

P: /devices/pci0000:00/0000:00:1b.0/sound/card0/input10/event10
N: input/event10
S: char/13:74
E: UDEV_LOG=3
E: DEVPATH=/devices/pci0000:00/0000:00:1b.0/sound/card0/input10/event10
E: MAJOR=13
E: MINOR=74
E: DEVNAME=/dev/input/event10
E: SUBSYSTEM=input
E: ID_INPUT=1
E: ID_PATH=pci-0000:00:1b.0
E: ACL_MANAGE=1
E: DMI_VENDOR=Dell Inc.
E: DEVLINKS=/dev/char/13:74

P: /devices/pci0000:00/0000:00:1b.0/sound/card0/input11/event11
N: input/event11
S: char/13:75
E: UDEV_LOG=3
E: DEVPATH=/devices/pci0000:00/0000:00:1b.0/sound/card0/input11/event11
E: MAJOR=13
E: MINOR=75
E: DEVNAME=/dev/input/event11
E: SUBSYSTEM=input
E: ID_INPUT=1
E: ID_PATH=pci-0000:00:1b.0
E: ACL_MANAGE=1
E: DMI_VENDOR=Dell Inc.
E: DEVLINKS=/dev/char/13:75

P: /devices/pci0000:00/0000:00:1b.0/sound/card0/input12/event12
N: input/event12
S: char/13:76
E: UDEV_LOG=3
E: DEVPATH=/devices/pci0000:00/0000:00:1b.0/sound/card0/input12/event12
E: MAJOR=13
E: MINOR=76
E: DEVNAME=/dev/input/event12
E: SUBSYSTEM=input
E: ID_INPUT=1
E: ID_PATH=pci-0000:00:1b.0
E: ACL_MANAGE=1
E: DMI_VENDOR=Dell Inc.
E: DEVLINKS=/dev/char/13:76

P: /devices/pci0000:00/0000:00:1b.0/sound/card0/input13/event13
N: input/event13
S: char/13:77
E: UDEV_LOG=3
E: DEVPATH=/devices/pci0000:00/0000:00:1b.0/sound/card0/input13/event13
E: MAJOR=13
E: MINOR=77
E: DEVNAME=/dev/input/event13
E: SUBSYSTEM=input
E: ID_INPUT=1
E: ID_PATH=pci-0000:00:1b.0
E: ACL_MANAGE=1
E: DMI_VENDOR=Dell Inc.
E: DEVLINKS=/dev/char/13:77

P:
/devices/pci0000:00/0000:00:1a.7/usb1/1-4/1-4.1/1-4.1.1/1-4.1.1:1.0/input/input14/event14
N: input/event14
S: char/13:78
S: input/by-id/usb-Logitech_USB-PS_2_Optical_Mouse-event-mouse
S: input/by-path/pci-0000:00:1a.7-usb-0:4.1.1:1.0-event-mouse
E: UDEV_LOG=3
E:
DEVPATH=/devices/pci0000:00/0000:00:1a.7/usb1/1-4/1-4.1/1-4.1.1/1-4.1.1:1.0/input/input14/event14
E: MAJOR=13
E: MINOR=78
E: DEVNAME=/dev/input/event14
E: SUBSYSTEM=input
E: ID_INPUT=1
E: ID_INPUT_MOUSE=1
E: ID_VENDOR=Logitech
E: ID_VENDOR_ENC=Logitech
E: ID_VENDOR_ID=046d
E: ID_MODEL=USB-PS_2_Optical_Mouse
E: ID_MODEL_ENC=USB-PS\x2f2\x20Optical\x20Mouse
E: ID_MODEL_ID=c043
E: ID_REVISION=2720
E: ID_SERIAL=Logitech_USB-PS_2_Optical_Mouse
E: ID_TYPE=hid
E: ID_BUS=usb
E: ID_USB_INTERFACES=:030102:
E: ID_USB_INTERFACE_NUM=00
E: ID_USB_DRIVER=usbhid
E: ID_PATH=pci-0000:00:1a.7-usb-0:4.1.1:1.0
E: x11_driver=evdev
E: DEVLINKS=/dev/char/13:78
/dev/input/by-id/usb-Logitech_USB-PS_2_Optical_Mouse-event-mouse
/dev/input/by-path/pci-0000:00:1a.7-usb-0:4.1.1:1.0-event-mouse

P:
/devices/pci0000:00/0000:00:1a.7/usb1/1-4/1-4.1/1-4.1.2/1-4.1.2.1/1-4.1.2.1:1.0/input/input15/event15
N: input/event15
S: char/13:79
S: input/by-id/usb-Dell_Dell_USB_Keyboard-event-kbd
S: input/by-path/pci-0000:00:1a.7-usb-0:4.1.2.1:1.0-event-kbd
E: UDEV_LOG=3
E:
DEVPATH=/devices/pci0000:00/0000:00:1a.7/usb1/1-4/1-4.1/1-4.1.2/1-4.1.2.1/1-4.1.2.1:1.0/input/input15/event15
E: MAJOR=13
E: MINOR=79
E: DEVNAME=/dev/input/event15
E: SUBSYSTEM=input
E: ID_INPUT=1
E: ID_INPUT_KEY=1
E: ID_INPUT_KEYBOARD=1
E: ID_VENDOR=Dell
E: ID_VENDOR_ENC=Dell
E: ID_VENDOR_ID=413c
E: ID_MODEL=Dell_USB_Keyboard
E: ID_MODEL_ENC=Dell\x20USB\x20Keyboard
E: ID_MODEL_ID=2010
E: ID_REVISION=0200
E: ID_SERIAL=Dell_Dell_USB_Keyboard
E: ID_TYPE=hid
E: ID_BUS=usb
E: ID_USB_INTERFACES=:030101:030000:
E: ID_USB_INTERFACE_NUM=00
E: ID_USB_DRIVER=usbhid
E: ID_PATH=pci-0000:00:1a.7-usb-0:4.1.2.1:1.0
E: XKBMODEL=pc105
E: XKBLAYOUT=fr
E: XKBVARIANT=latin9
E: XKBOPTIONS=lv3:ralt_switch
E: x11_driver=evdev
E: DEVLINKS=/dev/char/13:79
/dev/input/by-id/usb-Dell_Dell_USB_Keyboard-event-kbd
/dev/input/by-path/pci-0000:00:1a.7-usb-0:4.1.2.1:1.0-event-kbd

P:
/devices/pci0000:00/0000:00:1a.7/usb1/1-4/1-4.1/1-4.1.2/1-4.1.2.1/1-4.1.2.1:1.1/input/input16/event16
N: input/event16
S: char/13:80
S: input/by-id/usb-Dell_Dell_USB_Keyboard-event-if01
S: input/by-path/pci-0000:00:1a.7-usb-0:4.1.2.1:1.1-event
E: UDEV_LOG=3
E:
DEVPATH=/devices/pci0000:00/0000:00:1a.7/usb1/1-4/1-4.1/1-4.1.2/1-4.1.2.1/1-4.1.2.1:1.1/input/input16/event16
E: MAJOR=13
E: MINOR=80
E: DEVNAME=/dev/input/event16
E: SUBSYSTEM=input
E: ID_INPUT=1
E: ID_INPUT_KEY=1
E: ID_VENDOR=Dell
E: ID_VENDOR_ENC=Dell
E: ID_VENDOR_ID=413c
E: ID_MODEL=Dell_USB_Keyboard
E: ID_MODEL_ENC=Dell\x20USB\x20Keyboard
E: ID_MODEL_ID=2010
E: ID_REVISION=0200
E: ID_SERIAL=Dell_Dell_USB_Keyboard
E: ID_TYPE=hid
E: ID_BUS=usb
E: ID_USB_INTERFACES=:030101:030000:
E: ID_USB_INTERFACE_NUM=01
E: ID_USB_DRIVER=usbhid
E: ID_PATH=pci-0000:00:1a.7-usb-0:4.1.2.1:1.1
E: XKBMODEL=pc105
E: XKBLAYOUT=fr
E: XKBVARIANT=latin9
E: XKBOPTIONS=lv3:ralt_switch
E: x11_driver=evdev
E: DEVLINKS=/dev/char/13:80
/dev/input/by-id/usb-Dell_Dell_USB_Keyboard-event-if01
/dev/input/by-path/pci-0000:00:1a.7-usb-0:4.1.2.1:1.1-event

P: /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0C:00/input/input2/event2
N: input/event2
S: char/13:66
E: UDEV_LOG=3
E: DEVPATH=/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0C:00/input/input2/event2
E: MAJOR=13
E: MINOR=66
E: DEVNAME=/dev/input/event2
E: SUBSYSTEM=input
E: ID_INPUT=1
E: ID_INPUT_KEY=1
E: XKBMODEL=pc105
E: XKBLAYOUT=fr
E: XKBVARIANT=latin9
E: XKBOPTIONS=lv3:ralt_switch
E: x11_driver=evdev
E: DMI_VENDOR=Dell Inc.
E: DEVLINKS=/dev/char/13:66

P: /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0E:00/input/input3/event3
N: input/event3
S: char/13:67
E: UDEV_LOG=3
E: DEVPATH=/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0E:00/input/input3/event3
E: MAJOR=13
E: MINOR=67
E: DEVNAME=/dev/input/event3
E: SUBSYSTEM=input
E: ID_INPUT=1
E: ID_INPUT_KEY=1
E: XKBMODEL=pc105
E: XKBLAYOUT=fr
E: XKBVARIANT=latin9
E: XKBOPTIONS=lv3:ralt_switch
E: x11_driver=evdev
E: DMI_VENDOR=Dell Inc.
E: DEVLINKS=/dev/char/13:67

P:
/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A03:00/device:35/LNXVIDEO:00/input/input4/event4
N: input/event4
S: char/13:68
E: UDEV_LOG=3
E:
DEVPATH=/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A03:00/device:35/LNXVIDEO:00/input/input4/event4
E: MAJOR=13
E: MINOR=68
E: DEVNAME=/dev/input/event4
E: SUBSYSTEM=input
E: ID_INPUT=1
E: ID_INPUT_KEY=1
E: XKBMODEL=pc105
E: XKBLAYOUT=fr
E: XKBVARIANT=latin9
E: XKBOPTIONS=lv3:ralt_switch
E: x11_driver=evdev
E: DMI_VENDOR=Dell Inc.
E: DEVLINKS=/dev/char/13:68

P: /devices/platform/pcspkr/input/input5/event5
N: input/event5
S: char/13:69
S: input/by-path/platform-pcspkr-event-spkr
E: UDEV_LOG=3
E: DEVPATH=/devices/platform/pcspkr/input/input5/event5
E: MAJOR=13
E: MINOR=69
E: DEVNAME=/dev/input/event5
E: SUBSYSTEM=input
E: ID_INPUT=1
E: ID_SERIAL=noserial
E: ID_PATH=platform-pcspkr
E: DMI_VENDOR=Dell Inc.
E: DEVLINKS=/dev/char/13:69 /dev/input/by-path/platform-pcspkr-event-spkr

P: /devices/platform/i8042/serio1/input/input6/event6
N: input/event6
S: char/13:70
S: input/by-path/platform-i8042-serio-1-event-mouse
E: UDEV_LOG=3
E: DEVPATH=/devices/platform/i8042/serio1/input/input6/event6
E: MAJOR=13
E: MINOR=70
E: DEVNAME=/dev/input/event6
E: SUBSYSTEM=input
E: ID_INPUT=1
E: ID_INPUT_MOUSE=1
E: ID_SERIAL=noserial
E: ID_PATH=platform-i8042-serio-1
E: x11_driver=evdev
E: DMI_VENDOR=Dell Inc.
E: DEVLINKS=/dev/char/13:70
/dev/input/by-path/platform-i8042-serio-1-event-mouse

P: /devices/platform/i8042/serio1/input/input7/event7
N: input/event7
S: char/13:71
S: input/by-path/platform-i8042-serio-1-event-mouse
E: UDEV_LOG=3
E: DEVPATH=/devices/platform/i8042/serio1/input/input7/event7
E: MAJOR=13
E: MINOR=71
E: DEVNAME=/dev/input/event7
E: SUBSYSTEM=input
E: ID_INPUT=1
E: ID_INPUT_MOUSE=1
E: ID_INPUT_TOUCHPAD=1
E: ID_SERIAL=noserial
E: ID_PATH=platform-i8042-serio-1
E: x11_driver=synaptics
E: DMI_VENDOR=Dell Inc.
E: DEVLINKS=/dev/char/13:71
/dev/input/by-path/platform-i8042-serio-1-event-mouse

P: /devices/pci0000:00/0000:00:1a.7/usb1/1-6/1-6:1.0/input/input8/event8
N: input/event8
S: char/13:72
S:
input/by-id/usb-CN0TX593724879320BTX_Laptop_Integrated_Webcam_0.3M-event-if00
S: input/by-path/pci-0000:00:1a.7-usb-0:6:1.0-event
E: UDEV_LOG=3
E:
DEVPATH=/devices/pci0000:00/0000:00:1a.7/usb1/1-6/1-6:1.0/input/input8/event8
E: MAJOR=13
E: MINOR=72
E: DEVNAME=/dev/input/event8
E: SUBSYSTEM=input
E: ID_INPUT=1
E: ID_INPUT_KEY=1
E: ID_VENDOR=CN0TX593724879320BTX
E: ID_VENDOR_ENC=CN0TX593724879320BTX
E: ID_VENDOR_ID=0c45
E: ID_MODEL=Laptop_Integrated_Webcam_0.3M
E: ID_MODEL_ENC=Laptop_Integrated_Webcam_0.3M
E: ID_MODEL_ID=63f8
E: ID_REVISION=8806
E: ID_SERIAL=CN0TX593724879320BTX_Laptop_Integrated_Webcam_0.3M
E: ID_TYPE=video
E: ID_BUS=usb
E: ID_USB_INTERFACES=:0e0100:0e0200:
E: ID_USB_INTERFACE_NUM=00
E: ID_USB_DRIVER=uvcvideo
E: ID_PATH=pci-0000:00:1a.7-usb-0:6:1.0
E: XKBMODEL=pc105
E: XKBLAYOUT=fr
E: XKBVARIANT=latin9
E: XKBOPTIONS=lv3:ralt_switch
E: x11_driver=evdev
E: DEVLINKS=/dev/char/13:72
/dev/input/by-id/usb-CN0TX593724879320BTX_Laptop_Integrated_Webcam_0.3M-event-if00
/dev/input/by-path/pci-0000:00:1a.7-usb-0:6:1.0-event

P: /devices/pci0000:00/0000:00:1b.0/input/input9/event9
N: input/event9
S: char/13:73
E: UDEV_LOG=3
E: DEVPATH=/devices/pci0000:00/0000:00:1b.0/input/input9/event9
E: MAJOR=13
E: MINOR=73
E: DEVNAME=/dev/input/event9
E: SUBSYSTEM=input
E: ID_INPUT=1
E: ID_PATH=pci-0000:00:1b.0
E: DMI_VENDOR=Dell Inc.
E: DEVLINKS=/dev/char/13:73

DRM Information from dmesg:
[    0.393026] ACPI: PCI Interrupt Routing Table [\_SB_.PCI0.AGP_._PRT]
[    1.092423] Linux agpgart interface v0.103
[   40.657648] [drm] Initialized drm 1.1.0 20060810
[   41.093029] [drm] nouveau 0000:01:00.0: failed to evaluate _DSM: 5
[   41.093384] [drm] nouveau 0000:01:00.0: Detected an NV50 generation
card (0x298580a2)
[   41.094417] [drm] nouveau 0000:01:00.0: Attempting to load BIOS
image from PRAMIN
[   41.199384] [drm] nouveau 0000:01:00.0: ... appears to be valid
[   41.199388] [drm] nouveau 0000:01:00.0: BIT BIOS found
[   41.199390] [drm] nouveau 0000:01:00.0: Bios version 62.98.3c.00
[   41.199393] [drm] nouveau 0000:01:00.0: TMDS table revision 2.0 not
currently supported
[   41.199395] [drm] nouveau 0000:01:00.0: Found Display Configuration
Block version 4.0
[   41.199398] [drm] nouveau 0000:01:00.0: DCB connector table: VHER 0x40 5 16
4
[   41.199400] [drm] nouveau 0000:01:00.0:   0: 0x00000041: type 0x41
idx 0 tag 0xff
[   41.199403] [drm] nouveau 0000:01:00.0:   1: 0x00000100: type 0x00
idx 1 tag 0xff
[   41.199405] [drm] nouveau 0000:01:00.0:   2: 0x00005246: type 0x46
idx 2 tag 0x07
[   41.199407] [drm] nouveau 0000:01:00.0:   3: 0x0000a346: type 0x46
idx 3 tag 0x08
[   41.199409] [drm] nouveau 0000:01:00.0: Raw DCB entry 0: 01000323 00010034
[   41.199412] [drm] nouveau 0000:01:00.0: Raw DCB entry 1: 02011300 00000028
[   41.199414] [drm] nouveau 0000:01:00.0: Raw DCB entry 2: 02022386 0f200010
[   41.199416] [drm] nouveau 0000:01:00.0: Raw DCB entry 3: 02022332 00020010
[   41.199418] [drm] nouveau 0000:01:00.0: Raw DCB entry 4: 040333a6 0f200010
[   41.199419] [drm] nouveau 0000:01:00.0: Raw DCB entry 5: 04033312 00020010
[   41.199421] [drm] nouveau 0000:01:00.0: Raw DCB entry 6: 0000000e 00000000
[   41.199438] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 0
at offset 0xD601
[   41.252165] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 1
at offset 0xD9B3
[   41.273091] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 2
at offset 0xE259
[   41.273119] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 3
at offset 0xE34B
[   41.280189] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 4
at offset 0xE557
[   41.280206] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table at
offset 0xE5BC
[   41.304078] [drm] nouveau 0000:01:00.0: 0xE5BC: Condition still not
met after 20ms, skipping following opcodes
[   41.304107] [drm] nouveau 0000:01:00.0: 0xC1AA: parsing output script 0
[   41.304115] [drm] nouveau 0000:01:00.0: 0xC7DC: parsing output script 0
[   41.304122] [drm] nouveau 0000:01:00.0: 0xC5CE: parsing output script 0
[   41.304141] [drm] nouveau 0000:01:00.0: 0xC7DC: parsing output script 0
[   41.304148] [drm] nouveau 0000:01:00.0: 0xC5CE: parsing output script 0
[   41.477247] [drm] nouveau 0000:01:00.0: 256 MiB VRAM
[   41.534084] [drm] nouveau 0000:01:00.0: 512 MiB GART (aperture)
[   41.534666] [drm] nouveau 0000:01:00.0: Allocating FIFO number 1
[   41.547594] [drm] nouveau 0000:01:00.0: nouveau_channel_alloc:
initialised FIFO 1
[   41.549261] [drm] nouveau 0000:01:00.0: Detected a LVDS output
[   41.549282] [drm] nouveau 0000:01:00.0: Detected a DAC output
[   41.549287] [drm] nouveau 0000:01:00.0: Detected a DP output
[   41.549293] [drm] nouveau 0000:01:00.0: Detected a TMDS output
[   41.549298] [drm] nouveau 0000:01:00.0: Detected a DP output
[   41.549303] [drm] nouveau 0000:01:00.0: Detected a TMDS output
[   41.549310] [drm] nouveau 0000:01:00.0: Detected a LVDS connector
[   41.664553] [drm] nouveau 0000:01:00.0: Detected a VGA connector
[   41.664739] [drm] nouveau 0000:01:00.0: Detected a DisplayPort connector
[   41.664802] [drm] nouveau 0000:01:00.0: Detected a DisplayPort connector
[   42.791416] [drm] nouveau 0000:01:00.0: allocated 1440x900 fb:
0x40250000, bo f68e6c00
[   42.791748] [drm] Initialized nouveau 0.0.15 20090420 for
0000:01:00.0 on minor 0
[   43.226970] [drm] nouveau 0000:01:00.0: Allocating FIFO number 2
[   43.239896] [drm] nouveau 0000:01:00.0: nouveau_channel_alloc:
initialised FIFO 2
[   43.275949] [drm] nouveau 0000:01:00.0: 0xC1AE: parsing output script 1
[   43.276033] [drm] nouveau 0000:01:00.0: 0xC065: parsing clock script 0
[   43.531587] [drm] nouveau 0000:01:00.0: 0xC1A5: parsing clock script 1
[   88.951380] [drm] nouveau 0000:01:00.0: 0x1203: parsing clock script 0
[  179.626582] [drm] nouveau 0000:01:00.0: plugged DisplayPort-1
[  208.373424] [drm] nouveau 0000:01:00.0: unplugged DisplayPort-1
[  208.386378] [drm] nouveau 0000:01:00.0: plugged DisplayPort-1
[  208.387077] [drm] nouveau 0000:01:00.0: plugged DisplayPort-1
[  208.387751] [drm] nouveau 0000:01:00.0: unplugged DisplayPort-1
[  208.388101] [drm] nouveau 0000:01:00.0: plugged DisplayPort-1
[  208.392371] [drm] nouveau 0000:01:00.0: unplugged DisplayPort-1
[  208.392401] [drm] nouveau 0000:01:00.0: plugged DisplayPort-1
[  208.399908] [drm] nouveau 0000:01:00.0: unplugged DisplayPort-1
[  208.400291] [drm] nouveau 0000:01:00.0: plugged DisplayPort-1
[  208.558692] [drm] nouveau 0000:01:00.0: unplugged DisplayPort-1
[  234.089962] [drm] nouveau 0000:01:00.0: 0x1203: parsing clock script 0
[  243.263245] [drm] nouveau 0000:01:00.0: 0xC1AE: parsing output script 1
[  244.320836] [drm] nouveau 0000:01:00.0: 0xC065: parsing clock script 0
[  244.578802] [drm] nouveau 0000:01:00.0: 0xC1A5: parsing clock script 1


-- System Information:
Debian Release: squeeze/sid
  APT prefers unstable
  APT policy: (500, 'unstable')
Architecture: i386 (i686)

Kernel: Linux 2.6.32-4-686-bigmem (SMP w/2 CPU cores)
Locale: LANG=fr_FR.UTF-8, LC_CTYPE=fr_FR.UTF-8 (charmap=UTF-8)
Shell: /bin/sh linked to /bin/bash

Versions of packages xserver-xorg-video-nouveau depends on:
ii  libc6                         2.10.2-6   Embedded GNU C Library: Shared lib
ii  libdrm-nouveau1               2.4.18-5   Userspace interface to nouveau-spe
ii  xserver-xorg-core             2:1.7.6-1  Xorg X server - core server

xserver-xorg-video-nouveau recommends no packages.

xserver-xorg-video-nouveau suggests no packages.

-- no debconf information

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
