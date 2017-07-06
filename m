From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 101404] GTX 970M (GM204-A) not powered off when not
 in use (DynPwr in stead of DynOff)
Date: Thu, 06 Jul 2017 12:25:35 +0000
Message-ID: <bug-101404-8800-eze6oDXNph@http.bugs.freedesktop.org/>
References: <bug-101404-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0755772544=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-101404-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0755772544==
Content-Type: multipart/alternative; boundary="14993439350.eF0f307.25968";
 charset="UTF-8"


--14993439350.eF0f307.25968
Date: Thu, 6 Jul 2017 12:25:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D101404

--- Comment #6 from Benny Ammitzb=C3=B8ll <benny-t2dRYjLbInkVZ4pArIi0Q3XJ5CkEIoRN@public.gmane.org> ---
(In reply to Peter Wu from comment #5)
> (In reply to Benny Ammitzb=C3=B8ll from comment #4)
> > (In reply to Peter Wu from comment #3)
> Please show the output of "lspci -nn". If you boot your laptop with an
> external display plugged in, you will additionally have a HDMI audio
> function (01:00.1) which must also have runtime PM enabled for the whole
> thing to power down.

I don't boot my laptop with any external display plugged in.

tux_xc1706 ~ # lspci -nn
00:00.0 Host bridge [0600]: Intel Corporation Skylake Host Bridge/DRAM
Registers [8086:1910] (rev 07)
00:01.0 PCI bridge [0604]: Intel Corporation Skylake PCIe Controller (x16)
[8086:1901] (rev 07)
00:02.0 VGA compatible controller [0300]: Intel Corporation HD Graphics 530
[8086:191b] (rev 06)
00:14.0 USB controller [0c03]: Intel Corporation Sunrise Point-H USB 3.0 xH=
CI
Controller [8086:a12f] (rev 31)
00:16.0 Communication controller [0780]: Intel Corporation Sunrise Point-H =
CSME
HECI #1 [8086:a13a] (rev 31)
00:17.0 SATA controller [0106]: Intel Corporation Sunrise Point-H SATA
Controller [AHCI mode] [8086:a103] (rev 31)
00:1c.0 PCI bridge [0604]: Intel Corporation Sunrise Point-H PCI Express Ro=
ot
Port #5 [8086:a114] (rev f1)
00:1c.5 PCI bridge [0604]: Intel Corporation Sunrise Point-H PCI Express Ro=
ot
Port #6 [8086:a115] (rev f1)
00:1d.0 PCI bridge [0604]: Intel Corporation Sunrise Point-H PCI Express Ro=
ot
Port #9 [8086:a118] (rev f1)
00:1f.0 ISA bridge [0601]: Intel Corporation Sunrise Point-H LPC Controller
[8086:a14e] (rev 31)
00:1f.2 Memory controller [0580]: Intel Corporation Sunrise Point-H PMC
[8086:a121] (rev 31)
00:1f.3 Audio device [0403]: Intel Corporation Sunrise Point-H HD Audio
[8086:a170] (rev 31)
00:1f.4 SMBus [0c05]: Intel Corporation Sunrise Point-H SMBus [8086:a123] (=
rev
31)
01:00.0 VGA compatible controller [0300]: NVIDIA Corporation GM204M [GeForce
GTX 970M] [10de:13d8] (rev a1)
02:00.0 Unassigned class [ff00]: Realtek Semiconductor Co., Ltd. RTL8411B P=
CI
Express Card Reader [10ec:5287] (rev 01)
02:00.1 Ethernet controller [0200]: Realtek Semiconductor Co., Ltd.
RTL8111/8168/8411 PCI Express Gigabit Ethernet Controller [10ec:8168] (rev =
12)
03:00.0 Network controller [0280]: Intel Corporation Wireless 8260 [8086:24=
f3]
(rev 3a)
04:00.0 Non-Volatile memory controller [0108]: Samsung Electronics Co Ltd N=
VMe
SSD Controller SM951/PM951 [144d:a802] (rev 01)

> In powertop, what are the states for the Nvidia PCI device(s) and its root
> parent port before you change anything?

In the "Tunables" tab? They're all "Bad" when on AC (until I change them to
Good):

   Bad           Enable SATA link power management for host2
   Bad           Enable SATA link power management for host3
   Bad           Enable SATA link power management for host1
   Bad           Enable Audio codec power management
   Bad           NMI watchdog should be turned off
   Bad           VM writeback timeout
   Bad           Enable SATA link power management for host0
   Bad           Runtime PM for I2C Adapter i2c-21 (nvkm-0000:01:00.0-aux-0=
009)
   Bad           Runtime PM for I2C Adapter i2c-9 (nvkm-0000:01:00.0-aux-00=
03)
   Bad           Runtime PM for I2C Adapter i2c-23 (0000:01:00.0)
   Bad           Runtime PM for I2C Adapter i2c-2 (i915 gmbus dpb)
   Bad           Runtime PM for I2C Adapter i2c-6 (nvkm-0000:01:00.0-bus-00=
01)
   Bad           Runtime PM for I2C Adapter i2c-20 (nvkm-0000:01:00.0-bus-0=
009)
   Bad           Autosuspend for USB device BisonCam, NB Pro [Generic]
   Bad           Autosuspend for USB device EgisTec_ES603 [EgisTec]
   Bad           Autosuspend for USB device xHCI Host Controller [usb1]
   Bad           Autosuspend for USB device USB Receiver [Logitech]
   Bad           Runtime PM for I2C Adapter i2c-22 (0000:01:00.0)
   Bad           Autosuspend for unknown USB device 1-8 (8087:0a2b)
   Bad           Runtime PM for I2C Adapter i2c-7 (nvkm-0000:01:00.0-bus-00=
02)
   Bad           Autosuspend for USB device xHCI Host Controller [usb2]
   Bad           Runtime PM for I2C Adapter i2c-3 (i915 gmbus dpd)
   Bad           Runtime PM for I2C Adapter i2c-0 (SMBus I801 adapter at f0=
40)
   Bad           Runtime PM for I2C Adapter i2c-1 (i915 gmbus dpc)
   Bad           Runtime PM for I2C Adapter i2c-19 (nvkm-0000:01:00.0-aux-0=
008)
   Bad           Runtime PM for I2C Adapter i2c-11 (nvkm-0000:01:00.0-aux-0=
004)
   Bad           Runtime PM for I2C Adapter i2c-12 (nvkm-0000:01:00.0-bus-0=
005)
   Bad           Runtime PM for I2C Adapter i2c-10 (nvkm-0000:01:00.0-bus-0=
004)
   Bad           Runtime PM for I2C Adapter i2c-14 (nvkm-0000:01:00.0-bus-0=
006)
   Bad           Runtime PM for I2C Adapter i2c-16 (nvkm-0000:01:00.0-bus-0=
007)
   Bad           Runtime PM for I2C Adapter i2c-18 (nvkm-0000:01:00.0-bus-0=
008)
   Bad           Runtime PM for I2C Adapter i2c-8 (nvkm-0000:01:00.0-bus-00=
03)
   Bad           Runtime PM for I2C Adapter i2c-15 (nvkm-0000:01:00.0-aux-0=
006)
   Bad           Runtime PM for I2C Adapter i2c-17 (nvkm-0000:01:00.0-aux-0=
007)
   Bad           Runtime PM for I2C Adapter i2c-5 (nvkm-0000:01:00.0-bus-00=
00)
   Bad           Runtime PM for I2C Adapter i2c-13 (nvkm-0000:01:00.0-aux-0=
005)
   Bad           Runtime PM for PCI Device Realtek Semiconductor Co., Ltd.
RTL8111/8168/8411 PCI Express Gigabit Ethernet Controller
>> Bad           Runtime PM for PCI Device NVIDIA Corporation GM204M [GeFor=
ce GTX 970M]=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20
   Bad           Runtime PM for PCI Device Intel Corporation Sunrise Point-H
PCI Express Root Port #6
   Bad           Runtime PM for PCI Device Realtek Semiconductor Co., Ltd.
RTL8411B PCI Express Card Reader
   Bad           Runtime PM for PCI Device Intel Corporation HD Graphics 530
   Bad           Runtime PM for PCI Device Intel Corporation Skylake PCIe
Controller (x16)
   Bad           Runtime PM for PCI Device Intel Corporation Sunrise Point-H
LPC Controller
   Bad           Runtime PM for PCI Device Intel Corporation Wireless 8260
   Bad           Runtime PM for PCI Device Intel Corporation Sunrise Point-H
PMC
   Bad           Runtime PM for PCI Device Intel Corporation Sunrise Point-H
SATA Controller [AHCI mode]
   Bad           Runtime PM for PCI Device Intel Corporation Sunrise Point-H
CSME HECI #1
   Bad           Runtime PM for PCI Device Intel Corporation Sunrise Point-H
USB 3.0 xHCI Controller
   Bad           Runtime PM for PCI Device Intel Corporation Sunrise Point-H
PCI Express Root Port #5
   Bad           Runtime PM for PCI Device Samsung Electronics Co Ltd NVMe =
SSD
Controller SM951/PM951
   Bad           Runtime PM for PCI Device Intel Corporation Sunrise Point-H
PCI Express Root Port #9
   Bad           Runtime PM for PCI Device Intel Corporation Skylake Host
Bridge/DRAM Registers
   Bad           Runtime PM for PCI Device Intel Corporation Sunrise Point-=
H HD
Audio
   Bad           Runtime PM for PCI Device Intel Corporation Sunrise Point-H
SMBus
   Good          Wireless Power Saving for interface wlan0
   Good          Bluetooth device interface status
   Good          Wake-on-lan status for device wlan0
   Good          Wake-on-lan status for device eth0

> Currently there are two methods to turn off the power on modern Nvidia
> devices:
>  - ACPI "DSM". The nouveau driver will call a special device-specific ACPI
> method  during runtime PM transitions.
>  - ACPI Power Resources (since Linux 4.8). This means that when all devic=
es
> (PCI root port and its children) are idle, the power resources can be tur=
ned
> off. This is a standard method that does not require a specific video
> driver, hence if you do not load nouveau but enable runtime PM, it will a=
lso
> work.
>=20
> Why is the second method preferred? The second method is the standard one
> since Windows 8 and vendors might not test the former method. The former
> method is known to result in memory corruption issues on some models (bug
> 78530) and in other cases it will not fully reduce power consumption
> (resulting in increased heat, more fan noise and lower battery life).

Ok, but you say that I can't use the second (preferred) option when I load =
the
nouveau driver - so I must use pcie_port_pm=3Doff. Shouldn't the nouveau dr=
iver
be updated to support the second option in stead?

> Upgrade to kernel 4.10 or newer, then your brightness keys should work
> without forcing acpi_osi=3DLinux. See
> https://bugzilla.kernel.org/show_bug.cgi?id=3D123651

Not so, I am already on kernel 4.9.34:

tux_xc1706 ~ # uname -a
Linux tux_xc1706 4.9.34-gentoo #1 SMP Sat Jul 1 16:26:00 CEST 2017 x86_64
Intel(R) Core(TM) i7-6700HQ CPU @ 2.60GHz GenuineIntel GNU/Linux

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14993439350.eF0f307.25968
Date: Thu, 6 Jul 2017 12:25:35 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - GTX 970M (GM204-A) not powered off when not in use (DynPw=
r in stead of DynOff)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101404#c6">Commen=
t # 6</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - GTX 970M (GM204-A) not powered off when not in use (DynPw=
r in stead of DynOff)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101404">bug 10140=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
benny&#64;ammitzboell-consult.dk" title=3D"Benny Ammitzb=C3=B8ll &lt;benny&=
#64;ammitzboell-consult.dk&gt;"> <span class=3D"fn">Benny Ammitzb=C3=B8ll</=
span></a>
</span></b>
        <pre>(In reply to Peter Wu from <a href=3D"show_bug.cgi?id=3D101404=
#c5">comment #5</a>)
<span class=3D"quote">&gt; (In reply to Benny Ammitzb=C3=B8ll from <a href=
=3D"show_bug.cgi?id=3D101404#c4">comment #4</a>)
&gt; &gt; (In reply to Peter Wu from <a href=3D"show_bug.cgi?id=3D101404#c3=
">comment #3</a>)
&gt; Please show the output of &quot;lspci -nn&quot;. If you boot your lapt=
op with an
&gt; external display plugged in, you will additionally have a HDMI audio
&gt; function (01:00.1) which must also have runtime PM enabled for the who=
le
&gt; thing to power down.</span >

I don't boot my laptop with any external display plugged in.

tux_xc1706 ~ # lspci -nn
00:00.0 Host bridge [0600]: Intel Corporation Skylake Host Bridge/DRAM
Registers [8086:1910] (rev 07)
00:01.0 PCI bridge [0604]: Intel Corporation Skylake PCIe Controller (x16)
[8086:1901] (rev 07)
00:02.0 VGA compatible controller [0300]: Intel Corporation HD Graphics 530
[8086:191b] (rev 06)
00:14.0 USB controller [0c03]: Intel Corporation Sunrise Point-H USB 3.0 xH=
CI
Controller [8086:a12f] (rev 31)
00:16.0 Communication controller [0780]: Intel Corporation Sunrise Point-H =
CSME
HECI #1 [8086:a13a] (rev 31)
00:17.0 SATA controller [0106]: Intel Corporation Sunrise Point-H SATA
Controller [AHCI mode] [8086:a103] (rev 31)
00:1c.0 PCI bridge [0604]: Intel Corporation Sunrise Point-H PCI Express Ro=
ot
Port #5 [8086:a114] (rev f1)
00:1c.5 PCI bridge [0604]: Intel Corporation Sunrise Point-H PCI Express Ro=
ot
Port #6 [8086:a115] (rev f1)
00:1d.0 PCI bridge [0604]: Intel Corporation Sunrise Point-H PCI Express Ro=
ot
Port #9 [8086:a118] (rev f1)
00:1f.0 ISA bridge [0601]: Intel Corporation Sunrise Point-H LPC Controller
[8086:a14e] (rev 31)
00:1f.2 Memory controller [0580]: Intel Corporation Sunrise Point-H PMC
[8086:a121] (rev 31)
00:1f.3 Audio device [0403]: Intel Corporation Sunrise Point-H HD Audio
[8086:a170] (rev 31)
00:1f.4 SMBus [0c05]: Intel Corporation Sunrise Point-H SMBus [8086:a123] (=
rev
31)
01:00.0 VGA compatible controller [0300]: NVIDIA Corporation GM204M [GeForce
GTX 970M] [10de:13d8] (rev a1)
02:00.0 Unassigned class [ff00]: Realtek Semiconductor Co., Ltd. RTL8411B P=
CI
Express Card Reader [10ec:5287] (rev 01)
02:00.1 Ethernet controller [0200]: Realtek Semiconductor Co., Ltd.
RTL8111/8168/8411 PCI Express Gigabit Ethernet Controller [10ec:8168] (rev =
12)
03:00.0 Network controller [0280]: Intel Corporation Wireless 8260 [8086:24=
f3]
(rev 3a)
04:00.0 Non-Volatile memory controller [0108]: Samsung Electronics Co Ltd N=
VMe
SSD Controller SM951/PM951 [144d:a802] (rev 01)

<span class=3D"quote">&gt; In powertop, what are the states for the Nvidia =
PCI device(s) and its root
&gt; parent port before you change anything?</span >

In the &quot;Tunables&quot; tab? They're all &quot;Bad&quot; when on AC (un=
til I change them to
Good):

   Bad           Enable SATA link power management for host2
   Bad           Enable SATA link power management for host3
   Bad           Enable SATA link power management for host1
   Bad           Enable Audio codec power management
   Bad           NMI watchdog should be turned off
   Bad           VM writeback timeout
   Bad           Enable SATA link power management for host0
   Bad           Runtime PM for I2C Adapter i2c-21 (nvkm-0000:01:00.0-aux-0=
009)
   Bad           Runtime PM for I2C Adapter i2c-9 (nvkm-0000:01:00.0-aux-00=
03)
   Bad           Runtime PM for I2C Adapter i2c-23 (0000:01:00.0)
   Bad           Runtime PM for I2C Adapter i2c-2 (i915 gmbus dpb)
   Bad           Runtime PM for I2C Adapter i2c-6 (nvkm-0000:01:00.0-bus-00=
01)
   Bad           Runtime PM for I2C Adapter i2c-20 (nvkm-0000:01:00.0-bus-0=
009)
   Bad           Autosuspend for USB device BisonCam, NB Pro [Generic]
   Bad           Autosuspend for USB device EgisTec_ES603 [EgisTec]
   Bad           Autosuspend for USB device xHCI Host Controller [usb1]
   Bad           Autosuspend for USB device USB Receiver [Logitech]
   Bad           Runtime PM for I2C Adapter i2c-22 (0000:01:00.0)
   Bad           Autosuspend for unknown USB device 1-8 (8087:0a2b)
   Bad           Runtime PM for I2C Adapter i2c-7 (nvkm-0000:01:00.0-bus-00=
02)
   Bad           Autosuspend for USB device xHCI Host Controller [usb2]
   Bad           Runtime PM for I2C Adapter i2c-3 (i915 gmbus dpd)
   Bad           Runtime PM for I2C Adapter i2c-0 (SMBus I801 adapter at f0=
40)
   Bad           Runtime PM for I2C Adapter i2c-1 (i915 gmbus dpc)
   Bad           Runtime PM for I2C Adapter i2c-19 (nvkm-0000:01:00.0-aux-0=
008)
   Bad           Runtime PM for I2C Adapter i2c-11 (nvkm-0000:01:00.0-aux-0=
004)
   Bad           Runtime PM for I2C Adapter i2c-12 (nvkm-0000:01:00.0-bus-0=
005)
   Bad           Runtime PM for I2C Adapter i2c-10 (nvkm-0000:01:00.0-bus-0=
004)
   Bad           Runtime PM for I2C Adapter i2c-14 (nvkm-0000:01:00.0-bus-0=
006)
   Bad           Runtime PM for I2C Adapter i2c-16 (nvkm-0000:01:00.0-bus-0=
007)
   Bad           Runtime PM for I2C Adapter i2c-18 (nvkm-0000:01:00.0-bus-0=
008)
   Bad           Runtime PM for I2C Adapter i2c-8 (nvkm-0000:01:00.0-bus-00=
03)
   Bad           Runtime PM for I2C Adapter i2c-15 (nvkm-0000:01:00.0-aux-0=
006)
   Bad           Runtime PM for I2C Adapter i2c-17 (nvkm-0000:01:00.0-aux-0=
007)
   Bad           Runtime PM for I2C Adapter i2c-5 (nvkm-0000:01:00.0-bus-00=
00)
   Bad           Runtime PM for I2C Adapter i2c-13 (nvkm-0000:01:00.0-aux-0=
005)
   Bad           Runtime PM for PCI Device Realtek Semiconductor Co., Ltd.
RTL8111/8168/8411 PCI Express Gigabit Ethernet Controller
<span class=3D"quote">&gt;&gt; Bad           Runtime PM for PCI Device NVID=
IA Corporation GM204M [GeForce GTX 970M]                                 </=
span >
   Bad           Runtime PM for PCI Device Intel Corporation Sunrise Point-H
PCI Express Root Port #6
   Bad           Runtime PM for PCI Device Realtek Semiconductor Co., Ltd.
RTL8411B PCI Express Card Reader
   Bad           Runtime PM for PCI Device Intel Corporation HD Graphics 530
   Bad           Runtime PM for PCI Device Intel Corporation Skylake PCIe
Controller (x16)
   Bad           Runtime PM for PCI Device Intel Corporation Sunrise Point-H
LPC Controller
   Bad           Runtime PM for PCI Device Intel Corporation Wireless 8260
   Bad           Runtime PM for PCI Device Intel Corporation Sunrise Point-H
PMC
   Bad           Runtime PM for PCI Device Intel Corporation Sunrise Point-H
SATA Controller [AHCI mode]
   Bad           Runtime PM for PCI Device Intel Corporation Sunrise Point-H
CSME HECI #1
   Bad           Runtime PM for PCI Device Intel Corporation Sunrise Point-H
USB 3.0 xHCI Controller
   Bad           Runtime PM for PCI Device Intel Corporation Sunrise Point-H
PCI Express Root Port #5
   Bad           Runtime PM for PCI Device Samsung Electronics Co Ltd NVMe =
SSD
Controller SM951/PM951
   Bad           Runtime PM for PCI Device Intel Corporation Sunrise Point-H
PCI Express Root Port #9
   Bad           Runtime PM for PCI Device Intel Corporation Skylake Host
Bridge/DRAM Registers
   Bad           Runtime PM for PCI Device Intel Corporation Sunrise Point-=
H HD
Audio
   Bad           Runtime PM for PCI Device Intel Corporation Sunrise Point-H
SMBus
   Good          Wireless Power Saving for interface wlan0
   Good          Bluetooth device interface status
   Good          Wake-on-lan status for device wlan0
   Good          Wake-on-lan status for device eth0

<span class=3D"quote">&gt; Currently there are two methods to turn off the =
power on modern Nvidia
&gt; devices:
&gt;  - ACPI &quot;DSM&quot;. The nouveau driver will call a special device=
-specific ACPI
&gt; method  during runtime PM transitions.
&gt;  - ACPI Power Resources (since Linux 4.8). This means that when all de=
vices
&gt; (PCI root port and its children) are idle, the power resources can be =
turned
&gt; off. This is a standard method that does not require a specific video
&gt; driver, hence if you do not load nouveau but enable runtime PM, it wil=
l also
&gt; work.
&gt;=20
&gt; Why is the second method preferred? The second method is the standard =
one
&gt; since Windows 8 and vendors might not test the former method. The form=
er
&gt; method is known to result in memory corruption issues on some models (=
bug
&gt; 78530) and in other cases it will not fully reduce power consumption
&gt; (resulting in increased heat, more fan noise and lower battery life).<=
/span >

Ok, but you say that I can't use the second (preferred) option when I load =
the
nouveau driver - so I must use pcie_port_pm=3Doff. Shouldn't the nouveau dr=
iver
be updated to support the second option in stead?

<span class=3D"quote">&gt; Upgrade to kernel 4.10 or newer, then your brigh=
tness keys should work
&gt; without forcing acpi_osi=3DLinux. See
&gt; <a href=3D"https://bugzilla.kernel.org/show_bug.cgi?id=3D123651">https=
://bugzilla.kernel.org/show_bug.cgi?id=3D123651</a></span >

Not so, I am already on kernel 4.9.34:

tux_xc1706 ~ # uname -a
Linux tux_xc1706 4.9.34-gentoo #1 SMP Sat Jul 1 16:26:00 CEST 2017 x86_64
Intel(R) Core(TM) i7-6700HQ CPU &#64; 2.60GHz GenuineIntel GNU/Linux</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14993439350.eF0f307.25968--

--===============0755772544==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0755772544==--
