From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 104897] New: nouveau memory allocation issue causes
 screen distortions under KDE
Date: Thu, 01 Feb 2018 08:36:09 +0000
Message-ID: <bug-104897-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1192459935=="
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


--===============1192459935==
Content-Type: multipart/alternative; boundary="15174741690.572FdB.23469"
Content-Transfer-Encoding: 7bit


--15174741690.572FdB.23469
Date: Thu, 1 Feb 2018 08:36:09 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D104897

            Bug ID: 104897
           Summary: nouveau memory allocation issue causes screen
                    distortions under KDE
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: major
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: estellnb-7Km2I/eHSAQdnm+yROfE0A@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 137106
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D137106&action=3Dedit
screenshot

Working under mesa-common-dev 13.0.6-1+b2, plasma-workspace 4:5.8.6-2.1, Xo=
rg
1.19.2 and kernel 4.15.0-rc9+ I do get weird screen distortions under KDE as
soon as I enable my external 4K display. As KDE runs stable and fine with my
integrated display in a much lower resolution I would guess this to be a me=
mory
allocation issue of nouveau. Other less memory intense desktop environments
like Xfce still run fine under 4K. The issue is known since long (see also =
the
KDE bug: https://bugs.kde.org/show_bug.cgi?id=3D368275)

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15174741690.572FdB.23469
Date: Thu, 1 Feb 2018 08:36:09 +0000
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
   title=3D"NEW - nouveau memory allocation issue causes screen distortions=
 under KDE"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D104897">104897</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>nouveau memory allocation issue causes screen distortions und=
er KDE
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
          <td>estellnb&#64;elstel.org
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D137106=
" name=3D"attach_137106" title=3D"screenshot">attachment 137106</a> <a href=
=3D"attachment.cgi?id=3D137106&amp;action=3Dedit" title=3D"screenshot">[det=
ails]</a></span>
screenshot

Working under mesa-common-dev 13.0.6-1+b2, plasma-workspace 4:5.8.6-2.1, Xo=
rg
1.19.2 and kernel 4.15.0-rc9+ I do get weird screen distortions under KDE as
soon as I enable my external 4K display. As KDE runs stable and fine with my
integrated display in a much lower resolution I would guess this to be a me=
mory
allocation issue of nouveau. Other less memory intense desktop environments
like Xfce still run fine under 4K. The issue is known since long (see also =
the
KDE bug: <a href=3D"https://bugs.kde.org/show_bug.cgi?id=3D368275">https://=
bugs.kde.org/show_bug.cgi?id=3D368275</a>)</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15174741690.572FdB.23469--

--===============1192459935==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1192459935==--
