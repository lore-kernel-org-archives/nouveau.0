From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 110830] New: [nouveau] GeForce GTX 1660 Ti (mobile)
 not supported (NV168/TU116)
Date: Mon, 03 Jun 2019 13:30:47 +0000
Message-ID: <bug-110830-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1394014006=="
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


--===============1394014006==
Content-Type: multipart/alternative; boundary="15595686472.e4337bcca.18985"
Content-Transfer-Encoding: 7bit


--15595686472.e4337bcca.18985
Date: Mon, 3 Jun 2019 13:30:47 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110830

            Bug ID: 110830
           Summary: [nouveau] GeForce GTX 1660 Ti (mobile) not supported
                    (NV168/TU116)
           Product: xorg
           Version: 7.7 (2012.06)
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: mszpak-5tc4TXWwyLM@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

The GeForce GTX 1660 Ti mobile card doesn't seem to be supported by nouveau:
> kernel: ACPI Warning: \_SB.PCI0.GFX0._DSM: Argument #4 type mismatch - Fo=
und [Buffer], ACPI requires [Package] (20181213/nsarguments-59)
> kernel: ACPI Warning: \_SB.PCI0.PEG0.PEGP._DSM: Argument #4 type mismatch=
 - Found [Buffer], ACPI requires [Package] (20181213/nsarguments-59)
> kernel: pci 0000:01:00.0: optimus capabilities: enabled, status dynamic p=
ower, hda bios codec supported
> kernel: VGA switcheroo: detected Optimus DSM method \_SB_.PCI0.PEG0.PEGP =
handle
> kernel: nouveau: detected PR support, will not use DSM
> kernel: nouveau 0000:01:00.0: enabling device (0106 -> 0107)
> kernel: nouveau 0000:01:00.0: unknown chipset (168000a1)
> kernel: nouveau: probe of 0000:01:00.0 failed with error -12

Linux starts up with the Intel card, but unfortunately in Hyperbook NH5/Cle=
vo
NH55RCQ the HDMI output seems to be wired to NVidia card :-/, so I cannot
external display with nouveau.

More information about my hardware:
> $ lspci | grep -i nvidia
> 01:00.0 VGA compatible controller: NVIDIA Corporation TU116M [GeForce GTX=
 1660 Mobile] (rev a1)
> 01:00.1 Audio device: NVIDIA Corporation Device 1aeb (rev a1)
> 01:00.2 USB controller: NVIDIA Corporation Device 1aec (rev a1)
> 01:00.3 Serial bus controller [0c80]: NVIDIA Corporation Device 1aed (rev=
 a1)

(Output for lspcii -vv)
> 01:00.0 VGA compatible controller: NVIDIA Corporation TU116M [GeForce GTX=
 1660 Mobile] (rev a1) (prog-if 00 [VGA controller])
>	Subsystem: CLEVO/KAPOK Computer Device 8550
>	Flags: bus master, fast devsel, latency 0, IRQ 16
>	Memory at b3000000 (32-bit, non-prefetchable) [size=3D16M]
>	Memory at a0000000 (64-bit, prefetchable) [size=3D256M]
>	Memory at b0000000 (64-bit, prefetchable) [size=3D32M]
>	I/O ports at 4000 [size=3D128]
>	Expansion ROM at b2000000 [disabled] [size=3D512K]
>	Capabilities: <access denied>
>	Kernel modules: nouveau

A quick search [1] suggests that preliminary support for TU117 exists in ma=
ster
and TU116 might be added once required hardware is accessible. I'm creating
this ticket to make it easier to track progress of adding support for TU116=
 in
nouveau.

Tested with Fedora 30 with kernel 5.0.9-301.fc30.x86_64.

[1] -
https://github.com/torvalds/linux/commit/f266fdc7609a416c4f9c64f25930958717=
fa1bd7

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15595686472.e4337bcca.18985
Date: Mon, 3 Jun 2019 13:30:47 +0000
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
   title=3D"NEW - [nouveau] GeForce GTX 1660 Ti (mobile) not supported (NV1=
68/TU116)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110830">110830</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[nouveau] GeForce GTX 1660 Ti (mobile) not supported (NV168/T=
U116)
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>7.7 (2012.06)
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
          <td>mszpak&#64;wp.pl
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>The GeForce GTX 1660 Ti mobile card doesn't seem to be support=
ed by nouveau:
<span class=3D"quote">&gt; kernel: ACPI Warning: \_SB.PCI0.GFX0._DSM: Argum=
ent #4 type mismatch - Found [Buffer], ACPI requires [Package] (20181213/ns=
arguments-59)
&gt; kernel: ACPI Warning: \_SB.PCI0.PEG0.PEGP._DSM: Argument #4 type misma=
tch - Found [Buffer], ACPI requires [Package] (20181213/nsarguments-59)
&gt; kernel: pci 0000:01:00.0: optimus capabilities: enabled, status dynami=
c power, hda bios codec supported
&gt; kernel: VGA switcheroo: detected Optimus DSM method \_SB_.PCI0.PEG0.PE=
GP handle
&gt; kernel: nouveau: detected PR support, will not use DSM
&gt; kernel: nouveau 0000:01:00.0: enabling device (0106 -&gt; 0107)
&gt; kernel: nouveau 0000:01:00.0: unknown chipset (168000a1)
&gt; kernel: nouveau: probe of 0000:01:00.0 failed with error -12</span >

Linux starts up with the Intel card, but unfortunately in Hyperbook NH5/Cle=
vo
NH55RCQ the HDMI output seems to be wired to NVidia card :-/, so I cannot
external display with nouveau.

More information about my hardware:
<span class=3D"quote">&gt; $ lspci | grep -i nvidia
&gt; 01:00.0 VGA compatible controller: NVIDIA Corporation TU116M [GeForce =
GTX 1660 Mobile] (rev a1)
&gt; 01:00.1 Audio device: NVIDIA Corporation Device 1aeb (rev a1)
&gt; 01:00.2 USB controller: NVIDIA Corporation Device 1aec (rev a1)
&gt; 01:00.3 Serial bus controller [0c80]: NVIDIA Corporation Device 1aed (=
rev a1)</span >

(Output for lspcii -vv)
<span class=3D"quote">&gt; 01:00.0 VGA compatible controller: NVIDIA Corpor=
ation TU116M [GeForce GTX 1660 Mobile] (rev a1) (prog-if 00 [VGA controller=
])
&gt;	Subsystem: CLEVO/KAPOK Computer Device 8550
&gt;	Flags: bus master, fast devsel, latency 0, IRQ 16
&gt;	Memory at b3000000 (32-bit, non-prefetchable) [size=3D16M]
&gt;	Memory at a0000000 (64-bit, prefetchable) [size=3D256M]
&gt;	Memory at b0000000 (64-bit, prefetchable) [size=3D32M]
&gt;	I/O ports at 4000 [size=3D128]
&gt;	Expansion ROM at b2000000 [disabled] [size=3D512K]
&gt;	Capabilities: &lt;access denied&gt;
&gt;	Kernel modules: nouveau</span >

A quick search [1] suggests that preliminary support for TU117 exists in ma=
ster
and TU116 might be added once required hardware is accessible. I'm creating
this ticket to make it easier to track progress of adding support for TU116=
 in
nouveau.

Tested with Fedora 30 with kernel 5.0.9-301.fc30.x86_64.

[1] -
<a href=3D"https://github.com/torvalds/linux/commit/f266fdc7609a416c4f9c64f=
25930958717fa1bd7">https://github.com/torvalds/linux/commit/f266fdc7609a416=
c4f9c64f25930958717fa1bd7</a></pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15595686472.e4337bcca.18985--

--===============1394014006==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1394014006==--
