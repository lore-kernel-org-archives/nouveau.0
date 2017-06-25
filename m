From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 101587] New: [BISECTED][REGRESSION] Nouveau kernel
 module (>4.10) on NVA8 renders the system unusable
Date: Sun, 25 Jun 2017 17:09:12 +0000
Message-ID: <bug-101587-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1958632735=="
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


--===============1958632735==
Content-Type: multipart/alternative; boundary="14984105520.509A7.5816";
 charset="UTF-8"


--14984105520.509A7.5816
Date: Sun, 25 Jun 2017 17:09:12 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D101587

            Bug ID: 101587
           Summary: [BISECTED][REGRESSION] Nouveau kernel module (>4.10)
                    on NVA8 renders the system unusable
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: otero.o.daniel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 132233
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D132233&action=3Dedit
Kernel dmesg without bug

It happens every single boot. The system becomes unresponsive seconds after
boot and the fan go to full speed until I force the system to shutdown.

Sometimes the screen stays completely black, other times it shows the conso=
le
login prompt (no X involved), but the system it's barely usable.

Bisected the offending commit, and resulted this one:

> commit 1e2115d8c0c0da62405400316f5499d909e479bc (refs/bisect/bad)
> Author: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Date:   Tue Dec 13 17:11:20 2016 +0900
>=20=20
>     drm/nouveau/pmu: instanciate the falcon in PMU device

I attached the kernel logs with "nouveau.debug=3Ddebug" for both the previo=
us and
the failing commit.

System details:
  > Arch Linux
  > CPU Intel Core i5 480M with Intel Integrated Graphics
  > GPU Nvidia GeForce 310M (with Optimus technology)

Thank you for your time.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14984105520.509A7.5816
Date: Sun, 25 Jun 2017 17:09:12 +0000
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
   title=3D"NEW - [BISECTED][REGRESSION] Nouveau kernel module (&gt;4.10) o=
n NVA8 renders the system unusable"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101587">101587</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[BISECTED][REGRESSION] Nouveau kernel module (&gt;4.10)  on N=
VA8 renders the system unusable
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
          <td>otero.o.daniel&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D132233=
" name=3D"attach_132233" title=3D"Kernel dmesg without bug">attachment 1322=
33</a> <a href=3D"attachment.cgi?id=3D132233&amp;action=3Dedit" title=3D"Ke=
rnel dmesg without bug">[details]</a></span>
Kernel dmesg without bug

It happens every single boot. The system becomes unresponsive seconds after
boot and the fan go to full speed until I force the system to shutdown.

Sometimes the screen stays completely black, other times it shows the conso=
le
login prompt (no X involved), but the system it's barely usable.

Bisected the offending commit, and resulted this one:

<span class=3D"quote">&gt; commit 1e2115d8c0c0da62405400316f5499d909e479bc =
(refs/bisect/bad)
&gt; Author: Alexandre Courbot &lt;<a href=3D"mailto:acourbot&#64;nvidia.co=
m">acourbot&#64;nvidia.com</a>&gt;
&gt; Date:   Tue Dec 13 17:11:20 2016 +0900
&gt;=20=20
&gt;     drm/nouveau/pmu: instanciate the falcon in PMU device</span >

I attached the kernel logs with &quot;nouveau.debug=3Ddebug&quot; for both =
the previous and
the failing commit.

System details:
  &gt; Arch Linux
  &gt; CPU Intel Core i5 480M with Intel Integrated Graphics
  &gt; GPU Nvidia GeForce 310M (with Optimus technology)

Thank you for your time.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14984105520.509A7.5816--

--===============1958632735==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1958632735==--
