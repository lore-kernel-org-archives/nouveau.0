From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 107431] New: Crash system
Date: Mon, 30 Jul 2018 22:16:22 +0000
Message-ID: <bug-107431-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0889903526=="
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


--===============0889903526==
Content-Type: multipart/alternative; boundary="15329889820.F8F2D.5268"
Content-Transfer-Encoding: 7bit


--15329889820.F8F2D.5268
Date: Mon, 30 Jul 2018 22:16:22 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D107431

            Bug ID: 107431
           Summary: Crash system
           Product: Mesa
           Version: 18.0
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: critical
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: 17150066-Whzb9qvJsN4AvxtiuMwx3w@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

Created attachment 140901
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D140901&action=3Dedit
can not capture the error at the exact moment. Crash immediately.

With the nvidia private driver does not crash the system with this applicat=
ion.

### Steps to Reproduce

1. [First Step]
Open iota (./iota or ./iota --ignore-gpu-blacklist
2. [Second Step]
Click on any menu to show the submenus
3. [and so on...]
Sliding between the menus continuously, just move the mouse

**Expected behavior:** [What you expected to happen]
when positioned in the menu the submenus are displayed

**Actual behavior:** [What actually happened]
Mouse icon stays still before the system does not respond

### Versions

[OS Version]
OpenSuse Leap Versi=C3=B3n 15.0 de 64-bit
N=C3=BAcleo Linux 4.12.14-lp150.12.4-default x86_64
MATE 1.20.1

[Wallet Version]
2.5.7

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--15329889820.F8F2D.5268
Date: Mon, 30 Jul 2018 22:16:22 +0000
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
   title=3D"NEW - Crash system"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D107431">107431</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Crash system
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
          <td>17150066&#64;opayq.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D140901=
" name=3D"attach_140901" title=3D"can not capture the error at the exact mo=
ment. Crash immediately.">attachment 140901</a> <a href=3D"attachment.cgi?i=
d=3D140901&amp;action=3Dedit" title=3D"can not capture the error at the exa=
ct moment. Crash immediately.">[details]</a></span>
can not capture the error at the exact moment. Crash immediately.

With the nvidia private driver does not crash the system with this applicat=
ion.

### Steps to Reproduce

1. [First Step]
Open iota (./iota or ./iota --ignore-gpu-blacklist
2. [Second Step]
Click on any menu to show the submenus
3. [and so on...]
Sliding between the menus continuously, just move the mouse

**Expected behavior:** [What you expected to happen]
when positioned in the menu the submenus are displayed

**Actual behavior:** [What actually happened]
Mouse icon stays still before the system does not respond

### Versions

[OS Version]
OpenSuse Leap Versi=C3=B3n 15.0 de 64-bit
N=C3=BAcleo Linux 4.12.14-lp150.12.4-default x86_64
MATE 1.20.1

[Wallet Version]
2.5.7</pre>
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

--15329889820.F8F2D.5268--

--===============0889903526==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0889903526==--
