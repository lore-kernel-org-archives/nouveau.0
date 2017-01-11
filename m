From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 99372] New: Nvidia 640M devinit fails
Date: Wed, 11 Jan 2017 23:43:21 +0000
Message-ID: <bug-99372-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1389286479=="
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


--===============1389286479==
Content-Type: multipart/alternative; boundary="14841782010.ddcB7b3F6.30287";
 charset="UTF-8"


--14841782010.ddcB7b3F6.30287
Date: Wed, 11 Jan 2017 23:43:21 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D99372

            Bug ID: 99372
           Summary: Nvidia 640M devinit fails
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: me-V++FmNMs79yAgvX28Wk5yQ@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 128904
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D128904&action=3Dedit
vbios.rom

I have a VAIO SVS1511C5E laptop and the nouveau driver is not working in ke=
rnel
versions > 3.16 . (3.19 does not work for me)

From my understanding the ACPI loading of the bios rom fails. I tried other
methods as suggested in many other threads (PROM, PRAMIN), but they also fa=
il.
ACPI loading worked in kernel 3.16.

I attach the vbios.rom copied from a booted 3.16 kernel from
/sys/kernel/debug/dri/1/vbios.rom and a dmesg log showing the error from ke=
rnel
4.10rc3.

As a workaround I am able to load nouveau manually in all kernels by provid=
ing
the copied vbios.rom as a parameter to the nouveau module.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14841782010.ddcB7b3F6.30287
Date: Wed, 11 Jan 2017 23:43:21 +0000
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
   title=3D"NEW - Nvidia 640M devinit fails"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99372">99372</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Nvidia 640M devinit fails
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
          <td>me&#64;marcel-sander.eu
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D128904=
" name=3D"attach_128904" title=3D"vbios.rom">attachment 128904</a> <a href=
=3D"attachment.cgi?id=3D128904&amp;action=3Dedit" title=3D"vbios.rom">[deta=
ils]</a></span>
vbios.rom

I have a VAIO SVS1511C5E laptop and the nouveau driver is not working in ke=
rnel
versions &gt; 3.16 . (3.19 does not work for me)

From my understanding the ACPI loading of the bios rom fails. I tried other
methods as suggested in many other threads (PROM, PRAMIN), but they also fa=
il.
ACPI loading worked in kernel 3.16.

I attach the vbios.rom copied from a booted 3.16 kernel from
/sys/kernel/debug/dri/1/vbios.rom and a dmesg log showing the error from ke=
rnel
4.10rc3.

As a workaround I am able to load nouveau manually in all kernels by provid=
ing
the copied vbios.rom as a parameter to the nouveau module.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14841782010.ddcB7b3F6.30287--

--===============1389286479==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1389286479==--
