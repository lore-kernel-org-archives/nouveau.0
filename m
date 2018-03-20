From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 105626] New: BUG: unable to handle kernel NULL
 pointer dereference at 0000000000000040
Date: Tue, 20 Mar 2018 14:28:53 +0000
Message-ID: <bug-105626-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0137591668=="
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


--===============0137591668==
Content-Type: multipart/alternative; boundary="15215561340.27c4c8.16308"
Content-Transfer-Encoding: 7bit


--15215561340.27c4c8.16308
Date: Tue, 20 Mar 2018 14:28:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D105626

            Bug ID: 105626
           Summary: BUG: unable to handle kernel NULL pointer dereference
                    at 0000000000000040
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: major
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: philip.raets-CNXmb7IdZIWZIoH1IeqzKA@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 138225
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D138225&action=3Dedit
journalctl

Nouveau crashes from time to time, it happens when I open some jpg-files,
tiff-files, when I maximize windows, when I am developing in Android Studio,
... It happens randomly, but a few times a day. I can login with ssh throug=
h my
phone (because my desktop is not responding to anything, I can only move the
mouse cursor around), and then force a reboot (which I don't like, because =
of
running virtual machines and unsaved work)

I've tried the patched kernel from openSUSE, but it still crashes.

My system is an up to date openSUSE Tumbleweed x86_64

Attached is my last boot log from "journalctl -k -b -1"

Thanks,

Philip

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15215561340.27c4c8.16308
Date: Tue, 20 Mar 2018 14:28:54 +0000
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
   title=3D"NEW - BUG: unable to handle kernel NULL pointer dereference at =
0000000000000040"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105626">105626</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>BUG: unable to handle kernel NULL pointer dereference at 0000=
000000000040
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
          <td>philip.raets&#64;telenet.be
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D138225=
" name=3D"attach_138225" title=3D"journalctl">attachment 138225</a> <a href=
=3D"attachment.cgi?id=3D138225&amp;action=3Dedit" title=3D"journalctl">[det=
ails]</a></span>
journalctl

Nouveau crashes from time to time, it happens when I open some jpg-files,
tiff-files, when I maximize windows, when I am developing in Android Studio,
... It happens randomly, but a few times a day. I can login with ssh throug=
h my
phone (because my desktop is not responding to anything, I can only move the
mouse cursor around), and then force a reboot (which I don't like, because =
of
running virtual machines and unsaved work)

I've tried the patched kernel from openSUSE, but it still crashes.

My system is an up to date openSUSE Tumbleweed x86_64

Attached is my last boot log from &quot;journalctl -k -b -1&quot;

Thanks,

Philip</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15215561340.27c4c8.16308--

--===============0137591668==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0137591668==--
