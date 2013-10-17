From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70566] New: NVD0 card hard lock-ups entire system at
 random moments
Date: Thu, 17 Oct 2013 07:37:47 +0000
Message-ID: <bug-70566-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0242421882=="
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


--===============0242421882==
Content-Type: multipart/alternative; boundary="1381995467.4E6bA071.16865"; charset="us-ascii"


--1381995467.4E6bA071.16865
Date: Thu, 17 Oct 2013 07:37:47 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=70566

          Priority: medium
            Bug ID: 70566
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: NVD0 card hard lock-ups entire system at random
                    moments
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: All
          Reporter: ronald645-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: Other
            Status: NEW
           Version: git
         Component: Driver/nouveau
           Product: xorg

My card is a GF119 (NVD9). A relatively new card on an aged board (Asus A8N-E).

It seems to lock-up at random moments, Magic SysRq does nothing. Only a hard
reboot is possible.

Sometimes it happens when the contents of the screen is changing, sometimes
not. I found it to have locked after an idle period a couple of times.

I'm currently testing the nvidia proprietary blob after swapping out RAM (which
was not it). This all started after I swapped this card for another broken
nVidia card. But I figured it might be coincidence.

If the nvidia proprietary driver proofs to not suffer from this issue. I will
try to test the nouveau driver with as many features disabled (e.g. PCIE) and
see if that helps.

Any suggestions are really welcome.

Card specs below.

16-10-2013 20:58 .info ::: nouveau  [  DEVICE][0000:01:00.0] BOOT0  :
0x0d90a0a1
16-10-2013 20:58 .info ::: nouveau  [  DEVICE][0000:01:00.0] Chipset: GF119
(NVD9)
16-10-2013 20:58 .info ::: nouveau  [  DEVICE][0000:01:00.0] Family : NVD0
16-10-2013 20:58 .info ::: nouveau  [   VBIOS][0000:01:00.0] checking PRAMIN
for image...
16-10-2013 20:58 .info ::: nouveau  [   VBIOS][0000:01:00.0] ... appears to be
valid
16-10-2013 20:58 .info ::: nouveau  [   VBIOS][0000:01:00.0] using image from
PRAMIN
16-10-2013 20:58 .info ::: nouveau  [   VBIOS][0000:01:00.0] BIT signature
found
16-10-2013 20:58 .info ::: nouveau  [   VBIOS][0000:01:00.0] version
75.19.55.00.02
16-10-2013 20:58 .debug ::: nouveau 0000:01:00.0: irq 44 for MSI/MSI-X
16-10-2013 20:58 .info ::: nouveau  [     PMC][0000:01:00.0] MSI interrupts
enabled
16-10-2013 20:58 .info ::: nouveau  [     PFB][0000:01:00.0] RAM type: DDR3
16-10-2013 20:58 .info ::: nouveau  [     PFB][0000:01:00.0] RAM size: 1024 MiB
16-10-2013 20:58 .info ::: nouveau  [     PFB][0000:01:00.0]    ZCOMP: 0 tags
16-10-2013 20:58 .info ::: nouveau  [  PTHERM][0000:01:00.0] FAN control: PWM
16-10-2013 20:58 .info ::: nouveau  [  PTHERM][0000:01:00.0] fan management:
disabled
16-10-2013 20:58 .info ::: nouveau  [  PTHERM][0000:01:00.0] internal sensor:
yes
16-10-2013 20:58 .info ::: [TTM] Zone  kernel: Available graphics memory:
509984 kiB
16-10-2013 20:58 .info ::: [TTM] Initializing pool allocator
16-10-2013 20:58 .info ::: [TTM] Initializing DMA pool allocator
16-10-2013 20:58 .info ::: nouveau  [     DRM] VRAM: 1024 MiB
16-10-2013 20:58 .info ::: nouveau  [     DRM] GART: 1048576 MiB
16-10-2013 20:58 .info ::: nouveau  [     DRM] TMDS table version 2.0
16-10-2013 20:58 .info ::: nouveau  [     DRM] DCB version 4.0
16-10-2013 20:58 .info ::: nouveau  [     DRM] DCB outp 00: 02000300 00000000
16-10-2013 20:58 .info ::: nouveau  [     DRM] DCB outp 01: 01000302 00020030
16-10-2013 20:58 .info ::: nouveau  [     DRM] DCB outp 02: 02011362 00020010
16-10-2013 20:58 .info ::: nouveau  [     DRM] DCB outp 03: 04022310 00000000
16-10-2013 20:58 .info ::: nouveau  [     DRM] DCB conn 00: 00001030
16-10-2013 20:58 .info ::: nouveau  [     DRM] DCB conn 01: 00002161
16-10-2013 20:58 .info ::: nouveau  [     DRM] DCB conn 02: 00000200
16-10-2013 20:58 .info ::: [drm] Supports vblank timestamp caching Rev 1
(10.10.2010).
16-10-2013 20:58 .info ::: [drm] No driver support for vblank timestamp query.
16-10-2013 20:58 .info ::: nouveau  [     DRM] 2 available performance level(s)
16-10-2013 20:58 .info ::: nouveau  [     DRM] 1: core 270MHz shader 540MHz
memory 405MHz voltage 900mV
16-10-2013 20:58 .info ::: nouveau  [     DRM] 3: core 810MHz shader 1620MHz
memory 500MHz voltage 1110mV
16-10-2013 20:58 .info ::: nouveau  [     DRM] c: core 270MHz shader 540MHz
memory 405MHz voltage 900mV fanspeed 40%
16-10-2013 20:58 .info ::: nouveau  [     DRM] MM: using COPY0 for buffer
copies
16-10-2013 20:58 .info ::: nouveau  [     DRM] allocated 1280x1024 fb: 0x60000,
bo ffff88003dc5c000
16-10-2013 20:58 .info ::: fbcon: nouveaufb (fb0) is primary device

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1381995467.4E6bA071.16865
Date: Thu, 17 Oct 2013 07:37:47 +0000
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
   title="NEW --- - NVD0 card hard lock-ups entire system at random moments"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70566">70566</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>NVD0 card hard lock-ups entire system at random moments
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
          <td>git
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
        <pre>My card is a GF119 (NVD9). A relatively new card on an aged board (Asus A8N-E).

It seems to lock-up at random moments, Magic SysRq does nothing. Only a hard
reboot is possible.

Sometimes it happens when the contents of the screen is changing, sometimes
not. I found it to have locked after an idle period a couple of times.

I'm currently testing the nvidia proprietary blob after swapping out RAM (which
was not it). This all started after I swapped this card for another broken
nVidia card. But I figured it might be coincidence.

If the nvidia proprietary driver proofs to not suffer from this issue. I will
try to test the nouveau driver with as many features disabled (e.g. PCIE) and
see if that helps.

Any suggestions are really welcome.

Card specs below.

16-10-2013 20:58 .info ::: nouveau  [  DEVICE][0000:01:00.0] BOOT0  :
0x0d90a0a1
16-10-2013 20:58 .info ::: nouveau  [  DEVICE][0000:01:00.0] Chipset: GF119
(NVD9)
16-10-2013 20:58 .info ::: nouveau  [  DEVICE][0000:01:00.0] Family : NVD0
16-10-2013 20:58 .info ::: nouveau  [   VBIOS][0000:01:00.0] checking PRAMIN
for image...
16-10-2013 20:58 .info ::: nouveau  [   VBIOS][0000:01:00.0] ... appears to be
valid
16-10-2013 20:58 .info ::: nouveau  [   VBIOS][0000:01:00.0] using image from
PRAMIN
16-10-2013 20:58 .info ::: nouveau  [   VBIOS][0000:01:00.0] BIT signature
found
16-10-2013 20:58 .info ::: nouveau  [   VBIOS][0000:01:00.0] version
75.19.55.00.02
16-10-2013 20:58 .debug ::: nouveau 0000:01:00.0: irq 44 for MSI/MSI-X
16-10-2013 20:58 .info ::: nouveau  [     PMC][0000:01:00.0] MSI interrupts
enabled
16-10-2013 20:58 .info ::: nouveau  [     PFB][0000:01:00.0] RAM type: DDR3
16-10-2013 20:58 .info ::: nouveau  [     PFB][0000:01:00.0] RAM size: 1024 MiB
16-10-2013 20:58 .info ::: nouveau  [     PFB][0000:01:00.0]    ZCOMP: 0 tags
16-10-2013 20:58 .info ::: nouveau  [  PTHERM][0000:01:00.0] FAN control: PWM
16-10-2013 20:58 .info ::: nouveau  [  PTHERM][0000:01:00.0] fan management:
disabled
16-10-2013 20:58 .info ::: nouveau  [  PTHERM][0000:01:00.0] internal sensor:
yes
16-10-2013 20:58 .info ::: [TTM] Zone  kernel: Available graphics memory:
509984 kiB
16-10-2013 20:58 .info ::: [TTM] Initializing pool allocator
16-10-2013 20:58 .info ::: [TTM] Initializing DMA pool allocator
16-10-2013 20:58 .info ::: nouveau  [     DRM] VRAM: 1024 MiB
16-10-2013 20:58 .info ::: nouveau  [     DRM] GART: 1048576 MiB
16-10-2013 20:58 .info ::: nouveau  [     DRM] TMDS table version 2.0
16-10-2013 20:58 .info ::: nouveau  [     DRM] DCB version 4.0
16-10-2013 20:58 .info ::: nouveau  [     DRM] DCB outp 00: 02000300 00000000
16-10-2013 20:58 .info ::: nouveau  [     DRM] DCB outp 01: 01000302 00020030
16-10-2013 20:58 .info ::: nouveau  [     DRM] DCB outp 02: 02011362 00020010
16-10-2013 20:58 .info ::: nouveau  [     DRM] DCB outp 03: 04022310 00000000
16-10-2013 20:58 .info ::: nouveau  [     DRM] DCB conn 00: 00001030
16-10-2013 20:58 .info ::: nouveau  [     DRM] DCB conn 01: 00002161
16-10-2013 20:58 .info ::: nouveau  [     DRM] DCB conn 02: 00000200
16-10-2013 20:58 .info ::: [drm] Supports vblank timestamp caching Rev 1
(10.10.2010).
16-10-2013 20:58 .info ::: [drm] No driver support for vblank timestamp query.
16-10-2013 20:58 .info ::: nouveau  [     DRM] 2 available performance level(s)
16-10-2013 20:58 .info ::: nouveau  [     DRM] 1: core 270MHz shader 540MHz
memory 405MHz voltage 900mV
16-10-2013 20:58 .info ::: nouveau  [     DRM] 3: core 810MHz shader 1620MHz
memory 500MHz voltage 1110mV
16-10-2013 20:58 .info ::: nouveau  [     DRM] c: core 270MHz shader 540MHz
memory 405MHz voltage 900mV fanspeed 40%
16-10-2013 20:58 .info ::: nouveau  [     DRM] MM: using COPY0 for buffer
copies
16-10-2013 20:58 .info ::: nouveau  [     DRM] allocated 1280x1024 fb: 0x60000,
bo ffff88003dc5c000
16-10-2013 20:58 .info ::: fbcon: nouveaufb (fb0) is primary device</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1381995467.4E6bA071.16865--

--===============0242421882==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0242421882==--
