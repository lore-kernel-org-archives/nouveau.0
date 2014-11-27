From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 86792] New: [NVC0] Portal 2 Crashes in Wine
Date: Thu, 27 Nov 2014 16:37:45 +0000
Message-ID: <bug-86792-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0156136479=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0156136479==
Content-Type: multipart/alternative; boundary="1417106264.aac20.4343"; charset="UTF-8"


--1417106264.aac20.4343
Date: Thu, 27 Nov 2014 16:37:44 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=86792

            Bug ID: 86792
           Summary: [NVC0] Portal 2 Crashes in Wine
           Product: Mesa
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: anonymous-IjDkMZObD1hBDgjK7y7TUQ@public.gmane.org

Created attachment 110131
  --> https://bugs.freedesktop.org/attachment.cgi?id=110131&action=edit
=>0 0xf61ee384 in nouveau_dri.so (+0x23c384) (0x7de0bab8)

I was told to file a bug here by Wine HQ as an upstream bug. 
Any  Portal2 level that contains several moving objects crashes. 
Unfortunately there is no output in dmesg of this crash, only in Wine. 

Here is my dmesg, and attached is the wine crash.
...............
user@user-desktop:~/.wine/drive_c/Program Files (x86)/Games/Portal 2$ dmesg |
grep nouveau
[    1.900701] nouveau  [  DEVICE][0000:02:00.0] BOOT0  : 0x0c0200a3
[    1.900703] nouveau  [  DEVICE][0000:02:00.0] Chipset: GF100 (NVC0)
[    1.900705] nouveau  [  DEVICE][0000:02:00.0] Family : NVC0
[    1.902346] nouveau  [   VBIOS][0000:02:00.0] checking PRAMIN for image...
[    2.000141] nouveau  [   VBIOS][0000:02:00.0] ... appears to be valid
[    2.000144] nouveau  [   VBIOS][0000:02:00.0] using image from PRAMIN
[    2.000232] nouveau  [   VBIOS][0000:02:00.0] BIT signature found
[    2.000234] nouveau  [   VBIOS][0000:02:00.0] version 70.00.21.00.04
[    2.022479] nouveau 0000:02:00.0: irq 44 for MSI/MSI-X
[    2.022488] nouveau  [     PMC][0000:02:00.0] MSI interrupts enabled
[    2.022564] nouveau  [     PFB][0000:02:00.0] RAM type: GDDR5
[    2.022567] nouveau  [     PFB][0000:02:00.0] RAM size: 1024 MiB
[    2.022569] nouveau  [     PFB][0000:02:00.0]    ZCOMP: 0 tags
[    2.031537] nouveau  [    VOLT][0000:02:00.0] GPU voltage: 875000uv
[    2.056695] nouveau  [  PTHERM][0000:02:00.0] FAN control: none / external
[    2.056700] nouveau  [  PTHERM][0000:02:00.0] fan management: automatic
[    2.056703] nouveau  [  PTHERM][0000:02:00.0] internal sensor: yes
[    2.056724] nouveau  [     CLK][0000:02:00.0] 03: core 50 MHz memory 135 MHz 
[    2.056726] nouveau  [     CLK][0000:02:00.0] 07: core 405 MHz memory 324
MHz 
[    2.056729] nouveau  [     CLK][0000:02:00.0] 0c: core 405 MHz memory 1603
MHz 
[    2.056731] nouveau  [     CLK][0000:02:00.0] 0f: core 607 MHz memory 1603
MHz 
[    2.056805] nouveau  [     CLK][0000:02:00.0] --: core 50 MHz memory 135 MHz 
[    2.067505] nouveau  [     DRM] VRAM: 1024 MiB
[    2.067507] nouveau  [     DRM] GART: 1048576 MiB
[    2.067511] nouveau  [     DRM] TMDS table version 2.0
[    2.067513] nouveau  [     DRM] DCB version 4.0
[    2.067516] nouveau  [     DRM] DCB outp 00: 02000300 00000000
[    2.067519] nouveau  [     DRM] DCB outp 01: 01000302 00020030
[    2.067521] nouveau  [     DRM] DCB outp 02: 04011380 00000000
[    2.067524] nouveau  [     DRM] DCB outp 03: 08011382 00020030
[    2.067526] nouveau  [     DRM] DCB outp 04: 02022362 00020010
[    2.067528] nouveau  [     DRM] DCB conn 00: 00001030
[    2.067531] nouveau  [     DRM] DCB conn 01: 00010130
[    2.067534] nouveau  [     DRM] DCB conn 02: 00002261
[    2.084736] nouveau  [     DRM] MM: using COPY1 for buffer copies
[    2.281264] nouveau  [     DRM] allocated 1440x900 fb: 0x60000, bo
ffff8801a1214400
[    2.281462] fbcon: nouveaufb (fb0) is primary device
[    2.342390] nouveau 0000:02:00.0: fb0: nouveaufb frame buffer device
[    2.342392] nouveau 0000:02:00.0: registered panic notifier
[    2.342396] [drm] Initialized nouveau 1.1.2 20120801 for 0000:02:00.0 on
minor 0

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1417106264.aac20.4343
Date: Thu, 27 Nov 2014 16:37:44 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><table border="1" cellspacing="0" cellpadding="8">
        <tr>
          <th>Bug ID</th>
          <td><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVC0] Portal 2 Crashes in Wine"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=86792">86792</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[NVC0] Portal 2 Crashes in Wine
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>unspecified
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86-64 (AMD64)
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>All
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>normal
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Drivers/DRI/nouveau
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>anonymous&#64;dodgeit.com
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=110131" name="attach_110131" title="=&gt;0 0xf61ee384 in nouveau_dri.so (+0x23c384) (0x7de0bab8)">attachment 110131</a> <a href="attachment.cgi?id=110131&amp;action=edit" title="=&gt;0 0xf61ee384 in nouveau_dri.so (+0x23c384) (0x7de0bab8)">[details]</a></span>
=&gt;0 0xf61ee384 in nouveau_dri.so (+0x23c384) (0x7de0bab8)

I was told to file a bug here by Wine HQ as an upstream bug. 
Any  Portal2 level that contains several moving objects crashes. 
Unfortunately there is no output in dmesg of this crash, only in Wine. 

Here is my dmesg, and attached is the wine crash.
...............
user&#64;user-desktop:~/.wine/drive_c/Program Files (x86)/Games/Portal 2$ dmesg |
grep nouveau
[    1.900701] nouveau  [  DEVICE][0000:02:00.0] BOOT0  : 0x0c0200a3
[    1.900703] nouveau  [  DEVICE][0000:02:00.0] Chipset: GF100 (NVC0)
[    1.900705] nouveau  [  DEVICE][0000:02:00.0] Family : NVC0
[    1.902346] nouveau  [   VBIOS][0000:02:00.0] checking PRAMIN for image...
[    2.000141] nouveau  [   VBIOS][0000:02:00.0] ... appears to be valid
[    2.000144] nouveau  [   VBIOS][0000:02:00.0] using image from PRAMIN
[    2.000232] nouveau  [   VBIOS][0000:02:00.0] BIT signature found
[    2.000234] nouveau  [   VBIOS][0000:02:00.0] version 70.00.21.00.04
[    2.022479] nouveau 0000:02:00.0: irq 44 for MSI/MSI-X
[    2.022488] nouveau  [     PMC][0000:02:00.0] MSI interrupts enabled
[    2.022564] nouveau  [     PFB][0000:02:00.0] RAM type: GDDR5
[    2.022567] nouveau  [     PFB][0000:02:00.0] RAM size: 1024 MiB
[    2.022569] nouveau  [     PFB][0000:02:00.0]    ZCOMP: 0 tags
[    2.031537] nouveau  [    VOLT][0000:02:00.0] GPU voltage: 875000uv
[    2.056695] nouveau  [  PTHERM][0000:02:00.0] FAN control: none / external
[    2.056700] nouveau  [  PTHERM][0000:02:00.0] fan management: automatic
[    2.056703] nouveau  [  PTHERM][0000:02:00.0] internal sensor: yes
[    2.056724] nouveau  [     CLK][0000:02:00.0] 03: core 50 MHz memory 135 MHz 
[    2.056726] nouveau  [     CLK][0000:02:00.0] 07: core 405 MHz memory 324
MHz 
[    2.056729] nouveau  [     CLK][0000:02:00.0] 0c: core 405 MHz memory 1603
MHz 
[    2.056731] nouveau  [     CLK][0000:02:00.0] 0f: core 607 MHz memory 1603
MHz 
[    2.056805] nouveau  [     CLK][0000:02:00.0] --: core 50 MHz memory 135 MHz 
[    2.067505] nouveau  [     DRM] VRAM: 1024 MiB
[    2.067507] nouveau  [     DRM] GART: 1048576 MiB
[    2.067511] nouveau  [     DRM] TMDS table version 2.0
[    2.067513] nouveau  [     DRM] DCB version 4.0
[    2.067516] nouveau  [     DRM] DCB outp 00: 02000300 00000000
[    2.067519] nouveau  [     DRM] DCB outp 01: 01000302 00020030
[    2.067521] nouveau  [     DRM] DCB outp 02: 04011380 00000000
[    2.067524] nouveau  [     DRM] DCB outp 03: 08011382 00020030
[    2.067526] nouveau  [     DRM] DCB outp 04: 02022362 00020010
[    2.067528] nouveau  [     DRM] DCB conn 00: 00001030
[    2.067531] nouveau  [     DRM] DCB conn 01: 00010130
[    2.067534] nouveau  [     DRM] DCB conn 02: 00002261
[    2.084736] nouveau  [     DRM] MM: using COPY1 for buffer copies
[    2.281264] nouveau  [     DRM] allocated 1440x900 fb: 0x60000, bo
ffff8801a1214400
[    2.281462] fbcon: nouveaufb (fb0) is primary device
[    2.342390] nouveau 0000:02:00.0: fb0: nouveaufb frame buffer device
[    2.342392] nouveau 0000:02:00.0: registered panic notifier
[    2.342396] [drm] Initialized nouveau 1.1.2 20120801 for 0000:02:00.0 on
minor 0</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1417106264.aac20.4343--

--===============0156136479==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0156136479==--
