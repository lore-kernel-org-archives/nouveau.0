From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 102106] New: xorg crashes when running gscan2pdf
 (libgtk2-perl) test case
Date: Tue, 08 Aug 2017 10:02:59 +0000
Message-ID: <bug-102106-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1617015799=="
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


--===============1617015799==
Content-Type: multipart/alternative; boundary="15021865790.C7BD4b1.30136";
 charset="UTF-8"


--15021865790.C7BD4b1.30136
Date: Tue, 8 Aug 2017 10:02:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D102106

            Bug ID: 102106
           Summary: xorg crashes when running gscan2pdf (libgtk2-perl)
                    test case
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: jffry-VwIFZPTo/vqsTnJN9+BGXg@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

* What led up to the situation?

Download and extract the source:

wget
http://http.debian.net/debian/pool/main/g/gscan2pdf/gscan2pdf_1.6.0.orig.ta=
r.xz
tar xvfJ gscan2pdf_1.6.0.orig.tar.xz
cd gscan2pdf-1.6.0

   * What exactly did you do (or not do) that was effective (or
     ineffective)?

Run one of the test cases:

PERL5LIB=3D"blib:lib:$PERL5LIB" perl t/114_cancel_save_pdf.t

   * What was the outcome of this action?

xorg crashed, and I was returned to the login screen

   * What outcome did you expect instead?

The test should have run through as normal

I tried to debug the problem by installing xserver-xorg-video-nouveau-dbg, =
ssh-
ing to the computer from another, starting gdb and attaching the PID of the
xorg process.

As long as gdb is attached to the process, and the -dbg package is installe=
d,
xorg does not crash. Otherwise, it crashes every time. Not all the test cas=
es
are affected. The 67 tests that run before this one, run fine.

If it does crash, it takes the ssh process with it, so I can't see the gdb
output.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15021865790.C7BD4b1.30136
Date: Tue, 8 Aug 2017 10:02:59 +0000
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
   title=3D"NEW - xorg crashes when running gscan2pdf (libgtk2-perl) test c=
ase"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D102106">102106</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>xorg crashes when running gscan2pdf (libgtk2-perl) test case
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
          <td>jffry&#64;posteo.net
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>* What led up to the situation?

Download and extract the source:

wget
<a href=3D"http://http.debian.net/debian/pool/main/g/gscan2pdf/gscan2pdf_1.=
6.0.orig.tar.xz">http://http.debian.net/debian/pool/main/g/gscan2pdf/gscan2=
pdf_1.6.0.orig.tar.xz</a>
tar xvfJ gscan2pdf_1.6.0.orig.tar.xz
cd gscan2pdf-1.6.0

   * What exactly did you do (or not do) that was effective (or
     ineffective)?

Run one of the test cases:

PERL5LIB=3D&quot;blib:lib:$PERL5LIB&quot; perl t/114_cancel_save_pdf.t

   * What was the outcome of this action?

xorg crashed, and I was returned to the login screen

   * What outcome did you expect instead?

The test should have run through as normal

I tried to debug the problem by installing xserver-xorg-video-nouveau-dbg, =
ssh-
ing to the computer from another, starting gdb and attaching the PID of the
xorg process.

As long as gdb is attached to the process, and the -dbg package is installe=
d,
xorg does not crash. Otherwise, it crashes every time. Not all the test cas=
es
are affected. The 67 tests that run before this one, run fine.

If it does crash, it takes the ssh process with it, so I can't see the gdb
output.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15021865790.C7BD4b1.30136--

--===============1617015799==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1617015799==--
