From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 107501] New: System hangs on attempt to login to
 Plasma (Wayland)
Date: Mon, 06 Aug 2018 15:41:01 +0000
Message-ID: <bug-107501-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0450512282=="
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


--===============0450512282==
Content-Type: multipart/alternative; boundary="15335700611.c99A1CdE.24595"
Content-Transfer-Encoding: 7bit


--15335700611.c99A1CdE.24595
Date: Mon, 6 Aug 2018 15:41:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D107501

            Bug ID: 107501
           Summary: System hangs on attempt to login to Plasma (Wayland)
           Product: Mesa
           Version: 18.0
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: major
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: studio-lihVdAYpQjqsTnJN9+BGXg@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
                CC: tiwai-l3A5Bk7waGM@public.gmane.org

STR:

1. Install plasma5-session-wayland
2. Logout of current Plasma session
3. Login selecting Plasma wayland session

EXPECTED:

Normal login to desktop environment.

ACTUAL:

System hangs and does not respond to anything: neither to Alt+Ctrl+Backspac=
e,
nor to Alt+Ctrl+F1, nor to Alt+Ctrl+Del. A hardware reset was necessary to
reboot it.

--------------------

Tested on openSUSE Leap 15.0 with kernels:

kernel-default-4.12.14-lp150.12.7.1.x86_64
kernel-default-4.17.12-2.1.gef4920c.x86_64

--------------------

Initially reported to openSUSE and advised to report it upstream here:

https://bugzilla.opensuse.org/show_bug.cgi?id=3D1103827

journalctl output:
for 4.12: https://bugzilla.opensuse.org/attachment.cgi?id=3D778942
for 4.17: https://bugzilla.opensuse.org/attachment.cgi?id=3D779003

--------------------

The videocard is NVIDIA GTX680

[~]: rpm -q Mesa-dri-nouveau
Mesa-dri-nouveau-18.0.2-lp150.17.2.x86_64

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--15335700611.c99A1CdE.24595
Date: Mon, 6 Aug 2018 15:41:01 +0000
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
   title=3D"NEW - System hangs on attempt to login to Plasma (Wayland)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D107501">107501</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>System hangs on attempt to login to Plasma (Wayland)
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>18.0
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
          <td>studio&#64;anchev.net
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>CC</th>
          <td>tiwai&#64;suse.de
          </td>
        </tr></table>
      <p>
        <div>
        <pre>STR:

1. Install plasma5-session-wayland
2. Logout of current Plasma session
3. Login selecting Plasma wayland session

EXPECTED:

Normal login to desktop environment.

ACTUAL:

System hangs and does not respond to anything: neither to Alt+Ctrl+Backspac=
e,
nor to Alt+Ctrl+F1, nor to Alt+Ctrl+Del. A hardware reset was necessary to
reboot it.

--------------------

Tested on openSUSE Leap 15.0 with kernels:

kernel-default-4.12.14-lp150.12.7.1.x86_64
kernel-default-4.17.12-2.1.gef4920c.x86_64

--------------------

Initially reported to openSUSE and advised to report it upstream here:

<a href=3D"https://bugzilla.opensuse.org/show_bug.cgi?id=3D1103827">https:/=
/bugzilla.opensuse.org/show_bug.cgi?id=3D1103827</a>

journalctl output:
for 4.12: <a href=3D"https://bugzilla.opensuse.org/attachment.cgi?id=3D7789=
42">https://bugzilla.opensuse.org/attachment.cgi?id=3D778942</a>
for 4.17: <a href=3D"https://bugzilla.opensuse.org/attachment.cgi?id=3D7790=
03">https://bugzilla.opensuse.org/attachment.cgi?id=3D779003</a>

--------------------

The videocard is NVIDIA GTX680

[~]: rpm -q Mesa-dri-nouveau
Mesa-dri-nouveau-18.0.2-lp150.17.2.x86_64</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15335700611.c99A1CdE.24595--

--===============0450512282==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0450512282==--
