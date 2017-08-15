From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 102236] New: Pcie link speed is gen2 instead of gen3
Date: Tue, 15 Aug 2017 16:14:49 +0000
Message-ID: <bug-102236-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1167441204=="
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


--===============1167441204==
Content-Type: multipart/alternative; boundary="15028136890.1ccea9c1.11259";
 charset="UTF-8"


--15028136890.1ccea9c1.11259
Date: Tue, 15 Aug 2017 16:14:49 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D102236

            Bug ID: 102236
           Summary: Pcie link speed is gen2 instead of gen3
           Product: xorg
           Version: 7.7 (2012.06)
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: major
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: bloblo2017-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 133530
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D133530&action=3Dedit
lspci pstate 07 0f, vbios.rom nouveau, gtx770bios.rom from my gtx770 card

Hello,
Pcie link speed is gen2 instead of gen3

Kernel version: 4.10.0 (same situation with kern 4.9, 4.11, 4.13-rcx, 4.12 =
no
tested/remember)

My motherboard: x79 with 2 slot pci express 3 support

My graphic card: nvidia (msi) gtx 770 4 gb ddr5 oc edition twin frozr (2x f=
an)



Xorg: 7.7+19

Nouveau:
xserver-xorg-video-nouveau 1.0.13-3
libdrm-nouveau2 2.4.74-1

Dmesg (i compiled kernel with nouveau debug level 4 so very much info (clk,=
 fan
etc), i pick just this:
nouveau 0000:02:00.0: pci: pcie max speed: 5.0GT/s
nouveau 0000:02:00.0: DRM: VRAM: 4096 MiB
nouveau 0000:02:00.0: DRM: GART: 1048576 MiB
(clock and pstate are fine and its work)


We are 2 situation:
1- All gtx 770 have this situation (with nouveau)
or/and
2- Nvidia disable using 8 gt/s by default (in forums nvidia: is for all car=
ds
or only for x79 motherboard maybe ? but give option to enable pci3 with grub
and for windows give a small program exe to enable pcie3
(You can default 8gt/s support but you also add nouveau.config=3Dpcie=3D3 s=
omething
as nvidia method is your choice)

In attachment:
- lspci with pstate 07
- lspci with pstate 0f
- vbios.rom from nouveau, located in same path of pstate files
- gtx770bios.rom, bios rom of my gtx 770 extracted with gpuz in windows


ps: in lspci link showing max 5gt/s, but with blacklist nouveau, is show 8 =
gt/s

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15028136890.1ccea9c1.11259
Date: Tue, 15 Aug 2017 16:14:49 +0000
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
   title=3D"NEW - Pcie link speed is gen2 instead of gen3"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D102236">102236</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Pcie link speed is gen2 instead of gen3
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
          <td>bloblo2017&#64;hotmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D133530=
" name=3D"attach_133530" title=3D"lspci pstate 07 0f, vbios.rom nouveau, gt=
x770bios.rom from my gtx770 card">attachment 133530</a> <a href=3D"attachme=
nt.cgi?id=3D133530&amp;action=3Dedit" title=3D"lspci pstate 07 0f, vbios.ro=
m nouveau, gtx770bios.rom from my gtx770 card">[details]</a></span>
lspci pstate 07 0f, vbios.rom nouveau, gtx770bios.rom from my gtx770 card

Hello,
Pcie link speed is gen2 instead of gen3

Kernel version: 4.10.0 (same situation with kern 4.9, 4.11, 4.13-rcx, 4.12 =
no
tested/remember)

My motherboard: x79 with 2 slot pci express 3 support

My graphic card: nvidia (msi) gtx 770 4 gb ddr5 oc edition twin frozr (2x f=
an)



Xorg: 7.7+19

Nouveau:
xserver-xorg-video-nouveau 1.0.13-3
libdrm-nouveau2 2.4.74-1

Dmesg (i compiled kernel with nouveau debug level 4 so very much info (clk,=
 fan
etc), i pick just this:
nouveau 0000:02:00.0: pci: pcie max speed: 5.0GT/s
nouveau 0000:02:00.0: DRM: VRAM: 4096 MiB
nouveau 0000:02:00.0: DRM: GART: 1048576 MiB
(clock and pstate are fine and its work)


We are 2 situation:
1- All gtx 770 have this situation (with nouveau)
or/and
2- Nvidia disable using 8 gt/s by default (in forums nvidia: is for all car=
ds
or only for x79 motherboard maybe ? but give option to enable pci3 with grub
and for windows give a small program exe to enable pcie3
(You can default 8gt/s support but you also add nouveau.config=3Dpcie=3D3 s=
omething
as nvidia method is your choice)

In attachment:
- lspci with pstate 07
- lspci with pstate 0f
- vbios.rom from nouveau, located in same path of pstate files
- gtx770bios.rom, bios rom of my gtx 770 extracted with gpuz in windows


ps: in lspci link showing max 5gt/s, but with blacklist nouveau, is show 8 =
gt/s</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15028136890.1ccea9c1.11259--

--===============1167441204==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1167441204==--
