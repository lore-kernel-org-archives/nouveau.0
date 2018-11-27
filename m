From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 108873] New: nouveau/Quadro P2000 Mobile: runpm
 causing ACPI errors, lockups
Date: Tue, 27 Nov 2018 04:03:53 +0000
Message-ID: <bug-108873-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1067427775=="
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


--===============1067427775==
Content-Type: multipart/alternative; boundary="15432914331.7BD0c6.21855"
Content-Transfer-Encoding: 7bit


--15432914331.7BD0c6.21855
Date: Tue, 27 Nov 2018 04:03:53 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D108873

            Bug ID: 108873
           Summary: nouveau/Quadro P2000 Mobile: runpm causing ACPI
                    errors, lockups
           Product: xorg
           Version: git
          Hardware: Other
                OS: All
            Status: NEW
          Severity: major
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: mst-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 142620
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D142620&action=3Dedit
dmesg showing the errors and the lockup. using noaccel=3D1

So a new thinkpad:
01:00.0 VGA compatible controller: NVIDIA Corporation GP107GLM [Quadro P2000
Mobile] (rev a1)

Hangs whenever I try to poke at the card. It starts happily enough with

[    3.971515] ACPI Warning: \_SB.PCI0.GFX0._DSM: Argument #4 type mismatch=
 -
Found [Buffer], ACPI requires [Package]
+(20181003/nsarguments-66)
[    3.971553] ACPI Warning: \_SB.PCI0.PEG0.PEGP._DSM: Argument #4 type
mismatch - Found [Buffer], ACPI requires [Package]
+(20181003/nsarguments-66)
[    3.971721] pci 0000:01:00.0: optimus capabilities: enabled, status dyna=
mic
power, hda bios codec supported
[    3.971726] VGA switcheroo: detected Optimus DSM method \_SB_.PCI0.PEG0.=
PEGP
handle
[    3.971727] nouveau: detected PR support, will not use DSM
[    3.971745] nouveau 0000:01:00.0: enabling device (0006 -> 0007)
[    3.971923] nouveau 0000:01:00.0: NVIDIA GP107 (137000a1)
[    4.009875] PM: Image not found (code -22)
[    4.135752] nouveau 0000:01:00.0: DRM: VRAM: 4096 MiB
[    4.135753] nouveau 0000:01:00.0: DRM: GART: 536870912 MiB
[    4.135754] nouveau 0000:01:00.0: DRM: BIT table 'A' not found
[    4.135755] nouveau 0000:01:00.0: DRM: BIT table 'L' not found
[    4.135756] nouveau 0000:01:00.0: DRM: TMDS table version 2.0
[    4.135756] nouveau 0000:01:00.0: DRM: DCB version 4.1
[    4.135757] nouveau 0000:01:00.0: DRM: DCB outp 00: 02800f76 04600020
[    4.135758] nouveau 0000:01:00.0: DRM: DCB outp 01: 02011f62 00020010
[    4.135759] nouveau 0000:01:00.0: DRM: DCB outp 02: 01022f46 04600010
[    4.135760] nouveau 0000:01:00.0: DRM: DCB outp 03: 01033f56 04600020
[    4.135761] nouveau 0000:01:00.0: DRM: DCB conn 00: 00020047
[    4.135761] nouveau 0000:01:00.0: DRM: DCB conn 01: 00010161
[    4.135762] nouveau 0000:01:00.0: DRM: DCB conn 02: 00001246
[    4.135763] nouveau 0000:01:00.0: DRM: DCB conn 03: 00002346
[    4.508355] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[    4.508355] [drm] Driver supports precise vblank timestamp query.
[    4.509812] [drm] Cannot find any crtc or sizes
[    4.510144] [drm] Initialized nouveau 1.3.1 20120801 for 0000:01:00.0 on
minor 2


Although that type mismatch is a bit worrying. And I'm not sure what
prints PM: Image not found.

But after a short while it gets pretty busy:


[   52.917009] No Local Variables are initialized for Method [NVPO]
[   52.917011] No Arguments are initialized for method [NVPO]
[   52.917012] ACPI Error: Method parse/execution failed
\_SB.PCI0.PEG0.PEGP.NVPO, AE_AML_LOOP_TIMEOUT (20181003/psparse-516)
[   52.917063] ACPI Error: Method parse/execution failed \_SB.PCI0.PGON,
AE_AML_LOOP_TIMEOUT (20181003/psparse-516)
[   52.917084] ACPI Error: Method parse/execution failed
\_SB.PCI0.PEG0.PG00._ON, AE_AML_LOOP_TIMEOUT (20181003/psparse-516)
[   52.917108] acpi device:00: Failed to change power state to D0
[   52.969287] video LNXVIDEO:00: Cannot transition to power state D0 for
parent in (unknown)
[   52.969289] pci_raw_set_power_state: 2 callbacks suppressed
[   52.969291] nouveau 0000:01:00.0: Refused to change power state, current=
ly
in D3
[   53.029514] video LNXVIDEO:00: Cannot transition to power state D0 for
parent in (unknown)
[   53.041027] nouveau 0000:01:00.0: Refused to change power state, current=
ly
in D3
[   53.041035] video LNXVIDEO:00: Cannot transition to power state D0 for
parent in (unknown)
[   53.053008] nouveau 0000:01:00.0: Refused to change power state, current=
ly
in D3
And then kernel proceeds to throw up errors at random places, e.g.

[   67.021892] cfg80211: failed to load regulatory.db
[   67.021895] cfg80211: failed to load regulatory.db
[   67.021897] cfg80211: failed to load regulatory.db
[   67.021900] cfg80211: failed to load regulatory.db
[   67.021927] cfg80211: failed to load regulatory.db
[   67.021928] cfg80211: failed to load regulatory.db
[   67.021932] cfg80211: failed to load regulatory.db
[   67.021934] cfg80211: failed to load regulatory.db
[   67.024463] cfg80211: failed to load regulatory.db
[   99.980625] iwlwifi 0000:00:14.3: Error sending STATISTICS_CMD: time out
after 2000ms.

followed by soft lockups and sometimes hard lockups in places
like attempts to walk skb lists.

Adding runpm=3D0 does away with this issue.

The specific test was with noaccel=3D1 - it does not seem to change
things for me.

I poked at the ACPI method NVPO and yes it does actually
seem to execute a while loop waiting for some register
to become 0. Which I guess never happens? Because card
is in a low power state and so reads return ffffffff maybe?


X isn't happy even with runpm=3D0 but that might be a different
issue - I thought runpm=3D0 might be an easier place to start debugging
things given there are logs of the failure.

Using kernel 4.20.0-rc3 right now.

Userspace bits are from fedora 29:
xorg-x11-drv-nouveau-1.0.15-6.fc29.x86_64

firmware is pretty recent:
linux-firmware-20181008-88.gitc6b6265d.fc29.noarch

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15432914331.7BD0c6.21855
Date: Tue, 27 Nov 2018 04:03:53 +0000
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
   title=3D"NEW - nouveau/Quadro P2000 Mobile: runpm causing ACPI errors, l=
ockups"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108873">108873</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>nouveau/Quadro P2000 Mobile: runpm causing ACPI errors, locku=
ps
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>git
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
          <td>major
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
          <td>mst&#64;redhat.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D142620=
" name=3D"attach_142620" title=3D"dmesg showing the errors and the lockup. =
using noaccel=3D1">attachment 142620</a> <a href=3D"attachment.cgi?id=3D142=
620&amp;action=3Dedit" title=3D"dmesg showing the errors and the lockup. us=
ing noaccel=3D1">[details]</a></span>
dmesg showing the errors and the lockup. using noaccel=3D1

So a new thinkpad:
01:00.0 VGA compatible controller: NVIDIA Corporation GP107GLM [Quadro P2000
Mobile] (rev a1)

Hangs whenever I try to poke at the card. It starts happily enough with

[    3.971515] ACPI Warning: \_SB.PCI0.GFX0._DSM: Argument #4 type mismatch=
 -
Found [Buffer], ACPI requires [Package]
+(20181003/nsarguments-66)
[    3.971553] ACPI Warning: \_SB.PCI0.PEG0.PEGP._DSM: Argument #4 type
mismatch - Found [Buffer], ACPI requires [Package]
+(20181003/nsarguments-66)
[    3.971721] pci 0000:01:00.0: optimus capabilities: enabled, status dyna=
mic
power, hda bios codec supported
[    3.971726] VGA switcheroo: detected Optimus DSM method \_SB_.PCI0.PEG0.=
PEGP
handle
[    3.971727] nouveau: detected PR support, will not use DSM
[    3.971745] nouveau 0000:01:00.0: enabling device (0006 -&gt; 0007)
[    3.971923] nouveau 0000:01:00.0: NVIDIA GP107 (137000a1)
[    4.009875] PM: Image not found (code -22)
[    4.135752] nouveau 0000:01:00.0: DRM: VRAM: 4096 MiB
[    4.135753] nouveau 0000:01:00.0: DRM: GART: 536870912 MiB
[    4.135754] nouveau 0000:01:00.0: DRM: BIT table 'A' not found
[    4.135755] nouveau 0000:01:00.0: DRM: BIT table 'L' not found
[    4.135756] nouveau 0000:01:00.0: DRM: TMDS table version 2.0
[    4.135756] nouveau 0000:01:00.0: DRM: DCB version 4.1
[    4.135757] nouveau 0000:01:00.0: DRM: DCB outp 00: 02800f76 04600020
[    4.135758] nouveau 0000:01:00.0: DRM: DCB outp 01: 02011f62 00020010
[    4.135759] nouveau 0000:01:00.0: DRM: DCB outp 02: 01022f46 04600010
[    4.135760] nouveau 0000:01:00.0: DRM: DCB outp 03: 01033f56 04600020
[    4.135761] nouveau 0000:01:00.0: DRM: DCB conn 00: 00020047
[    4.135761] nouveau 0000:01:00.0: DRM: DCB conn 01: 00010161
[    4.135762] nouveau 0000:01:00.0: DRM: DCB conn 02: 00001246
[    4.135763] nouveau 0000:01:00.0: DRM: DCB conn 03: 00002346
[    4.508355] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[    4.508355] [drm] Driver supports precise vblank timestamp query.
[    4.509812] [drm] Cannot find any crtc or sizes
[    4.510144] [drm] Initialized nouveau 1.3.1 20120801 for 0000:01:00.0 on
minor 2


Although that type mismatch is a bit worrying. And I'm not sure what
prints PM: Image not found.

But after a short while it gets pretty busy:


[   52.917009] No Local Variables are initialized for Method [NVPO]
[   52.917011] No Arguments are initialized for method [NVPO]
[   52.917012] ACPI Error: Method parse/execution failed
\_SB.PCI0.PEG0.PEGP.NVPO, AE_AML_LOOP_TIMEOUT (20181003/psparse-516)
[   52.917063] ACPI Error: Method parse/execution failed \_SB.PCI0.PGON,
AE_AML_LOOP_TIMEOUT (20181003/psparse-516)
[   52.917084] ACPI Error: Method parse/execution failed
\_SB.PCI0.PEG0.PG00._ON, AE_AML_LOOP_TIMEOUT (20181003/psparse-516)
[   52.917108] acpi device:00: Failed to change power state to D0
[   52.969287] video LNXVIDEO:00: Cannot transition to power state D0 for
parent in (unknown)
[   52.969289] pci_raw_set_power_state: 2 callbacks suppressed
[   52.969291] nouveau 0000:01:00.0: Refused to change power state, current=
ly
in D3
[   53.029514] video LNXVIDEO:00: Cannot transition to power state D0 for
parent in (unknown)
[   53.041027] nouveau 0000:01:00.0: Refused to change power state, current=
ly
in D3
[   53.041035] video LNXVIDEO:00: Cannot transition to power state D0 for
parent in (unknown)
[   53.053008] nouveau 0000:01:00.0: Refused to change power state, current=
ly
in D3
And then kernel proceeds to throw up errors at random places, e.g.

[   67.021892] cfg80211: failed to load regulatory.db
[   67.021895] cfg80211: failed to load regulatory.db
[   67.021897] cfg80211: failed to load regulatory.db
[   67.021900] cfg80211: failed to load regulatory.db
[   67.021927] cfg80211: failed to load regulatory.db
[   67.021928] cfg80211: failed to load regulatory.db
[   67.021932] cfg80211: failed to load regulatory.db
[   67.021934] cfg80211: failed to load regulatory.db
[   67.024463] cfg80211: failed to load regulatory.db
[   99.980625] iwlwifi 0000:00:14.3: Error sending STATISTICS_CMD: time out
after 2000ms.

followed by soft lockups and sometimes hard lockups in places
like attempts to walk skb lists.

Adding runpm=3D0 does away with this issue.

The specific test was with noaccel=3D1 - it does not seem to change
things for me.

I poked at the ACPI method NVPO and yes it does actually
seem to execute a while loop waiting for some register
to become 0. Which I guess never happens? Because card
is in a low power state and so reads return ffffffff maybe?


X isn't happy even with runpm=3D0 but that might be a different
issue - I thought runpm=3D0 might be an easier place to start debugging
things given there are logs of the failure.

Using kernel 4.20.0-rc3 right now.

Userspace bits are from fedora 29:
xorg-x11-drv-nouveau-1.0.15-6.fc29.x86_64

firmware is pretty recent:
linux-firmware-20181008-88.gitc6b6265d.fc29.noarch</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15432914331.7BD0c6.21855--

--===============1067427775==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1067427775==--
