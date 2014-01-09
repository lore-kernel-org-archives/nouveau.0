From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 59168] [nvc1/Quardro1000M|nvc3/Quadro2000M] graphic
 garbage/corruption/noise on resume
Date: Thu, 09 Jan 2014 09:55:49 +0000
Message-ID: <bug-59168-8800-9cwhPerrVq@http.bugs.freedesktop.org/>
References: <bug-59168-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1951081788=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-59168-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1951081788==
Content-Type: multipart/alternative; boundary="1389261349.FB71aA1.18312"; charset="us-ascii"


--1389261349.FB71aA1.18312
Date: Thu, 9 Jan 2014 09:55:49 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=59168

Doug Brunner <doug.a.brunner-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|RESOLVED                    |REOPENED
         Resolution|FIXED                       |---

--- Comment #41 from Doug Brunner <doug.a.brunner-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Unfortunately still present in 3.11. On Ubuntu Saucy with 3.11.0-15-generic on
x86_64, suspend/resume results in the same corrupted screen. I see vague shapes
of windows that can be moved with alt-drag, but most visual elements including
text are absent. Console and syslog have messages:

Jan  9 00:28:24 codex kernel: [   80.883153] nouveau E[  PGRAPH][0000:01:00.0]
SHADER 0xa004021e
Jan  9 00:28:24 codex kernel: [   80.883195] nouveau E[  PGRAPH][0000:01:00.0]
TRAP ch 2 [0x005fba00
00 Xorg[4341]]

repeating ad infinitum until I log into a console and restart lightdm (and thus
X server). The machine then operates normally (can use X as expected) until the
next reboot. Setting noaccel=1 works around the problem, but obviously with
reduced graphics performance.

I also tried kernel 3.12 from the Ubuntu kernel PPA - same behavior.

From lspci -nnv:
01:00.0 VGA compatible controller [0300]: NVIDIA Corporation GF116M [GeForce GT
560M] [10de:1251] (rev a1) (prog-if 00 [VGA controller])
        Subsystem: CLEVO/KAPOK Computer Device [1558:7100]
        Flags: bus master, fast devsel, latency 0, IRQ 16
        Memory at f4000000 (32-bit, non-prefetchable) [size=32M]
        Memory at e8000000 (64-bit, prefetchable) [size=128M]
        Memory at f0000000 (64-bit, prefetchable) [size=64M]
        I/O ports at e000 [size=128]
        Expansion ROM at f6000000 [disabled] [size=512K]
        Capabilities: [60] Power Management version 3
        Capabilities: [68] MSI: Enable- Count=1/1 Maskable- 64bit+
        Capabilities: [78] Express Endpoint, MSI 00
        Capabilities: [b4] Vendor Specific Information: Len=14 <?>
        Capabilities: [100] Virtual Channel
        Capabilities: [128] Power Budgeting <?>
        Capabilities: [600] Vendor Specific Information: ID=0001 Rev=1 Len=024
<?>
        Kernel driver in use: nouveau

From grep nouveau /var/log/syslog:
Jan  9 00:27:19 codex kernel: [   18.225269] fb: conflicting fb hw usage
nouveaufb vs simple - removing generic driver
Jan  9 00:27:19 codex kernel: [   18.227186] nouveau  [  DEVICE][0000:01:00.0]
BOOT0  : 0x0cf880a1
Jan  9 00:27:19 codex kernel: [   18.227189] nouveau  [  DEVICE][0000:01:00.0]
Chipset: GF116 (NVCF)
Jan  9 00:27:19 codex kernel: [   18.227192] nouveau  [  DEVICE][0000:01:00.0]
Family : NVC0
Jan  9 00:27:19 codex kernel: [   18.231456] nouveau  [   VBIOS][0000:01:00.0]
checking PRAMIN for image...
Jan  9 00:27:20 codex kernel: [   18.334067] nouveau  [   VBIOS][0000:01:00.0]
... appears to be valid
Jan  9 00:27:20 codex kernel: [   18.334071] nouveau  [   VBIOS][0000:01:00.0]
using image from PRAMIN
Jan  9 00:27:20 codex kernel: [   18.334222] nouveau  [   VBIOS][0000:01:00.0]
BIT signature found
Jan  9 00:27:20 codex kernel: [   18.334227] nouveau  [   VBIOS][0000:01:00.0]
version 70.26.29.00.06
Jan  9 00:27:20 codex kernel: [   18.358154] nouveau  [     MXM][0000:01:00.0]
BIOS version 3.0
Jan  9 00:27:20 codex kernel: [   18.361036] nouveau  [     MXM][0000:01:00.0]
MXMS Version 3.0
Jan  9 00:27:20 codex kernel: [   18.361084] nouveau  [     PFB][0000:01:00.0]
RAM type: GDDR5
Jan  9 00:27:20 codex kernel: [   18.361087] nouveau  [     PFB][0000:01:00.0]
RAM size: 1536 MiB
Jan  9 00:27:20 codex kernel: [   18.361089] nouveau  [     PFB][0000:01:00.0] 
  ZCOMP: 0 tags
Jan  9 00:27:20 codex kernel: [   18.402251] nouveau  [  PTHERM][0000:01:00.0]
FAN control: none / external
Jan  9 00:27:20 codex kernel: [   18.402262] nouveau  [  PTHERM][0000:01:00.0]
fan management: disabled
Jan  9 00:27:20 codex kernel: [   18.402268] nouveau  [  PTHERM][0000:01:00.0]
internal sensor: yes
Jan  9 00:27:20 codex kernel: [   18.438029] nouveau  [     DRM] VRAM: 1536 MiB
Jan  9 00:27:20 codex kernel: [   18.438030] nouveau  [     DRM] GART: 1048576
MiB
Jan  9 00:27:20 codex kernel: [   18.438034] nouveau  [     DRM] TMDS table
version 2.0
Jan  9 00:27:20 codex kernel: [   18.438036] nouveau  [     DRM] DCB version
4.0
Jan  9 00:27:20 codex kernel: [   18.438038] nouveau  [     DRM] DCB outp 00:
01000313 00010034
Jan  9 00:27:20 codex kernel: [   18.438040] nouveau  [     DRM] DCB outp 07:
08013382 00020030
Jan  9 00:27:20 codex kernel: [   18.438041] nouveau  [     DRM] DCB outp 08:
040383b6 0f220014
Jan  9 00:27:20 codex kernel: [   18.438043] nouveau  [     DRM] DCB outp 11:
02027362 00020010
Jan  9 00:27:20 codex kernel: [   18.438044] nouveau  [     DRM] DCB outp 13:
02013380 00000000
Jan  9 00:27:20 codex kernel: [   18.438046] nouveau  [     DRM] DCB conn 00:
00000040
Jan  9 00:27:20 codex kernel: [   18.438047] nouveau  [     DRM] DCB conn 01:
00001161
Jan  9 00:27:20 codex kernel: [   18.438049] nouveau  [     DRM] DCB conn 02:
00001231
Jan  9 00:27:20 codex kernel: [   18.438050] nouveau  [     DRM] DCB conn 03:
01000330
Jan  9 00:27:20 codex kernel: [   18.438052] nouveau  [     DRM] DCB conn 04:
01000446
Jan  9 00:27:20 codex kernel: [   18.438053] nouveau  [     DRM] DCB conn 05:
02000546
Jan  9 00:27:20 codex kernel: [   18.438054] nouveau  [     DRM] DCB conn 06:
00010661
Jan  9 00:27:20 codex kernel: [   18.438055] nouveau  [     DRM] DCB conn 07:
00010761
Jan  9 00:27:20 codex kernel: [   18.438057] nouveau  [     DRM] DCB conn 08:
00020847
Jan  9 00:27:20 codex kernel: [   18.438059] nouveau  [     DRM] DCB conn 09:
00000900
Jan  9 00:27:20 codex kernel: [   18.439274] nouveau  [     DRM] ACPI backlight
interface available, not registering our own
Jan  9 00:27:20 codex kernel: [   18.439495] nouveau  [     DRM] 3 available
performance level(s)
Jan  9 00:27:20 codex kernel: [   18.439500] nouveau  [     DRM] 0: core 50MHz
shader 101MHz memory 135MHz voltage 820mV
Jan  9 00:27:20 codex kernel: [   18.439504] nouveau  [     DRM] 1: core 202MHz
shader 405MHz memory 324MHz voltage 820mV
Jan  9 00:27:20 codex kernel: [   18.439507] nouveau  [     DRM] 3: core 775MHz
shader 1550MHz memory 1250MHz voltage 1000mV
Jan  9 00:27:20 codex kernel: [   18.439511] nouveau  [     DRM] c: core 202MHz
shader 405MHz memory 324MHz voltage 1000mV
Jan  9 00:27:20 codex kernel: [   18.445776] nouveau  [     DRM] MM: using
COPY1 for buffer copies
Jan  9 00:27:20 codex kernel: [   18.705449] nouveau  [     DRM] allocated
1920x1080 fb: 0x60000, bo ffff88060a4e8000
Jan  9 00:27:20 codex kernel: [   18.706813] fbcon: nouveaufb (fb0) is primary
device
Jan  9 00:27:21 codex kernel: [   20.089762] nouveau 0000:01:00.0: fb0:
nouveaufb frame buffer device
Jan  9 00:27:21 codex kernel: [   20.089768] nouveau 0000:01:00.0: registered
panic notifier
Jan  9 00:27:21 codex kernel: [   20.089773] [drm] Initialized nouveau 1.1.1
20120801 for 0000:01:00.0 on minor 0
Jan  9 00:28:24 codex kernel: [   74.287528] nouveau  [     DRM] suspending
display...
Jan  9 00:28:24 codex kernel: [   74.287549] nouveau  [     DRM] unpinning
framebuffer(s)...
Jan  9 00:28:24 codex kernel: [   74.287678] nouveau  [     DRM] evicting
buffers...
Jan  9 00:28:24 codex kernel: [   74.669560] nouveau  [     DRM] waiting for
kernel channels to go idle...
Jan  9 00:28:24 codex kernel: [   74.669589] nouveau  [     DRM] suspending
client object trees...
Jan  9 00:28:24 codex kernel: [   74.670070] nouveau  [     DRM] suspending
kernel object tree...
Jan  9 00:28:24 codex kernel: [   78.372083] nouveau  [     DRM] re-enabling
device...
Jan  9 00:28:24 codex kernel: [   78.372094] nouveau  [     DRM] resuming
kernel object tree...
Jan  9 00:28:24 codex kernel: [   78.372100] nouveau  [   VBIOS][0000:01:00.0]
running init tables
Jan  9 00:28:24 codex kernel: [   78.599853] nouveau  [     DRM] resuming
client object trees...
Jan  9 00:28:24 codex kernel: [   78.600083] nouveau  [     DRM] resuming
display...
Jan  9 00:28:24 codex kernel: [   80.727990] nouveau E[  PGRAPH][0000:01:00.0]
TRAP ch 2 [0x005fba0000 Xorg[4341]]
Jan  9 00:28:24 codex kernel: [   80.728043] nouveau E[  PGRAPH][0000:01:00.0]
SHADER 0xa004021e
Jan  9 00:28:24 codex kernel: [   80.728120] nouveau E[  PGRAPH][0000:01:00.0]
TRAP ch 2 [0x005fba0000 Xorg[4341]]
Jan  9 00:28:24 codex kernel: [   80.728168] nouveau E[  PGRAPH][0000:01:00.0]
SHADER 0xa004021e
Jan  9 00:28:24 codex kernel: [   80.728251] nouveau E[  PGRAPH][0000:01:00.0]
TRAP ch 2 [0x005fba0000 Xorg[4341]]
Jan  9 00:28:24 codex kernel: [   80.728297] nouveau E[  PGRAPH][0000:01:00.0]
SHADER 0xa004021e
Jan  9 00:28:24 codex kernel: [   80.728434] nouveau E[  PGRAPH][0000:01:00.0]
TRAP ch 2 [0x005fba0000 Xorg[4341]]
Jan  9 00:28:24 codex kernel: [   80.728476] nouveau E[  PGRAPH][0000:01:00.0]
SHADER 0xa004021e
<and so on>

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1389261349.FB71aA1.18312
Date: Thu, 9 Jan 2014 09:55:49 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:doug.a.brunner&#64;gmail.com" title="Doug Brunner &lt;doug.a.brunner&#64;gmail.com&gt;"> <span class="fn">Doug Brunner</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - [nvc1/Quardro1000M|nvc3/Quadro2000M] graphic garbage/corruption/noise on resume"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=59168">bug 59168</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Status</td>
           <td>RESOLVED
           </td>
           <td>REOPENED
           </td>
         </tr>

         <tr>
           <td style="text-align:right;">Resolution</td>
           <td>FIXED
           </td>
           <td>---
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - [nvc1/Quardro1000M|nvc3/Quadro2000M] graphic garbage/corruption/noise on resume"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=59168#c41">Comment # 41</a>
              on <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - [nvc1/Quardro1000M|nvc3/Quadro2000M] graphic garbage/corruption/noise on resume"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=59168">bug 59168</a>
              from <span class="vcard"><a class="email" href="mailto:doug.a.brunner&#64;gmail.com" title="Doug Brunner &lt;doug.a.brunner&#64;gmail.com&gt;"> <span class="fn">Doug Brunner</span></a>
</span></b>
        <pre>Unfortunately still present in 3.11. On Ubuntu Saucy with 3.11.0-15-generic on
x86_64, suspend/resume results in the same corrupted screen. I see vague shapes
of windows that can be moved with alt-drag, but most visual elements including
text are absent. Console and syslog have messages:

Jan  9 00:28:24 codex kernel: [   80.883153] nouveau E[  PGRAPH][0000:01:00.0]
SHADER 0xa004021e
Jan  9 00:28:24 codex kernel: [   80.883195] nouveau E[  PGRAPH][0000:01:00.0]
TRAP ch 2 [0x005fba00
00 Xorg[4341]]

repeating ad infinitum until I log into a console and restart lightdm (and thus
X server). The machine then operates normally (can use X as expected) until the
next reboot. Setting noaccel=1 works around the problem, but obviously with
reduced graphics performance.

I also tried kernel 3.12 from the Ubuntu kernel PPA - same behavior.

From lspci -nnv:
01:00.0 VGA compatible controller [0300]: NVIDIA Corporation GF116M [GeForce GT
560M] [10de:1251] (rev a1) (prog-if 00 [VGA controller])
        Subsystem: CLEVO/KAPOK Computer Device [1558:7100]
        Flags: bus master, fast devsel, latency 0, IRQ 16
        Memory at f4000000 (32-bit, non-prefetchable) [size=32M]
        Memory at e8000000 (64-bit, prefetchable) [size=128M]
        Memory at f0000000 (64-bit, prefetchable) [size=64M]
        I/O ports at e000 [size=128]
        Expansion ROM at f6000000 [disabled] [size=512K]
        Capabilities: [60] Power Management version 3
        Capabilities: [68] MSI: Enable- Count=1/1 Maskable- 64bit+
        Capabilities: [78] Express Endpoint, MSI 00
        Capabilities: [b4] Vendor Specific Information: Len=14 &lt;?&gt;
        Capabilities: [100] Virtual Channel
        Capabilities: [128] Power Budgeting &lt;?&gt;
        Capabilities: [600] Vendor Specific Information: ID=0001 Rev=1 Len=024
&lt;?&gt;
        Kernel driver in use: nouveau

From grep nouveau /var/log/syslog:
Jan  9 00:27:19 codex kernel: [   18.225269] fb: conflicting fb hw usage
nouveaufb vs simple - removing generic driver
Jan  9 00:27:19 codex kernel: [   18.227186] nouveau  [  DEVICE][0000:01:00.0]
BOOT0  : 0x0cf880a1
Jan  9 00:27:19 codex kernel: [   18.227189] nouveau  [  DEVICE][0000:01:00.0]
Chipset: GF116 (NVCF)
Jan  9 00:27:19 codex kernel: [   18.227192] nouveau  [  DEVICE][0000:01:00.0]
Family : NVC0
Jan  9 00:27:19 codex kernel: [   18.231456] nouveau  [   VBIOS][0000:01:00.0]
checking PRAMIN for image...
Jan  9 00:27:20 codex kernel: [   18.334067] nouveau  [   VBIOS][0000:01:00.0]
... appears to be valid
Jan  9 00:27:20 codex kernel: [   18.334071] nouveau  [   VBIOS][0000:01:00.0]
using image from PRAMIN
Jan  9 00:27:20 codex kernel: [   18.334222] nouveau  [   VBIOS][0000:01:00.0]
BIT signature found
Jan  9 00:27:20 codex kernel: [   18.334227] nouveau  [   VBIOS][0000:01:00.0]
version 70.26.29.00.06
Jan  9 00:27:20 codex kernel: [   18.358154] nouveau  [     MXM][0000:01:00.0]
BIOS version 3.0
Jan  9 00:27:20 codex kernel: [   18.361036] nouveau  [     MXM][0000:01:00.0]
MXMS Version 3.0
Jan  9 00:27:20 codex kernel: [   18.361084] nouveau  [     PFB][0000:01:00.0]
RAM type: GDDR5
Jan  9 00:27:20 codex kernel: [   18.361087] nouveau  [     PFB][0000:01:00.0]
RAM size: 1536 MiB
Jan  9 00:27:20 codex kernel: [   18.361089] nouveau  [     PFB][0000:01:00.0] 
  ZCOMP: 0 tags
Jan  9 00:27:20 codex kernel: [   18.402251] nouveau  [  PTHERM][0000:01:00.0]
FAN control: none / external
Jan  9 00:27:20 codex kernel: [   18.402262] nouveau  [  PTHERM][0000:01:00.0]
fan management: disabled
Jan  9 00:27:20 codex kernel: [   18.402268] nouveau  [  PTHERM][0000:01:00.0]
internal sensor: yes
Jan  9 00:27:20 codex kernel: [   18.438029] nouveau  [     DRM] VRAM: 1536 MiB
Jan  9 00:27:20 codex kernel: [   18.438030] nouveau  [     DRM] GART: 1048576
MiB
Jan  9 00:27:20 codex kernel: [   18.438034] nouveau  [     DRM] TMDS table
version 2.0
Jan  9 00:27:20 codex kernel: [   18.438036] nouveau  [     DRM] DCB version
4.0
Jan  9 00:27:20 codex kernel: [   18.438038] nouveau  [     DRM] DCB outp 00:
01000313 00010034
Jan  9 00:27:20 codex kernel: [   18.438040] nouveau  [     DRM] DCB outp 07:
08013382 00020030
Jan  9 00:27:20 codex kernel: [   18.438041] nouveau  [     DRM] DCB outp 08:
040383b6 0f220014
Jan  9 00:27:20 codex kernel: [   18.438043] nouveau  [     DRM] DCB outp 11:
02027362 00020010
Jan  9 00:27:20 codex kernel: [   18.438044] nouveau  [     DRM] DCB outp 13:
02013380 00000000
Jan  9 00:27:20 codex kernel: [   18.438046] nouveau  [     DRM] DCB conn 00:
00000040
Jan  9 00:27:20 codex kernel: [   18.438047] nouveau  [     DRM] DCB conn 01:
00001161
Jan  9 00:27:20 codex kernel: [   18.438049] nouveau  [     DRM] DCB conn 02:
00001231
Jan  9 00:27:20 codex kernel: [   18.438050] nouveau  [     DRM] DCB conn 03:
01000330
Jan  9 00:27:20 codex kernel: [   18.438052] nouveau  [     DRM] DCB conn 04:
01000446
Jan  9 00:27:20 codex kernel: [   18.438053] nouveau  [     DRM] DCB conn 05:
02000546
Jan  9 00:27:20 codex kernel: [   18.438054] nouveau  [     DRM] DCB conn 06:
00010661
Jan  9 00:27:20 codex kernel: [   18.438055] nouveau  [     DRM] DCB conn 07:
00010761
Jan  9 00:27:20 codex kernel: [   18.438057] nouveau  [     DRM] DCB conn 08:
00020847
Jan  9 00:27:20 codex kernel: [   18.438059] nouveau  [     DRM] DCB conn 09:
00000900
Jan  9 00:27:20 codex kernel: [   18.439274] nouveau  [     DRM] ACPI backlight
interface available, not registering our own
Jan  9 00:27:20 codex kernel: [   18.439495] nouveau  [     DRM] 3 available
performance level(s)
Jan  9 00:27:20 codex kernel: [   18.439500] nouveau  [     DRM] 0: core 50MHz
shader 101MHz memory 135MHz voltage 820mV
Jan  9 00:27:20 codex kernel: [   18.439504] nouveau  [     DRM] 1: core 202MHz
shader 405MHz memory 324MHz voltage 820mV
Jan  9 00:27:20 codex kernel: [   18.439507] nouveau  [     DRM] 3: core 775MHz
shader 1550MHz memory 1250MHz voltage 1000mV
Jan  9 00:27:20 codex kernel: [   18.439511] nouveau  [     DRM] c: core 202MHz
shader 405MHz memory 324MHz voltage 1000mV
Jan  9 00:27:20 codex kernel: [   18.445776] nouveau  [     DRM] MM: using
COPY1 for buffer copies
Jan  9 00:27:20 codex kernel: [   18.705449] nouveau  [     DRM] allocated
1920x1080 fb: 0x60000, bo ffff88060a4e8000
Jan  9 00:27:20 codex kernel: [   18.706813] fbcon: nouveaufb (fb0) is primary
device
Jan  9 00:27:21 codex kernel: [   20.089762] nouveau 0000:01:00.0: fb0:
nouveaufb frame buffer device
Jan  9 00:27:21 codex kernel: [   20.089768] nouveau 0000:01:00.0: registered
panic notifier
Jan  9 00:27:21 codex kernel: [   20.089773] [drm] Initialized nouveau 1.1.1
20120801 for 0000:01:00.0 on minor 0
Jan  9 00:28:24 codex kernel: [   74.287528] nouveau  [     DRM] suspending
display...
Jan  9 00:28:24 codex kernel: [   74.287549] nouveau  [     DRM] unpinning
framebuffer(s)...
Jan  9 00:28:24 codex kernel: [   74.287678] nouveau  [     DRM] evicting
buffers...
Jan  9 00:28:24 codex kernel: [   74.669560] nouveau  [     DRM] waiting for
kernel channels to go idle...
Jan  9 00:28:24 codex kernel: [   74.669589] nouveau  [     DRM] suspending
client object trees...
Jan  9 00:28:24 codex kernel: [   74.670070] nouveau  [     DRM] suspending
kernel object tree...
Jan  9 00:28:24 codex kernel: [   78.372083] nouveau  [     DRM] re-enabling
device...
Jan  9 00:28:24 codex kernel: [   78.372094] nouveau  [     DRM] resuming
kernel object tree...
Jan  9 00:28:24 codex kernel: [   78.372100] nouveau  [   VBIOS][0000:01:00.0]
running init tables
Jan  9 00:28:24 codex kernel: [   78.599853] nouveau  [     DRM] resuming
client object trees...
Jan  9 00:28:24 codex kernel: [   78.600083] nouveau  [     DRM] resuming
display...
Jan  9 00:28:24 codex kernel: [   80.727990] nouveau E[  PGRAPH][0000:01:00.0]
TRAP ch 2 [0x005fba0000 Xorg[4341]]
Jan  9 00:28:24 codex kernel: [   80.728043] nouveau E[  PGRAPH][0000:01:00.0]
SHADER 0xa004021e
Jan  9 00:28:24 codex kernel: [   80.728120] nouveau E[  PGRAPH][0000:01:00.0]
TRAP ch 2 [0x005fba0000 Xorg[4341]]
Jan  9 00:28:24 codex kernel: [   80.728168] nouveau E[  PGRAPH][0000:01:00.0]
SHADER 0xa004021e
Jan  9 00:28:24 codex kernel: [   80.728251] nouveau E[  PGRAPH][0000:01:00.0]
TRAP ch 2 [0x005fba0000 Xorg[4341]]
Jan  9 00:28:24 codex kernel: [   80.728297] nouveau E[  PGRAPH][0000:01:00.0]
SHADER 0xa004021e
Jan  9 00:28:24 codex kernel: [   80.728434] nouveau E[  PGRAPH][0000:01:00.0]
TRAP ch 2 [0x005fba0000 Xorg[4341]]
Jan  9 00:28:24 codex kernel: [   80.728476] nouveau E[  PGRAPH][0000:01:00.0]
SHADER 0xa004021e
&lt;and so on&gt;</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1389261349.FB71aA1.18312--

--===============1951081788==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1951081788==--
