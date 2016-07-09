From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 96876] New: system freeze "fifo: gr engine fault on
 channel 6" NVIDIA
Date: Sat, 09 Jul 2016 23:31:24 +0000
Message-ID: <bug-96876-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0046876038=="
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


--===============0046876038==
Content-Type: multipart/alternative; boundary="14681070840.817e.27066";
 charset="UTF-8"


--14681070840.817e.27066
Date: Sat, 9 Jul 2016 23:31:24 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D96876

            Bug ID: 96876
           Summary: system freeze "fifo: gr engine fault on channel 6"
                    NVIDIA
           Product: xorg
           Version: unspecified
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: dashesy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 124976
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D124976&action=3Dedit
acpidump

I saw some similarity with bug #93629, but this is not related to any
SCHED_ERROR. Also it is very often, usually chrome triggering it.=20
I had problem with this GC, turning off the monitors on startup, but that
problem is now fixed in the latest kernel.

$ journalctl --no-pager -b -2 -p err
-- Logs begin at Thu 2016-05-05 05:39:48 PDT, end at Sat 2016-07-09 16:10:13
PDT. --
Jul 04 02:15:01 dashesy.wavelet kernel: nouveau 0000:01:00.0: priv: HUB0:
086014 ffffffff (1f70820c)
Jul 04 09:15:32 dashesy.wavelet mcelog[877]: Family 6 Model 5e CPU: only
decoding architectural errors
Jul 04 09:15:33 dashesy.wavelet bluetoothd[873]: Failed to obtain handles f=
or
"Service Changed" characteristic
Jul 04 09:16:01 dashesy.wavelet spice-vdagent[1546]: Cannot access vdagent
virtio channel /dev/virtio-ports/com.redhat.spice.0
Jul 04 09:17:36 dashesy.wavelet spice-vdagent[2064]: Cannot access vdagent
virtio channel /dev/virtio-ports/com.redhat.spice.0
Jul 04 12:24:41 dashesy.wavelet kernel: nouveau 0000:01:00.0: Invalid PCI R=
OM
header signature: expecting 0xaa55, got 0xffff
Jul 09 09:59:48 dashesy.wavelet kernel: nouveau 0000:01:00.0: fifo: read fa=
ult
at 0000260000 engine 00 [GR] client 01 [GPC0/T1_0] reason 02 [PTE] on chann=
el 6
[007fb61000 systemd-logind[859]]
Jul 09 09:59:48 dashesy.wavelet kernel: nouveau 0000:01:00.0: fifo: gr engi=
ne
fault on channel 6, recovering...
Jul 09 09:59:48 dashesy.wavelet kernel: nouveau 0000:01:00.0: gr: TRAP ch 6
[007fb61000 systemd-logind[859]]
Jul 09 09:59:48 dashesy.wavelet kernel: nouveau 0000:01:00.0: gr:
GPC0/TPC0/TEX: 80000049
Jul 09 09:59:48 dashesy.wavelet kernel: nouveau 0000:01:00.0: gr:
GPC0/TPC1/TEX: 80000049


$ lspci -v
01:00.0 VGA compatible controller: NVIDIA Corporation GK208 [GeForce GT 730]
(rev a1) (prog-if 00 [VGA controller])
        Subsystem: Dell Device 1083
        Flags: bus master, fast devsel, latency 0, IRQ 126
        Memory at de000000 (32-bit, non-prefetchable) [size=3D16M]
        Memory at d0000000 (64-bit, prefetchable) [size=3D128M]
        Memory at d8000000 (64-bit, prefetchable) [size=3D32M]
        I/O ports at e000 [size=3D128]
        Expansion ROM at df000000 [disabled] [size=3D512K]
        Capabilities: [60] Power Management version 3
        Capabilities: [68] MSI: Enable+ Count=3D1/1 Maskable- 64bit+
        Capabilities: [78] Express Legacy Endpoint, MSI 00
        Capabilities: [100] Virtual Channel
        Capabilities: [128] Power Budgeting <?>
        Capabilities: [600] Vendor Specific Information: ID=3D0001 Rev=3D1 =
Len=3D024
<?>
        Kernel driver in use: nouveau
        Kernel modules: nouveau

$ uname -a
Linux dashesy.wavelet 4.5.7-202.fc23.x86_64 #1 SMP Tue Jun 28 18:22:51 UTC =
2016
x86_64 x86_64 x86_64 GNU/Linux


This is a complete hang, and seems to happen quite enough, I will gladly run
any kernel/driver combination to sort this out.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14681070840.817e.27066
Date: Sat, 9 Jul 2016 23:31:24 +0000
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
   title=3D"NEW - system freeze &quot;fifo: gr engine fault on channel 6&qu=
ot; NVIDIA"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D96876">96876</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>system freeze &quot;fifo: gr engine fault on channel 6&quot; =
NVIDIA
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
          <td>dashesy&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D124976=
" name=3D"attach_124976" title=3D"acpidump">attachment 124976</a> <a href=
=3D"attachment.cgi?id=3D124976&amp;action=3Dedit" title=3D"acpidump">[detai=
ls]</a></span>
acpidump

I saw some similarity with <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVE6] complete system freeze, PGRAPH engine fault on cha=
nnel 2, SCHED_ERROR [ CTXSW_TIMEOUT ]"
   href=3D"show_bug.cgi?id=3D93629">bug #93629</a>, but this is not related=
 to any
SCHED_ERROR. Also it is very often, usually chrome triggering it.=20
I had problem with this GC, turning off the monitors on startup, but that
problem is now fixed in the latest kernel.

$ journalctl --no-pager -b -2 -p err
-- Logs begin at Thu 2016-05-05 05:39:48 PDT, end at Sat 2016-07-09 16:10:13
PDT. --
Jul 04 02:15:01 dashesy.wavelet kernel: nouveau 0000:01:00.0: priv: HUB0:
086014 ffffffff (1f70820c)
Jul 04 09:15:32 dashesy.wavelet mcelog[877]: Family 6 Model 5e CPU: only
decoding architectural errors
Jul 04 09:15:33 dashesy.wavelet bluetoothd[873]: Failed to obtain handles f=
or
&quot;Service Changed&quot; characteristic
Jul 04 09:16:01 dashesy.wavelet spice-vdagent[1546]: Cannot access vdagent
virtio channel /dev/virtio-ports/com.redhat.spice.0
Jul 04 09:17:36 dashesy.wavelet spice-vdagent[2064]: Cannot access vdagent
virtio channel /dev/virtio-ports/com.redhat.spice.0
Jul 04 12:24:41 dashesy.wavelet kernel: nouveau 0000:01:00.0: Invalid PCI R=
OM
header signature: expecting 0xaa55, got 0xffff
Jul 09 09:59:48 dashesy.wavelet kernel: nouveau 0000:01:00.0: fifo: read fa=
ult
at 0000260000 engine 00 [GR] client 01 [GPC0/T1_0] reason 02 [PTE] on chann=
el 6
[007fb61000 systemd-logind[859]]
Jul 09 09:59:48 dashesy.wavelet kernel: nouveau 0000:01:00.0: fifo: gr engi=
ne
fault on channel 6, recovering...
Jul 09 09:59:48 dashesy.wavelet kernel: nouveau 0000:01:00.0: gr: TRAP ch 6
[007fb61000 systemd-logind[859]]
Jul 09 09:59:48 dashesy.wavelet kernel: nouveau 0000:01:00.0: gr:
GPC0/TPC0/TEX: 80000049
Jul 09 09:59:48 dashesy.wavelet kernel: nouveau 0000:01:00.0: gr:
GPC0/TPC1/TEX: 80000049


$ lspci -v
01:00.0 VGA compatible controller: NVIDIA Corporation GK208 [GeForce GT 730]
(rev a1) (prog-if 00 [VGA controller])
        Subsystem: Dell Device 1083
        Flags: bus master, fast devsel, latency 0, IRQ 126
        Memory at de000000 (32-bit, non-prefetchable) [size=3D16M]
        Memory at d0000000 (64-bit, prefetchable) [size=3D128M]
        Memory at d8000000 (64-bit, prefetchable) [size=3D32M]
        I/O ports at e000 [size=3D128]
        Expansion ROM at df000000 [disabled] [size=3D512K]
        Capabilities: [60] Power Management version 3
        Capabilities: [68] MSI: Enable+ Count=3D1/1 Maskable- 64bit+
        Capabilities: [78] Express Legacy Endpoint, MSI 00
        Capabilities: [100] Virtual Channel
        Capabilities: [128] Power Budgeting &lt;?&gt;
        Capabilities: [600] Vendor Specific Information: ID=3D0001 Rev=3D1 =
Len=3D024
&lt;?&gt;
        Kernel driver in use: nouveau
        Kernel modules: nouveau

$ uname -a
Linux dashesy.wavelet 4.5.7-202.fc23.x86_64 #1 SMP Tue Jun 28 18:22:51 UTC =
2016
x86_64 x86_64 x86_64 GNU/Linux


This is a complete hang, and seems to happen quite enough, I will gladly run
any kernel/driver combination to sort this out.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14681070840.817e.27066--

--===============0046876038==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0046876038==--
