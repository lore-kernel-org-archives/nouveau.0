From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 108783] New: Nouveau crash in X server / display
 system with PAGE_NOT_PRESENT/NULL_DMAOBJ running Minecraft Feed The Beast
 Continuum
Date: Mon, 19 Nov 2018 07:30:11 +0000
Message-ID: <bug-108783-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1153315987=="
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


--===============1153315987==
Content-Type: multipart/alternative; boundary="15426126111.7321.8437"
Content-Transfer-Encoding: 7bit


--15426126111.7321.8437
Date: Mon, 19 Nov 2018 07:30:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D108783

            Bug ID: 108783
           Summary: Nouveau crash in X server / display system with
                    PAGE_NOT_PRESENT/NULL_DMAOBJ running Minecraft Feed
                    The Beast  Continuum
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: major
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: pere-YXalUvoVQabQT0dZR+AlfA@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 142513
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D142513&action=3Dedit
dmesg output from /var/log/kern.log from the crash

When running Minecraft Feed The Beast on a machine with the NVIDIA Quadro N=
VS
295 graphics controller, the graphics system hangs after a while while load=
ing
Feed The Beast.  The machine in question is using Debian Stretch 9.6 with t=
he
latest updates.  I had to reboot the machine to get it working again.=20
Switching from the nouveau kernel driver to the nvidia-legacy-340xx-kernel-=
dkms
kernel driver solved the problem.

After the crash I found the found the attached kernel messages in
/var/log/kern.log.  Please let me know if there is anyting more information=
 I
can provide, while the machine and setup is available for me to test on.

The machine in question have 16 GiB RAM.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15426126111.7321.8437
Date: Mon, 19 Nov 2018 07:30:11 +0000
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
   title=3D"NEW - Nouveau crash in X server / display system with PAGE_NOT_=
PRESENT/NULL_DMAOBJ running Minecraft Feed The Beast Continuum"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108783">108783</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Nouveau crash in X server / display system with PAGE_NOT_PRES=
ENT/NULL_DMAOBJ running Minecraft Feed The Beast  Continuum
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
          <td>pere&#64;hungry.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D142513=
" name=3D"attach_142513" title=3D"dmesg output from /var/log/kern.log from =
the crash">attachment 142513</a> <a href=3D"attachment.cgi?id=3D142513&amp;=
action=3Dedit" title=3D"dmesg output from /var/log/kern.log from the crash"=
>[details]</a></span>
dmesg output from /var/log/kern.log from the crash

When running Minecraft Feed The Beast on a machine with the NVIDIA Quadro N=
VS
295 graphics controller, the graphics system hangs after a while while load=
ing
Feed The Beast.  The machine in question is using Debian Stretch 9.6 with t=
he
latest updates.  I had to reboot the machine to get it working again.=20
Switching from the nouveau kernel driver to the nvidia-legacy-340xx-kernel-=
dkms
kernel driver solved the problem.

After the crash I found the found the attached kernel messages in
/var/log/kern.log.  Please let me know if there is anyting more information=
 I
can provide, while the machine and setup is available for me to test on.

The machine in question have 16 GiB RAM.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15426126111.7321.8437--

--===============1153315987==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1153315987==--
