From: Julien PUYDT <julien.puydt-QFKgK+z4sOrR7s880joybQ@public.gmane.org>
Subject: Re: About nVidia 8600M GS (10de:0425 (rev a1))
Date: Sun, 23 Sep 2007 10:07:14 +0200
Message-ID: <46F61EB2.3020808@laposte.net>
References: <46F3A7F2.1010007@laposte.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <46F3A7F2.1010007-QFKgK+z4sOrR7s880joybQ@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Julien PUYDT a =E9crit :
> PS1: nvidia-glx isn't abi-compatible with my xserver, so I can't provide =

> renouveau dumps at the moment.

Now I could try renouveau ; I fetched the cvs, compiled, ran, but it =

made the box reboot at one point ; here is the list of obtained files =

and their sizes -- perhaps it will help know when the crash happened :
$ ls *txt -l | awk '{ print $5 "\t" $8 }'
9603    card_10de-0425_test_alpha.txt
129978  card_10de-0425_test_arb_fragment_program.txt
6984    card_10de-0425_test_arb_imaging.txt
16632   card_10de-0425_test_arb_multitexture.txt
23793   card_10de-0425_test_arb_occlusion_query.txt
2669    card_10de-0425_test_arb_point_parameters.txt
5628    card_10de-0425_test_arb_point_sprite.txt
5454    card_10de-0425_test_arb_texture_cube_map.txt
7392    card_10de-0425_test_arb_vertex_buffer_object.txt
230769  card_10de-0425_test_arb_vertex_program.txt
19407   card_10de-0425_test_blend.txt
11247   card_10de-0425_test_clear.txt
8776    card_10de-0425_test_clip_plane.txt
20662   card_10de-0425_test_color_mask.txt
23399   card_10de-0425_test_color_material.txt
14675   card_10de-0425_test_cull_face.txt
1162    card_10de-0425_test_default.txt
17063   card_10de-0425_test_depth.txt
4179    card_10de-0425_test_display_list.txt
23516   card_10de-0425_test_draw_buffer.txt
7850    card_10de-0425_test_draw_pixels.txt
49967   card_10de-0425_test_enables.txt
4897    card_10de-0425_test_ext_blend_equation_separate.txt
2499    card_10de-0425_test_ext_blend_func_separate.txt
2610    card_10de-0425_test_ext_fog_coord.txt
0       card_10de-0425_test_ext_framebuffer_object.txt
0       card_10de-0425_test_ext_stencil_two_side.txt
0       card_10de-0425_test_ext_texture_filter_anisotropic.txt
5452    card_10de-0425_test_fog_hint.txt
6918    card_10de-0425_test_fog.txt
1986    card_10de-0425_test_front_face.txt
0       card_10de-0425_test_glsl_vp.txt
12461   card_10de-0425_test_light_single.txt
28411   card_10de-0425_test_lights.txt
1783    card_10de-0425_test_light_two_sides.txt
5987    card_10de-0425_test_line_hint.txt
2222    card_10de-0425_test_line_stipple.txt
12251   card_10de-0425_test_line_width.txt
164450  card_10de-0425_test_logic_op.txt
4717    card_10de-0425_test_matrix.txt
0       card_10de-0425_test_nv_fence.txt
0       card_10de-0425_test_nv_fog_distance.txt
0       card_10de-0425_test_nv_fragment_program2.txt
0       card_10de-0425_test_nv_fragment_program.txt
0       card_10de-0425_test_nv_point_sprite.txt
0       card_10de-0425_test_nv_register_combiners2.txt
0       card_10de-0425_test_nv_register_combiners_num.txt
0       card_10de-0425_test_nv_register_combiners.txt
0       card_10de-0425_test_nv_texture_env_combine4.txt
0       card_10de-0425_test_nv_texture_rectangle.txt
0       card_10de-0425_test_nv_texture_shader.txt
0       card_10de-0425_test_nv_vertex_program1_1.txt
0       card_10de-0425_test_nv_vertex_program2.txt
2977    card_10de-0425_test_point_size.txt
15722   card_10de-0425_test_polygon_mode.txt
14412   card_10de-0425_test_polygon_offset.txt
76571   card_10de-0425_test_polygon_stipple.txt
18880   card_10de-0425_test_primitives.txt
14313   card_10de-0425_test_render_mode.txt
1532    card_10de-0425_test_scissor.txt
0       card_10de-0425_test_sgis_generate_mipmap.txt
5999    card_10de-0425_test_shade_model.txt
5569    card_10de-0425_test_single_vertex.txt
26729   card_10de-0425_test_startup.txt
2237    card_10de-0425_test_stencil.txt
16349   card_10de-0425_test_texture_3d.txt
4301    card_10de-0425_test_texture_border.txt
7937    card_10de-0425_test_texture_filter.txt
95566   card_10de-0425_test_texture_format.txt
14380   card_10de-0425_test_texture_wrap.txt
5933    card_10de-0425_test_tex.txt
6203    card_10de-0425_test_viewport.txt
922     card_mappings.txt
0       card_objects.txt
0       card_stdout.txt
1558    license.txt

Hope it helps,

Snark
