From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 103351] New: Nouveau fails when booting with a
 screen connected to displayport since
 13a86519202c5d119d83640d6f781f3181205d2c
Date: Wed, 18 Oct 2017 20:40:00 +0000
Message-ID: <bug-103351-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0793282823=="
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


--===============0793282823==
Content-Type: multipart/alternative; boundary="15083591990.856a.28642";
 charset="UTF-8"


--15083591990.856a.28642
Date: Wed, 18 Oct 2017 20:39:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D103351

            Bug ID: 103351
           Summary: Nouveau fails when booting with a screen connected to
                    displayport since
                    13a86519202c5d119d83640d6f781f3181205d2c
           Product: Mesa
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: chris.glass-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

As discovered when testing the latest release of Ubuntu with (mainline) tre=
es,
commit 13a86519202c5d119d83640d6f781f3181205d2c seems to introduce a regres=
sion
when booting with a screen attached to displayport (the system otherwise bo=
ots
fine with the same kernel using an HDMI output).

An original bug was filed with the Ubuntu bug tracker and contains informat=
ion
about bissection: https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1723=
619

A (set of) dmesg outputs can be found here:
https://pastebin.ubuntu.com/25767385/=20

4.14-rc5 still exhibits this behavior on the tested system.

Please don't hesitate to reach out to me should you need more information -=
 one
affected system happens to be my main workstation.

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--15083591990.856a.28642
Date: Wed, 18 Oct 2017 20:39:59 +0000
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
   title=3D"NEW - Nouveau fails when booting with a screen connected to dis=
playport since 13a86519202c5d119d83640d6f781f3181205d2c"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D103351">103351</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Nouveau fails when booting with a screen connected to display=
port since 13a86519202c5d119d83640d6f781f3181205d2c
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
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
          <td>chris.glass&#64;canonical.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>As discovered when testing the latest release of Ubuntu with (=
mainline) trees,
commit 13a86519202c5d119d83640d6f781f3181205d2c seems to introduce a regres=
sion
when booting with a screen attached to displayport (the system otherwise bo=
ots
fine with the same kernel using an HDMI output).

An original bug was filed with the Ubuntu bug tracker and contains informat=
ion
about bissection: <a href=3D"https://bugs.launchpad.net/ubuntu/+source/linu=
x/+bug/1723619">https://bugs.launchpad.net/ubuntu/+source/linux/+bug/172361=
9</a>

A (set of) dmesg outputs can be found here:
<a href=3D"https://pastebin.ubuntu.com/25767385/">https://pastebin.ubuntu.c=
om/25767385/</a>=20

4.14-rc5 still exhibits this behavior on the tested system.

Please don't hesitate to reach out to me should you need more information -=
 one
affected system happens to be my main workstation.</pre>
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

--15083591990.856a.28642--

--===============0793282823==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0793282823==--
