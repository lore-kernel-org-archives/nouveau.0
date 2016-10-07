From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 98138] New: Random Freeze - nouveau 0000:01:00.0:
 fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT]
Date: Fri, 07 Oct 2016 05:16:03 +0000
Message-ID: <bug-98138-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0130964201=="
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


--===============0130964201==
Content-Type: multipart/alternative; boundary="14758173620.d0B56D4d0.7765";
 charset="UTF-8"


--14758173620.d0B56D4d0.7765
Date: Fri, 7 Oct 2016 05:16:02 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D98138

            Bug ID: 98138
           Summary: Random Freeze - nouveau 0000:01:00.0: fifo:
                    SCHED_ERROR 0a [CTXSW_TIMEOUT]
           Product: xorg
           Version: unspecified
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: stefan.kelemen-Mmb7MZpHnFY@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Since im Using KDE Plasma, i have the Problem the system is Freezing random=
ly
over the when the Desktop is locked

kern.log when the problem begins

Oct  5 02:28:06 druuhl kernel: [73499.905933] nouveau 0000:01:00.0: fifo:
SCHED_ERROR 0a [CTXSW_TIMEOUT]
Oct  5 02:28:06 druuhl kernel: [73499.905939] nouveau 0000:01:00.0: fifo: sw
engine fault on channel 5, recovering...
Oct  5 02:28:08 druuhl kernel: [73501.905656] nouveau 0000:01:00.0: fifo:
runlist 0 update timeout
Oct  5 02:28:10 druuhl kernel: [73504.200746] nouveau 0000:01:00.0: fifo:
SCHED_ERROR 0a [CTXSW_TIMEOUT]
Oct  5 02:28:15 druuhl kernel: [73508.495393] nouveau 0000:01:00.0: fifo:
SCHED_ERROR 0a [CTXSW_TIMEOUT]
Oct  5 02:28:19 druuhl kernel: [73512.790100] nouveau 0000:01:00.0: fifo:
SCHED_ERROR 0a [CTXSW_TIMEOUT]
Oct  5 02:28:23 druuhl kernel: [73517.084810] nouveau 0000:01:00.0: fifo:
SCHED_ERROR 0a [CTXSW_TIMEOUT]
Oct  5 02:28:27 druuhl kernel: [73521.379625] nouveau 0000:01:00.0: fifo:
SCHED_ERROR 0a [CTXSW_TIMEOUT]

when the Desktop is unlocked over night there is no freeze. Some Discussion
about this describe problems with Fullscreen Application like Libreoffice, =
this
would match with my research.

Im Using Neptune Linux - Debian with KDE Plasma and i have the Problem with
Kernel 4.4.13 to 4.4.20.

Linux druuhl 4.4.20 #8 SMP PREEMPT Thu Sep 8 10:25:38 CEST 2016 x86_64
GNU/Linux
kdeplasma 5.6 to 5.8
xserver-xorg-video-nouveau 1.0.12
xorg 7.7

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14758173620.d0B56D4d0.7765
Date: Fri, 7 Oct 2016 05:16:02 +0000
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
   title=3D"NEW - Random Freeze - nouveau 0000:01:00.0: fifo: SCHED_ERROR 0=
a [CTXSW_TIMEOUT]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98138">98138</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Random Freeze - nouveau 0000:01:00.0: fifo: SCHED_ERROR 0a [C=
TXSW_TIMEOUT]
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
          <td>stefan.kelemen&#64;gmx.de
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Since im Using KDE Plasma, i have the Problem the system is Fr=
eezing randomly
over the when the Desktop is locked

kern.log when the problem begins

Oct  5 02:28:06 druuhl kernel: [73499.905933] nouveau 0000:01:00.0: fifo:
SCHED_ERROR 0a [CTXSW_TIMEOUT]
Oct  5 02:28:06 druuhl kernel: [73499.905939] nouveau 0000:01:00.0: fifo: sw
engine fault on channel 5, recovering...
Oct  5 02:28:08 druuhl kernel: [73501.905656] nouveau 0000:01:00.0: fifo:
runlist 0 update timeout
Oct  5 02:28:10 druuhl kernel: [73504.200746] nouveau 0000:01:00.0: fifo:
SCHED_ERROR 0a [CTXSW_TIMEOUT]
Oct  5 02:28:15 druuhl kernel: [73508.495393] nouveau 0000:01:00.0: fifo:
SCHED_ERROR 0a [CTXSW_TIMEOUT]
Oct  5 02:28:19 druuhl kernel: [73512.790100] nouveau 0000:01:00.0: fifo:
SCHED_ERROR 0a [CTXSW_TIMEOUT]
Oct  5 02:28:23 druuhl kernel: [73517.084810] nouveau 0000:01:00.0: fifo:
SCHED_ERROR 0a [CTXSW_TIMEOUT]
Oct  5 02:28:27 druuhl kernel: [73521.379625] nouveau 0000:01:00.0: fifo:
SCHED_ERROR 0a [CTXSW_TIMEOUT]

when the Desktop is unlocked over night there is no freeze. Some Discussion
about this describe problems with Fullscreen Application like Libreoffice, =
this
would match with my research.

Im Using Neptune Linux - Debian with KDE Plasma and i have the Problem with
Kernel 4.4.13 to 4.4.20.

Linux druuhl 4.4.20 #8 SMP PREEMPT Thu Sep 8 10:25:38 CEST 2016 x86_64
GNU/Linux
kdeplasma 5.6 to 5.8
xserver-xorg-video-nouveau 1.0.12
xorg 7.7</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14758173620.d0B56D4d0.7765--

--===============0130964201==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0130964201==--
