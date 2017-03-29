From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 100446] New: Backlight control not working on Pascal
 / GP106 using nouveau drivers
Date: Wed, 29 Mar 2017 10:42:53 +0000
Message-ID: <bug-100446-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0033671597=="
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


--===============0033671597==
Content-Type: multipart/alternative; boundary="14907841730.E23a9D3.23992";
 charset="UTF-8"


--14907841730.E23a9D3.23992
Date: Wed, 29 Mar 2017 10:42:53 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D100446

            Bug ID: 100446
           Summary: Backlight control not working on Pascal / GP106 using
                    nouveau drivers
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

I'm currently working on an ASUS GL702VMK. This machine is shipping a GeFor=
ce
GTX 1060 GP106 (136000a1) connected to an internal DisplayPort on DFP-5 (us=
ual
AU Optronics Corporation).

Using the unmodified latest nouveau drivers I have no backlight control.
Modifying nouveau_backlight.c adding a case for NV_DEVICE_INFO_V0_PASCAL I
finally get /sys/class/backlight/nv_backlight/ but changing the backlight v=
alue
in there is not working anyway.

Trying to manually poke NV50_PDISP_SOR_PWM_CTL(1) with `nvapoke` has no eff=
ect
whatsoever on the brightness (on or=3D=3D1)

Backlight control is not working using the proprietary 375 / 378 drivers
either. Also in this case the value of NV50_PDISP_SOR_PWM_CTL is actually
changed by `xbacklight` but with no visible effect.

Any hint?

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14907841730.E23a9D3.23992
Date: Wed, 29 Mar 2017 10:42:53 +0000
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
   title=3D"NEW - Backlight control not working on Pascal / GP106 using nou=
veau drivers"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100446">100446</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Backlight control not working on Pascal / GP106 using nouveau=
 drivers
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
          <td>carlo&#64;caione.org
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>I'm currently working on an ASUS GL702VMK. This machine is shi=
pping a GeForce
GTX 1060 GP106 (136000a1) connected to an internal DisplayPort on DFP-5 (us=
ual
AU Optronics Corporation).

Using the unmodified latest nouveau drivers I have no backlight control.
Modifying nouveau_backlight.c adding a case for NV_DEVICE_INFO_V0_PASCAL I
finally get /sys/class/backlight/nv_backlight/ but changing the backlight v=
alue
in there is not working anyway.

Trying to manually poke NV50_PDISP_SOR_PWM_CTL(1) with `nvapoke` has no eff=
ect
whatsoever on the brightness (on or=3D=3D1)

Backlight control is not working using the proprietary 375 / 378 drivers
either. Also in this case the value of NV50_PDISP_SOR_PWM_CTL is actually
changed by `xbacklight` but with no visible effect.

Any hint?</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14907841730.E23a9D3.23992--

--===============0033671597==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0033671597==--
