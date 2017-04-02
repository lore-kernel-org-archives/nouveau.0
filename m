From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 99396] Crash in nouveau_dri.so when switching apps
 with alt-tab in Gnome
Date: Sun, 02 Apr 2017 16:35:13 +0000
Message-ID: <bug-99396-8800-1cKazZrOYi@http.bugs.freedesktop.org/>
References: <bug-99396-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0971124639=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-99396-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0971124639==
Content-Type: multipart/alternative; boundary="14911509131.c6DdBe2E.15119";
 charset="UTF-8"


--14911509131.c6DdBe2E.15119
Date: Sun, 2 Apr 2017 16:35:13 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D99396

--- Comment #6 from Tommi Rantala <tommi.t.rantala-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org> ---
I'm also seeing this crash regularly with HP ZBook 15 G3, that has NVIDIA G=
PU.
I'm using Fedora 25.

$ lspci|grep NVIDIA
01:00.0 VGA compatible controller: NVIDIA Corporation GM107GLM [Quadro M200=
0M]
(rev a2)

(gdb) bt
#0  0x00007f3f8905a513 in __memmove_avx_unaligned_erms () at
../sysdeps/x86_64/multiarch/memmove-vec-unaligned-erms.S:218
#1  0x00007f3f67656fa0 in memcpy (__len=3D48, __src=3D<optimized out>,
__dest=3D<optimized out>) at /usr/include/bits/string3.h:53
#2  0x00007f3f67656fa0 in nouveau_scratch_data (nv=3Dnv@entry=3D0x55eb41056=
660,
data=3D<optimized out>, base=3Dbase@entry=3D0, size=3Dsize@entry=3D48,
bo=3Dbo@entry=3D0x7ffc757da7f0) at nouveau_buffer.c:1006
#3  0x00007f3f6776fad8 in nvc0_update_user_vbufs_shared (nvc0=3D0x55eb41056=
660)
at nvc0/nvc0_vbo.c:292
#4  0x00007f3f67764e25 in nvc0_state_validate (nvc0=3Dnvc0@entry=3D0x55eb41=
056660,
mask=3Dmask@entry=3D4294967295, validate_list=3Dvalidate_list@entry=3D0x7f3=
f67e07020
<validate_list_3d>, size=3Dsize@entry=3D33, dirty=3Ddirty@entry=3D0x55eb410=
56a60,
bufctx=3D0x55eb4105a020) at nvc0/nvc0_state_validate.c:832
#5  0x00007f3f67765007 in nvc0_state_validate_3d
(nvc0=3Dnvc0@entry=3D0x55eb41056660, mask=3Dmask@entry=3D4294967295) at
nvc0/nvc0_state_validate.c:850
#6  0x00007f3f67770e94 in nvc0_draw_vbo (pipe=3D0x55eb41056660,
info=3D0x7ffc757da990) at nvc0/nvc0_vbo.c:977
#7  0x00007f3f674d3ed2 in cso_draw_arrays (cso=3Dcso@entry=3D0x55eb4103e530,
mode=3Dmode@entry=3D5, start=3Dstart@entry=3D0, count=3Dcount@entry=3D4) at
cso_cache/cso_context.c:1686
#8  0x00007f3f6736a6d0 in st_pbo_draw (st=3Dst@entry=3D0x55eb4105e810,
addr=3Daddr@entry=3D0x7ffc757dacc0, surface_width=3D<optimized out>,
surface_height=3D<optimized out>) at state_tracker/st_pbo.c:283
#9  0x00007f3f673320f1 in try_pbo_upload_common (ctx=3Dctx@entry=3D0x55eb41=
069510,
surface=3D0x55eb43688f90, addr=3Daddr@entry=3D0x7ffc757dacc0,
src_format=3Dsrc_format@entry=3DPIPE_FORMAT_B8G8R8A8_UNORM)
    at state_tracker/st_cb_texture.c:1222
#10 0x00007f3f673378c5 in try_pbo_upload (unpack=3D0x55eb41084778, pixels=
=3D0x0,
depth=3D1, height=3D27, width=3D96, zoffset=3D<optimized out>, yoffset=3D0,=
 xoffset=3D0,
dst_format=3D
    PIPE_FORMAT_B8G8R8A8_UNORM, type=3D5121, format=3D32993,
texImage=3D0x55eb411707f0, dims=3D2, ctx=3D0x55eb41069510) at
state_tracker/st_cb_texture.c:1337
#11 0x00007f3f673378c5 in st_TexSubImage (ctx=3Dctx@entry=3D0x55eb41069510,
dims=3Ddims@entry=3D2, texImage=3DtexImage@entry=3D0x55eb411707f0,
xoffset=3Dxoffset@entry=3D0, yoffset=3Dyoffset@entry=3D0, zoffset=3Dzoffset=
@entry=3D0,
width=3D96, height=3D27, depth=3D1, format=3D32993, type=3D5121, pixels=3D0=
x0,
unpack=3D0x55eb41084778) at state_tracker/st_cb_texture.c:1450
#12 0x00007f3f67338710 in st_TexImage (ctx=3D0x55eb41069510, dims=3D2,
texImage=3D0x55eb411707f0, format=3D32993, type=3D5121, pixels=3D0x0,
unpack=3D0x55eb41084778) at state_tracker/st_cb_texture.c:1625
#13 0x00007f3f672bb697 in teximage (ctx=3D0x55eb41069510,
compressed=3Dcompressed@entry=3D0 '\000', dims=3Ddims@entry=3D2, target=3D3=
553, level=3D0,
internalFormat=3D6408, width=3D96, height=3D27, depth=3D1, border=3D0, form=
at=3D32993,
type=3D5121, imageSize=3D0, pixels=3D0x0) at main/teximage.c:3066
#14 0x00007f3f672bc490 in _mesa_TexImage2D (target=3D<optimized out>,
level=3D<optimized out>, internalFormat=3D<optimized out>, width=3D<optimiz=
ed out>,
height=3D<optimized out>, border=3D<optimized out>, format=3D32993, type=3D=
5121,
pixels=3D0x0) at main/teximage.c:3105
#15 0x00007f3f8ba88bcd in _cogl_texture_driver_upload_to_gl
(ctx=3D0x55eb41040350, gl_target=3D3553, gl_handle=3D<optimized out>, is_fo=
reign=3D0,
source_bmp=3D0x7f3f6805ed80, internal_gl_format=3D6408, source_gl_format=3D=
32993,
source_gl_type=3D5121, error=3D0x7ffc757db160) at
driver/gl/gl/cogl-texture-driver-gl.c:343
#16 0x00007f3f8ba7a1c4 in allocate_from_bitmap (loader=3D<optimized out>,
loader=3D<optimized out>, error=3D0x7ffc757db160, tex_2d=3D0x55eb42d19940) =
at
driver/gl/cogl-texture-2d-gl.c:253
#17 0x00007f3f8ba7a1c4 in _cogl_texture_2d_gl_allocate (tex=3D0x55eb42d1994=
0,
error=3D0x7ffc757db160) at driver/gl/cogl-texture-2d-gl.c:456
#18 0x00007f3f8baaf536 in cogl_texture_allocate
(texture=3Dtexture@entry=3D0x55eb42d19940, error=3Derror@entry=3D0x7ffc757d=
b160) at
cogl-texture.c:1398
#19 0x00007f3f8bacaacb in _cogl_texture_new_from_bitmap (bitmap=3D0x7f3f680=
5ed80,
flags=3Dflags@entry=3DCOGL_TEXTURE_NO_SLICING,
internal_format=3Dinternal_format@entry=3DCOGL_PIXEL_FORMAT_BGRA_8888_PRE,
can_convert_in_place=3Dcan_convert_in_place@entry=3D0,
error=3Derror@entry=3D0x7ffc757db1c0) at deprecated/cogl-auto-texture.c:246
#20 0x00007f3f8bacafc9 in cogl_texture_new_from_bitmap (bitmap=3D<optimized=
 out>,
flags=3Dflags@entry=3DCOGL_TEXTURE_NO_SLICING,
internal_format=3Dinternal_format@entry=3DCOGL_PIXEL_FORMAT_BGRA_8888_PRE)
    at deprecated/cogl-auto-texture.c:294
#21 0x00007f3f8e373053 in clutter_canvas_paint_content (content=3D<optimized
out>, actor=3D0x55eb4338b290 [StDrawingArea], root=3D0x55eb439af060
[ClutterDummyNode]) at clutter-canvas.c:376
#22 0x00007f3f8e34f76d in clutter_actor_paint_node (root=3D0x55eb439af060
[ClutterDummyNode], actor=3D0x55eb4338b290 [StDrawingArea]) at
clutter-actor.c:3709
#23 0x00007f3f8e34f76d in clutter_actor_continue_paint
(self=3Dself@entry=3D0x55eb4338b290 [StDrawingArea]) at clutter-actor.c:4014
#24 0x00007f3f8e3559bb in clutter_actor_paint (self=3Dself@entry=3D0x55eb43=
38b290
[StDrawingArea]) at clutter-actor.c:3938
#25 0x00007f3f8e355cd9 in clutter_actor_paint (self=3Dself@entry=3D0x55eb43=
38b290
[StDrawingArea]) at clutter-actor.c:3964
#26 0x00007f3f93e2aa00 in st_box_layout_paint (actor=3D<optimized out>) at
st/st-box-layout.c:428
#30 0x00007f3f8add843f in <emit signal ??? on instance 0x55eb433639b0
[StBoxLayout]> (instance=3Dinstance@entry=3D0x55eb433639b0, signal_id=3D<op=
timized
out>, detail=3Ddetail@entry=3D0) at gsignal.c:3447
    #27 0x00007f3f8adbd33f in g_closure_invoke
(closure=3Dclosure@entry=3D0x55eb410fca90, return_value=3Dreturn_value@entr=
y=3D0x0,
n_param_values=3D1, param_values=3Dparam_values@entry=3D0x7ffc757db5a0,
invocation_hint=3Dinvocation_hint@entry=3D0x7ffc757db520) at gclosure.c:804
    #28 0x00007f3f8adcf82d in signal_emit_unlocked_R
(node=3Dnode@entry=3D0x55eb410fd790, detail=3Ddetail@entry=3D0,
instance=3Dinstance@entry=3D0x55eb433639b0,
emission_return=3Demission_return@entry=3D0x0,
instance_and_params=3Dinstance_and_params@entry=3D0x7ffc757db5a0) at gsigna=
l.c:3673
    #29 0x00007f3f8add805f in g_signal_emit_valist (instance=3D<optimized o=
ut>,
signal_id=3D<optimized out>, detail=3D<optimized out>,
var_args=3Dvar_args@entry=3D0x7ffc757db760) at gsignal.c:3391
#31 0x00007f3f8e34f7b3 in clutter_actor_continue_paint
(self=3Dself@entry=3D0x55eb433639b0 [StBoxLayout]) at clutter-actor.c:4018
#32 0x00007f3f8e3559bb in clutter_actor_paint (self=3Dself@entry=3D0x55eb43=
3639b0
[StBoxLayout]) at clutter-actor.c:3938
#33 0x00007f3f8e355cd9 in clutter_actor_paint (self=3Dself@entry=3D0x55eb43=
3639b0
[StBoxLayout]) at clutter-actor.c:3964
#34 0x00007f3f93e2aa00 in st_box_layout_paint (actor=3D<optimized out>) at
st/st-box-layout.c:428
#38 0x00007f3f8add843f in <emit signal ??? on instance 0x55eb43512540
[StBoxLayout]> (instance=3Dinstance@entry=3D0x55eb43512540, signal_id=3D<op=
timized
out>, detail=3Ddetail@entry=3D0) at gsignal.c:3447
    #35 0x00007f3f8adbd33f in g_closure_invoke
(closure=3Dclosure@entry=3D0x55eb410fca90, return_value=3Dreturn_value@entr=
y=3D0x0,
n_param_values=3D1, param_values=3Dparam_values@entry=3D0x7ffc757dbbe0,
invocation_hint=3Dinvocation_hint@entry=3D0x7ffc757dbb60) at gclosure.c:804
    #36 0x00007f3f8adcf82d in signal_emit_unlocked_R
(node=3Dnode@entry=3D0x55eb410fd790, detail=3Ddetail@entry=3D0,
instance=3Dinstance@entry=3D0x55eb43512540,
emission_return=3Demission_return@entry=3D0x0,
instance_and_params=3Dinstance_and_params@entry=3D0x7ffc757dbbe0) at gsigna=
l.c:3673
    #37 0x00007f3f8add805f in g_signal_emit_valist (instance=3D<optimized o=
ut>,
signal_id=3D<optimized out>, detail=3D<optimized out>,
var_args=3Dvar_args@entry=3D0x7ffc757dbda0) at gsignal.c:3391
#39 0x00007f3f8e34f7b3 in clutter_actor_continue_paint
(self=3Dself@entry=3D0x55eb43512540 [StBoxLayout]) at clutter-actor.c:4018
#40 0x00007f3f8e3559bb in clutter_actor_paint (self=3Dself@entry=3D0x55eb43=
512540
[StBoxLayout]) at clutter-actor.c:3938
#41 0x00007f3f8e355cd9 in clutter_actor_paint (self=3Dself@entry=3D0x55eb43=
512540
[StBoxLayout]) at clutter-actor.c:3964
#42 0x00007f3f93e20530 in shell_generic_container_paint (actor=3D0x55eb4332=
9f90
[ShellGenericContainer]) at shell-generic-container.c:149
#46 0x00007f3f8add843f in <emit signal ??? on instance 0x55eb43329f90
[ShellGenericContainer]> (instance=3Dinstance@entry=3D0x55eb43329f90,
signal_id=3D<optimized out>, detail=3Ddetail@entry=3D0) at gsignal.c:3447
    #43 0x00007f3f8adbd33f in g_closure_invoke
(closure=3Dclosure@entry=3D0x55eb410fca90, return_value=3Dreturn_value@entr=
y=3D0x0,
n_param_values=3D1, param_values=3Dparam_values@entry=3D0x7ffc757dc1d0,
invocation_hint=3Dinvocation_hint@entry=3D0x7ffc757dc150) at gclosure.c:804
    #44 0x00007f3f8adcf82d in signal_emit_unlocked_R
(node=3Dnode@entry=3D0x55eb410fd790, detail=3Ddetail@entry=3D0,
instance=3Dinstance@entry=3D0x55eb43329f90,
emission_return=3Demission_return@entry=3D0x0,
instance_and_params=3Dinstance_and_params@entry=3D0x7ffc757dc1d0) at gsigna=
l.c:3673
    #45 0x00007f3f8add805f in g_signal_emit_valist (instance=3D<optimized o=
ut>,
signal_id=3D<optimized out>, detail=3D<optimized out>,
var_args=3Dvar_args@entry=3D0x7ffc757dc390) at gsignal.c:3391
#47 0x00007f3f8e34f7b3 in clutter_actor_continue_paint
(self=3Dself@entry=3D0x55eb43329f90 [ShellGenericContainer]) at
clutter-actor.c:4018
#48 0x00007f3f8e3559bb in clutter_actor_paint (self=3D0x55eb43329f90
[ShellGenericContainer]) at clutter-actor.c:3938
#49 0x00007f3f8e355d00 in clutter_actor_real_paint (actor=3D<optimized out>=
) at
clutter-actor.c:3637
#53 0x00007f3f8add843f in <emit signal ??? on instance 0x55eb4332b750 [StBi=
n]>
(instance=3Dinstance@entry=3D0x55eb4332b750, signal_id=3D<optimized out>,
detail=3Ddetail@entry=3D0) at gsignal.c:3447
    #50 0x00007f3f8adbd33f in g_closure_invoke
(closure=3Dclosure@entry=3D0x55eb410fca90, return_value=3Dreturn_value@entr=
y=3D0x0,
n_param_values=3D1, param_values=3Dparam_values@entry=3D0x7ffc757dc7b0,
invocation_hint=3Dinvocation_hint@entry=3D0x7ffc757dc730) at gclosure.c:804
    #51 0x00007f3f8adcf82d in signal_emit_unlocked_R
(node=3Dnode@entry=3D0x55eb410fd790, detail=3Ddetail@entry=3D0,
instance=3Dinstance@entry=3D0x55eb4332b750,
emission_return=3Demission_return@entry=3D0x0,
instance_and_params=3Dinstance_and_params@entry=3D0x7ffc757dc7b0) at gsigna=
l.c:3673
    #52 0x00007f3f8add805f in g_signal_emit_valist (instance=3D<optimized o=
ut>,
signal_id=3D<optimized out>, detail=3D<optimized out>,
var_args=3Dvar_args@entry=3D0x7ffc757dc970) at gsignal.c:3391
#54 0x00007f3f8e34f7b3 in clutter_actor_continue_paint
(self=3Dself@entry=3D0x55eb4332b750 [StBin]) at clutter-actor.c:4018
#55 0x00007f3f8e3559bb in clutter_actor_paint (self=3Dself@entry=3D0x55eb43=
32b750
[StBin]) at clutter-actor.c:3938
#56 0x00007f3f8e355cd9 in clutter_actor_paint (self=3Dself@entry=3D0x55eb43=
32b750
[StBin]) at clutter-actor.c:3964
#57 0x00007f3f93e2aa00 in st_box_layout_paint (actor=3D<optimized out>) at
st/st-box-layout.c:428
#61 0x00007f3f8add843f in <emit signal ??? on instance 0x55eb41b509a0
[StBoxLayout]> (instance=3Dinstance@entry=3D0x55eb41b509a0, signal_id=3D<op=
timized
out>, detail=3Ddetail@entry=3D0) at gsignal.c:3447
    #58 0x00007f3f8adbd33f in g_closure_invoke
(closure=3Dclosure@entry=3D0x55eb410fca90, return_value=3Dreturn_value@entr=
y=3D0x0,
n_param_values=3D1, param_values=3Dparam_values@entry=3D0x7ffc757dcdf0,
invocation_hint=3Dinvocation_hint@entry=3D0x7ffc757dcd70) at gclosure.c:804
    #59 0x00007f3f8adcf82d in signal_emit_unlocked_R
(node=3Dnode@entry=3D0x55eb410fd790, detail=3Ddetail@entry=3D0,
instance=3Dinstance@entry=3D0x55eb41b509a0,
emission_return=3Demission_return@entry=3D0x0,
instance_and_params=3Dinstance_and_params@entry=3D0x7ffc757dcdf0) at gsigna=
l.c:3673
    #60 0x00007f3f8add805f in g_signal_emit_valist (instance=3D<optimized o=
ut>,
signal_id=3D<optimized out>, detail=3D<optimized out>,
var_args=3Dvar_args@entry=3D0x7ffc757dcfb0) at gsignal.c:3391
#62 0x00007f3f8e34f7b3 in clutter_actor_continue_paint
(self=3Dself@entry=3D0x55eb41b509a0 [StBoxLayout]) at clutter-actor.c:4018
#63 0x00007f3f8e3559bb in clutter_actor_paint (self=3Dself@entry=3D0x55eb41=
b509a0
[StBoxLayout]) at clutter-actor.c:3938
#64 0x00007f3f8e355cd9 in clutter_actor_paint (self=3Dself@entry=3D0x55eb41=
b509a0
[StBoxLayout]) at clutter-actor.c:3964
#65 0x00007f3f93e20530 in shell_generic_container_paint (actor=3D0x55eb41b4=
e750
[ShellGenericContainer]) at shell-generic-container.c:149
#69 0x00007f3f8add843f in <emit signal ??? on instance 0x55eb41b4e750
[ShellGenericContainer]> (instance=3Dinstance@entry=3D0x55eb41b4e750,
signal_id=3D<optimized out>, detail=3Ddetail@entry=3D0) at gsignal.c:3447
    #66 0x00007f3f8adbd33f in g_closure_invoke
(closure=3Dclosure@entry=3D0x55eb410fca90, return_value=3Dreturn_value@entr=
y=3D0x0,
n_param_values=3D1, param_values=3Dparam_values@entry=3D0x7ffc757dd3e0,
invocation_hint=3Dinvocation_hint@entry=3D0x7ffc757dd360) at gclosure.c:804
    #67 0x00007f3f8adcf82d in signal_emit_unlocked_R
(node=3Dnode@entry=3D0x55eb410fd790, detail=3Ddetail@entry=3D0,
instance=3Dinstance@entry=3D0x55eb41b4e750,
emission_return=3Demission_return@entry=3D0x0,
instance_and_params=3Dinstance_and_params@entry=3D0x7ffc757dd3e0) at gsigna=
l.c:3673
    #68 0x00007f3f8add805f in g_signal_emit_valist (instance=3D<optimized o=
ut>,
signal_id=3D<optimized out>, detail=3D<optimized out>,
var_args=3Dvar_args@entry=3D0x7ffc757dd5a0) at gsignal.c:3391
#70 0x00007f3f8e34f7b3 in clutter_actor_continue_paint
(self=3Dself@entry=3D0x55eb41b4e750 [ShellGenericContainer]) at
clutter-actor.c:4018
#71 0x00007f3f8e3559bb in clutter_actor_paint (self=3Dself@entry=3D0x55eb41=
b4e750
[ShellGenericContainer]) at clutter-actor.c:3938
#72 0x00007f3f8e355cd9 in clutter_actor_paint (self=3Dself@entry=3D0x55eb41=
b4e750
[ShellGenericContainer]) at clutter-actor.c:3964
#73 0x00007f3f93e2aa00 in st_box_layout_paint (actor=3D<optimized out>) at
st/st-box-layout.c:428
#77 0x00007f3f8add843f in <emit signal ??? on instance 0x55eb41a24010
[StBoxLayout]> (instance=3Dinstance@entry=3D0x55eb41a24010, signal_id=3D<op=
timized
out>, detail=3Ddetail@entry=3D0) at gsignal.c:3447
    #74 0x00007f3f8adbd33f in g_closure_invoke
(closure=3Dclosure@entry=3D0x55eb410fca90, return_value=3Dreturn_value@entr=
y=3D0x0,
n_param_values=3D1, param_values=3Dparam_values@entry=3D0x7ffc757dda20,
invocation_hint=3Dinvocation_hint@entry=3D0x7ffc757dd9a0) at gclosure.c:804
    #75 0x00007f3f8adcf82d in signal_emit_unlocked_R
(node=3Dnode@entry=3D0x55eb410fd790, detail=3Ddetail@entry=3D0,
instance=3Dinstance@entry=3D0x55eb41a24010,
emission_return=3Demission_return@entry=3D0x0,
instance_and_params=3Dinstance_and_params@entry=3D0x7ffc757dda20) at gsigna=
l.c:3673
    #76 0x00007f3f8add805f in g_signal_emit_valist (instance=3D<optimized o=
ut>,
signal_id=3D<optimized out>, detail=3D<optimized out>,
var_args=3Dvar_args@entry=3D0x7ffc757ddbe0) at gsignal.c:3391
#78 0x00007f3f8e34f7b3 in clutter_actor_continue_paint
(self=3Dself@entry=3D0x55eb41a24010 [StBoxLayout]) at clutter-actor.c:4018
---Type <return> to continue, or q <return> to quit---
#79 0x00007f3f8e3559bb in clutter_actor_paint (self=3Dself@entry=3D0x55eb41=
a24010
[StBoxLayout]) at clutter-actor.c:3938
#80 0x00007f3f8e355cd9 in clutter_actor_paint (self=3Dself@entry=3D0x55eb41=
a24010
[StBoxLayout]) at clutter-actor.c:3964
#81 0x00007f3f93e20530 in shell_generic_container_paint (actor=3D0x55eb419e=
0540
[ShellGenericContainer]) at shell-generic-container.c:149
#85 0x00007f3f8add843f in <emit signal ??? on instance 0x55eb419e0540
[ShellGenericContainer]> (instance=3Dinstance@entry=3D0x55eb419e0540,
signal_id=3D<optimized out>, detail=3Ddetail@entry=3D0) at gsignal.c:3447
    #82 0x00007f3f8adbd33f in g_closure_invoke
(closure=3Dclosure@entry=3D0x55eb410fca90, return_value=3Dreturn_value@entr=
y=3D0x0,
n_param_values=3D1, param_values=3Dparam_values@entry=3D0x7ffc757de010,
invocation_hint=3Dinvocation_hint@entry=3D0x7ffc757ddf90) at gclosure.c:804
    #83 0x00007f3f8adcf82d in signal_emit_unlocked_R
(node=3Dnode@entry=3D0x55eb410fd790, detail=3Ddetail@entry=3D0,
instance=3Dinstance@entry=3D0x55eb419e0540,
emission_return=3Demission_return@entry=3D0x0,
instance_and_params=3Dinstance_and_params@entry=3D0x7ffc757de010) at gsigna=
l.c:3673
    #84 0x00007f3f8add805f in g_signal_emit_valist (instance=3D<optimized o=
ut>,
signal_id=3D<optimized out>, detail=3D<optimized out>,
var_args=3Dvar_args@entry=3D0x7ffc757de1d0) at gsignal.c:3391
#86 0x00007f3f8e34f7b3 in clutter_actor_continue_paint
(self=3Dself@entry=3D0x55eb419e0540 [ShellGenericContainer]) at
clutter-actor.c:4018
#87 0x00007f3f8e3559bb in clutter_actor_paint (self=3D0x55eb419e0540
[ShellGenericContainer]) at clutter-actor.c:3938
#88 0x00007f3f8e355cd9 in clutter_actor_paint (self=3D<optimized out>) at
clutter-actor.c:3964
#89 0x00007f3f8e3a83fa in clutter_stage_paint (self=3D<optimized out>) at
clutter-stage.c:710
#90 0x00007f3f8f2b62a6 in meta_stage_paint (actor=3D0x55eb40fb0760 [MetaSta=
ge])
at backends/meta-stage.c:141
#94 0x00007f3f8add843f in <emit signal ??? on instance 0x55eb40fb0760
[MetaStage]> (instance=3Dinstance@entry=3D0x55eb40fb0760, signal_id=3D<opti=
mized
out>, detail=3Ddetail@entry=3D0) at gsignal.c:3447
    #91 0x00007f3f8adbd3e5 in g_closure_invoke
(closure=3Dclosure@entry=3D0x55eb410fca90, return_value=3Dreturn_value@entr=
y=3D0x0,
n_param_values=3D1, param_values=3Dparam_values@entry=3D0x7ffc757de680,
invocation_hint=3Dinvocation_hint@entry=3D0x7ffc757de600) at gclosure.c:804
    #92 0x00007f3f8adcf82d in signal_emit_unlocked_R
(node=3Dnode@entry=3D0x55eb410fd790, detail=3Ddetail@entry=3D0,
instance=3Dinstance@entry=3D0x55eb40fb0760,
emission_return=3Demission_return@entry=3D0x0,
instance_and_params=3Dinstance_and_params@entry=3D0x7ffc757de680) at gsigna=
l.c:3673
    #93 0x00007f3f8add805f in g_signal_emit_valist (instance=3D<optimized o=
ut>,
signal_id=3D<optimized out>, detail=3D<optimized out>,
var_args=3Dvar_args@entry=3D0x7ffc757de840) at gsignal.c:3391
#95 0x00007f3f8e34f7b3 in clutter_actor_continue_paint
(self=3Dself@entry=3D0x55eb40fb0760 [MetaStage]) at clutter-actor.c:4018
#96 0x00007f3f8e3559bb in clutter_actor_paint (self=3Dself@entry=3D0x55eb40=
fb0760
[MetaStage]) at clutter-actor.c:3938
#97 0x00007f3f8e355cd9 in clutter_actor_paint (self=3Dself@entry=3D0x55eb40=
fb0760
[MetaStage]) at clutter-actor.c:3964
#98 0x00007f3f8e3ac4e5 in clutter_stage_do_paint_view
(stage=3Dstage@entry=3D0x55eb40fb0760 [MetaStage], view=3Dview@entry=3D0x55=
eb41125140
[MetaRendererView], clip=3Dclip@entry=3D0x7ffc757debe0) at clutter-stage.c:=
678
#99 0x00007f3f8e3ac553 in _clutter_stage_paint_view
(stage=3Dstage@entry=3D0x55eb40fb0760 [MetaStage], view=3Dview@entry=3D0x55=
eb41125140
[MetaRendererView], clip=3Dclip@entry=3D0x7ffc757debe0) at clutter-stage.c:=
694
#100 0x00007f3f8e341144 in paint_stage
(stage_cogl=3Dstage_cogl@entry=3D0x55eb4110f860 [MetaStageNative],
view=3Dview@entry=3D0x55eb41125140 [MetaRendererView],
clip=3Dclip@entry=3D0x7ffc757debe0)
    at cogl/clutter-stage-cogl.c:422
#101 0x00007f3f8e3414ee in clutter_stage_cogl_redraw_view (view=3D0x55eb411=
25140
[MetaRendererView], stage_window=3D0x55eb4110f860) at
cogl/clutter-stage-cogl.c:667
#102 0x00007f3f8e3414ee in clutter_stage_cogl_redraw
(stage_window=3D0x55eb4110f860) at cogl/clutter-stage-cogl.c:783
#103 0x00007f3f8f3334ae in meta_stage_native_redraw
(stage_window=3D0x55eb4110f860) at backends/native/meta-stage-native.c:300
#104 0x00007f3f8e3a9357 in clutter_stage_do_redraw (stage=3D0x55eb40fb0760
[MetaStage]) at clutter-stage.c:1120
#105 0x00007f3f8e3a9357 in _clutter_stage_do_update (stage=3D0x55eb40fb0760
[MetaStage]) at clutter-stage.c:1176
#106 0x00007f3f8e394d49 in master_clock_update_stages
(master_clock=3D0x55eb41127ec0 [ClutterMasterClockDefault], stages=3D0x55eb=
439e4e80
=3D {...}) at clutter-master-clock-default.c:443
#107 0x00007f3f8e394d49 in clutter_clock_dispatch (source=3D<optimized out>,
callback=3D<optimized out>, user_data=3D<optimized out>) at
clutter-master-clock-default.c:567
#108 0x00007f3f8aae4e52 in g_main_dispatch (context=3D0x55eb40f9d730) at
gmain.c:3203
#109 0x00007f3f8aae4e52 in g_main_context_dispatch
(context=3Dcontext@entry=3D0x55eb40f9d730) at gmain.c:3856
#110 0x00007f3f8aae51d0 in g_main_context_iterate (context=3D0x55eb40f9d730,
block=3Dblock@entry=3D1, dispatch=3Ddispatch@entry=3D1, self=3D<optimized o=
ut>) at
gmain.c:3929
#111 0x00007f3f8aae54f2 in g_main_loop_run (loop=3D0x55eb4112b990) at
gmain.c:4125
#112 0x00007f3f8f2e159c in meta_run () at core/main.c:572
#113 0x000055eb40aa1657 in main (argc=3D<optimized out>, argv=3D<optimized =
out>) at
main.c:471



According to the coredump, the memcpy in nouveau_scratch_data() is failing
because nv->scratch.map is invalid.

/usr/src/debug/mesa-13.0.4/src/gallium/drivers/nouveau/nouveau_buffer.c

/* Copy data to a scratch buffer and return address & bo the data resides i=
n.
*/
uint64_t
nouveau_scratch_data(struct nouveau_context *nv,
                     const void *data, unsigned base, unsigned size,
                     struct nouveau_bo **bo)
{
   unsigned bgn =3D MAX2(base, nv->scratch.offset);
   unsigned end =3D bgn + size;

   if (end >=3D nv->scratch.end) {
      end =3D base + size;
      if (!nouveau_scratch_more(nv, end))
         return 0;
      bgn =3D base;
   }
   nv->scratch.offset =3D align(end, 4);

   memcpy(nv->scratch.map + bgn, (const uint8_t *)data + base, size);

   *bo =3D nv->scratch.current;
   return (*bo)->offset + (bgn - base);
}


(gdb) print nv->scratch
$2 =3D {map =3D 0x7f3f25a9c000 <error: Cannot access memory at address
0x7f3f25a9c000>, id =3D 1, wrap =3D 1, offset =3D 177264, end =3D 2097152, =
bo =3D {0x0,
0x55eb433792e0, 0x0, 0x0}, current =3D 0x55eb433792e0,=20
  runout =3D 0x0, bo_size =3D 2097152}


The same 0x7f3f25a9c000 pointer value is also found in bo->map and
nv->scratch.current.map

(gdb) print bo->map
$6 =3D (void *) 0x7f3f25a9c000

(gdb) print nv->scratch.current.map
$9 =3D (void *) 0x7f3f25a9c000

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--14911509131.c6DdBe2E.15119
Date: Sun, 2 Apr 2017 16:35:13 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Crash in nouveau_dri.so when switching apps with alt-tab =
in Gnome"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99396#c6">Comment=
 # 6</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Crash in nouveau_dri.so when switching apps with alt-tab =
in Gnome"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99396">bug 99396<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
tommi.t.rantala&#64;nokia.com" title=3D"Tommi Rantala &lt;tommi.t.rantala&#=
64;nokia.com&gt;"> <span class=3D"fn">Tommi Rantala</span></a>
</span></b>
        <pre>I'm also seeing this crash regularly with HP ZBook 15 G3, that=
 has NVIDIA GPU.
I'm using Fedora 25.

$ lspci|grep NVIDIA
01:00.0 VGA compatible controller: NVIDIA Corporation GM107GLM [Quadro M200=
0M]
(rev a2)

(gdb) bt
#0  0x00007f3f8905a513 in __memmove_avx_unaligned_erms () at
../sysdeps/x86_64/multiarch/memmove-vec-unaligned-erms.S:218
#1  0x00007f3f67656fa0 in memcpy (__len=3D48, __src=3D&lt;optimized out&gt;,
__dest=3D&lt;optimized out&gt;) at /usr/include/bits/string3.h:53
#2  0x00007f3f67656fa0 in nouveau_scratch_data (nv=3Dnv&#64;entry=3D0x55eb4=
1056660,
data=3D&lt;optimized out&gt;, base=3Dbase&#64;entry=3D0, size=3Dsize&#64;en=
try=3D48,
bo=3Dbo&#64;entry=3D0x7ffc757da7f0) at nouveau_buffer.c:1006
#3  0x00007f3f6776fad8 in nvc0_update_user_vbufs_shared (nvc0=3D0x55eb41056=
660)
at nvc0/nvc0_vbo.c:292
#4  0x00007f3f67764e25 in nvc0_state_validate (nvc0=3Dnvc0&#64;entry=3D0x55=
eb41056660,
mask=3Dmask&#64;entry=3D4294967295, validate_list=3Dvalidate_list&#64;entry=
=3D0x7f3f67e07020
&lt;validate_list_3d&gt;, size=3Dsize&#64;entry=3D33, dirty=3Ddirty&#64;ent=
ry=3D0x55eb41056a60,
bufctx=3D0x55eb4105a020) at nvc0/nvc0_state_validate.c:832
#5  0x00007f3f67765007 in nvc0_state_validate_3d
(nvc0=3Dnvc0&#64;entry=3D0x55eb41056660, mask=3Dmask&#64;entry=3D4294967295=
) at
nvc0/nvc0_state_validate.c:850
#6  0x00007f3f67770e94 in nvc0_draw_vbo (pipe=3D0x55eb41056660,
info=3D0x7ffc757da990) at nvc0/nvc0_vbo.c:977
#7  0x00007f3f674d3ed2 in cso_draw_arrays (cso=3Dcso&#64;entry=3D0x55eb4103=
e530,
mode=3Dmode&#64;entry=3D5, start=3Dstart&#64;entry=3D0, count=3Dcount&#64;e=
ntry=3D4) at
cso_cache/cso_context.c:1686
#8  0x00007f3f6736a6d0 in st_pbo_draw (st=3Dst&#64;entry=3D0x55eb4105e810,
addr=3Daddr&#64;entry=3D0x7ffc757dacc0, surface_width=3D&lt;optimized out&g=
t;,
surface_height=3D&lt;optimized out&gt;) at state_tracker/st_pbo.c:283
#9  0x00007f3f673320f1 in try_pbo_upload_common (ctx=3Dctx&#64;entry=3D0x55=
eb41069510,
surface=3D0x55eb43688f90, addr=3Daddr&#64;entry=3D0x7ffc757dacc0,
src_format=3Dsrc_format&#64;entry=3DPIPE_FORMAT_B8G8R8A8_UNORM)
    at state_tracker/st_cb_texture.c:1222
#10 0x00007f3f673378c5 in try_pbo_upload (unpack=3D0x55eb41084778, pixels=
=3D0x0,
depth=3D1, height=3D27, width=3D96, zoffset=3D&lt;optimized out&gt;, yoffse=
t=3D0, xoffset=3D0,
dst_format=3D
    PIPE_FORMAT_B8G8R8A8_UNORM, type=3D5121, format=3D32993,
texImage=3D0x55eb411707f0, dims=3D2, ctx=3D0x55eb41069510) at
state_tracker/st_cb_texture.c:1337
#11 0x00007f3f673378c5 in st_TexSubImage (ctx=3Dctx&#64;entry=3D0x55eb41069=
510,
dims=3Ddims&#64;entry=3D2, texImage=3DtexImage&#64;entry=3D0x55eb411707f0,
xoffset=3Dxoffset&#64;entry=3D0, yoffset=3Dyoffset&#64;entry=3D0, zoffset=
=3Dzoffset&#64;entry=3D0,
width=3D96, height=3D27, depth=3D1, format=3D32993, type=3D5121, pixels=3D0=
x0,
unpack=3D0x55eb41084778) at state_tracker/st_cb_texture.c:1450
#12 0x00007f3f67338710 in st_TexImage (ctx=3D0x55eb41069510, dims=3D2,
texImage=3D0x55eb411707f0, format=3D32993, type=3D5121, pixels=3D0x0,
unpack=3D0x55eb41084778) at state_tracker/st_cb_texture.c:1625
#13 0x00007f3f672bb697 in teximage (ctx=3D0x55eb41069510,
compressed=3Dcompressed&#64;entry=3D0 '\000', dims=3Ddims&#64;entry=3D2, ta=
rget=3D3553, level=3D0,
internalFormat=3D6408, width=3D96, height=3D27, depth=3D1, border=3D0, form=
at=3D32993,
type=3D5121, imageSize=3D0, pixels=3D0x0) at main/teximage.c:3066
#14 0x00007f3f672bc490 in _mesa_TexImage2D (target=3D&lt;optimized out&gt;,
level=3D&lt;optimized out&gt;, internalFormat=3D&lt;optimized out&gt;, widt=
h=3D&lt;optimized out&gt;,
height=3D&lt;optimized out&gt;, border=3D&lt;optimized out&gt;, format=3D32=
993, type=3D5121,
pixels=3D0x0) at main/teximage.c:3105
#15 0x00007f3f8ba88bcd in _cogl_texture_driver_upload_to_gl
(ctx=3D0x55eb41040350, gl_target=3D3553, gl_handle=3D&lt;optimized out&gt;,=
 is_foreign=3D0,
source_bmp=3D0x7f3f6805ed80, internal_gl_format=3D6408, source_gl_format=3D=
32993,
source_gl_type=3D5121, error=3D0x7ffc757db160) at
driver/gl/gl/cogl-texture-driver-gl.c:343
#16 0x00007f3f8ba7a1c4 in allocate_from_bitmap (loader=3D&lt;optimized out&=
gt;,
loader=3D&lt;optimized out&gt;, error=3D0x7ffc757db160, tex_2d=3D0x55eb42d1=
9940) at
driver/gl/cogl-texture-2d-gl.c:253
#17 0x00007f3f8ba7a1c4 in _cogl_texture_2d_gl_allocate (tex=3D0x55eb42d1994=
0,
error=3D0x7ffc757db160) at driver/gl/cogl-texture-2d-gl.c:456
#18 0x00007f3f8baaf536 in cogl_texture_allocate
(texture=3Dtexture&#64;entry=3D0x55eb42d19940, error=3Derror&#64;entry=3D0x=
7ffc757db160) at
cogl-texture.c:1398
#19 0x00007f3f8bacaacb in _cogl_texture_new_from_bitmap (bitmap=3D0x7f3f680=
5ed80,
flags=3Dflags&#64;entry=3DCOGL_TEXTURE_NO_SLICING,
internal_format=3Dinternal_format&#64;entry=3DCOGL_PIXEL_FORMAT_BGRA_8888_P=
RE,
can_convert_in_place=3Dcan_convert_in_place&#64;entry=3D0,
error=3Derror&#64;entry=3D0x7ffc757db1c0) at deprecated/cogl-auto-texture.c=
:246
#20 0x00007f3f8bacafc9 in cogl_texture_new_from_bitmap (bitmap=3D&lt;optimi=
zed out&gt;,
flags=3Dflags&#64;entry=3DCOGL_TEXTURE_NO_SLICING,
internal_format=3Dinternal_format&#64;entry=3DCOGL_PIXEL_FORMAT_BGRA_8888_P=
RE)
    at deprecated/cogl-auto-texture.c:294
#21 0x00007f3f8e373053 in clutter_canvas_paint_content (content=3D&lt;optim=
ized
out&gt;, actor=3D0x55eb4338b290 [StDrawingArea], root=3D0x55eb439af060
[ClutterDummyNode]) at clutter-canvas.c:376
#22 0x00007f3f8e34f76d in clutter_actor_paint_node (root=3D0x55eb439af060
[ClutterDummyNode], actor=3D0x55eb4338b290 [StDrawingArea]) at
clutter-actor.c:3709
#23 0x00007f3f8e34f76d in clutter_actor_continue_paint
(self=3Dself&#64;entry=3D0x55eb4338b290 [StDrawingArea]) at clutter-actor.c=
:4014
#24 0x00007f3f8e3559bb in clutter_actor_paint (self=3Dself&#64;entry=3D0x55=
eb4338b290
[StDrawingArea]) at clutter-actor.c:3938
#25 0x00007f3f8e355cd9 in clutter_actor_paint (self=3Dself&#64;entry=3D0x55=
eb4338b290
[StDrawingArea]) at clutter-actor.c:3964
#26 0x00007f3f93e2aa00 in st_box_layout_paint (actor=3D&lt;optimized out&gt=
;) at
st/st-box-layout.c:428
#30 0x00007f3f8add843f in &lt;emit signal ??? on instance 0x55eb433639b0
[StBoxLayout]&gt; (instance=3Dinstance&#64;entry=3D0x55eb433639b0, signal_i=
d=3D&lt;optimized
out&gt;, detail=3Ddetail&#64;entry=3D0) at gsignal.c:3447
    #27 0x00007f3f8adbd33f in g_closure_invoke
(closure=3Dclosure&#64;entry=3D0x55eb410fca90, return_value=3Dreturn_value&=
#64;entry=3D0x0,
n_param_values=3D1, param_values=3Dparam_values&#64;entry=3D0x7ffc757db5a0,
invocation_hint=3Dinvocation_hint&#64;entry=3D0x7ffc757db520) at gclosure.c=
:804
    #28 0x00007f3f8adcf82d in signal_emit_unlocked_R
(node=3Dnode&#64;entry=3D0x55eb410fd790, detail=3Ddetail&#64;entry=3D0,
instance=3Dinstance&#64;entry=3D0x55eb433639b0,
emission_return=3Demission_return&#64;entry=3D0x0,
instance_and_params=3Dinstance_and_params&#64;entry=3D0x7ffc757db5a0) at gs=
ignal.c:3673
    #29 0x00007f3f8add805f in g_signal_emit_valist (instance=3D&lt;optimize=
d out&gt;,
signal_id=3D&lt;optimized out&gt;, detail=3D&lt;optimized out&gt;,
var_args=3Dvar_args&#64;entry=3D0x7ffc757db760) at gsignal.c:3391
#31 0x00007f3f8e34f7b3 in clutter_actor_continue_paint
(self=3Dself&#64;entry=3D0x55eb433639b0 [StBoxLayout]) at clutter-actor.c:4=
018
#32 0x00007f3f8e3559bb in clutter_actor_paint (self=3Dself&#64;entry=3D0x55=
eb433639b0
[StBoxLayout]) at clutter-actor.c:3938
#33 0x00007f3f8e355cd9 in clutter_actor_paint (self=3Dself&#64;entry=3D0x55=
eb433639b0
[StBoxLayout]) at clutter-actor.c:3964
#34 0x00007f3f93e2aa00 in st_box_layout_paint (actor=3D&lt;optimized out&gt=
;) at
st/st-box-layout.c:428
#38 0x00007f3f8add843f in &lt;emit signal ??? on instance 0x55eb43512540
[StBoxLayout]&gt; (instance=3Dinstance&#64;entry=3D0x55eb43512540, signal_i=
d=3D&lt;optimized
out&gt;, detail=3Ddetail&#64;entry=3D0) at gsignal.c:3447
    #35 0x00007f3f8adbd33f in g_closure_invoke
(closure=3Dclosure&#64;entry=3D0x55eb410fca90, return_value=3Dreturn_value&=
#64;entry=3D0x0,
n_param_values=3D1, param_values=3Dparam_values&#64;entry=3D0x7ffc757dbbe0,
invocation_hint=3Dinvocation_hint&#64;entry=3D0x7ffc757dbb60) at gclosure.c=
:804
    #36 0x00007f3f8adcf82d in signal_emit_unlocked_R
(node=3Dnode&#64;entry=3D0x55eb410fd790, detail=3Ddetail&#64;entry=3D0,
instance=3Dinstance&#64;entry=3D0x55eb43512540,
emission_return=3Demission_return&#64;entry=3D0x0,
instance_and_params=3Dinstance_and_params&#64;entry=3D0x7ffc757dbbe0) at gs=
ignal.c:3673
    #37 0x00007f3f8add805f in g_signal_emit_valist (instance=3D&lt;optimize=
d out&gt;,
signal_id=3D&lt;optimized out&gt;, detail=3D&lt;optimized out&gt;,
var_args=3Dvar_args&#64;entry=3D0x7ffc757dbda0) at gsignal.c:3391
#39 0x00007f3f8e34f7b3 in clutter_actor_continue_paint
(self=3Dself&#64;entry=3D0x55eb43512540 [StBoxLayout]) at clutter-actor.c:4=
018
#40 0x00007f3f8e3559bb in clutter_actor_paint (self=3Dself&#64;entry=3D0x55=
eb43512540
[StBoxLayout]) at clutter-actor.c:3938
#41 0x00007f3f8e355cd9 in clutter_actor_paint (self=3Dself&#64;entry=3D0x55=
eb43512540
[StBoxLayout]) at clutter-actor.c:3964
#42 0x00007f3f93e20530 in shell_generic_container_paint (actor=3D0x55eb4332=
9f90
[ShellGenericContainer]) at shell-generic-container.c:149
#46 0x00007f3f8add843f in &lt;emit signal ??? on instance 0x55eb43329f90
[ShellGenericContainer]&gt; (instance=3Dinstance&#64;entry=3D0x55eb43329f90,
signal_id=3D&lt;optimized out&gt;, detail=3Ddetail&#64;entry=3D0) at gsigna=
l.c:3447
    #43 0x00007f3f8adbd33f in g_closure_invoke
(closure=3Dclosure&#64;entry=3D0x55eb410fca90, return_value=3Dreturn_value&=
#64;entry=3D0x0,
n_param_values=3D1, param_values=3Dparam_values&#64;entry=3D0x7ffc757dc1d0,
invocation_hint=3Dinvocation_hint&#64;entry=3D0x7ffc757dc150) at gclosure.c=
:804
    #44 0x00007f3f8adcf82d in signal_emit_unlocked_R
(node=3Dnode&#64;entry=3D0x55eb410fd790, detail=3Ddetail&#64;entry=3D0,
instance=3Dinstance&#64;entry=3D0x55eb43329f90,
emission_return=3Demission_return&#64;entry=3D0x0,
instance_and_params=3Dinstance_and_params&#64;entry=3D0x7ffc757dc1d0) at gs=
ignal.c:3673
    #45 0x00007f3f8add805f in g_signal_emit_valist (instance=3D&lt;optimize=
d out&gt;,
signal_id=3D&lt;optimized out&gt;, detail=3D&lt;optimized out&gt;,
var_args=3Dvar_args&#64;entry=3D0x7ffc757dc390) at gsignal.c:3391
#47 0x00007f3f8e34f7b3 in clutter_actor_continue_paint
(self=3Dself&#64;entry=3D0x55eb43329f90 [ShellGenericContainer]) at
clutter-actor.c:4018
#48 0x00007f3f8e3559bb in clutter_actor_paint (self=3D0x55eb43329f90
[ShellGenericContainer]) at clutter-actor.c:3938
#49 0x00007f3f8e355d00 in clutter_actor_real_paint (actor=3D&lt;optimized o=
ut&gt;) at
clutter-actor.c:3637
#53 0x00007f3f8add843f in &lt;emit signal ??? on instance 0x55eb4332b750 [S=
tBin]&gt;
(instance=3Dinstance&#64;entry=3D0x55eb4332b750, signal_id=3D&lt;optimized =
out&gt;,
detail=3Ddetail&#64;entry=3D0) at gsignal.c:3447
    #50 0x00007f3f8adbd33f in g_closure_invoke
(closure=3Dclosure&#64;entry=3D0x55eb410fca90, return_value=3Dreturn_value&=
#64;entry=3D0x0,
n_param_values=3D1, param_values=3Dparam_values&#64;entry=3D0x7ffc757dc7b0,
invocation_hint=3Dinvocation_hint&#64;entry=3D0x7ffc757dc730) at gclosure.c=
:804
    #51 0x00007f3f8adcf82d in signal_emit_unlocked_R
(node=3Dnode&#64;entry=3D0x55eb410fd790, detail=3Ddetail&#64;entry=3D0,
instance=3Dinstance&#64;entry=3D0x55eb4332b750,
emission_return=3Demission_return&#64;entry=3D0x0,
instance_and_params=3Dinstance_and_params&#64;entry=3D0x7ffc757dc7b0) at gs=
ignal.c:3673
    #52 0x00007f3f8add805f in g_signal_emit_valist (instance=3D&lt;optimize=
d out&gt;,
signal_id=3D&lt;optimized out&gt;, detail=3D&lt;optimized out&gt;,
var_args=3Dvar_args&#64;entry=3D0x7ffc757dc970) at gsignal.c:3391
#54 0x00007f3f8e34f7b3 in clutter_actor_continue_paint
(self=3Dself&#64;entry=3D0x55eb4332b750 [StBin]) at clutter-actor.c:4018
#55 0x00007f3f8e3559bb in clutter_actor_paint (self=3Dself&#64;entry=3D0x55=
eb4332b750
[StBin]) at clutter-actor.c:3938
#56 0x00007f3f8e355cd9 in clutter_actor_paint (self=3Dself&#64;entry=3D0x55=
eb4332b750
[StBin]) at clutter-actor.c:3964
#57 0x00007f3f93e2aa00 in st_box_layout_paint (actor=3D&lt;optimized out&gt=
;) at
st/st-box-layout.c:428
#61 0x00007f3f8add843f in &lt;emit signal ??? on instance 0x55eb41b509a0
[StBoxLayout]&gt; (instance=3Dinstance&#64;entry=3D0x55eb41b509a0, signal_i=
d=3D&lt;optimized
out&gt;, detail=3Ddetail&#64;entry=3D0) at gsignal.c:3447
    #58 0x00007f3f8adbd33f in g_closure_invoke
(closure=3Dclosure&#64;entry=3D0x55eb410fca90, return_value=3Dreturn_value&=
#64;entry=3D0x0,
n_param_values=3D1, param_values=3Dparam_values&#64;entry=3D0x7ffc757dcdf0,
invocation_hint=3Dinvocation_hint&#64;entry=3D0x7ffc757dcd70) at gclosure.c=
:804
    #59 0x00007f3f8adcf82d in signal_emit_unlocked_R
(node=3Dnode&#64;entry=3D0x55eb410fd790, detail=3Ddetail&#64;entry=3D0,
instance=3Dinstance&#64;entry=3D0x55eb41b509a0,
emission_return=3Demission_return&#64;entry=3D0x0,
instance_and_params=3Dinstance_and_params&#64;entry=3D0x7ffc757dcdf0) at gs=
ignal.c:3673
    #60 0x00007f3f8add805f in g_signal_emit_valist (instance=3D&lt;optimize=
d out&gt;,
signal_id=3D&lt;optimized out&gt;, detail=3D&lt;optimized out&gt;,
var_args=3Dvar_args&#64;entry=3D0x7ffc757dcfb0) at gsignal.c:3391
#62 0x00007f3f8e34f7b3 in clutter_actor_continue_paint
(self=3Dself&#64;entry=3D0x55eb41b509a0 [StBoxLayout]) at clutter-actor.c:4=
018
#63 0x00007f3f8e3559bb in clutter_actor_paint (self=3Dself&#64;entry=3D0x55=
eb41b509a0
[StBoxLayout]) at clutter-actor.c:3938
#64 0x00007f3f8e355cd9 in clutter_actor_paint (self=3Dself&#64;entry=3D0x55=
eb41b509a0
[StBoxLayout]) at clutter-actor.c:3964
#65 0x00007f3f93e20530 in shell_generic_container_paint (actor=3D0x55eb41b4=
e750
[ShellGenericContainer]) at shell-generic-container.c:149
#69 0x00007f3f8add843f in &lt;emit signal ??? on instance 0x55eb41b4e750
[ShellGenericContainer]&gt; (instance=3Dinstance&#64;entry=3D0x55eb41b4e750,
signal_id=3D&lt;optimized out&gt;, detail=3Ddetail&#64;entry=3D0) at gsigna=
l.c:3447
    #66 0x00007f3f8adbd33f in g_closure_invoke
(closure=3Dclosure&#64;entry=3D0x55eb410fca90, return_value=3Dreturn_value&=
#64;entry=3D0x0,
n_param_values=3D1, param_values=3Dparam_values&#64;entry=3D0x7ffc757dd3e0,
invocation_hint=3Dinvocation_hint&#64;entry=3D0x7ffc757dd360) at gclosure.c=
:804
    #67 0x00007f3f8adcf82d in signal_emit_unlocked_R
(node=3Dnode&#64;entry=3D0x55eb410fd790, detail=3Ddetail&#64;entry=3D0,
instance=3Dinstance&#64;entry=3D0x55eb41b4e750,
emission_return=3Demission_return&#64;entry=3D0x0,
instance_and_params=3Dinstance_and_params&#64;entry=3D0x7ffc757dd3e0) at gs=
ignal.c:3673
    #68 0x00007f3f8add805f in g_signal_emit_valist (instance=3D&lt;optimize=
d out&gt;,
signal_id=3D&lt;optimized out&gt;, detail=3D&lt;optimized out&gt;,
var_args=3Dvar_args&#64;entry=3D0x7ffc757dd5a0) at gsignal.c:3391
#70 0x00007f3f8e34f7b3 in clutter_actor_continue_paint
(self=3Dself&#64;entry=3D0x55eb41b4e750 [ShellGenericContainer]) at
clutter-actor.c:4018
#71 0x00007f3f8e3559bb in clutter_actor_paint (self=3Dself&#64;entry=3D0x55=
eb41b4e750
[ShellGenericContainer]) at clutter-actor.c:3938
#72 0x00007f3f8e355cd9 in clutter_actor_paint (self=3Dself&#64;entry=3D0x55=
eb41b4e750
[ShellGenericContainer]) at clutter-actor.c:3964
#73 0x00007f3f93e2aa00 in st_box_layout_paint (actor=3D&lt;optimized out&gt=
;) at
st/st-box-layout.c:428
#77 0x00007f3f8add843f in &lt;emit signal ??? on instance 0x55eb41a24010
[StBoxLayout]&gt; (instance=3Dinstance&#64;entry=3D0x55eb41a24010, signal_i=
d=3D&lt;optimized
out&gt;, detail=3Ddetail&#64;entry=3D0) at gsignal.c:3447
    #74 0x00007f3f8adbd33f in g_closure_invoke
(closure=3Dclosure&#64;entry=3D0x55eb410fca90, return_value=3Dreturn_value&=
#64;entry=3D0x0,
n_param_values=3D1, param_values=3Dparam_values&#64;entry=3D0x7ffc757dda20,
invocation_hint=3Dinvocation_hint&#64;entry=3D0x7ffc757dd9a0) at gclosure.c=
:804
    #75 0x00007f3f8adcf82d in signal_emit_unlocked_R
(node=3Dnode&#64;entry=3D0x55eb410fd790, detail=3Ddetail&#64;entry=3D0,
instance=3Dinstance&#64;entry=3D0x55eb41a24010,
emission_return=3Demission_return&#64;entry=3D0x0,
instance_and_params=3Dinstance_and_params&#64;entry=3D0x7ffc757dda20) at gs=
ignal.c:3673
    #76 0x00007f3f8add805f in g_signal_emit_valist (instance=3D&lt;optimize=
d out&gt;,
signal_id=3D&lt;optimized out&gt;, detail=3D&lt;optimized out&gt;,
var_args=3Dvar_args&#64;entry=3D0x7ffc757ddbe0) at gsignal.c:3391
#78 0x00007f3f8e34f7b3 in clutter_actor_continue_paint
(self=3Dself&#64;entry=3D0x55eb41a24010 [StBoxLayout]) at clutter-actor.c:4=
018
---Type &lt;return&gt; to continue, or q &lt;return&gt; to quit---
#79 0x00007f3f8e3559bb in clutter_actor_paint (self=3Dself&#64;entry=3D0x55=
eb41a24010
[StBoxLayout]) at clutter-actor.c:3938
#80 0x00007f3f8e355cd9 in clutter_actor_paint (self=3Dself&#64;entry=3D0x55=
eb41a24010
[StBoxLayout]) at clutter-actor.c:3964
#81 0x00007f3f93e20530 in shell_generic_container_paint (actor=3D0x55eb419e=
0540
[ShellGenericContainer]) at shell-generic-container.c:149
#85 0x00007f3f8add843f in &lt;emit signal ??? on instance 0x55eb419e0540
[ShellGenericContainer]&gt; (instance=3Dinstance&#64;entry=3D0x55eb419e0540,
signal_id=3D&lt;optimized out&gt;, detail=3Ddetail&#64;entry=3D0) at gsigna=
l.c:3447
    #82 0x00007f3f8adbd33f in g_closure_invoke
(closure=3Dclosure&#64;entry=3D0x55eb410fca90, return_value=3Dreturn_value&=
#64;entry=3D0x0,
n_param_values=3D1, param_values=3Dparam_values&#64;entry=3D0x7ffc757de010,
invocation_hint=3Dinvocation_hint&#64;entry=3D0x7ffc757ddf90) at gclosure.c=
:804
    #83 0x00007f3f8adcf82d in signal_emit_unlocked_R
(node=3Dnode&#64;entry=3D0x55eb410fd790, detail=3Ddetail&#64;entry=3D0,
instance=3Dinstance&#64;entry=3D0x55eb419e0540,
emission_return=3Demission_return&#64;entry=3D0x0,
instance_and_params=3Dinstance_and_params&#64;entry=3D0x7ffc757de010) at gs=
ignal.c:3673
    #84 0x00007f3f8add805f in g_signal_emit_valist (instance=3D&lt;optimize=
d out&gt;,
signal_id=3D&lt;optimized out&gt;, detail=3D&lt;optimized out&gt;,
var_args=3Dvar_args&#64;entry=3D0x7ffc757de1d0) at gsignal.c:3391
#86 0x00007f3f8e34f7b3 in clutter_actor_continue_paint
(self=3Dself&#64;entry=3D0x55eb419e0540 [ShellGenericContainer]) at
clutter-actor.c:4018
#87 0x00007f3f8e3559bb in clutter_actor_paint (self=3D0x55eb419e0540
[ShellGenericContainer]) at clutter-actor.c:3938
#88 0x00007f3f8e355cd9 in clutter_actor_paint (self=3D&lt;optimized out&gt;=
) at
clutter-actor.c:3964
#89 0x00007f3f8e3a83fa in clutter_stage_paint (self=3D&lt;optimized out&gt;=
) at
clutter-stage.c:710
#90 0x00007f3f8f2b62a6 in meta_stage_paint (actor=3D0x55eb40fb0760 [MetaSta=
ge])
at backends/meta-stage.c:141
#94 0x00007f3f8add843f in &lt;emit signal ??? on instance 0x55eb40fb0760
[MetaStage]&gt; (instance=3Dinstance&#64;entry=3D0x55eb40fb0760, signal_id=
=3D&lt;optimized
out&gt;, detail=3Ddetail&#64;entry=3D0) at gsignal.c:3447
    #91 0x00007f3f8adbd3e5 in g_closure_invoke
(closure=3Dclosure&#64;entry=3D0x55eb410fca90, return_value=3Dreturn_value&=
#64;entry=3D0x0,
n_param_values=3D1, param_values=3Dparam_values&#64;entry=3D0x7ffc757de680,
invocation_hint=3Dinvocation_hint&#64;entry=3D0x7ffc757de600) at gclosure.c=
:804
    #92 0x00007f3f8adcf82d in signal_emit_unlocked_R
(node=3Dnode&#64;entry=3D0x55eb410fd790, detail=3Ddetail&#64;entry=3D0,
instance=3Dinstance&#64;entry=3D0x55eb40fb0760,
emission_return=3Demission_return&#64;entry=3D0x0,
instance_and_params=3Dinstance_and_params&#64;entry=3D0x7ffc757de680) at gs=
ignal.c:3673
    #93 0x00007f3f8add805f in g_signal_emit_valist (instance=3D&lt;optimize=
d out&gt;,
signal_id=3D&lt;optimized out&gt;, detail=3D&lt;optimized out&gt;,
var_args=3Dvar_args&#64;entry=3D0x7ffc757de840) at gsignal.c:3391
#95 0x00007f3f8e34f7b3 in clutter_actor_continue_paint
(self=3Dself&#64;entry=3D0x55eb40fb0760 [MetaStage]) at clutter-actor.c:4018
#96 0x00007f3f8e3559bb in clutter_actor_paint (self=3Dself&#64;entry=3D0x55=
eb40fb0760
[MetaStage]) at clutter-actor.c:3938
#97 0x00007f3f8e355cd9 in clutter_actor_paint (self=3Dself&#64;entry=3D0x55=
eb40fb0760
[MetaStage]) at clutter-actor.c:3964
#98 0x00007f3f8e3ac4e5 in clutter_stage_do_paint_view
(stage=3Dstage&#64;entry=3D0x55eb40fb0760 [MetaStage], view=3Dview&#64;entr=
y=3D0x55eb41125140
[MetaRendererView], clip=3Dclip&#64;entry=3D0x7ffc757debe0) at clutter-stag=
e.c:678
#99 0x00007f3f8e3ac553 in _clutter_stage_paint_view
(stage=3Dstage&#64;entry=3D0x55eb40fb0760 [MetaStage], view=3Dview&#64;entr=
y=3D0x55eb41125140
[MetaRendererView], clip=3Dclip&#64;entry=3D0x7ffc757debe0) at clutter-stag=
e.c:694
#100 0x00007f3f8e341144 in paint_stage
(stage_cogl=3Dstage_cogl&#64;entry=3D0x55eb4110f860 [MetaStageNative],
view=3Dview&#64;entry=3D0x55eb41125140 [MetaRendererView],
clip=3Dclip&#64;entry=3D0x7ffc757debe0)
    at cogl/clutter-stage-cogl.c:422
#101 0x00007f3f8e3414ee in clutter_stage_cogl_redraw_view (view=3D0x55eb411=
25140
[MetaRendererView], stage_window=3D0x55eb4110f860) at
cogl/clutter-stage-cogl.c:667
#102 0x00007f3f8e3414ee in clutter_stage_cogl_redraw
(stage_window=3D0x55eb4110f860) at cogl/clutter-stage-cogl.c:783
#103 0x00007f3f8f3334ae in meta_stage_native_redraw
(stage_window=3D0x55eb4110f860) at backends/native/meta-stage-native.c:300
#104 0x00007f3f8e3a9357 in clutter_stage_do_redraw (stage=3D0x55eb40fb0760
[MetaStage]) at clutter-stage.c:1120
#105 0x00007f3f8e3a9357 in _clutter_stage_do_update (stage=3D0x55eb40fb0760
[MetaStage]) at clutter-stage.c:1176
#106 0x00007f3f8e394d49 in master_clock_update_stages
(master_clock=3D0x55eb41127ec0 [ClutterMasterClockDefault], stages=3D0x55eb=
439e4e80
=3D {...}) at clutter-master-clock-default.c:443
#107 0x00007f3f8e394d49 in clutter_clock_dispatch (source=3D&lt;optimized o=
ut&gt;,
callback=3D&lt;optimized out&gt;, user_data=3D&lt;optimized out&gt;) at
clutter-master-clock-default.c:567
#108 0x00007f3f8aae4e52 in g_main_dispatch (context=3D0x55eb40f9d730) at
gmain.c:3203
#109 0x00007f3f8aae4e52 in g_main_context_dispatch
(context=3Dcontext&#64;entry=3D0x55eb40f9d730) at gmain.c:3856
#110 0x00007f3f8aae51d0 in g_main_context_iterate (context=3D0x55eb40f9d730,
block=3Dblock&#64;entry=3D1, dispatch=3Ddispatch&#64;entry=3D1, self=3D&lt;=
optimized out&gt;) at
gmain.c:3929
#111 0x00007f3f8aae54f2 in g_main_loop_run (loop=3D0x55eb4112b990) at
gmain.c:4125
#112 0x00007f3f8f2e159c in meta_run () at core/main.c:572
#113 0x000055eb40aa1657 in main (argc=3D&lt;optimized out&gt;, argv=3D&lt;o=
ptimized out&gt;) at
main.c:471



According to the coredump, the memcpy in nouveau_scratch_data() is failing
because nv-&gt;scratch.map is invalid.

/usr/src/debug/mesa-13.0.4/src/gallium/drivers/nouveau/nouveau_buffer.c

/* Copy data to a scratch buffer and return address &amp; bo the data resid=
es in.
*/
uint64_t
nouveau_scratch_data(struct nouveau_context *nv,
                     const void *data, unsigned base, unsigned size,
                     struct nouveau_bo **bo)
{
   unsigned bgn =3D MAX2(base, nv-&gt;scratch.offset);
   unsigned end =3D bgn + size;

   if (end &gt;=3D nv-&gt;scratch.end) {
      end =3D base + size;
      if (!nouveau_scratch_more(nv, end))
         return 0;
      bgn =3D base;
   }
   nv-&gt;scratch.offset =3D align(end, 4);

   memcpy(nv-&gt;scratch.map + bgn, (const uint8_t *)data + base, size);

   *bo =3D nv-&gt;scratch.current;
   return (*bo)-&gt;offset + (bgn - base);
}


(gdb) print nv-&gt;scratch
$2 =3D {map =3D 0x7f3f25a9c000 &lt;error: Cannot access memory at address
0x7f3f25a9c000&gt;, id =3D 1, wrap =3D 1, offset =3D 177264, end =3D 209715=
2, bo =3D {0x0,
0x55eb433792e0, 0x0, 0x0}, current =3D 0x55eb433792e0,=20
  runout =3D 0x0, bo_size =3D 2097152}


The same 0x7f3f25a9c000 pointer value is also found in bo-&gt;map and
nv-&gt;scratch.current.map

(gdb) print bo-&gt;map
$6 =3D (void *) 0x7f3f25a9c000

(gdb) print nv-&gt;scratch.current.map
$9 =3D (void *) 0x7f3f25a9c000</pre>
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

--14911509131.c6DdBe2E.15119--

--===============0971124639==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0971124639==--
