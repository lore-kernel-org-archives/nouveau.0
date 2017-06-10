From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 101371] New: GlobalCSE Pass moves phi instructions
Date: Sat, 10 Jun 2017 17:59:33 +0000
Message-ID: <bug-101371-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2028932009=="
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


--===============2028932009==
Content-Type: multipart/alternative; boundary="14971175730.019cA6Bfd.30504";
 charset="UTF-8"


--14971175730.019cA6Bfd.30504
Date: Sat, 10 Jun 2017 17:59:33 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D101371

            Bug ID: 101371
           Summary: GlobalCSE Pass moves phi instructions
           Product: Mesa
           Version: git
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: karolherbst-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

Created attachment 131843
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D131843&action=3Dedit
frag.tgsi

In the game "Renowned Explorers: International Society" an assertion was hit
within codegen, because GlobalCSE wanted to move a phi instruction after a =
join
instruction, which is illegal.

backtrace:
#0  __GI_raise (sig=3Dsig@entry=3D6) at ../sysdeps/unix/sysv/linux/raise.c:=
58
#1  0x00007ffff676d54a in __GI_abort () at abort.c:89
#2  0x00007ffff6764eb7 in __assert_fail_base (fmt=3D<optimized out>,
assertion=3Dassertion@entry=3D0x52ca18 "q->op !=3D OP_PHI || p->op =3D=3D O=
P_PHI",
file=3Dfile@entry=3D0x52c968
"../../../../../src/gallium/drivers/nouveau/codegen/nv50_ir_bb.cpp",=20
    line=3Dline@entry=3D219,=20
    function=3Dfunction@entry=3D0x52ce80
<nv50_ir::BasicBlock::insertAfter(nv50_ir::Instruction*,
nv50_ir::Instruction*)::__PRETTY_FUNCTION__> "void
nv50_ir::BasicBlock::insertAfter(nv50_ir::Instruction*,
nv50_ir::Instruction*)")
    at assert.c:92
#3  0x00007ffff6764f62 in __GI___assert_fail (assertion=3D0x52ca18 "q->op !=
=3D
OP_PHI || p->op =3D=3D OP_PHI", file=3D0x52c968
"../../../../../src/gallium/drivers/nouveau/codegen/nv50_ir_bb.cpp", line=
=3D219,=20
    function=3D0x52ce80 <nv50_ir::BasicBlock::insertAfter(nv50_ir::Instruct=
ion*,
nv50_ir::Instruction*)::__PRETTY_FUNCTION__> "void
nv50_ir::BasicBlock::insertAfter(nv50_ir::Instruction*,
nv50_ir::Instruction*)") at assert.c:101
#4  0x000000000041f0a0 in nv50_ir::BasicBlock::insertAfter (this=3D0x82fd10,
p=3D0x818ca0, q=3D0x81d0c0) at
../../../../../src/gallium/drivers/nouveau/codegen/nv50_ir_bb.cpp:219
#5  0x00000000004554c0 in nv50_ir::GlobalCSE::visit (this=3D0x7ffffffe7b70,
bb=3D0x82fd10) at
../../../../../src/gallium/drivers/nouveau/codegen/nv50_ir_peephole.cpp:3466
#6  0x00000000004200fd in nv50_ir::Pass::doRun (this=3D0x7ffffffe7b70,
func=3D0x7bc1a0, ordered=3Dfalse, skipPhi=3Dfalse) at
../../../../../src/gallium/drivers/nouveau/codegen/nv50_ir_bb.cpp:495
#7  0x000000000041ff05 in nv50_ir::Pass::doRun (this=3D0x7ffffffe7b70,
prog=3D0x7bc000, ordered=3Dfalse, skipPhi=3Dfalse) at
../../../../../src/gallium/drivers/nouveau/codegen/nv50_ir_bb.cpp:466
#8  0x000000000041fe60 in nv50_ir::Pass::run (this=3D0x7ffffffe7b70,
prog=3D0x7bc000, ordered=3Dfalse, skipPhi=3Dfalse) at
../../../../../src/gallium/drivers/nouveau/codegen/nv50_ir_bb.cpp:457
#9  0x00000000004561ed in nv50_ir::Program::optimizeSSA (this=3D0x7bc000,
level=3D3) at
../../../../../src/gallium/drivers/nouveau/codegen/nv50_ir_peephole.cpp:3725
#10 0x0000000000416adf in nv50_ir_generate_code (info=3D0x7ffffffe87e0) at
../../../../../src/gallium/drivers/nouveau/codegen/nv50_ir.cpp:1256
#11 0x0000000000402e33 in nouveau_codegen (chipset=3D230, type=3D1,
tokens=3D0x7fffffff9420, size=3D0x7ffffffe941c, code=3D0x7ffffffe9410) at
../../../../../src/gallium/drivers/nouveau/nouveau_compiler.c:126
#12 0x0000000000403210 in main (argc=3D4, argv=3D0x7fffffffd528) at
../../../../../src/gallium/drivers/nouveau/nouveau_compiler.c:206

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--14971175730.019cA6Bfd.30504
Date: Sat, 10 Jun 2017 17:59:33 +0000
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
   title=3D"NEW - GlobalCSE Pass moves phi instructions"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101371">101371</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>GlobalCSE Pass moves phi instructions
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
          <td>karolherbst&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D131843=
" name=3D"attach_131843" title=3D"frag.tgsi">attachment 131843</a> <a href=
=3D"attachment.cgi?id=3D131843&amp;action=3Dedit" title=3D"frag.tgsi">[deta=
ils]</a></span>
frag.tgsi

In the game &quot;Renowned Explorers: International Society&quot; an assert=
ion was hit
within codegen, because GlobalCSE wanted to move a phi instruction after a =
join
instruction, which is illegal.

backtrace:
#0  __GI_raise (sig=3Dsig&#64;entry=3D6) at ../sysdeps/unix/sysv/linux/rais=
e.c:58
#1  0x00007ffff676d54a in __GI_abort () at abort.c:89
#2  0x00007ffff6764eb7 in __assert_fail_base (fmt=3D&lt;optimized out&gt;,
assertion=3Dassertion&#64;entry=3D0x52ca18 &quot;q-&gt;op !=3D OP_PHI || p-=
&gt;op =3D=3D OP_PHI&quot;,
file=3Dfile&#64;entry=3D0x52c968
&quot;../../../../../src/gallium/drivers/nouveau/codegen/nv50_ir_bb.cpp&quo=
t;,=20
    line=3Dline&#64;entry=3D219,=20
    function=3Dfunction&#64;entry=3D0x52ce80
&lt;nv50_ir::BasicBlock::insertAfter(nv50_ir::Instruction*,
nv50_ir::Instruction*)::__PRETTY_FUNCTION__&gt; &quot;void
nv50_ir::BasicBlock::insertAfter(nv50_ir::Instruction*,
nv50_ir::Instruction*)&quot;)
    at assert.c:92
#3  0x00007ffff6764f62 in __GI___assert_fail (assertion=3D0x52ca18 &quot;q-=
&gt;op !=3D
OP_PHI || p-&gt;op =3D=3D OP_PHI&quot;, file=3D0x52c968
&quot;../../../../../src/gallium/drivers/nouveau/codegen/nv50_ir_bb.cpp&quo=
t;, line=3D219,=20
    function=3D0x52ce80 &lt;nv50_ir::BasicBlock::insertAfter(nv50_ir::Instr=
uction*,
nv50_ir::Instruction*)::__PRETTY_FUNCTION__&gt; &quot;void
nv50_ir::BasicBlock::insertAfter(nv50_ir::Instruction*,
nv50_ir::Instruction*)&quot;) at assert.c:101
#4  0x000000000041f0a0 in nv50_ir::BasicBlock::insertAfter (this=3D0x82fd10,
p=3D0x818ca0, q=3D0x81d0c0) at
../../../../../src/gallium/drivers/nouveau/codegen/nv50_ir_bb.cpp:219
#5  0x00000000004554c0 in nv50_ir::GlobalCSE::visit (this=3D0x7ffffffe7b70,
bb=3D0x82fd10) at
../../../../../src/gallium/drivers/nouveau/codegen/nv50_ir_peephole.cpp:3466
#6  0x00000000004200fd in nv50_ir::Pass::doRun (this=3D0x7ffffffe7b70,
func=3D0x7bc1a0, ordered=3Dfalse, skipPhi=3Dfalse) at
../../../../../src/gallium/drivers/nouveau/codegen/nv50_ir_bb.cpp:495
#7  0x000000000041ff05 in nv50_ir::Pass::doRun (this=3D0x7ffffffe7b70,
prog=3D0x7bc000, ordered=3Dfalse, skipPhi=3Dfalse) at
../../../../../src/gallium/drivers/nouveau/codegen/nv50_ir_bb.cpp:466
#8  0x000000000041fe60 in nv50_ir::Pass::run (this=3D0x7ffffffe7b70,
prog=3D0x7bc000, ordered=3Dfalse, skipPhi=3Dfalse) at
../../../../../src/gallium/drivers/nouveau/codegen/nv50_ir_bb.cpp:457
#9  0x00000000004561ed in nv50_ir::Program::optimizeSSA (this=3D0x7bc000,
level=3D3) at
../../../../../src/gallium/drivers/nouveau/codegen/nv50_ir_peephole.cpp:3725
#10 0x0000000000416adf in nv50_ir_generate_code (info=3D0x7ffffffe87e0) at
../../../../../src/gallium/drivers/nouveau/codegen/nv50_ir.cpp:1256
#11 0x0000000000402e33 in nouveau_codegen (chipset=3D230, type=3D1,
tokens=3D0x7fffffff9420, size=3D0x7ffffffe941c, code=3D0x7ffffffe9410) at
../../../../../src/gallium/drivers/nouveau/nouveau_compiler.c:126
#12 0x0000000000403210 in main (argc=3D4, argv=3D0x7fffffffd528) at
../../../../../src/gallium/drivers/nouveau/nouveau_compiler.c:206</pre>
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

--14971175730.019cA6Bfd.30504--

--===============2028932009==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============2028932009==--
