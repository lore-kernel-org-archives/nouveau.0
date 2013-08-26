From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 68572] shutdown threshold temperature sometimes
 isn't restored properly after hibernate
Date: Mon, 26 Aug 2013 22:16:55 +0000
Message-ID: <bug-68572-8800-y7QGGAN264@http.bugs.freedesktop.org/>
References: <bug-68572-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0319756499=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-68572-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0319756499==
Content-Type: multipart/alternative; boundary="1377555415.Aa131.27152"; charset="us-ascii"


--1377555415.Aa131.27152
Date: Mon, 26 Aug 2013 22:16:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=68572

--- Comment #2 from Mr-4 <mr.dash.four-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> ---
(In reply to comment #1)
> What hardware do you have
NVidia 7800GS

> Full kernel log
I can't provide you with "full kernel log" as I was coming out of restore after
hibernate, but can provide you with this:
Aug 26 13:00:05 test1 kernel: PM: Syncing filesystems ... done.
Aug 26 13:00:05 test1 kernel: Freezing user space processes ... (elapsed 0.01
seconds) done.
Aug 26 13:00:05 test1 kernel: PM: Preallocating image memory... done (allocated
194506 pages)
Aug 26 13:00:05 test1 kernel: PM: Allocated 778024 kbytes in 0.10 seconds
(7780.24 MB/s)
Aug 26 13:00:05 test1 kernel: Freezing remaining freezable tasks ... (elapsed
5.31 seconds) done.
Aug 26 13:00:05 test1 kernel: Suspending console(s) (use no_console_suspend to
debug)
Aug 26 13:00:05 test1 kernel: i8042 kbd 00:09: System wakeup enabled by ACPI
Aug 26 13:00:05 test1 kernel: mpu401 00:04: disabled
Aug 26 13:00:05 test1 kernel: nouveau  [     DRM] suspending fbcon...
Aug 26 13:00:05 test1 kernel: nouveau  [     DRM] suspending display...
Aug 26 13:00:05 test1 kernel: nouveau  [     DRM] unpinning framebuffer(s)...
Aug 26 13:00:05 test1 kernel: nouveau  [     DRM] evicting buffers...
Aug 26 13:00:05 test1 kernel: pci 0000:00:13.1: System wakeup enabled by ACPI
Aug 26 13:00:05 test1 kernel: nouveau  [     DRM] suspending client object
trees...
Aug 26 13:00:05 test1 kernel: PM: freeze of devices complete after 313.451
msecs
Aug 26 13:00:05 test1 kernel: PM: late freeze of devices complete after 0.402
msecs
Aug 26 13:00:05 test1 kernel: PM: noirq freeze of devices complete after 0.542
msecs
Aug 26 13:00:05 test1 kernel: ACPI: Preparing to enter system sleep state S4
Aug 26 13:00:05 test1 kernel: PM: Saving platform NVS memory
Aug 26 13:00:05 test1 kernel: Disabling non-boot CPUs ...
Aug 26 13:00:05 test1 kernel: smpboot: CPU 1 is now offline
Aug 26 13:00:05 test1 kernel: PM: Creating hibernation image:
Aug 26 13:00:05 test1 kernel: PM: Need to copy 194329 pages
Aug 26 13:00:05 test1 kernel: PM: Restoring platform NVS memory
Aug 26 13:00:05 test1 kernel: Enabling non-boot CPUs ...
Aug 26 13:00:05 test1 kernel: smpboot: Booting Node 0 Processor 1 APIC 0x1
Aug 26 13:00:05 test1 kernel: CPU1 is up
Aug 26 13:00:05 test1 kernel: ACPI: Waking up from system sleep state S4
Aug 26 13:00:05 test1 kernel: PM: noirq restore of devices complete after
33.248 msecs
Aug 26 13:00:05 test1 kernel: PM: early restore of devices complete after 0.127
msecs
Aug 26 13:00:05 test1 kernel: usb usb2: root hub lost power or was reset
Aug 26 13:00:05 test1 kernel: usb usb3: root hub lost power or was reset
Aug 26 13:00:05 test1 kernel: usb usb4: root hub lost power or was reset
Aug 26 13:00:05 test1 kernel: usb usb5: root hub lost power or was reset
Aug 26 13:00:05 test1 kernel: usb usb1: root hub lost power or was reset
Aug 26 13:00:05 test1 kernel: nouveau  [     DRM] re-enabling device...
Aug 26 13:00:05 test1 kernel: nouveau  [     DRM] resuming client object
trees...
Aug 26 13:00:05 test1 kernel: nouveau  [   VBIOS][0000:01:00.0] running init
tables
Aug 26 13:00:05 test1 kernel: pci 0000:00:13.1: System wakeup disabled by ACPI
Aug 26 13:00:05 test1 kernel: mpu401 00:04: activated
Aug 26 13:00:05 test1 kernel: i8042 kbd 00:09: System wakeup disabled by ACPI
Aug 26 13:00:05 test1 kernel: nouveau  [  PTHERM][0000:01:00.0] fan management:
automatic
Aug 26 13:00:05 test1 kernel: nouveau  [  PTHERM][0000:01:00.0] programmed
thresholds [ 90(3), 95(3), 115(2), 135(5) ]
Aug 26 13:00:05 test1 kernel: agpgart-via 0000:00:00.0: AGP 3.5 bridge
Aug 26 13:00:05 test1 kernel: agpgart: kworker/u:0 tried to set rate=x12.
Setting to AGP3 x8 mode.
Aug 26 13:00:05 test1 kernel: agpgart-via 0000:00:00.0: putting AGP V3 device
into 8x mode
Aug 26 12:00:05 test1 rtkit-daemon[2090]: The canary thread is apparently
starving. Taking action.
Aug 26 12:00:05 test1 rtkit-daemon[2090]: Demoting known real-time threads.
Aug 26 13:00:05 test1 kernel: nouveau 0000:01:00.0: putting AGP V3 device into
8x mode
Aug 26 13:00:05 test1 kernel: nouveau  [     DRM] resuming display...
Aug 26 13:00:05 test1 kernel: nouveau  [     DRM] 0xD3FB: Parsing digital
output script table
Aug 26 13:00:05 test1 kernel: nouveau  [     DRM] Setting dpms mode 3 on TV
encoder (output 3)
Aug 26 13:00:05 test1 kernel: nouveau  [     DRM] 0xD3FB: Parsing digital
output script table
Aug 26 13:00:05 test1 kernel: ata4.00: ACPI cmd ef/03:42:00:00:00:a0 (SET
FEATURES) filtered out
Aug 26 13:00:05 test1 kernel: ata3.00: ACPI cmd ef/03:45:00:00:00:a0 (SET
FEATURES) filtered out
Aug 26 13:00:05 test1 kernel: ata3.00: ACPI cmd ef/03:01:00:00:00:a0 (SET
FEATURES) filtered out
Aug 26 13:00:05 test1 kernel: ata4.00: configured for UDMA/33
Aug 26 13:00:05 test1 kernel: ata3.00: configured for UDMA/100
Aug 26 13:00:05 test1 kernel: sd 2:0:0:0: [sda] Starting disk
Aug 26 13:00:05 test1 kernel: usb 1-2: reset high-speed USB device number 8
using ehci-pci
Aug 26 13:00:05 test1 kernel: usb 1-2.3: reset low-speed USB device number 9
using ehci-pci
Aug 26 13:00:05 test1 kernel: PM: restore of devices complete after 1157.251
msecs
Aug 26 12:00:05 test1 rtkit-daemon[2090]: Successfully demoted thread 2287 of
process 2267 (/usr/bin/pulseaudio).
Aug 26 12:00:05 test1 rtkit-daemon[2090]: Successfully demoted thread 2285 of
process 2267 (/usr/bin/pulseaudio).
Aug 26 12:00:05 test1 rtkit-daemon[2090]: Successfully demoted thread 2267 of
process 2267 (/usr/bin/pulseaudio).
Aug 26 12:00:05 test1 rtkit-daemon[2090]: Demoted 3 threads.
Aug 26 13:00:05 test1 kernel: Restarting tasks ... done.

After which comes the log I included in the initial report.

> VBIOS might make sense here too
Here goes the start up log:

Aug 26 13:06:08 test1 kernel: [drm] Initialized drm 1.1.0 20060810
Aug 26 13:06:08 test1 kernel: nouveau  [  DEVICE][0000:01:00.0] BOOT0  :
0x049200a2
Aug 26 13:06:08 test1 kernel: nouveau  [  DEVICE][0000:01:00.0] Chipset: G71
(NV49)
Aug 26 13:06:08 test1 kernel: nouveau  [  DEVICE][0000:01:00.0] Family : NV40
Aug 26 13:06:08 test1 kernel: nouveau  [   VBIOS][0000:01:00.0] checking PRAMIN
for image...
Aug 26 13:06:08 test1 kernel: nouveau  [   VBIOS][0000:01:00.0] ... checksum
invalid
Aug 26 13:06:08 test1 kernel: nouveau  [   VBIOS][0000:01:00.0] checking PROM
for image...
Aug 26 13:06:08 test1 kernel: nouveau  [   VBIOS][0000:01:00.0] ... appears to
be valid
Aug 26 13:06:08 test1 kernel: nouveau  [   VBIOS][0000:01:00.0] using image
from PROM
Aug 26 13:06:08 test1 kernel: nouveau  [   VBIOS][0000:01:00.0] BIT signature
found
Aug 26 13:06:08 test1 kernel: nouveau  [   VBIOS][0000:01:00.0] version
05.71.22.21.0a
Aug 26 13:06:08 test1 kernel: nouveau  [     PFB][0000:01:00.0] RAM type: GDDR3
Aug 26 13:06:08 test1 kernel: nouveau  [     PFB][0000:01:00.0] RAM size: 256
MiB
Aug 26 13:06:08 test1 kernel: nouveau  [     PFB][0000:01:00.0]    ZCOMP:
294912 tags
Aug 26 13:06:08 test1 kernel: nouveau  [  PTHERM][0000:01:00.0] FAN control:
PWM
Aug 26 13:06:08 test1 kernel: nouveau  [  PTHERM][0000:01:00.0] fan management:
disabled
Aug 26 13:06:08 test1 kernel: nouveau  [  PTHERM][0000:01:00.0] internal
sensor: yes
Aug 26 13:06:08 test1 kernel: nouveau  [  PTHERM][0000:01:00.0] programmed
thresholds [ 90(3), 95(3), 115(2), 135(5) ]
Aug 26 13:06:08 test1 kernel: agpgart-via 0000:00:00.0: AGP 3.5 bridge
Aug 26 13:06:08 test1 kernel: agpgart: modprobe tried to set rate=x12. Setting
to AGP3 x8 mode.
Aug 26 13:06:08 test1 kernel: agpgart-via 0000:00:00.0: putting AGP V3 device
into 8x mode
Aug 26 13:06:08 test1 kernel: nouveau 0000:01:00.0: putting AGP V3 device into
8x mode
Aug 26 13:06:08 test1 kernel: [TTM] Zone  kernel: Available graphics memory:
1026348 kiB
Aug 26 13:06:08 test1 kernel: [TTM] Initializing pool allocator
Aug 26 13:06:08 test1 kernel: [TTM] Initializing DMA pool allocator
Aug 26 13:06:08 test1 kernel: nouveau  [     DRM] VRAM: 251 MiB
Aug 26 13:06:08 test1 kernel: nouveau  [     DRM] GART: 256 MiB
Aug 26 13:06:08 test1 kernel: nouveau  [     DRM] TMDS table version 1.1
Aug 26 13:06:08 test1 kernel: nouveau W[     DRM] TMDS table script pointers
not stubbed
Aug 26 13:06:08 test1 kernel: nouveau  [     DRM] DCB version 3.0
Aug 26 13:06:08 test1 kernel: nouveau  [     DRM] DCB outp 00: 04011310
00000028
Aug 26 13:06:08 test1 kernel: nouveau  [     DRM] DCB outp 01: 0c011312
00000000
Aug 26 13:06:08 test1 kernel: nouveau  [     DRM] DCB outp 02: 01000300
00000028
Aug 26 13:06:08 test1 kernel: nouveau  [     DRM] DCB outp 03: 020223f1
00c0c083
Aug 26 13:06:08 test1 kernel: nouveau  [     DRM] DCB conn 00: 0000
Aug 26 13:06:08 test1 kernel: nouveau  [     DRM] DCB conn 01: 2130
Aug 26 13:06:08 test1 kernel: nouveau  [     DRM] DCB conn 02: 0210
Aug 26 13:06:08 test1 kernel: nouveau  [     DRM] DCB conn 03: 0211
Aug 26 13:06:08 test1 kernel: nouveau  [     DRM] DCB conn 04: 0213
Aug 26 13:06:08 test1 kernel: nouveau  [     DRM] Saving VGA fonts
Aug 26 13:06:08 test1 kernel: [drm] Supports vblank timestamp caching Rev 1
(10.10.2010).
Aug 26 13:06:08 test1 kernel: [drm] No driver support for vblank timestamp
query.
Aug 26 13:06:08 test1 kernel: nouveau  [     DRM] 0xD3FB: Parsing digital
output script table
Aug 26 13:06:08 test1 kernel: nouveau  [     DRM] 4 available performance
level(s)
Aug 26 13:06:08 test1 kernel: nouveau  [     DRM] 0: core 275MHz shader 275MHz
memory 600MHz voltage 1050mV fanspeed 40%
Aug 26 13:06:08 test1 kernel: nouveau  [     DRM] 1: core 400MHz shader 400MHz
memory 625MHz voltage 1100mV fanspeed 70%
Aug 26 13:06:08 test1 kernel: nouveau  [     DRM] 2: core 440MHz shader 440MHz
memory 650MHz voltage 1100mV fanspeed 79%
Aug 26 13:06:08 test1 kernel: nouveau  [     DRM] 3: core 487MHz shader 487MHz
memory 695MHz voltage 1200mV fanspeed 100%
Aug 26 13:06:08 test1 kernel: nouveau  [     DRM] c: core 275MHz shader 275MHz
memory 600MHz voltage 1050mV fanspeed 100%
Aug 26 13:06:08 test1 kernel: nouveau  [     DRM] MM: using M2MF for buffer
copies
Aug 26 13:06:08 test1 kernel: nouveau  [     DRM] Setting dpms mode 3 on TV
encoder (output 3)
Aug 26 13:06:08 test1 kernel: nouveau  [     DRM] allocated 1600x1200 fb:
0x9000, bo ffff88003701f800
Aug 26 13:06:08 test1 kernel: fbcon: nouveaufb (fb0) is primary device
Aug 26 13:06:08 test1 kernel: nouveau  [     DRM] 0xD3FB: Parsing digital
output script table
Aug 26 13:06:08 test1 kernel: Console: switching to colour frame buffer device
200x75
Aug 26 13:06:08 test1 kernel: nouveau 0000:01:00.0: fb0: nouveaufb frame buffer
device
Aug 26 13:06:08 test1 kernel: nouveau 0000:01:00.0: registered panic notifier
Aug 26 13:06:08 test1 kernel: [drm] Initialized nouveau 1.1.0 20120801 for
0000:01:00.0 on minor 0

> The various temperature thresholds just take care of setting the fan (in
> this case it's saying that your card is at 0C so it can shut the fan down).
Well, that was really what caused this. The card temperature was NOT 0C, it was
something like 30C+, so I suspect something went awry during restore.

> I think the real issue are the INVALID_CMD's that you see...
I am no expert in this, hence submitting this bug report. If there is anything
else you'd like to know just ask.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1377555415.Aa131.27152
Date: Mon, 26 Aug 2013 22:16:55 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - shutdown threshold temperature sometimes isn't restored properly after hibernate"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=68572#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - shutdown threshold temperature sometimes isn't restored properly after hibernate"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=68572">bug 68572</a>
              from <span class="vcard"><a class="email" href="mailto:mr.dash.four&#64;googlemail.com" title="Mr-4 &lt;mr.dash.four&#64;googlemail.com&gt;"> <span class="fn">Mr-4</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=68572#c1">comment #1</a>)
<span class="quote">&gt; What hardware do you have</span >
NVidia 7800GS

<span class="quote">&gt; Full kernel log</span >
I can't provide you with &quot;full kernel log&quot; as I was coming out of restore after
hibernate, but can provide you with this:
Aug 26 13:00:05 test1 kernel: PM: Syncing filesystems ... done.
Aug 26 13:00:05 test1 kernel: Freezing user space processes ... (elapsed 0.01
seconds) done.
Aug 26 13:00:05 test1 kernel: PM: Preallocating image memory... done (allocated
194506 pages)
Aug 26 13:00:05 test1 kernel: PM: Allocated 778024 kbytes in 0.10 seconds
(7780.24 MB/s)
Aug 26 13:00:05 test1 kernel: Freezing remaining freezable tasks ... (elapsed
5.31 seconds) done.
Aug 26 13:00:05 test1 kernel: Suspending console(s) (use no_console_suspend to
debug)
Aug 26 13:00:05 test1 kernel: i8042 kbd 00:09: System wakeup enabled by ACPI
Aug 26 13:00:05 test1 kernel: mpu401 00:04: disabled
Aug 26 13:00:05 test1 kernel: nouveau  [     DRM] suspending fbcon...
Aug 26 13:00:05 test1 kernel: nouveau  [     DRM] suspending display...
Aug 26 13:00:05 test1 kernel: nouveau  [     DRM] unpinning framebuffer(s)...
Aug 26 13:00:05 test1 kernel: nouveau  [     DRM] evicting buffers...
Aug 26 13:00:05 test1 kernel: pci 0000:00:13.1: System wakeup enabled by ACPI
Aug 26 13:00:05 test1 kernel: nouveau  [     DRM] suspending client object
trees...
Aug 26 13:00:05 test1 kernel: PM: freeze of devices complete after 313.451
msecs
Aug 26 13:00:05 test1 kernel: PM: late freeze of devices complete after 0.402
msecs
Aug 26 13:00:05 test1 kernel: PM: noirq freeze of devices complete after 0.542
msecs
Aug 26 13:00:05 test1 kernel: ACPI: Preparing to enter system sleep state S4
Aug 26 13:00:05 test1 kernel: PM: Saving platform NVS memory
Aug 26 13:00:05 test1 kernel: Disabling non-boot CPUs ...
Aug 26 13:00:05 test1 kernel: smpboot: CPU 1 is now offline
Aug 26 13:00:05 test1 kernel: PM: Creating hibernation image:
Aug 26 13:00:05 test1 kernel: PM: Need to copy 194329 pages
Aug 26 13:00:05 test1 kernel: PM: Restoring platform NVS memory
Aug 26 13:00:05 test1 kernel: Enabling non-boot CPUs ...
Aug 26 13:00:05 test1 kernel: smpboot: Booting Node 0 Processor 1 APIC 0x1
Aug 26 13:00:05 test1 kernel: CPU1 is up
Aug 26 13:00:05 test1 kernel: ACPI: Waking up from system sleep state S4
Aug 26 13:00:05 test1 kernel: PM: noirq restore of devices complete after
33.248 msecs
Aug 26 13:00:05 test1 kernel: PM: early restore of devices complete after 0.127
msecs
Aug 26 13:00:05 test1 kernel: usb usb2: root hub lost power or was reset
Aug 26 13:00:05 test1 kernel: usb usb3: root hub lost power or was reset
Aug 26 13:00:05 test1 kernel: usb usb4: root hub lost power or was reset
Aug 26 13:00:05 test1 kernel: usb usb5: root hub lost power or was reset
Aug 26 13:00:05 test1 kernel: usb usb1: root hub lost power or was reset
Aug 26 13:00:05 test1 kernel: nouveau  [     DRM] re-enabling device...
Aug 26 13:00:05 test1 kernel: nouveau  [     DRM] resuming client object
trees...
Aug 26 13:00:05 test1 kernel: nouveau  [   VBIOS][0000:01:00.0] running init
tables
Aug 26 13:00:05 test1 kernel: pci 0000:00:13.1: System wakeup disabled by ACPI
Aug 26 13:00:05 test1 kernel: mpu401 00:04: activated
Aug 26 13:00:05 test1 kernel: i8042 kbd 00:09: System wakeup disabled by ACPI
Aug 26 13:00:05 test1 kernel: nouveau  [  PTHERM][0000:01:00.0] fan management:
automatic
Aug 26 13:00:05 test1 kernel: nouveau  [  PTHERM][0000:01:00.0] programmed
thresholds [ 90(3), 95(3), 115(2), 135(5) ]
Aug 26 13:00:05 test1 kernel: agpgart-via 0000:00:00.0: AGP 3.5 bridge
Aug 26 13:00:05 test1 kernel: agpgart: kworker/u:0 tried to set rate=x12.
Setting to AGP3 x8 mode.
Aug 26 13:00:05 test1 kernel: agpgart-via 0000:00:00.0: putting AGP V3 device
into 8x mode
Aug 26 12:00:05 test1 rtkit-daemon[2090]: The canary thread is apparently
starving. Taking action.
Aug 26 12:00:05 test1 rtkit-daemon[2090]: Demoting known real-time threads.
Aug 26 13:00:05 test1 kernel: nouveau 0000:01:00.0: putting AGP V3 device into
8x mode
Aug 26 13:00:05 test1 kernel: nouveau  [     DRM] resuming display...
Aug 26 13:00:05 test1 kernel: nouveau  [     DRM] 0xD3FB: Parsing digital
output script table
Aug 26 13:00:05 test1 kernel: nouveau  [     DRM] Setting dpms mode 3 on TV
encoder (output 3)
Aug 26 13:00:05 test1 kernel: nouveau  [     DRM] 0xD3FB: Parsing digital
output script table
Aug 26 13:00:05 test1 kernel: ata4.00: ACPI cmd ef/03:42:00:00:00:a0 (SET
FEATURES) filtered out
Aug 26 13:00:05 test1 kernel: ata3.00: ACPI cmd ef/03:45:00:00:00:a0 (SET
FEATURES) filtered out
Aug 26 13:00:05 test1 kernel: ata3.00: ACPI cmd ef/03:01:00:00:00:a0 (SET
FEATURES) filtered out
Aug 26 13:00:05 test1 kernel: ata4.00: configured for UDMA/33
Aug 26 13:00:05 test1 kernel: ata3.00: configured for UDMA/100
Aug 26 13:00:05 test1 kernel: sd 2:0:0:0: [sda] Starting disk
Aug 26 13:00:05 test1 kernel: usb 1-2: reset high-speed USB device number 8
using ehci-pci
Aug 26 13:00:05 test1 kernel: usb 1-2.3: reset low-speed USB device number 9
using ehci-pci
Aug 26 13:00:05 test1 kernel: PM: restore of devices complete after 1157.251
msecs
Aug 26 12:00:05 test1 rtkit-daemon[2090]: Successfully demoted thread 2287 of
process 2267 (/usr/bin/pulseaudio).
Aug 26 12:00:05 test1 rtkit-daemon[2090]: Successfully demoted thread 2285 of
process 2267 (/usr/bin/pulseaudio).
Aug 26 12:00:05 test1 rtkit-daemon[2090]: Successfully demoted thread 2267 of
process 2267 (/usr/bin/pulseaudio).
Aug 26 12:00:05 test1 rtkit-daemon[2090]: Demoted 3 threads.
Aug 26 13:00:05 test1 kernel: Restarting tasks ... done.

After which comes the log I included in the initial report.

<span class="quote">&gt; VBIOS might make sense here too</span >
Here goes the start up log:

Aug 26 13:06:08 test1 kernel: [drm] Initialized drm 1.1.0 20060810
Aug 26 13:06:08 test1 kernel: nouveau  [  DEVICE][0000:01:00.0] BOOT0  :
0x049200a2
Aug 26 13:06:08 test1 kernel: nouveau  [  DEVICE][0000:01:00.0] Chipset: G71
(NV49)
Aug 26 13:06:08 test1 kernel: nouveau  [  DEVICE][0000:01:00.0] Family : NV40
Aug 26 13:06:08 test1 kernel: nouveau  [   VBIOS][0000:01:00.0] checking PRAMIN
for image...
Aug 26 13:06:08 test1 kernel: nouveau  [   VBIOS][0000:01:00.0] ... checksum
invalid
Aug 26 13:06:08 test1 kernel: nouveau  [   VBIOS][0000:01:00.0] checking PROM
for image...
Aug 26 13:06:08 test1 kernel: nouveau  [   VBIOS][0000:01:00.0] ... appears to
be valid
Aug 26 13:06:08 test1 kernel: nouveau  [   VBIOS][0000:01:00.0] using image
from PROM
Aug 26 13:06:08 test1 kernel: nouveau  [   VBIOS][0000:01:00.0] BIT signature
found
Aug 26 13:06:08 test1 kernel: nouveau  [   VBIOS][0000:01:00.0] version
05.71.22.21.0a
Aug 26 13:06:08 test1 kernel: nouveau  [     PFB][0000:01:00.0] RAM type: GDDR3
Aug 26 13:06:08 test1 kernel: nouveau  [     PFB][0000:01:00.0] RAM size: 256
MiB
Aug 26 13:06:08 test1 kernel: nouveau  [     PFB][0000:01:00.0]    ZCOMP:
294912 tags
Aug 26 13:06:08 test1 kernel: nouveau  [  PTHERM][0000:01:00.0] FAN control:
PWM
Aug 26 13:06:08 test1 kernel: nouveau  [  PTHERM][0000:01:00.0] fan management:
disabled
Aug 26 13:06:08 test1 kernel: nouveau  [  PTHERM][0000:01:00.0] internal
sensor: yes
Aug 26 13:06:08 test1 kernel: nouveau  [  PTHERM][0000:01:00.0] programmed
thresholds [ 90(3), 95(3), 115(2), 135(5) ]
Aug 26 13:06:08 test1 kernel: agpgart-via 0000:00:00.0: AGP 3.5 bridge
Aug 26 13:06:08 test1 kernel: agpgart: modprobe tried to set rate=x12. Setting
to AGP3 x8 mode.
Aug 26 13:06:08 test1 kernel: agpgart-via 0000:00:00.0: putting AGP V3 device
into 8x mode
Aug 26 13:06:08 test1 kernel: nouveau 0000:01:00.0: putting AGP V3 device into
8x mode
Aug 26 13:06:08 test1 kernel: [TTM] Zone  kernel: Available graphics memory:
1026348 kiB
Aug 26 13:06:08 test1 kernel: [TTM] Initializing pool allocator
Aug 26 13:06:08 test1 kernel: [TTM] Initializing DMA pool allocator
Aug 26 13:06:08 test1 kernel: nouveau  [     DRM] VRAM: 251 MiB
Aug 26 13:06:08 test1 kernel: nouveau  [     DRM] GART: 256 MiB
Aug 26 13:06:08 test1 kernel: nouveau  [     DRM] TMDS table version 1.1
Aug 26 13:06:08 test1 kernel: nouveau W[     DRM] TMDS table script pointers
not stubbed
Aug 26 13:06:08 test1 kernel: nouveau  [     DRM] DCB version 3.0
Aug 26 13:06:08 test1 kernel: nouveau  [     DRM] DCB outp 00: 04011310
00000028
Aug 26 13:06:08 test1 kernel: nouveau  [     DRM] DCB outp 01: 0c011312
00000000
Aug 26 13:06:08 test1 kernel: nouveau  [     DRM] DCB outp 02: 01000300
00000028
Aug 26 13:06:08 test1 kernel: nouveau  [     DRM] DCB outp 03: 020223f1
00c0c083
Aug 26 13:06:08 test1 kernel: nouveau  [     DRM] DCB conn 00: 0000
Aug 26 13:06:08 test1 kernel: nouveau  [     DRM] DCB conn 01: 2130
Aug 26 13:06:08 test1 kernel: nouveau  [     DRM] DCB conn 02: 0210
Aug 26 13:06:08 test1 kernel: nouveau  [     DRM] DCB conn 03: 0211
Aug 26 13:06:08 test1 kernel: nouveau  [     DRM] DCB conn 04: 0213
Aug 26 13:06:08 test1 kernel: nouveau  [     DRM] Saving VGA fonts
Aug 26 13:06:08 test1 kernel: [drm] Supports vblank timestamp caching Rev 1
(10.10.2010).
Aug 26 13:06:08 test1 kernel: [drm] No driver support for vblank timestamp
query.
Aug 26 13:06:08 test1 kernel: nouveau  [     DRM] 0xD3FB: Parsing digital
output script table
Aug 26 13:06:08 test1 kernel: nouveau  [     DRM] 4 available performance
level(s)
Aug 26 13:06:08 test1 kernel: nouveau  [     DRM] 0: core 275MHz shader 275MHz
memory 600MHz voltage 1050mV fanspeed 40%
Aug 26 13:06:08 test1 kernel: nouveau  [     DRM] 1: core 400MHz shader 400MHz
memory 625MHz voltage 1100mV fanspeed 70%
Aug 26 13:06:08 test1 kernel: nouveau  [     DRM] 2: core 440MHz shader 440MHz
memory 650MHz voltage 1100mV fanspeed 79%
Aug 26 13:06:08 test1 kernel: nouveau  [     DRM] 3: core 487MHz shader 487MHz
memory 695MHz voltage 1200mV fanspeed 100%
Aug 26 13:06:08 test1 kernel: nouveau  [     DRM] c: core 275MHz shader 275MHz
memory 600MHz voltage 1050mV fanspeed 100%
Aug 26 13:06:08 test1 kernel: nouveau  [     DRM] MM: using M2MF for buffer
copies
Aug 26 13:06:08 test1 kernel: nouveau  [     DRM] Setting dpms mode 3 on TV
encoder (output 3)
Aug 26 13:06:08 test1 kernel: nouveau  [     DRM] allocated 1600x1200 fb:
0x9000, bo ffff88003701f800
Aug 26 13:06:08 test1 kernel: fbcon: nouveaufb (fb0) is primary device
Aug 26 13:06:08 test1 kernel: nouveau  [     DRM] 0xD3FB: Parsing digital
output script table
Aug 26 13:06:08 test1 kernel: Console: switching to colour frame buffer device
200x75
Aug 26 13:06:08 test1 kernel: nouveau 0000:01:00.0: fb0: nouveaufb frame buffer
device
Aug 26 13:06:08 test1 kernel: nouveau 0000:01:00.0: registered panic notifier
Aug 26 13:06:08 test1 kernel: [drm] Initialized nouveau 1.1.0 20120801 for
0000:01:00.0 on minor 0

<span class="quote">&gt; The various temperature thresholds just take care of setting the fan (in
&gt; this case it's saying that your card is at 0C so it can shut the fan down).</span >
Well, that was really what caused this. The card temperature was NOT 0C, it was
something like 30C+, so I suspect something went awry during restore.

<span class="quote">&gt; I think the real issue are the INVALID_CMD's that you see...</span >
I am no expert in this, hence submitting this bug report. If there is anything
else you'd like to know just ask.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1377555415.Aa131.27152--

--===============0319756499==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0319756499==--
