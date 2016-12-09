From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 99033] New: [NV67] Incomplete implementation of
	OpenGL 2.1
Date: Fri, 09 Dec 2016 11:09:44 +0000
Message-ID: <bug-99033-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0479090253=="
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


--===============0479090253==
Content-Type: multipart/alternative; boundary="14812817840.5F526.18486";
 charset="UTF-8"


--14812817840.5F526.18486
Date: Fri, 9 Dec 2016 11:09:44 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D99033

            Bug ID: 99033
           Summary: [NV67] Incomplete implementation of OpenGL 2.1
           Product: Mesa
           Version: 13.0
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: major
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: 13ilya-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

Created attachment 128388
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D128388&action=3Dedit
nouveau

openSUSE Tumbleweed x86_64 / nouveau Gallium 0.4 on NV67 (Nvidia GeForce 70=
00M)
/ OpenGL 2.1 / Mesa 13.0.2 / kernel 4.8.12-default / GCC 6.2 / LLVM 3.8.1

Not all OpenGL 2.1 extensions are implemented in the nouveau, compared to
nvidia 304.131, which is why some of the effects of KDE4, using OpenGL 2.1,=
 do
not work correctly, and KDE5 constantly falling. Also, do not grip extensio=
ns
reflected in the work of some emulators game consoles, such as yabause, whi=
ch
runs on nvidia and shows black screen on the nouveau.

Files with the following extensions for nvidia 304.131 and nouveau attached.

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--14812817840.5F526.18486
Date: Fri, 9 Dec 2016 11:09:44 +0000
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
   title=3D"NEW - [NV67] Incomplete implementation of OpenGL 2.1"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99033">99033</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[NV67] Incomplete implementation of OpenGL 2.1
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>13.0
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
          <td>13ilya&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D128388=
" name=3D"attach_128388" title=3D"nouveau">attachment 128388</a> <a href=3D=
"attachment.cgi?id=3D128388&amp;action=3Dedit" title=3D"nouveau">[details]<=
/a></span>
nouveau

openSUSE Tumbleweed x86_64 / nouveau Gallium 0.4 on NV67 (Nvidia GeForce 70=
00M)
/ OpenGL 2.1 / Mesa 13.0.2 / kernel 4.8.12-default / GCC 6.2 / LLVM 3.8.1

Not all OpenGL 2.1 extensions are implemented in the nouveau, compared to
nvidia 304.131, which is why some of the effects of KDE4, using OpenGL 2.1,=
 do
not work correctly, and KDE5 constantly falling. Also, do not grip extensio=
ns
reflected in the work of some emulators game consoles, such as yabause, whi=
ch
runs on nvidia and shows black screen on the nouveau.

Files with the following extensions for nvidia 304.131 and nouveau attached=
.</pre>
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

--14812817840.5F526.18486--

--===============0479090253==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0479090253==--
