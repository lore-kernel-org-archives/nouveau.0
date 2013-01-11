From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 59242] New: some mesa demos start to segfault after
 "nouveau: improve buffer transfers" on nv43
Date: Fri, 11 Jan 2013 14:45:05 +0000
Message-ID: <bug-59242-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0461473222=="
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


--===============0461473222==
Content-Type: multipart/alternative; boundary="1357915505.c6FF0.15231"; charset="us-ascii"


--1357915505.c6FF0.15231
Date: Fri, 11 Jan 2013 14:45:05 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D59242

          Priority: medium
            Bug ID: 59242
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: some  mesa demos start  to segfault  after "nouveau:
                    improve buffer transfers" on nv43
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: randrik-JGs/UdohzUI@public.gmane.org
          Hardware: x86 (IA32)
            Status: NEW
           Version: git
         Component: Drivers/DRI/nouveau
           Product: Mesa

teapot, ray, dinoshade - all started  to segfault. Reverting mesa  commit
48a45ec24ae74c00d1487552e94d9f824a428f58 restores all demos back to working
state.

bt full:

bash-4.2$ gdb ./dinoshade
GNU gdb (GDB) 7.5
Copyright (C) 2012 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.htm=
l>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.  Type "show copying"
and "show warranty" for details.
This GDB was configured as "i486-slackware-linux".
For bug reporting instructions, please see:
<http://www.gnu.org/software/gdb/bugs/>...
Reading symbols from /mnt/tmp/mesa-demos-8.0.1/src/demos/dinoshade...done.
(gdb) run
Starting program: /mnt/tmp/mesa-demos-8.0.1/src/demos/dinoshade
warning: Could not load shared library symbols for linux-gate.so.1.
Do you need "set solib-search-path" or "set sysroot"?
[Thread debugging using libthread_db enabled]
Using host libthread_db library "/lib/libthread_db.so.1".

Program received signal SIGSEGV, Segmentation fault.
0x00000000 in ?? ()
(gdb) bt full
#0  0x00000000 in ?? ()
No symbol table info available.
#1  0xb6785c26 in nouveau_transfer_write (nv=3Dnv@entry=3D0x805cc70,
tx=3Dtx@entry=3D0x82fece0, offset=3Doffset@entry=3D0, size=3D128) at nouvea=
u_buffer.c:185
        buf =3D 0x8294668
        data =3D 0x8309740 "\002=D1=9B"
        base =3D 0
        can_cb =3D 1 '\001'
#2  0xb67860a7 in nouveau_buffer_transfer_unmap (pipe=3D0x805cc70,
transfer=3D0x82fece0) at nouveau_buffer.c:413
        buf =3D 0x8294668
#3  0xb69a2c8a in u_transfer_unmap_vtbl (pipe=3D0x805cc70, transfer=3D0x82f=
ece0) at
util/u_resource.c:51
No locals.
#4  0xb66c390d in pipe_buffer_unmap (transfer=3D<optimized out>, pipe=3D0x8=
05cc70)
at ../../../../src/gallium/auxiliary/util/u_inlines.h:290
No locals.
#5  nv30_fragprog_upload (nv30=3D0x805cc70) at nv30_fragprog.c:54
        nv =3D 0x805cc70
        fp =3D 0x829f968
        pipe =3D 0x805cc70
        transfer =3D 0x82fece0
        map =3D 0x805cc70
#6  nv30_fragprog_validate (nv30=3D0x805cc70) at nv30_fragprog.c:96
        push =3D 0x8078938
        eng3d =3D 0x808d2d8
        fp =3D 0x829f968
        upload =3D <optimized out>
        i =3D <optimized out>
#7  0xb66e3e65 in nv30_state_validate (nv30=3Dnv30@entry=3D0x805cc70,
hwtnl=3Dhwtnl@entry=3D1 '\001') at nv30_state_validate.c:487
        screen =3D 0x8078800
        push =3D 0x8078938
        bctx =3D 0x805d340
        bref =3D <optimized out>
        validate =3D 0xb76a9d78 <hwtnl_validate_list+88>
#8  0xb66c629e in nv30_draw_vbo (pipe=3D0x805cc70, info=3D0xbfffef10) at
nv30_vbo.c:563
        push =3D 0x8078938
#9  0xb69a4fb3 in u_vbuf_draw_vbo (mgr=3D0x81144e8, info=3Dinfo@entry=3D0xb=
fffef10)
at util/u_vbuf.c:1128
        pipe =3D 0x805cc70
        start_vertex =3D <optimized out>
        min_index =3D <optimized out>
        num_vertices =3D <optimized out>
        unroll_indices =3D 0 '\000'
        used_vb_mask =3D <optimized out>
        user_vb_mask =3D 0
        incompatible_vb_mask =3D 0
#10 0xb6951e8a in cso_draw_vbo (cso=3D0x8113d30, info=3Dinfo@entry=3D0xbfff=
ef10) at
cso_cache/cso_context.c:1344
        vbuf =3D <optimized out>
#11 0xb683a026 in st_draw_vbo (ctx=3D0x80bf6c0, prims=3D0x8100238, nr_prims=
=3D1,
ib=3D0x0, index_bounds_valid=3D1 '\001', min_index=3D0, max_index=3D3,
    tfb_vertcount=3D0x0) at ../../src/mesa/state_tracker/st_draw.c:265
        st =3D 0x80fe798
        ibuffer =3D {index_size =3D 0, offset =3D 0, buffer =3D 0x0, user_b=
uffer =3D 0x0}
        info =3D {indexed =3D 0 '\000', mode =3D 7, start =3D 0, count =3D =
4,
start_instance =3D 0, instance_count =3D 1, index_bias =3D 0, min_index =3D=
 0,
max_index =3D 3,
          primitive_restart =3D 0 '\000', restart_index =3D 0,
count_from_stream_output =3D 0x0}
        arrays =3D <optimized out>
        i =3D <optimized out>
#12 0xb68d9db2 in vbo_exec_vtx_flush (exec=3Dexec@entry=3D0x80ffdec, keepUn=
mapped=3D1
'\001') at ../../src/mesa/vbo/vbo_exec_draw.c:400
        ctx =3D 0x80bf6c0
---Type <return> to continue, or q <return> to quit---
#13 0xb68cb0d2 in vbo_exec_FlushVertices_internal (exec=3D0x80ffdec,
unmap=3D<optimized out>) at ../../src/mesa/vbo/vbo_exec_api.c:551
No locals.
#14 0xb68d747f in vbo_exec_FlushVertices (ctx=3D0x80bf6c0, flags=3D1) at
../../src/mesa/vbo/vbo_exec_api.c:1245
        exec =3D <optimized out>
#15 0xb688eef5 in enable_texture (ctx=3Dctx@entry=3D0x80bf6c0, state=3D<opt=
imized
out>, texBit=3DtexBit@entry=3D256) at ../../src/mesa/main/enable.c:218
        newenabled =3D 0
#16 0xb6890100 in _mesa_set_enable (ctx=3D0x80bf6c0, cap=3Dcap@entry=3D3553,
state=3Dstate@entry=3D0 '\000') at ../../src/mesa/main/enable.c:678
No locals.
#17 0xb6891458 in _mesa_Disable (cap=3D3553) at ../../src/mesa/main/enable.=
c:1031
        ctx =3D <optimized out>
#18 0x0804a792 in drawFloor () at dinoshade.c:373
No locals.
#19 0x0804add6 in redraw () at dinoshade.c:489
        start =3D 0
#20 0xb7eced34 in ?? () from /usr/lib/libglut.so.3
No symbol table info available.
#21 0xb7ed27ff in fgEnumWindows () from /usr/lib/libglut.so.3
No symbol table info available.
#22 0xb7ecf20e in glutMainLoopEvent () from /usr/lib/libglut.so.3
No symbol table info available.
#23 0xb7ecfa57 in glutMainLoop () from /usr/lib/libglut.so.3
No symbol table info available.
#24 0x08049e0c in main (argc=3D1, argv=3D0xbffff464) at dinoshade.c:912
        i =3D <optimized out>
(gdb) quit
A debugging session is active.

        Inferior 1 [process 2963] will be killed.

Quit anyway? (y or n) y
-----------------

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1357915505.c6FF0.15231
Date: Fri, 11 Jan 2013 14:45:05 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/" />
    </head>
    <body><table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Bug ID</th>
          <td><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW --- - some mesa demos start to segfault after &quot;nouveau=
: improve buffer transfers&quot; on nv43"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D59242">59242</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>some  mesa demos start  to segfault  after &quot;nouveau: imp=
rove buffer transfers&quot; on nv43
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>normal
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
          <td>randrik&#64;mail.ru
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86 (IA32)
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
        <pre>teapot, ray, dinoshade - all started  to segfault. Reverting m=
esa  commit
48a45ec24ae74c00d1487552e94d9f824a428f58 restores all demos back to working
state.

bt full:

bash-4.2$ gdb ./dinoshade
GNU gdb (GDB) 7.5
Copyright (C) 2012 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later &lt;<a href=3D"http://gnu.org/li=
censes/gpl.html">http://gnu.org/licenses/gpl.html</a>&gt;
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.  Type &quot;show copy=
ing&quot;
and &quot;show warranty&quot; for details.
This GDB was configured as &quot;i486-slackware-linux&quot;.
For bug reporting instructions, please see:
&lt;<a href=3D"http://www.gnu.org/software/gdb/bugs/">http://www.gnu.org/so=
ftware/gdb/bugs/</a>&gt;...
Reading symbols from /mnt/tmp/mesa-demos-8.0.1/src/demos/dinoshade...done.
(gdb) run
Starting program: /mnt/tmp/mesa-demos-8.0.1/src/demos/dinoshade
warning: Could not load shared library symbols for linux-gate.so.1.
Do you need &quot;set solib-search-path&quot; or &quot;set sysroot&quot;?
[Thread debugging using libthread_db enabled]
Using host libthread_db library &quot;/lib/libthread_db.so.1&quot;.

Program received signal SIGSEGV, Segmentation fault.
0x00000000 in ?? ()
(gdb) bt full
#0  0x00000000 in ?? ()
No symbol table info available.
#1  0xb6785c26 in nouveau_transfer_write (nv=3Dnv&#64;entry=3D0x805cc70,
tx=3Dtx&#64;entry=3D0x82fece0, offset=3Doffset&#64;entry=3D0, size=3D128) a=
t nouveau_buffer.c:185
        buf =3D 0x8294668
        data =3D 0x8309740 &quot;\002=D1=9B&quot;
        base =3D 0
        can_cb =3D 1 '\001'
#2  0xb67860a7 in nouveau_buffer_transfer_unmap (pipe=3D0x805cc70,
transfer=3D0x82fece0) at nouveau_buffer.c:413
        buf =3D 0x8294668
#3  0xb69a2c8a in u_transfer_unmap_vtbl (pipe=3D0x805cc70, transfer=3D0x82f=
ece0) at
util/u_resource.c:51
No locals.
#4  0xb66c390d in pipe_buffer_unmap (transfer=3D&lt;optimized out&gt;, pipe=
=3D0x805cc70)
at ../../../../src/gallium/auxiliary/util/u_inlines.h:290
No locals.
#5  nv30_fragprog_upload (nv30=3D0x805cc70) at nv30_fragprog.c:54
        nv =3D 0x805cc70
        fp =3D 0x829f968
        pipe =3D 0x805cc70
        transfer =3D 0x82fece0
        map =3D 0x805cc70
#6  nv30_fragprog_validate (nv30=3D0x805cc70) at nv30_fragprog.c:96
        push =3D 0x8078938
        eng3d =3D 0x808d2d8
        fp =3D 0x829f968
        upload =3D &lt;optimized out&gt;
        i =3D &lt;optimized out&gt;
#7  0xb66e3e65 in nv30_state_validate (nv30=3Dnv30&#64;entry=3D0x805cc70,
hwtnl=3Dhwtnl&#64;entry=3D1 '\001') at nv30_state_validate.c:487
        screen =3D 0x8078800
        push =3D 0x8078938
        bctx =3D 0x805d340
        bref =3D &lt;optimized out&gt;
        validate =3D 0xb76a9d78 &lt;hwtnl_validate_list+88&gt;
#8  0xb66c629e in nv30_draw_vbo (pipe=3D0x805cc70, info=3D0xbfffef10) at
nv30_vbo.c:563
        push =3D 0x8078938
#9  0xb69a4fb3 in u_vbuf_draw_vbo (mgr=3D0x81144e8, info=3Dinfo&#64;entry=
=3D0xbfffef10)
at util/u_vbuf.c:1128
        pipe =3D 0x805cc70
        start_vertex =3D &lt;optimized out&gt;
        min_index =3D &lt;optimized out&gt;
        num_vertices =3D &lt;optimized out&gt;
        unroll_indices =3D 0 '\000'
        used_vb_mask =3D &lt;optimized out&gt;
        user_vb_mask =3D 0
        incompatible_vb_mask =3D 0
#10 0xb6951e8a in cso_draw_vbo (cso=3D0x8113d30, info=3Dinfo&#64;entry=3D0x=
bfffef10) at
cso_cache/cso_context.c:1344
        vbuf =3D &lt;optimized out&gt;
#11 0xb683a026 in st_draw_vbo (ctx=3D0x80bf6c0, prims=3D0x8100238, nr_prims=
=3D1,
ib=3D0x0, index_bounds_valid=3D1 '\001', min_index=3D0, max_index=3D3,
    tfb_vertcount=3D0x0) at ../../src/mesa/state_tracker/st_draw.c:265
        st =3D 0x80fe798
        ibuffer =3D {index_size =3D 0, offset =3D 0, buffer =3D 0x0, user_b=
uffer =3D 0x0}
        info =3D {indexed =3D 0 '\000', mode =3D 7, start =3D 0, count =3D =
4,
start_instance =3D 0, instance_count =3D 1, index_bias =3D 0, min_index =3D=
 0,
max_index =3D 3,
          primitive_restart =3D 0 '\000', restart_index =3D 0,
count_from_stream_output =3D 0x0}
        arrays =3D &lt;optimized out&gt;
        i =3D &lt;optimized out&gt;
#12 0xb68d9db2 in vbo_exec_vtx_flush (exec=3Dexec&#64;entry=3D0x80ffdec, ke=
epUnmapped=3D1
'\001') at ../../src/mesa/vbo/vbo_exec_draw.c:400
        ctx =3D 0x80bf6c0
---Type &lt;return&gt; to continue, or q &lt;return&gt; to quit---
#13 0xb68cb0d2 in vbo_exec_FlushVertices_internal (exec=3D0x80ffdec,
unmap=3D&lt;optimized out&gt;) at ../../src/mesa/vbo/vbo_exec_api.c:551
No locals.
#14 0xb68d747f in vbo_exec_FlushVertices (ctx=3D0x80bf6c0, flags=3D1) at
../../src/mesa/vbo/vbo_exec_api.c:1245
        exec =3D &lt;optimized out&gt;
#15 0xb688eef5 in enable_texture (ctx=3Dctx&#64;entry=3D0x80bf6c0, state=3D=
&lt;optimized
out&gt;, texBit=3DtexBit&#64;entry=3D256) at ../../src/mesa/main/enable.c:2=
18
        newenabled =3D 0
#16 0xb6890100 in _mesa_set_enable (ctx=3D0x80bf6c0, cap=3Dcap&#64;entry=3D=
3553,
state=3Dstate&#64;entry=3D0 '\000') at ../../src/mesa/main/enable.c:678
No locals.
#17 0xb6891458 in _mesa_Disable (cap=3D3553) at ../../src/mesa/main/enable.=
c:1031
        ctx =3D &lt;optimized out&gt;
#18 0x0804a792 in drawFloor () at dinoshade.c:373
No locals.
#19 0x0804add6 in redraw () at dinoshade.c:489
        start =3D 0
#20 0xb7eced34 in ?? () from /usr/lib/libglut.so.3
No symbol table info available.
#21 0xb7ed27ff in fgEnumWindows () from /usr/lib/libglut.so.3
No symbol table info available.
#22 0xb7ecf20e in glutMainLoopEvent () from /usr/lib/libglut.so.3
No symbol table info available.
#23 0xb7ecfa57 in glutMainLoop () from /usr/lib/libglut.so.3
No symbol table info available.
#24 0x08049e0c in main (argc=3D1, argv=3D0xbffff464) at dinoshade.c:912
        i =3D &lt;optimized out&gt;
(gdb) quit
A debugging session is active.

        Inferior 1 [process 2963] will be killed.

Quit anyway? (y or n) y
-----------------</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
=20=20=20=20=20=20
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1357915505.c6FF0.15231--

--===============0461473222==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0461473222==--
