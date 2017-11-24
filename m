From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 103897] New: Kernel 4.14 causes high cpu usage,
	4.12 was OK
Date: Fri, 24 Nov 2017 23:07:29 +0000
Message-ID: <bug-103897-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1551827871=="
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


--===============1551827871==
Content-Type: multipart/alternative; boundary="15115648491.F3E7E60.9121";
 charset="UTF-8"


--15115648491.F3E7E60.9121
Date: Fri, 24 Nov 2017 23:07:29 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D103897

            Bug ID: 103897
           Summary: Kernel 4.14 causes high cpu usage, 4.12 was OK
           Product: xorg
           Version: git
          Hardware: x86 (IA32)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: randrik-JGs/UdohzUI@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Hello. After upgrading my kernel to 4.14 I noticed strange behavior: If I l=
oad
X (KDE 3.5.10 session with built-in compositor [kompmgr], self-compiled with
many patches, X server 1.19.5, nouveau DDX git) and start to use seamonkey =
2.49
(again, self-compiled with gtk2 toolkit, not default gtk3) - after some hou=
rs
of use X started to eat a lot of CPU time, new windows appear after delay,
glxgears slow down to 11 fps or so from default 60. If I restart X session -
everything back to normal, for few hours. If I quit seamonkey - CPU usage
drops. But if I start it up again - CPU load returns quickly, and not go do=
wn
until X restart.

Seamonkey use hw compositing (force-enabled) and multiprocess experimental
option. Problem is, exactly same seamonkey with same set of tabs work fine =
on
4.12.0 kernel!

I set architecture to ia32, even if kernel compiled for x86_64 , because al=
l my
userspace is 32-bit.

hw:
01:00.0 0300: 10de:0606 (rev a2) (prog-if 00 [VGA controller])
aka
01:00.0 VGA compatible controller: NVIDIA Corporation G92 [GeForce 8800 GS]
(rev a2) (prog-if 00 [VGA controller])

X log, dmesg, opreport data will follow.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15115648491.F3E7E60.9121
Date: Fri, 24 Nov 2017 23:07:29 +0000
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
   title=3D"NEW - Kernel 4.14 causes high cpu usage, 4.12 was OK"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D103897">103897</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Kernel 4.14 causes high cpu usage, 4.12 was OK
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
          <td>x86 (IA32)
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
          <td>randrik&#64;mail.ru
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Hello. After upgrading my kernel to 4.14 I noticed strange beh=
avior: If I load
X (KDE 3.5.10 session with built-in compositor [kompmgr], self-compiled with
many patches, X server 1.19.5, nouveau DDX git) and start to use seamonkey =
2.49
(again, self-compiled with gtk2 toolkit, not default gtk3) - after some hou=
rs
of use X started to eat a lot of CPU time, new windows appear after delay,
glxgears slow down to 11 fps or so from default 60. If I restart X session -
everything back to normal, for few hours. If I quit seamonkey - CPU usage
drops. But if I start it up again - CPU load returns quickly, and not go do=
wn
until X restart.

Seamonkey use hw compositing (force-enabled) and multiprocess experimental
option. Problem is, exactly same seamonkey with same set of tabs work fine =
on
4.12.0 kernel!

I set architecture to ia32, even if kernel compiled for x86_64 , because al=
l my
userspace is 32-bit.

hw:
01:00.0 0300: 10de:0606 (rev a2) (prog-if 00 [VGA controller])
aka
01:00.0 VGA compatible controller: NVIDIA Corporation G92 [GeForce 8800 GS]
(rev a2) (prog-if 00 [VGA controller])

X log, dmesg, opreport data will follow.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15115648491.F3E7E60.9121--

--===============1551827871==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1551827871==--
