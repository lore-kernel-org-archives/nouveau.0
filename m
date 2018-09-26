From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 108080] New: GK106 [GeForce GTX 660] System Freeze -
 warp 3d0009 [ILLEGAL_INSTR_ENCODING]
Date: Wed, 26 Sep 2018 23:19:55 +0000
Message-ID: <bug-108080-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0316698298=="
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


--===============0316698298==
Content-Type: multipart/alternative; boundary="15380039950.21B2.31662"
Content-Transfer-Encoding: 7bit


--15380039950.21B2.31662
Date: Wed, 26 Sep 2018 23:19:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D108080

            Bug ID: 108080
           Summary: GK106 [GeForce GTX 660] System Freeze - warp 3d0009
                    [ILLEGAL_INSTR_ENCODING]
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: All
            Status: NEW
          Severity: critical
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: EliasWoods-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 141754
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D141754&action=3Dedit
journalctl --system

This is similar but not quite the same bug as #107829

I recently updated arch linux and attempted to use the nouvea driver with my
GTX 660 GPU. System will reliable crash after about 30 seconds to 1 min in =
KDE
plasma with the following kernel message.

Sep 25 21:18:49 sokka kernel: nouveau 0000:01:00.0: gr: TRAP ch 2 [023fe330=
00
Xorg[406]]
Sep 25 21:18:55 sokka kernel: nouveau 0000:01:00.0: gr: GPC1/TPC1/MP trap:
global 00000000 [] warp 3d0009 [ILLEGAL_INSTR_ENCODING]
Sep 25 21:19:16 sokka kernel: input input6: event field not found
Sep 25 21:19:16 sokka kernel: input input6: event field not found
Sep 25 21:19:16 sokka kernel: input input6: event field not found
Sep 25 21:19:16 sokka kernel: input input6: event field not found
Sep 25 21:21:35 sokka kernel: sysrq: SysRq : This sysrq operation is disabl=
ed.
Sep 25 21:21:35 sokka kernel: sysrq: SysRq : This sysrq operation is disabl=
ed.
Sep 25 21:21:36 sokka kernel: sysrq: SysRq : This sysrq operation is disabl=
ed.
Sep 25 21:21:36 sokka kernel: sysrq: SysRq : Emergency Sync
Sep 25 21:21:36 sokka kernel: Emergency Sync complete
Sep 25 21:21:37 sokka kernel: sysrq: SysRq : This sysrq operation is disabl=
ed.
Sep 25 21:21:37 sokka kernel: sysrq: SysRq : This sysrq operation is disabl=
ed.
Sep 25 21:22:39 sokka kernel: INFO: task kworker/u8:5:177 blocked for more =
than
120 seconds.
Sep 25 21:22:39 sokka kernel:       Not tainted 4.18.9-arch1-1-ARCH #1
Sep 25 21:22:39 sokka kernel: "echo 0 >
/proc/sys/kernel/hung_task_timeout_secs" disables this message.
Sep 25 21:22:39 sokka kernel: kworker/u8:5    D    0   177      2 0x80000000
Sep 25 21:22:39 sokka kernel: Workqueue: events_unbound
nv50_disp_atomic_commit_work [nouveau]

Placing nouveau.noaccel=3D1 as a kernel boot parameter fixes the issue but =
it is
not ideal.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15380039950.21B2.31662
Date: Wed, 26 Sep 2018 23:19:55 +0000
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
   title=3D"NEW - GK106 [GeForce GTX 660] System Freeze - warp 3d0009 [ILLE=
GAL_INSTR_ENCODING]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108080">108080</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>GK106 [GeForce GTX 660] System Freeze - warp 3d0009 [ILLEGAL_=
INSTR_ENCODING]
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
          <td>critical
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
          <td>EliasWoods&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D141754=
" name=3D"attach_141754" title=3D"journalctl --system">attachment 141754</a=
> <a href=3D"attachment.cgi?id=3D141754&amp;action=3Dedit" title=3D"journal=
ctl --system">[details]</a></span>
journalctl --system

This is similar but not quite the same bug as #107829

I recently updated arch linux and attempted to use the nouvea driver with my
GTX 660 GPU. System will reliable crash after about 30 seconds to 1 min in =
KDE
plasma with the following kernel message.

Sep 25 21:18:49 sokka kernel: nouveau 0000:01:00.0: gr: TRAP ch 2 [023fe330=
00
Xorg[406]]
Sep 25 21:18:55 sokka kernel: nouveau 0000:01:00.0: gr: GPC1/TPC1/MP trap:
global 00000000 [] warp 3d0009 [ILLEGAL_INSTR_ENCODING]
Sep 25 21:19:16 sokka kernel: input input6: event field not found
Sep 25 21:19:16 sokka kernel: input input6: event field not found
Sep 25 21:19:16 sokka kernel: input input6: event field not found
Sep 25 21:19:16 sokka kernel: input input6: event field not found
Sep 25 21:21:35 sokka kernel: sysrq: SysRq : This sysrq operation is disabl=
ed.
Sep 25 21:21:35 sokka kernel: sysrq: SysRq : This sysrq operation is disabl=
ed.
Sep 25 21:21:36 sokka kernel: sysrq: SysRq : This sysrq operation is disabl=
ed.
Sep 25 21:21:36 sokka kernel: sysrq: SysRq : Emergency Sync
Sep 25 21:21:36 sokka kernel: Emergency Sync complete
Sep 25 21:21:37 sokka kernel: sysrq: SysRq : This sysrq operation is disabl=
ed.
Sep 25 21:21:37 sokka kernel: sysrq: SysRq : This sysrq operation is disabl=
ed.
Sep 25 21:22:39 sokka kernel: INFO: task kworker/u8:5:177 blocked for more =
than
120 seconds.
Sep 25 21:22:39 sokka kernel:       Not tainted 4.18.9-arch1-1-ARCH #1
Sep 25 21:22:39 sokka kernel: &quot;echo 0 &gt;
/proc/sys/kernel/hung_task_timeout_secs&quot; disables this message.
Sep 25 21:22:39 sokka kernel: kworker/u8:5    D    0   177      2 0x80000000
Sep 25 21:22:39 sokka kernel: Workqueue: events_unbound
nv50_disp_atomic_commit_work [nouveau]

Placing nouveau.noaccel=3D1 as a kernel boot parameter fixes the issue but =
it is
not ideal.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15380039950.21B2.31662--

--===============0316698298==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0316698298==--
