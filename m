From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 97922] New: Having easily reproducible xorg hang on
 extensive blender 3d editor usage
Date: Sun, 25 Sep 2016 15:26:23 +0000
Message-ID: <bug-97922-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0418975360=="
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


--===============0418975360==
Content-Type: multipart/alternative; boundary="14748171830.a9339B1a.31538";
 charset="UTF-8"


--14748171830.a9339B1a.31538
Date: Sun, 25 Sep 2016 15:26:23 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D97922

            Bug ID: 97922
           Summary: Having easily reproducible xorg hang on extensive
                    blender 3d editor usage
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: pexuone-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 126775
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D126775&action=3Dedit
blender file, which, on opening and editing on blender, cashes xorg

googled my nouveau crash log and found this topic
https://bugs.freedesktop.org/show_bug.cgi?id=3D72180

attaching blender file, which, on opening and editing in blender, cashes xo=
rg.
simple animation with large textures.=20
keyboard and mice input is frozen also. systemd seems able to ok shutdown by
power button press.=20

the systemd log on crush if following:
--------------------------------------

Sep 25 04:51:20 agutilities kernel: nouveau 0000:01:00.0: blender[1335]: fa=
iled
to idle channel 6 [blender[1335]]
Sep 25 04:51:35 agutilities kernel: nouveau 0000:01:00.0: blender[1335]: fa=
iled
to idle channel 6 [blender[1335]]
Sep 25 04:51:36 agutilities kernel: nouveau 0000:01:00.0: fifo: write fault=
 at
000081b000 engine 00 [GR] client 04 [FE] reason 02 [PTE] on channel 4
[003fb80000 systemd-logind[505]]
Sep 25 04:51:36 agutilities kernel: nouveau 0000:01:00.0: fifo: gr engine f=
ault
on channel 4, recovering...

while shutting down log is long waiting with next lines:
--------------------------------------------------------

Sep 25 04:52:01 agutilities kernel: nouveau 0000:01:00.0: systemd-logind[50=
5]:
failed to idle channel 4 [systemd-logind[505]]
Sep 25 04:52:16 agutilities kernel: nouveau 0000:01:00.0: systemd-logind[50=
5]:
failed to idle channel 4 [systemd-logind[505]]


My hardware is:
---------------

00:00.0 Host bridge: Intel Corporation Skylake Host Bridge/DRAM Registers (=
rev
07)
00:01.0 PCI bridge: Intel Corporation Skylake PCIe Controller (x16) (rev 07)
00:14.0 USB controller: Intel Corporation Sunrise Point-H USB 3.0 xHCI
Controller (rev 31)
00:16.0 Communication controller: Intel Corporation Sunrise Point-H CSME HE=
CI
#1 (rev 31)
00:17.0 SATA controller: Intel Corporation Sunrise Point-H SATA controller
[AHCI mode] (rev 31)
00:1b.0 PCI bridge: Intel Corporation Sunrise Point-H PCI Root Port #19 (rev
f1)
00:1d.0 PCI bridge: Intel Corporation Sunrise Point-H PCI Express Root Port=
 #9
(rev f1)
00:1f.0 ISA bridge: Intel Corporation Sunrise Point-H LPC Controller (rev 3=
1)
00:1f.2 Memory controller: Intel Corporation Sunrise Point-H PMC (rev 31)
00:1f.3 Audio device: Intel Corporation Sunrise Point-H HD Audio (rev 31)
00:1f.4 SMBus: Intel Corporation Sunrise Point-H SMBus (rev 31)
00:1f.6 Ethernet controller: Intel Corporation Ethernet Connection (2) I219=
-V
(rev 31)
01:00.0 VGA compatible controller: NVIDIA Corporation GK208 [GeForce GT 640
Rev. 2] (rev a1)
01:00.1 Audio device: NVIDIA Corporation GK208 HDMI/DP Audio Controller (rev
a1)
02:00.0 Network controller: Qualcomm Atheros QCA6174 802.11ac Wireless Netw=
ork
Adapter (rev 32)

RAM is 4G

text part of glxinfo:
---------------------

Extended renderer info (GLX_MESA_query_renderer):
    Vendor: nouveau (0x10de)
    Device: NV108 (0x1282)
    Version: 12.0.1
    Accelerated: yes
    Video memory: 1013MB
    Unified memory: no
    Preferred profile: core (0x1)
    Max core profile version: 4.3
    Max compat profile version: 3.0
    Max GLES1 profile version: 1.1
    Max GLES[23] profile version: 3.1
OpenGL vendor string: nouveau
OpenGL renderer string: Gallium 0.4 on NV108
OpenGL core profile version string: 4.3 (Core Profile) Mesa 12.0.1
OpenGL core profile shading language version string: 4.30
OpenGL core profile context flags: (none)
OpenGL core profile profile mask: core profile
OpenGL core profile extensions:


software:
---------

Linux agutilities 4.7.0-WayRound.ORG #2 SMP PREEMPT Fri Sep 23 22:35:21 MSK
2016 x86_64 GNU/Linux

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14748171830.a9339B1a.31538
Date: Sun, 25 Sep 2016 15:26:23 +0000
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
   title=3D"NEW - Having easily reproducible xorg hang on extensive blender=
 3d editor usage"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D97922">97922</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Having easily reproducible xorg hang on extensive blender 3d =
editor usage
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
          <td>pexuone&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D126775=
" name=3D"attach_126775" title=3D"blender file, which, on opening and editi=
ng on blender, cashes xorg">attachment 126775</a> <a href=3D"attachment.cgi=
?id=3D126775&amp;action=3Dedit" title=3D"blender file, which, on opening an=
d editing on blender, cashes xorg">[details]</a></span>
blender file, which, on opening and editing on blender, cashes xorg

googled my nouveau crash log and found this topic
<a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED INVALID - [NVE6] Random GPU Lockups, works with blob P=
GRAPH fw"
   href=3D"show_bug.cgi?id=3D72180">https://bugs.freedesktop.org/show_bug.c=
gi?id=3D72180</a>

attaching blender file, which, on opening and editing in blender, cashes xo=
rg.
simple animation with large textures.=20
keyboard and mice input is frozen also. systemd seems able to ok shutdown by
power button press.=20

the systemd log on crush if following:
--------------------------------------

Sep 25 04:51:20 agutilities kernel: nouveau 0000:01:00.0: blender[1335]: fa=
iled
to idle channel 6 [blender[1335]]
Sep 25 04:51:35 agutilities kernel: nouveau 0000:01:00.0: blender[1335]: fa=
iled
to idle channel 6 [blender[1335]]
Sep 25 04:51:36 agutilities kernel: nouveau 0000:01:00.0: fifo: write fault=
 at
000081b000 engine 00 [GR] client 04 [FE] reason 02 [PTE] on channel 4
[003fb80000 systemd-logind[505]]
Sep 25 04:51:36 agutilities kernel: nouveau 0000:01:00.0: fifo: gr engine f=
ault
on channel 4, recovering...

while shutting down log is long waiting with next lines:
--------------------------------------------------------

Sep 25 04:52:01 agutilities kernel: nouveau 0000:01:00.0: systemd-logind[50=
5]:
failed to idle channel 4 [systemd-logind[505]]
Sep 25 04:52:16 agutilities kernel: nouveau 0000:01:00.0: systemd-logind[50=
5]:
failed to idle channel 4 [systemd-logind[505]]


My hardware is:
---------------

00:00.0 Host bridge: Intel Corporation Skylake Host Bridge/DRAM Registers (=
rev
07)
00:01.0 PCI bridge: Intel Corporation Skylake PCIe Controller (x16) (rev 07)
00:14.0 USB controller: Intel Corporation Sunrise Point-H USB 3.0 xHCI
Controller (rev 31)
00:16.0 Communication controller: Intel Corporation Sunrise Point-H CSME HE=
CI
#1 (rev 31)
00:17.0 SATA controller: Intel Corporation Sunrise Point-H SATA controller
[AHCI mode] (rev 31)
00:1b.0 PCI bridge: Intel Corporation Sunrise Point-H PCI Root Port #19 (rev
f1)
00:1d.0 PCI bridge: Intel Corporation Sunrise Point-H PCI Express Root Port=
 #9
(rev f1)
00:1f.0 ISA bridge: Intel Corporation Sunrise Point-H LPC Controller (rev 3=
1)
00:1f.2 Memory controller: Intel Corporation Sunrise Point-H PMC (rev 31)
00:1f.3 Audio device: Intel Corporation Sunrise Point-H HD Audio (rev 31)
00:1f.4 SMBus: Intel Corporation Sunrise Point-H SMBus (rev 31)
00:1f.6 Ethernet controller: Intel Corporation Ethernet Connection (2) I219=
-V
(rev 31)
01:00.0 VGA compatible controller: NVIDIA Corporation GK208 [GeForce GT 640
Rev. 2] (rev a1)
01:00.1 Audio device: NVIDIA Corporation GK208 HDMI/DP Audio Controller (rev
a1)
02:00.0 Network controller: Qualcomm Atheros QCA6174 802.11ac Wireless Netw=
ork
Adapter (rev 32)

RAM is 4G

text part of glxinfo:
---------------------

Extended renderer info (GLX_MESA_query_renderer):
    Vendor: nouveau (0x10de)
    Device: NV108 (0x1282)
    Version: 12.0.1
    Accelerated: yes
    Video memory: 1013MB
    Unified memory: no
    Preferred profile: core (0x1)
    Max core profile version: 4.3
    Max compat profile version: 3.0
    Max GLES1 profile version: 1.1
    Max GLES[23] profile version: 3.1
OpenGL vendor string: nouveau
OpenGL renderer string: Gallium 0.4 on NV108
OpenGL core profile version string: 4.3 (Core Profile) Mesa 12.0.1
OpenGL core profile shading language version string: 4.30
OpenGL core profile context flags: (none)
OpenGL core profile profile mask: core profile
OpenGL core profile extensions:


software:
---------

Linux agutilities 4.7.0-WayRound.ORG #2 SMP PREEMPT Fri Sep 23 22:35:21 MSK
2016 x86_64 GNU/Linux</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14748171830.a9339B1a.31538--

--===============0418975360==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0418975360==--
