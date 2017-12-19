From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 104340] New: Memory leak with GEM objects
Date: Tue, 19 Dec 2017 18:53:31 +0000
Message-ID: <bug-104340-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0537560601=="
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


--===============0537560601==
Content-Type: multipart/alternative; boundary="15137096111.e96a80.10503";
 charset="UTF-8"


--15137096111.e96a80.10503
Date: Tue, 19 Dec 2017 18:53:31 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D104340

            Bug ID: 104340
           Summary: Memory leak with GEM objects
           Product: xorg
           Version: git
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: sgilles-8yXg+M/94Z32fBVCVOL8/A@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 136291
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D136291&action=3Dedit
dmesg (up to last nouveau messages)

I have a gk106, current versions of libdrm, mesa, kernel (observed both with
-mainline and https://github.com/skeggsb/linux branch linux-4.15 as of a few
minutes ago), and there appears to be a memory leak with nouveau that eats =
up
about .5 GB every day. Killing X does nothing.

Attached is output of dmesg from the most recent boot of this machine. I've
also attached (in case it matters) dumps of /proc/meminfo and output of sla=
btop
after I ran X for about two weeks, then exited and killed all major daemons=
.=20
More importantly, I've attached a few hundred lines of
/sys/kernel/debug/kmemleak (from the most recent boot). After the first few
entries, they all start looking the same (except for the address and age).

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15137096111.e96a80.10503
Date: Tue, 19 Dec 2017 18:53:31 +0000
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
   title=3D"NEW - Memory leak with GEM objects"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D104340">104340</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Memory leak with GEM objects
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>git
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
          <td>sgilles&#64;math.umd.edu
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D136291=
" name=3D"attach_136291" title=3D"dmesg (up to last nouveau messages)">atta=
chment 136291</a> <a href=3D"attachment.cgi?id=3D136291&amp;action=3Dedit" =
title=3D"dmesg (up to last nouveau messages)">[details]</a></span>
dmesg (up to last nouveau messages)

I have a gk106, current versions of libdrm, mesa, kernel (observed both with
-mainline and <a href=3D"https://github.com/skeggsb/linux">https://github.c=
om/skeggsb/linux</a> branch linux-4.15 as of a few
minutes ago), and there appears to be a memory leak with nouveau that eats =
up
about .5 GB every day. Killing X does nothing.

Attached is output of dmesg from the most recent boot of this machine. I've
also attached (in case it matters) dumps of /proc/meminfo and output of sla=
btop
after I ran X for about two weeks, then exited and killed all major daemons=
.=20
More importantly, I've attached a few hundred lines of
/sys/kernel/debug/kmemleak (from the most recent boot). After the first few
entries, they all start looking the same (except for the address and age).<=
/pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15137096111.e96a80.10503--

--===============0537560601==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0537560601==--
