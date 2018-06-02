From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 106787] New: Thinkpad P52s NVIDIA Quadro P500 gp108
 WARNING: CPU: 3 PID: 395 at
 drivers/gpu/drm/nouveau/nvkm/subdev/pmu/base.c:86
 nvkm_pmu_reset+0x14c/0x160 [nouveau]
Date: Sat, 02 Jun 2018 21:51:59 +0000
Message-ID: <bug-106787-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1215448736=="
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


--===============1215448736==
Content-Type: multipart/alternative; boundary="15279763190.FbeAFE2.21072"
Content-Transfer-Encoding: 7bit


--15279763190.FbeAFE2.21072
Date: Sat, 2 Jun 2018 21:51:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D106787

            Bug ID: 106787
           Summary: Thinkpad P52s NVIDIA Quadro P500 gp108 WARNING: CPU: 3
                    PID: 395 at
                    drivers/gpu/drm/nouveau/nvkm/subdev/pmu/base.c:86
                    nvkm_pmu_reset+0x14c/0x160 [nouveau]
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: jlmagee-HdwXkjjr9CHk1uMJSBkQmQ@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 139973
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D139973&action=3Dedit
dmesg from boot

multiple nouveau crashes during boot

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15279763190.FbeAFE2.21072
Date: Sat, 2 Jun 2018 21:51:59 +0000
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
   title=3D"NEW - Thinkpad P52s NVIDIA Quadro P500 gp108 WARNING: CPU: 3 PI=
D: 395 at drivers/gpu/drm/nouveau/nvkm/subdev/pmu/base.c:86 nvkm_pmu_reset+=
0x14c/0x160 [nouveau]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D106787">106787</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Thinkpad P52s NVIDIA Quadro P500 gp108 WARNING: CPU: 3 PID: 3=
95 at drivers/gpu/drm/nouveau/nvkm/subdev/pmu/base.c:86 nvkm_pmu_reset+0x14=
c/0x160 [nouveau]
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
          <td>jlmagee&#64;mageenet.net
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D139973=
" name=3D"attach_139973" title=3D"dmesg from boot">attachment 139973</a> <a=
 href=3D"attachment.cgi?id=3D139973&amp;action=3Dedit" title=3D"dmesg from =
boot">[details]</a></span>
dmesg from boot

multiple nouveau crashes during boot</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15279763190.FbeAFE2.21072--

--===============1215448736==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1215448736==--
