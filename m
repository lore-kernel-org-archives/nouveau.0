From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 105382] New: segfault in nouveau_scratch_data when
 using 2 nouveau cards
Date: Wed, 07 Mar 2018 14:39:40 +0000
Message-ID: <bug-105382-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0720122362=="
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


--===============0720122362==
Content-Type: multipart/alternative; boundary="15204335800.cEe1.8966"
Content-Transfer-Encoding: 7bit


--15204335800.cEe1.8966
Date: Wed, 7 Mar 2018 14:39:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D105382

            Bug ID: 105382
           Summary: segfault in nouveau_scratch_data  when using 2 nouveau
                    cards
           Product: Mesa
           Version: 17.0
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: vliaskovitis-IBi9RG/b67k@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

Using:

Mesa-dri-nouveau 17.0.5
kernel 4.15.0
gnome-shell 3.20

with 2 dri-cards (one monitor attached to each card)

03:00.0 VGA compatible controller: NVIDIA Corporation GM107GL [Quadro K620]
(rev a2)
0b:00.0 VGA compatible controller: NVIDIA Corporation GK208 [GeForce GT 710]
(rev a1)

I am not sure if this is expected to work. I think these cards use a differ=
ent
mesa driver (nv108 vs nv117), so should they work seamlessly together?

Mesa segfaults very often with:

(gdb) bt
#0  0x00007f5bf2c37af5 in __memcpy_avx_unaligned () at
../sysdeps/x86_64/multiarch/memcpy-avx-unaligned.S:114
#1  0x00007f5be066d28d in memcpy (__len=3D48, __src=3D<optimized out>,
__dest=3D<optimized out>) at /usr/include/bits/string3.h:53
#2  0x00007f5be066d28d in nouveau_scratch_data (nv=3Dnv@entry=3D0x1dc0800,
data=3D<optimized out>, base=3Dbase@entry=3D0, size=3Dsize@entry=3D48,
bo=3Dbo@entry=3D0x7ffc23880868) at nouveau_buffer.c:1004
#3  0x00007f5be078bba9 in nvc0_update_user_vbufs_shared (nvc0=3D0x1dc0800) =
at
nvc0/nvc0_vbo.c:292
#4  0x00007f5be078121d in nvc0_state_validate (nvc0=3Dnvc0@entry=3D0x1dc080=
0,
mask=3Dmask@entry=3D4294967295, validate_list=3Dvalidate_list@entry=3D0x7f5=
be0d78fe0
<validate_list_3d>, size=3Dsize@entry=3D33, dirty=3Ddirty@entry=3D0x1dc0c10,
bufctx=3D0x1dc3fc0) at nvc0/nvc0_state_validate.c:902
#5  0x00007f5be07813f7 in nvc0_state_validate_3d (nvc0=3Dnvc0@entry=3D0x1dc=
0800,
mask=3Dmask@entry=3D4294967295) at nvc0/nvc0_state_validate.c:920
#6  0x00007f5be078cb57 in nvc0_draw_vbo (pipe=3D0x1dc0800, info=3D<optimize=
d out>)
at nvc0/nvc0_vbo.c:977
#7  0x00007f5be0554dc4 in cso_draw_arrays (cso=3D<optimized out>,
mode=3Dmode@entry=3D6, start=3Dstart@entry=3D0, count=3Dcount@entry=3D4) at
cso_cache/cso_context.c:1745
#8  0x00007f5be03c8a21 in st_draw_quad (st=3Dst@entry=3D0x1e8c340, x0=3Dx0@=
entry=3D-1,
y0=3Dy0@entry=3D-1, x1=3Dx1@entry=3D0.00885415077, y1=3Dy1@entry=3D1, z=3D1=
, s0=3Ds0@entry=3D0,
t0=3Dt0@entry=3D0, s1=3Ds1@entry=3D0, t1=3Dt1@entry=3D0, color=3Dcolor@entr=
y=3D0x1dc781c,
num_instances=3Dnum_instances@entry=3D1) at state_tracker/st_draw.c:489
#9  0x00007f5be03b2087 in clear_with_quad (clear_buffers=3D<optimized out>,
ctx=3D0x1dc5d60) at state_tracker/st_cb_clear.c:297
#10 0x00007f5be03b2087 in st_Clear (ctx=3D0x1dc5d60, mask=3D16) at
state_tracker/st_cb_clear.c:475
#11 0x00007f5bf0310811 in _cogl_framebuffer_gl_clear (framebuffer=3D0x1ee30=
00,
buffers=3D<optimized out>, red=3D<optimized out>, green=3D<optimized out>,
blue=3D<optimized out>, alpha=3D<optimized out>)
    at driver/gl/cogl-framebuffer-gl.c:1022
#12 0x00007f5bf0355fe2 in cogl_framebuffer_clear4f (framebuffer=3D0x1ee3000,
buffers=3D2, red=3D1, green=3D1, green@entry=3D0, blue=3D1, blue@entry=3D1.=
40129846e-45,
alpha=3D1, alpha@entry=3D0) at cogl-framebuffer.c:388
#13 0x00007f5bf03561f8 in cogl_framebuffer_clear (framebuffer=3D<optimized =
out>,
buffers=3D<optimized out>, color=3D<optimized out>) at cogl-framebuffer.c:4=
57
#14 0x00007f5bf3e5f694 in clutter_root_node_pre_draw (node=3D<optimized out=
>) at
clutter-paint-nodes.c:116
#15 0x00007f5bf3e61d64 in _clutter_paint_node_paint (node=3D0x3988720
[ClutterRootNode]) at clutter-paint-node.c:955
#16 0x00007f5bf3e61d80 in _clutter_paint_node_paint (node=3D0x7f5b8cf3e300
[ClutterDummyNode]) at clutter-paint-node.c:966
#17 0x00007f5bf3e1a2a9 in clutter_actor_paint_node (root=3D0x7f5b8cf3e300
[ClutterDummyNode], actor=3D0x1edff80 [MetaStage]) at clutter-actor.c:3725
#18 0x00007f5bf3e1a2a9 in clutter_actor_continue_paint
(self=3Dself@entry=3D0x1edff80 [MetaStage]) at clutter-actor.c:4014
#19 0x00007f5bf3e1fcf4 in clutter_actor_paint (self=3Dself@entry=3D0x1edff80
[MetaStage]) at clutter-actor.c:3938
#20 0x00007f5bf3e75384 in _clutter_stage_do_paint (stage=3Dstage@entry=3D0x=
1edff80
[MetaStage], clip=3Dclip@entry=3D0x1ee2104) at clutter-stage.c:687
#21 0x00007f5bf3e0f7bf in clutter_stage_cogl_redraw (stage_window=3D0x1ee20=
b0) at
cogl/clutter-stage-cogl.c:531
#22 0x00007f5bf3e73c97 in clutter_stage_do_redraw (stage=3D0x1edff80 [MetaS=
tage])
at clutter-stage.c:1130
#23 0x00007f5bf3e73c97 in _clutter_stage_do_update (stage=3D0x1edff80
[MetaStage]) at clutter-stage.c:1186
#24 0x00007f5bf3e5d818 in master_clock_update_stages (master_clock=3D0x235b=
d00
[ClutterMasterClockDefault], stages=3D0x7f5b78001360 =3D {...}) at
clutter-master-clock-default.c:443
#25 0x00007f5bf3e5d818 in clutter_clock_dispatch (source=3D<optimized out>,
callback=3D<optimized out>, user_data=3D<optimized out>) at
clutter-master-clock-default.c:567
#26 0x00007f5bf3119134 in g_main_dispatch (context=3D0x1d99ad0) at gmain.c:=
3154
#27 0x00007f5bf3119134 in g_main_context_dispatch
(context=3Dcontext@entry=3D0x1d99ad0) at gmain.c:3769
#28 0x00007f5bf3119388 in g_main_context_iterate (context=3D0x1d99ad0,
block=3Dblock@entry=3D1, dispatch=3Ddispatch@entry=3D1, self=3D<optimized o=
ut>) at
gmain.c:3840
#29 0x00007f5bf311964a in g_main_loop_run (loop=3D0x1da05e0) at gmain.c:4034
#30 0x00007f5bf4a63d3c in meta_run () at core/main.c:537
#31 0x0000000000402367 in main (argc=3D1, argv=3D0x7ffc238812c8) at main.c:=
471


I 'll try to have a test that can cause the crash outside of gnome.

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--15204335800.cEe1.8966
Date: Wed, 7 Mar 2018 14:39:40 +0000
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
   title=3D"NEW - segfault in nouveau_scratch_data when using 2 nouveau car=
ds"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105382">105382</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>segfault in nouveau_scratch_data  when using 2 nouveau cards
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>17.0
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
          <td>vliaskovitis&#64;suse.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Using:

Mesa-dri-nouveau 17.0.5
kernel 4.15.0
gnome-shell 3.20

with 2 dri-cards (one monitor attached to each card)

03:00.0 VGA compatible controller: NVIDIA Corporation GM107GL [Quadro K620]
(rev a2)
0b:00.0 VGA compatible controller: NVIDIA Corporation GK208 [GeForce GT 710]
(rev a1)

I am not sure if this is expected to work. I think these cards use a differ=
ent
mesa driver (nv108 vs nv117), so should they work seamlessly together?

Mesa segfaults very often with:

(gdb) bt
#0  0x00007f5bf2c37af5 in __memcpy_avx_unaligned () at
../sysdeps/x86_64/multiarch/memcpy-avx-unaligned.S:114
#1  0x00007f5be066d28d in memcpy (__len=3D48, __src=3D&lt;optimized out&gt;,
__dest=3D&lt;optimized out&gt;) at /usr/include/bits/string3.h:53
#2  0x00007f5be066d28d in nouveau_scratch_data (nv=3Dnv&#64;entry=3D0x1dc08=
00,
data=3D&lt;optimized out&gt;, base=3Dbase&#64;entry=3D0, size=3Dsize&#64;en=
try=3D48,
bo=3Dbo&#64;entry=3D0x7ffc23880868) at nouveau_buffer.c:1004
#3  0x00007f5be078bba9 in nvc0_update_user_vbufs_shared (nvc0=3D0x1dc0800) =
at
nvc0/nvc0_vbo.c:292
#4  0x00007f5be078121d in nvc0_state_validate (nvc0=3Dnvc0&#64;entry=3D0x1d=
c0800,
mask=3Dmask&#64;entry=3D4294967295, validate_list=3Dvalidate_list&#64;entry=
=3D0x7f5be0d78fe0
&lt;validate_list_3d&gt;, size=3Dsize&#64;entry=3D33, dirty=3Ddirty&#64;ent=
ry=3D0x1dc0c10,
bufctx=3D0x1dc3fc0) at nvc0/nvc0_state_validate.c:902
#5  0x00007f5be07813f7 in nvc0_state_validate_3d (nvc0=3Dnvc0&#64;entry=3D0=
x1dc0800,
mask=3Dmask&#64;entry=3D4294967295) at nvc0/nvc0_state_validate.c:920
#6  0x00007f5be078cb57 in nvc0_draw_vbo (pipe=3D0x1dc0800, info=3D&lt;optim=
ized out&gt;)
at nvc0/nvc0_vbo.c:977
#7  0x00007f5be0554dc4 in cso_draw_arrays (cso=3D&lt;optimized out&gt;,
mode=3Dmode&#64;entry=3D6, start=3Dstart&#64;entry=3D0, count=3Dcount&#64;e=
ntry=3D4) at
cso_cache/cso_context.c:1745
#8  0x00007f5be03c8a21 in st_draw_quad (st=3Dst&#64;entry=3D0x1e8c340, x0=
=3Dx0&#64;entry=3D-1,
y0=3Dy0&#64;entry=3D-1, x1=3Dx1&#64;entry=3D0.00885415077, y1=3Dy1&#64;entr=
y=3D1, z=3D1, s0=3Ds0&#64;entry=3D0,
t0=3Dt0&#64;entry=3D0, s1=3Ds1&#64;entry=3D0, t1=3Dt1&#64;entry=3D0, color=
=3Dcolor&#64;entry=3D0x1dc781c,
num_instances=3Dnum_instances&#64;entry=3D1) at state_tracker/st_draw.c:489
#9  0x00007f5be03b2087 in clear_with_quad (clear_buffers=3D&lt;optimized ou=
t&gt;,
ctx=3D0x1dc5d60) at state_tracker/st_cb_clear.c:297
#10 0x00007f5be03b2087 in st_Clear (ctx=3D0x1dc5d60, mask=3D16) at
state_tracker/st_cb_clear.c:475
#11 0x00007f5bf0310811 in _cogl_framebuffer_gl_clear (framebuffer=3D0x1ee30=
00,
buffers=3D&lt;optimized out&gt;, red=3D&lt;optimized out&gt;, green=3D&lt;o=
ptimized out&gt;,
blue=3D&lt;optimized out&gt;, alpha=3D&lt;optimized out&gt;)
    at driver/gl/cogl-framebuffer-gl.c:1022
#12 0x00007f5bf0355fe2 in cogl_framebuffer_clear4f (framebuffer=3D0x1ee3000,
buffers=3D2, red=3D1, green=3D1, green&#64;entry=3D0, blue=3D1, blue&#64;en=
try=3D1.40129846e-45,
alpha=3D1, alpha&#64;entry=3D0) at cogl-framebuffer.c:388
#13 0x00007f5bf03561f8 in cogl_framebuffer_clear (framebuffer=3D&lt;optimiz=
ed out&gt;,
buffers=3D&lt;optimized out&gt;, color=3D&lt;optimized out&gt;) at cogl-fra=
mebuffer.c:457
#14 0x00007f5bf3e5f694 in clutter_root_node_pre_draw (node=3D&lt;optimized =
out&gt;) at
clutter-paint-nodes.c:116
#15 0x00007f5bf3e61d64 in _clutter_paint_node_paint (node=3D0x3988720
[ClutterRootNode]) at clutter-paint-node.c:955
#16 0x00007f5bf3e61d80 in _clutter_paint_node_paint (node=3D0x7f5b8cf3e300
[ClutterDummyNode]) at clutter-paint-node.c:966
#17 0x00007f5bf3e1a2a9 in clutter_actor_paint_node (root=3D0x7f5b8cf3e300
[ClutterDummyNode], actor=3D0x1edff80 [MetaStage]) at clutter-actor.c:3725
#18 0x00007f5bf3e1a2a9 in clutter_actor_continue_paint
(self=3Dself&#64;entry=3D0x1edff80 [MetaStage]) at clutter-actor.c:4014
#19 0x00007f5bf3e1fcf4 in clutter_actor_paint (self=3Dself&#64;entry=3D0x1e=
dff80
[MetaStage]) at clutter-actor.c:3938
#20 0x00007f5bf3e75384 in _clutter_stage_do_paint (stage=3Dstage&#64;entry=
=3D0x1edff80
[MetaStage], clip=3Dclip&#64;entry=3D0x1ee2104) at clutter-stage.c:687
#21 0x00007f5bf3e0f7bf in clutter_stage_cogl_redraw (stage_window=3D0x1ee20=
b0) at
cogl/clutter-stage-cogl.c:531
#22 0x00007f5bf3e73c97 in clutter_stage_do_redraw (stage=3D0x1edff80 [MetaS=
tage])
at clutter-stage.c:1130
#23 0x00007f5bf3e73c97 in _clutter_stage_do_update (stage=3D0x1edff80
[MetaStage]) at clutter-stage.c:1186
#24 0x00007f5bf3e5d818 in master_clock_update_stages (master_clock=3D0x235b=
d00
[ClutterMasterClockDefault], stages=3D0x7f5b78001360 =3D {...}) at
clutter-master-clock-default.c:443
#25 0x00007f5bf3e5d818 in clutter_clock_dispatch (source=3D&lt;optimized ou=
t&gt;,
callback=3D&lt;optimized out&gt;, user_data=3D&lt;optimized out&gt;) at
clutter-master-clock-default.c:567
#26 0x00007f5bf3119134 in g_main_dispatch (context=3D0x1d99ad0) at gmain.c:=
3154
#27 0x00007f5bf3119134 in g_main_context_dispatch
(context=3Dcontext&#64;entry=3D0x1d99ad0) at gmain.c:3769
#28 0x00007f5bf3119388 in g_main_context_iterate (context=3D0x1d99ad0,
block=3Dblock&#64;entry=3D1, dispatch=3Ddispatch&#64;entry=3D1, self=3D&lt;=
optimized out&gt;) at
gmain.c:3840
#29 0x00007f5bf311964a in g_main_loop_run (loop=3D0x1da05e0) at gmain.c:4034
#30 0x00007f5bf4a63d3c in meta_run () at core/main.c:537
#31 0x0000000000402367 in main (argc=3D1, argv=3D0x7ffc238812c8) at main.c:=
471


I 'll try to have a test that can cause the crash outside of gnome.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15204335800.cEe1.8966--

--===============0720122362==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0720122362==--
