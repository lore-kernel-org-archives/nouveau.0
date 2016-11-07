From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 98631] New: GPU lock ups when starting GDM, SDDM,
 and Plasma Desktop
Date: Mon, 07 Nov 2016 19:52:59 +0000
Message-ID: <bug-98631-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0927486633=="
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


--===============0927486633==
Content-Type: multipart/alternative; boundary="14785483790.1BbE.11639";
 charset="UTF-8"


--14785483790.1BbE.11639
Date: Mon, 7 Nov 2016 19:52:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D98631

            Bug ID: 98631
           Summary: GPU lock ups when starting GDM, SDDM, and Plasma
                    Desktop
           Product: xorg
           Version: unspecified
          Hardware: PowerPC
                OS: Linux (All)
            Status: NEW
          Severity: blocker
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: jeffbai-ymACFijhrKM@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Here on a PowerMac G5 with a NVIDIA GeForce 6600LE graphics card, most thin=
gs
run pretty well except for some of the things I wanted to run on the machine
resulted in nouveau GPU lock-ups, and consequently a glitched display
(artifacts only).

When trying to start GDM, SDDM, or Plasma Desktop on the machine, the displ=
ay
locks up, and I was able to salvage an error message as follows:

[drm] nouveau 0000:0a:00.0: GPU lockup - switching to software fbcon

After a minute or two, the display responds again, but only showing a black
background with several randomly colored pixels, and some white blocks.

However, this graphics card runs LightDM, XFCE, MATE... and most other
applications without such error and lock-ups. I was able to workaround the
issue by using the nouveau.noaccel=3D1 kernel parameter (except in the case=
 of
GDM, it returned with the same error), but that simply beats the purpose of
owning a graphics card.

However, even with the noaccel parameter in place, I was still experiencing=
 bad
coloring issues, as reported here:
https://bugs.freedesktop.org/show_bug.cgi?id=3D98630.

----------

Some version info:

- Linux Kernel 4.8.6 (with 4K paging in case you are wondering)
- Mesa 13.0.0
- Xorg Server 1.18.4

----------

P.S.

I tried on with a Quadro FX4500, which simply shows the lock up error whene=
ver
attempting to start X. But I couldn't make sure if it's a hardware issue or
not, as the card sparked on the first power up, that's why I have already
returned it...

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14785483790.1BbE.11639
Date: Mon, 7 Nov 2016 19:52:59 +0000
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
   title=3D"NEW - GPU lock ups when starting GDM, SDDM, and Plasma Desktop"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98631">98631</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>GPU lock ups when starting GDM, SDDM, and Plasma Desktop
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
          <td>PowerPC
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
          <td>blocker
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
          <td>jeffbai&#64;aosc.xyz
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Here on a PowerMac G5 with a NVIDIA GeForce 6600LE graphics ca=
rd, most things
run pretty well except for some of the things I wanted to run on the machine
resulted in nouveau GPU lock-ups, and consequently a glitched display
(artifacts only).

When trying to start GDM, SDDM, or Plasma Desktop on the machine, the displ=
ay
locks up, and I was able to salvage an error message as follows:

[drm] nouveau 0000:0a:00.0: GPU lockup - switching to software fbcon

After a minute or two, the display responds again, but only showing a black
background with several randomly colored pixels, and some white blocks.

However, this graphics card runs LightDM, XFCE, MATE... and most other
applications without such error and lock-ups. I was able to workaround the
issue by using the nouveau.noaccel=3D1 kernel parameter (except in the case=
 of
GDM, it returned with the same error), but that simply beats the purpose of
owning a graphics card.

However, even with the noaccel parameter in place, I was still experiencing=
 bad
coloring issues, as reported here:
<a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Bad color and glitches on PPC64"
   href=3D"show_bug.cgi?id=3D98630">https://bugs.freedesktop.org/show_bug.c=
gi?id=3D98630</a>.

----------

Some version info:

- Linux Kernel 4.8.6 (with 4K paging in case you are wondering)
- Mesa 13.0.0
- Xorg Server 1.18.4

----------

P.S.

I tried on with a Quadro FX4500, which simply shows the lock up error whene=
ver
attempting to start X. But I couldn't make sure if it's a hardware issue or
not, as the card sparked on the first power up, that's why I have already
returned it...</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14785483790.1BbE.11639--

--===============0927486633==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0927486633==--
