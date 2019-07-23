From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 111199] New: Bug in dither.depth property set
Date: Tue, 23 Jul 2019 09:38:33 +0000
Message-ID: <bug-111199-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1242867040=="
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


--===============1242867040==
Content-Type: multipart/alternative; boundary="15638747140.E1b18FfE.16762"
Content-Transfer-Encoding: 7bit


--15638747140.E1b18FfE.16762
Date: Tue, 23 Jul 2019 09:38:34 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111199

            Bug ID: 111199
           Summary: Bug in dither.depth property set
           Product: xorg
           Version: unspecified
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: max.kammerer-/E1597aS9LQAvxtiuMwx3w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

There is probably a bug in dither.depth property set cause its value compar=
ed
with dither.mode:

//nouveau_connector.c

if (property =3D=3D disp->dithering_mode) {
    if (asyc->dither.mode !=3D val) {
        asyc->dither.mode =3D val;
        asyc->set.dither =3D true;
    }
} else
if (property =3D=3D disp->dithering_depth) {
    if (asyc->dither.mode !=3D val) { //Should be dither.depth
        asyc->dither.depth =3D val;
        asyc->set.dither =3D true; //triggers dithering regardless of dithe=
r.mode
set above. Copy/Paste from above? Should be removed?
    }
}

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15638747140.E1b18FfE.16762
Date: Tue, 23 Jul 2019 09:38:34 +0000
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
   title=3D"NEW - Bug in dither.depth property set"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111199">111199</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Bug in dither.depth property set
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
          <td>max.kammerer&#64;yahoo.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>There is probably a bug in dither.depth property set cause its=
 value compared
with dither.mode:

//nouveau_connector.c

if (property =3D=3D disp-&gt;dithering_mode) {
    if (asyc-&gt;dither.mode !=3D val) {
        asyc-&gt;dither.mode =3D val;
        asyc-&gt;set.dither =3D true;
    }
} else
if (property =3D=3D disp-&gt;dithering_depth) {
    if (asyc-&gt;dither.mode !=3D val) { //Should be dither.depth
        asyc-&gt;dither.depth =3D val;
        asyc-&gt;set.dither =3D true; //triggers dithering regardless of di=
ther.mode
set above. Copy/Paste from above? Should be removed?
    }
}</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15638747140.E1b18FfE.16762--

--===============1242867040==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1242867040==--
