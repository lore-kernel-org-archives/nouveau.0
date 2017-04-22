From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 100760] New: Rapid flickering when an app is placed
 on the second Nouveau ZaphodHeads display
Date: Sat, 22 Apr 2017 22:39:02 +0000
Message-ID: <bug-100760-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0776008248=="
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


--===============0776008248==
Content-Type: multipart/alternative; boundary="14929007420.45Eb.23576";
 charset="UTF-8"


--14929007420.45Eb.23576
Date: Sat, 22 Apr 2017 22:39:02 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D100760

            Bug ID: 100760
           Summary: Rapid flickering when an app is placed on the second
                    Nouveau ZaphodHeads display
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: major
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: mrj-ejQy8aU/RJumpXlQD71PVDSf8X3wrgjD@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

For many years I've configured my second monitor as a separate X display
because this allows the monitors to have an independent sets of virtual
desktops. With five virtual desktops on each monitor, I could select and
display 25 combinations instead of the five with Xinerama.

This worked fine with the "separate X displays" mode of the proprietary Nvi=
dia
driver. But eventually the second display couldn't display a background ima=
ge
(black only). Later, apps started from a panel or terminal on the second
display would come up on the first unless I set the DISPLAY variable to :0.=
1 on
the command lines of both launchers and terminal commands. I could live with
both of these problems.

When the proprietary Nvidia driver no longer supported my graphics card in =
the
latest X, I moved to Nouveau, using the ZaphodHeads option to get the
equivalent of the "separate X displays" mode. This worked, though I still h=
ad
the same problems with getting stuff to appear on the second display.

This was with Fedora 23. I've just upgraded to Fedora 25, and although the
second X monitor and display still comes up (black only, but a pointer can =
be
moved around it), nothing can be placed on it. If I run "DISPLAY=3D:0.1
mate-terminal" on the first display, the terminal does appear on the second,
but there is a rapid flickering of both displays, sometimes ending in a mac=
hine
crash, and the new terminal cannot be used. This happens with both Mate and
Gnome 3.

Xinerama mode (empty xorg.conf) works fine, though of course I've now got o=
nly
five instead of 25 virtual desktop combinations.

The current Fedora 25 Nouveau version is xorg-x11-drv-nouveau.x86_64
1:1.0.14-2.fc25, and the Kernel version is 4.10.10-200.fc25.x86_64.

* Is this a Nouveau problem?
* Is this a known problem?
* Is this unlikely to be fixed because "Zaphod mode is a legacy feature"
https://bugs.freedesktop.org/show_bug.cgi?id=3D99103#c6 ?
* Is there another way to get dedicated sets of virtual desktops for each
monitor?

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14929007420.45Eb.23576
Date: Sat, 22 Apr 2017 22:39:02 +0000
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
   title=3D"NEW - Rapid flickering when an app is placed on the second Nouv=
eau ZaphodHeads display"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100760">100760</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Rapid flickering when an app is placed on the second Nouveau =
ZaphodHeads display
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
          <td>mrj&#64;advancedcontrols.com.au
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>For many years I've configured my second monitor as a separate=
 X display
because this allows the monitors to have an independent sets of virtual
desktops. With five virtual desktops on each monitor, I could select and
display 25 combinations instead of the five with Xinerama.

This worked fine with the &quot;separate X displays&quot; mode of the propr=
ietary Nvidia
driver. But eventually the second display couldn't display a background ima=
ge
(black only). Later, apps started from a panel or terminal on the second
display would come up on the first unless I set the DISPLAY variable to :0.=
1 on
the command lines of both launchers and terminal commands. I could live with
both of these problems.

When the proprietary Nvidia driver no longer supported my graphics card in =
the
latest X, I moved to Nouveau, using the ZaphodHeads option to get the
equivalent of the &quot;separate X displays&quot; mode. This worked, though=
 I still had
the same problems with getting stuff to appear on the second display.

This was with Fedora 23. I've just upgraded to Fedora 25, and although the
second X monitor and display still comes up (black only, but a pointer can =
be
moved around it), nothing can be placed on it. If I run &quot;DISPLAY=3D:0.1
mate-terminal&quot; on the first display, the terminal does appear on the s=
econd,
but there is a rapid flickering of both displays, sometimes ending in a mac=
hine
crash, and the new terminal cannot be used. This happens with both Mate and
Gnome 3.

Xinerama mode (empty xorg.conf) works fine, though of course I've now got o=
nly
five instead of 25 virtual desktop combinations.

The current Fedora 25 Nouveau version is xorg-x11-drv-nouveau.x86_64
1:1.0.14-2.fc25, and the Kernel version is 4.10.10-200.fc25.x86_64.

* Is this a Nouveau problem?
* Is this a known problem?
* Is this unlikely to be fixed because &quot;Zaphod mode is a legacy featur=
e&quot;
<a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Same output (DisplayPort) is used in multi-head configura=
tion for different Devices/Displays"
   href=3D"show_bug.cgi?id=3D99103#c6">https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D99103#c6</a> ?
* Is there another way to get dedicated sets of virtual desktops for each
monitor?</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14929007420.45Eb.23576--

--===============0776008248==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0776008248==--
