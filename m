From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 107453] New: Laptop display goes blank when system
 in power saving mode
Date: Thu, 02 Aug 2018 12:06:55 +0000
Message-ID: <bug-107453-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0192141456=="
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


--===============0192141456==
Content-Type: multipart/alternative; boundary="15332116150.34e6A.17247"
Content-Transfer-Encoding: 7bit


--15332116150.34e6A.17247
Date: Thu, 2 Aug 2018 12:06:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D107453

            Bug ID: 107453
           Summary: Laptop display goes blank when system in power saving
                    mode
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: critical
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: passiday-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

My laptop (GeForce GTX 860M) display goes black at random times, while the
external display (if plugged in) remains visible. The blanking is not limit=
ed
to contexts when the external display is plugged in. When on battery, or
plugged in, in all those contexts the laptop display very predictably goes
black after short use of the display. The only context when it remained vis=
ible
is when there is no application launched on the laptop display, just the
desktop picture visible.

I have described a lot of detail in this Ask Ubuntu post:
https://askubuntu.com/questions/1024576/laptop-screen-randomly-switches-off=
-ubuntu-16-04-4-lts-external-display-attach

Today I have switched to the NVIDIA binary driver and it appears that no
blanking occours anymore. At least in the typical scenarios that used to ca=
use
the blanking, for example full-screen YouTube video.

My guess is that the built-in display mode "brightness turned a bit down" t=
hat
kicks in in some power-saving scenarios, is not properly implemented and ca=
uses
the display go black.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15332116150.34e6A.17247
Date: Thu, 2 Aug 2018 12:06:55 +0000
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
   title=3D"NEW - Laptop display goes blank when system in power saving mod=
e"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D107453">107453</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Laptop display goes blank when system in power saving mode
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
          <td>passiday&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>My laptop (GeForce GTX 860M) display goes black at random time=
s, while the
external display (if plugged in) remains visible. The blanking is not limit=
ed
to contexts when the external display is plugged in. When on battery, or
plugged in, in all those contexts the laptop display very predictably goes
black after short use of the display. The only context when it remained vis=
ible
is when there is no application launched on the laptop display, just the
desktop picture visible.

I have described a lot of detail in this Ask Ubuntu post:
<a href=3D"https://askubuntu.com/questions/1024576/laptop-screen-randomly-s=
witches-off-ubuntu-16-04-4-lts-external-display-attach">https://askubuntu.c=
om/questions/1024576/laptop-screen-randomly-switches-off-ubuntu-16-04-4-lts=
-external-display-attach</a>

Today I have switched to the NVIDIA binary driver and it appears that no
blanking occours anymore. At least in the typical scenarios that used to ca=
use
the blanking, for example full-screen YouTube video.

My guess is that the built-in display mode &quot;brightness turned a bit do=
wn&quot; that
kicks in in some power-saving scenarios, is not properly implemented and ca=
uses
the display go black.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15332116150.34e6A.17247--

--===============0192141456==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0192141456==--
