From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 72207] New: NV40 / C67 - Pointer to flat panel table
	invalid
Date: Sun, 01 Dec 2013 19:55:33 +0000
Message-ID: <bug-72207-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0181710141=="
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


--===============0181710141==
Content-Type: multipart/alternative; boundary="1385927734.CEa541.30910"; charset="us-ascii"


--1385927734.CEa541.30910
Date: Sun, 1 Dec 2013 19:55:34 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=72207

          Priority: medium
            Bug ID: 72207
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: NV40 / C67 - Pointer to flat panel table invalid
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: All
          Reporter: plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org
          Hardware: Other
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

On Fedora 19 with following kernel (Linux pc 3.11.9-200.fc19.x86_64 #1 SMP Wed
Nov 20 21:22:24), nouveau driver fails to pick up EDID for VGA display:

[snip]
$ dmesg |grep nouveau
[    1.246889] nouveau 0000:00:12.0: setting latency timer to 64
[    1.247414] nouveau  [  DEVICE][0000:00:12.0] BOOT0  : 0x067000a1
[    1.247417] nouveau  [  DEVICE][0000:00:12.0] Chipset: C67 (NV67)
[    1.247419] nouveau  [  DEVICE][0000:00:12.0] Family : NV40
[    1.248133] nouveau  [   VBIOS][0000:00:12.0] checking PRAMIN for image...
[    1.283208] nouveau  [   VBIOS][0000:00:12.0] ... appears to be valid
[    1.283210] nouveau  [   VBIOS][0000:00:12.0] using image from PRAMIN
[    1.283363] nouveau  [   VBIOS][0000:00:12.0] BIT signature found
[    1.283367] nouveau  [   VBIOS][0000:00:12.0] version 05.67.32.25.19
[    1.283497] nouveau  [     PFB][0000:00:12.0] RAM type: unknown
[    1.283499] nouveau  [     PFB][0000:00:12.0] RAM size: 256 MiB
[    1.283501] nouveau  [     PFB][0000:00:12.0]    ZCOMP: 0 tags
[    1.935028] nouveau  [  PTHERM][0000:00:12.0] FAN control: none / external
[    1.935038] nouveau  [  PTHERM][0000:00:12.0] fan management: disabled
[    1.935042] nouveau  [  PTHERM][0000:00:12.0] internal sensor: no
[    1.957382] nouveau  [     DRM] VRAM: 253 MiB
[    1.957384] nouveau  [     DRM] GART: 512 MiB
[    1.957388] nouveau  [     DRM] TMDS table version 1.1
[    1.957390] nouveau W[     DRM] TMDS table script pointers not stubbed
[    1.957392] nouveau  [     DRM] DCB version 3.0
[    1.957395] nouveau  [     DRM] DCB outp 00: 02000310 00000023
[    1.957397] nouveau  [     DRM] DCB outp 01: 04031322 00000080
[    1.957399] nouveau  [     DRM] DCB conn 00: 0000
[    1.957402] nouveau  [     DRM] DCB conn 01: 1161
[    1.957407] nouveau E[     DRM] Pointer to flat panel table invalid
[    1.957702] nouveau  [     DRM] Saving VGA fonts
[    1.993122] nouveau  [     DRM] 0xCFF4: Parsing digital output script table
[    2.044410] nouveau  [     DRM] 1 available performance level(s)
[    2.044415] nouveau  [     DRM] 0: core 425MHz shader 425MHz fanspeed 100%
[    2.044417] nouveau  [     DRM] c: core 39MHz
[    2.046011] nouveau  [     DRM] MM: using M2MF for buffer copies
[    2.163105] nouveau 0000:00:12.0: VGA-1: EDID block 0 invalid.
[    2.163108] nouveau E[     DRM] DDC responded, but no EDID for VGA-1
[    2.216264] nouveau  [     DRM] allocated 1024x768 fb: 0x9000, bo
ffff880037329800
[    2.216347] fbcon: nouveaufb (fb0) is primary device
[    2.248000] nouveau 0000:00:12.0: fb0: nouveaufb frame buffer device
[    2.248015] nouveau 0000:00:12.0: registered panic notifier
[    2.250013] [drm] Initialized nouveau 1.1.1 20120801 for 0000:00:12.0 on
minor 0
[    2.431832] nouveau E[     DRM] DDC responded, but no EDID for VGA-1
[   28.364543] nouveau E[     DRM] DDC responded, but no EDID for VGA-1
[   28.563944] nouveau E[     DRM] DDC responded, but no EDID for VGA-1
[   37.307621] nouveau E[     DRM] DDC responded, but no EDID for VGA-1
[   38.023647] nouveau E[     DRM] DDC responded, but no EDID for VGA-1
[   41.962647] nouveau E[     DRM] DDC responded, but no EDID for VGA-1
[   42.364026] nouveau E[     DRM] DDC responded, but no EDID for VGA-1
[   51.568468] nouveau E[     DRM] DDC responded, but no EDID for VGA-1
[   54.028234] nouveau E[     DRM] DDC responded, but no EDID for VGA-1
[   54.522225] nouveau E[     DRM] DDC responded, but no EDID for VGA-1
[   66.802468] nouveau E[     DRM] DDC responded, but no EDID for VGA-1
[  107.263040] nouveau E[     DRM] DDC responded, but no EDID for VGA-1
[  113.179773] nouveau E[     DRM] DDC responded, but no EDID for VGA-1
[/snip]

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1385927734.CEa541.30910
Date: Sun, 1 Dec 2013 19:55:34 +0000
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
   title="NEW --- - NV40 / C67 - Pointer to flat panel table invalid"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=72207">72207</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>NV40 / C67 - Pointer to flat panel table invalid
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
          <td>plaes&#64;plaes.org
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
        <pre>On Fedora 19 with following kernel (Linux pc 3.11.9-200.fc19.x86_64 #1 SMP Wed
Nov 20 21:22:24), nouveau driver fails to pick up EDID for VGA display:

[snip]
$ dmesg |grep nouveau
[    1.246889] nouveau 0000:00:12.0: setting latency timer to 64
[    1.247414] nouveau  [  DEVICE][0000:00:12.0] BOOT0  : 0x067000a1
[    1.247417] nouveau  [  DEVICE][0000:00:12.0] Chipset: C67 (NV67)
[    1.247419] nouveau  [  DEVICE][0000:00:12.0] Family : NV40
[    1.248133] nouveau  [   VBIOS][0000:00:12.0] checking PRAMIN for image...
[    1.283208] nouveau  [   VBIOS][0000:00:12.0] ... appears to be valid
[    1.283210] nouveau  [   VBIOS][0000:00:12.0] using image from PRAMIN
[    1.283363] nouveau  [   VBIOS][0000:00:12.0] BIT signature found
[    1.283367] nouveau  [   VBIOS][0000:00:12.0] version 05.67.32.25.19
[    1.283497] nouveau  [     PFB][0000:00:12.0] RAM type: unknown
[    1.283499] nouveau  [     PFB][0000:00:12.0] RAM size: 256 MiB
[    1.283501] nouveau  [     PFB][0000:00:12.0]    ZCOMP: 0 tags
[    1.935028] nouveau  [  PTHERM][0000:00:12.0] FAN control: none / external
[    1.935038] nouveau  [  PTHERM][0000:00:12.0] fan management: disabled
[    1.935042] nouveau  [  PTHERM][0000:00:12.0] internal sensor: no
[    1.957382] nouveau  [     DRM] VRAM: 253 MiB
[    1.957384] nouveau  [     DRM] GART: 512 MiB
[    1.957388] nouveau  [     DRM] TMDS table version 1.1
[    1.957390] nouveau W[     DRM] TMDS table script pointers not stubbed
[    1.957392] nouveau  [     DRM] DCB version 3.0
[    1.957395] nouveau  [     DRM] DCB outp 00: 02000310 00000023
[    1.957397] nouveau  [     DRM] DCB outp 01: 04031322 00000080
[    1.957399] nouveau  [     DRM] DCB conn 00: 0000
[    1.957402] nouveau  [     DRM] DCB conn 01: 1161
[    1.957407] nouveau E[     DRM] Pointer to flat panel table invalid
[    1.957702] nouveau  [     DRM] Saving VGA fonts
[    1.993122] nouveau  [     DRM] 0xCFF4: Parsing digital output script table
[    2.044410] nouveau  [     DRM] 1 available performance level(s)
[    2.044415] nouveau  [     DRM] 0: core 425MHz shader 425MHz fanspeed 100%
[    2.044417] nouveau  [     DRM] c: core 39MHz
[    2.046011] nouveau  [     DRM] MM: using M2MF for buffer copies
[    2.163105] nouveau 0000:00:12.0: VGA-1: EDID block 0 invalid.
[    2.163108] nouveau E[     DRM] DDC responded, but no EDID for VGA-1
[    2.216264] nouveau  [     DRM] allocated 1024x768 fb: 0x9000, bo
ffff880037329800
[    2.216347] fbcon: nouveaufb (fb0) is primary device
[    2.248000] nouveau 0000:00:12.0: fb0: nouveaufb frame buffer device
[    2.248015] nouveau 0000:00:12.0: registered panic notifier
[    2.250013] [drm] Initialized nouveau 1.1.1 20120801 for 0000:00:12.0 on
minor 0
[    2.431832] nouveau E[     DRM] DDC responded, but no EDID for VGA-1
[   28.364543] nouveau E[     DRM] DDC responded, but no EDID for VGA-1
[   28.563944] nouveau E[     DRM] DDC responded, but no EDID for VGA-1
[   37.307621] nouveau E[     DRM] DDC responded, but no EDID for VGA-1
[   38.023647] nouveau E[     DRM] DDC responded, but no EDID for VGA-1
[   41.962647] nouveau E[     DRM] DDC responded, but no EDID for VGA-1
[   42.364026] nouveau E[     DRM] DDC responded, but no EDID for VGA-1
[   51.568468] nouveau E[     DRM] DDC responded, but no EDID for VGA-1
[   54.028234] nouveau E[     DRM] DDC responded, but no EDID for VGA-1
[   54.522225] nouveau E[     DRM] DDC responded, but no EDID for VGA-1
[   66.802468] nouveau E[     DRM] DDC responded, but no EDID for VGA-1
[  107.263040] nouveau E[     DRM] DDC responded, but no EDID for VGA-1
[  113.179773] nouveau E[     DRM] DDC responded, but no EDID for VGA-1
[/snip]</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1385927734.CEa541.30910--

--===============0181710141==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0181710141==--
