From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 95520] Error when recovering from suspend mode:
 fifo: ce0 engine fault on channel 0
Date: Mon, 20 Feb 2017 16:33:30 +0000
Message-ID: <bug-95520-8800-uiyzA5SQvZ@http.bugs.freedesktop.org/>
References: <bug-95520-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1661335428=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-95520-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1661335428==
Content-Type: multipart/alternative; boundary="14876084100.23d82.24187";
 charset="UTF-8"


--14876084100.23d82.24187
Date: Mon, 20 Feb 2017 16:33:29 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D95520

--- Comment #3 from mail-freedesktopbugs-wK5Yy4/IbwG+onKQ3Rj6Dg@public.gmane.org ---
I'm having a similar situation like G=C3=A9za B=C3=BAz, the two external Di=
splayPort
connected Displays get a signal, but only the frozen cursor on black backgr=
ound
is visible. No further interaction is possible, no shell switching,
ctrl-alt-delete etc. Unfortunately, this is not reproducible every time I
suspend the system.
On reboot, the system hangs in a state after kernel selection/grub, where t=
he
fan runs high but no output is shown on any screen, the system is frozen.
Only after several reboot attempts (~3) the boot runs normally again.

(a recent memtest did not report errors)

Environment:
 - Linux kernel 4.4.46
 - Desktop environment: KDE Plasma 5.8.3
 - Xorg 1.18.3
 - Graphics card: NVIDIA Corporation GF108GLM [Quadro 1000M] (rev a1)


Feb 20 16:39:18 linux-sc6n.suse kernel: ACPI: Waking up from system sleep s=
tate
S3
Feb 20 16:39:18 linux-sc6n.suse kernel: ehci-pci 0000:00:1a.0: System wakeup
disabled by ACPI
Feb 20 16:39:18 linux-sc6n.suse kernel: ehci-pci 0000:00:1d.0: System wakeup
disabled by ACPI
Feb 20 16:39:18 linux-sc6n.suse kernel: pcieport 0000:00:1c.6: System wakeup
disabled by ACPI
Feb 20 16:39:18 linux-sc6n.suse kernel: sdhci-pci 0000:0d:00.0: MMC control=
ler
base frequency changed to 50Mhz.
Feb 20 16:39:18 linux-sc6n.suse kernel: PM: noirq resume of devices complete
after 18.717 msecs
Feb 20 16:39:18 linux-sc6n.suse kernel: PM: early resume of devices complete
after 0.646 msecs
Feb 20 16:39:18 linux-sc6n.suse kernel: e1000e 0000:00:19.0: System wakeup
disabled by ACPI
Feb 20 16:39:18 linux-sc6n.suse kernel: nouveau 0000:01:00.0: DRM: resuming
kernel object tree...
Feb 20 16:39:18 linux-sc6n.suse kernel: usb usb2: root hub lost power or was
reset
Feb 20 16:39:18 linux-sc6n.suse kernel: usb usb3: root hub lost power or was
reset
Feb 20 16:39:18 linux-sc6n.suse kernel: rtc_cmos 00:02: System wakeup disab=
led
by ACPI
Feb 20 16:39:18 linux-sc6n.suse kernel: sd 0:0:0:0: [sda] Starting disk
Feb 20 16:39:18 linux-sc6n.suse kernel: usb 1-1.6: reset high-speed USB dev=
ice
number 5 using ehci-pci
Feb 20 16:39:18 linux-sc6n.suse kernel: usb 4-1.5: reset full-speed USB dev=
ice
number 3 using ehci-pci
Feb 20 16:39:18 linux-sc6n.suse kernel: ata2: SATA link down (SStatus 0
SControl 300)
Feb 20 16:39:18 linux-sc6n.suse kernel: ata5: SATA link down (SStatus 0
SControl 300)
Feb 20 16:39:18 linux-sc6n.suse kernel: ata1: SATA link up 6.0 Gbps (SStatus
133 SControl 300)
Feb 20 16:39:18 linux-sc6n.suse kernel: ata4: SATA link down (SStatus 0
SControl 300)
Feb 20 16:39:18 linux-sc6n.suse kernel: nouveau 0000:01:00.0: DRM: resuming
client object trees...
Feb 20 16:39:18 linux-sc6n.suse kernel: nouveau 0000:01:00.0: DRM: resuming
display...
Feb 20 16:39:18 linux-sc6n.suse kernel: usb 1-1.5: reset high-speed USB dev=
ice
number 7 using ehci-pci
Feb 20 16:39:18 linux-sc6n.suse kernel: nouveau 0000:01:00.0: DRM: resuming
console...
Feb 20 16:39:18 linux-sc6n.suse kernel: usb 1-1.4: reset full-speed USB dev=
ice
number 3 using ehci-pci
Feb 20 16:39:18 linux-sc6n.suse kernel: ata1.00: ACPI cmd ef/02:00:00:00:00=
:a0
(SET FEATURES) succeeded
Feb 20 16:39:18 linux-sc6n.suse kernel: ata1.00: ACPI cmd f5/00:00:00:00:00=
:a0
(SECURITY FREEZE LOCK) filtered out
Feb 20 16:39:18 linux-sc6n.suse kernel: ata1.00: ACPI cmd ef/10:03:00:00:00=
:a0
(SET FEATURES) filtered out
Feb 20 16:39:18 linux-sc6n.suse kernel: ata1.00: ACPI cmd ef/02:00:00:00:00=
:a0
(SET FEATURES) succeeded
Feb 20 16:39:18 linux-sc6n.suse kernel: ata1.00: ACPI cmd f5/00:00:00:00:00=
:a0
(SECURITY FREEZE LOCK) filtered out
Feb 20 16:39:18 linux-sc6n.suse kernel: ata1.00: ACPI cmd ef/10:03:00:00:00=
:a0
(SET FEATURES) filtered out
Feb 20 16:39:18 linux-sc6n.suse kernel: ata1.00: configured for UDMA/133
Feb 20 16:39:18 linux-sc6n.suse kernel: usb 1-1.5.4: reset low-speed USB de=
vice
number 8 using ehci-pci
Feb 20 16:39:18 linux-sc6n.suse kernel: snd_hda_codec_hdmi hdaudioC1D2: HDM=
I:
audio coding type 0 not expected
Feb 20 16:39:18 linux-sc6n.suse kernel: PM: resume of devices complete after
1241.680 msecs
Feb 20 16:39:18 linux-sc6n.suse kernel: usb 1-1.4:1.0: rebind failed: -517
Feb 20 16:39:18 linux-sc6n.suse kernel: usb 1-1.4:1.1: rebind failed: -517
Feb 20 16:39:18 linux-sc6n.suse kernel: PM: Finishing wakeup.
Feb 20 16:39:18 linux-sc6n.suse kernel: Restarting tasks ... done.
Feb 20 16:39:18 linux-sc6n.suse systemd[1]: Time has been changed
Feb 20 16:39:18 linux-sc6n.suse kernel: nouveau 0000:01:00.0: fifo: read fa=
ult
at 0003ae0000 engine 15 [PCE0] client 01 [PCOPY0] reason 02 [PAGE_NOT_PRESE=
NT]
on channel 0 [003fe14000 DRM]
Feb 20 16:39:18 linux-sc6n.suse kernel: nouveau 0000:01:00.0: fifo: ce0 eng=
ine
fault on channel 0, recovering...
Feb 20 16:39:18 linux-sc6n.suse NetworkManager[1218]: <info>  (eth0): link
disconnected
Feb 20 16:39:18 linux-sc6n.suse systemd[2673]: Time has been changed
Feb 20 16:39:18 linux-sc6n.suse NetworkManager[1218]: <info>  (eth0): device
state change: disconnected -> unavailable (reason 'carrier-changed') [30 20=
 40]
Feb 20 16:39:18 linux-sc6n.suse bluetoothd[1096]: Endpoint unregistered:
sender=3D:1.39 path=3D/MediaEndpoint/A2DPSource
Feb 20 16:39:18 linux-sc6n.suse systemd-sleep[31277]: System resumed.
Feb 20 16:39:18 linux-sc6n.suse bluetoothd[1096]: Endpoint unregistered:
sender=3D:1.39 path=3D/MediaEndpoint/A2DPSink
Feb 20 16:39:18 linux-sc6n.suse systemd[1]: Starting Load/Save RF Kill Swit=
ch
Status...
Feb 20 16:39:18 linux-sc6n.suse systemd[1]: bluetooth.target: Unit not need=
ed
anymore. Stopping.
Feb 20 16:39:18 linux-sc6n.suse systemd[1]: Stopped target Bluetooth.
Feb 20 16:39:18 linux-sc6n.suse systemd[1]: Started Load/Save RF Kill Switch
Status.
Feb 20 16:39:18 linux-sc6n.suse systemd-sleep[31277]: INFO: Skip running
/usr/lib/systemd/system-sleep/grub2.sleep for suspend
Feb 20 16:39:18 linux-sc6n.suse systemd[1]: Started Suspend.
Feb 20 16:39:18 linux-sc6n.suse kernel: smpboot: Booting Node 0 Processor 3
APIC 0x3
Feb 20 16:39:18 linux-sc6n.suse kernel: Disabled fast string operations
Feb 20 16:39:18 linux-sc6n.suse kernel:  cache: parent cpu3 should not be
sleeping
Feb 20 16:39:18 linux-sc6n.suse kernel: CPU3 is up
Feb 20 16:39:18 linux-sc6n.suse kernel: smpboot: Booting Node 0 Processor 4
APIC 0x4
Feb 20 16:39:18 linux-sc6n.suse kernel: Disabled fast string operations
Feb 20 16:39:18 linux-sc6n.suse kernel:  cache: parent cpu4 should not be
sleeping
Feb 20 16:39:18 linux-sc6n.suse kernel: CPU4 is up
Feb 20 16:39:18 linux-sc6n.suse kernel: smpboot: Booting Node 0 Processor 5
APIC 0x5
Feb 20 16:39:18 linux-sc6n.suse kernel: Disabled fast string operations
Feb 20 16:39:18 linux-sc6n.suse kernel:  cache: parent cpu5 should not be
sleeping
Feb 20 16:39:18 linux-sc6n.suse kernel: CPU5 is up
Feb 20 16:39:18 linux-sc6n.suse kernel: smpboot: Booting Node 0 Processor 6
APIC 0x6
Feb 20 16:39:18 linux-sc6n.suse kernel: Disabled fast string operations
Feb 20 16:39:18 linux-sc6n.suse kernel:  cache: parent cpu6 should not be
sleeping
Feb 20 16:39:18 linux-sc6n.suse kernel: CPU6 is up
Feb 20 16:39:18 linux-sc6n.suse kernel: smpboot: Booting Node 0 Processor 7
APIC 0x7
Feb 20 16:39:18 linux-sc6n.suse kernel: Disabled fast string operations
Feb 20 16:39:18 linux-sc6n.suse kernel:  cache: parent cpu7 should not be
sleeping
Feb 20 16:39:18 linux-sc6n.suse kernel: CPU7 is up
Feb 20 16:39:18 linux-sc6n.suse kernel: ACPI: Waking up from system sleep s=
tate
S3
Feb 20 16:39:18 linux-sc6n.suse kernel: ehci-pci 0000:00:1a.0: System wakeup
disabled by ACPI
Feb 20 16:39:18 linux-sc6n.suse kernel: ehci-pci 0000:00:1d.0: System wakeup
disabled by ACPI
Feb 20 16:39:18 linux-sc6n.suse kernel: pcieport 0000:00:1c.6: System wakeup
disabled by ACPI
Feb 20 16:39:18 linux-sc6n.suse kernel: sdhci-pci 0000:0d:00.0: MMC control=
ler
base frequency changed to 50Mhz.
Feb 20 16:39:18 linux-sc6n.suse kernel: PM: noirq resume of devices complete
after 18.717 msecs
Feb 20 16:39:18 linux-sc6n.suse kernel: PM: early resume of devices complete
after 0.646 msecs
Feb 20 16:39:18 linux-sc6n.suse kernel: e1000e 0000:00:19.0: System wakeup
disabled by ACPI
Feb 20 16:39:18 linux-sc6n.suse kernel: nouveau 0000:01:00.0: DRM: resuming
kernel object tree...
Feb 20 16:39:18 linux-sc6n.suse kernel: usb usb2: root hub lost power or was
reset
Feb 20 16:39:18 linux-sc6n.suse kernel: usb usb3: root hub lost power or was
reset
Feb 20 16:39:18 linux-sc6n.suse kernel: rtc_cmos 00:02: System wakeup disab=
led
by ACPI
Feb 20 16:39:18 linux-sc6n.suse kernel: sd 0:0:0:0: [sda] Starting disk
Feb 20 16:39:18 linux-sc6n.suse kernel: usb 1-1.6: reset high-speed USB dev=
ice
number 5 using ehci-pci
Feb 20 16:39:18 linux-sc6n.suse kernel: usb 4-1.5: reset full-speed USB dev=
ice
number 3 using ehci-pci
Feb 20 16:39:18 linux-sc6n.suse kernel: ata2: SATA link down (SStatus 0
SControl 300)
Feb 20 16:39:18 linux-sc6n.suse kernel: ata5: SATA link down (SStatus 0
SControl 300)
Feb 20 16:39:18 linux-sc6n.suse kernel: ata1: SATA link up 6.0 Gbps (SStatus
133 SControl 300)
Feb 20 16:39:18 linux-sc6n.suse kernel: ata4: SATA link down (SStatus 0
SControl 300)
Feb 20 16:39:18 linux-sc6n.suse kernel: nouveau 0000:01:00.0: DRM: resuming
client object trees...
Feb 20 16:39:18 linux-sc6n.suse kernel: nouveau 0000:01:00.0: DRM: resuming
display...
Feb 20 16:39:18 linux-sc6n.suse kernel: usb 1-1.5: reset high-speed USB dev=
ice
number 7 using ehci-pci
Feb 20 16:39:18 linux-sc6n.suse kernel: nouveau 0000:01:00.0: DRM: resuming
console...
Feb 20 16:39:18 linux-sc6n.suse kernel: usb 1-1.4: reset full-speed USB dev=
ice
number 3 using ehci-pci
Feb 20 16:39:18 linux-sc6n.suse kernel: ata1.00: ACPI cmd ef/02:00:00:00:00=
:a0
(SET FEATURES) succeeded
Feb 20 16:39:18 linux-sc6n.suse kernel: ata1.00: ACPI cmd f5/00:00:00:00:00=
:a0
(SECURITY FREEZE LOCK) filtered out
Feb 20 16:39:18 linux-sc6n.suse kernel: ata1.00: ACPI cmd ef/10:03:00:00:00=
:a0
(SET FEATURES) filtered out
Feb 20 16:39:18 linux-sc6n.suse kernel: ata1.00: ACPI cmd ef/02:00:00:00:00=
:a0
(SET FEATURES) succeeded
Feb 20 16:39:18 linux-sc6n.suse kernel: ata1.00: ACPI cmd f5/00:00:00:00:00=
:a0
(SECURITY FREEZE LOCK) filtered out
Feb 20 16:39:18 linux-sc6n.suse kernel: ata1.00: ACPI cmd ef/10:03:00:00:00=
:a0
(SET FEATURES) filtered out
Feb 20 16:39:18 linux-sc6n.suse kernel: ata1.00: ACPI cmd ef/10:03:00:00:00=
:a0
(SET FEATURES) filtered out
Feb 20 16:39:18 linux-sc6n.suse kernel: ata1.00: configured for UDMA/133
Feb 20 16:39:18 linux-sc6n.suse kernel: usb 1-1.5.4: reset low-speed USB de=
vice
number 8 using ehci-pci
Feb 20 16:39:18 linux-sc6n.suse kernel: snd_hda_codec_hdmi hdaudioC1D2: HDM=
I:
audio coding type 0 not expected
Feb 20 16:39:18 linux-sc6n.suse kernel: PM: resume of devices complete after
1241.680 msecs
Feb 20 16:39:18 linux-sc6n.suse kernel: usb 1-1.4:1.0: rebind failed: -517
Feb 20 16:39:18 linux-sc6n.suse kernel: usb 1-1.4:1.1: rebind failed: -517
Feb 20 16:39:18 linux-sc6n.suse kernel: PM: Finishing wakeup.
Feb 20 16:39:18 linux-sc6n.suse kernel: Restarting tasks ... done.
Feb 20 16:39:18 linux-sc6n.suse systemd[1]: Time has been changed
Feb 20 16:39:18 linux-sc6n.suse kernel: nouveau 0000:01:00.0: fifo: read fa=
ult
at 0003ae0000 engine 15 [PCE0] client 01 [PCOPY0] reason 02 [PAGE_NOT_PRESE=
NT]
on channel 0 [003fe14000 DRM]
Feb 20 16:39:18 linux-sc6n.suse kernel: nouveau 0000:01:00.0: fifo: ce0 eng=
ine
fault on channel 0, recovering...
Feb 20 16:39:18 linux-sc6n.suse NetworkManager[1218]: <info>  (eth0): link
disconnected
Feb 20 16:39:18 linux-sc6n.suse systemd[2673]: Time has been changed
(In reply to G=C3=A9za B=C3=BAza from comment #0)
> Created attachment 123963 [details]
> Kernel log
>=20
> Environment:
>  - Linux kernel 4.5.4
>  - Desktop environment: Gnome 3.20.2
>  - Xorg 1.18.3
>  - Graphics card: NVIDIA Corporation GK107GLM [Quadro K1000M] (rev a1)
>=20
> Nouveau makes Xorg unresponsive after resuming from suspend to RAM.
> Restarting Xorg did not help, but a reboot.
>=20
> Error messages look like:
> nouveau 0000:01:00.0: fifo: read fault at 0000dc8000 engine 15 [CE0] clie=
nt
> 01 [CE0] reason 02 [PTE] on channel 0 [007fd56000 DRM]
> nouveau 0000:01:00.0: fifo: ce0 engine fault on channel 0, recovering...
>=20
> It must be a regression, because the issue did not happen with the same
> hardware on kernel 4.4.x.

(In reply to G=C3=A9za B=C3=BAza from comment #0)
> Created attachment 123963 [details]
> Kernel log
>=20
> Environment:
>  - Linux kernel 4.5.4
>  - Desktop environment: Gnome 3.20.2
>  - Xorg 1.18.3
>  - Graphics card: NVIDIA Corporation GK107GLM [Quadro K1000M] (rev a1)
>=20
> Nouveau makes Xorg unresponsive after resuming from suspend to RAM.
> Restarting Xorg did not help, but a reboot.
>=20
> Error messages look like:
> nouveau 0000:01:00.0: fifo: read fault at 0000dc8000 engine 15 [CE0] clie=
nt
> 01 [CE0] reason 02 [PTE] on channel 0 [007fd56000 DRM]
> nouveau 0000:01:00.0: fifo: ce0 engine fault on channel 0, recovering...
>=20
> It must be a regression, because the issue did not happen with the same
> hardware on kernel 4.4.x.

(In reply to G=C3=A9za B=C3=BAza from comment #0)
> Created attachment 123963 [details]
> Kernel log
>=20
> Environment:
>  - Linux kernel 4.5.4
>  - Desktop environment: Gnome 3.20.2
>  - Xorg 1.18.3
>  - Graphics card: NVIDIA Corporation GK107GLM [Quadro K1000M] (rev a1)
>=20
> Nouveau makes Xorg unresponsive after resuming from suspend to RAM.
> Restarting Xorg did not help, but a reboot.
>=20
> Error messages look like:
> nouveau 0000:01:00.0: fifo: read fault at 0000dc8000 engine 15 [CE0] clie=
nt
> 01 [CE0] reason 02 [PTE] on channel 0 [007fd56000 DRM]
> nouveau 0000:01:00.0: fifo: ce0 engine fault on channel 0, recovering...
>=20
> It must be a regression, because the issue did not happen with the same
> hardware on kernel 4.4.x.

(In reply to G=C3=A9za B=C3=BAza from comment #0)
> Created attachment 123963 [details]
> Kernel log
>=20
> Environment:
>  - Linux kernel 4.5.4
>  - Desktop environment: Gnome 3.20.2
>  - Xorg 1.18.3
>  - Graphics card: NVIDIA Corporation GK107GLM [Quadro K1000M] (rev a1)
>=20
> Nouveau makes Xorg unresponsive after resuming from suspend to RAM.
> Restarting Xorg did not help, but a reboot.
>=20
> Error messages look like:
> nouveau 0000:01:00.0: fifo: read fault at 0000dc8000 engine 15 [CE0] clie=
nt
> 01 [CE0] reason 02 [PTE] on channel 0 [007fd56000 DRM]
> nouveau 0000:01:00.0: fifo: ce0 engine fault on channel 0, recovering...
>=20
> It must be a regression, because the issue did not happen with the same
> hardware on kernel 4.4.x.

(In reply to G=C3=A9za B=C3=BAza from comment #0)
> Created attachment 123963 [details]
> Kernel log
>=20
> Environment:
>  - Linux kernel 4.5.4
>  - Desktop environment: Gnome 3.20.2
>  - Xorg 1.18.3
>  - Graphics card: NVIDIA Corporation GK107GLM [Quadro K1000M] (rev a1)
>=20
> Nouveau makes Xorg unresponsive after resuming from suspend to RAM.
> Restarting Xorg did not help, but a reboot.
>=20
> Error messages look like:
> nouveau 0000:01:00.0: fifo: read fault at 0000dc8000 engine 15 [CE0] clie=
nt
> 01 [CE0] reason 02 [PTE] on channel 0 [007fd56000 DRM]
> nouveau 0000:01:00.0: fifo: ce0 engine fault on channel 0, recovering...
>=20
> It must be a regression, because the issue did not happen with the same
> hardware on kernel 4.4.x.

(In reply to G=C3=A9za B=C3=BAza from comment #0)
> Created attachment 123963 [details]
> Kernel log
>=20
> Environment:
>  - Linux kernel 4.5.4
>  - Desktop environment: Gnome 3.20.2
>  - Xorg 1.18.3
>  - Graphics card: NVIDIA Corporation GK107GLM [Quadro K1000M] (rev a1)
>=20
> Nouveau makes Xorg unresponsive after resuming from suspend to RAM.
> Restarting Xorg did not help, but a reboot.
>=20
> Error messages look like:
> nouveau 0000:01:00.0: fifo: read fault at 0000dc8000 engine 15 [CE0] clie=
nt
> 01 [CE0] reason 02 [PTE] on channel 0 [007fd56000 DRM]
> nouveau 0000:01:00.0: fifo: ce0 engine fault on channel 0, recovering...
>=20
> It must be a regression, because the issue did not happen with the same
> hardware on kernel 4.4.x.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14876084100.23d82.24187
Date: Mon, 20 Feb 2017 16:33:30 +0000
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
   title=3D"NEW - Error when recovering from suspend mode: fifo: ce0 engine=
 fault on channel 0"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D95520#c3">Comment=
 # 3</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Error when recovering from suspend mode: fifo: ce0 engine=
 fault on channel 0"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D95520">bug 95520<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
mail-freedesktopbugs&#64;juliankessel.de" title=3D"mail-freedesktopbugs&#64=
;juliankessel.de">mail-freedesktopbugs&#64;juliankessel.de</a>
</span></b>
        <pre>I'm having a similar situation like G=C3=A9za B=C3=BAz, the tw=
o external DisplayPort
connected Displays get a signal, but only the frozen cursor on black backgr=
ound
is visible. No further interaction is possible, no shell switching,
ctrl-alt-delete etc. Unfortunately, this is not reproducible every time I
suspend the system.
On reboot, the system hangs in a state after kernel selection/grub, where t=
he
fan runs high but no output is shown on any screen, the system is frozen.
Only after several reboot attempts (~3) the boot runs normally again.

(a recent memtest did not report errors)

Environment:
 - Linux kernel 4.4.46
 - Desktop environment: KDE Plasma 5.8.3
 - Xorg 1.18.3
 - Graphics card: NVIDIA Corporation GF108GLM [Quadro 1000M] (rev a1)


Feb 20 16:39:18 linux-sc6n.suse kernel: ACPI: Waking up from system sleep s=
tate
S3
Feb 20 16:39:18 linux-sc6n.suse kernel: ehci-pci 0000:00:1a.0: System wakeup
disabled by ACPI
Feb 20 16:39:18 linux-sc6n.suse kernel: ehci-pci 0000:00:1d.0: System wakeup
disabled by ACPI
Feb 20 16:39:18 linux-sc6n.suse kernel: pcieport 0000:00:1c.6: System wakeup
disabled by ACPI
Feb 20 16:39:18 linux-sc6n.suse kernel: sdhci-pci 0000:0d:00.0: MMC control=
ler
base frequency changed to 50Mhz.
Feb 20 16:39:18 linux-sc6n.suse kernel: PM: noirq resume of devices complete
after 18.717 msecs
Feb 20 16:39:18 linux-sc6n.suse kernel: PM: early resume of devices complete
after 0.646 msecs
Feb 20 16:39:18 linux-sc6n.suse kernel: e1000e 0000:00:19.0: System wakeup
disabled by ACPI
Feb 20 16:39:18 linux-sc6n.suse kernel: nouveau 0000:01:00.0: DRM: resuming
kernel object tree...
Feb 20 16:39:18 linux-sc6n.suse kernel: usb usb2: root hub lost power or was
reset
Feb 20 16:39:18 linux-sc6n.suse kernel: usb usb3: root hub lost power or was
reset
Feb 20 16:39:18 linux-sc6n.suse kernel: rtc_cmos 00:02: System wakeup disab=
led
by ACPI
Feb 20 16:39:18 linux-sc6n.suse kernel: sd 0:0:0:0: [sda] Starting disk
Feb 20 16:39:18 linux-sc6n.suse kernel: usb 1-1.6: reset high-speed USB dev=
ice
number 5 using ehci-pci
Feb 20 16:39:18 linux-sc6n.suse kernel: usb 4-1.5: reset full-speed USB dev=
ice
number 3 using ehci-pci
Feb 20 16:39:18 linux-sc6n.suse kernel: ata2: SATA link down (SStatus 0
SControl 300)
Feb 20 16:39:18 linux-sc6n.suse kernel: ata5: SATA link down (SStatus 0
SControl 300)
Feb 20 16:39:18 linux-sc6n.suse kernel: ata1: SATA link up 6.0 Gbps (SStatus
133 SControl 300)
Feb 20 16:39:18 linux-sc6n.suse kernel: ata4: SATA link down (SStatus 0
SControl 300)
Feb 20 16:39:18 linux-sc6n.suse kernel: nouveau 0000:01:00.0: DRM: resuming
client object trees...
Feb 20 16:39:18 linux-sc6n.suse kernel: nouveau 0000:01:00.0: DRM: resuming
display...
Feb 20 16:39:18 linux-sc6n.suse kernel: usb 1-1.5: reset high-speed USB dev=
ice
number 7 using ehci-pci
Feb 20 16:39:18 linux-sc6n.suse kernel: nouveau 0000:01:00.0: DRM: resuming
console...
Feb 20 16:39:18 linux-sc6n.suse kernel: usb 1-1.4: reset full-speed USB dev=
ice
number 3 using ehci-pci
Feb 20 16:39:18 linux-sc6n.suse kernel: ata1.00: ACPI cmd ef/02:00:00:00:00=
:a0
(SET FEATURES) succeeded
Feb 20 16:39:18 linux-sc6n.suse kernel: ata1.00: ACPI cmd f5/00:00:00:00:00=
:a0
(SECURITY FREEZE LOCK) filtered out
Feb 20 16:39:18 linux-sc6n.suse kernel: ata1.00: ACPI cmd ef/10:03:00:00:00=
:a0
(SET FEATURES) filtered out
Feb 20 16:39:18 linux-sc6n.suse kernel: ata1.00: ACPI cmd ef/02:00:00:00:00=
:a0
(SET FEATURES) succeeded
Feb 20 16:39:18 linux-sc6n.suse kernel: ata1.00: ACPI cmd f5/00:00:00:00:00=
:a0
(SECURITY FREEZE LOCK) filtered out
Feb 20 16:39:18 linux-sc6n.suse kernel: ata1.00: ACPI cmd ef/10:03:00:00:00=
:a0
(SET FEATURES) filtered out
Feb 20 16:39:18 linux-sc6n.suse kernel: ata1.00: configured for UDMA/133
Feb 20 16:39:18 linux-sc6n.suse kernel: usb 1-1.5.4: reset low-speed USB de=
vice
number 8 using ehci-pci
Feb 20 16:39:18 linux-sc6n.suse kernel: snd_hda_codec_hdmi hdaudioC1D2: HDM=
I:
audio coding type 0 not expected
Feb 20 16:39:18 linux-sc6n.suse kernel: PM: resume of devices complete after
1241.680 msecs
Feb 20 16:39:18 linux-sc6n.suse kernel: usb 1-1.4:1.0: rebind failed: -517
Feb 20 16:39:18 linux-sc6n.suse kernel: usb 1-1.4:1.1: rebind failed: -517
Feb 20 16:39:18 linux-sc6n.suse kernel: PM: Finishing wakeup.
Feb 20 16:39:18 linux-sc6n.suse kernel: Restarting tasks ... done.
Feb 20 16:39:18 linux-sc6n.suse systemd[1]: Time has been changed
Feb 20 16:39:18 linux-sc6n.suse kernel: nouveau 0000:01:00.0: fifo: read fa=
ult
at 0003ae0000 engine 15 [PCE0] client 01 [PCOPY0] reason 02 [PAGE_NOT_PRESE=
NT]
on channel 0 [003fe14000 DRM]
Feb 20 16:39:18 linux-sc6n.suse kernel: nouveau 0000:01:00.0: fifo: ce0 eng=
ine
fault on channel 0, recovering...
Feb 20 16:39:18 linux-sc6n.suse NetworkManager[1218]: &lt;info&gt;  (eth0):=
 link
disconnected
Feb 20 16:39:18 linux-sc6n.suse systemd[2673]: Time has been changed
Feb 20 16:39:18 linux-sc6n.suse NetworkManager[1218]: &lt;info&gt;  (eth0):=
 device
state change: disconnected -&gt; unavailable (reason 'carrier-changed') [30=
 20 40]
Feb 20 16:39:18 linux-sc6n.suse bluetoothd[1096]: Endpoint unregistered:
sender=3D:1.39 path=3D/MediaEndpoint/A2DPSource
Feb 20 16:39:18 linux-sc6n.suse systemd-sleep[31277]: System resumed.
Feb 20 16:39:18 linux-sc6n.suse bluetoothd[1096]: Endpoint unregistered:
sender=3D:1.39 path=3D/MediaEndpoint/A2DPSink
Feb 20 16:39:18 linux-sc6n.suse systemd[1]: Starting Load/Save RF Kill Swit=
ch
Status...
Feb 20 16:39:18 linux-sc6n.suse systemd[1]: bluetooth.target: Unit not need=
ed
anymore. Stopping.
Feb 20 16:39:18 linux-sc6n.suse systemd[1]: Stopped target Bluetooth.
Feb 20 16:39:18 linux-sc6n.suse systemd[1]: Started Load/Save RF Kill Switch
Status.
Feb 20 16:39:18 linux-sc6n.suse systemd-sleep[31277]: INFO: Skip running
/usr/lib/systemd/system-sleep/grub2.sleep for suspend
Feb 20 16:39:18 linux-sc6n.suse systemd[1]: Started Suspend.
Feb 20 16:39:18 linux-sc6n.suse kernel: smpboot: Booting Node 0 Processor 3
APIC 0x3
Feb 20 16:39:18 linux-sc6n.suse kernel: Disabled fast string operations
Feb 20 16:39:18 linux-sc6n.suse kernel:  cache: parent cpu3 should not be
sleeping
Feb 20 16:39:18 linux-sc6n.suse kernel: CPU3 is up
Feb 20 16:39:18 linux-sc6n.suse kernel: smpboot: Booting Node 0 Processor 4
APIC 0x4
Feb 20 16:39:18 linux-sc6n.suse kernel: Disabled fast string operations
Feb 20 16:39:18 linux-sc6n.suse kernel:  cache: parent cpu4 should not be
sleeping
Feb 20 16:39:18 linux-sc6n.suse kernel: CPU4 is up
Feb 20 16:39:18 linux-sc6n.suse kernel: smpboot: Booting Node 0 Processor 5
APIC 0x5
Feb 20 16:39:18 linux-sc6n.suse kernel: Disabled fast string operations
Feb 20 16:39:18 linux-sc6n.suse kernel:  cache: parent cpu5 should not be
sleeping
Feb 20 16:39:18 linux-sc6n.suse kernel: CPU5 is up
Feb 20 16:39:18 linux-sc6n.suse kernel: smpboot: Booting Node 0 Processor 6
APIC 0x6
Feb 20 16:39:18 linux-sc6n.suse kernel: Disabled fast string operations
Feb 20 16:39:18 linux-sc6n.suse kernel:  cache: parent cpu6 should not be
sleeping
Feb 20 16:39:18 linux-sc6n.suse kernel: CPU6 is up
Feb 20 16:39:18 linux-sc6n.suse kernel: smpboot: Booting Node 0 Processor 7
APIC 0x7
Feb 20 16:39:18 linux-sc6n.suse kernel: Disabled fast string operations
Feb 20 16:39:18 linux-sc6n.suse kernel:  cache: parent cpu7 should not be
sleeping
Feb 20 16:39:18 linux-sc6n.suse kernel: CPU7 is up
Feb 20 16:39:18 linux-sc6n.suse kernel: ACPI: Waking up from system sleep s=
tate
S3
Feb 20 16:39:18 linux-sc6n.suse kernel: ehci-pci 0000:00:1a.0: System wakeup
disabled by ACPI
Feb 20 16:39:18 linux-sc6n.suse kernel: ehci-pci 0000:00:1d.0: System wakeup
disabled by ACPI
Feb 20 16:39:18 linux-sc6n.suse kernel: pcieport 0000:00:1c.6: System wakeup
disabled by ACPI
Feb 20 16:39:18 linux-sc6n.suse kernel: sdhci-pci 0000:0d:00.0: MMC control=
ler
base frequency changed to 50Mhz.
Feb 20 16:39:18 linux-sc6n.suse kernel: PM: noirq resume of devices complete
after 18.717 msecs
Feb 20 16:39:18 linux-sc6n.suse kernel: PM: early resume of devices complete
after 0.646 msecs
Feb 20 16:39:18 linux-sc6n.suse kernel: e1000e 0000:00:19.0: System wakeup
disabled by ACPI
Feb 20 16:39:18 linux-sc6n.suse kernel: nouveau 0000:01:00.0: DRM: resuming
kernel object tree...
Feb 20 16:39:18 linux-sc6n.suse kernel: usb usb2: root hub lost power or was
reset
Feb 20 16:39:18 linux-sc6n.suse kernel: usb usb3: root hub lost power or was
reset
Feb 20 16:39:18 linux-sc6n.suse kernel: rtc_cmos 00:02: System wakeup disab=
led
by ACPI
Feb 20 16:39:18 linux-sc6n.suse kernel: sd 0:0:0:0: [sda] Starting disk
Feb 20 16:39:18 linux-sc6n.suse kernel: usb 1-1.6: reset high-speed USB dev=
ice
number 5 using ehci-pci
Feb 20 16:39:18 linux-sc6n.suse kernel: usb 4-1.5: reset full-speed USB dev=
ice
number 3 using ehci-pci
Feb 20 16:39:18 linux-sc6n.suse kernel: ata2: SATA link down (SStatus 0
SControl 300)
Feb 20 16:39:18 linux-sc6n.suse kernel: ata5: SATA link down (SStatus 0
SControl 300)
Feb 20 16:39:18 linux-sc6n.suse kernel: ata1: SATA link up 6.0 Gbps (SStatus
133 SControl 300)
Feb 20 16:39:18 linux-sc6n.suse kernel: ata4: SATA link down (SStatus 0
SControl 300)
Feb 20 16:39:18 linux-sc6n.suse kernel: nouveau 0000:01:00.0: DRM: resuming
client object trees...
Feb 20 16:39:18 linux-sc6n.suse kernel: nouveau 0000:01:00.0: DRM: resuming
display...
Feb 20 16:39:18 linux-sc6n.suse kernel: usb 1-1.5: reset high-speed USB dev=
ice
number 7 using ehci-pci
Feb 20 16:39:18 linux-sc6n.suse kernel: nouveau 0000:01:00.0: DRM: resuming
console...
Feb 20 16:39:18 linux-sc6n.suse kernel: usb 1-1.4: reset full-speed USB dev=
ice
number 3 using ehci-pci
Feb 20 16:39:18 linux-sc6n.suse kernel: ata1.00: ACPI cmd ef/02:00:00:00:00=
:a0
(SET FEATURES) succeeded
Feb 20 16:39:18 linux-sc6n.suse kernel: ata1.00: ACPI cmd f5/00:00:00:00:00=
:a0
(SECURITY FREEZE LOCK) filtered out
Feb 20 16:39:18 linux-sc6n.suse kernel: ata1.00: ACPI cmd ef/10:03:00:00:00=
:a0
(SET FEATURES) filtered out
Feb 20 16:39:18 linux-sc6n.suse kernel: ata1.00: ACPI cmd ef/02:00:00:00:00=
:a0
(SET FEATURES) succeeded
Feb 20 16:39:18 linux-sc6n.suse kernel: ata1.00: ACPI cmd f5/00:00:00:00:00=
:a0
(SECURITY FREEZE LOCK) filtered out
Feb 20 16:39:18 linux-sc6n.suse kernel: ata1.00: ACPI cmd ef/10:03:00:00:00=
:a0
(SET FEATURES) filtered out
Feb 20 16:39:18 linux-sc6n.suse kernel: ata1.00: ACPI cmd ef/10:03:00:00:00=
:a0
(SET FEATURES) filtered out
Feb 20 16:39:18 linux-sc6n.suse kernel: ata1.00: configured for UDMA/133
Feb 20 16:39:18 linux-sc6n.suse kernel: usb 1-1.5.4: reset low-speed USB de=
vice
number 8 using ehci-pci
Feb 20 16:39:18 linux-sc6n.suse kernel: snd_hda_codec_hdmi hdaudioC1D2: HDM=
I:
audio coding type 0 not expected
Feb 20 16:39:18 linux-sc6n.suse kernel: PM: resume of devices complete after
1241.680 msecs
Feb 20 16:39:18 linux-sc6n.suse kernel: usb 1-1.4:1.0: rebind failed: -517
Feb 20 16:39:18 linux-sc6n.suse kernel: usb 1-1.4:1.1: rebind failed: -517
Feb 20 16:39:18 linux-sc6n.suse kernel: PM: Finishing wakeup.
Feb 20 16:39:18 linux-sc6n.suse kernel: Restarting tasks ... done.
Feb 20 16:39:18 linux-sc6n.suse systemd[1]: Time has been changed
Feb 20 16:39:18 linux-sc6n.suse kernel: nouveau 0000:01:00.0: fifo: read fa=
ult
at 0003ae0000 engine 15 [PCE0] client 01 [PCOPY0] reason 02 [PAGE_NOT_PRESE=
NT]
on channel 0 [003fe14000 DRM]
Feb 20 16:39:18 linux-sc6n.suse kernel: nouveau 0000:01:00.0: fifo: ce0 eng=
ine
fault on channel 0, recovering...
Feb 20 16:39:18 linux-sc6n.suse NetworkManager[1218]: &lt;info&gt;  (eth0):=
 link
disconnected
Feb 20 16:39:18 linux-sc6n.suse systemd[2673]: Time has been changed
(In reply to G=C3=A9za B=C3=BAza from <a href=3D"show_bug.cgi?id=3D95520#c0=
">comment #0</a>)
<span class=3D"quote">&gt; Created <span class=3D""><a href=3D"attachment.c=
gi?id=3D123963" name=3D"attach_123963" title=3D"Kernel log">attachment 1239=
63</a> <a href=3D"attachment.cgi?id=3D123963&amp;action=3Dedit" title=3D"Ke=
rnel log">[details]</a></span>
&gt; Kernel log
&gt;=20
&gt; Environment:
&gt;  - Linux kernel 4.5.4
&gt;  - Desktop environment: Gnome 3.20.2
&gt;  - Xorg 1.18.3
&gt;  - Graphics card: NVIDIA Corporation GK107GLM [Quadro K1000M] (rev a1)
&gt;=20
&gt; Nouveau makes Xorg unresponsive after resuming from suspend to RAM.
&gt; Restarting Xorg did not help, but a reboot.
&gt;=20
&gt; Error messages look like:
&gt; nouveau 0000:01:00.0: fifo: read fault at 0000dc8000 engine 15 [CE0] c=
lient
&gt; 01 [CE0] reason 02 [PTE] on channel 0 [007fd56000 DRM]
&gt; nouveau 0000:01:00.0: fifo: ce0 engine fault on channel 0, recovering.=
..
&gt;=20
&gt; It must be a regression, because the issue did not happen with the same
&gt; hardware on kernel 4.4.x.</span >

(In reply to G=C3=A9za B=C3=BAza from <a href=3D"show_bug.cgi?id=3D95520#c0=
">comment #0</a>)
<span class=3D"quote">&gt; Created <span class=3D""><a href=3D"attachment.c=
gi?id=3D123963" name=3D"attach_123963" title=3D"Kernel log">attachment 1239=
63</a> <a href=3D"attachment.cgi?id=3D123963&amp;action=3Dedit" title=3D"Ke=
rnel log">[details]</a></span>
&gt; Kernel log
&gt;=20
&gt; Environment:
&gt;  - Linux kernel 4.5.4
&gt;  - Desktop environment: Gnome 3.20.2
&gt;  - Xorg 1.18.3
&gt;  - Graphics card: NVIDIA Corporation GK107GLM [Quadro K1000M] (rev a1)
&gt;=20
&gt; Nouveau makes Xorg unresponsive after resuming from suspend to RAM.
&gt; Restarting Xorg did not help, but a reboot.
&gt;=20
&gt; Error messages look like:
&gt; nouveau 0000:01:00.0: fifo: read fault at 0000dc8000 engine 15 [CE0] c=
lient
&gt; 01 [CE0] reason 02 [PTE] on channel 0 [007fd56000 DRM]
&gt; nouveau 0000:01:00.0: fifo: ce0 engine fault on channel 0, recovering.=
..
&gt;=20
&gt; It must be a regression, because the issue did not happen with the same
&gt; hardware on kernel 4.4.x.</span >

(In reply to G=C3=A9za B=C3=BAza from <a href=3D"show_bug.cgi?id=3D95520#c0=
">comment #0</a>)
<span class=3D"quote">&gt; Created <span class=3D""><a href=3D"attachment.c=
gi?id=3D123963" name=3D"attach_123963" title=3D"Kernel log">attachment 1239=
63</a> <a href=3D"attachment.cgi?id=3D123963&amp;action=3Dedit" title=3D"Ke=
rnel log">[details]</a></span>
&gt; Kernel log
&gt;=20
&gt; Environment:
&gt;  - Linux kernel 4.5.4
&gt;  - Desktop environment: Gnome 3.20.2
&gt;  - Xorg 1.18.3
&gt;  - Graphics card: NVIDIA Corporation GK107GLM [Quadro K1000M] (rev a1)
&gt;=20
&gt; Nouveau makes Xorg unresponsive after resuming from suspend to RAM.
&gt; Restarting Xorg did not help, but a reboot.
&gt;=20
&gt; Error messages look like:
&gt; nouveau 0000:01:00.0: fifo: read fault at 0000dc8000 engine 15 [CE0] c=
lient
&gt; 01 [CE0] reason 02 [PTE] on channel 0 [007fd56000 DRM]
&gt; nouveau 0000:01:00.0: fifo: ce0 engine fault on channel 0, recovering.=
..
&gt;=20
&gt; It must be a regression, because the issue did not happen with the same
&gt; hardware on kernel 4.4.x.</span >

(In reply to G=C3=A9za B=C3=BAza from <a href=3D"show_bug.cgi?id=3D95520#c0=
">comment #0</a>)
<span class=3D"quote">&gt; Created <span class=3D""><a href=3D"attachment.c=
gi?id=3D123963" name=3D"attach_123963" title=3D"Kernel log">attachment 1239=
63</a> <a href=3D"attachment.cgi?id=3D123963&amp;action=3Dedit" title=3D"Ke=
rnel log">[details]</a></span>
&gt; Kernel log
&gt;=20
&gt; Environment:
&gt;  - Linux kernel 4.5.4
&gt;  - Desktop environment: Gnome 3.20.2
&gt;  - Xorg 1.18.3
&gt;  - Graphics card: NVIDIA Corporation GK107GLM [Quadro K1000M] (rev a1)
&gt;=20
&gt; Nouveau makes Xorg unresponsive after resuming from suspend to RAM.
&gt; Restarting Xorg did not help, but a reboot.
&gt;=20
&gt; Error messages look like:
&gt; nouveau 0000:01:00.0: fifo: read fault at 0000dc8000 engine 15 [CE0] c=
lient
&gt; 01 [CE0] reason 02 [PTE] on channel 0 [007fd56000 DRM]
&gt; nouveau 0000:01:00.0: fifo: ce0 engine fault on channel 0, recovering.=
..
&gt;=20
&gt; It must be a regression, because the issue did not happen with the same
&gt; hardware on kernel 4.4.x.</span >

(In reply to G=C3=A9za B=C3=BAza from <a href=3D"show_bug.cgi?id=3D95520#c0=
">comment #0</a>)
<span class=3D"quote">&gt; Created <span class=3D""><a href=3D"attachment.c=
gi?id=3D123963" name=3D"attach_123963" title=3D"Kernel log">attachment 1239=
63</a> <a href=3D"attachment.cgi?id=3D123963&amp;action=3Dedit" title=3D"Ke=
rnel log">[details]</a></span>
&gt; Kernel log
&gt;=20
&gt; Environment:
&gt;  - Linux kernel 4.5.4
&gt;  - Desktop environment: Gnome 3.20.2
&gt;  - Xorg 1.18.3
&gt;  - Graphics card: NVIDIA Corporation GK107GLM [Quadro K1000M] (rev a1)
&gt;=20
&gt; Nouveau makes Xorg unresponsive after resuming from suspend to RAM.
&gt; Restarting Xorg did not help, but a reboot.
&gt;=20
&gt; Error messages look like:
&gt; nouveau 0000:01:00.0: fifo: read fault at 0000dc8000 engine 15 [CE0] c=
lient
&gt; 01 [CE0] reason 02 [PTE] on channel 0 [007fd56000 DRM]
&gt; nouveau 0000:01:00.0: fifo: ce0 engine fault on channel 0, recovering.=
..
&gt;=20
&gt; It must be a regression, because the issue did not happen with the same
&gt; hardware on kernel 4.4.x.</span >

(In reply to G=C3=A9za B=C3=BAza from <a href=3D"show_bug.cgi?id=3D95520#c0=
">comment #0</a>)
<span class=3D"quote">&gt; Created <span class=3D""><a href=3D"attachment.c=
gi?id=3D123963" name=3D"attach_123963" title=3D"Kernel log">attachment 1239=
63</a> <a href=3D"attachment.cgi?id=3D123963&amp;action=3Dedit" title=3D"Ke=
rnel log">[details]</a></span>
&gt; Kernel log
&gt;=20
&gt; Environment:
&gt;  - Linux kernel 4.5.4
&gt;  - Desktop environment: Gnome 3.20.2
&gt;  - Xorg 1.18.3
&gt;  - Graphics card: NVIDIA Corporation GK107GLM [Quadro K1000M] (rev a1)
&gt;=20
&gt; Nouveau makes Xorg unresponsive after resuming from suspend to RAM.
&gt; Restarting Xorg did not help, but a reboot.
&gt;=20
&gt; Error messages look like:
&gt; nouveau 0000:01:00.0: fifo: read fault at 0000dc8000 engine 15 [CE0] c=
lient
&gt; 01 [CE0] reason 02 [PTE] on channel 0 [007fd56000 DRM]
&gt; nouveau 0000:01:00.0: fifo: ce0 engine fault on channel 0, recovering.=
..
&gt;=20
&gt; It must be a regression, because the issue did not happen with the same
&gt; hardware on kernel 4.4.x.</span ></pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14876084100.23d82.24187--

--===============1661335428==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1661335428==--
