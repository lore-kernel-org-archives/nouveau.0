From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92922] New: Xorg random freeze
Date: Thu, 12 Nov 2015 18:01:37 +0000
Message-ID: <bug-92922-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0221113129=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0221113129==
Content-Type: multipart/alternative; boundary="1447351297.627E2f1.11613"; charset="UTF-8"


--1447351297.627E2f1.11613
Date: Thu, 12 Nov 2015 18:01:37 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=92922

            Bug ID: 92922
           Summary: Xorg random freeze
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: major
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: antokara-lAq2i09A0t4Cep0kKqy/Kg@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

On Fedora (Gnome) Workstation 23, with the following:
xorg-x11-server-Xorg.x86_64   1.18.0-1.fc23
xorg-x11-drv-nouveau.x86_64   1:1.0.12-0.3.fc23
and
NVIDIA Corporation GK106 [GeForce GTX 660] (rev a1)

At random times but suspecting Google Chrome may be causing it, 
or at least causing it to happen more easily.

The screen freezes. I have intentionally added the seconds at the Gnome Clock
to see if they will keep changing during the freeze but all the times, they
freeze as well.

The mouse moves and usually but not always, the keyboard works as well (caps
lock lights, etc.) few times I could even switch session into terminal.

From the system journal I get:
kernel: nouveau E[  PGRAPH][0000:02:00.0] TRAP ch 9 [0x023f566000
gnome-shell[2271]]
kernel: nouveau E[  PGRAPH][0000:02:00.0] GPC0/PROP trap:
ZETA_STORAGE_TYPE_MISMATCH
kernel: nouveau E[  PGRAPH][0000:02:00.0] x = 968, y = 136, format = 0, storage
type = fe
kernel: nouveau E[  PGRAPH][0000:02:00.0] GPC1/PROP trap:
ZETA_STORAGE_TYPE_MISMATCH
kernel: nouveau E[  PGRAPH][0000:02:00.0] x = 1016, y = 104, format = 0,
storage type = fe
kernel: nouveau E[   PFIFO][0000:02:00.0] SCHED_ERROR [ CTXSW_TIMEOUT ]
kernel: nouveau E[   PFIFO][0000:02:00.0] PGRAPH engine fault on channel 10,
recovering...

or just:
kernel: nouveau E[   PFIFO][0000:02:00.0] SCHED_ERROR [ CTXSW_TIMEOUT ]
kernel: nouveau E[   PFIFO][0000:02:00.0] PGRAPH engine fault on channel 10,
recovering...

and this gets repeated allot:
kernel: nouveau E[  PGRAPH][0000:02:00.0] TRAP ch 9 [0x023f566000
gnome-shell[2224]]
kernel: nouveau E[  PGRAPH][0000:02:00.0] GPC1/PROP trap:
ZETA_STORAGE_TYPE_MISMATCH
kernel: nouveau E[  PGRAPH][0000:02:00.0] x = 576, y = 512, format = 0, storage
type = fe

tried with wayland gnome session and it also happens:
kernel: nouveau E[  PGRAPH][0000:02:00.0] TRAP ch 10 [0x023f315000
Xwayland[5816]]
kernel: nouveau E[  PGRAPH][0000:02:00.0] GPC2/TPC0/MP trap: INVALID_OPCODE


Please keep in mind that the GPU is ok,
I have been using it with Windows, without any issues...

I plan to find another PC and try to SSH during the freeze, once I do, I will
post an update. Until then, the above log may be of useful to you.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1447351297.627E2f1.11613
Date: Thu, 12 Nov 2015 18:01:37 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><table border="1" cellspacing="0" cellpadding="8">
        <tr>
          <th>Bug ID</th>
          <td><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Xorg random freeze"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92922">92922</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Xorg random freeze
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
          <td>antokara&#64;precise.gr
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>On Fedora (Gnome) Workstation 23, with the following:
xorg-x11-server-Xorg.x86_64   1.18.0-1.fc23
xorg-x11-drv-nouveau.x86_64   1:1.0.12-0.3.fc23
and
NVIDIA Corporation GK106 [GeForce GTX 660] (rev a1)

At random times but suspecting Google Chrome may be causing it, 
or at least causing it to happen more easily.

The screen freezes. I have intentionally added the seconds at the Gnome Clock
to see if they will keep changing during the freeze but all the times, they
freeze as well.

The mouse moves and usually but not always, the keyboard works as well (caps
lock lights, etc.) few times I could even switch session into terminal.

From the system journal I get:
kernel: nouveau E[  PGRAPH][0000:02:00.0] TRAP ch 9 [0x023f566000
gnome-shell[2271]]
kernel: nouveau E[  PGRAPH][0000:02:00.0] GPC0/PROP trap:
ZETA_STORAGE_TYPE_MISMATCH
kernel: nouveau E[  PGRAPH][0000:02:00.0] x = 968, y = 136, format = 0, storage
type = fe
kernel: nouveau E[  PGRAPH][0000:02:00.0] GPC1/PROP trap:
ZETA_STORAGE_TYPE_MISMATCH
kernel: nouveau E[  PGRAPH][0000:02:00.0] x = 1016, y = 104, format = 0,
storage type = fe
kernel: nouveau E[   PFIFO][0000:02:00.0] SCHED_ERROR [ CTXSW_TIMEOUT ]
kernel: nouveau E[   PFIFO][0000:02:00.0] PGRAPH engine fault on channel 10,
recovering...

or just:
kernel: nouveau E[   PFIFO][0000:02:00.0] SCHED_ERROR [ CTXSW_TIMEOUT ]
kernel: nouveau E[   PFIFO][0000:02:00.0] PGRAPH engine fault on channel 10,
recovering...

and this gets repeated allot:
kernel: nouveau E[  PGRAPH][0000:02:00.0] TRAP ch 9 [0x023f566000
gnome-shell[2224]]
kernel: nouveau E[  PGRAPH][0000:02:00.0] GPC1/PROP trap:
ZETA_STORAGE_TYPE_MISMATCH
kernel: nouveau E[  PGRAPH][0000:02:00.0] x = 576, y = 512, format = 0, storage
type = fe

tried with wayland gnome session and it also happens:
kernel: nouveau E[  PGRAPH][0000:02:00.0] TRAP ch 10 [0x023f315000
Xwayland[5816]]
kernel: nouveau E[  PGRAPH][0000:02:00.0] GPC2/TPC0/MP trap: INVALID_OPCODE


Please keep in mind that the GPU is ok,
I have been using it with Windows, without any issues...

I plan to find another PC and try to SSH during the freeze, once I do, I will
post an update. Until then, the above log may be of useful to you.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1447351297.627E2f1.11613--

--===============0221113129==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0221113129==--
