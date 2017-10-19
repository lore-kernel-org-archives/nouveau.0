From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 103357] New: Nouveau - GTX 1060 - Screen doesn't go
 on again after power saving settings set blank screen
Date: Thu, 19 Oct 2017 10:39:24 +0000
Message-ID: <bug-103357-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1616253904=="
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


--===============1616253904==
Content-Type: multipart/alternative; boundary="15084095640.b6Fb.1075";
 charset="UTF-8"


--15084095640.b6Fb.1075
Date: Thu, 19 Oct 2017 10:39:24 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D103357

            Bug ID: 103357
           Summary: Nouveau - GTX 1060 - Screen doesn't go on again after
                    power saving settings set blank screen
           Product: Mesa
           Version: 17.2
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: fedevx-/E1597aS9LQAvxtiuMwx3w@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

Created attachment 134917
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D134917&action=3Dedit
Journal

As mentioned in the subject, when Gnome power saving kicks in switching the
screen to blank, it does not recover back.

Moving the mouse or pressing the keys do not bring the screen up again. This
does not happen with the NVIDIA drivers, only with Nouveau.

Kernel: 4.13.7-1
xf86-video-nouveau 1.0.15-2
gnome-shell 3.26.1+3+g43ec5280b-1
mesa 17.2.2-1

Attached are the journal entries from the moment the laptop switched off the
screen until I tried to bring it back up, you'll see I tried changing its
brightness (but then again brightness control doesn't work anyway as you can
see in  https://bugzilla.kernel.org/show_bug.cgi?id=3D196931 )

Thanks!

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--15084095640.b6Fb.1075
Date: Thu, 19 Oct 2017 10:39:24 +0000
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
   title=3D"NEW - Nouveau - GTX 1060 - Screen doesn't go on again after pow=
er saving settings set blank screen"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D103357">103357</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Nouveau - GTX 1060 - Screen doesn't go on again after power s=
aving settings set blank screen
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>17.2
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
          <td>fedevx&#64;yahoo.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D134917=
" name=3D"attach_134917" title=3D"Journal">attachment 134917</a> <a href=3D=
"attachment.cgi?id=3D134917&amp;action=3Dedit" title=3D"Journal">[details]<=
/a></span>
Journal

As mentioned in the subject, when Gnome power saving kicks in switching the
screen to blank, it does not recover back.

Moving the mouse or pressing the keys do not bring the screen up again. This
does not happen with the NVIDIA drivers, only with Nouveau.

Kernel: 4.13.7-1
xf86-video-nouveau 1.0.15-2
gnome-shell 3.26.1+3+g43ec5280b-1
mesa 17.2.2-1

Attached are the journal entries from the moment the laptop switched off the
screen until I tried to bring it back up, you'll see I tried changing its
brightness (but then again brightness control doesn't work anyway as you can
see in  <a href=3D"https://bugzilla.kernel.org/show_bug.cgi?id=3D196931">ht=
tps://bugzilla.kernel.org/show_bug.cgi?id=3D196931</a> )

Thanks!</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
          <li>You are the QA Contact for the bug.</li>
      </ul>
    </body>
</html>=

--15084095640.b6Fb.1075--

--===============1616253904==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1616253904==--
