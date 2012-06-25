From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 51411] New: Black screen after resuming from
	Hibernate
Date: Mon, 25 Jun 2012 14:59:08 +0000
Message-ID: <bug-51411-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=51411

             Bug #: 51411
           Summary: Black screen after resuming from Hibernate
    Classification: Unclassified
           Product: xorg
           Version: 7.7 (2011)
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: michele.cane-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


After resuming from hibernation the screen is black. I still can connect via
SSH.

Card is Nvidia Quadro 2000M.


Debian Sid kernel 3.4.1-1

I've submitted the bug in Debian here
http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=678391

here the syslog:


Jun 21 23:38:45 rhadamanthine anacron[5048]: Anacron 2.3 started on 2012-06-21
Jun 21 23:38:45 rhadamanthine anacron[5048]: Normal exit (0 jobs run)
Jun 21 23:38:45 rhadamanthine kernel: [  407.121298] PM: Marking nosave pages:
[mem 0x0009d000-0x000fffff]
Jun 21 23:38:45 rhadamanthine kernel: [  407.121303] PM: Marking nosave pages:
[mem 0xbf19f000-0xbf7fefff]
Jun 21 23:38:45 rhadamanthine kernel: [  407.121331] PM: Marking nosave pages:
[mem 0xbf800000-0xffffffff]
Jun 21 23:38:45 rhadamanthine kernel: [  407.122371] PM: Basic memory bitmaps
created
Jun 21 23:39:46 rhadamanthine kernel: [  407.122372] PM: Syncing filesystems
... done.
Jun 21 23:39:46 rhadamanthine kernel: [  407.125249] Freezing user space
processes ... (elapsed 0.01 seconds) done.
Jun 21 23:39:46 rhadamanthine kernel: [  407.140892] PM: Preallocating image
memory... done (allocated 300721 pages)
Jun 21 23:39:46 rhadamanthine kernel: [  407.302726] PM: Allocated 1202884
kbytes in 0.16 seconds (7518.02 MB/s)
Jun 21 23:39:46 rhadamanthine kernel: [  407.302728] Freezing remaining
freezable tasks ... (elapsed 0.01 seconds) done.
Jun 21 23:39:46 rhadamanthine kernel: [  407.316627] Suspending console(s) (use
no_console_suspend to debug)
Jun 21 23:39:46 rhadamanthine kernel: [  407.316736] hdaps: setting ec_rate=0,
filter_order=1
Jun 21 23:39:46 rhadamanthine kernel: [  407.428160] smapi smapi:
smapi_request: SMAPI error: SMAPI function is not available (func=2116)
Jun 21 23:39:46 rhadamanthine kernel: [  407.428170] smapi smapi:
__get_real_thresh: cannot get start_thresh of bat=0: SMAPI function is not
available
Jun 21 23:39:46 rhadamanthine kernel: [  407.539924] smapi smapi:
smapi_request: SMAPI error: SMAPI function is not available (func=2116)
Jun 21 23:39:46 rhadamanthine kernel: [  407.539935] smapi smapi:
__get_real_thresh: cannot get start_thresh of bat=1: SMAPI function is not
available
Jun 21 23:39:46 rhadamanthine kernel: [  407.550451] sd 2:0:0:0: [sdb]
Synchronizing SCSI cache
Jun 21 23:39:46 rhadamanthine kernel: [  407.550546] sd 0:0:0:0: [sda]
Synchronizing SCSI cache
Jun 21 23:39:46 rhadamanthine kernel: [  407.739694] [drm] nouveau
0000:01:00.0: Disabling display...
Jun 21 23:39:46 rhadamanthine kernel: [  407.739890] ACPI handle has no
context!
Jun 21 23:39:46 rhadamanthine kernel: [  407.747631] ACPI handle has no
context!
Jun 21 23:39:46 rhadamanthine kernel: [  407.913473] e1000e 0000:00:19.0:
wake-up capability enabled by ACPI
Jun 21 23:39:46 rhadamanthine kernel: [  408.186581] ACPI handle has no
context!
Jun 21 23:39:46 rhadamanthine kernel: [  408.834237] [drm] nouveau
0000:01:00.0: Disabling fbcon...
Jun 21 23:39:46 rhadamanthine kernel: [  408.834275] [drm] nouveau
0000:01:00.0: Unpinning framebuffer(s)...
Jun 21 23:39:46 rhadamanthine kernel: [  408.834325] [drm] nouveau
0000:01:00.0: Evicting buffers...
Jun 21 23:39:46 rhadamanthine kernel: [  409.097697] [drm] nouveau
0000:01:00.0: Idling channels...
Jun 21 23:39:46 rhadamanthine kernel: [  409.097845] [drm] nouveau
0000:01:00.0: Suspending GPU objects...
Jun 21 23:39:46 rhadamanthine kernel: [  410.386566] [drm] nouveau
0000:01:00.0: And we're gone!
Jun 21 23:39:46 rhadamanthine kernel: [  410.386700] PM: freeze of devices
complete after 3076.436 msecs
Jun 21 23:39:46 rhadamanthine kernel: [  410.386804] PM: late freeze of devices
complete after 0.100 msecs
Jun 21 23:39:46 rhadamanthine kernel: [  410.387495] PM: noirq freeze of
devices complete after 0.690 msecs
Jun 21 23:39:46 rhadamanthine kernel: [  410.387793] ACPI: Preparing to enter
system sleep state S4
Jun 21 23:39:46 rhadamanthine kernel: [  410.549761] PM: Saving platform NVS
memory
Jun 21 23:39:46 rhadamanthine kernel: [  410.553141] Disabling non-boot CPUs
...
Jun 21 23:39:46 rhadamanthine kernel: [  410.555038] CPU 1 is now offline
Jun 21 23:39:46 rhadamanthine kernel: [  410.657456] CPU 2 is now offline
Jun 21 23:39:46 rhadamanthine kernel: [  410.761239] CPU 3 is now offline
Jun 21 23:39:46 rhadamanthine kernel: [  410.865038] CPU 4 is now offline
Jun 21 23:39:46 rhadamanthine kernel: [  410.968814] CPU 5 is now offline
Jun 21 23:39:46 rhadamanthine kernel: [  411.072605] CPU 6 is now offline
Jun 21 23:39:46 rhadamanthine kernel: [  411.176393] CPU 7 is now offline
Jun 21 23:39:46 rhadamanthine kernel: [  411.176840] Extended CMOS year: 2000
Jun 21 23:39:46 rhadamanthine kernel: [  411.176918] PM: Creating hibernation
image:
Jun 21 23:39:46 rhadamanthine kernel: [  411.275350] PM: Need to copy 326857
pages
Jun 21 23:39:46 rhadamanthine kernel: [  411.275352] PM: Normal pages needed:
326857 + 1024, available pages: 1758161
Jun 21 23:39:46 rhadamanthine kernel: [  411.177950] PM: Restoring platform NVS
memory
Jun 21 23:39:46 rhadamanthine kernel: [  411.178856] Extended CMOS year: 2000
Jun 21 23:39:46 rhadamanthine kernel: [  411.178891] Enabling non-boot CPUs ...
Jun 21 23:39:46 rhadamanthine kernel: [  411.179015] Booting Node 0 Processor 1
APIC 0x1
Jun 21 23:39:46 rhadamanthine kernel: [  411.190028] Disabled fast string
operations
Jun 21 23:39:46 rhadamanthine kernel: [  411.192297] NMI watchdog: enabled,
takes one hw-pmu counter.
Jun 21 23:39:46 rhadamanthine kernel: [  411.294279] CPU1 is up
Jun 21 23:39:46 rhadamanthine kernel: [  411.294451] Booting Node 0 Processor 2
APIC 0x2
Jun 21 23:39:46 rhadamanthine kernel: [  411.305364] Disabled fast string
operations
Jun 21 23:39:46 rhadamanthine kernel: [  411.307673] NMI watchdog: enabled,
takes one hw-pmu counter.
Jun 21 23:39:46 rhadamanthine kernel: [  411.410130] CPU2 is up
Jun 21 23:39:46 rhadamanthine kernel: [  411.410476] Booting Node 0 Processor 3
APIC 0x3
Jun 21 23:39:46 rhadamanthine kernel: [  411.421389] Disabled fast string
operations
Jun 21 23:39:46 rhadamanthine kernel: [  411.423715] NMI watchdog: enabled,
takes one hw-pmu counter.
Jun 21 23:39:46 rhadamanthine kernel: [  411.525832] CPU3 is up
Jun 21 23:39:46 rhadamanthine kernel: [  411.526186] Booting Node 0 Processor 4
APIC 0x4
Jun 21 23:39:46 rhadamanthine kernel: [  411.537107] Disabled fast string
operations
Jun 21 23:39:46 rhadamanthine kernel: [  411.539545] NMI watchdog: enabled,
takes one hw-pmu counter.
Jun 21 23:39:46 rhadamanthine kernel: [  411.641649] CPU4 is up
Jun 21 23:39:46 rhadamanthine kernel: [  411.642001] Booting Node 0 Processor 5
APIC 0x5
Jun 21 23:39:46 rhadamanthine kernel: [  411.652922] Disabled fast string
operations
Jun 21 23:39:46 rhadamanthine kernel: [  411.655371] NMI watchdog: enabled,
takes one hw-pmu counter.
Jun 21 23:39:46 rhadamanthine kernel: [  411.757415] CPU5 is up
Jun 21 23:39:46 rhadamanthine kernel: [  411.757765] Booting Node 0 Processor 6
APIC 0x6
Jun 21 23:39:46 rhadamanthine kernel: [  411.768687] Disabled fast string
operations
Jun 21 23:39:46 rhadamanthine kernel: [  411.771144] NMI watchdog: enabled,
takes one hw-pmu counter.
Jun 21 23:39:46 rhadamanthine kernel: [  411.873170] CPU6 is up
Jun 21 23:39:46 rhadamanthine kernel: [  411.873592] Booting Node 0 Processor 7
APIC 0x7
Jun 21 23:39:46 rhadamanthine kernel: [  411.884612] Disabled fast string
operations
Jun 21 23:39:46 rhadamanthine kernel: [  411.887075] NMI watchdog: enabled,
takes one hw-pmu counter.
Jun 21 23:39:46 rhadamanthine kernel: [  411.988934] CPU7 is up
Jun 21 23:39:46 rhadamanthine kernel: [  411.995059] ACPI: Waking up from
system sleep state S4
Jun 21 23:39:46 rhadamanthine bluetoothd[3131]: HCI dev 0 down
Jun 21 23:39:46 rhadamanthine bluetoothd[3131]: Adapter /org/bluez/3131/hci0
has been disabled
Jun 21 23:39:46 rhadamanthine rtkit-daemon[3972]: The canary thread is
apparently starving. Taking action.
Jun 21 23:39:46 rhadamanthine rtkit-daemon[3972]: Demoting known real-time
threads.
Jun 21 23:39:46 rhadamanthine bluetoothd[3131]: HCI dev 0 unregistered
Jun 21 23:39:46 rhadamanthine bluetoothd[3131]: Stopping hci0 event socket
Jun 21 23:39:46 rhadamanthine bluetoothd[3131]: Unregister path:
/org/bluez/3131/hci0
Jun 21 23:39:46 rhadamanthine wpa_supplicant[3521]: rfkill: WLAN unblocked
Jun 21 23:39:46 rhadamanthine rtkit-daemon[3972]: Successfully demoted thread
4107 of process 4104 (/usr/bin/pulseaudio).
Jun 21 23:39:46 rhadamanthine rtkit-daemon[3972]: Successfully demoted thread
4106 of process 4104 (/usr/bin/pulseaudio).
Jun 21 23:39:46 rhadamanthine rtkit-daemon[3972]: Successfully demoted thread
4105 of process 4104 (/usr/bin/pulseaudio).
Jun 21 23:39:46 rhadamanthine rtkit-daemon[3972]: Successfully demoted thread
4104 of process 4104 (/usr/bin/pulseaudio).
Jun 21 23:39:46 rhadamanthine rtkit-daemon[3972]: Demoted 4 threads.
Jun 21 23:39:46 rhadamanthine acpid: client 3499[0:0] has disconnected
Jun 21 23:39:46 rhadamanthine bluetoothd[3131]: HCI dev 0 registered
Jun 21 23:39:46 rhadamanthine bluetoothd[3131]: Listening for HCI events on
hci0
Jun 21 23:39:46 rhadamanthine kernel: [  412.156598] thinkpad_acpi: EC reports
that Thermal Table has changed
Jun 21 23:39:46 rhadamanthine kernel: [  412.372093] ehci_hcd 0000:00:1a.0:
power state changed by ACPI to D0
Jun 21 23:39:46 rhadamanthine kernel: [  412.372098] ehci_hcd 0000:00:1a.0:
power state changed by ACPI to D0
Jun 21 23:39:46 rhadamanthine kernel: [  412.372349] ehci_hcd 0000:00:1d.0:
power state changed by ACPI to D0
Jun 21 23:39:46 rhadamanthine kernel: [  412.372352] ehci_hcd 0000:00:1d.0:
power state changed by ACPI to D0
Jun 21 23:39:46 rhadamanthine kernel: [  412.372789] sdhci-pci 0000:0d:00.0:
MMC controller base frequency changed to 50Mhz.
Jun 21 23:39:46 rhadamanthine kernel: [  412.373023] PM: noirq restore of
devices complete after 17.021 msecs
Jun 21 23:39:46 rhadamanthine kernel: [  412.373119] PM: early restore of
devices complete after 0.048 msecs
Jun 21 23:39:46 rhadamanthine kernel: [  412.426821] ehci_hcd 0000:00:1a.0:
setting latency timer to 64
Jun 21 23:39:46 rhadamanthine kernel: [  412.426825] e1000e 0000:00:19.0:
wake-up capability disabled by ACPI
Jun 21 23:39:46 rhadamanthine kernel: [  412.426841] usb usb1: root hub lost
power or was reset
Jun 21 23:39:46 rhadamanthine kernel: [  412.426867] [drm] nouveau
0000:01:00.0: We're back, enabling device...
Jun 21 23:39:46 rhadamanthine kernel: [  412.426872] ehci_hcd 0000:00:1d.0:
setting latency timer to 64
Jun 21 23:39:46 rhadamanthine kernel: [  412.426874] nouveau 0000:01:00.0:
power state changed by ACPI to D0
Jun 21 23:39:46 rhadamanthine kernel: [  412.426883] nouveau 0000:01:00.0:
power state changed by ACPI to D0
Jun 21 23:39:46 rhadamanthine kernel: [  412.426886] ahci 0000:00:1f.2: setting
latency timer to 64
Jun 21 23:39:46 rhadamanthine kernel: [  412.426892] usb usb4: root hub lost
power or was reset
Jun 21 23:39:46 rhadamanthine kernel: [  412.426917] [drm] nouveau
0000:01:00.0: POSTing device...
Jun 21 23:39:46 rhadamanthine kernel: [  412.426920] [drm] nouveau
0000:01:00.0: Parsing VBIOS init table 0 at offset 0xD44B
Jun 21 23:39:46 rhadamanthine kernel: [  412.426989] iwlwifi 0000:03:00.0:
RF_KILL bit toggled to enable radio.
Jun 21 23:39:46 rhadamanthine kernel: [  412.427046] usb usb2: root hub lost
power or was reset
Jun 21 23:39:46 rhadamanthine kernel: [  412.427048] usb usb3: root hub lost
power or was reset
Jun 21 23:39:46 rhadamanthine kernel: [  412.427151] snd_hda_intel
0000:00:1b.0: irq 50 for MSI/MSI-X
Jun 21 23:39:46 rhadamanthine kernel: [  412.427182] e1000e 0000:00:19.0: irq
52 for MSI/MSI-X
Jun 21 23:39:46 rhadamanthine kernel: [  412.427590] xhci_hcd 0000:0e:00.0: irq
42 for MSI/MSI-X
Jun 21 23:39:46 rhadamanthine kernel: [  412.427594] xhci_hcd 0000:0e:00.0: irq
43 for MSI/MSI-X
Jun 21 23:39:46 rhadamanthine kernel: [  412.427597] xhci_hcd 0000:0e:00.0: irq
44 for MSI/MSI-X
Jun 21 23:39:46 rhadamanthine kernel: [  412.427601] xhci_hcd 0000:0e:00.0: irq
45 for MSI/MSI-X
Jun 21 23:39:46 rhadamanthine kernel: [  412.427604] xhci_hcd 0000:0e:00.0: irq
46 for MSI/MSI-X
Jun 21 23:39:46 rhadamanthine kernel: [  412.427608] xhci_hcd 0000:0e:00.0: irq
47 for MSI/MSI-X
Jun 21 23:39:46 rhadamanthine kernel: [  412.427611] xhci_hcd 0000:0e:00.0: irq
48 for MSI/MSI-X
Jun 21 23:39:46 rhadamanthine kernel: [  412.427615] xhci_hcd 0000:0e:00.0: irq
49 for MSI/MSI-X
Jun 21 23:39:46 rhadamanthine kernel: [  412.430708] ehci_hcd 0000:00:1a.0:
cache line size of 64 is not supported
Jun 21 23:39:46 rhadamanthine kernel: [  412.430768] ehci_hcd 0000:00:1d.0:
cache line size of 64 is not supported
Jun 21 23:39:46 rhadamanthine kernel: [  412.457861] [drm] nouveau
0000:01:00.0: 0xD3EF: i2c wr fail: -6
Jun 21 23:39:46 rhadamanthine kernel: [  412.458853] [drm] nouveau
0000:01:00.0: 0xD401: i2c rd fail: -6
Jun 21 23:39:46 rhadamanthine kernel: [  412.463697] tpm_tis 00:0a: A TPM error
(6) occurred attempting to read a pcr value
Jun 21 23:39:46 rhadamanthine kernel: [  412.463700] tpm_tis 00:0a: TPM is
disabled/deactivated (0x6)
Jun 21 23:39:46 rhadamanthine kernel: [  412.479512] [drm] nouveau
0000:01:00.0: Parsing VBIOS init table 1 at offset 0xDB3F
Jun 21 23:39:46 rhadamanthine kernel: [  412.506426] [drm] nouveau
0000:01:00.0: Parsing VBIOS init table 2 at offset 0xEE5D
Jun 21 23:39:46 rhadamanthine kernel: [  412.506726] [drm] nouveau
0000:01:00.0: Parsing VBIOS init table 3 at offset 0xEE67
Jun 21 23:39:46 rhadamanthine kernel: [  412.507811] [drm] nouveau
0000:01:00.0: Parsing VBIOS init table 4 at offset 0xF03C
Jun 21 23:39:46 rhadamanthine kernel: [  412.507812] [drm] nouveau
0000:01:00.0: Parsing VBIOS init table at offset 0xF0A1
Jun 21 23:39:46 rhadamanthine kernel: [  412.743094] ata1: SATA link up 3.0
Gbps (SStatus 123 SControl 300)
Jun 21 23:39:46 rhadamanthine kernel: [  412.745124] ata1.00: ACPI cmd
ef/02:00:00:00:00:a0 (SET FEATURES) succeeded
Jun 21 23:39:46 rhadamanthine kernel: [  412.745127] ata1.00: ACPI cmd
f5/00:00:00:00:00:a0 (SECURITY FREEZE LOCK) filtered out
Jun 21 23:39:46 rhadamanthine kernel: [  412.745129] ata1.00: ACPI cmd
ef/10:03:00:00:00:a0 (SET FEATURES) filtered out
Jun 21 23:39:46 rhadamanthine kernel: [  412.749469] ata1.00: ACPI cmd
ef/02:00:00:00:00:a0 (SET FEATURES) succeeded
Jun 21 23:39:46 rhadamanthine kernel: [  412.749472] ata1.00: ACPI cmd
f5/00:00:00:00:00:a0 (SECURITY FREEZE LOCK) filtered out
Jun 21 23:39:46 rhadamanthine kernel: [  412.749474] ata1.00: ACPI cmd
ef/10:03:00:00:00:a0 (SET FEATURES) filtered out
Jun 21 23:39:46 rhadamanthine kernel: [  412.751077] ata3: SATA link up 3.0
Gbps (SStatus 123 SControl 300)
Jun 21 23:39:46 rhadamanthine kernel: [  412.751363] ata3.00: ACPI cmd
ef/02:00:00:00:00:a0 (SET FEATURES) succeeded
Jun 21 23:39:46 rhadamanthine kernel: [  412.751365] ata3.00: ACPI cmd
f5/00:00:00:00:00:a0 (SECURITY FREEZE LOCK) filtered out
Jun 21 23:39:46 rhadamanthine kernel: [  412.751367] ata3.00: ACPI cmd
ef/10:03:00:00:00:a0 (SET FEATURES) filtered out
Jun 21 23:39:46 rhadamanthine acpid: client connected from 3499[0:0]
Jun 21 23:39:46 rhadamanthine acpid: 1 client rule loaded
Jun 21 23:39:46 rhadamanthine kernel: [  412.751651] ata1.00: configured for
UDMA/133
Jun 21 23:39:46 rhadamanthine kernel: [  412.752015] ata3.00: ACPI cmd
ef/02:00:00:00:00:a0 (SET FEATURES) succeeded
Jun 21 23:39:46 rhadamanthine kernel: [  412.752018] ata3.00: ACPI cmd
f5/00:00:00:00:00:a0 (SECURITY FREEZE LOCK) filtered out
Jun 21 23:39:46 rhadamanthine kernel: [  412.752020] ata3.00: ACPI cmd
ef/10:03:00:00:00:a0 (SET FEATURES) filtered out
Jun 21 23:39:46 rhadamanthine kernel: [  412.752266] ata3.00: configured for
UDMA/133
Jun 21 23:39:46 rhadamanthine kernel: [  412.759060] ata4: SATA link down
(SStatus 0 SControl 300)
Jun 21 23:39:46 rhadamanthine kernel: [  412.767050] ata2: SATA link up 1.5
Gbps (SStatus 113 SControl 300)
Jun 21 23:39:46 rhadamanthine kernel: [  412.767085] sd 0:0:0:0: [sda] Starting
disk
Jun 21 23:39:46 rhadamanthine kernel: [  412.767106] sd 2:0:0:0: [sdb] Starting
disk
Jun 21 23:39:46 rhadamanthine kernel: [  412.769133] ata2.00: ACPI cmd
e3/00:1f:00:00:00:a0 (IDLE) succeeded
Jun 21 23:39:46 rhadamanthine kernel: [  412.769386] ata2.00: ACPI cmd
e3/00:02:00:00:00:a0 (IDLE) succeeded
Jun 21 23:39:46 rhadamanthine kernel: [  412.769388] ata2.00: ACPI cmd
ef/10:03:00:00:00:a0 (SET FEATURES) filtered out
Jun 21 23:39:46 rhadamanthine kernel: [  412.773303] ata2.00: ACPI cmd
e3/00:1f:00:00:00:a0 (IDLE) succeeded
Jun 21 23:39:46 rhadamanthine kernel: [  412.773494] ata2.00: ACPI cmd
e3/00:02:00:00:00:a0 (IDLE) succeeded
Jun 21 23:39:46 rhadamanthine kernel: [  412.773496] ata2.00: ACPI cmd
ef/10:03:00:00:00:a0 (SET FEATURES) filtered out
Jun 21 23:39:46 rhadamanthine kernel: [  412.775020] ata2.00: configured for
UDMA/66
Jun 21 23:39:46 rhadamanthine kernel: [  412.775037] ata5: SATA link down
(SStatus 0 SControl 300)
Jun 21 23:39:46 rhadamanthine kernel: [  412.775060] usb 4-1: reset high-speed
USB device number 2 using ehci_hcd
Jun 21 23:39:46 rhadamanthine kernel: [  412.978605] firewire_core
0000:0d:00.3: rediscovered device fw0
Jun 21 23:39:46 rhadamanthine kernel: [  413.018522] usb 1-1: reset high-speed
USB device number 2 using ehci_hcd
Jun 21 23:39:46 rhadamanthine kernel: [  413.617484] usb 1-1.1: reset low-speed
USB device number 3 using ehci_hcd
Jun 21 23:39:46 rhadamanthine kernel: [  413.968756] usb 1-1.3: reset
full-speed USB device number 4 using ehci_hcd
Jun 21 23:39:46 rhadamanthine kernel: [  414.132412] usb 1-1.6: reset
high-speed USB device number 6 using ehci_hcd
Jun 21 23:39:46 rhadamanthine kernel: [  414.296076] usb 1-1.4: reset
full-speed USB device number 5 using ehci_hcd
Jun 21 23:39:46 rhadamanthine kernel: [  414.389996] btusb 1-1.4:1.0: no
reset_resume for driver btusb?
Jun 21 23:39:46 rhadamanthine kernel: [  414.389998] btusb 1-1.4:1.1: no
reset_resume for driver btusb?
Jun 21 23:39:46 rhadamanthine kernel: [  414.494081] [drm] nouveau
0000:01:00.0: 0xF0A1: Condition still not met after 2000ms, skipping following
opcodes
Jun 21 23:39:46 rhadamanthine kernel: [  414.494507] [drm] nouveau
0000:01:00.0: Restoring GPU objects...
Jun 21 23:39:46 rhadamanthine kernel: [  414.548222] [drm] nouveau
0000:01:00.0: Reinitialising engines...
Jun 21 23:39:46 rhadamanthine kernel: [  414.548758] [drm] nouveau
0000:01:00.0: Restoring mode...
Jun 21 23:39:46 rhadamanthine kernel: [  416.556016] [drm] nouveau
0000:01:00.0: timeout: CURSOR_CTRL2_STATUS_ACTIVE(0)
Jun 21 23:39:46 rhadamanthine kernel: [  416.556079] [drm] nouveau
0000:01:00.0: CURSOR_CTRL2(0) = 0x00000000
Jun 21 23:39:46 rhadamanthine kernel: [  418.554130] iwlwifi 0000:03:00.0: L1
Enabled; Disabling L0S
Jun 21 23:39:46 rhadamanthine kernel: [  418.554327] iwlwifi 0000:03:00.0:
Radio type=0x0-0x3-0x1
Jun 21 23:39:46 rhadamanthine kernel: [  418.786626] smapi smapi:
set_real_thresh: set stop to 85 for bat=0
Jun 21 23:39:46 rhadamanthine kernel: [  418.898496] smapi smapi:
set_real_thresh: set stop to 0 for bat=1
Jun 21 23:39:46 rhadamanthine kernel: [  418.898539] hdaps: initial mode latch
is 0x05
Jun 21 23:39:46 rhadamanthine kernel: [  418.898723] hdaps: setting
ec_rate=250, filter_order=2
Jun 21 23:39:46 rhadamanthine kernel: [  418.898970] PM: restore of devices
complete after 6485.659 msecs
Jun 21 23:39:46 rhadamanthine kernel: [  418.899391] PM: Image restored
successfully.
Jun 21 23:39:46 rhadamanthine kernel: [  418.899393] Restarting tasks ... done.
Jun 21 23:39:46 rhadamanthine kernel: [  418.901683] PM: Basic memory bitmaps
freed
Jun 21 23:39:46 rhadamanthine kernel: [  418.901716] video LNXVIDEO:01:
Restoring backlight state
Jun 21 23:39:46 rhadamanthine bluetoothd[3131]: HCI dev 0 up
Jun 21 23:39:46 rhadamanthine bluetoothd[3131]: Proximity GATT Reporter Driver:
Operation not permitted (1)
Jun 21 23:39:46 rhadamanthine bluetoothd[3131]: sap-dummy interface
org.bluez.SimAccessTest init failed on path /org/bluez/test
Jun 21 23:39:46 rhadamanthine bluetoothd[3131]: Sap driver initialization
failed.
Jun 21 23:39:46 rhadamanthine bluetoothd[3131]: sap-server: Operation not
permitted (1)
Jun 21 23:39:46 rhadamanthine bluetoothd[3131]: input-headset driver probe
failed for device B0:D0:9C:59:47:F8
Jun 21 23:39:46 rhadamanthine bluetoothd[3131]: Unable to load keys to
adapter_ops: Function not implemented (38)
Jun 21 23:39:46 rhadamanthine bluetoothd[3131]: Adapter /org/bluez/3131/hci0
has been enabled
Jun 21 23:39:46 rhadamanthine anacron[5517]: Anacron 2.3 started on 2012-06-21
Jun 21 23:39:46 rhadamanthine anacron[5517]: Normal exit (0 jobs run)
Jun 21 23:39:48 rhadamanthine anacron[5600]: Anacron 2.3 started on 2012-06-21
Jun 21 23:39:48 rhadamanthine anacron[5600]: Normal exit (0 jobs run)
Jun 21 23:39:48 rhadamanthine x-session-manager[4030]: Gdk-WARNING:
x-session-manager: Fatal IO error 11 (Resource temporarily unavailable) on X
server :0.#012
Jun 21 23:39:48 rhadamanthine acpid: client 3499[0:0] has disconnected
Jun 21 23:39:48 rhadamanthine acpid: client connected from 5711[0:0]
Jun 21 23:39:48 rhadamanthine acpid: 1 client rule loaded
Jun 21 23:39:49 rhadamanthine NetworkManager[3198]: <info> (wlan0): device
state change: activated -> disconnected (reason 'connection-removed') [100 30
38]
Jun 21 23:39:49 rhadamanthine NetworkManager[3198]: <info> (wlan0):
deactivating device (reason 'connection-removed') [38]
Jun 21 23:39:50 rhadamanthine NetworkManager[3198]: <info> (wlan0): canceled
DHCP transaction, DHCP client pid 4271
Jun 21 23:39:50 rhadamanthine kernel: [  422.183639] wlan0: deauthenticating
from 00:22:75:d2:35:a0 by local choice (reason=3)
Jun 21 23:39:51 rhadamanthine avahi-daemon[3153]: Withdrawing address record
for 192.168.2.2 on wlan0.
Jun 21 23:39:51 rhadamanthine wpa_supplicant[3521]: wlan0:
CTRL-EVENT-DISCONNECTED bssid=00:00:00:00:00:00 reason=3
Jun 21 23:39:51 rhadamanthine avahi-daemon[3153]: Leaving mDNS multicast group
on interface wlan0.IPv4 with address 192.168.2.2.
Jun 21 23:39:51 rhadamanthine avahi-daemon[3153]: Interface wlan0.IPv4 no
longer relevant for mDNS.
Jun 21 23:39:51 rhadamanthine kernel: [  424.091135] cfg80211: Calling CRDA to
update world regulatory domain
Jun 21 23:39:51 rhadamanthine dbus[2988]: [system] Activating service
name='org.freedesktop.nm_dispatcher' (using servicehelper)
Jun 21 23:39:51 rhadamanthine NetworkManager[3198]: <info> (wlan0): supplicant
interface state: completed -> disconnected
Jun 21 23:39:51 rhadamanthine kernel: [  424.099331] cfg80211: World regulatory
domain updated:
Jun 21 23:39:51 rhadamanthine kernel: [  424.099340] cfg80211:   (start_freq -
end_freq @ bandwidth), (max_antenna_gain, max_eirp)
Jun 21 23:39:51 rhadamanthine kernel: [  424.099348] cfg80211:   (2402000 KHz -
2472000 KHz @ 40000 KHz), (300 mBi, 2000 mBm)
Jun 21 23:39:51 rhadamanthine kernel: [  424.099355] cfg80211:   (2457000 KHz -
2482000 KHz @ 20000 KHz), (300 mBi, 2000 mBm)
Jun 21 23:39:51 rhadamanthine kernel: [  424.099362] cfg80211:   (2474000 KHz -
2494000 KHz @ 20000 KHz), (300 mBi, 2000 mBm)
Jun 21 23:39:51 rhadamanthine kernel: [  424.099368] cfg80211:   (5170000 KHz -
5250000 KHz @ 40000 KHz), (300 mBi, 2000 mBm)
Jun 21 23:39:51 rhadamanthine kernel: [  424.099374] cfg80211:   (5735000 KHz -
5835000 KHz @ 40000 KHz), (300 mBi, 2000 mBm)
Jun 21 23:39:51 rhadamanthine acpid: client 5711[0:0] has disconnected
Jun 21 23:39:51 rhadamanthine acpid: client connected from 5722[0:0]
Jun 21 23:39:51 rhadamanthine acpid: 1 client rule loaded
Jun 21 23:39:51 rhadamanthine dbus[2988]: [system] Successfully activated
service 'org.freedesktop.nm_dispatcher'
Jun 21 23:39:55 rhadamanthine acpid: client 5722[0:0] has disconnected
Jun 21 23:39:55 rhadamanthine acpid: client connected from 5738[0:0]
Jun 21 23:39:55 rhadamanthine acpid: 1 client rule loaded
Jun 21 23:39:58 rhadamanthine acpid: client 5738[0:0] has disconnected
Jun 21 23:39:58 rhadamanthine acpid: client connected from 5743[0:0]
Jun 21 23:39:58 rhadamanthine acpid: 1 client rule loaded
Jun 21 23:40:01 rhadamanthine acpid: client 5743[0:0] has disconnected
Jun 21 23:40:01 rhadamanthine acpid: client connected from 5747[0:0]
Jun 21 23:40:01 rhadamanthine acpid: 1 client rule loaded
Jun 21 23:40:04 rhadamanthine acpid: client 5747[0:0] has disconnected
Jun 21 23:40:04 rhadamanthine acpid: client connected from 5751[0:0]
Jun 21 23:40:04 rhadamanthine acpid: 1 client rule loaded
Jun 21 23:40:07 rhadamanthine acpid: client 5751[0:0] has disconnected
Jun 21 23:40:07 rhadamanthine acpid: client connected from 5756[0:0]
Jun 21 23:40:07 rhadamanthine acpid: 1 client rule loaded
Jun 21 23:40:11 rhadamanthine acpid: client 5756[0:0] has disconnected
Jun 21 23:40:11 rhadamanthine acpid: client connected from 5760[0:0]
Jun 21 23:40:11 rhadamanthine acpid: 1 client rule loaded
Jun 21 23:40:14 rhadamanthine acpid: client 5760[0:0] has disconnected
Jun 21 23:40:14 rhadamanthine acpid: client connected from 5764[0:0]
Jun 21 23:40:14 rhadamanthine acpid: 1 client rule loaded
Jun 21 23:40:21 rhadamanthine kernel: [  453.572487] ------------[ cut here
]------------
Jun 21 23:40:21 rhadamanthine kernel: [  453.572549] WARNING: at
/media/data/mattems/src/linux-2.6-3.4.1/debian/build/source_amd64_none/drivers/gpu/drm/nouveau/nv50_display.c:437
nv50_crtc_mode_set_base+0x18/0x5a [nouveau]()
Jun 21 23:40:21 rhadamanthine kernel: [  453.572557] Hardware name: 4260A14
Jun 21 23:40:21 rhadamanthine kernel: [  453.572561] Modules linked in:
appletalk ipx p8023 rose netrom ax25 ip6table_filter ip6_tables iptable_filter
ip_tables ebtable_nat ebtables x_tables parport_pc ppdev lp parport rfcomm bnep
cpufreq_userspace cpufreq_conservative cpufreq_powersave cpufreq_stats
binfmt_misc ib_iser rdma_cm ib_addr iw_cm ib_cm ib_sa ib_mad ib_core iscsi_tcp
libiscsi_tcp libiscsi scsi_transport_iscsi fuse nfsd nfs nfs_acl auth_rpcgss
fscache lockd sunrpc ext3 jbd hdaps(O) tp_smapi(O) thinkpad_ec(O) uinput loop
firewire_sbp2 kvm_intel kvm snd_hda_codec_hdmi uvcvideo videobuf2_vmalloc
videobuf2_memops videobuf2_core videodev media btusb bluetooth joydev usbhid
hid snd_hda_codec_conexant arc4 snd_hda_intel snd_hda_codec snd_hwdep coretemp
snd_seq_midi iwlwifi snd_pcm_oss snd_seq_midi_event crc32c_intel snd_mixer_oss
nouveau snd_rawmidi ghash_clmulni_intel aesni_intel snd_seq snd_pcm aes_x86_64
sr_mod aes_generic cdrom mac80211 cryptd snd_seq_device mxm_wmi snd_page_alloc
ttm cfg80211 drm_kms_helper drm
Jun 21 23:40:21 rhadamanthine kernel: thinkpad_acpi xhci_hcd sdhci_pci
snd_timer e1000e sdhci psmouse nvram i2c_i801 i2c_algo_bit mmc_core ehci_hcd
firewire_ohci rfkill microcode pcspkr serio_raw ac firewire_core usbcore
i2c_core evdev snd iTCO_wdt crc_itu_t iTCO_vendor_support acpi_cpufreq wmi
usb_common soundcore mperf battery power_supply tpm_tis tpm tpm_bios video
processor button ext4 crc16 jbd2 mbcache dm_mod sd_mod crc_t10dif ahci libahci
libata scsi_mod thermal thermal_sys
Jun 21 23:40:21 rhadamanthine kernel: [  453.572774] Pid: 5764, comm: Xorg
Tainted: G           O 3.4-trunk-amd64 #1
Jun 21 23:40:21 rhadamanthine kernel: [  453.572779] Call Trace:
Jun 21 23:40:21 rhadamanthine kernel: [  453.572793]  [<ffffffff81039697>] ?
warn_slowpath_common+0x78/0x8c
Jun 21 23:40:21 rhadamanthine kernel: [  453.572828]  [<ffffffffa04a587c>] ?
nv50_crtc_mode_set_base+0x18/0x5a [nouveau]
Jun 21 23:40:21 rhadamanthine kernel: [  453.572845]  [<ffffffffa010d20b>] ?
drm_crtc_helper_set_config+0x7b9/0x932 [drm_kms_helper]
Jun 21 23:40:21 rhadamanthine kernel: [  453.572875]  [<ffffffffa031a22d>] ?
drm_mode_setcrtc+0x400/0x43d [drm]
Jun 21 23:40:21 rhadamanthine kernel: [  453.572886]  [<ffffffff810fa265>] ?
mem_cgroup_update_page_stat+0x15/0x48
Jun 21 23:40:21 rhadamanthine kernel: [  453.572913]  [<ffffffffa030e5bc>] ?
drm_ioctl+0x2a2/0x377 [drm]
Jun 21 23:40:21 rhadamanthine kernel: [  453.572935]  [<ffffffffa0319e2d>] ?
drm_mode_setplane+0x2e6/0x2e6 [drm]
Jun 21 23:40:21 rhadamanthine kernel: [  453.572946]  [<ffffffff8110b542>] ?
do_vfs_ioctl+0x45a/0x49b
Jun 21 23:40:21 rhadamanthine kernel: [  453.572954]  [<ffffffff8110b5ce>] ?
sys_ioctl+0x4b/0x71
Jun 21 23:40:21 rhadamanthine kernel: [  453.572964]  [<ffffffff8135e779>] ?
system_call_fastpath+0x16/0x1b
Jun 21 23:40:21 rhadamanthine kernel: [  453.572970] ---[ end trace
ee1ca0c052ee7037 ]---
Jun 21 23:40:23 rhadamanthine acpid: client 5764[0:0] has disconnected
Jun 21 23:40:23 rhadamanthine acpid: client connected from 5770[0:0]
Jun 21 23:40:23 rhadamanthine acpid: 1 client rule loaded
Jun 21 23:40:30 rhadamanthine kernel: [  463.022992] ------------[ cut here
]------------
Jun 21 23:40:30 rhadamanthine kernel: [  463.023075] WARNING: at
/media/data/mattems/src/linux-2.6-3.4.1/debian/build/source_amd64_none/drivers/gpu/drm/nouveau/nv50_display.c:437
nv50_crtc_mode_set_base+0x18/0x5a [nouveau]()
Jun 21 23:40:30 rhadamanthine kernel: [  463.023086] Hardware name: 4260A14
Jun 21 23:40:30 rhadamanthine kernel: [  463.023091] Modules linked in:
appletalk ipx p8023 rose netrom ax25 ip6table_filter ip6_tables iptable_filter
ip_tables ebtable_nat ebtables x_tables parport_pc ppdev lp parport rfcomm bnep
cpufreq_userspace cpufreq_conservative cpufreq_powersave cpufreq_stats
binfmt_misc ib_iser rdma_cm ib_addr iw_cm ib_cm ib_sa ib_mad ib_core iscsi_tcp
libiscsi_tcp libiscsi scsi_transport_iscsi fuse nfsd nfs nfs_acl auth_rpcgss
fscache lockd sunrpc ext3 jbd hdaps(O) tp_smapi(O) thinkpad_ec(O) uinput loop
firewire_sbp2 kvm_intel kvm snd_hda_codec_hdmi uvcvideo videobuf2_vmalloc
videobuf2_memops videobuf2_core videodev media btusb bluetooth joydev usbhid
hid snd_hda_codec_conexant arc4 snd_hda_intel snd_hda_codec snd_hwdep coretemp
snd_seq_midi iwlwifi snd_pcm_oss snd_seq_midi_event crc32c_intel snd_mixer_oss
nouveau snd_rawmidi ghash_clmulni_intel aesni_intel snd_seq snd_pcm aes_x86_64
sr_mod aes_generic cdrom mac80211 cryptd snd_seq_device mxm_wmi snd_page_alloc
ttm cfg80211 drm_kms_helper drm
Jun 21 23:40:30 rhadamanthine kernel: thinkpad_acpi xhci_hcd sdhci_pci
snd_timer e1000e sdhci psmouse nvram i2c_i801 i2c_algo_bit mmc_core ehci_hcd
firewire_ohci rfkill microcode pcspkr serio_raw ac firewire_core usbcore
i2c_core evdev snd iTCO_wdt crc_itu_t iTCO_vendor_support acpi_cpufreq wmi
usb_common soundcore mperf battery power_supply tpm_tis tpm tpm_bios video
processor button ext4 crc16 jbd2 mbcache dm_mod sd_mod crc_t10dif ahci libahci
libata scsi_mod thermal thermal_sys
Jun 21 23:40:30 rhadamanthine kernel: [  463.023327] Pid: 5770, comm: Xorg
Tainted: G        W  O 3.4-trunk-amd64 #1
Jun 21 23:40:30 rhadamanthine kernel: [  463.023332] Call Trace:
Jun 21 23:40:30 rhadamanthine kernel: [  463.023346]  [<ffffffff81039697>] ?
warn_slowpath_common+0x78/0x8c
Jun 21 23:40:30 rhadamanthine kernel: [  463.023382]  [<ffffffffa04a587c>] ?
nv50_crtc_mode_set_base+0x18/0x5a [nouveau]
Jun 21 23:40:30 rhadamanthine kernel: [  463.023400]  [<ffffffffa010d20b>] ?
drm_crtc_helper_set_config+0x7b9/0x932 [drm_kms_helper]
Jun 21 23:40:30 rhadamanthine kernel: [  463.023430]  [<ffffffffa031a22d>] ?
drm_mode_setcrtc+0x400/0x43d [drm]
Jun 21 23:40:30 rhadamanthine kernel: [  463.023441]  [<ffffffff810fa265>] ?
mem_cgroup_update_page_stat+0x15/0x48
Jun 21 23:40:30 rhadamanthine kernel: [  463.023468]  [<ffffffffa030e5bc>] ?
drm_ioctl+0x2a2/0x377 [drm]
Jun 21 23:40:30 rhadamanthine kernel: [  463.023489]  [<ffffffffa0319e2d>] ?
drm_mode_setplane+0x2e6/0x2e6 [drm]
Jun 21 23:40:30 rhadamanthine kernel: [  463.023500]  [<ffffffff8110b542>] ?
do_vfs_ioctl+0x45a/0x49b
Jun 21 23:40:30 rhadamanthine kernel: [  463.023508]  [<ffffffff8110b5ce>] ?
sys_ioctl+0x4b/0x71
Jun 21 23:40:30 rhadamanthine kernel: [  463.023518]  [<ffffffff8135e779>] ?
system_call_fastpath+0x16/0x1b
Jun 21 23:40:30 rhadamanthine kernel: [  463.023524] ---[ end trace
ee1ca0c052ee7038 ]---
Jun 21 23:40:30 rhadamanthine shutdown[5786]: shutting down for system halt
Jun 21 23:40:31 rhadamanthine init: Switching to runlevel: 0
Jun 21 23:40:32 rhadamanthine watchdog[3572]: stopping daemon (5.12)
Jun 21 23:40:33 rhadamanthine acpid: client 5770[0:0] has disconnected
Jun 21 23:40:33 rhadamanthine acpid: client connected from 5806[0:0]
Jun 21 23:40:33 rhadamanthine acpid: 1 client rule loaded
Jun 21 23:40:34 rhadamanthine shutdown[5821]: shutting down for system halt
Jun 21 23:40:38 rhadamanthine wd_keepalive[5846]: starting watchdog keepalive
daemon (5.12):
Jun 21 23:40:38 rhadamanthine wd_keepalive[5846]:  no watchdog device
configured, aborting
Jun 21 23:40:38 rhadamanthine wd_keepalive[5846]: stopping watchdog keepalive
daemon (5.12)
Jun 21 23:40:38 rhadamanthine minissdpd[3556]: received signal 15, good-bye
Jun 21 23:40:38 rhadamanthine bluetoothd[3131]: Terminating
Jun 21 23:40:38 rhadamanthine kernel: [  470.109236] Bridge firewalling
registered
Jun 21 23:40:38 rhadamanthine NetworkManager[3198]: <info> caught signal 15,
shutting down normally.
Jun 21 23:40:38 rhadamanthine NetworkManager[3198]: <warn> quit request
received, terminating...
Jun 21 23:40:38 rhadamanthine NetworkManager[3198]: <info> (eth0): now
unmanaged
Jun 21 23:40:38 rhadamanthine NetworkManager[3198]: <info> (eth0): device state
change: unavailable -> unmanaged (reason 'removed') [20 10 36]
Jun 21 23:40:38 rhadamanthine NetworkManager[3198]: <info> (eth0): cleaning
up...
Jun 21 23:40:38 rhadamanthine NetworkManager[3198]: <info> (eth0): taking down
device.
Jun 21 23:40:38 rhadamanthine iscsid: iscsid shutting down.
Jun 21 23:40:40 rhadamanthine shutdown[6259]: shutting down for system halt
Jun 21 23:40:40 rhadamanthine kernel: [  472.517735] ------------[ cut here
]------------
Jun 21 23:40:40 rhadamanthine kernel: [  472.517756] WARNING: at
/media/data/mattems/src/linux-2.6-3.4.1/debian/build/source_amd64_none/drivers/gpu/drm/nouveau/nv50_display.c:437
nv50_crtc_mode_set_base+0x18/0x5a [nouveau]()
Jun 21 23:40:40 rhadamanthine kernel: [  472.517758] Hardware name: 4260A14
Jun 21 23:40:40 rhadamanthine kernel: [  472.517759] Modules linked in:
ebtable_broute bridge stp ebtable_filter appletalk ipx p8023 rose netrom ax25
ip6table_filter ip6_tables iptable_filter ip_tables ebtable_nat ebtables
x_tables parport_pc ppdev lp parport rfcomm bnep cpufreq_userspace
cpufreq_conservative cpufreq_powersave cpufreq_stats binfmt_misc ib_iser
rdma_cm ib_addr iw_cm ib_cm ib_sa ib_mad ib_core iscsi_tcp libiscsi_tcp
libiscsi scsi_transport_iscsi fuse nfsd nfs nfs_acl auth_rpcgss fscache lockd
sunrpc ext3 jbd hdaps(O) tp_smapi(O) thinkpad_ec(O) uinput loop firewire_sbp2
kvm_intel kvm snd_hda_codec_hdmi uvcvideo videobuf2_vmalloc videobuf2_memops
videobuf2_core videodev media btusb bluetooth joydev usbhid hid
snd_hda_codec_conexant arc4 snd_hda_intel snd_hda_codec snd_hwdep coretemp
snd_seq_midi iwlwifi snd_pcm_oss snd_seq_midi_event crc32c_intel snd_mixer_oss
nouveau snd_rawmidi ghash_clmulni_intel aesni_intel snd_seq snd_pcm aes_x86_64
sr_mod aes_generic cdrom mac80211 cryptd snd_seq_device mxm_wmi snd_p
Jun 21 23:40:40 rhadamanthine kernel: age_alloc ttm cfg80211 drm_kms_helper drm
thinkpad_acpi xhci_hcd sdhci_pci snd_timer e1000e sdhci psmouse nvram i2c_i801
i2c_algo_bit mmc_core ehci_hcd firewire_ohci rfkill microcode pcspkr serio_raw
ac firewire_core usbcore i2c_core evdev snd iTCO_wdt crc_itu_t
iTCO_vendor_support acpi_cpufreq wmi usb_common soundcore mperf battery
power_supply tpm_tis tpm tpm_bios video processor button ext4 crc16 jbd2
mbcache dm_mod sd_mod crc_t10dif ahci libahci libata scsi_mod thermal
thermal_sys
Jun 21 23:40:40 rhadamanthine kernel: [  472.517820] Pid: 5806, comm: Xorg
Tainted: G        W  O 3.4-trunk-amd64 #1
Jun 21 23:40:40 rhadamanthine kernel: [  472.517821] Call Trace:
Jun 21 23:40:40 rhadamanthine kernel: [  472.517826]  [<ffffffff81039697>] ?
warn_slowpath_common+0x78/0x8c
Jun 21 23:40:40 rhadamanthine kernel: [  472.517835]  [<ffffffffa04a587c>] ?
nv50_crtc_mode_set_base+0x18/0x5a [nouveau]
Jun 21 23:40:40 rhadamanthine kernel: [  472.517839]  [<ffffffffa010d20b>] ?
drm_crtc_helper_set_config+0x7b9/0x932 [drm_kms_helper]
Jun 21 23:40:40 rhadamanthine kernel: [  472.517847]  [<ffffffffa031a22d>] ?
drm_mode_setcrtc+0x400/0x43d [drm]
Jun 21 23:40:40 rhadamanthine kernel: [  472.517851]  [<ffffffff810fa265>] ?
mem_cgroup_update_page_stat+0x15/0x48
Jun 21 23:40:40 rhadamanthine kernel: [  472.517857]  [<ffffffffa030e5bc>] ?
drm_ioctl+0x2a2/0x377 [drm]
Jun 21 23:40:40 rhadamanthine kernel: [  472.517863]  [<ffffffffa0319e2d>] ?
drm_mode_setplane+0x2e6/0x2e6 [drm]
Jun 21 23:40:40 rhadamanthine kernel: [  472.517865]  [<ffffffff8110b542>] ?
do_vfs_ioctl+0x45a/0x49b
Jun 21 23:40:40 rhadamanthine kernel: [  472.517867]  [<ffffffff8110b5ce>] ?
sys_ioctl+0x4b/0x71
Jun 21 23:40:40 rhadamanthine kernel: [  472.517870]  [<ffffffff8135e779>] ?
system_call_fastpath+0x16/0x1b
Jun 21 23:40:40 rhadamanthine kernel: [  472.517872] ---[ end trace
ee1ca0c052ee7039 ]---
Jun 21 23:40:42 rhadamanthine kernel: [  474.554755] fuse exit
Jun 21 23:40:42 rhadamanthine bluetoothd[3131]: Stopping hci0 event socket
Jun 21 23:40:42 rhadamanthine bluetoothd[3131]: Stopping SDP server
Jun 21 23:40:42 rhadamanthine bluetoothd[3131]: Exit
Jun 21 23:40:42 rhadamanthine NetworkManager[3198]: <info> (wlan0): now
unmanaged
Jun 21 23:40:42 rhadamanthine NetworkManager[3198]: <info> (wlan0): device
state change: disconnected -> unmanaged (reason 'removed') [30 10 36]
Jun 21 23:40:42 rhadamanthine NetworkManager[3198]: <info> (wlan0): cleaning
up...
Jun 21 23:40:42 rhadamanthine NetworkManager[3198]: <info> (wlan0): taking down
device.
Jun 21 23:40:42 rhadamanthine kernel: [  474.634860] Ebtables v2.0 unregistered
Jun 21 23:40:42 rhadamanthine avahi-daemon[3153]: Interface wlan0.IPv6 no
longer relevant for mDNS.
Jun 21 23:40:42 rhadamanthine avahi-daemon[3153]: Leaving mDNS multicast group
on interface wlan0.IPv6 with address fe80::224:d7ff:fec7:6af4.
Jun 21 23:40:42 rhadamanthine avahi-daemon[3153]: Withdrawing address record
for fe80::224:d7ff:fec7:6af4 on wlan0.
Jun 21 23:40:42 rhadamanthine NetworkManager[3198]: <info> exiting (success)
Jun 21 23:40:42 rhadamanthine avahi-daemon[3153]: Got SIGTERM, quitting.
Jun 21 23:40:42 rhadamanthine avahi-daemon[3153]: avahi-daemon 0.6.31 exiting.
Jun 21 23:40:43 rhadamanthine acpid: exiting
Jun 21 23:40:43 rhadamanthine modem-manager[3309]: <info>  Caught signal 15,
shutting down...

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
