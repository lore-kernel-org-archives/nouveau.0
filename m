From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 100922] New: Redundant nv_backlight created on
 Optimus enabled laptop.
Date: Thu, 04 May 2017 05:23:29 +0000
Message-ID: <bug-100922-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1844525207=="
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


--===============1844525207==
Content-Type: multipart/alternative; boundary="14938754080.0CEe.7165";
 charset="UTF-8"


--14938754080.0CEe.7165
Date: Thu, 4 May 2017 05:23:28 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D100922

            Bug ID: 100922
           Summary: Redundant nv_backlight created on Optimus enabled
                    laptop.
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: kai.heng.feng-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Original bug report:
https://bugs.launchpad.net/bugs/1683445

On Dell E6430, Optimus is enabled in BIOS settings, there are two backlights
interface being created: intel_backlight and nv_backlight. Changing brightn=
ess
in nv_backlight does nothing, intel_backlight is in charge here.

Userspace backlight control tools (unity-settings-daemon/gnome-settings-dae=
mon)
will use nv_backlight on this laptop, because nouveau is card0 here.

Dived a little deeper, nv_backlight is created because
'connector->connector_type' is DRM_MODE_CONNECTOR_LVDS on this laptop.

Can we disable nouveau's backlight on Optimus laptop?

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14938754080.0CEe.7165
Date: Thu, 4 May 2017 05:23:28 +0000
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
   title=3D"NEW - Redundant nv_backlight created on Optimus enabled laptop."
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100922">100922</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Redundant nv_backlight created on Optimus enabled laptop.
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
          <td>kai.heng.feng&#64;canonical.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Original bug report:
<a href=3D"https://bugs.launchpad.net/bugs/1683445">https://bugs.launchpad.=
net/bugs/1683445</a>

On Dell E6430, Optimus is enabled in BIOS settings, there are two backlights
interface being created: intel_backlight and nv_backlight. Changing brightn=
ess
in nv_backlight does nothing, intel_backlight is in charge here.

Userspace backlight control tools (unity-settings-daemon/gnome-settings-dae=
mon)
will use nv_backlight on this laptop, because nouveau is card0 here.

Dived a little deeper, nv_backlight is created because
'connector-&gt;connector_type' is DRM_MODE_CONNECTOR_LVDS on this laptop.

Can we disable nouveau's backlight on Optimus laptop?</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14938754080.0CEe.7165--

--===============1844525207==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1844525207==--
