From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 69155] New:
 codegen/nv50_ir_emit_nv50.cpp:169:srcAddr8: Assertion `(offset <= 0x1fc ||
 offset == 0x3fc) && !(offset & 0x3)' failed.
Date: Tue, 10 Sep 2013 00:45:15 +0000
Message-ID: <bug-69155-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0517267934=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0517267934==
Content-Type: multipart/alternative; boundary="1378773915.BCAbB0.5583"; charset="us-ascii"


--1378773915.BCAbB0.5583
Date: Tue, 10 Sep 2013 00:45:15 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=69155

          Priority: medium
            Bug ID: 69155
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: codegen/nv50_ir_emit_nv50.cpp:169:srcAddr8: Assertion
                    `(offset <= 0x1fc || offset == 0x3fc) && !(offset &
                    0x3)' failed.
          Severity: critical
    Classification: Unclassified
                OS: Linux (All)
          Reporter: vlee-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: git
         Component: Drivers/DRI/nouveau
           Product: Mesa

System environment: 
-- chipset: NVA8
-- system architecture: x86_64
-- xserver-xorg-video-nouveau: 1:1.0.7-0ubuntu1
-- mesa: 395b9410860371a64d6b5f2d50679f29eb41729e (master)
-- libdrm version: 2.4.43
-- kernel version: 3.8.0-30-generic
-- Linux distribution: Ubuntu 13.04 amd64

Run piglit test varying-packing-simple.

$ ./bin/varying-packing-simple float separate -auto
WARNING: out of code space, evicting all shaders.
nv50_program_upload_code:401 - shader too large (0xc40) to fit in code space ?
codegen/nv50_ir_emit_nv50.cpp:169:srcAddr8: Assertion `(offset <= 0x1fc ||
offset == 0x3fc) && !(offset & 0x3)' failed.
Trace/breakpoint trap (core dumped)

(gdb) bt
#0  0x00007f54bac25e1e in _debug_assert_fail (expr=0x7f54baf08560 "(offset <=
0x1fc || offset == 0x3fc) && !(offset & 0x3)", 
    file=0x7f54baf084c1 "codegen/nv50_ir_emit_nv50.cpp", line=169, 
    function=0x7f54baf09151
<nv50_ir::CodeEmitterNV50::srcAddr8(nv50_ir::ValueRef const&,
int)::__FUNCTION__> "srcAddr8") at util/u_debug.c:278
#1  0x00007f54bad5e420 in nv50_ir::CodeEmitterNV50::srcAddr8 (this=0x1f94360,
src=..., pos=16) at codegen/nv50_ir_emit_nv50.cpp:169
#2  0x00007f54bad5995e in nv50_ir::CodeEmitterNV50::emitINTERP (this=0x1f94360,
i=0x1ece3f0) at codegen/nv50_ir_emit_nv50.cpp:814
#3  0x00007f54bad5cae9 in nv50_ir::CodeEmitterNV50::emitInstruction
(this=0x1f94360, insn=0x1ece3f0) at codegen/nv50_ir_emit_nv50.cpp:1625
#4  0x00007f54bad9d7a8 in nv50_ir::Program::emitBinary (this=0x1a82550,
info=0x1a9b4f0) at codegen/nv50_ir_target.cpp:374
#5  0x00007f54bad444e9 in nv50_ir_generate_code (info=0x1a9b4f0) at
codegen/nv50_ir.cpp:1212
#6  0x00007f54bad32a40 in nv50_program_translate (prog=0x1a7f800, chipset=168)
at nv50_program.c:341
#7  0x00007f54bad33865 in nv50_program_validate (nv50=0x1873350,
prog=0x1a7f800) at nv50_shader_state.c:115
#8  0x00007f54bad33b8c in nv50_fragprog_validate (nv50=0x1873350) at
nv50_shader_state.c:173
#9  0x00007f54bad24dfd in nv50_state_validate (nv50=0x1873350, mask=4294967295,
words=8) at nv50_state_validate.c:394
#10 0x00007f54bad31170 in nv50_draw_vbo (pipe=0x1873350, info=0x7fffb533a150)
at nv50_vbo.c:755
#11 0x00007f54babb2a0e in cso_draw_vbo (cso=0x18ec9d0, info=0x7fffb533a150) at
cso_cache/cso_context.c:1413
#12 0x00007f54baa97f9a in st_draw_vbo (ctx=0x7f54bf129010,
prims=0x7fffb533a210, nr_prims=1, ib=0x0, index_bounds_valid=1 '\001',
min_index=0, 
    max_index=3, tfb_vertcount=0x0) at
../../src/mesa/state_tracker/st_draw.c:286
#13 0x00007f54baa5419a in vbo_draw_arrays (ctx=0x7f54bf129010, mode=5, start=0,
count=4, numInstances=1, baseInstance=0)
    at ../../src/mesa/vbo/vbo_exec_array.c:660
#14 0x00007f54baa54beb in vbo_exec_DrawArrays (mode=5, start=0, count=4) at
../../src/mesa/vbo/vbo_exec_array.c:812
#15 0x00007f54bed3c4bc in stub_glDrawArrays (mode=5, first=0, count=4) at
piglit/tests/util/generated_dispatch.c:6223
#16 0x00007f54bed2b6b8 in piglit_draw_rect_from_arrays (verts=0x7fffb533a2f0,
tex=0x0)
    at piglit/tests/util/piglit-util-gl-common.c:645
#17 0x00007f54bed2ba36 in piglit_draw_rect (x=-1, y=-1, w=2, h=2) at
piglit/tests/util/piglit-util-gl-common.c:754
#18 0x0000000000401e39 in piglit_display () at
piglit/tests/spec/glsl-1.10/execution/varying-packing/simple.c:405
#19 0x00007f54bed2e018 in display () at
piglit/tests/util/piglit-framework-gl/piglit_glut_framework.c:60
#20 0x00007f54be4c8fc4 in fghRedrawWindow (window=0x1848140) at
freeglut_main.c:210
#21 fghcbDisplayWindow (window=0x1848140, enumerator=0x7fffb533a420) at
freeglut_main.c:227
#22 0x00007f54be4cc719 in fgEnumWindows
(enumCallback=enumCallback@entry=0x7f54be4c8f20 <fghcbDisplayWindow>, 
    enumerator=enumerator@entry=0x7fffb533a420) at freeglut_structure.c:394
#23 0x00007f54be4c945c in fghDisplayAll () at freeglut_main.c:249
#24 glutMainLoopEvent () at freeglut_main.c:1450
#25 0x00007f54be4c9d81 in glutMainLoop () at freeglut_main.c:1498
#26 0x00007f54bed2e247 in run_test (gl_fw=0x7f54bf01b320 <glut_fw>, argc=3,
argv=0x7fffb533a7d8)
    at piglit/tests/util/piglit-framework-gl/piglit_glut_framework.c:142
#27 0x00007f54bed2c189 in piglit_gl_test_run (argc=3, argv=0x7fffb533a7d8,
config=0x7fffb533a6c0)
    at piglit/tests/util/piglit-framework-gl.c:141
#28 0x0000000000401423 in main (argc=3, argv=0x7fffb533a7d8)
    at piglit/tests/spec/glsl-1.10/execution/varying-packing/simple.c:106
(gdb) frame 1
#1  0x00007f54bad5e420 in nv50_ir::CodeEmitterNV50::srcAddr8 (this=0x1f94360,
src=..., pos=16) at codegen/nv50_ir_emit_nv50.cpp:169
169       assert((offset <= 0x1fc || offset == 0x3fc) && !(offset & 0x3));
(gdb) print /x offset
$1 = 0x200

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1378773915.BCAbB0.5583
Date: Tue, 10 Sep 2013 00:45:15 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><table border="1" cellspacing="0" cellpadding="8">
        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Bug ID</th>
          <td><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - codegen/nv50_ir_emit_nv50.cpp:169:srcAddr8: Assertion `(offset &lt;= 0x1fc || offset == 0x3fc) &amp;&amp; !(offset &amp; 0x3)' failed."
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69155">69155</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>codegen/nv50_ir_emit_nv50.cpp:169:srcAddr8: Assertion `(offset &lt;= 0x1fc || offset == 0x3fc) &amp;&amp; !(offset &amp; 0x3)' failed.
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>critical
          </td>
        </tr>

        <tr>
          <th>Classification</th>
          <td>Unclassified
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>Linux (All)
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>vlee&#64;freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86-64 (AMD64)
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>git
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Drivers/DRI/nouveau
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr></table>
      <p>
        <div>
        <pre>System environment: 
-- chipset: NVA8
-- system architecture: x86_64
-- xserver-xorg-video-nouveau: 1:1.0.7-0ubuntu1
-- mesa: 395b9410860371a64d6b5f2d50679f29eb41729e (master)
-- libdrm version: 2.4.43
-- kernel version: 3.8.0-30-generic
-- Linux distribution: Ubuntu 13.04 amd64

Run piglit test varying-packing-simple.

$ ./bin/varying-packing-simple float separate -auto
WARNING: out of code space, evicting all shaders.
nv50_program_upload_code:401 - shader too large (0xc40) to fit in code space ?
codegen/nv50_ir_emit_nv50.cpp:169:srcAddr8: Assertion `(offset &lt;= 0x1fc ||
offset == 0x3fc) &amp;&amp; !(offset &amp; 0x3)' failed.
Trace/breakpoint trap (core dumped)

(gdb) bt
#0  0x00007f54bac25e1e in _debug_assert_fail (expr=0x7f54baf08560 &quot;(offset &lt;=
0x1fc || offset == 0x3fc) &amp;&amp; !(offset &amp; 0x3)&quot;, 
    file=0x7f54baf084c1 &quot;codegen/nv50_ir_emit_nv50.cpp&quot;, line=169, 
    function=0x7f54baf09151
&lt;nv50_ir::CodeEmitterNV50::srcAddr8(nv50_ir::ValueRef const&amp;,
int)::__FUNCTION__&gt; &quot;srcAddr8&quot;) at util/u_debug.c:278
#1  0x00007f54bad5e420 in nv50_ir::CodeEmitterNV50::srcAddr8 (this=0x1f94360,
src=..., pos=16) at codegen/nv50_ir_emit_nv50.cpp:169
#2  0x00007f54bad5995e in nv50_ir::CodeEmitterNV50::emitINTERP (this=0x1f94360,
i=0x1ece3f0) at codegen/nv50_ir_emit_nv50.cpp:814
#3  0x00007f54bad5cae9 in nv50_ir::CodeEmitterNV50::emitInstruction
(this=0x1f94360, insn=0x1ece3f0) at codegen/nv50_ir_emit_nv50.cpp:1625
#4  0x00007f54bad9d7a8 in nv50_ir::Program::emitBinary (this=0x1a82550,
info=0x1a9b4f0) at codegen/nv50_ir_target.cpp:374
#5  0x00007f54bad444e9 in nv50_ir_generate_code (info=0x1a9b4f0) at
codegen/nv50_ir.cpp:1212
#6  0x00007f54bad32a40 in nv50_program_translate (prog=0x1a7f800, chipset=168)
at nv50_program.c:341
#7  0x00007f54bad33865 in nv50_program_validate (nv50=0x1873350,
prog=0x1a7f800) at nv50_shader_state.c:115
#8  0x00007f54bad33b8c in nv50_fragprog_validate (nv50=0x1873350) at
nv50_shader_state.c:173
#9  0x00007f54bad24dfd in nv50_state_validate (nv50=0x1873350, mask=4294967295,
words=8) at nv50_state_validate.c:394
#10 0x00007f54bad31170 in nv50_draw_vbo (pipe=0x1873350, info=0x7fffb533a150)
at nv50_vbo.c:755
#11 0x00007f54babb2a0e in cso_draw_vbo (cso=0x18ec9d0, info=0x7fffb533a150) at
cso_cache/cso_context.c:1413
#12 0x00007f54baa97f9a in st_draw_vbo (ctx=0x7f54bf129010,
prims=0x7fffb533a210, nr_prims=1, ib=0x0, index_bounds_valid=1 '\001',
min_index=0, 
    max_index=3, tfb_vertcount=0x0) at
../../src/mesa/state_tracker/st_draw.c:286
#13 0x00007f54baa5419a in vbo_draw_arrays (ctx=0x7f54bf129010, mode=5, start=0,
count=4, numInstances=1, baseInstance=0)
    at ../../src/mesa/vbo/vbo_exec_array.c:660
#14 0x00007f54baa54beb in vbo_exec_DrawArrays (mode=5, start=0, count=4) at
../../src/mesa/vbo/vbo_exec_array.c:812
#15 0x00007f54bed3c4bc in stub_glDrawArrays (mode=5, first=0, count=4) at
piglit/tests/util/generated_dispatch.c:6223
#16 0x00007f54bed2b6b8 in piglit_draw_rect_from_arrays (verts=0x7fffb533a2f0,
tex=0x0)
    at piglit/tests/util/piglit-util-gl-common.c:645
#17 0x00007f54bed2ba36 in piglit_draw_rect (x=-1, y=-1, w=2, h=2) at
piglit/tests/util/piglit-util-gl-common.c:754
#18 0x0000000000401e39 in piglit_display () at
piglit/tests/spec/glsl-1.10/execution/varying-packing/simple.c:405
#19 0x00007f54bed2e018 in display () at
piglit/tests/util/piglit-framework-gl/piglit_glut_framework.c:60
#20 0x00007f54be4c8fc4 in fghRedrawWindow (window=0x1848140) at
freeglut_main.c:210
#21 fghcbDisplayWindow (window=0x1848140, enumerator=0x7fffb533a420) at
freeglut_main.c:227
#22 0x00007f54be4cc719 in fgEnumWindows
(enumCallback=enumCallback&#64;entry=0x7f54be4c8f20 &lt;fghcbDisplayWindow&gt;, 
    enumerator=enumerator&#64;entry=0x7fffb533a420) at freeglut_structure.c:394
#23 0x00007f54be4c945c in fghDisplayAll () at freeglut_main.c:249
#24 glutMainLoopEvent () at freeglut_main.c:1450
#25 0x00007f54be4c9d81 in glutMainLoop () at freeglut_main.c:1498
#26 0x00007f54bed2e247 in run_test (gl_fw=0x7f54bf01b320 &lt;glut_fw&gt;, argc=3,
argv=0x7fffb533a7d8)
    at piglit/tests/util/piglit-framework-gl/piglit_glut_framework.c:142
#27 0x00007f54bed2c189 in piglit_gl_test_run (argc=3, argv=0x7fffb533a7d8,
config=0x7fffb533a6c0)
    at piglit/tests/util/piglit-framework-gl.c:141
#28 0x0000000000401423 in main (argc=3, argv=0x7fffb533a7d8)
    at piglit/tests/spec/glsl-1.10/execution/varying-packing/simple.c:106
(gdb) frame 1
#1  0x00007f54bad5e420 in nv50_ir::CodeEmitterNV50::srcAddr8 (this=0x1f94360,
src=..., pos=16) at codegen/nv50_ir_emit_nv50.cpp:169
169       assert((offset &lt;= 0x1fc || offset == 0x3fc) &amp;&amp; !(offset &amp; 0x3));
(gdb) print /x offset
$1 = 0x200</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1378773915.BCAbB0.5583--

--===============0517267934==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0517267934==--
