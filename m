From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 102368] New: Since Archlinux testing migrate to mesa
 17.1.7, I got a pink overlay in webcam software.
Date: Wed, 23 Aug 2017 10:29:47 +0000
Message-ID: <bug-102368-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0491796229=="
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


--===============0491796229==
Content-Type: multipart/alternative; boundary="15034841880.f2Ed.8181";
 charset="UTF-8"


--15034841880.f2Ed.8181
Date: Wed, 23 Aug 2017 10:29:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D102368

            Bug ID: 102368
           Summary: Since Archlinux testing migrate to mesa 17.1.7, I got
                    a pink overlay in webcam software.
           Product: Mesa
           Version: unspecified
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: fredbezies-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

Created attachment 133714
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D133714&action=3Dedit
Pink overlay in webcam software

I reported a bug on archlinux tracker : https://bugs.archlinux.org/task/552=
43

But I noticed that if I installed nvidia-340xx for my old GeForce G210 grap=
hic
card, this pink overlay is no more alive.

Here is my card :=20

02:00.0 VGA compatible controller: NVIDIA Corporation GT218 [GeForce 210] (=
rev
a2)

I noticed reverting to Mesa 17.1.6 fixed the bug, but it is not a long term
solution.

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--15034841880.f2Ed.8181
Date: Wed, 23 Aug 2017 10:29:48 +0000
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
   title=3D"NEW - Since Archlinux testing migrate to mesa 17.1.7, I got a p=
ink overlay in webcam software."
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D102368">102368</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Since Archlinux testing migrate to mesa 17.1.7, I got a pink =
overlay in webcam software.
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
          <td>Other
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>All
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
          <td>fredbezies&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D133714=
" name=3D"attach_133714" title=3D"Pink overlay in webcam software">attachme=
nt 133714</a> <a href=3D"attachment.cgi?id=3D133714&amp;action=3Dedit" titl=
e=3D"Pink overlay in webcam software">[details]</a></span>
Pink overlay in webcam software

I reported a bug on archlinux tracker : <a href=3D"https://bugs.archlinux.o=
rg/task/55243">https://bugs.archlinux.org/task/55243</a>

But I noticed that if I installed nvidia-340xx for my old GeForce G210 grap=
hic
card, this pink overlay is no more alive.

Here is my card :=20

02:00.0 VGA compatible controller: NVIDIA Corporation GT218 [GeForce 210] (=
rev
a2)

I noticed reverting to Mesa 17.1.6 fixed the bug, but it is not a long term
solution.</pre>
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

--15034841880.f2Ed.8181--

--===============0491796229==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0491796229==--
