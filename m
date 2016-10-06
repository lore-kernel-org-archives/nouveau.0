From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 98129] New: X hung with nouveau 'INVALID_CMD' and
 'INVALID_ADDRESS_ALIGNMENT' errors on GeForce 9600 GT [10de:0622]
Date: Thu, 06 Oct 2016 22:32:23 +0000
Message-ID: <bug-98129-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0088651928=="
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


--===============0088651928==
Content-Type: multipart/alternative; boundary="14757931431.Cc6DfD3Bc.18409";
 charset="UTF-8"


--14757931431.Cc6DfD3Bc.18409
Date: Thu, 6 Oct 2016 22:32:23 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D98129

            Bug ID: 98129
           Summary: X hung with nouveau 'INVALID_CMD' and
                    'INVALID_ADDRESS_ALIGNMENT' errors on GeForce 9600 GT
                    [10de:0622]
           Product: xorg
           Version: git
          Hardware: x86-64 (AMD64)
                OS: All
            Status: NEW
          Severity: critical
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: adamw-cfjF3rc+CpsYNetmKr+vY16hYfS7NtTn@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Recently my desktop - running Fedora 25, kernel 4.8.0-0.rc8.git0.1.fc25.x86=
_64
, xorg-x11-drv-nouveau-1.0.13-1.fc25.x86_64 - hung in the middle of normal
operation. X was totally stuck, but I could get in and shut down via ssh. T=
he
journal shows these nouveau errors at the time of the hang:

Oct 03 16:55:33 adam.happyassassin.net kernel: nouveau 0000:01:00.0: fifo:
DMA_PUSHER - ch 6 [systemd-logind[1245]] get 00200218e0 put 0020024010 ib_g=
et
0000032c ib_put 0000032d state 80004861 (err: INVALID_CMD) push 00504031
Oct 03 16:55:33 adam.happyassassin.net kernel: nouveau 0000:01:00.0: fifo:
DMA_PUSHER - ch 6 [systemd-logind[1245]] get 0020024010 put 0020024010 ib_g=
et
0000032c ib_put 00000348 state 80000000 (err: INVALID_CMD) push 00406040
Oct 03 16:55:33 adam.happyassassin.net kernel: nouveau 0000:01:00.0: gr:
DATA_ERROR 0000000b [INVALID_ADDRESS_ALIGNMENT]
Oct 03 16:55:33 adam.happyassassin.net kernel: nouveau 0000:01:00.0: gr:
00100000 [] ch 6 [001fbe5000 systemd-logind[1245]] subc 0 class 5039 mthd 0=
328
data 00000000

this is on a GeForce 9600 GT, [10de:0622] , with two displays connected via
DVI.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14757931431.Cc6DfD3Bc.18409
Date: Thu, 6 Oct 2016 22:32:23 +0000
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
   title=3D"NEW - X hung with nouveau 'INVALID_CMD' and 'INVALID_ADDRESS_AL=
IGNMENT' errors on GeForce 9600 GT [10de:0622]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98129">98129</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>X hung with nouveau 'INVALID_CMD' and 'INVALID_ADDRESS_ALIGNM=
ENT' errors on GeForce 9600 GT [10de:0622]
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
          <td>adamw&#64;happyassassin.net
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Recently my desktop - running Fedora 25, kernel 4.8.0-0.rc8.gi=
t0.1.fc25.x86_64
, xorg-x11-drv-nouveau-1.0.13-1.fc25.x86_64 - hung in the middle of normal
operation. X was totally stuck, but I could get in and shut down via ssh. T=
he
journal shows these nouveau errors at the time of the hang:

Oct 03 16:55:33 adam.happyassassin.net kernel: nouveau 0000:01:00.0: fifo:
DMA_PUSHER - ch 6 [systemd-logind[1245]] get 00200218e0 put 0020024010 ib_g=
et
0000032c ib_put 0000032d state 80004861 (err: INVALID_CMD) push 00504031
Oct 03 16:55:33 adam.happyassassin.net kernel: nouveau 0000:01:00.0: fifo:
DMA_PUSHER - ch 6 [systemd-logind[1245]] get 0020024010 put 0020024010 ib_g=
et
0000032c ib_put 00000348 state 80000000 (err: INVALID_CMD) push 00406040
Oct 03 16:55:33 adam.happyassassin.net kernel: nouveau 0000:01:00.0: gr:
DATA_ERROR 0000000b [INVALID_ADDRESS_ALIGNMENT]
Oct 03 16:55:33 adam.happyassassin.net kernel: nouveau 0000:01:00.0: gr:
00100000 [] ch 6 [001fbe5000 systemd-logind[1245]] subc 0 class 5039 mthd 0=
328
data 00000000

this is on a GeForce 9600 GT, [10de:0622] , with two displays connected via
DVI.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14757931431.Cc6DfD3Bc.18409--

--===============0088651928==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0088651928==--
