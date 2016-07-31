From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 97152] New: xorg freezes (crash) right after resume
 with nouveau [Nvidia 8600]
Date: Sun, 31 Jul 2016 08:32:45 +0000
Message-ID: <bug-97152-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0758481853=="
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


--===============0758481853==
Content-Type: multipart/alternative; boundary="14699539650.00b6f20.13837";
 charset="UTF-8"


--14699539650.00b6f20.13837
Date: Sun, 31 Jul 2016 08:32:45 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D97152

            Bug ID: 97152
           Summary: xorg freezes (crash) right after resume with nouveau
                    [Nvidia 8600]
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: major
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: x.para-9Vj9tDbzfuSlVyrhU4qvOw@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 125443
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D125443&action=3Dedit
Kernel LOG

on Gentoo KDE plasma 5 (5.6.5), when system is resumed from RAM suspend, sy=
stem
can be used until any new window is opened. it can be any application..

After that xorg freezes completely, mouse can be moved, but system does not
react to any keyboard event. ssh remains avail for debugs. This can be repe=
ated
anytime.=20

uname -a
Linux stable 4.4.6-gentoo #1 SMP Sun Jul 3 22:09:52 CEST 2016 x86_64 Intel(=
R)
Core(TM)2 CPU 6700 @ 2.66GHz GenuineIntel GNU/Linux

xorg-server 1.17.4

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14699539650.00b6f20.13837
Date: Sun, 31 Jul 2016 08:32:45 +0000
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
   title=3D"NEW - xorg freezes (crash) right after resume with nouveau [Nvi=
dia 8600]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D97152">97152</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>xorg freezes (crash) right after resume with nouveau [Nvidia =
8600]
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
          <td>x.para&#64;seznam.cz
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D125443=
" name=3D"attach_125443" title=3D"Kernel LOG">attachment 125443</a> <a href=
=3D"attachment.cgi?id=3D125443&amp;action=3Dedit" title=3D"Kernel LOG">[det=
ails]</a></span>
Kernel LOG

on Gentoo KDE plasma 5 (5.6.5), when system is resumed from RAM suspend, sy=
stem
can be used until any new window is opened. it can be any application..

After that xorg freezes completely, mouse can be moved, but system does not
react to any keyboard event. ssh remains avail for debugs. This can be repe=
ated
anytime.=20

uname -a
Linux stable 4.4.6-gentoo #1 SMP Sun Jul 3 22:09:52 CEST 2016 x86_64 Intel(=
R)
Core(TM)2 CPU 6700 &#64; 2.66GHz GenuineIntel GNU/Linux

xorg-server 1.17.4</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14699539650.00b6f20.13837--

--===============0758481853==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0758481853==--
