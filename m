From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 109341] New: Plasma Wayland locks up immediately on
 sign in
Date: Mon, 14 Jan 2019 03:00:55 +0000
Message-ID: <bug-109341-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1415404096=="
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


--===============1415404096==
Content-Type: multipart/alternative; boundary="15474348550.B9E6.10209"
Content-Transfer-Encoding: 7bit


--15474348550.B9E6.10209
Date: Mon, 14 Jan 2019 03:00:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109341

            Bug ID: 109341
           Summary: Plasma Wayland locks up immediately on sign in
           Product: Mesa
           Version: 18.0
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: blocker
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: etna-jjFNsPSvq+iXDw4h08c5KA@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

Created attachment 143094
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D143094&action=3Dedit
dmesg immediately after lockup

Hello Nouveau devs:

I'm facing an issue where attempting to sign into a Wayland Plasma session
causes the entire GUI to lock up immediately. Under some circumstances, I c=
an
still SSH into the unit, but i usually can't do much before even the SSH
session locks up as well.

STEPS TO REPRODUCE
1. Boot computer
2. Sign in to Plasma (Wayland) at SDDM

OBSERVED RESULT
Machine instantly locks up. Sometimes, I might be able to SSH in, but dmesg
only prints a bunch of Nouveau FIFO engine fault errors=20

EXPECTED RESULT
PLasma Wayland session starts normally.

SOFTWARE/OS VERSIONS
Linux/KDE Plasma: OpenSUSE Leap 15.0
(available in About System)
KDE Plasma Version: 5.12

ADDITIONAL INFORMATION
I have done the following as well:

- Upgrade the default OpenSUSE kernel to a vanilla 4.18 kernel from kernel.=
org.
Lockup still occurs upon sign in
- Upgrade the default=20
- Tested a Wayland session with Gnome successfully
- Upgraded Plasma to 5.14 with the repo recommended by OpenSUSE here and lo=
ckup
still occurs
- Booted with nouveau.noaccel=3D1 and Plasma Wayland successfully loads but=
 with
terrible performance

This issue was reported to the Plasma bug tracker and they closed it on the
grounds that anything which causes a system lockup is operates much lower t=
han
the DE and should thus be filed with Nouveau.

Attached dmesg and session logs.

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--15474348550.B9E6.10209
Date: Mon, 14 Jan 2019 03:00:55 +0000
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
   title=3D"NEW - Plasma Wayland locks up immediately on sign in"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109341">109341</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Plasma Wayland locks up immediately on sign in
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
          <td>blocker
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
          <td>etna&#64;linuxmail.org
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D143094=
" name=3D"attach_143094" title=3D"dmesg immediately after lockup">attachmen=
t 143094</a> <a href=3D"attachment.cgi?id=3D143094&amp;action=3Dedit" title=
=3D"dmesg immediately after lockup">[details]</a></span>
dmesg immediately after lockup

Hello Nouveau devs:

I'm facing an issue where attempting to sign into a Wayland Plasma session
causes the entire GUI to lock up immediately. Under some circumstances, I c=
an
still SSH into the unit, but i usually can't do much before even the SSH
session locks up as well.

STEPS TO REPRODUCE
1. Boot computer
2. Sign in to Plasma (Wayland) at SDDM

OBSERVED RESULT
Machine instantly locks up. Sometimes, I might be able to SSH in, but dmesg
only prints a bunch of Nouveau FIFO engine fault errors=20

EXPECTED RESULT
PLasma Wayland session starts normally.

SOFTWARE/OS VERSIONS
Linux/KDE Plasma: OpenSUSE Leap 15.0
(available in About System)
KDE Plasma Version: 5.12

ADDITIONAL INFORMATION
I have done the following as well:

- Upgrade the default OpenSUSE kernel to a vanilla 4.18 kernel from kernel.=
org.
Lockup still occurs upon sign in
- Upgrade the default=20
- Tested a Wayland session with Gnome successfully
- Upgraded Plasma to 5.14 with the repo recommended by OpenSUSE here and lo=
ckup
still occurs
- Booted with nouveau.noaccel=3D1 and Plasma Wayland successfully loads but=
 with
terrible performance

This issue was reported to the Plasma bug tracker and they closed it on the
grounds that anything which causes a system lockup is operates much lower t=
han
the DE and should thus be filed with Nouveau.

Attached dmesg and session logs.</pre>
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

--15474348550.B9E6.10209--

--===============1415404096==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1415404096==--
