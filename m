From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 104523] New: System does not resume from suspend
Date: Sun, 07 Jan 2018 09:56:57 +0000
Message-ID: <bug-104523-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0669000587=="
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


--===============0669000587==
Content-Type: multipart/alternative; boundary="15153190170.3b10f498.16744";
 charset="UTF-8"


--15153190170.3b10f498.16744
Date: Sun, 7 Jan 2018 09:56:57 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D104523

            Bug ID: 104523
           Summary: System does not resume from suspend
           Product: xorg
           Version: unspecified
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: jan.public-4zxwHqDmGJ7z+pZb47iToQ@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

My system does not wake from suspend. Suspending seems to work correctly, b=
ut
when I press the power button to wake, the screens of the system stay black=
. I
could ping the system, but not log in by ssh.

I'm using the nouveau driver, with the nvidia driver the system did wake up
correctly.

See the following bug report for more details about my setup:
https://bugzilla.redhat.com/show_bug.cgi?id=3D1491565

In summary:
Graphics:  Card: NVIDIA GP107 [GeForce GTX 1050 Ti]
           Display Server: X.org 1.19.5 drivers: modesetting,fbdev,vesa
           tty size: 80x24 Advanced Data: N/A for root

System:    Host: nyx Kernel: 4.14.11-300.fc27.x86_64 x86_64 bits: 64 gcc: 7=
.2.1
Console: tty 0
           Distro: Fedora release 27 (Twenty Seven)

Machine:   Device: desktop System: Micro-Star product: MS-7A34 v: 2.0 seria=
l:
N/A
           Mobo: Micro-Star model: B350 PC MATE (MS-7A34) v: 2.0 serial:
H416624391
           UEFI: American Megatrends v: A.73 date: 09/11/2017

Log messages when suspending:
01:09:25 systemd: Starting Suspend...
01:09:24 kernel: nouveau 0000:23:00.0: disp: 0x000061ec[0]:
INIT_GENERIC_CONDITON: unknown 0x07
01:09:24 gnome-software: no app for changed topIcons-F2nSQ8M+api+q1qxgjDzng@public.gmane.org@gmail.com
01:09:24 gnome-shell: Window manager warning: Failed to set power save mode=
 for
output DVI-D-1: Permission denied
01:09:24 NetworkManager: <info>  [1515283764.2068] manager: NetworkManager
state is now ASLEEP
01:09:24 systemd-logind: Suspend key pressed.

There is no log of the attempt to resume.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15153190170.3b10f498.16744
Date: Sun, 7 Jan 2018 09:56:57 +0000
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
   title=3D"NEW - System does not resume from suspend"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D104523">104523</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>System does not resume from suspend
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
          <td>jan.public&#64;famvlug.nl
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>My system does not wake from suspend. Suspending seems to work=
 correctly, but
when I press the power button to wake, the screens of the system stay black=
. I
could ping the system, but not log in by ssh.

I'm using the nouveau driver, with the nvidia driver the system did wake up
correctly.

See the following bug report for more details about my setup:
<a href=3D"https://bugzilla.redhat.com/show_bug.cgi?id=3D1491565">https://b=
ugzilla.redhat.com/show_bug.cgi?id=3D1491565</a>

In summary:
Graphics:  Card: NVIDIA GP107 [GeForce GTX 1050 Ti]
           Display Server: X.org 1.19.5 drivers: modesetting,fbdev,vesa
           tty size: 80x24 Advanced Data: N/A for root

System:    Host: nyx Kernel: 4.14.11-300.fc27.x86_64 x86_64 bits: 64 gcc: 7=
.2.1
Console: tty 0
           Distro: Fedora release 27 (Twenty Seven)

Machine:   Device: desktop System: Micro-Star product: MS-7A34 v: 2.0 seria=
l:
N/A
           Mobo: Micro-Star model: B350 PC MATE (MS-7A34) v: 2.0 serial:
H416624391
           UEFI: American Megatrends v: A.73 date: 09/11/2017

Log messages when suspending:
01:09:25 systemd: Starting Suspend...
01:09:24 kernel: nouveau 0000:23:00.0: disp: 0x000061ec[0]:
INIT_GENERIC_CONDITON: unknown 0x07
01:09:24 gnome-software: no app for changed <a href=3D"mailto:topIcons&#64;=
adel.gadllah">topIcons&#64;adel.gadllah</a>&#64;gmail.com
01:09:24 gnome-shell: Window manager warning: Failed to set power save mode=
 for
output DVI-D-1: Permission denied
01:09:24 NetworkManager: &lt;info&gt;  [1515283764.2068] manager: NetworkMa=
nager
state is now ASLEEP
01:09:24 systemd-logind: Suspend key pressed.

There is no log of the attempt to resume.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15153190170.3b10f498.16744--

--===============0669000587==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0669000587==--
