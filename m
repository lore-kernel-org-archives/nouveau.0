From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 69180] New: Delays when using nouveau and switcheroo
Date: Tue, 10 Sep 2013 14:58:07 +0000
Message-ID: <bug-69180-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0437021562=="
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


--===============0437021562==
Content-Type: multipart/alternative; boundary="1378825088.dF88d1.28335"; charset="us-ascii"


--1378825088.dF88d1.28335
Date: Tue, 10 Sep 2013 14:58:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=69180

          Priority: medium
            Bug ID: 69180
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: Delays when using nouveau and switcheroo
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: a0vhv-zqRNUXuvxA0b1SvskN2V4Q@public.gmane.org
          Hardware: x86 (IA32)
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

Created attachment 85566
  --> https://bugs.freedesktop.org/attachment.cgi?id=85566&action=edit
lspci output

First of all: you did a very good job! Actually I wanted to report an X server
crash and a kernel panic in nouveau/vgaswitcheroo in Ubuntu 13.04, but now that
I installed the latest version of nouveau I see that these bugs are gone!
However, there are still some other bugs in the latest version that I want to
report.

Kernel version: 3.11.0-031100-generic
DRM version: 1.1.0 20060810
Nouveau version: 1.1.1 20120801

I did a out-of-tree compilation using the nouveau snapshot of today.

My notebook (Medion Akoya P6624) uses a Nvidia GeForce GT 425M together with an
Intel HD graphics card. X is not involved in these reports. I always booted to
console and never started X. To make it clear how long a command took to
execute, I used a script that logs to dmesg and syslog when a command started
executing and when it was done. The commands of each report were executed
directly after boot. The output of "cat /sys/kernel/debug/vgaswitcheroo/switch"
after boot is always
0:IGD:+:Pwr:0000:00:02.0
1:DIS: :Pwr:0000:01:00.0

1) Switching the dedicated card off takes 45 seconds and reports some errors

    1.1) Switch dedicated card off:

        dmesg output:
        [  109.787177] Before "echo OFF >
/sys/kernel/debug/vgaswitcheroo/switch"
        [  109.787404] VGA switcheroo: switched nouveau off
        [  109.787476] ACPI Warning: \_SB_.PCI0.P0P1.PEGP._DSM: Argument #4
type mismatch - Found [Buffer], ACPI requires [Package]
(20130517/nsarguments-95)
        [  109.787830] nouveau  [     DRM] suspending fbcon...
        [  109.787836] nouveau  [     DRM] suspending display...
        [  109.787841] nouveau  [     DRM] unpinning framebuffer(s)...
        [  109.787893] nouveau  [     DRM] evicting buffers...
        [  139.807186] nouveau  [     DRM] waiting for kernel channels to go
idle...
        [  154.814513] nouveau E[     DRM] failed to idle channel 0xcccc0001
[DRM]
        [  154.819750] After "echo OFF >
/sys/kernel/debug/vgaswitcheroo/switch"

        "cat /sys/kernel/debug/vgaswitcheroo/switch" output:
        0:IGD:+:Pwr:0000:00:02.0
        1:DIS: :Off:0000:01:00.0

    1.2) Switch dedicated card back on:

        dmesg output:
        [  188.129397] Before "echo ON >
/sys/kernel/debug/vgaswitcheroo/switch"
        [  188.129674] VGA switcheroo: switched nouveau on
        [  188.129765] nouveau  [     DRM] re-enabling device...
        [  188.129783] nouveau  [     DRM] resuming kernel object tree...
        [  188.129871] nouveau  [     DRM] resuming client object trees...
        [  188.129877] nouveau  [     DRM] resuming display...
        [  188.129890] nouveau E[     DRM] Could not pin/map cursor.
        [  188.129980] nouveau E[     DRM] Could not pin/map cursor.
        [  188.135706] After "echo ON > /sys/kernel/debug/vgaswitcheroo/switch"

        "cat /sys/kernel/debug/vgaswitcheroo/switch" output:
        0:IGD:+:Pwr:0000:00:02.0
        1:DIS: :Pwr:0000:01:00.0


2) Unloading and loading nouveau takes almost a minute (~40s + ~15s) and
reports some errors

    2.1) Unload nouveau:

        dmesg output:
        [   81.873603] Before "modprobe -r nouveau"
        [   96.894475] nouveau E[     DRM] failed to idle channel 0xcccc0000
[DRM]
        [   98.896050] nouveau E[   PFIFO][0000:01:00.0] channel 1 [DRM] kick
timeout
        [  100.897626] nouveau E[   PFIFO][0000:01:00.0] playlist update failed
        [  100.897812] nouveau W[   PFIFO][0000:01:00.0] INTR 0x00000001:
0x00000003
        [  115.906124] nouveau E[     DRM] failed to idle channel 0xcccc0001
[DRM]
        [  117.907634] nouveau E[   PFIFO][0000:01:00.0] channel 0 [DRM] kick
timeout
        [  119.909206] nouveau E[   PFIFO][0000:01:00.0] playlist update failed
        [  119.910780] [TTM] Finalizing pool allocator
        [  119.910790] [TTM] Finalizing DMA pool allocator
        [  119.910871] [TTM] Zone  kernel: Used memory at exit: 0 kiB
        [  119.910877] [TTM] Zone highmem: Used memory at exit: 0 kiB
        [  119.910883] vga_switcheroo: disabled
        [  119.913110] [drm] Module unloaded
        [  119.941120] After "modprobe -r nouveau"

    2.2) Load nouveau:

        dmesg output:
        [  161.070144] Before "modprobe nouveau"
        [  161.145759] MXM: GUID detected in BIOS
        [  161.145810] ACPI Warning: \_SB_.PCI0.GFX0._DSM: Argument #4 type
mismatch - Found [Integer], ACPI requires [Package] (20130517/nsarguments-95)
        [  161.146039] ACPI Warning: \_SB_.PCI0.GFX0._DSM: Argument #4 type
mismatch - Found [Buffer], ACPI requires [Package] (20130517/nsarguments-95)
        [  161.146226] ACPI Warning: \_SB_.PCI0.P0P1.PEGP._DSM: Argument #4
type mismatch - Found [Integer], ACPI requires [Package]
(20130517/nsarguments-95)
        [  161.146315] ACPI Warning: \_SB_.PCI0.P0P1.PEGP._DSM: Argument #4
type mismatch - Found [Buffer], ACPI requires [Package]
(20130517/nsarguments-95)
        [  161.146418] VGA switcheroo: detected Optimus DSM method
\_SB_.PCI0.P0P1.PEGP handle
        [  161.146980] nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x0c1800a1
        [  161.146984] nouveau  [  DEVICE][0000:01:00.0] Chipset: GF108 (NVC1)
        [  161.146987] nouveau  [  DEVICE][0000:01:00.0] Family : NVC0
        [  161.148457] nouveau  [   VBIOS][0000:01:00.0] checking PRAMIN for
image...
        [  161.148466] nouveau  [   VBIOS][0000:01:00.0] ... signature not
found
        [  161.148468] nouveau  [   VBIOS][0000:01:00.0] checking PROM for
image...
        [  161.148523] nouveau  [   VBIOS][0000:01:00.0] ... signature not
found
        [  161.148524] nouveau  [   VBIOS][0000:01:00.0] checking ACPI for
image...
        [  174.524023] nouveau  [   VBIOS][0000:01:00.0] ... appears to be
valid
        [  174.524029] nouveau  [   VBIOS][0000:01:00.0] using image from ACPI
        [  174.524253] nouveau  [   VBIOS][0000:01:00.0] BIT signature found
        [  174.524258] nouveau  [   VBIOS][0000:01:00.0] version 70.08.19.00.21
        [  174.525052] nouveau  [     PFB][0000:01:00.0] RAM type: DDR3
        [  174.525058] nouveau  [     PFB][0000:01:00.0] RAM size: 512 MiB
        [  174.525063] nouveau  [     PFB][0000:01:00.0]    ZCOMP: 0 tags
        [  174.557517] nouveau  [  PTHERM][0000:01:00.0] FAN control: none /
external
        [  174.557528] nouveau  [  PTHERM][0000:01:00.0] fan management:
disabled
        [  174.557533] nouveau  [  PTHERM][0000:01:00.0] internal sensor: yes
        [  174.566347] vga_switcheroo: enabled
        [  174.566659] [TTM] Zone  kernel: Available graphics memory: 426710
kiB
        [  174.566666] [TTM] Zone highmem: Available graphics memory: 1963648
kiB
        [  174.566669] [TTM] Initializing pool allocator
        [  174.566681] [TTM] Initializing DMA pool allocator
        [  174.566705] nouveau  [     DRM] VRAM: 512 MiB
        [  174.566709] nouveau  [     DRM] GART: 1048576 MiB
        [  174.566719] nouveau  [     DRM] TMDS table version 2.0
        [  174.566723] nouveau  [     DRM] DCB version 4.0
        [  174.566729] nouveau  [     DRM] DCB outp 00: 02021300 00000000
        [  174.566735] nouveau  [     DRM] DCB conn 00: 00000040
        [  174.566741] nouveau  [     DRM] DCB conn 01: 00000100
        [  174.566745] nouveau  [     DRM] DCB conn 02: 00002261
        [  174.568326] [drm] Supports vblank timestamp caching Rev 1
(10.10.2010).
        [  174.568331] [drm] No driver support for vblank timestamp query.
        [  174.568337] nouveau  [     DRM] ACPI backlight interface available,
not registering our own
        [  174.568543] nouveau  [     DRM] 3 available performance level(s)
        [  174.568547] nouveau  [     DRM] 0: core 50MHz shader 101MHz memory
135MHz voltage 830mV
        [  174.568549] nouveau  [     DRM] 1: core 202MHz shader 405MHz memory
324MHz voltage 830mV
        [  174.568552] nouveau  [     DRM] 3: core 560MHz shader 1120MHz memory
800MHz voltage 900mV
        [  174.568555] nouveau  [     DRM] c: core 202MHz shader 405MHz memory
324MHz voltage 900mV
        [  174.586084] nouveau  [     DRM] MM: using COPY0 for buffer copies
        [  174.596625] nouveau 0000:01:00.0: No connectors reported connected
with modes
        [  174.596649] [drm] Cannot find any crtc or sizes - going 1024x768
        [  174.619661] nouveau E[    PBUS][0000:01:00.0] MMIO write of
0x00000401 FAULT at 0x002010 [ IBUS TIMEOUT ]
        [  174.711581] nouveau  [     DRM] allocated 1024x768 fb: 0x60000, bo
f653bc00
        [  174.711815] nouveau 0000:01:00.0: fb1: nouveaufb frame buffer device
        [  174.711824] [drm] Initialized nouveau 1.1.1 20120801 for
0000:01:00.0 on minor 1
        [  174.714771] After "modprobe nouveau"

3) Can't switch to dedicated graphics card

    3.1) Switch to Nvidia card

        Result: Screen turns off (including backlight). Everything else still
works, commands entered through the keyboard and SSH are still executed.

        dmesg output:
        [   82.843529] Before "echo DDIS >
/sys/kernel/debug/vgaswitcheroo/switch"
        [   82.989327] nouveau E[     DRM] GPU lockup - switching to software
fbcon
        [   83.196574] fbcon: Remapping primary device, fb1, to tty 1-63
        [   83.207133] i915: switched off
        [   83.688663] After "echo DDIS >
/sys/kernel/debug/vgaswitcheroo/switch"

        "cat /sys/kernel/debug/vgaswitcheroo/switch" output:
        0:IGD: :Off:0000:00:02.0
        1:DIS:+:Pwr:0000:01:00.0

    3.2) Re-enable Intel card

        Result: Backlight turns on again but the screen is black.

        dmesg output:
        [  183.941797] Before "echo ON >
/sys/kernel/debug/vgaswitcheroo/switch"
        [  183.942058] i915: switched on
        [  183.957639] i915 0000:00:02.0: setting latency timer to 64
        [  184.421649] After "echo ON > /sys/kernel/debug/vgaswitcheroo/switch"

        "cat /sys/kernel/debug/vgaswitcheroo/switch" output:
        0:IGD: :Pwr:0000:00:02.0
        1:DIS:+:Pwr:0000:01:00.0

    3.3) Switch to intel card

    Result: Screen works again.

    dmesg output:
    [  276.129781] Before "echo DIGD > /sys/kernel/debug/vgaswitcheroo/switch"
    [  276.434822] fbcon: Remapping primary device, fb0, to tty 1-63
    [  276.434829] VGA switcheroo: switched nouveau off
    [  276.434846] ACPI Warning: \_SB_.PCI0.P0P1.PEGP._DSM: Argument #4 type
mismatch - Found [Buffer], ACPI requires [Package] (20130517/nsarguments-95)
    [  276.435073] nouveau  [     DRM] suspending fbcon...
    [  276.435077] nouveau  [     DRM] suspending display...
    [  276.435080] nouveau  [     DRM] unpinning framebuffer(s)...
    [  276.435128] nouveau  [     DRM] evicting buffers...
    [  306.454470] nouveau  [     DRM] waiting for kernel channels to go
idle...
    [  321.461603] nouveau E[     DRM] failed to idle channel 0xcccc0001 [DRM]
    [  321.466829] After "echo DIGD > /sys/kernel/debug/vgaswitcheroo/switch"

    "cat /sys/kernel/debug/vgaswitcheroo/switch" output:
    0:IGD:+:Pwr:0000:00:02.0
    1:DIS: :Off:0000:01:00.0

    AFAIK the Nvidia graphics card sends its output to the Intel card, which is
responsible for the graphics output to the screen. So I guess the problem is
that switcheroo disables the Intel card which causes the graphics output to
stop.

I would be glad if someone could take a look at these issues. Please let me
know if I should supply more logs or try out a different version.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1378825088.dF88d1.28335
Date: Tue, 10 Sep 2013 14:58:08 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><table border="1" cellspacing="0" cellpadding="8">
        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Bug ID</th>
          <td><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Delays when using nouveau and switcheroo"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69180">69180</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Delays when using nouveau and switcheroo
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>normal
          </td>
        </tr>

        <tr>
          <th>Classification</th>
          <td>Unclassified
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>Linux (All)
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>a0vhv&#64;t-online.de
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86 (IA32)
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>unspecified
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Driver/nouveau
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=85566" name="attach_85566" title="lspci output">attachment 85566</a> <a href="attachment.cgi?id=85566&amp;action=edit" title="lspci output">[details]</a></span>
lspci output

First of all: you did a very good job! Actually I wanted to report an X server
crash and a kernel panic in nouveau/vgaswitcheroo in Ubuntu 13.04, but now that
I installed the latest version of nouveau I see that these bugs are gone!
However, there are still some other bugs in the latest version that I want to
report.

Kernel version: 3.11.0-031100-generic
DRM version: 1.1.0 20060810
Nouveau version: 1.1.1 20120801

I did a out-of-tree compilation using the nouveau snapshot of today.

My notebook (Medion Akoya P6624) uses a Nvidia GeForce GT 425M together with an
Intel HD graphics card. X is not involved in these reports. I always booted to
console and never started X. To make it clear how long a command took to
execute, I used a script that logs to dmesg and syslog when a command started
executing and when it was done. The commands of each report were executed
directly after boot. The output of &quot;cat /sys/kernel/debug/vgaswitcheroo/switch&quot;
after boot is always
0:IGD:+:Pwr:0000:00:02.0
1:DIS: :Pwr:0000:01:00.0

1) Switching the dedicated card off takes 45 seconds and reports some errors

    1.1) Switch dedicated card off:

        dmesg output:
        [  109.787177] Before &quot;echo OFF &gt;
/sys/kernel/debug/vgaswitcheroo/switch&quot;
        [  109.787404] VGA switcheroo: switched nouveau off
        [  109.787476] ACPI Warning: \_SB_.PCI0.P0P1.PEGP._DSM: Argument #4
type mismatch - Found [Buffer], ACPI requires [Package]
(20130517/nsarguments-95)
        [  109.787830] nouveau  [     DRM] suspending fbcon...
        [  109.787836] nouveau  [     DRM] suspending display...
        [  109.787841] nouveau  [     DRM] unpinning framebuffer(s)...
        [  109.787893] nouveau  [     DRM] evicting buffers...
        [  139.807186] nouveau  [     DRM] waiting for kernel channels to go
idle...
        [  154.814513] nouveau E[     DRM] failed to idle channel 0xcccc0001
[DRM]
        [  154.819750] After &quot;echo OFF &gt;
/sys/kernel/debug/vgaswitcheroo/switch&quot;

        &quot;cat /sys/kernel/debug/vgaswitcheroo/switch&quot; output:
        0:IGD:+:Pwr:0000:00:02.0
        1:DIS: :Off:0000:01:00.0

    1.2) Switch dedicated card back on:

        dmesg output:
        [  188.129397] Before &quot;echo ON &gt;
/sys/kernel/debug/vgaswitcheroo/switch&quot;
        [  188.129674] VGA switcheroo: switched nouveau on
        [  188.129765] nouveau  [     DRM] re-enabling device...
        [  188.129783] nouveau  [     DRM] resuming kernel object tree...
        [  188.129871] nouveau  [     DRM] resuming client object trees...
        [  188.129877] nouveau  [     DRM] resuming display...
        [  188.129890] nouveau E[     DRM] Could not pin/map cursor.
        [  188.129980] nouveau E[     DRM] Could not pin/map cursor.
        [  188.135706] After &quot;echo ON &gt; /sys/kernel/debug/vgaswitcheroo/switch&quot;

        &quot;cat /sys/kernel/debug/vgaswitcheroo/switch&quot; output:
        0:IGD:+:Pwr:0000:00:02.0
        1:DIS: :Pwr:0000:01:00.0


2) Unloading and loading nouveau takes almost a minute (~40s + ~15s) and
reports some errors

    2.1) Unload nouveau:

        dmesg output:
        [   81.873603] Before &quot;modprobe -r nouveau&quot;
        [   96.894475] nouveau E[     DRM] failed to idle channel 0xcccc0000
[DRM]
        [   98.896050] nouveau E[   PFIFO][0000:01:00.0] channel 1 [DRM] kick
timeout
        [  100.897626] nouveau E[   PFIFO][0000:01:00.0] playlist update failed
        [  100.897812] nouveau W[   PFIFO][0000:01:00.0] INTR 0x00000001:
0x00000003
        [  115.906124] nouveau E[     DRM] failed to idle channel 0xcccc0001
[DRM]
        [  117.907634] nouveau E[   PFIFO][0000:01:00.0] channel 0 [DRM] kick
timeout
        [  119.909206] nouveau E[   PFIFO][0000:01:00.0] playlist update failed
        [  119.910780] [TTM] Finalizing pool allocator
        [  119.910790] [TTM] Finalizing DMA pool allocator
        [  119.910871] [TTM] Zone  kernel: Used memory at exit: 0 kiB
        [  119.910877] [TTM] Zone highmem: Used memory at exit: 0 kiB
        [  119.910883] vga_switcheroo: disabled
        [  119.913110] [drm] Module unloaded
        [  119.941120] After &quot;modprobe -r nouveau&quot;

    2.2) Load nouveau:

        dmesg output:
        [  161.070144] Before &quot;modprobe nouveau&quot;
        [  161.145759] MXM: GUID detected in BIOS
        [  161.145810] ACPI Warning: \_SB_.PCI0.GFX0._DSM: Argument #4 type
mismatch - Found [Integer], ACPI requires [Package] (20130517/nsarguments-95)
        [  161.146039] ACPI Warning: \_SB_.PCI0.GFX0._DSM: Argument #4 type
mismatch - Found [Buffer], ACPI requires [Package] (20130517/nsarguments-95)
        [  161.146226] ACPI Warning: \_SB_.PCI0.P0P1.PEGP._DSM: Argument #4
type mismatch - Found [Integer], ACPI requires [Package]
(20130517/nsarguments-95)
        [  161.146315] ACPI Warning: \_SB_.PCI0.P0P1.PEGP._DSM: Argument #4
type mismatch - Found [Buffer], ACPI requires [Package]
(20130517/nsarguments-95)
        [  161.146418] VGA switcheroo: detected Optimus DSM method
\_SB_.PCI0.P0P1.PEGP handle
        [  161.146980] nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x0c1800a1
        [  161.146984] nouveau  [  DEVICE][0000:01:00.0] Chipset: GF108 (NVC1)
        [  161.146987] nouveau  [  DEVICE][0000:01:00.0] Family : NVC0
        [  161.148457] nouveau  [   VBIOS][0000:01:00.0] checking PRAMIN for
image...
        [  161.148466] nouveau  [   VBIOS][0000:01:00.0] ... signature not
found
        [  161.148468] nouveau  [   VBIOS][0000:01:00.0] checking PROM for
image...
        [  161.148523] nouveau  [   VBIOS][0000:01:00.0] ... signature not
found
        [  161.148524] nouveau  [   VBIOS][0000:01:00.0] checking ACPI for
image...
        [  174.524023] nouveau  [   VBIOS][0000:01:00.0] ... appears to be
valid
        [  174.524029] nouveau  [   VBIOS][0000:01:00.0] using image from ACPI
        [  174.524253] nouveau  [   VBIOS][0000:01:00.0] BIT signature found
        [  174.524258] nouveau  [   VBIOS][0000:01:00.0] version 70.08.19.00.21
        [  174.525052] nouveau  [     PFB][0000:01:00.0] RAM type: DDR3
        [  174.525058] nouveau  [     PFB][0000:01:00.0] RAM size: 512 MiB
        [  174.525063] nouveau  [     PFB][0000:01:00.0]    ZCOMP: 0 tags
        [  174.557517] nouveau  [  PTHERM][0000:01:00.0] FAN control: none /
external
        [  174.557528] nouveau  [  PTHERM][0000:01:00.0] fan management:
disabled
        [  174.557533] nouveau  [  PTHERM][0000:01:00.0] internal sensor: yes
        [  174.566347] vga_switcheroo: enabled
        [  174.566659] [TTM] Zone  kernel: Available graphics memory: 426710
kiB
        [  174.566666] [TTM] Zone highmem: Available graphics memory: 1963648
kiB
        [  174.566669] [TTM] Initializing pool allocator
        [  174.566681] [TTM] Initializing DMA pool allocator
        [  174.566705] nouveau  [     DRM] VRAM: 512 MiB
        [  174.566709] nouveau  [     DRM] GART: 1048576 MiB
        [  174.566719] nouveau  [     DRM] TMDS table version 2.0
        [  174.566723] nouveau  [     DRM] DCB version 4.0
        [  174.566729] nouveau  [     DRM] DCB outp 00: 02021300 00000000
        [  174.566735] nouveau  [     DRM] DCB conn 00: 00000040
        [  174.566741] nouveau  [     DRM] DCB conn 01: 00000100
        [  174.566745] nouveau  [     DRM] DCB conn 02: 00002261
        [  174.568326] [drm] Supports vblank timestamp caching Rev 1
(10.10.2010).
        [  174.568331] [drm] No driver support for vblank timestamp query.
        [  174.568337] nouveau  [     DRM] ACPI backlight interface available,
not registering our own
        [  174.568543] nouveau  [     DRM] 3 available performance level(s)
        [  174.568547] nouveau  [     DRM] 0: core 50MHz shader 101MHz memory
135MHz voltage 830mV
        [  174.568549] nouveau  [     DRM] 1: core 202MHz shader 405MHz memory
324MHz voltage 830mV
        [  174.568552] nouveau  [     DRM] 3: core 560MHz shader 1120MHz memory
800MHz voltage 900mV
        [  174.568555] nouveau  [     DRM] c: core 202MHz shader 405MHz memory
324MHz voltage 900mV
        [  174.586084] nouveau  [     DRM] MM: using COPY0 for buffer copies
        [  174.596625] nouveau 0000:01:00.0: No connectors reported connected
with modes
        [  174.596649] [drm] Cannot find any crtc or sizes - going 1024x768
        [  174.619661] nouveau E[    PBUS][0000:01:00.0] MMIO write of
0x00000401 FAULT at 0x002010 [ IBUS TIMEOUT ]
        [  174.711581] nouveau  [     DRM] allocated 1024x768 fb: 0x60000, bo
f653bc00
        [  174.711815] nouveau 0000:01:00.0: fb1: nouveaufb frame buffer device
        [  174.711824] [drm] Initialized nouveau 1.1.1 20120801 for
0000:01:00.0 on minor 1
        [  174.714771] After &quot;modprobe nouveau&quot;

3) Can't switch to dedicated graphics card

    3.1) Switch to Nvidia card

        Result: Screen turns off (including backlight). Everything else still
works, commands entered through the keyboard and SSH are still executed.

        dmesg output:
        [   82.843529] Before &quot;echo DDIS &gt;
/sys/kernel/debug/vgaswitcheroo/switch&quot;
        [   82.989327] nouveau E[     DRM] GPU lockup - switching to software
fbcon
        [   83.196574] fbcon: Remapping primary device, fb1, to tty 1-63
        [   83.207133] i915: switched off
        [   83.688663] After &quot;echo DDIS &gt;
/sys/kernel/debug/vgaswitcheroo/switch&quot;

        &quot;cat /sys/kernel/debug/vgaswitcheroo/switch&quot; output:
        0:IGD: :Off:0000:00:02.0
        1:DIS:+:Pwr:0000:01:00.0

    3.2) Re-enable Intel card

        Result: Backlight turns on again but the screen is black.

        dmesg output:
        [  183.941797] Before &quot;echo ON &gt;
/sys/kernel/debug/vgaswitcheroo/switch&quot;
        [  183.942058] i915: switched on
        [  183.957639] i915 0000:00:02.0: setting latency timer to 64
        [  184.421649] After &quot;echo ON &gt; /sys/kernel/debug/vgaswitcheroo/switch&quot;

        &quot;cat /sys/kernel/debug/vgaswitcheroo/switch&quot; output:
        0:IGD: :Pwr:0000:00:02.0
        1:DIS:+:Pwr:0000:01:00.0

    3.3) Switch to intel card

    Result: Screen works again.

    dmesg output:
    [  276.129781] Before &quot;echo DIGD &gt; /sys/kernel/debug/vgaswitcheroo/switch&quot;
    [  276.434822] fbcon: Remapping primary device, fb0, to tty 1-63
    [  276.434829] VGA switcheroo: switched nouveau off
    [  276.434846] ACPI Warning: \_SB_.PCI0.P0P1.PEGP._DSM: Argument #4 type
mismatch - Found [Buffer], ACPI requires [Package] (20130517/nsarguments-95)
    [  276.435073] nouveau  [     DRM] suspending fbcon...
    [  276.435077] nouveau  [     DRM] suspending display...
    [  276.435080] nouveau  [     DRM] unpinning framebuffer(s)...
    [  276.435128] nouveau  [     DRM] evicting buffers...
    [  306.454470] nouveau  [     DRM] waiting for kernel channels to go
idle...
    [  321.461603] nouveau E[     DRM] failed to idle channel 0xcccc0001 [DRM]
    [  321.466829] After &quot;echo DIGD &gt; /sys/kernel/debug/vgaswitcheroo/switch&quot;

    &quot;cat /sys/kernel/debug/vgaswitcheroo/switch&quot; output:
    0:IGD:+:Pwr:0000:00:02.0
    1:DIS: :Off:0000:01:00.0

    AFAIK the Nvidia graphics card sends its output to the Intel card, which is
responsible for the graphics output to the screen. So I guess the problem is
that switcheroo disables the Intel card which causes the graphics output to
stop.

I would be glad if someone could take a look at these issues. Please let me
know if I should supply more logs or try out a different version.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1378825088.dF88d1.28335--

--===============0437021562==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0437021562==--
