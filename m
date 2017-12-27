From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 104393] New: GF117 volting not possible
Date: Wed, 27 Dec 2017 11:22:59 +0000
Message-ID: <bug-104393-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0259937157=="
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


--===============0259937157==
Content-Type: multipart/alternative; boundary="15143737791.B9A3A8.21698";
 charset="UTF-8"


--15143737791.B9A3A8.21698
Date: Wed, 27 Dec 2017 11:22:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D104393

            Bug ID: 104393
           Summary: GF117 volting not possible
           Product: xorg
           Version: unspecified
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: robert.de.rooy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Lenovo E93Z AIO with Nvidia Geforce GT720A and Intel gen4 graphics

On boot I get various error messages from the Nouveau driver, here is my dm=
esg
output when I grep for nouveau

nouveau 0000:01:00.0: enabling device (0000 -> 0003)
nouveau 0000:01:00.0: NVIDIA GF117 (ed7000a2)
nouveau 0000:01:00.0: bios: version 75.17.80.00.07
nouveau 0000:01:00.0: fd: 1024 MiB DDR3
nouveau 0000:01:00.0: volt: coudn't find speedo value, volting not possible
nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 612004 [ IBUS ]
nouveau 0000:01:00.0: DRM: VRAM: 1024 MiB
nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
nouveau 0000:01:00.0: DRM: Pointer to TMDS table invalid
nouveau 0000:01:00.0: DRM: DCB version 4.0
nouveau 0000:01:00.0: DRM: MM: using COPY0 for buffer copies
[drm] Initialized nouveau 1.3.1 20120801 for 0000:01:00.0 on minor 1

The above is with the 4.14.8-300.fc27.x86_64 kernel (Fedora 27)

So.. No volting, MMIO read error and TMDS table error.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15143737791.B9A3A8.21698
Date: Wed, 27 Dec 2017 11:22:59 +0000
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
   title=3D"NEW - GF117 volting not possible"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D104393">104393</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>GF117 volting not possible
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
          <td>robert.de.rooy&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Lenovo E93Z AIO with Nvidia Geforce GT720A and Intel gen4 grap=
hics

On boot I get various error messages from the Nouveau driver, here is my dm=
esg
output when I grep for nouveau

nouveau 0000:01:00.0: enabling device (0000 -&gt; 0003)
nouveau 0000:01:00.0: NVIDIA GF117 (ed7000a2)
nouveau 0000:01:00.0: bios: version 75.17.80.00.07
nouveau 0000:01:00.0: fd: 1024 MiB DDR3
nouveau 0000:01:00.0: volt: coudn't find speedo value, volting not possible
nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 612004 [ IBUS ]
nouveau 0000:01:00.0: DRM: VRAM: 1024 MiB
nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
nouveau 0000:01:00.0: DRM: Pointer to TMDS table invalid
nouveau 0000:01:00.0: DRM: DCB version 4.0
nouveau 0000:01:00.0: DRM: MM: using COPY0 for buffer copies
[drm] Initialized nouveau 1.3.1 20120801 for 0000:01:00.0 on minor 1

The above is with the 4.14.8-300.fc27.x86_64 kernel (Fedora 27)

So.. No volting, MMIO read error and TMDS table error.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15143737791.B9A3A8.21698--

--===============0259937157==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0259937157==--
