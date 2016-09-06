From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 97614] New: occasional screen distortions with
 nouveau under 4.8.0-rc4+
Date: Tue, 06 Sep 2016 14:44:13 +0000
Message-ID: <bug-97614-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1483917667=="
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


--===============1483917667==
Content-Type: multipart/alternative; boundary="14731730541.25FF4A.12790";
 charset="UTF-8"


--14731730541.25FF4A.12790
Date: Tue, 6 Sep 2016 14:44:14 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D97614

            Bug ID: 97614
           Summary: occasional screen distortions with nouveau under
                    4.8.0-rc4+
           Product: xorg
           Version: unspecified
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: estellnb-7Km2I/eHSAQdnm+yROfE0A@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

There are occasional screen distortions with nouveau and kernel 4.8.0-rc4+.
Have a look at the dmesg as well as the screenshots.

known bad: 9ca581b50dab6103183396852cc08e440fcda18e (see attached dmesg)
also bad: 593ee4edc51d99fadda9f6ee... (no dmesg available)
supposed to be good: v4.8.0-rc4 (as by the tag of 3eab887a55424...)

  The problem is hard to test for as the screen distortions only become vis=
ible
from time to time. Also, v4.8.0-rc4 has been tested with the plasma4 desktop
while 4.8.0-rc4+ versions have been tested with xfce4 so I can not tell with
100% certainty that the problem did not exist before.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14731730541.25FF4A.12790
Date: Tue, 6 Sep 2016 14:44:14 +0000
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
   title=3D"NEW - occasional screen distortions with nouveau under 4.8.0-rc=
4+"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D97614">97614</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>occasional screen distortions with nouveau under 4.8.0-rc4+
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
        <pre>There are occasional screen distortions with nouveau and kerne=
l 4.8.0-rc4+.
Have a look at the dmesg as well as the screenshots.

known bad: 9ca581b50dab6103183396852cc08e440fcda18e (see attached dmesg)
also bad: 593ee4edc51d99fadda9f6ee... (no dmesg available)
supposed to be good: v4.8.0-rc4 (as by the tag of 3eab887a55424...)

  The problem is hard to test for as the screen distortions only become vis=
ible
from time to time. Also, v4.8.0-rc4 has been tested with the plasma4 desktop
while 4.8.0-rc4+ versions have been tested with xfce4 so I can not tell with
100% certainty that the problem did not exist before.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14731730541.25FF4A.12790--

--===============1483917667==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1483917667==--
