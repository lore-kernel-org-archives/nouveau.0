From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 105260] New: Nouveau frequently crashes when
 hovering over taskbar in KDE Plasma 5
Date: Mon, 26 Feb 2018 20:24:59 +0000
Message-ID: <bug-105260-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0233046772=="
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


--===============0233046772==
Content-Type: multipart/alternative; boundary="15196766990.96bd.10693"
Content-Transfer-Encoding: 7bit


--15196766990.96bd.10693
Date: Mon, 26 Feb 2018 20:24:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D105260

            Bug ID: 105260
           Summary: Nouveau frequently crashes when hovering over taskbar
                    in KDE Plasma 5
           Product: Mesa
           Version: 13.0
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: zeratul976-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

I am experiencing a frequent freeze of my entire graphics session, from whi=
ch I
can only recover by restarting by display manager.

The freeze always occurs when hovering over a taskbar entry and a thumbnail
image of the corresponding window is shown, although I can't reliably repro=
duce
the freeze every time I perform such a hover.

The following output appears in dmesg whenever this happens:

[425014.691684] nouveau 0000:01:00.0: gr: TRAP ch 2 [003fc60000 Xorg[16428]]
[425014.691694] nouveau 0000:01:00.0: gr: GPC0/TPC0/TEX: 80000049
[425014.691697] nouveau 0000:01:00.0: gr: GPC0/TPC1/TEX: 80000049
[425014.691715] nouveau 0000:01:00.0: fifo: read fault at 0002b70000 engine=
 00
[PGRAPH] client 01 [GPC0/TEX] reason 02 [PAGE_NOT_PRESENT] on channel 2
[003fc60000 Xorg[16428]]
[425014.691716] nouveau 0000:01:00.0: fifo: gr engine fault on channel 2,
recovering...
[425014.691911] nouveau 0000:01:00.0: Xorg[16428]: channel 2 killed!
[425014.692071] nouveau 0000:01:00.0: gr: TRAP ch 9 [003f93c000
plasmashell[16602]]
[425014.692080] nouveau 0000:01:00.0: gr: GPC0/TPC0/TEX: 80000049
[425014.692083] nouveau 0000:01:00.0: gr: GPC0/TPC1/TEX: 80000049
[425014.692092] nouveau 0000:01:00.0: fifo: read fault at 0001500000 engine=
 00
[PGRAPH] client 01 [GPC0/TEX] reason 02 [PAGE_NOT_PRESENT] on channel 9
[003f93c000 plasmashell[16602]]
[425014.692094] nouveau 0000:01:00.0: fifo: gr engine fault on channel 9,
recovering...
[425014.692301] nouveau 0000:01:00.0: plasmashell[16602]: channel 9 killed!

I am running Debian 9, with the KDE desktop environment (Plasma 5.8). My ke=
rnel
version is 4.14.

Please let me know if there is any other information I can provide to help
diagnose the issue.

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--15196766990.96bd.10693
Date: Mon, 26 Feb 2018 20:24:59 +0000
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
   title=3D"NEW - Nouveau frequently crashes when hovering over taskbar in =
KDE Plasma 5"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105260">105260</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Nouveau frequently crashes when hovering over taskbar in KDE =
Plasma 5
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>13.0
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
          <td>zeratul976&#64;hotmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>I am experiencing a frequent freeze of my entire graphics sess=
ion, from which I
can only recover by restarting by display manager.

The freeze always occurs when hovering over a taskbar entry and a thumbnail
image of the corresponding window is shown, although I can't reliably repro=
duce
the freeze every time I perform such a hover.

The following output appears in dmesg whenever this happens:

[425014.691684] nouveau 0000:01:00.0: gr: TRAP ch 2 [003fc60000 Xorg[16428]]
[425014.691694] nouveau 0000:01:00.0: gr: GPC0/TPC0/TEX: 80000049
[425014.691697] nouveau 0000:01:00.0: gr: GPC0/TPC1/TEX: 80000049
[425014.691715] nouveau 0000:01:00.0: fifo: read fault at 0002b70000 engine=
 00
[PGRAPH] client 01 [GPC0/TEX] reason 02 [PAGE_NOT_PRESENT] on channel 2
[003fc60000 Xorg[16428]]
[425014.691716] nouveau 0000:01:00.0: fifo: gr engine fault on channel 2,
recovering...
[425014.691911] nouveau 0000:01:00.0: Xorg[16428]: channel 2 killed!
[425014.692071] nouveau 0000:01:00.0: gr: TRAP ch 9 [003f93c000
plasmashell[16602]]
[425014.692080] nouveau 0000:01:00.0: gr: GPC0/TPC0/TEX: 80000049
[425014.692083] nouveau 0000:01:00.0: gr: GPC0/TPC1/TEX: 80000049
[425014.692092] nouveau 0000:01:00.0: fifo: read fault at 0001500000 engine=
 00
[PGRAPH] client 01 [GPC0/TEX] reason 02 [PAGE_NOT_PRESENT] on channel 9
[003f93c000 plasmashell[16602]]
[425014.692094] nouveau 0000:01:00.0: fifo: gr engine fault on channel 9,
recovering...
[425014.692301] nouveau 0000:01:00.0: plasmashell[16602]: channel 9 killed!

I am running Debian 9, with the KDE desktop environment (Plasma 5.8). My ke=
rnel
version is 4.14.

Please let me know if there is any other information I can provide to help
diagnose the issue.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
          <li>You are the QA Contact for the bug.</li>
      </ul>
    </body>
</html>=

--15196766990.96bd.10693--

--===============0233046772==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0233046772==--
