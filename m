From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 101447] New: Nouveau on GP106 can't work with
 another framebuffer drivers (possibly uvesafb)
Date: Thu, 15 Jun 2017 12:03:23 +0000
Message-ID: <bug-101447-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1208887750=="
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


--===============1208887750==
Content-Type: multipart/alternative; boundary="14975282031.aa2ECc0.23126";
 charset="UTF-8"


--14975282031.aa2ECc0.23126
Date: Thu, 15 Jun 2017 12:03:23 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D101447

            Bug ID: 101447
           Summary: Nouveau on GP106 can't work with another framebuffer
                    drivers (possibly uvesafb)
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: barracuda72-5URONGGNgjI@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

At boot then uvesafb first picked up and then replaced with nouveau screen =
goes
into distorted state. X can be run but nothing apperars on the screen except
garbage. Switching between VT's works, but screen is still distorted.
Disabling all other framebuffer drivers in kernel config helped to solve th=
is
issue.
Logs before disabling:
dmesg: https://pastebin.com/YC3kX7E3 (esp. lines 150 and 152 to 154)
Xorg: https://pastebin.com/JTyYynRd
Logs after disabling:
dmesg: https://pastebin.com/Dkgk67zA
Xorg: https://pastebin.com/VaJpqGxb

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14975282031.aa2ECc0.23126
Date: Thu, 15 Jun 2017 12:03:23 +0000
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
   title=3D"NEW - Nouveau on GP106 can't work with another framebuffer driv=
ers (possibly uvesafb)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101447">101447</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Nouveau on GP106 can't work with another framebuffer drivers =
(possibly uvesafb)
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
          <td>barracuda72&#64;bk.ru
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>At boot then uvesafb first picked up and then replaced with no=
uveau screen goes
into distorted state. X can be run but nothing apperars on the screen except
garbage. Switching between VT's works, but screen is still distorted.
Disabling all other framebuffer drivers in kernel config helped to solve th=
is
issue.
Logs before disabling:
dmesg: <a href=3D"https://pastebin.com/YC3kX7E3">https://pastebin.com/YC3kX=
7E3</a> (esp. lines 150 and 152 to 154)
Xorg: <a href=3D"https://pastebin.com/JTyYynRd">https://pastebin.com/JTyYyn=
Rd</a>
Logs after disabling:
dmesg: <a href=3D"https://pastebin.com/Dkgk67zA">https://pastebin.com/Dkgk6=
7zA</a>
Xorg: <a href=3D"https://pastebin.com/VaJpqGxb">https://pastebin.com/VaJpqG=
xb</a></pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14975282031.aa2ECc0.23126--

--===============1208887750==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1208887750==--
