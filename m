From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 103202] New: Tearing with reverse prime (intel
 primary, nouveau secondary)
Date: Tue, 10 Oct 2017 20:00:19 +0000
Message-ID: <bug-103202-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1904233873=="
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


--===============1904233873==
Content-Type: multipart/alternative; boundary="15076656201.336BCF8C.28821";
 charset="UTF-8"


--15076656201.336BCF8C.28821
Date: Tue, 10 Oct 2017 20:00:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D103202

            Bug ID: 103202
           Summary: Tearing with reverse prime (intel primary, nouveau
                    secondary)
           Product: xorg
           Version: 7.7 (2012.06)
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: post+fdo-8yesU2pFZgY@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

I have a Lenovo P50 and I am using Debian testing with Xorg 7.7 and Linux 4=
.12.
 The machine has its HDMI connector wired to the built-in NVidia card GM107=
GLM
(Quadro M2000M).  I am calling `xrandr --setprovideroutputsorce` to make the
connectors on the NVidia card available in my Xorg session.  On the Xorg si=
de,
both cards are using the modesetting driver.  My DE is Gnome 3.26.

With this setup, I am seeing no tearing when I run full-screen OpenGL
applications on the internal screen.  However, when I do the same on a scre=
en
connected via HDMI, there is tearing.  I am seeing the tearing both in my
little test application (https://git.ralfj.de/gltest.git) and when scrollin=
g in
Firefox.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15076656201.336BCF8C.28821
Date: Tue, 10 Oct 2017 20:00:20 +0000
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
   title=3D"NEW - Tearing with reverse prime (intel primary, nouveau second=
ary)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D103202">103202</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Tearing with reverse prime (intel primary, nouveau secondary)
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>7.7 (2012.06)
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
          <td>post+fdo&#64;ralfj.de
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>I have a Lenovo P50 and I am using Debian testing with Xorg 7.=
7 and Linux 4.12.
 The machine has its HDMI connector wired to the built-in NVidia card GM107=
GLM
(Quadro M2000M).  I am calling `xrandr --setprovideroutputsorce` to make the
connectors on the NVidia card available in my Xorg session.  On the Xorg si=
de,
both cards are using the modesetting driver.  My DE is Gnome 3.26.

With this setup, I am seeing no tearing when I run full-screen OpenGL
applications on the internal screen.  However, when I do the same on a scre=
en
connected via HDMI, there is tearing.  I am seeing the tearing both in my
little test application (<a href=3D"https://git.ralfj.de/gltest.git">https:=
//git.ralfj.de/gltest.git</a>) and when scrolling in
Firefox.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15076656201.336BCF8C.28821--

--===============1904233873==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1904233873==--
