From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 99584] New: XVMC on nv43 class card broken with
 recent mesa + kernel.
Date: Sun, 29 Jan 2017 07:27:59 +0000
Message-ID: <bug-99584-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1277422752=="
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


--===============1277422752==
Content-Type: multipart/alternative; boundary="14856748790.4d1dFDA.26984";
 charset="UTF-8"


--14856748790.4d1dFDA.26984
Date: Sun, 29 Jan 2017 07:27:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D99584

            Bug ID: 99584
           Summary: XVMC on nv43 class card broken with recent mesa +
                    kernel.
           Product: Mesa
           Version: git
          Hardware: x86 (IA32)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: randrik-JGs/UdohzUI@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

Hello again.

Not sure if anyone will look into this, but I run into bug where xvmc state
tracker/nouveau failed for me in multiple ways, depending on exact kernel/m=
esa
combination.

With kernel 4.2.0 new mesa (Mesa 17.1.0-devel git-12dcad1) compiled agains
recent libdrm (d4b8344363b4e0f0e831e5722b6df5cc0bb08df8
Author: Chad Versace <chadversary-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Date:   Fri Jan 27 12:18:00 2017 -0800
    Bump version for 2.4.75 release)

 produces pink window.

With more mdoern kernel (4.10-rc5). whole device creation failed.

Test commandline:
 /home/guest/src/mesa/src/gallium/state_trackers/xvmc/tests/xvmc_bench

result:
Acceleration level: IDCT
Creation failed: No such device (-19)
xvmc_bench: tests/xvmc_bench.c:238: main: Assertion `XvMCCreateContext(disp=
lay,
port_num, surface_type_id, config.input_width, config.input_height, 0x00000=
001,
&context) =3D=3D 0' failed.

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--14856748790.4d1dFDA.26984
Date: Sun, 29 Jan 2017 07:27:59 +0000
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
   title=3D"NEW - XVMC on nv43 class card broken with recent mesa + kernel."
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99584">99584</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>XVMC on nv43 class card broken with recent mesa + kernel.
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>git
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86 (IA32)
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
          <td>Drivers/DRI/nouveau
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>randrik&#64;mail.ru
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Hello again.

Not sure if anyone will look into this, but I run into bug where xvmc state
tracker/nouveau failed for me in multiple ways, depending on exact kernel/m=
esa
combination.

With kernel 4.2.0 new mesa (Mesa 17.1.0-devel git-12dcad1) compiled agains
recent libdrm (d4b8344363b4e0f0e831e5722b6df5cc0bb08df8
Author: Chad Versace &lt;<a href=3D"mailto:chadversary&#64;chromium.org">ch=
adversary&#64;chromium.org</a>&gt;
Date:   Fri Jan 27 12:18:00 2017 -0800
    Bump version for 2.4.75 release)

 produces pink window.

With more mdoern kernel (4.10-rc5). whole device creation failed.

Test commandline:
 /home/guest/src/mesa/src/gallium/state_trackers/xvmc/tests/xvmc_bench

result:
Acceleration level: IDCT
Creation failed: No such device (-19)
xvmc_bench: tests/xvmc_bench.c:238: main: Assertion `XvMCCreateContext(disp=
lay,
port_num, surface_type_id, config.input_width, config.input_height, 0x00000=
001,
&amp;context) =3D=3D 0' failed.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
          <li>You are the QA Contact for the bug.</li>
      </ul>
    </body>
</html>=

--14856748790.4d1dFDA.26984--

--===============1277422752==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1277422752==--
