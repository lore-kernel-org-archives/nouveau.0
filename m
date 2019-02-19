From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 109681] New: Nvidia GT710 => nouveau + wayland +
 swayWM => crash when use acceleration (open Firefox)
Date: Tue, 19 Feb 2019 22:23:33 +0000
Message-ID: <bug-109681-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0306331412=="
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


--===============0306331412==
Content-Type: multipart/alternative; boundary="15506150130.7cff5.15735"
Content-Transfer-Encoding: 7bit


--15506150130.7cff5.15735
Date: Tue, 19 Feb 2019 22:23:33 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109681

            Bug ID: 109681
           Summary: Nvidia GT710 =3D> nouveau + wayland + swayWM =3D> crash
                    when use acceleration (open Firefox)
           Product: Mesa
           Version: 18.3
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: critical
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: nolik03-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

Hi everyone.
System: 4.20.10-arch1-1-ARCH
Faced with the Nouveau driver problem for the GT710 card. After loading to =
WM
(swayWM), when opening the Firefox, the screen was immediately frosted and
nothing was done.
dmesg output itself:
https://gist.github.com/nolik/1179a25a7a84f979aaca3d9b0badb08f

[ 99.818101] nouveau 0000:26:00.0: fifo: CHSW_ERROR 00000002
[ 99.818106] nouveau 0000:26:00.0: fifo: FB_FLUSH_TIMEOUT

According ArchWiki i try to add nouveau.noaccel=3D1 to kernel params =3D> a=
s a
result WM stop freezing and able to use, but ALL LAGS and snowing on the
screen.
I try to disable GPU acceleration in Firefox, and run it =3D> it's not work.
Try to add QT_XCB_FORCE_SOFTWARE_OPENGL=3D1 to env variable and lunch Chrom=
ium =3D>
works to first button/action and freezing all.

Unfortunately, i have to use Nouveau coz swayWM doesn't support Nvidia driv=
ers.

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--15506150130.7cff5.15735
Date: Tue, 19 Feb 2019 22:23:33 +0000
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
   title=3D"NEW - Nvidia GT710 =3D&gt; nouveau + wayland + swayWM =3D&gt; c=
rash when use acceleration (open Firefox)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109681">109681</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Nvidia GT710 =3D&gt; nouveau + wayland + swayWM =3D&gt; crash=
 when use acceleration (open Firefox)
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>18.3
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
          <td>critical
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
          <td>nolik03&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Hi everyone.
System: 4.20.10-arch1-1-ARCH
Faced with the Nouveau driver problem for the GT710 card. After loading to =
WM
(swayWM), when opening the Firefox, the screen was immediately frosted and
nothing was done.
dmesg output itself:
<a href=3D"https://gist.github.com/nolik/1179a25a7a84f979aaca3d9b0badb08f">=
https://gist.github.com/nolik/1179a25a7a84f979aaca3d9b0badb08f</a>

[ 99.818101] nouveau 0000:26:00.0: fifo: CHSW_ERROR 00000002
[ 99.818106] nouveau 0000:26:00.0: fifo: FB_FLUSH_TIMEOUT

According ArchWiki i try to add nouveau.noaccel=3D1 to kernel params =3D&gt=
; as a
result WM stop freezing and able to use, but ALL LAGS and snowing on the
screen.
I try to disable GPU acceleration in Firefox, and run it =3D&gt; it's not w=
ork.
Try to add QT_XCB_FORCE_SOFTWARE_OPENGL=3D1 to env variable and lunch Chrom=
ium =3D&gt;
works to first button/action and freezing all.

Unfortunately, i have to use Nouveau coz swayWM doesn't support Nvidia driv=
ers.</pre>
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

--15506150130.7cff5.15735--

--===============0306331412==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0306331412==--
