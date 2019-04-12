From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 110407] New: /sys/class/backlight/nv_backlight
 doesn't work on Dell Precision 7530 GP107GLM [Quadro P1000 Mobile]
Date: Fri, 12 Apr 2019 05:56:55 +0000
Message-ID: <bug-110407-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1563224148=="
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


--===============1563224148==
Content-Type: multipart/alternative; boundary="15550486152.0dEaea6.8733"
Content-Transfer-Encoding: 7bit


--15550486152.0dEaea6.8733
Date: Fri, 12 Apr 2019 05:56:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110407

            Bug ID: 110407
           Summary: /sys/class/backlight/nv_backlight doesn't work on Dell
                    Precision 7530 GP107GLM [Quadro P1000 Mobile]
           Product: xorg
           Version: unspecified
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: kai.heng.feng-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

This laptop has an BIOS option "Switchable Graphics". When the options is
selected, it behaves like a normal Optimus laptop. In this case, brightness
sysfs works since it's driven by Intel graphics.

When the options is deselected, the Intel graphics device disappears, Nvidi=
a is
the only graphics device. The issue happens in this case.

Changing /sys/class/backlight/nv_backlight/brightness, the brightness level
remains the same - almost no backlight.

Using proprietary driver, brightness gets changed correctly by
/sys/class/backlight/nvidia_0/brightness.

No trace while using MMIOTRACE, under proprietary driver.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15550486152.0dEaea6.8733
Date: Fri, 12 Apr 2019 05:56:55 +0000
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
   title=3D"NEW - /sys/class/backlight/nv_backlight doesn't work on Dell Pr=
ecision 7530 GP107GLM [Quadro P1000 Mobile]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110407">110407</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>/sys/class/backlight/nv_backlight doesn't work on Dell Precis=
ion 7530 GP107GLM [Quadro P1000 Mobile]
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
        <pre>This laptop has an BIOS option &quot;Switchable Graphics&quot;=
. When the options is
selected, it behaves like a normal Optimus laptop. In this case, brightness
sysfs works since it's driven by Intel graphics.

When the options is deselected, the Intel graphics device disappears, Nvidi=
a is
the only graphics device. The issue happens in this case.

Changing /sys/class/backlight/nv_backlight/brightness, the brightness level
remains the same - almost no backlight.

Using proprietary driver, brightness gets changed correctly by
/sys/class/backlight/nvidia_0/brightness.

No trace while using MMIOTRACE, under proprietary driver.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15550486152.0dEaea6.8733--

--===============1563224148==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1563224148==--
