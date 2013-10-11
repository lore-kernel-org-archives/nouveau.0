From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70388] New: [NV34] failed to idle channel 0xcccc0000
Date: Fri, 11 Oct 2013 19:17:31 +0000
Message-ID: <bug-70388-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1723155344=="
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


--===============1723155344==
Content-Type: multipart/alternative; boundary="1381519051.2Cd743b30.18755"; charset="us-ascii"


--1381519051.2Cd743b30.18755
Date: Fri, 11 Oct 2013 19:17:31 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=70388

          Priority: medium
            Bug ID: 70388
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: [NV34] failed to idle channel 0xcccc0000
          Severity: critical
    Classification: Unclassified
                OS: Linux (All)
          Reporter: rosti.bsd-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: x86 (IA32)
            Status: NEW
           Version: 9.2
         Component: Drivers/DRI/nouveau
           Product: Mesa

I have NV34 FX5500 based AGP videocard. It works properly with old (2D only?)
WM and DE like xfce, lxde and MATE. But with GNOME 3.8, Cinnamon and KDE 4.11
(that use 3D capabilities?) it fails (after 30 seconds upto 2 minutes) with the
"failed to idle channel 0xcccc0000" in the logs. Tested with kernel 3.10 and
3.11 on Fedora 19 and Arch Linux. Also, se following dmesg logs made in Fedora:

[rosti@localhost ~]$ dmesg | grep nouve
[    1.340639] nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x034600b1
[    1.340649] nouveau  [  DEVICE][0000:01:00.0] Chipset: NV34 (NV34)
[    1.340654] nouveau  [  DEVICE][0000:01:00.0] Family : NV30
[    1.342359] nouveau  [   VBIOS][0000:01:00.0] checking PRAMIN for image...
[    1.386401] nouveau  [   VBIOS][0000:01:00.0] ... appears to be valid
[    1.386407] nouveau  [   VBIOS][0000:01:00.0] using image from PRAMIN
[    1.386411] nouveau  [   VBIOS][0000:01:00.0] BMP version 5.28
[    1.386519] nouveau  [   VBIOS][0000:01:00.0] version 04.34.20.69.00
[    1.386757] nouveau W[  PTIMER][0000:01:00.0] unknown input clock freq
[    1.386770] nouveau  [     PFB][0000:01:00.0] RAM type: DDR1
[    1.386776] nouveau  [     PFB][0000:01:00.0] RAM size: 256 MiB
[    1.386781] nouveau  [     PFB][0000:01:00.0]    ZCOMP: 0 tags
[    1.390494] nouveau 0000:01:00.0: putting AGP V3 device into 8x mode
[    1.390625] nouveau  [     DRM] VRAM: 255 MiB
[    1.390629] nouveau  [     DRM] GART: 128 MiB
[    1.390632] nouveau  [     DRM] BMP version 5.40
[    1.390637] nouveau  [     DRM] DCB version 2.2
[    1.390642] nouveau  [     DRM] DCB outp 00: 01000300 000088b8
[    1.390645] nouveau  [     DRM] DCB outp 01: 02010310 000088b8
[    1.390648] nouveau  [     DRM] DCB outp 02: 01010312 00000000
[    1.390652] nouveau  [     DRM] DCB outp 03: 02020321 00000303
[    1.390771] nouveau  [     DRM] Loading NV17 power sequencing microcode
[    1.391050] nouveau  [     DRM] Saving VGA fonts
[    1.438608] nouveau  [     DRM] 0xE078: Parsing digital output script table
[    1.489190] nouveau  [     DRM] 0 available performance level(s)
[    1.489197] nouveau  [     DRM] c: core 249MHz memory 265MHz
[    1.492860] nouveau  [     DRM] MM: using M2MF for buffer copies
[    1.492876] nouveau  [     DRM] Setting dpms mode 3 on TV encoder (output 3)
[    1.555055] nouveau  [     DRM] allocated 1920x1080 fb: 0x9000, bo f71f5200
[    1.555164] fbcon: nouveaufb (fb0) is primary device
[    1.584535] nouveau 0000:01:00.0: fb0: nouveaufb frame buffer device
[    1.584541] nouveau 0000:01:00.0: registered panic notifier
[    1.586481] [drm] Initialized nouveau 1.1.1 20120801 for 0000:01:00.0 on
minor 0

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1381519051.2Cd743b30.18755
Date: Fri, 11 Oct 2013 19:17:31 +0000
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
   title="NEW --- - [NV34] failed to idle channel 0xcccc0000"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70388">70388</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[NV34] failed to idle channel 0xcccc0000
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>critical
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
          <td>rosti.bsd&#64;gmail.com
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
          <td>9.2
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Drivers/DRI/nouveau
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr></table>
      <p>
        <div>
        <pre>I have NV34 FX5500 based AGP videocard. It works properly with old (2D only?)
WM and DE like xfce, lxde and MATE. But with GNOME 3.8, Cinnamon and KDE 4.11
(that use 3D capabilities?) it fails (after 30 seconds upto 2 minutes) with the
&quot;failed to idle channel 0xcccc0000&quot; in the logs. Tested with kernel 3.10 and
3.11 on Fedora 19 and Arch Linux. Also, se following dmesg logs made in Fedora:

[rosti&#64;localhost ~]$ dmesg | grep nouve
[    1.340639] nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x034600b1
[    1.340649] nouveau  [  DEVICE][0000:01:00.0] Chipset: NV34 (NV34)
[    1.340654] nouveau  [  DEVICE][0000:01:00.0] Family : NV30
[    1.342359] nouveau  [   VBIOS][0000:01:00.0] checking PRAMIN for image...
[    1.386401] nouveau  [   VBIOS][0000:01:00.0] ... appears to be valid
[    1.386407] nouveau  [   VBIOS][0000:01:00.0] using image from PRAMIN
[    1.386411] nouveau  [   VBIOS][0000:01:00.0] BMP version 5.28
[    1.386519] nouveau  [   VBIOS][0000:01:00.0] version 04.34.20.69.00
[    1.386757] nouveau W[  PTIMER][0000:01:00.0] unknown input clock freq
[    1.386770] nouveau  [     PFB][0000:01:00.0] RAM type: DDR1
[    1.386776] nouveau  [     PFB][0000:01:00.0] RAM size: 256 MiB
[    1.386781] nouveau  [     PFB][0000:01:00.0]    ZCOMP: 0 tags
[    1.390494] nouveau 0000:01:00.0: putting AGP V3 device into 8x mode
[    1.390625] nouveau  [     DRM] VRAM: 255 MiB
[    1.390629] nouveau  [     DRM] GART: 128 MiB
[    1.390632] nouveau  [     DRM] BMP version 5.40
[    1.390637] nouveau  [     DRM] DCB version 2.2
[    1.390642] nouveau  [     DRM] DCB outp 00: 01000300 000088b8
[    1.390645] nouveau  [     DRM] DCB outp 01: 02010310 000088b8
[    1.390648] nouveau  [     DRM] DCB outp 02: 01010312 00000000
[    1.390652] nouveau  [     DRM] DCB outp 03: 02020321 00000303
[    1.390771] nouveau  [     DRM] Loading NV17 power sequencing microcode
[    1.391050] nouveau  [     DRM] Saving VGA fonts
[    1.438608] nouveau  [     DRM] 0xE078: Parsing digital output script table
[    1.489190] nouveau  [     DRM] 0 available performance level(s)
[    1.489197] nouveau  [     DRM] c: core 249MHz memory 265MHz
[    1.492860] nouveau  [     DRM] MM: using M2MF for buffer copies
[    1.492876] nouveau  [     DRM] Setting dpms mode 3 on TV encoder (output 3)
[    1.555055] nouveau  [     DRM] allocated 1920x1080 fb: 0x9000, bo f71f5200
[    1.555164] fbcon: nouveaufb (fb0) is primary device
[    1.584535] nouveau 0000:01:00.0: fb0: nouveaufb frame buffer device
[    1.584541] nouveau 0000:01:00.0: registered panic notifier
[    1.586481] [drm] Initialized nouveau 1.1.1 20120801 for 0000:01:00.0 on
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

--1381519051.2Cd743b30.18755--

--===============1723155344==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1723155344==--
