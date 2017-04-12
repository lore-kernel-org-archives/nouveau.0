From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 100660] New: [nouveau] No temperature/voltages/GPU
 and RAM frequency/fan speed reporting for GTX 1060 6GB
Date: Wed, 12 Apr 2017 08:08:46 +0000
Message-ID: <bug-100660-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0895945789=="
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


--===============0895945789==
Content-Type: multipart/alternative; boundary="14919845261.13E2c.8854";
 charset="UTF-8"


--14919845261.13E2c.8854
Date: Wed, 12 Apr 2017 08:08:46 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D100660

            Bug ID: 100660
           Summary: [nouveau] No temperature/voltages/GPU and RAM
                    frequency/fan speed reporting for GTX 1060 6GB
           Product: xorg
           Version: git
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: t.artem-VInPYn6yXxRWk0Htik3J/w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 130809
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D130809&action=3Dedit
nouveau kernel module errors

I wonder if this feature is indeed implemented but is reported differently =
than
with e.g. Kepler cards where nouveau reports it via lm-sensors.

`sensors` doesn't report anything.
`dmesg` doesn't report anything.

I couldn't find anything interesting under /sys.

I'm just run `sensors-detect` and answered YES to all questions, yet nothing
has surfaced except a ton of errors(?) from the kernel module:

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14919845261.13E2c.8854
Date: Wed, 12 Apr 2017 08:08:46 +0000
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
   title=3D"NEW - [nouveau] No temperature/voltages/GPU and RAM frequency/f=
an speed reporting for GTX 1060 6GB"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100660">100660</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[nouveau] No temperature/voltages/GPU and RAM frequency/fan s=
peed reporting for GTX 1060 6GB
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
          <td>t.artem&#64;mailcity.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D130809=
" name=3D"attach_130809" title=3D"nouveau kernel module errors">attachment =
130809</a> <a href=3D"attachment.cgi?id=3D130809&amp;action=3Dedit" title=
=3D"nouveau kernel module errors">[details]</a></span>
nouveau kernel module errors

I wonder if this feature is indeed implemented but is reported differently =
than
with e.g. Kepler cards where nouveau reports it via lm-sensors.

`sensors` doesn't report anything.
`dmesg` doesn't report anything.

I couldn't find anything interesting under /sys.

I'm just run `sensors-detect` and answered YES to all questions, yet nothing
has surfaced except a ton of errors(?) from the kernel module:</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14919845261.13E2c.8854--

--===============0895945789==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0895945789==--
