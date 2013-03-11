From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 62190] New: Invalid ROM contents on PowerMAC G5 11,
 2 with GeForce 6600 LE
Date: Mon, 11 Mar 2013 19:18:00 +0000
Message-ID: <bug-62190-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1737529667=="
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


--===============1737529667==
Content-Type: multipart/alternative; boundary="1363029480.C3DC7F1.20791"; charset="us-ascii"


--1363029480.C3DC7F1.20791
Date: Mon, 11 Mar 2013 19:18:00 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=62190

          Priority: medium
            Bug ID: 62190
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: Invalid ROM contents on PowerMAC G5 11,2 with GeForce
                    6600 LE
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: phileas-fogg-JGs/UdohzUI@public.gmane.org
          Hardware: PowerPC
            Status: NEW
           Version: 7.7 (2011)
         Component: Driver/nouveau
           Product: xorg

I cannot get the nouveau driver to work on my PowerPC G5 11, 2 with NV43
GeForce 6600 LE rev a2.


lspci
------
0000:0a:00.0 VGA compatible controller: nVidia Corporation NV43 [GeForce 6600
LE] (rev a2)


dmesg
------

Linux agpgart interface v0.103
[drm] Initialized drm 1.1.0 20060810
checking generic (98020000 180000) vs hw (98000000 8000000)
fb: conflicting fb hw usage nouveaufb vs OFfb NVDA,Displ - removing generic
driver
Console: switching to colour dummy device 80x25
nouveau  [  DEVICE][0000:0a:00.0] BOOT0  : 0x043200a4
nouveau  [  DEVICE][0000:0a:00.0] Chipset: NV43 (NV43)
nouveau  [  DEVICE][0000:0a:00.0] Family : NV40
nouveau  [   VBIOS][0000:0a:00.0] checking OpenFirmware for image...
nouveau  [   VBIOS][0000:0a:00.0] ... checksum invalid
nouveau  [   VBIOS][0000:0a:00.0] checking PRAMIN for image...
nouveau  [   VBIOS][0000:0a:00.0] ... signature not found
nouveau  [   VBIOS][0000:0a:00.0] checking PROM for image...
nouveau  [   VBIOS][0000:0a:00.0] ... signature not found
nouveau  [   VBIOS][0000:0a:00.0] checking ACPI for image...
nouveau  [   VBIOS][0000:0a:00.0] ... signature not found
nouveau  [   VBIOS][0000:0a:00.0] checking PCIROM for image...
nouveau 0000:0a:00.0: Invalid ROM contents
nouveau  [   VBIOS][0000:0a:00.0] ... signature not found
nouveau  [   VBIOS][0000:0a:00.0] using image from OpenFirmware
nouveau  [   VBIOS][0000:0a:00.0] BIT signature found
nouveau  [   VBIOS][0000:0a:00.0] version 05.43.02.75.00
nouveau  [     PFB][0000:0a:00.0] RAM type: DDR1
nouveau  [     PFB][0000:0a:00.0] RAM size: 128 MiB
nouveau  [     PFB][0000:0a:00.0]    ZCOMP: 378880 tags
nouveau 0000:0a:00.0: Using 32-bit DMA via iommu
[TTM] Zone  kernel: Available graphics memory: 1487676 kiB
[TTM] Initializing pool allocator
nouveau  [     DRM] VRAM: 124 MiB
nouveau  [     DRM] GART: 512 MiB
nouveau  [     DRM] BIT BIOS found
nouveau  [     DRM] Bios version 05.43.02.75
nouveau  [     DRM] TMDS table version 1.1
nouveau  [     DRM] DCB version 3.0
nouveau  [     DRM] DCB outp 00: 01000100 00000028
nouveau  [     DRM] DCB outp 01: 03000102 00000000
nouveau  [     DRM] DCB outp 02: 04011210 00000028
nouveau  [     DRM] DCB outp 03: 02111212 02000100
nouveau  [     DRM] DCB outp 04: 02011211 0020c070
nouveau  [     DRM] DCB conn 00: 1030
nouveau  [     DRM] DCB conn 01: 2130
nouveau  [     I2C][0000:0a:00.0] detected TMDS transmitter: sil164
sil164 7-0038: Detected device 1:6.0
[drm] Supports vblank timestamp caching Rev 1 (10.10.2010).
[drm] No driver support for vblank timestamp query.
nouveau  [     DRM] 0x14CC: Parsing digital output script table
snd-aoa-codec-onyx: created and attached onyx instance
snd-aoa-codec-onyx: created and attached onyx instance
nouveau  [     DRM] 1 available performance level(s)
nouveau  [     DRM] 0: core 300MHz shader 300MHz memory 400MHz fanspeed 100%
nouveau  [     DRM] c: core 300MHz shader 300MHz memory 400MHz fanspeed 100%
nouveau  [     DRM] MM: using M2MF for buffer copies
nouveau  [     DRM] Setting dpms mode 3 on TV encoder (output 4)
nouveau  [     DRM] allocated 1280x1024 fb: 0x9000, bo c00000013ae26c00
nouveau  [     DRM] 0x14CC: Parsing digital output script table
Console: switching to colour frame buffer device 160x64
nouveau 0000:0a:00.0: fb0: nouveaufb frame buffer device
nouveau 0000:0a:00.0: registered panic notifier
[drm] Initialized nouveau 1.1.0 20120801 for 0000:0a:00.0 on minor 0

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1363029480.C3DC7F1.20791
Date: Mon, 11 Mar 2013 19:18:00 +0000
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
   title="NEW --- - Invalid ROM contents on PowerMAC G5 11,2 with GeForce 6600 LE"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=62190">62190</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Invalid ROM contents on PowerMAC G5 11,2 with GeForce 6600 LE
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
          <td>phileas-fogg&#64;mail.ru
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>PowerPC
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
        <pre>I cannot get the nouveau driver to work on my PowerPC G5 11, 2 with NV43
GeForce 6600 LE rev a2.


lspci
------
0000:0a:00.0 VGA compatible controller: nVidia Corporation NV43 [GeForce 6600
LE] (rev a2)


dmesg
------

Linux agpgart interface v0.103
[drm] Initialized drm 1.1.0 20060810
checking generic (98020000 180000) vs hw (98000000 8000000)
fb: conflicting fb hw usage nouveaufb vs OFfb NVDA,Displ - removing generic
driver
Console: switching to colour dummy device 80x25
nouveau  [  DEVICE][0000:0a:00.0] BOOT0  : 0x043200a4
nouveau  [  DEVICE][0000:0a:00.0] Chipset: NV43 (NV43)
nouveau  [  DEVICE][0000:0a:00.0] Family : NV40
nouveau  [   VBIOS][0000:0a:00.0] checking OpenFirmware for image...
nouveau  [   VBIOS][0000:0a:00.0] ... checksum invalid
nouveau  [   VBIOS][0000:0a:00.0] checking PRAMIN for image...
nouveau  [   VBIOS][0000:0a:00.0] ... signature not found
nouveau  [   VBIOS][0000:0a:00.0] checking PROM for image...
nouveau  [   VBIOS][0000:0a:00.0] ... signature not found
nouveau  [   VBIOS][0000:0a:00.0] checking ACPI for image...
nouveau  [   VBIOS][0000:0a:00.0] ... signature not found
nouveau  [   VBIOS][0000:0a:00.0] checking PCIROM for image...
nouveau 0000:0a:00.0: Invalid ROM contents
nouveau  [   VBIOS][0000:0a:00.0] ... signature not found
nouveau  [   VBIOS][0000:0a:00.0] using image from OpenFirmware
nouveau  [   VBIOS][0000:0a:00.0] BIT signature found
nouveau  [   VBIOS][0000:0a:00.0] version 05.43.02.75.00
nouveau  [     PFB][0000:0a:00.0] RAM type: DDR1
nouveau  [     PFB][0000:0a:00.0] RAM size: 128 MiB
nouveau  [     PFB][0000:0a:00.0]    ZCOMP: 378880 tags
nouveau 0000:0a:00.0: Using 32-bit DMA via iommu
[TTM] Zone  kernel: Available graphics memory: 1487676 kiB
[TTM] Initializing pool allocator
nouveau  [     DRM] VRAM: 124 MiB
nouveau  [     DRM] GART: 512 MiB
nouveau  [     DRM] BIT BIOS found
nouveau  [     DRM] Bios version 05.43.02.75
nouveau  [     DRM] TMDS table version 1.1
nouveau  [     DRM] DCB version 3.0
nouveau  [     DRM] DCB outp 00: 01000100 00000028
nouveau  [     DRM] DCB outp 01: 03000102 00000000
nouveau  [     DRM] DCB outp 02: 04011210 00000028
nouveau  [     DRM] DCB outp 03: 02111212 02000100
nouveau  [     DRM] DCB outp 04: 02011211 0020c070
nouveau  [     DRM] DCB conn 00: 1030
nouveau  [     DRM] DCB conn 01: 2130
nouveau  [     I2C][0000:0a:00.0] detected TMDS transmitter: sil164
sil164 7-0038: Detected device 1:6.0
[drm] Supports vblank timestamp caching Rev 1 (10.10.2010).
[drm] No driver support for vblank timestamp query.
nouveau  [     DRM] 0x14CC: Parsing digital output script table
snd-aoa-codec-onyx: created and attached onyx instance
snd-aoa-codec-onyx: created and attached onyx instance
nouveau  [     DRM] 1 available performance level(s)
nouveau  [     DRM] 0: core 300MHz shader 300MHz memory 400MHz fanspeed 100%
nouveau  [     DRM] c: core 300MHz shader 300MHz memory 400MHz fanspeed 100%
nouveau  [     DRM] MM: using M2MF for buffer copies
nouveau  [     DRM] Setting dpms mode 3 on TV encoder (output 4)
nouveau  [     DRM] allocated 1280x1024 fb: 0x9000, bo c00000013ae26c00
nouveau  [     DRM] 0x14CC: Parsing digital output script table
Console: switching to colour frame buffer device 160x64
nouveau 0000:0a:00.0: fb0: nouveaufb frame buffer device
nouveau 0000:0a:00.0: registered panic notifier
[drm] Initialized nouveau 1.1.0 20120801 for 0000:0a:00.0 on minor 0</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1363029480.C3DC7F1.20791--

--===============1737529667==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1737529667==--
