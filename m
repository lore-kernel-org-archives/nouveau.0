From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 101164] New: nouveau 0000:01:00.0: DRM: failed to
 create kernel channel, -22
Date: Wed, 24 May 2017 09:22:04 +0000
Message-ID: <bug-101164-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1562731110=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1562731110==
Content-Type: multipart/alternative; boundary="14956177240.B4dd.7934";
 charset="UTF-8"


--14956177240.B4dd.7934
Date: Wed, 24 May 2017 09:22:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D101164

            Bug ID: 101164
           Summary: nouveau 0000:01:00.0: DRM: failed to create kernel
                    channel, -22
           Product: Mesa
           Version: 17.1
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: pachoramos1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

Created attachment 131463
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D131463&action=3Dedit
dmesg

I see this error in dmesg output:
nouveau 0000:01:00.0: DRM: failed to create kernel channel, -22

This message is shown between this:
[    0.990005] VGA switcheroo: detected Optimus DSM method \_SB_.PCI0.PEG0.=
PEGP
handle
[    0.990006] nouveau: detected PR support, will not use DSM
[    0.990037] nouveau 0000:01:00.0: enabling device (0004 -> 0007)
[    0.990171] nouveau 0000:01:00.0: NVIDIA GP107 (137000a1)
[    1.025754] nouveau 0000:01:00.0: bios: version 86.07.3c.00.60
[    1.082353] nouveau 0000:01:00.0: priv: HUB0: 00d054 00000007 (1a408216)
[    1.082358] nouveau 0000:01:00.0: fb: 4096 MiB GDDR5
[    1.084171] vga_switcheroo: enabled
[    1.084254] [TTM] Zone  kernel: Available graphics memory: 8033790 kiB
[    1.084254] [TTM] Zone   dma32: Available graphics memory: 2097152 kiB
[    1.084255] [TTM] Initializing pool allocator
[    1.084257] [TTM] Initializing DMA pool allocator
[    1.084265] nouveau 0000:01:00.0: DRM: VRAM: 4096 MiB
[    1.084266] nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
[    1.084267] nouveau 0000:01:00.0: DRM: BIT table 'A' not found
[    1.084268] nouveau 0000:01:00.0: DRM: BIT table 'L' not found
[    1.084269] nouveau 0000:01:00.0: DRM: TMDS table version 2.0
[    1.084270] nouveau 0000:01:00.0: DRM: DCB version 4.1
[    1.084272] nouveau 0000:01:00.0: DRM: DCB outp 00: 02022f62 00020010
[    1.084273] nouveau 0000:01:00.0: DRM: DCB conn 02: 00010261
[    1.084274] nouveau 0000:01:00.0: DRM: DCB conn 04: 01000446
[    1.084275] nouveau 0000:01:00.0: DRM: DCB conn 05: 02000546
[    1.084276] nouveau 0000:01:00.0: DRM: Pointer to flat panel table inval=
id
[    1.107611] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[    1.107612] [drm] Driver supports precise vblank timestamp query.
[    1.267495] fbcon: inteldrmfb (fb0) is primary device
[    1.425033] nouveau 0000:01:00.0: DRM: failed to create kernel channel, =
-22
[    1.426516] [drm] Cannot find any crtc or sizes - going 1024x768
[    1.428296] nouveau 0000:01:00.0: DRM: allocated 1024x768 fb: 0x60000, bo
ffff88046c748000
[    1.668461] clocksource: Switched to clocksource tsc
[    2.406679] Console: switching to colour frame buffer device 240x67
[    2.423231] i915 0000:00:02.0: fb0: inteldrmfb frame buffer device
[    2.423357] nouveau 0000:01:00.0: fb1: nouveaufb frame buffer device
[    2.423364] [drm] Initialized nouveau 1.3.1 20120801 for 0000:01:00.0 on
minor 1

I am running kernel-4.11.2 and xorg-server-1.19.3. I attach the full dmesg
output and config file

Thanks a lot for your help

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--14956177240.B4dd.7934
Date: Wed, 24 May 2017 09:22:04 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
        <tr>
          <th>Bug ID</th>
          <td><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - nouveau 0000:01:00.0: DRM: failed to create kernel channe=
l, -22"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101164">101164</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>nouveau 0000:01:00.0: DRM: failed to create kernel channel, -=
22
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>17.1
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>Other
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
          <td>pachoramos1&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D131463=
" name=3D"attach_131463" title=3D"dmesg">attachment 131463</a> <a href=3D"a=
ttachment.cgi?id=3D131463&amp;action=3Dedit" title=3D"dmesg">[details]</a><=
/span>
dmesg

I see this error in dmesg output:
nouveau 0000:01:00.0: DRM: failed to create kernel channel, -22

This message is shown between this:
[    0.990005] VGA switcheroo: detected Optimus DSM method \_SB_.PCI0.PEG0.=
PEGP
handle
[    0.990006] nouveau: detected PR support, will not use DSM
[    0.990037] nouveau 0000:01:00.0: enabling device (0004 -&gt; 0007)
[    0.990171] nouveau 0000:01:00.0: NVIDIA GP107 (137000a1)
[    1.025754] nouveau 0000:01:00.0: bios: version 86.07.3c.00.60
[    1.082353] nouveau 0000:01:00.0: priv: HUB0: 00d054 00000007 (1a408216)
[    1.082358] nouveau 0000:01:00.0: fb: 4096 MiB GDDR5
[    1.084171] vga_switcheroo: enabled
[    1.084254] [TTM] Zone  kernel: Available graphics memory: 8033790 kiB
[    1.084254] [TTM] Zone   dma32: Available graphics memory: 2097152 kiB
[    1.084255] [TTM] Initializing pool allocator
[    1.084257] [TTM] Initializing DMA pool allocator
[    1.084265] nouveau 0000:01:00.0: DRM: VRAM: 4096 MiB
[    1.084266] nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
[    1.084267] nouveau 0000:01:00.0: DRM: BIT table 'A' not found
[    1.084268] nouveau 0000:01:00.0: DRM: BIT table 'L' not found
[    1.084269] nouveau 0000:01:00.0: DRM: TMDS table version 2.0
[    1.084270] nouveau 0000:01:00.0: DRM: DCB version 4.1
[    1.084272] nouveau 0000:01:00.0: DRM: DCB outp 00: 02022f62 00020010
[    1.084273] nouveau 0000:01:00.0: DRM: DCB conn 02: 00010261
[    1.084274] nouveau 0000:01:00.0: DRM: DCB conn 04: 01000446
[    1.084275] nouveau 0000:01:00.0: DRM: DCB conn 05: 02000546
[    1.084276] nouveau 0000:01:00.0: DRM: Pointer to flat panel table inval=
id
[    1.107611] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[    1.107612] [drm] Driver supports precise vblank timestamp query.
[    1.267495] fbcon: inteldrmfb (fb0) is primary device
[    1.425033] nouveau 0000:01:00.0: DRM: failed to create kernel channel, =
-22
[    1.426516] [drm] Cannot find any crtc or sizes - going 1024x768
[    1.428296] nouveau 0000:01:00.0: DRM: allocated 1024x768 fb: 0x60000, bo
ffff88046c748000
[    1.668461] clocksource: Switched to clocksource tsc
[    2.406679] Console: switching to colour frame buffer device 240x67
[    2.423231] i915 0000:00:02.0: fb0: inteldrmfb frame buffer device
[    2.423357] nouveau 0000:01:00.0: fb1: nouveaufb frame buffer device
[    2.423364] [drm] Initialized nouveau 1.3.1 20120801 for 0000:01:00.0 on
minor 1

I am running kernel-4.11.2 and xorg-server-1.19.3. I attach the full dmesg
output and config file

Thanks a lot for your help</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14956177240.B4dd.7934--

--===============1562731110==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1562731110==--
