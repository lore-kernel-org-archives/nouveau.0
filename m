From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 102382] New: nv50ir: isImmediate doesn't properly
 work for integers if Value is typed as float
Date: Wed, 23 Aug 2017 21:18:46 +0000
Message-ID: <bug-102382-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0000259899=="
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


--===============0000259899==
Content-Type: multipart/alternative; boundary="15035231261.9cb55B35.1720";
 charset="UTF-8"


--15035231261.9cb55B35.1720
Date: Wed, 23 Aug 2017 21:18:46 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D102382

            Bug ID: 102382
           Summary: nv50ir: isImmediate doesn't properly work for integers
                    if Value is typed as float
           Product: xorg
           Version: git
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: karolherbst-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 133728
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D133728&action=3Dedit
TGSI

codegen should generate a texfetch instruction with a lod according to
IMM[1].xxxx, which is of value 2, but in
https://cgit.freedesktop.org/mesa/mesa/tree/src/gallium/drivers/nouveau/cod=
egen/nv50_ir_lowering_nvc0.cpp#n140
the isInteger(0) call assumes the Value being a F32, which leads to a is
2.8E-45 =3D=3D 0 check returning true resulting into the lod argument being=
 removed
from texfetch.

This causes a fail in the KHR-GL44.robust_buffer_access_behavior.texel_fetch
CTS test.

Other isInteger calls might be broken as well where an immediate of type fl=
oat
is interpreted as int by the instruction.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15035231261.9cb55B35.1720
Date: Wed, 23 Aug 2017 21:18:46 +0000
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
   title=3D"NEW - nv50ir: isImmediate doesn't properly work for integers if=
 Value is typed as float"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D102382">102382</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>nv50ir: isImmediate doesn't properly work for integers if Val=
ue is typed as float
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
          <td>karolherbst&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D133728=
" name=3D"attach_133728" title=3D"TGSI">attachment 133728</a> <a href=3D"at=
tachment.cgi?id=3D133728&amp;action=3Dedit" title=3D"TGSI">[details]</a></s=
pan>
TGSI

codegen should generate a texfetch instruction with a lod according to
IMM[1].xxxx, which is of value 2, but in
<a href=3D"https://cgit.freedesktop.org/mesa/mesa/tree/src/gallium/drivers/=
nouveau/codegen/nv50_ir_lowering_nvc0.cpp#n140">https://cgit.freedesktop.or=
g/mesa/mesa/tree/src/gallium/drivers/nouveau/codegen/nv50_ir_lowering_nvc0.=
cpp#n140</a>
the isInteger(0) call assumes the Value being a F32, which leads to a is
2.8E-45 =3D=3D 0 check returning true resulting into the lod argument being=
 removed
from texfetch.

This causes a fail in the KHR-GL44.robust_buffer_access_behavior.texel_fetch
CTS test.

Other isInteger calls might be broken as well where an immediate of type fl=
oat
is interpreted as int by the instruction.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15035231261.9cb55B35.1720--

--===============0000259899==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0000259899==--
