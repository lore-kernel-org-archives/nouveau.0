From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 101448] New: Kernel crashes while using nouveau
Date: Thu, 15 Jun 2017 13:08:44 +0000
Message-ID: <bug-101448-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1607369959=="
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


--===============1607369959==
Content-Type: multipart/alternative; boundary="14975321240.f2e29D.3853";
 charset="UTF-8"


--14975321240.f2e29D.3853
Date: Thu, 15 Jun 2017 13:08:44 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D101448

            Bug ID: 101448
           Summary: Kernel crashes while using nouveau
           Product: xorg
           Version: unspecified
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: netwiz-tY1ak9Q0PTWHXe+LvDLADg@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 131979
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D131979&action=3Dedit
dmesg after kernel crashes

I've played with installing a rawhide kernel (4.12.0-rc5) onto a current Fe=
dora
26 desktop and noticed a number of kernel crashes which end up at a complete
input freeze / corrupted display.

I have attached the dmesg to this bug report.

Versions:
# rpm -qa | grep Xorg
xorg-x11-server-Xorg-1.19.3-4.fc26.x86_64

# rpm -qa | grep nouveau
xorg-x11-drv-nouveau-1.0.15-1.fc26.x86_64

# rpm -qa | grep mesa | sort
mesa-dri-drivers-17.1.1-2.fc26.i686
mesa-dri-drivers-17.1.1-2.fc26.x86_64
mesa-filesystem-17.1.1-2.fc26.i686
mesa-filesystem-17.1.1-2.fc26.x86_64
mesa-libEGL-17.1.1-2.fc26.i686
mesa-libEGL-17.1.1-2.fc26.x86_64
mesa-libgbm-17.1.1-2.fc26.i686
mesa-libgbm-17.1.1-2.fc26.x86_64
mesa-libGL-17.1.1-2.fc26.i686
mesa-libGL-17.1.1-2.fc26.x86_64
mesa-libglapi-17.1.1-2.fc26.i686
mesa-libglapi-17.1.1-2.fc26.x86_64
mesa-libGLU-9.0.0-11.fc26.x86_64
mesa-libwayland-egl-17.1.1-2.fc26.i686
mesa-libwayland-egl-17.1.1-2.fc26.x86_64
mesa-vulkan-drivers-17.1.1-2.fc26.x86_64

# lspci | grep VGA
03:00.0 VGA compatible controller: NVIDIA Corporation GP106 [GeForce GTX 10=
60
6GB] (rev a1)

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14975321240.f2e29D.3853
Date: Thu, 15 Jun 2017 13:08:44 +0000
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
   title=3D"NEW - Kernel crashes while using nouveau"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101448">101448</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Kernel crashes while using nouveau
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
          <td>netwiz&#64;crc.id.au
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D131979=
" name=3D"attach_131979" title=3D"dmesg after kernel crashes">attachment 13=
1979</a> <a href=3D"attachment.cgi?id=3D131979&amp;action=3Dedit" title=3D"=
dmesg after kernel crashes">[details]</a></span>
dmesg after kernel crashes

I've played with installing a rawhide kernel (4.12.0-rc5) onto a current Fe=
dora
26 desktop and noticed a number of kernel crashes which end up at a complete
input freeze / corrupted display.

I have attached the dmesg to this bug report.

Versions:
# rpm -qa | grep Xorg
xorg-x11-server-Xorg-1.19.3-4.fc26.x86_64

# rpm -qa | grep nouveau
xorg-x11-drv-nouveau-1.0.15-1.fc26.x86_64

# rpm -qa | grep mesa | sort
mesa-dri-drivers-17.1.1-2.fc26.i686
mesa-dri-drivers-17.1.1-2.fc26.x86_64
mesa-filesystem-17.1.1-2.fc26.i686
mesa-filesystem-17.1.1-2.fc26.x86_64
mesa-libEGL-17.1.1-2.fc26.i686
mesa-libEGL-17.1.1-2.fc26.x86_64
mesa-libgbm-17.1.1-2.fc26.i686
mesa-libgbm-17.1.1-2.fc26.x86_64
mesa-libGL-17.1.1-2.fc26.i686
mesa-libGL-17.1.1-2.fc26.x86_64
mesa-libglapi-17.1.1-2.fc26.i686
mesa-libglapi-17.1.1-2.fc26.x86_64
mesa-libGLU-9.0.0-11.fc26.x86_64
mesa-libwayland-egl-17.1.1-2.fc26.i686
mesa-libwayland-egl-17.1.1-2.fc26.x86_64
mesa-vulkan-drivers-17.1.1-2.fc26.x86_64

# lspci | grep VGA
03:00.0 VGA compatible controller: NVIDIA Corporation GP106 [GeForce GTX 10=
60
6GB] (rev a1)</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14975321240.f2e29D.3853--

--===============1607369959==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1607369959==--
