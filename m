From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 106994] New: [PATCH] Fix null pointer dereference in
 drmmode_output_dpms
Date: Thu, 21 Jun 2018 14:54:40 +0000
Message-ID: <bug-106994-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1009730962=="
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


--===============1009730962==
Content-Type: multipart/alternative; boundary="15295928800.23CDC.32533"
Content-Transfer-Encoding: 7bit


--15295928800.23CDC.32533
Date: Thu, 21 Jun 2018 14:54:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D106994

            Bug ID: 106994
           Summary: [PATCH] Fix null pointer dereference in
                    drmmode_output_dpms
           Product: xorg
           Version: git
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: major
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: john-ytntcHzVV1kcWVvVuXF20w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 140263
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D140263&action=3Dedit
Fix null pointer dereference in drmmode_output_dpms

This fixes an Xorg crash when a Lenovo P50 laptop is undocked, disconnectin=
g it
from two external DisplayPort monitors.

Checking for koutput =3D=3D NULL has precedent in drmmode_output_get_modes.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15295928800.23CDC.32533
Date: Thu, 21 Jun 2018 14:54:40 +0000
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
   title=3D"NEW - [PATCH] Fix null pointer dereference in drmmode_output_dp=
ms"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D106994">106994</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[PATCH] Fix null pointer dereference in drmmode_output_dpms
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>git
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
          <td>john&#64;jlindgren.net
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D140263=
" name=3D"attach_140263" title=3D"Fix null pointer dereference in drmmode_o=
utput_dpms">attachment 140263</a> <a href=3D"attachment.cgi?id=3D140263&amp=
;action=3Dedit" title=3D"Fix null pointer dereference in drmmode_output_dpm=
s">[details]</a></span> <a href=3D'page.cgi?id=3Dsplinter.html&amp;bug=3D10=
6994&amp;attachment=3D140263'>[review]</a>
Fix null pointer dereference in drmmode_output_dpms

This fixes an Xorg crash when a Lenovo P50 laptop is undocked, disconnectin=
g it
from two external DisplayPort monitors.

Checking for koutput =3D=3D NULL has precedent in drmmode_output_get_modes.=
</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15295928800.23CDC.32533--

--===============1009730962==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1009730962==--
