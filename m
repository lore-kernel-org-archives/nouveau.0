From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 108857] New: display becomes unresponsive and
 keyboard input fails
Date: Sun, 25 Nov 2018 12:20:11 +0000
Message-ID: <bug-108857-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1516054098=="
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


--===============1516054098==
Content-Type: multipart/alternative; boundary="15431484111.Dc8C.6016"
Content-Transfer-Encoding: 7bit


--15431484111.Dc8C.6016
Date: Sun, 25 Nov 2018 12:20:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D108857

            Bug ID: 108857
           Summary: display becomes unresponsive and keyboard input fails
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: major
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: tla2k20-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 142607
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D142607&action=3Dedit
dmesg

Fedora release 29 (Twenty Nine)
Linux s0.home 4.19.3-300.fc29.x86_64 #1 SMP Wed Nov 21 15:27:25 UTC 2018 x8=
6_64
x86_64 x86_64 GNU/Linux

System boots and is initially OK for a few minutes then becomes unresponsiv=
e to
mouse movements and keyboard input.  Access via a SSH session is fine.

Issue started around 3 kernel updates ago (4.19.*).

top shows the following when the problem is in progress:

top - 12:10:25 up  1:10,  2 users,  load average: 0.23, 0.25, 0.27
Tasks: 356 total,   2 running, 354 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.8 us,  6.6 sy,  0.0 ni, 91.6 id,  0.0 wa,  1.0 hi,  0.0 si,  0.=
0 st
MiB Mem :  15982.9 total,   9198.9 free,   4552.3 used,   2231.7 buff/cache
MiB Swap:   8008.0 total,   8008.0 free,      0.0 used.  11035.1 avail Mem

  PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
 7144 root      20   0       0      0      0 R  53.8   0.0   0:02.26
kworker/u16:0+events_unbound
 2325 user1     20   0 3867708 195040 118048 S   2.0   1.2   0:28.43
gnome-shell

kworker/u16:2+events_unbound seems to eat CPU and dmesg reports:

nouveau 0000:01:00.0: DRM: base-0: timeout

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15431484111.Dc8C.6016
Date: Sun, 25 Nov 2018 12:20:11 +0000
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
   title=3D"NEW - display becomes unresponsive and keyboard input fails"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108857">108857</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>display becomes unresponsive and keyboard input fails
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
          <td>tla2k20&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D142607=
" name=3D"attach_142607" title=3D"dmesg">attachment 142607</a> <a href=3D"a=
ttachment.cgi?id=3D142607&amp;action=3Dedit" title=3D"dmesg">[details]</a><=
/span>
dmesg

Fedora release 29 (Twenty Nine)
Linux s0.home 4.19.3-300.fc29.x86_64 #1 SMP Wed Nov 21 15:27:25 UTC 2018 x8=
6_64
x86_64 x86_64 GNU/Linux

System boots and is initially OK for a few minutes then becomes unresponsiv=
e to
mouse movements and keyboard input.  Access via a SSH session is fine.

Issue started around 3 kernel updates ago (4.19.*).

top shows the following when the problem is in progress:

top - 12:10:25 up  1:10,  2 users,  load average: 0.23, 0.25, 0.27
Tasks: 356 total,   2 running, 354 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.8 us,  6.6 sy,  0.0 ni, 91.6 id,  0.0 wa,  1.0 hi,  0.0 si,  0.=
0 st
MiB Mem :  15982.9 total,   9198.9 free,   4552.3 used,   2231.7 buff/cache
MiB Swap:   8008.0 total,   8008.0 free,      0.0 used.  11035.1 avail Mem

  PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
 7144 root      20   0       0      0      0 R  53.8   0.0   0:02.26
kworker/u16:0+events_unbound
 2325 user1     20   0 3867708 195040 118048 S   2.0   1.2   0:28.43
gnome-shell

kworker/u16:2+events_unbound seems to eat CPU and dmesg reports:

nouveau 0000:01:00.0: DRM: base-0: timeout</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15431484111.Dc8C.6016--

--===============1516054098==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1516054098==--
