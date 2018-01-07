From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 104530] New: Desktop freeze when closing apps
 composited by compton running on GTX 760
Date: Sun, 07 Jan 2018 19:39:38 +0000
Message-ID: <bug-104530-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1263093340=="
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


--===============1263093340==
Content-Type: multipart/alternative; boundary="15153539791.fEaa.30952";
 charset="UTF-8"


--15153539791.fEaa.30952
Date: Sun, 7 Jan 2018 19:39:39 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D104530

            Bug ID: 104530
           Summary: Desktop freeze when closing apps composited by compton
                    running on GTX 760
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: major
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: sdelang-Efhee0H7lKpGWvitb5QawA@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 136600
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D136600&action=3Dedit
dmesg from crashing kernel

Hello, I have been experiencing crashes when using nouveau and compton, usi=
ng
i3-gaps as a tiling WM.

Machine responds to SSH, but the X desktop freezes and e.g. numlock does not
respond anymore.

I can't manage to reproduce the issue when compton is not started. I have f=
ound
a relatively reliable way to reproduce it:
1. Start firefox, xterm
2. Mod-shift-Q to close xterm
3. (optional?) Mess around firefox, create and remove tabs etc
4. Start xterm, start over from 2
Eventually, the desktop will hang on step 2 and switching to a TTY becomes
impossible. Machine still responds to SSH.

I am running Arch Linux with:
linux-ck 4.14.12-3 (from AUR, compiled today)
mesa 17.3.1-2
xorg-server 1.19.6-2
xf86-video-nouveau 1.0.15-2
libdrm 2.4.89-1

$ uname -a
Linux sdelang-arch 4.14.12-3-ck #1 SMP PREEMPT Sun Jan 7 16:31:01 CET 2018
x86_64 GNU/Linux

Thanks!

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15153539791.fEaa.30952
Date: Sun, 7 Jan 2018 19:39:39 +0000
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
   title=3D"NEW - Desktop freeze when closing apps composited by compton ru=
nning on GTX 760"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D104530">104530</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Desktop freeze when closing apps composited by compton runnin=
g on GTX 760
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
          <td>sdelang&#64;sdelang.fr
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D136600=
" name=3D"attach_136600" title=3D"dmesg from crashing kernel">attachment 13=
6600</a> <a href=3D"attachment.cgi?id=3D136600&amp;action=3Dedit" title=3D"=
dmesg from crashing kernel">[details]</a></span>
dmesg from crashing kernel

Hello, I have been experiencing crashes when using nouveau and compton, usi=
ng
i3-gaps as a tiling WM.

Machine responds to SSH, but the X desktop freezes and e.g. numlock does not
respond anymore.

I can't manage to reproduce the issue when compton is not started. I have f=
ound
a relatively reliable way to reproduce it:
1. Start firefox, xterm
2. Mod-shift-Q to close xterm
3. (optional?) Mess around firefox, create and remove tabs etc
4. Start xterm, start over from 2
Eventually, the desktop will hang on step 2 and switching to a TTY becomes
impossible. Machine still responds to SSH.

I am running Arch Linux with:
linux-ck 4.14.12-3 (from AUR, compiled today)
mesa 17.3.1-2
xorg-server 1.19.6-2
xf86-video-nouveau 1.0.15-2
libdrm 2.4.89-1

$ uname -a
Linux sdelang-arch 4.14.12-3-ck #1 SMP PREEMPT Sun Jan 7 16:31:01 CET 2018
x86_64 GNU/Linux

Thanks!</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15153539791.fEaa.30952--

--===============1263093340==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1263093340==--
