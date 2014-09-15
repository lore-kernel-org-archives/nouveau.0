From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 83897] New: GK106 (GeForce GTX 660): Frequent GPU
	lockups
Date: Mon, 15 Sep 2014 16:22:43 +0000
Message-ID: <bug-83897-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0438601257=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0438601257==
Content-Type: multipart/alternative; boundary="1410798163.C0cFaC1.23959"; charset="us-ascii"


--1410798163.C0cFaC1.23959
Date: Mon, 15 Sep 2014 16:22:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D83897

          Priority: medium
            Bug ID: 83897
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: GK106 (GeForce GTX 660): Frequent GPU lockups
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: major
    Classification: Unclassified
                OS: Linux (All)
          Reporter: freedesk.apriori-w1QkCcy0X+BxKfgMtfWJuA@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

I=E2=80=99m getting frequent GPU lockups which always seem to occur when pl=
aying video
(either via mpv or via flash-plugin). Not sure how to tell whether this aff=
ects
the 2D driver or the mesa one. Please reassign as you see fit.

The bug manifests as one of the following:
1. X screen freezes, no response when switching VTs, only SysRq+REISUB work=
s.
2. X screen freezes, VT switch works, system can be rebooted by userspace
tools.

The common denominator in the reported errors seems to be: =C2=ABnouveau E[=
=20=20
PFIFO][0000:01:00.0]=C2=BB with either =C2=ABwrite fault=C2=BB, =C2=ABread =
fault=C2=BB, which is then
followed by =C2=ABPGRAPH engine fault=C2=BB.

I=E2=80=99ll follow-up with a few relevant log files.

My current setup runs on:
* Linux 3.16.2
* Xorg 1.16.0

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1410798163.C0cFaC1.23959
Date: Mon, 15 Sep 2014 16:22:43 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/" />
    </head>
    <body><table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Bug ID</th>
          <td><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW --- - GK106 (GeForce GTX 660): Frequent GPU lockups"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D83897">83897</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>GK106 (GeForce GTX 660): Frequent GPU lockups
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>major
          </td>
        </tr>

        <tr>
          <th>Classification</th>
          <td>Unclassified
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>Linux (All)
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>freedesk.apriori&#64;spamgourmet.com
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86-64 (AMD64)
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>unspecified
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Driver/nouveau
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr></table>
      <p>
        <div>
        <pre>I=E2=80=99m getting frequent GPU lockups which always seem to =
occur when playing video
(either via mpv or via flash-plugin). Not sure how to tell whether this aff=
ects
the 2D driver or the mesa one. Please reassign as you see fit.

The bug manifests as one of the following:
1. X screen freezes, no response when switching VTs, only SysRq+REISUB work=
s.
2. X screen freezes, VT switch works, system can be rebooted by userspace
tools.

The common denominator in the reported errors seems to be: =C2=ABnouveau E[=
=20=20
PFIFO][0000:01:00.0]=C2=BB with either =C2=ABwrite fault=C2=BB, =C2=ABread =
fault=C2=BB, which is then
followed by =C2=ABPGRAPH engine fault=C2=BB.

I=E2=80=99ll follow-up with a few relevant log files.

My current setup runs on:
* Linux 3.16.2
* Xorg 1.16.0</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
=20=20=20=20=20=20
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1410798163.C0cFaC1.23959--

--===============0438601257==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0438601257==--
