From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 101191] New: [NVC3] Vsync stops working after mode
 changes in nouveau DDX
Date: Thu, 25 May 2017 17:35:21 +0000
Message-ID: <bug-101191-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1029485090=="
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


--===============1029485090==
Content-Type: multipart/alternative; boundary="14957337200.F84d.24436";
 charset="UTF-8"


--14957337200.F84d.24436
Date: Thu, 25 May 2017 17:35:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D101191

            Bug ID: 101191
           Summary: [NVC3] Vsync stops working after mode changes in
                    nouveau DDX
           Product: xorg
           Version: 7.7 (2012.06)
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: z411-92xyBwqrD4Mdnm+yROfE0A@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Hello,

I've encountered this weird issue where Vsync suddenly stops working after I
manipulate modes on the fly in some situations.

I could reproduce it in 4 different situations, and I've attached logs
respectively:

(1) Only 1 monitor connected to DVI. Any mode change (resolution or refresh
rate) will trigger the issue. (term_1.txt / xorg_1.txt)
(2) 2 monitors connected (DVI+HDMI TV). Turning off the DVI monitor will
immediately trigger the issue. (term_2.txt / xorg_2.txt)
(3) 2 monitors connected (DVI+HDMI TV). Mode changes in DVI monitor won't
trigger the issue anymore. But after turning off the HDMI monitor, mode cha=
nges
in the DVI one will start triggering the issue again. (term_3.txt / xorg_3.=
txt)
(4) 2 monitors connected (DVI+HDMI TV). Mode changes in HDMI monitor
immediately trigger the issue. Note how Vsync is still working in the DVI o=
ne,
though. (term_4.txt / xorg_4.txt)

Needless to say, this will cause issues (for example) in mpv video player,
where it'll suffer tearing and complain about inconsistent timing, both in
opengl and vdpau modes.

Distribution Debian Sid
Linux 4.9.25
xorg 7.7 (server 1.19.3)
xf86-video-nouveau 1.0.15
libdrm 2.4.74

This only happens with the nouveau DDX driver, as this issue doesn't occur =
with
the modesetting one, therefore I assume it's a nouveau DDX bug (rather than
mesa).

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14957337200.F84d.24436
Date: Thu, 25 May 2017 17:35:20 +0000
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
   title=3D"NEW - [NVC3] Vsync stops working after mode changes in nouveau =
DDX"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101191">101191</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[NVC3] Vsync stops working after mode changes in nouveau DDX
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>7.7 (2012.06)
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
          <td>z411&#64;omaera.org
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Hello,

I've encountered this weird issue where Vsync suddenly stops working after I
manipulate modes on the fly in some situations.

I could reproduce it in 4 different situations, and I've attached logs
respectively:

(1) Only 1 monitor connected to DVI. Any mode change (resolution or refresh
rate) will trigger the issue. (term_1.txt / xorg_1.txt)
(2) 2 monitors connected (DVI+HDMI TV). Turning off the DVI monitor will
immediately trigger the issue. (term_2.txt / xorg_2.txt)
(3) 2 monitors connected (DVI+HDMI TV). Mode changes in DVI monitor won't
trigger the issue anymore. But after turning off the HDMI monitor, mode cha=
nges
in the DVI one will start triggering the issue again. (term_3.txt / xorg_3.=
txt)
(4) 2 monitors connected (DVI+HDMI TV). Mode changes in HDMI monitor
immediately trigger the issue. Note how Vsync is still working in the DVI o=
ne,
though. (term_4.txt / xorg_4.txt)

Needless to say, this will cause issues (for example) in mpv video player,
where it'll suffer tearing and complain about inconsistent timing, both in
opengl and vdpau modes.

Distribution Debian Sid
Linux 4.9.25
xorg 7.7 (server 1.19.3)
xf86-video-nouveau 1.0.15
libdrm 2.4.74

This only happens with the nouveau DDX driver, as this issue doesn't occur =
with
the modesetting one, therefore I assume it's a nouveau DDX bug (rather than
mesa).</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14957337200.F84d.24436--

--===============1029485090==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1029485090==--
