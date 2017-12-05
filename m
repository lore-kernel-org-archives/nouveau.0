From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 104109] New: After upgrade to kernel 4.13.16-302 one
 monitor in a two monitor displayport setup isn't working anymore.
Date: Tue, 05 Dec 2017 14:14:37 +0000
Message-ID: <bug-104109-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1281829621=="
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


--===============1281829621==
Content-Type: multipart/alternative; boundary="15124832771.0cdf97.32073";
 charset="UTF-8"


--15124832771.0cdf97.32073
Date: Tue, 5 Dec 2017 14:14:37 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D104109

            Bug ID: 104109
           Summary: After upgrade to kernel 4.13.16-302 one monitor in a
                    two monitor displayport setup isn't working anymore.
           Product: xorg
           Version: unspecified
          Hardware: Other
                OS: Linux (All)
            Status: NEW
          Severity: major
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: torsten-LNXMr1lEAG4dnm+yROfE0A@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 135975
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D135975&action=3Dedit
kernel log (4.13.16-300)

This issue comes in two parts which may be related to each other.
First when upgrading to kernel 4.13.16-300 I began to have issues with one
monitor when it went into sleep mode. I then saw errors like "disp: outp
03:0006:0f88: training failed". Checking xrandr showed that the monitor
"existed" but it only showed a black screen.
This behaviour was tested on both fedora 27 and ubuntu 16.04 LTS with all
updates installed.

The dual monitor setup was working prior to updating to kernel 4.13.16-300.


When doing a kernel upgrade to 4.13.16-302 this monitor was not even found
anymore by the nouveau driver.

I will attach the following files:
* kernel log 4.13.16-300
* kernel log 4.13.16-302
* xrandr when running kernel 4.13.16-300
* xrandr when running kernel 4.13.16-302

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15124832771.0cdf97.32073
Date: Tue, 5 Dec 2017 14:14:37 +0000
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
   title=3D"NEW - After upgrade to kernel 4.13.16-302 one monitor in a two =
monitor displayport setup isn't working anymore."
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D104109">104109</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>After upgrade to kernel 4.13.16-302 one monitor in a two moni=
tor displayport setup isn't working anymore.
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
          <td>torsten&#64;intsec.org
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D135975=
" name=3D"attach_135975" title=3D"kernel log (4.13.16-300)">attachment 1359=
75</a> <a href=3D"attachment.cgi?id=3D135975&amp;action=3Dedit" title=3D"ke=
rnel log (4.13.16-300)">[details]</a></span>
kernel log (4.13.16-300)

This issue comes in two parts which may be related to each other.
First when upgrading to kernel 4.13.16-300 I began to have issues with one
monitor when it went into sleep mode. I then saw errors like &quot;disp: ou=
tp
03:0006:0f88: training failed&quot;. Checking xrandr showed that the monitor
&quot;existed&quot; but it only showed a black screen.
This behaviour was tested on both fedora 27 and ubuntu 16.04 LTS with all
updates installed.

The dual monitor setup was working prior to updating to kernel 4.13.16-300.


When doing a kernel upgrade to 4.13.16-302 this monitor was not even found
anymore by the nouveau driver.

I will attach the following files:
* kernel log 4.13.16-300
* kernel log 4.13.16-302
* xrandr when running kernel 4.13.16-300
* xrandr when running kernel 4.13.16-302</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15124832771.0cdf97.32073--

--===============1281829621==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1281829621==--
