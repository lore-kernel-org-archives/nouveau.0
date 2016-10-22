From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 98386] New: [NVE7] bus: MMIO write of FAULT at [
 IBUS ], Pointer to {TDMS, flat panel) table invalid
Date: Sat, 22 Oct 2016 16:32:51 +0000
Message-ID: <bug-98386-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1614023778=="
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


--===============1614023778==
Content-Type: multipart/alternative; boundary="14771539711.08e5.1921";
 charset="UTF-8"


--14771539711.08e5.1921
Date: Sat, 22 Oct 2016 16:32:51 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D98386

            Bug ID: 98386
           Summary: [NVE7] bus: MMIO write of FAULT at [ IBUS ], Pointer
                    to {TDMS,flat panel) table invalid
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: minor
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: bruno.pagani-vYW+cPY1g1pg9hUCZPvPmw@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Hi, following https://bugzilla.freedesktop.org/show_bug.cgi?id=3D70354, I=
=E2=80=99m still
having some error messages in dmesg.

This is on first loading:
[  454.756165] MXM: GUID detected in BIOS
[  454.756253] ACPI Warning: \_SB.PCI0.PEG0.PEGP._DSM: Argument #4 type
mismatch - Found [Buffer], ACPI requires [Package] (20160422/nsarguments-95)
[  454.756309] ACPI Warning: \_SB.PCI0.PEG0.PEGP._DSM: Argument #4 type
mismatch - Found [Buffer], ACPI requires [Package] (20160422/nsarguments-95)
[  454.756430] pci 0000:02:00.0: optimus capabilities: enabled, status dyna=
mic
power, hda bios codec supported
[  454.756432] VGA switcheroo: detected Optimus DSM method \_SB_.PCI0.PEG0.=
PEGP
handle
[  454.756433] nouveau: detected PR support, will not use DSM
[  454.756510] nouveau 0000:02:00.0: NVIDIA GK107 (0e7240a2)
[  454.775702] nouveau 0000:02:00.0: bios: version 80.07.b3.00.21
[  454.919182] nouveau 0000:02:00.0: fb: 2048 MiB GDDR5
[  454.919271] nouveau 0000:02:00.0: bus: MMIO write of 00000002 FAULT at
4188ac [ IBUS ]
[  454.989821] vga_switcheroo: enabled
[  454.989938] [TTM] Zone  kernel: Available graphics memory: 8169036 kiB
[  454.989939] [TTM] Zone   dma32: Available graphics memory: 2097152 kiB
[  454.989940] [TTM] Initializing pool allocator
[  454.989943] [TTM] Initializing DMA pool allocator
[  454.989951] nouveau 0000:02:00.0: DRM: VRAM: 2048 MiB
[  454.989951] nouveau 0000:02:00.0: DRM: GART: 1048576 MiB
[  454.989954] nouveau 0000:02:00.0: DRM: Pointer to TMDS table invalid
[  454.989956] nouveau 0000:02:00.0: DRM: DCB version 4.0
[  454.989957] nouveau 0000:02:00.0: DRM: Pointer to flat panel table inval=
id
[  455.191639] nouveau 0000:02:00.0: DRM: MM: using COPY for buffer copies
[  455.191647] [drm] Initialized nouveau 1.3.1 20120801 for 0000:02:00.0 on
minor 1
[  460.192102] nouveau 0000:02:00.0: DRM: evicting buffers...
[  460.192107] nouveau 0000:02:00.0: DRM: waiting for kernel channels to go
idle...
[  460.192139] nouveau 0000:02:00.0: DRM: suspending client object trees...
[  460.198135] nouveau 0000:02:00.0: DRM: suspending kernel object tree...

Note the following lines (that appear in red in my console):
[  454.919271] nouveau 0000:02:00.0: bus: MMIO write of 00000002 FAULT at
4188ac [ IBUS ]
[  454.989954] nouveau 0000:02:00.0: DRM: Pointer to TMDS table invalid
[  454.989957] nouveau 0000:02:00.0: DRM: Pointer to flat panel table inval=
id

And then, on subsequent uses of the card:
[  470.170765] nouveau 0000:02:00.0: DRM: resuming kernel object tree...
[  470.245180] nouveau 0000:02:00.0: bus: MMIO write of ffffff1f FAULT at
6013d4 [ IBUS ]
[  470.266559] nouveau 0000:02:00.0: DRM: resuming client object trees...
[  476.071701] nouveau 0000:02:00.0: DRM: evicting buffers...
[  476.071703] nouveau 0000:02:00.0: DRM: waiting for kernel channels to go
idle...
[  476.071732] nouveau 0000:02:00.0: DRM: suspending client object trees...
[  476.077132] nouveau 0000:02:00.0: DRM: suspending kernel object tree...

And again (can provide any amount you want, only the two hex chains change):
[ 6579.503383] nouveau 0000:02:00.0: DRM: resuming kernel object tree...
[ 6579.586496] nouveau 0000:02:00.0: bus: MMIO write of 8000001f FAULT at
6013d4 [ IBUS ]
[ 6579.607798] nouveau 0000:02:00.0: DRM: resuming client object trees...
[ 6585.210796] nouveau 0000:02:00.0: DRM: evicting buffers...
[ 6585.210798] nouveau 0000:02:00.0: DRM: waiting for kernel channels to go
idle...
[ 6585.210825] nouveau 0000:02:00.0: DRM: suspending client object trees...
[ 6585.216211] nouveau 0000:02:00.0: DRM: suspending kernel object tree...

Not sure if it has any consequences, but since it appears in red, I suppose=
d it
was worth reporting.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14771539711.08e5.1921
Date: Sat, 22 Oct 2016 16:32:51 +0000
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
   title=3D"NEW - [NVE7] bus: MMIO write of FAULT at [ IBUS ], Pointer to {=
TDMS,flat panel) table invalid"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98386">98386</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[NVE7] bus: MMIO write of FAULT at [ IBUS ], Pointer to {TDMS=
,flat panel) table invalid
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
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
          <td>Linux (All)
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>minor
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Driver/nouveau
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>bruno.pagani&#64;ens-lyon.org
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Hi, following <a href=3D"https://bugzilla.freedesktop.org/show=
_bug.cgi?id=3D70354">https://bugzilla.freedesktop.org/show_bug.cgi?id=3D703=
54</a>, I=E2=80=99m still
having some error messages in dmesg.

This is on first loading:
[  454.756165] MXM: GUID detected in BIOS
[  454.756253] ACPI Warning: \_SB.PCI0.PEG0.PEGP._DSM: Argument #4 type
mismatch - Found [Buffer], ACPI requires [Package] (20160422/nsarguments-95)
[  454.756309] ACPI Warning: \_SB.PCI0.PEG0.PEGP._DSM: Argument #4 type
mismatch - Found [Buffer], ACPI requires [Package] (20160422/nsarguments-95)
[  454.756430] pci 0000:02:00.0: optimus capabilities: enabled, status dyna=
mic
power, hda bios codec supported
[  454.756432] VGA switcheroo: detected Optimus DSM method \_SB_.PCI0.PEG0.=
PEGP
handle
[  454.756433] nouveau: detected PR support, will not use DSM
[  454.756510] nouveau 0000:02:00.0: NVIDIA GK107 (0e7240a2)
[  454.775702] nouveau 0000:02:00.0: bios: version 80.07.b3.00.21
[  454.919182] nouveau 0000:02:00.0: fb: 2048 MiB GDDR5
[  454.919271] nouveau 0000:02:00.0: bus: MMIO write of 00000002 FAULT at
4188ac [ IBUS ]
[  454.989821] vga_switcheroo: enabled
[  454.989938] [TTM] Zone  kernel: Available graphics memory: 8169036 kiB
[  454.989939] [TTM] Zone   dma32: Available graphics memory: 2097152 kiB
[  454.989940] [TTM] Initializing pool allocator
[  454.989943] [TTM] Initializing DMA pool allocator
[  454.989951] nouveau 0000:02:00.0: DRM: VRAM: 2048 MiB
[  454.989951] nouveau 0000:02:00.0: DRM: GART: 1048576 MiB
[  454.989954] nouveau 0000:02:00.0: DRM: Pointer to TMDS table invalid
[  454.989956] nouveau 0000:02:00.0: DRM: DCB version 4.0
[  454.989957] nouveau 0000:02:00.0: DRM: Pointer to flat panel table inval=
id
[  455.191639] nouveau 0000:02:00.0: DRM: MM: using COPY for buffer copies
[  455.191647] [drm] Initialized nouveau 1.3.1 20120801 for 0000:02:00.0 on
minor 1
[  460.192102] nouveau 0000:02:00.0: DRM: evicting buffers...
[  460.192107] nouveau 0000:02:00.0: DRM: waiting for kernel channels to go
idle...
[  460.192139] nouveau 0000:02:00.0: DRM: suspending client object trees...
[  460.198135] nouveau 0000:02:00.0: DRM: suspending kernel object tree...

Note the following lines (that appear in red in my console):
[  454.919271] nouveau 0000:02:00.0: bus: MMIO write of 00000002 FAULT at
4188ac [ IBUS ]
[  454.989954] nouveau 0000:02:00.0: DRM: Pointer to TMDS table invalid
[  454.989957] nouveau 0000:02:00.0: DRM: Pointer to flat panel table inval=
id

And then, on subsequent uses of the card:
[  470.170765] nouveau 0000:02:00.0: DRM: resuming kernel object tree...
[  470.245180] nouveau 0000:02:00.0: bus: MMIO write of ffffff1f FAULT at
6013d4 [ IBUS ]
[  470.266559] nouveau 0000:02:00.0: DRM: resuming client object trees...
[  476.071701] nouveau 0000:02:00.0: DRM: evicting buffers...
[  476.071703] nouveau 0000:02:00.0: DRM: waiting for kernel channels to go
idle...
[  476.071732] nouveau 0000:02:00.0: DRM: suspending client object trees...
[  476.077132] nouveau 0000:02:00.0: DRM: suspending kernel object tree...

And again (can provide any amount you want, only the two hex chains change):
[ 6579.503383] nouveau 0000:02:00.0: DRM: resuming kernel object tree...
[ 6579.586496] nouveau 0000:02:00.0: bus: MMIO write of 8000001f FAULT at
6013d4 [ IBUS ]
[ 6579.607798] nouveau 0000:02:00.0: DRM: resuming client object trees...
[ 6585.210796] nouveau 0000:02:00.0: DRM: evicting buffers...
[ 6585.210798] nouveau 0000:02:00.0: DRM: waiting for kernel channels to go
idle...
[ 6585.210825] nouveau 0000:02:00.0: DRM: suspending client object trees...
[ 6585.216211] nouveau 0000:02:00.0: DRM: suspending kernel object tree...

Not sure if it has any consequences, but since it appears in red, I suppose=
d it
was worth reporting.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14771539711.08e5.1921--

--===============1614023778==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1614023778==--
