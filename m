From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 108032] New: nv50_ir_lowering_gm107.cpp:326:
 undefined reference to
 `nv50_ir::NVC0LoweringPass::loadMsAdjInfo32(nv50_ir::TexInstruction::Target,
 unsigned int, int, nv50_ir::Value*, bool)'
Date: Sun, 23 Sep 2018 15:04:11 +0000
Message-ID: <bug-108032-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2111105834=="
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


--===============2111105834==
Content-Type: multipart/alternative; boundary="15377150511.06e5Df9.32583"
Content-Transfer-Encoding: 7bit


--15377150511.06e5Df9.32583
Date: Sun, 23 Sep 2018 15:04:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D108032

            Bug ID: 108032
           Summary: nv50_ir_lowering_gm107.cpp:326: undefined reference to
                    `nv50_ir::NVC0LoweringPass::loadMsAdjInfo32(nv50_ir::T
                    exInstruction::Target, unsigned int, int,
                    nv50_ir::Value*, bool)'
           Product: Mesa
           Version: git
          Hardware: All
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: pedretti.fabio-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
                CC: pendingchaos02+fdobugzilla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org

Since latest commits mesa fails to build with:
./.libs/libnouveau.a(nv50_ir_lowering_gm107.o): In function
`nv50_ir::GM107LoweringPass::handleSUQ(nv50_ir::TexInstruction*)':
/<<PKGBUILDDIR>>/build/src/gallium/drivers/nouveau/../../../../../src/galli=
um/drivers/nouveau/codegen/nv50_ir_lowering_gm107.cpp:326:
undefined reference to
`nv50_ir::NVC0LoweringPass::loadMsAdjInfo32(nv50_ir::TexInstruction::Target,
unsigned int, int, nv50_ir::Value*, bool)'
/<<PKGBUILDDIR>>/build/src/gallium/drivers/nouveau/../../../../../src/galli=
um/drivers/nouveau/codegen/nv50_ir_lowering_gm107.cpp:322:
undefined reference to
`nv50_ir::NVC0LoweringPass::loadMsAdjInfo32(nv50_ir::TexInstruction::Target,
unsigned int, int, nv50_ir::Value*, bool)'
collect2: error: ld returned 1 exit status
Makefile:1178: recipe for target 'nouveau_compiler' failed

Full build log with configure options here:
https://launchpadlibrarian.net/389864818/buildlog_ubuntu-xenial-i386.mesa_1=
8.3~git1809230730.b473fc~oibaf~x_BUILDING.txt.gz

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--15377150511.06e5Df9.32583
Date: Sun, 23 Sep 2018 15:04:11 +0000
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
   title=3D"NEW - nv50_ir_lowering_gm107.cpp:326: undefined reference to `n=
v50_ir::NVC0LoweringPass::loadMsAdjInfo32(nv50_ir::TexInstruction::Target, =
unsigned int, int, nv50_ir::Value*, bool)'"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108032">108032</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>nv50_ir_lowering_gm107.cpp:326: undefined reference to `nv50_=
ir::NVC0LoweringPass::loadMsAdjInfo32(nv50_ir::TexInstruction::Target, unsi=
gned int, int, nv50_ir::Value*, bool)'
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
          <td>All
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
          <td>pedretti.fabio&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>CC</th>
          <td>pendingchaos02+fdobugzilla&#64;gmail.com
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Since latest commits mesa fails to build with:
./.libs/libnouveau.a(nv50_ir_lowering_gm107.o): In function
`nv50_ir::GM107LoweringPass::handleSUQ(nv50_ir::TexInstruction*)':
/&lt;&lt;PKGBUILDDIR&gt;&gt;/build/src/gallium/drivers/nouveau/../../../../=
../src/gallium/drivers/nouveau/codegen/nv50_ir_lowering_gm107.cpp:326:
undefined reference to
`nv50_ir::NVC0LoweringPass::loadMsAdjInfo32(nv50_ir::TexInstruction::Target,
unsigned int, int, nv50_ir::Value*, bool)'
/&lt;&lt;PKGBUILDDIR&gt;&gt;/build/src/gallium/drivers/nouveau/../../../../=
../src/gallium/drivers/nouveau/codegen/nv50_ir_lowering_gm107.cpp:322:
undefined reference to
`nv50_ir::NVC0LoweringPass::loadMsAdjInfo32(nv50_ir::TexInstruction::Target,
unsigned int, int, nv50_ir::Value*, bool)'
collect2: error: ld returned 1 exit status
Makefile:1178: recipe for target 'nouveau_compiler' failed

Full build log with configure options here:
<a href=3D"https://launchpadlibrarian.net/389864818/buildlog_ubuntu-xenial-=
i386.mesa_18.3~git1809230730.b473fc~oibaf~x_BUILDING.txt.gz">https://launch=
padlibrarian.net/389864818/buildlog_ubuntu-xenial-i386.mesa_18.3~git1809230=
730.b473fc~oibaf~x_BUILDING.txt.gz</a></pre>
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

--15377150511.06e5Df9.32583--

--===============2111105834==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============2111105834==--
