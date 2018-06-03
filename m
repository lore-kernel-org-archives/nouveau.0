From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 106793] New: [NV138] bus: MMIO read of 00000000
 FAULT at 409800 [ TIMEOUT ]
Date: Sun, 03 Jun 2018 09:07:59 +0000
Message-ID: <bug-106793-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0396239180=="
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


--===============0396239180==
Content-Type: multipart/alternative; boundary="15280168790.3C5A.18070"
Content-Transfer-Encoding: 7bit


--15280168790.3C5A.18070
Date: Sun, 3 Jun 2018 09:07:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D106793

            Bug ID: 106793
           Summary: [NV138] bus: MMIO read of 00000000 FAULT at 409800 [
                    TIMEOUT ]
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: andrew-q4ulJ2CcmHAdnm+yROfE0A@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 139983
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D139983&action=3Dedit
dmesg output

Hi,

I have a desktop with an nVidia GeForce GT 1030 (NV138) with Fedora 28
installed.

I am seeing errors on boot and I can't use the card.

nouveau 0000:02:00.0: bus: MMIO read of 00000000 FAULT at 409800 [ TIMEOUT ]
...
nouveau 0000:02:00.0: timeout
...
nouveau 0000:02:00.0: gr: init failed, -16


xorg-x11-drv-nouveau-1.0.15-4.fc28.x86_64
mesa-dri-drivers-18.0.2-1.fc28.x86_64

uname -a
Linux roffey10 4.17.0-0.rc7.git2.1.vanilla.knurd.1.fc28.x86_64 #1 SMP Sat J=
un 2
05:03:40 UTC 2018 x86_64 x86_64 x86_64 GNU/Linux

I have attached the dmesg output.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15280168790.3C5A.18070
Date: Sun, 3 Jun 2018 09:07:59 +0000
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
   title=3D"NEW - [NV138] bus: MMIO read of 00000000 FAULT at 409800 [ TIME=
OUT ]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D106793">106793</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[NV138] bus: MMIO read of 00000000 FAULT at 409800 [ TIMEOUT ]
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
          <td>andrew&#64;roffey.org
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D139983=
" name=3D"attach_139983" title=3D"dmesg output">attachment 139983</a> <a hr=
ef=3D"attachment.cgi?id=3D139983&amp;action=3Dedit" title=3D"dmesg output">=
[details]</a></span>
dmesg output

Hi,

I have a desktop with an nVidia GeForce GT 1030 (NV138) with Fedora 28
installed.

I am seeing errors on boot and I can't use the card.

nouveau 0000:02:00.0: bus: MMIO read of 00000000 FAULT at 409800 [ TIMEOUT ]
...
nouveau 0000:02:00.0: timeout
...
nouveau 0000:02:00.0: gr: init failed, -16


xorg-x11-drv-nouveau-1.0.15-4.fc28.x86_64
mesa-dri-drivers-18.0.2-1.fc28.x86_64

uname -a
Linux roffey10 4.17.0-0.rc7.git2.1.vanilla.knurd.1.fc28.x86_64 #1 SMP Sat J=
un 2
05:03:40 UTC 2018 x86_64 x86_64 x86_64 GNU/Linux

I have attached the dmesg output.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15280168790.3C5A.18070--

--===============0396239180==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0396239180==--
