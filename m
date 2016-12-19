From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 99147] New: xorg hangs at initial startup on
	linux-4.9.0
Date: Mon, 19 Dec 2016 19:48:55 +0000
Message-ID: <bug-99147-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0598888248=="
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


--===============0598888248==
Content-Type: multipart/alternative; boundary="14821769351.82cAF85.31872";
 charset="UTF-8"


--14821769351.82cAF85.31872
Date: Mon, 19 Dec 2016 19:48:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D99147

            Bug ID: 99147
           Summary: xorg hangs at initial startup on linux-4.9.0
           Product: xorg
           Version: unspecified
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: gleb-97jfqw80gc5Wk0Htik3J/w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 128563
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D128563&action=3Dedit
nouveau

The issue start to appear after upgrading to Kernel 4.9.0. Before that, on
4.8.14 everything seems to be fine.

I have Lenovo B560 laptop with Intel Core i5 560M and Iron Lake GPU, Nvidia
310M, so it's an Optimus laptop. I have external monitor connected to HDMI
port.

Components when the probelm could be reproduced:
- gentoo almost stable
- mesa 12.0.1 or 13.0.2;
- libdrm 2.4.68 or 2.4.73
- xorg 1.18.4 or 1.19.0
- intel xf86 driver snapshot or modesetting driver
- nouveau 1.0.12 or 1.0.13
- libinput 1.5.3, libevdev 1.5.2
- xfce, polkit, consolekit, dbus, etc.


So just after all services started and lightdm expected to appear with login
screen, instead I can only see console login screen and nothing appears on =
tty7
also.

Xorg.log.0 shows no errors, dmesg is also empy (even with debug level 4). I
can't reboot system after that as Xorg has red D symbol and cannot be kille=
d,
so SysRq is used.

I blacklisted nouveau driver and it helped, so I can boot to the system
normally and after that I can load the nouveau module manually and even res=
tart
Xorg.

Xorg.log.0 hangs on the following item:
[    14.361] (II) xfree86: Adding drm device (/dev/dri/card1)

syslog kernel with nouveau filtered (only one time I enabled debug level wh=
en
the I had the problem).

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14821769351.82cAF85.31872
Date: Mon, 19 Dec 2016 19:48:55 +0000
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
   title=3D"NEW - xorg hangs at initial startup on linux-4.9.0"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99147">99147</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>xorg hangs at initial startup on linux-4.9.0
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
          <td>gleb&#64;fastmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D128563=
" name=3D"attach_128563" title=3D"nouveau">attachment 128563</a> <a href=3D=
"attachment.cgi?id=3D128563&amp;action=3Dedit" title=3D"nouveau">[details]<=
/a></span>
nouveau

The issue start to appear after upgrading to Kernel 4.9.0. Before that, on
4.8.14 everything seems to be fine.

I have Lenovo B560 laptop with Intel Core i5 560M and Iron Lake GPU, Nvidia
310M, so it's an Optimus laptop. I have external monitor connected to HDMI
port.

Components when the probelm could be reproduced:
- gentoo almost stable
- mesa 12.0.1 or 13.0.2;
- libdrm 2.4.68 or 2.4.73
- xorg 1.18.4 or 1.19.0
- intel xf86 driver snapshot or modesetting driver
- nouveau 1.0.12 or 1.0.13
- libinput 1.5.3, libevdev 1.5.2
- xfce, polkit, consolekit, dbus, etc.


So just after all services started and lightdm expected to appear with login
screen, instead I can only see console login screen and nothing appears on =
tty7
also.

Xorg.log.0 shows no errors, dmesg is also empy (even with debug level 4). I
can't reboot system after that as Xorg has red D symbol and cannot be kille=
d,
so SysRq is used.

I blacklisted nouveau driver and it helped, so I can boot to the system
normally and after that I can load the nouveau module manually and even res=
tart
Xorg.

Xorg.log.0 hangs on the following item:
[    14.361] (II) xfree86: Adding drm device (/dev/dri/card1)

syslog kernel with nouveau filtered (only one time I enabled debug level wh=
en
the I had the problem).</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14821769351.82cAF85.31872--

--===============0598888248==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0598888248==--
