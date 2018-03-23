From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 105722] New: Nouveau driver hangs when closing video
 playback
Date: Fri, 23 Mar 2018 19:31:20 +0000
Message-ID: <bug-105722-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1055877785=="
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


--===============1055877785==
Content-Type: multipart/alternative; boundary="15218334800.3eA4B5e6.19168"
Content-Transfer-Encoding: 7bit


--15218334800.3eA4B5e6.19168
Date: Fri, 23 Mar 2018 19:31:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D105722

            Bug ID: 105722
           Summary: Nouveau driver hangs when closing video playback
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: freedesktopbugs0000-H9HWdc0fwY8sA/PxXw9srA@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 138322
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D138322&action=3Dedit
Kernel log from bootup to crash

I have a completely reproducible hang in the nouveau kernel module.  It hap=
pens
when I've run a vdpau or OpenGL video session and then exit it, under the K=
DE5
desktop.  It doesn't happen under KDE4, with the same binaries and librarie=
s.

I start the MythTV frontend (fullscreen) or xine (windowed) from within KDE=
5.=20
Playback is normal, everything works properly, until I attempt to exit
playback.  At that moment, the screen locks up.  The keyboard becomes
non-responsive, the mouse cursor still moves, my desktop clocks stop updati=
ng,
and I have to ssh into the machine to reboot it.

I'm attaching the Xorg and dmesg logs.  The end of the dmesg log includes s=
ome
lines from the kernel log, retrieved after the reboot.  The relevant lines =
are:

kernel: nouveau 0000:01:00.0: msvld: intr 00000002
kernel: nouveau 0000:01:00.0: mythfrontend[2971]: failed to idle channel 19
[mythfrontend[2971]]
kernel: nouveau 0000:01:00.0: mythfrontend[2971]: failed to idle channel 19
[mythfrontend[2971]]
kernel: nouveau 0000:01:00.0: fifo: runlist update timeout
kernel: nouveau 0000:01:00.0: fifo: INTR 00000001: 0000000b

The Mesa/DRI libraries are at version 17.3.3, but this happened with earlier
versions as well.  My kernel is kernel.org 4.14.12 with no additional patch=
es.

The xf86-video-nouveau component is at tag xf86-video-nouveau-1.0.15
The xserver component is at tag xorg-server-1.19.5

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15218334800.3eA4B5e6.19168
Date: Fri, 23 Mar 2018 19:31:20 +0000
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
   title=3D"NEW - Nouveau driver hangs when closing video playback"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105722">105722</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Nouveau driver hangs when closing video playback
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
          <td>freedesktopbugs0000&#64;cneufeld.ca
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D138322=
" name=3D"attach_138322" title=3D"Kernel log from bootup to crash">attachme=
nt 138322</a> <a href=3D"attachment.cgi?id=3D138322&amp;action=3Dedit" titl=
e=3D"Kernel log from bootup to crash">[details]</a></span>
Kernel log from bootup to crash

I have a completely reproducible hang in the nouveau kernel module.  It hap=
pens
when I've run a vdpau or OpenGL video session and then exit it, under the K=
DE5
desktop.  It doesn't happen under KDE4, with the same binaries and librarie=
s.

I start the MythTV frontend (fullscreen) or xine (windowed) from within KDE=
5.=20
Playback is normal, everything works properly, until I attempt to exit
playback.  At that moment, the screen locks up.  The keyboard becomes
non-responsive, the mouse cursor still moves, my desktop clocks stop updati=
ng,
and I have to ssh into the machine to reboot it.

I'm attaching the Xorg and dmesg logs.  The end of the dmesg log includes s=
ome
lines from the kernel log, retrieved after the reboot.  The relevant lines =
are:

kernel: nouveau 0000:01:00.0: msvld: intr 00000002
kernel: nouveau 0000:01:00.0: mythfrontend[2971]: failed to idle channel 19
[mythfrontend[2971]]
kernel: nouveau 0000:01:00.0: mythfrontend[2971]: failed to idle channel 19
[mythfrontend[2971]]
kernel: nouveau 0000:01:00.0: fifo: runlist update timeout
kernel: nouveau 0000:01:00.0: fifo: INTR 00000001: 0000000b

The Mesa/DRI libraries are at version 17.3.3, but this happened with earlier
versions as well.  My kernel is kernel.org 4.14.12 with no additional patch=
es.

The xf86-video-nouveau component is at tag xf86-video-nouveau-1.0.15
The xserver component is at tag xorg-server-1.19.5</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15218334800.3eA4B5e6.19168--

--===============1055877785==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1055877785==--
