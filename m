From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 76158] New: Nouveau loses console cursor at some
	resolutions
Date: Fri, 14 Mar 2014 07:14:06 +0000
Message-ID: <bug-76158-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0917169418=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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


--===============0917169418==
Content-Type: multipart/alternative; boundary="1394781247.6eE21.4513"; charset="us-ascii"


--1394781247.6eE21.4513
Date: Fri, 14 Mar 2014 07:14:06 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=76158

          Priority: medium
            Bug ID: 76158
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: Nouveau loses console cursor at some resolutions
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: bruce.dubbs-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: 7.7 (2011)
         Component: Driver/nouveau
           Product: xorg

Using kernel 3.13.3, the cursor is not present at the command line (login, bash
prompt, etc).  

From dmesg:

[    0.842547] nouveau  [  DEVICE][0000:01:00.0] Chipset: NV34 (NV34)
[    0.842797] nouveau  [  DEVICE][0000:01:00.0] Family : NV30
[    0.843631] nouveau  [   VBIOS][0000:01:00.0] checking PRAMIN for image...
[    0.901767] nouveau  [   VBIOS][0000:01:00.0] ... appears to be valid
[    0.902026] nouveau  [   VBIOS][0000:01:00.0] using image from PRAMIN
[    0.902277] nouveau  [   VBIOS][0000:01:00.0] BMP version 5.29
[    0.902626] nouveau  [   VBIOS][0000:01:00.0] version 04.34.20.79.00
[    0.903039] nouveau W[  PTIMER][0000:01:00.0] unknown input clock freq
[    0.903296] nouveau  [     PFB][0000:01:00.0] RAM type: DDR1
[    0.903545] nouveau  [     PFB][0000:01:00.0] RAM size: 64 MiB
[    0.903794] nouveau  [     PFB][0000:01:00.0]    ZCOMP: 0 tags
[    0.906062] nouveau  [     CLK][0000:01:00.0] --:   
[    0.906362] [TTM] Zone  kernel: Available graphics memory: 5055574 kiB
[    0.906612] [TTM] Zone   dma32: Available graphics memory: 2097152 kiB
[    0.906863] [TTM] Initializing pool allocator
[    0.907125] [TTM] Initializing DMA pool allocator
[    0.907384] nouveau  [     DRM] VRAM: 63 MiB
[    0.907630] nouveau  [     DRM] GART: 128 MiB
[    0.907877] nouveau  [     DRM] BMP version 5.41
[    0.908134] nouveau  [     DRM] DCB version 2.2
[    0.908382] nouveau  [     DRM] DCB outp 00: 01000300 000088b8
[    0.908631] nouveau  [     DRM] DCB outp 01: 02010310 000088b8
[    0.908880] nouveau  [     DRM] DCB outp 02: 01000302 00000000
[    0.909138] nouveau  [     DRM] DCB outp 03: 04010312 00000000
[    0.909747] nouveau  [     DRM] Saving VGA fonts
[    0.984655] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[    0.984919] [drm] No driver support for vblank timestamp query.
[    0.985212] nouveau  [     DRM] 0xB61E: Parsing digital output script table
[    1.035507] nouveau  [     DRM] 0xB70B: Parsing digital output script table
[    1.086941] nouveau  [     DRM] MM: using M2MF for buffer copies

[    1.120507] nouveau  [     DRM] allocated 1366x768 fb: 0x9000, bo
ffff8802ab977c00
[    1.121096] fbcon: nouveaufb (fb0) is primary device

When passing video=640x480 or 1024x768, everything is fine, but not at the
monitor's native resolution of 1366x768.  There the cursor is invisible.

The cursor returns if the terminal is reset with 'echo -e \\033c', but only
until the next command is issued.  Then the cursor disappears again.

Inside Xorg 7.7, everything is fine.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1394781247.6eE21.4513
Date: Fri, 14 Mar 2014 07:14:07 +0000
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
   title="NEW --- - Nouveau loses console cursor at some resolutions"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=76158">76158</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Nouveau loses console cursor at some resolutions
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
          <td>bruce.dubbs&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86-64 (AMD64)
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>7.7 (2011)
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
        <pre>Using kernel 3.13.3, the cursor is not present at the command line (login, bash
prompt, etc).  

From dmesg:

[    0.842547] nouveau  [  DEVICE][0000:01:00.0] Chipset: NV34 (NV34)
[    0.842797] nouveau  [  DEVICE][0000:01:00.0] Family : NV30
[    0.843631] nouveau  [   VBIOS][0000:01:00.0] checking PRAMIN for image...
[    0.901767] nouveau  [   VBIOS][0000:01:00.0] ... appears to be valid
[    0.902026] nouveau  [   VBIOS][0000:01:00.0] using image from PRAMIN
[    0.902277] nouveau  [   VBIOS][0000:01:00.0] BMP version 5.29
[    0.902626] nouveau  [   VBIOS][0000:01:00.0] version 04.34.20.79.00
[    0.903039] nouveau W[  PTIMER][0000:01:00.0] unknown input clock freq
[    0.903296] nouveau  [     PFB][0000:01:00.0] RAM type: DDR1
[    0.903545] nouveau  [     PFB][0000:01:00.0] RAM size: 64 MiB
[    0.903794] nouveau  [     PFB][0000:01:00.0]    ZCOMP: 0 tags
[    0.906062] nouveau  [     CLK][0000:01:00.0] --:   
[    0.906362] [TTM] Zone  kernel: Available graphics memory: 5055574 kiB
[    0.906612] [TTM] Zone   dma32: Available graphics memory: 2097152 kiB
[    0.906863] [TTM] Initializing pool allocator
[    0.907125] [TTM] Initializing DMA pool allocator
[    0.907384] nouveau  [     DRM] VRAM: 63 MiB
[    0.907630] nouveau  [     DRM] GART: 128 MiB
[    0.907877] nouveau  [     DRM] BMP version 5.41
[    0.908134] nouveau  [     DRM] DCB version 2.2
[    0.908382] nouveau  [     DRM] DCB outp 00: 01000300 000088b8
[    0.908631] nouveau  [     DRM] DCB outp 01: 02010310 000088b8
[    0.908880] nouveau  [     DRM] DCB outp 02: 01000302 00000000
[    0.909138] nouveau  [     DRM] DCB outp 03: 04010312 00000000
[    0.909747] nouveau  [     DRM] Saving VGA fonts
[    0.984655] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[    0.984919] [drm] No driver support for vblank timestamp query.
[    0.985212] nouveau  [     DRM] 0xB61E: Parsing digital output script table
[    1.035507] nouveau  [     DRM] 0xB70B: Parsing digital output script table
[    1.086941] nouveau  [     DRM] MM: using M2MF for buffer copies

[    1.120507] nouveau  [     DRM] allocated 1366x768 fb: 0x9000, bo
ffff8802ab977c00
[    1.121096] fbcon: nouveaufb (fb0) is primary device

When passing video=640x480 or 1024x768, everything is fine, but not at the
monitor's native resolution of 1366x768.  There the cursor is invisible.

The cursor returns if the terminal is reset with 'echo -e \\033c', but only
until the next command is issued.  Then the cursor disappears again.

Inside Xorg 7.7, everything is fine.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1394781247.6eE21.4513--

--===============0917169418==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0917169418==--
