From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 100423] New: MMIO read of 00000000 FAULT at 022554 [
	IBUS ]
Date: Mon, 27 Mar 2017 20:42:44 +0000
Message-ID: <bug-100423-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0838489808=="
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


--===============0838489808==
Content-Type: multipart/alternative; boundary="14906473641.2BCbb57b.18503";
 charset="UTF-8"


--14906473641.2BCbb57b.18503
Date: Mon, 27 Mar 2017 20:42:44 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D100423

            Bug ID: 100423
           Summary: MMIO read of 00000000 FAULT at 022554 [ IBUS ]
           Product: xorg
           Version: unspecified
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: bruno.n.pagani-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 130492
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D130492&action=3Dedit
dmesg output

Hi there,

I=E2=80=99ve got a new laptop since a couple months, and I=E2=80=99m starti=
ng to configure it
intensively and report bug. It=E2=80=99s an HP zBook Studio G3, with a Core=
 i7-6700HQ
with Intel HD graphics and a dedicated NVIDIA Corporation GM107GLM [Quadro
M1000M] card. Amongst the issue I find in dmesg, there is those two lines t=
hat
appear in red:

[   16.246988] nouveau 0000:01:00.0: priv: HUB0: 614900 00800000 (18408200)
[   16.248921] nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 02=
2554
[ IBUS ]

I=E2=80=99ve attached the full dmesg.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14906473641.2BCbb57b.18503
Date: Mon, 27 Mar 2017 20:42:44 +0000
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
   title=3D"NEW - MMIO read of 00000000 FAULT at 022554 [ IBUS ]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100423">100423</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>MMIO read of 00000000 FAULT at 022554 [ IBUS ]
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
          <td>bruno.n.pagani&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D130492=
" name=3D"attach_130492" title=3D"dmesg output">attachment 130492</a> <a hr=
ef=3D"attachment.cgi?id=3D130492&amp;action=3Dedit" title=3D"dmesg output">=
[details]</a></span>
dmesg output

Hi there,

I=E2=80=99ve got a new laptop since a couple months, and I=E2=80=99m starti=
ng to configure it
intensively and report bug. It=E2=80=99s an HP zBook Studio G3, with a Core=
 i7-6700HQ
with Intel HD graphics and a dedicated NVIDIA Corporation GM107GLM [Quadro
M1000M] card. Amongst the issue I find in dmesg, there is those two lines t=
hat
appear in red:

[   16.246988] nouveau 0000:01:00.0: priv: HUB0: 614900 00800000 (18408200)
[   16.248921] nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 02=
2554
[ IBUS ]

I=E2=80=99ve attached the full dmesg.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14906473641.2BCbb57b.18503--

--===============0838489808==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0838489808==--
