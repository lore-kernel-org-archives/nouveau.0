From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: [PATCH 00/19] nv50: add sampler2DMS/GP support to get
	OpenGL 3.2
Date: Wed, 15 Jan 2014 15:07:37 -0500
Message-ID: <CAKb7UvjmkN9_2YvGLgyyqoK65kG9Csc6+cu0Ci_1m96srYkJVA@mail.gmail.com>
References: <1389640775-25046-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1389640775-25046-1-git-send-email-imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: "mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Cc: Bryan Cain <bryancain3-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Mon, Jan 13, 2014 at 2:19 PM, Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> wrote:
> OK, so there's a bunch of stuff in here. The geometry stuff is based on the
> work started by Bryan Cain and Christoph Bumiller.
>
> Patches 01-12: Add support for geometry shaders and fix related issues
> Patches 13-14: Make it possible for fb clears to operate on texture attachments
>                with an explicit layer set (as is allowed in gl 3.2).
> Patches 15-17: Make ARB_texture_multisample work
> Patch      18: Enable GLSL 1.50
> Patch      19: Turn on ARB_seamless_cube_map irrespective of HW support so that                all nv50 cards can get OpenGL 3.2 and geometry shaders (which
>                are otherwise unsupported)
>
> There are still a few geometry-related piglits that fail -- specifically:
>   primitive-id-no-gs
>   gl-3.2-layered-rendering-gl-layer*

For those who care, these should now be fixed in my github repo as
well. I won't repost the full series, as these are just incremental
patches, but you can see them at:

https://github.com/imirkin/mesa/commit/5eb4ad1115d0c4cb9f06a5ebb19501c1afc433bd
https://github.com/imirkin/mesa/commit/fcd6a8661ba9ac19faf205a2025b001bb31146a8

The nv50-gs branch now also contains Christoph Bumiller's patches from
late December which effectively allow us to enable GL3.3.

>
> I need to trace the blob to figure out exactly how to configure the HW for
> those situations, but I suspect that the fixes will be fairly small and
> self-contained.
>
> Note that there are also a bunch of EXT_framebuffer_multisample tests that are
> failing, but that has nothing to do with these changes. There's something
> wrong with the blit_3d function, at the very least to do with depth/stencil,
> but also some color tests fail as well.
>
> These patches are available at https://github.com/imirkin/mesa.git nv50-gs
> or https://github.com/imirkin/mesa/commits/nv50-gs for those who prefer a
> web ui.
>
> Bryan Cain (2):
>   nv50/ir: delay calculation of indirect addresses
>   nv50: add support for geometry shaders
>
> Christoph Bumiller (1):
>   nv50/ir: fix PFETCH and add RDSV to get VSTRIDE for GPs
>
> Ilia Mirkin (16):
>   nv50: allow vert_count to be >255
>   nv50/ir: disallow predicates on emit/restart ops
>   nv50/ir: disallow shader input propagation for gp
>   nv50/ir: comment out code to allow input/immed loads
>   nv50/ir: add support for gl_PrimitiveIDIn
>   nv50: properly set the PRIMITIVE_ID enable flag when it is a gp input.
>   nv50: VP_RESULT_MAP_SIZE has to be positive
>   nv50: GP_REG_ALLOC_RESULT must be positive
>   nv50: allocate an extra code bo to avoid dmesg spam
>   nv50: don't forget to also clear additional layers
>   nvc0: don't forget to also clear additional layers
>   nv50: add comments about CB_AUX contents
>   nv50: copy nvc0's get_sample_position implementation
>   nv50: add support for textureFetch'ing MS textures,
>     ARB_texture_multisample
>   nv50: report glsl 1.50 now that gp tests pass
>   nv50: enable seamless cube maps on all hw for OpenGL 3.2
>
>  src/gallium/drivers/nouveau/codegen/nv50_ir.h      |   9 ++
>  .../drivers/nouveau/codegen/nv50_ir_emit_nv50.cpp  |  92 ++++++++++--
>  .../drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp  |  41 ++++--
>  .../nouveau/codegen/nv50_ir_lowering_nv50.cpp      | 164 ++++++++++++++++++++-
>  .../nouveau/codegen/nv50_ir_lowering_nvc0.cpp      |   7 +
>  .../drivers/nouveau/codegen/nv50_ir_print.cpp      |   1 +
>  .../nouveau/codegen/nv50_ir_target_nv50.cpp        |  18 ++-
>  src/gallium/drivers/nouveau/nv50/nv50_context.c    |  46 ++++++
>  src/gallium/drivers/nouveau/nv50/nv50_context.h    |  17 +++
>  src/gallium/drivers/nouveau/nv50/nv50_program.c    |  30 +++-
>  src/gallium/drivers/nouveau/nv50/nv50_program.h    |   2 +-
>  src/gallium/drivers/nouveau/nv50/nv50_screen.c     |  23 ++-
>  .../drivers/nouveau/nv50/nv50_shader_state.c       |   6 +
>  .../drivers/nouveau/nv50/nv50_state_validate.c     |   2 +-
>  src/gallium/drivers/nouveau/nv50/nv50_surface.c    |  25 ++--
>  src/gallium/drivers/nouveau/nv50/nv50_tex.c        |  77 +++++++++-
>  src/gallium/drivers/nouveau/nvc0/nvc0_surface.c    |  22 ++-
>  17 files changed, 526 insertions(+), 56 deletions(-)
>
> --
> 1.8.3.2
>
