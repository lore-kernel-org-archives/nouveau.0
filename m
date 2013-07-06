From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 66650] New: [regression][NVD0] 'drm/nve0-/gr: some
 new gpc registers can have multiple copies' causes lockups
Date: Sat, 06 Jul 2013 19:13:55 +0000
Message-ID: <bug-66650-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0839058969=="
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


--===============0839058969==
Content-Type: multipart/alternative; boundary="1373138036.Ee681.2907"; charset="us-ascii"


--1373138036.Ee681.2907
Date: Sat, 6 Jul 2013 19:13:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=66650

          Priority: medium
            Bug ID: 66650
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: [regression][NVD0] 'drm/nve0-/gr: some new gpc
                    registers can have multiple copies' causes lockups
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: All
          Reporter: ronald645-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: Other
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

Commit 5ee86c4190f9e in the current tree causes the card to switch to software
fbcon, but only after X is attempted to start.

[    0.291310] nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x0d90a0a1
[    0.291314] nouveau  [  DEVICE][0000:01:00.0] Chipset: GF119 (NVD9)
[    0.291316] nouveau  [  DEVICE][0000:01:00.0] Family : NVD0
[    0.291907] nouveau  [   VBIOS][0000:01:00.0] checking PRAMIN for image...
[    0.365250] nouveau  [   VBIOS][0000:01:00.0] ... appears to be valid
[    0.365253] nouveau  [   VBIOS][0000:01:00.0] using image from PRAMIN
[    0.365455] nouveau  [   VBIOS][0000:01:00.0] BIT signature found
[    0.365459] nouveau  [   VBIOS][0000:01:00.0] version 75.19.55.00.02
[    0.365952] nouveau  [     PFB][0000:01:00.0] RAM type: DDR3
[    0.365955] nouveau  [     PFB][0000:01:00.0] RAM size: 1024 MiB
[    0.365957] nouveau  [     PFB][0000:01:00.0]    ZCOMP: 0 tags
[    0.388914] nouveau  [  PTHERM][0000:01:00.0] FAN control: PWM
[    0.388926] nouveau  [  PTHERM][0000:01:00.0] fan management: disabled
[    0.388931] nouveau  [  PTHERM][0000:01:00.0] internal sensor: yes
[    0.391354] [TTM] Zone  kernel: Available graphics memory: 1025312 kiB
[    0.391356] [TTM] Initializing pool allocator
[    0.391361] [TTM] Initializing DMA pool allocator
[    0.391601] nouveau  [     DRM] VRAM: 1024 MiB
[    0.391606] nouveau  [     DRM] GART: 1048576 MiB
[    0.391612] nouveau  [     DRM] TMDS table version 2.0
[    0.391614] nouveau  [     DRM] DCB version 4.0
[    0.391617] nouveau  [     DRM] DCB outp 00: 02000300 00000000
[    0.391620] nouveau  [     DRM] DCB outp 01: 01000302 00020030
[    0.391623] nouveau  [     DRM] DCB outp 02: 02011362 00020010
[    0.391625] nouveau  [     DRM] DCB outp 03: 04022310 00000000
[    0.391628] nouveau  [     DRM] DCB conn 00: 00001030
[    0.391630] nouveau  [     DRM] DCB conn 01: 00002161
[    0.391632] nouveau  [     DRM] DCB conn 02: 00000200
[    0.392747] [drm] Supports vblank timestamp caching Rev 1 (10.10.2010).
[    0.392749] [drm] No driver support for vblank timestamp query.
[    0.392970] nouveau  [     DRM] 2 available performance level(s)
[    0.392975] nouveau  [     DRM] 1: core 270MHz shader 540MHz memory 405MHz
voltage 900mV
[    0.392979] nouveau  [     DRM] 3: core 810MHz shader 1620MHz memory 500MHz
voltage 1110mV
[    0.392983] nouveau  [     DRM] c: core 270MHz shader 540MHz memory 405MHz
voltage 900mV fanspeed 40%
[    0.396289] nouveau  [     DRM] MM: using COPY0 for buffer copies
[    0.471886] nouveau  [     DRM] allocated 1280x1024 fb: 0x60000, bo
ffff88007cfad000
[    0.471980] fbcon: nouveaufb (fb0) is primary device


A snippets of the logs while failing (taken from rsyslog):

06-07-2013 17:15 .err ::: nouveau E[     DRM] GPU lockup - switching to
software fbcon
06-07-2013 17:15 .warning ::: nouveau W[   PFIFO][0000:01:00.0] INTR
0x00000100: 0x0000000a
06-07-2013 17:15 .warning ::: nouveau W[   PFIFO][0000:01:00.0] INTR
0x00000100: 0x0000000a
06-07-2013 17:15 .warning ::: nouveau W[   PFIFO][0000:01:00.0] INTR
0x00000100: 0x0000000a
06-07-2013 17:15 .warning ::: nouveau W[   PFIFO][0000:01:00.0] INTR
0x00000100: 0x0000000a
06-07-2013 17:15 .warning ::: nouveau W[   PFIFO][0000:01:00.0] INTR
0x00000100: 0x0000000a
06-07-2013 17:15 .warning ::: nouveau W[   PFIFO][0000:01:00.0] INTR
0x00000100: 0x0000000a
06-07-2013 17:15 .warning ::: nouveau W[   PFIFO][0000:01:00.0] INTR
0x00000100: 0x0000000a
06-07-2013 17:15 .warning ::: nouveau W[   PFIFO][0000:01:00.0] INTR
0x00000100: 0x0000000a
06-07-2013 17:15 .warning ::: nouveau W[   PFIFO][0000:01:00.0] INTR
0x00000100: 0x0000000a
06-07-2013 17:15 .err ::: nouveau E[ X[2378]] failed to idle channel 0xcccc0001
[X[2378]]
06-07-2013 17:15 .warning ::: nouveau W[   PFIFO][0000:01:00.0] INTR
0x00000100: 0x0000000a
06-07-2013 17:15 .err ::: nouveau E[ X[2378]] failed to idle channel 0xcccc0001
[X[2378]]
06-07-2013 17:15 .err ::: nouveau E[   PFIFO][0000:01:00.0] playlist update
failed
06-07-2013 17:15 .warning ::: nouveau W[   PFIFO][0000:01:00.0] INTR
0x00000100: 0x0000000a
06-07-2013 17:15 .err ::: nouveau E[ X[2378]] failed to idle channel 0xcccc0000
[X[2378]]
06-07-2013 17:15 .err ::: nouveau E[ X[2378]] failed to idle channel 0xcccc0000
[X[2378]]
06-07-2013 17:15 .warning ::: nouveau W[   PFIFO][0000:01:00.0] INTR
0x00000100: 0x0000000d
06-07-2013 17:15 .err ::: nouveau E[   PFIFO][0000:01:00.0] channel 1 [X[2378]]
kick timeout
06-07-2013 17:15 .warning ::: nouveau W[   PFIFO][0000:01:00.0] INTR
0x00000100: 0x0000000d
06-07-2013 17:15 .err ::: nouveau E[   PFIFO][0000:01:00.0] playlist update
failed
06-07-2013 17:15 .warning ::: nouveau W[   PFIFO][0000:01:00.0] INTR
0x00000001: 0x0000000b
06-07-2013 17:16 .warning ::: nouveau W[   PFIFO][0000:01:00.0] INTR
0x00000100: 0x0000000a
06-07-2013 17:16 .warning ::: nouveau W[   PFIFO][0000:01:00.0] INTR
0x00000100: 0x0000000a
06-07-2013 17:16 .warning ::: nouveau W[   PFIFO][0000:01:00.0] INTR
0x00000100: 0x0000000a
06-07-2013 17:16 .warning ::: nouveau W[   PFIFO][0000:01:00.0] INTR
0x00000100: 0x0000000a
06-07-2013 17:16 .warning ::: nouveau W[   PFIFO][0000:01:00.0] INTR
0x00000100: 0x0000000a
06-07-2013 17:16 .warning ::: nouveau W[   PFIFO][0000:01:00.0] INTR
0x00000100: 0x0000000a
06-07-2013 17:16 .warning ::: nouveau W[   PFIFO][0000:01:00.0] INTR
0x00000100: 0x0000000a
06-07-2013 17:16 .warning ::: nouveau W[   PFIFO][0000:01:00.0] INTR
0x00000100: 0x0000000a
06-07-2013 17:16 .warning ::: nouveau W[   PFIFO][0000:01:00.0] INTR
0x00000100: 0x0000000a
06-07-2013 17:16 .warning ::: nouveau W[   PFIFO][0000:01:00.0] INTR
0x00000100: 0x0000000a
06-07-2013 17:16 .warning ::: nouveau W[   PFIFO][0000:01:00.0] INTR
0x00000100: 0x0000000a
06-07-2013 17:16 .warning ::: nouveau W[   PFIFO][0000:01:00.0] INTR
0x00000100: 0x0000000a
06-07-2013 17:16 .warning ::: nouveau W[   PFIFO][0000:01:00.0] INTR
0x00000100: 0x0000000a
06-07-2013 17:16 .warning ::: nouveau W[   PFIFO][0000:01:00.0] INTR
0x00000100: 0x0000000a
06-07-2013 17:17 .warning ::: nouveau W[   PFIFO][0000:01:00.0] INTR
0x00000100: 0x0000000a
06-07-2013 17:17 .warning ::: nouveau W[   PFIFO][0000:01:00.0] INTR
0x00000100: 0x0000000a
06-07-2013 17:17 .warning ::: nouveau W[   PFIFO][0000:01:00.0] INTR
0x00000100: 0x0000000a
06-07-2013 17:17 .warning ::: nouveau W[   PFIFO][0000:01:00.0] INTR
0x00000100: 0x0000000a
06-07-2013 17:17 .warning ::: nouveau W[   PFIFO][0000:01:00.0] INTR
0x00000100: 0x0000000a
06-07-2013 17:17 .warning ::: nouveau W[   PFIFO][0000:01:00.0] INTR
0x00000100: 0x0000000a
06-07-2013 17:17 .warning ::: nouveau W[   PFIFO][0000:01:00.0] INTR
0x00000100: 0x0000000a

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1373138036.Ee681.2907
Date: Sat, 6 Jul 2013 19:13:56 +0000
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
   title="NEW --- - [regression][NVD0] 'drm/nve0-/gr: some new gpc registers can have multiple copies' causes lockups"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=66650">66650</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[regression][NVD0] 'drm/nve0-/gr: some new gpc registers can have multiple copies' causes lockups
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
          <td>All
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>ronald645&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>Other
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
        <pre>Commit 5ee86c4190f9e in the current tree causes the card to switch to software
fbcon, but only after X is attempted to start.

[    0.291310] nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x0d90a0a1
[    0.291314] nouveau  [  DEVICE][0000:01:00.0] Chipset: GF119 (NVD9)
[    0.291316] nouveau  [  DEVICE][0000:01:00.0] Family : NVD0
[    0.291907] nouveau  [   VBIOS][0000:01:00.0] checking PRAMIN for image...
[    0.365250] nouveau  [   VBIOS][0000:01:00.0] ... appears to be valid
[    0.365253] nouveau  [   VBIOS][0000:01:00.0] using image from PRAMIN
[    0.365455] nouveau  [   VBIOS][0000:01:00.0] BIT signature found
[    0.365459] nouveau  [   VBIOS][0000:01:00.0] version 75.19.55.00.02
[    0.365952] nouveau  [     PFB][0000:01:00.0] RAM type: DDR3
[    0.365955] nouveau  [     PFB][0000:01:00.0] RAM size: 1024 MiB
[    0.365957] nouveau  [     PFB][0000:01:00.0]    ZCOMP: 0 tags
[    0.388914] nouveau  [  PTHERM][0000:01:00.0] FAN control: PWM
[    0.388926] nouveau  [  PTHERM][0000:01:00.0] fan management: disabled
[    0.388931] nouveau  [  PTHERM][0000:01:00.0] internal sensor: yes
[    0.391354] [TTM] Zone  kernel: Available graphics memory: 1025312 kiB
[    0.391356] [TTM] Initializing pool allocator
[    0.391361] [TTM] Initializing DMA pool allocator
[    0.391601] nouveau  [     DRM] VRAM: 1024 MiB
[    0.391606] nouveau  [     DRM] GART: 1048576 MiB
[    0.391612] nouveau  [     DRM] TMDS table version 2.0
[    0.391614] nouveau  [     DRM] DCB version 4.0
[    0.391617] nouveau  [     DRM] DCB outp 00: 02000300 00000000
[    0.391620] nouveau  [     DRM] DCB outp 01: 01000302 00020030
[    0.391623] nouveau  [     DRM] DCB outp 02: 02011362 00020010
[    0.391625] nouveau  [     DRM] DCB outp 03: 04022310 00000000
[    0.391628] nouveau  [     DRM] DCB conn 00: 00001030
[    0.391630] nouveau  [     DRM] DCB conn 01: 00002161
[    0.391632] nouveau  [     DRM] DCB conn 02: 00000200
[    0.392747] [drm] Supports vblank timestamp caching Rev 1 (10.10.2010).
[    0.392749] [drm] No driver support for vblank timestamp query.
[    0.392970] nouveau  [     DRM] 2 available performance level(s)
[    0.392975] nouveau  [     DRM] 1: core 270MHz shader 540MHz memory 405MHz
voltage 900mV
[    0.392979] nouveau  [     DRM] 3: core 810MHz shader 1620MHz memory 500MHz
voltage 1110mV
[    0.392983] nouveau  [     DRM] c: core 270MHz shader 540MHz memory 405MHz
voltage 900mV fanspeed 40%
[    0.396289] nouveau  [     DRM] MM: using COPY0 for buffer copies
[    0.471886] nouveau  [     DRM] allocated 1280x1024 fb: 0x60000, bo
ffff88007cfad000
[    0.471980] fbcon: nouveaufb (fb0) is primary device


A snippets of the logs while failing (taken from rsyslog):

06-07-2013 17:15 .err ::: nouveau E[     DRM] GPU lockup - switching to
software fbcon
06-07-2013 17:15 .warning ::: nouveau W[   PFIFO][0000:01:00.0] INTR
0x00000100: 0x0000000a
06-07-2013 17:15 .warning ::: nouveau W[   PFIFO][0000:01:00.0] INTR
0x00000100: 0x0000000a
06-07-2013 17:15 .warning ::: nouveau W[   PFIFO][0000:01:00.0] INTR
0x00000100: 0x0000000a
06-07-2013 17:15 .warning ::: nouveau W[   PFIFO][0000:01:00.0] INTR
0x00000100: 0x0000000a
06-07-2013 17:15 .warning ::: nouveau W[   PFIFO][0000:01:00.0] INTR
0x00000100: 0x0000000a
06-07-2013 17:15 .warning ::: nouveau W[   PFIFO][0000:01:00.0] INTR
0x00000100: 0x0000000a
06-07-2013 17:15 .warning ::: nouveau W[   PFIFO][0000:01:00.0] INTR
0x00000100: 0x0000000a
06-07-2013 17:15 .warning ::: nouveau W[   PFIFO][0000:01:00.0] INTR
0x00000100: 0x0000000a
06-07-2013 17:15 .warning ::: nouveau W[   PFIFO][0000:01:00.0] INTR
0x00000100: 0x0000000a
06-07-2013 17:15 .err ::: nouveau E[ X[2378]] failed to idle channel 0xcccc0001
[X[2378]]
06-07-2013 17:15 .warning ::: nouveau W[   PFIFO][0000:01:00.0] INTR
0x00000100: 0x0000000a
06-07-2013 17:15 .err ::: nouveau E[ X[2378]] failed to idle channel 0xcccc0001
[X[2378]]
06-07-2013 17:15 .err ::: nouveau E[   PFIFO][0000:01:00.0] playlist update
failed
06-07-2013 17:15 .warning ::: nouveau W[   PFIFO][0000:01:00.0] INTR
0x00000100: 0x0000000a
06-07-2013 17:15 .err ::: nouveau E[ X[2378]] failed to idle channel 0xcccc0000
[X[2378]]
06-07-2013 17:15 .err ::: nouveau E[ X[2378]] failed to idle channel 0xcccc0000
[X[2378]]
06-07-2013 17:15 .warning ::: nouveau W[   PFIFO][0000:01:00.0] INTR
0x00000100: 0x0000000d
06-07-2013 17:15 .err ::: nouveau E[   PFIFO][0000:01:00.0] channel 1 [X[2378]]
kick timeout
06-07-2013 17:15 .warning ::: nouveau W[   PFIFO][0000:01:00.0] INTR
0x00000100: 0x0000000d
06-07-2013 17:15 .err ::: nouveau E[   PFIFO][0000:01:00.0] playlist update
failed
06-07-2013 17:15 .warning ::: nouveau W[   PFIFO][0000:01:00.0] INTR
0x00000001: 0x0000000b
06-07-2013 17:16 .warning ::: nouveau W[   PFIFO][0000:01:00.0] INTR
0x00000100: 0x0000000a
06-07-2013 17:16 .warning ::: nouveau W[   PFIFO][0000:01:00.0] INTR
0x00000100: 0x0000000a
06-07-2013 17:16 .warning ::: nouveau W[   PFIFO][0000:01:00.0] INTR
0x00000100: 0x0000000a
06-07-2013 17:16 .warning ::: nouveau W[   PFIFO][0000:01:00.0] INTR
0x00000100: 0x0000000a
06-07-2013 17:16 .warning ::: nouveau W[   PFIFO][0000:01:00.0] INTR
0x00000100: 0x0000000a
06-07-2013 17:16 .warning ::: nouveau W[   PFIFO][0000:01:00.0] INTR
0x00000100: 0x0000000a
06-07-2013 17:16 .warning ::: nouveau W[   PFIFO][0000:01:00.0] INTR
0x00000100: 0x0000000a
06-07-2013 17:16 .warning ::: nouveau W[   PFIFO][0000:01:00.0] INTR
0x00000100: 0x0000000a
06-07-2013 17:16 .warning ::: nouveau W[   PFIFO][0000:01:00.0] INTR
0x00000100: 0x0000000a
06-07-2013 17:16 .warning ::: nouveau W[   PFIFO][0000:01:00.0] INTR
0x00000100: 0x0000000a
06-07-2013 17:16 .warning ::: nouveau W[   PFIFO][0000:01:00.0] INTR
0x00000100: 0x0000000a
06-07-2013 17:16 .warning ::: nouveau W[   PFIFO][0000:01:00.0] INTR
0x00000100: 0x0000000a
06-07-2013 17:16 .warning ::: nouveau W[   PFIFO][0000:01:00.0] INTR
0x00000100: 0x0000000a
06-07-2013 17:16 .warning ::: nouveau W[   PFIFO][0000:01:00.0] INTR
0x00000100: 0x0000000a
06-07-2013 17:17 .warning ::: nouveau W[   PFIFO][0000:01:00.0] INTR
0x00000100: 0x0000000a
06-07-2013 17:17 .warning ::: nouveau W[   PFIFO][0000:01:00.0] INTR
0x00000100: 0x0000000a
06-07-2013 17:17 .warning ::: nouveau W[   PFIFO][0000:01:00.0] INTR
0x00000100: 0x0000000a
06-07-2013 17:17 .warning ::: nouveau W[   PFIFO][0000:01:00.0] INTR
0x00000100: 0x0000000a
06-07-2013 17:17 .warning ::: nouveau W[   PFIFO][0000:01:00.0] INTR
0x00000100: 0x0000000a
06-07-2013 17:17 .warning ::: nouveau W[   PFIFO][0000:01:00.0] INTR
0x00000100: 0x0000000a
06-07-2013 17:17 .warning ::: nouveau W[   PFIFO][0000:01:00.0] INTR
0x00000100: 0x0000000a</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1373138036.Ee681.2907--

--===============0839058969==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0839058969==--
