From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 95520] New: Error when recovering from suspend mode:
 fifo: ce0 engine fault on channel 0
Date: Sun, 22 May 2016 09:59:24 +0000
Message-ID: <bug-95520-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1471398900=="
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


--===============1471398900==
Content-Type: multipart/alternative; boundary="14639111641.5a308f7D.23393";
 charset="UTF-8"


--14639111641.5a308f7D.23393
Date: Sun, 22 May 2016 09:59:24 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D95520

            Bug ID: 95520
           Summary: Error when recovering from suspend mode: fifo: ce0
                    engine fault on channel 0
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: bghome-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 123963
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D123963&action=3Dedit
Kernel log

Environment:
 - Linux kernel 4.5.4
 - Desktop environment: Gnome 3.20.2
 - Xorg 1.18.3
 - Graphics card: NVIDIA Corporation GK107GLM [Quadro K1000M] (rev a1)

Nouveau makes Xorg unresponsive after resuming from suspend to RAM. Restart=
ing
Xorg did not help, but a reboot.

Error messages look like:
nouveau 0000:01:00.0: fifo: read fault at 0000dc8000 engine 15 [CE0] client=
 01
[CE0] reason 02 [PTE] on channel 0 [007fd56000 DRM]
nouveau 0000:01:00.0: fifo: ce0 engine fault on channel 0, recovering...

It must be a regression, because the issue did not happen with the same
hardware on kernel 4.4.x.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14639111641.5a308f7D.23393
Date: Sun, 22 May 2016 09:59:24 +0000
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
   title=3D"NEW - Error when recovering from suspend mode: fifo: ce0 engine=
 fault on channel 0"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D95520">95520</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Error when recovering from suspend mode: fifo: ce0 engine fau=
lt on channel 0
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
          <td>bghome&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D123963=
" name=3D"attach_123963" title=3D"Kernel log">attachment 123963</a> <a href=
=3D"attachment.cgi?id=3D123963&amp;action=3Dedit" title=3D"Kernel log">[det=
ails]</a></span>
Kernel log

Environment:
 - Linux kernel 4.5.4
 - Desktop environment: Gnome 3.20.2
 - Xorg 1.18.3
 - Graphics card: NVIDIA Corporation GK107GLM [Quadro K1000M] (rev a1)

Nouveau makes Xorg unresponsive after resuming from suspend to RAM. Restart=
ing
Xorg did not help, but a reboot.

Error messages look like:
nouveau 0000:01:00.0: fifo: read fault at 0000dc8000 engine 15 [CE0] client=
 01
[CE0] reason 02 [PTE] on channel 0 [007fd56000 DRM]
nouveau 0000:01:00.0: fifo: ce0 engine fault on channel 0, recovering...

It must be a regression, because the issue did not happen with the same
hardware on kernel 4.4.x.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14639111641.5a308f7D.23393--

--===============1471398900==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1471398900==--
