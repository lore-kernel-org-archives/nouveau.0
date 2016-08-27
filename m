From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 97511] New: GM204/modesetting DDX: Using PageFlip
 causes syncing issue/screen corruption
Date: Sat, 27 Aug 2016 21:22:11 +0000
Message-ID: <bug-97511-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0428337991=="
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


--===============0428337991==
Content-Type: multipart/alternative; boundary="14723329310.C1AFef58.10816";
 charset="UTF-8"


--14723329310.C1AFef58.10816
Date: Sat, 27 Aug 2016 21:22:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D97511

            Bug ID: 97511
           Summary: GM204/modesetting DDX: Using PageFlip causes syncing
                    issue/screen corruption
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: freedesktop-bugs-dADiZSo7rdJAfugRpC6u6w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 126073
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D126073&action=3Dedit
Screenshot showing the issue on Mumble and Audacious

After working around bug #94990 so that I can use kernel modesetting, I find
that when I run a Qt application inside my regular desktop environment,
Enlightenment E20 (0.20.5) in Xorg server 1.18.4, I get issues with screen
updates, resulting in artifacts such as shown in the attached screenshot. It
appears to have issues switching between the current state and a previously
drawn state.

The issue does not appear in any non-Qt applications as far as I can tell. =
Note
that in the attached screenshot, Mumble is a Qt4 app and Audacious is a Qt5=
 app
(here running using the Winamp Classic interface). Only some Qt widgets app=
ear
to be affected; so far I've only encountered the issue with menus, graphical
tab bars (such as the one Audacious uses in its preferences window), toolba=
rs,
and however Audacious renders the scrolling text in its Winamp Classic
interface.

After talking with a nouveau dev on IRC (karolherbst), we determined that t=
he
issue does not appear when the PageFlip option is set to 0 in an xorg.conf.d
file. (I will attach the configuration file I use to this bug.) I also mana=
ged
to determine that the corruption does not appear when I use another window
manager without a compositor, such as mwm. Interestingly, the corruption do=
es
not reappear if I use mwm together with compton, a standalone compositor.

This bug only started happening after updating to Xorg server version 1.18.4
from 1.17.4. I have not as yet tested any of the previous 1.18.x releases; =
if
this is desired, please let me know.

Summary of system:

* Gentoo Linux, amd64, fully up-to-date, using x11 overlay
* NVidia GeForce GTX 970 (GM204)
* Kernel version 4.7.0 (with a modification to bypass bug #94990)
* Xorg server 1.18.4
* Mesa 12.0.1
* Enlightenment 0.20.5
* Qt versions installed: 4.8.6 and 5.6.1.
* Examples of Qt applications tested: Mumble (1.2.16), Audacious (3.7.1), V=
LC
(2.2.4), Wireshark (2.0.5).

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14723329310.C1AFef58.10816
Date: Sat, 27 Aug 2016 21:22:11 +0000
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
   title=3D"NEW - GM204/modesetting DDX: Using PageFlip causes syncing issu=
e/screen corruption"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D97511">97511</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>GM204/modesetting DDX: Using PageFlip causes syncing issue/sc=
reen corruption
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
          <td>freedesktop-bugs&#64;theblob.org
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D126073=
" name=3D"attach_126073" title=3D"Screenshot showing the issue on Mumble an=
d Audacious">attachment 126073</a> <a href=3D"attachment.cgi?id=3D126073&am=
p;action=3Dedit" title=3D"Screenshot showing the issue on Mumble and Audaci=
ous">[details]</a></span>
Screenshot showing the issue on Mumble and Audacious

After working around <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [GM204] GTX 970 + 4GB VRAM fails at secboot (v4.6+)"
   href=3D"show_bug.cgi?id=3D94990">bug #94990</a> so that I can use kernel=
 modesetting, I find
that when I run a Qt application inside my regular desktop environment,
Enlightenment E20 (0.20.5) in Xorg server 1.18.4, I get issues with screen
updates, resulting in artifacts such as shown in the attached screenshot. It
appears to have issues switching between the current state and a previously
drawn state.

The issue does not appear in any non-Qt applications as far as I can tell. =
Note
that in the attached screenshot, Mumble is a Qt4 app and Audacious is a Qt5=
 app
(here running using the Winamp Classic interface). Only some Qt widgets app=
ear
to be affected; so far I've only encountered the issue with menus, graphical
tab bars (such as the one Audacious uses in its preferences window), toolba=
rs,
and however Audacious renders the scrolling text in its Winamp Classic
interface.

After talking with a nouveau dev on IRC (karolherbst), we determined that t=
he
issue does not appear when the PageFlip option is set to 0 in an xorg.conf.d
file. (I will attach the configuration file I use to this bug.) I also mana=
ged
to determine that the corruption does not appear when I use another window
manager without a compositor, such as mwm. Interestingly, the corruption do=
es
not reappear if I use mwm together with compton, a standalone compositor.

This bug only started happening after updating to Xorg server version 1.18.4
from 1.17.4. I have not as yet tested any of the previous 1.18.x releases; =
if
this is desired, please let me know.

Summary of system:

* Gentoo Linux, amd64, fully up-to-date, using x11 overlay
* NVidia GeForce GTX 970 (GM204)
* Kernel version 4.7.0 (with a modification to bypass <a class=3D"bz_bug_li=
nk=20
          bz_status_NEW "
   title=3D"NEW - [GM204] GTX 970 + 4GB VRAM fails at secboot (v4.6+)"
   href=3D"show_bug.cgi?id=3D94990">bug #94990</a>)
* Xorg server 1.18.4
* Mesa 12.0.1
* Enlightenment 0.20.5
* Qt versions installed: 4.8.6 and 5.6.1.
* Examples of Qt applications tested: Mumble (1.2.16), Audacious (3.7.1), V=
LC
(2.2.4), Wireshark (2.0.5).</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14723329310.C1AFef58.10816--

--===============0428337991==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0428337991==--
