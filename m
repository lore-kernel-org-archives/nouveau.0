From: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: Re: [PATCH 1/2] gallium: add
	PIPE_CAP_MIXED_FRAMEBUFFER_SIZES
Date: Sat, 12 Oct 2013 21:43:00 -0400
Message-ID: <CAKb7Uvgu7T=5pbfcR7xb_dF3gtj4oB4kpKzX37Jo5oO7r=-aUg@mail.gmail.com>
References: <1380875536-7271-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <mesa-dev-bounces+gcvmd-mesa3d-493=gmane.org@lists.freedesktop.org>
In-Reply-To: <1380875536-7271-1-git-send-email-imirkin@alum.mit.edu>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/mesa-dev>,
	<mailto:mesa-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/mesa-dev>
List-Post: <mailto:mesa-dev@lists.freedesktop.org>
List-Help: <mailto:mesa-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/mesa-dev>,
	<mailto:mesa-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: mesa-dev-bounces+gcvmd-mesa3d-493=gmane.org@lists.freedesktop.org
Errors-To: mesa-dev-bounces+gcvmd-mesa3d-493=gmane.org@lists.freedesktop.org
To: Christoph Bumiller <e0425955@student.tuwien.ac.at>, Ben Skeggs <bskeggs@redhat.com>
Cc: "mesa-dev@lists.freedesktop.org" <mesa-dev@lists.freedesktop.org>, "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>
List-Id: nouveau.vger.kernel.org

ping

On Fri, Oct 4, 2013 at 4:32 AM, Ilia Mirkin <imirkin@alum.mit.edu> wrote:
> This CAP will determine whether ARB_framebuffer_object can be enabled.
> The nv30 driver does not allow mixing swizzled and linear zsbuf/cbuf
> textures.
>
> Signed-off-by: Ilia Mirkin <imirkin@alum.mit.edu>
> ---
>  src/gallium/docs/source/screen.rst               | 3 +++
>  src/gallium/drivers/freedreno/freedreno_screen.c | 1 +
>  src/gallium/drivers/i915/i915_screen.c           | 1 +
>  src/gallium/drivers/ilo/ilo_screen.c             | 1 +
>  src/gallium/drivers/llvmpipe/lp_screen.c         | 1 +
>  src/gallium/drivers/nouveau/nv30/nv30_screen.c   | 1 +
>  src/gallium/drivers/nouveau/nv50/nv50_screen.c   | 1 +
>  src/gallium/drivers/nouveau/nvc0/nvc0_screen.c   | 1 +
>  src/gallium/drivers/r300/r300_screen.c           | 1 +
>  src/gallium/drivers/r600/r600_pipe.c             | 1 +
>  src/gallium/drivers/radeonsi/radeonsi_pipe.c     | 1 +
>  src/gallium/drivers/softpipe/sp_screen.c         | 1 +
>  src/gallium/drivers/svga/svga_screen.c           | 1 +
>  src/gallium/include/pipe/p_defines.h             | 3 ++-
>  14 files changed, 17 insertions(+), 1 deletion(-)
>
> diff --git a/src/gallium/docs/source/screen.rst b/src/gallium/docs/source/screen.rst
> index d19cd1a..a01f548 100644
> --- a/src/gallium/docs/source/screen.rst
> +++ b/src/gallium/docs/source/screen.rst
> @@ -173,6 +173,9 @@ The integer capabilities:
>    viewport/scissor combination.
>  * ''PIPE_CAP_ENDIANNESS``:: The endianness of the device.  Either
>    PIPE_ENDIAN_BIG or PIPE_ENDIAN_LITTLE.
> +* ``PIPE_CAP_MIXED_FRAMEBUFFER_SIZES``: Whether it is allowed to have
> +  different sizes for fb color/zs attachments. This controls whether
> +  ARB_framebuffer_object is provided.
>
>
>  .. _pipe_capf:
> diff --git a/src/gallium/drivers/freedreno/freedreno_screen.c b/src/gallium/drivers/freedreno/freedreno_screen.c
> index a038a77..7d0fb3b 100644
> --- a/src/gallium/drivers/freedreno/freedreno_screen.c
> +++ b/src/gallium/drivers/freedreno/freedreno_screen.c
> @@ -140,6 +140,7 @@ fd_screen_get_param(struct pipe_screen *pscreen, enum pipe_cap param)
>         switch (param) {
>         /* Supported features (boolean caps). */
>         case PIPE_CAP_NPOT_TEXTURES:
> +       case PIPE_CAP_MIXED_FRAMEBUFFER_SIZES:
>         case PIPE_CAP_TWO_SIDED_STENCIL:
>         case PIPE_CAP_ANISOTROPIC_FILTER:
>         case PIPE_CAP_POINT_SPRITE:
> diff --git a/src/gallium/drivers/i915/i915_screen.c b/src/gallium/drivers/i915/i915_screen.c
> index 556dda8..77607d0 100644
> --- a/src/gallium/drivers/i915/i915_screen.c
> +++ b/src/gallium/drivers/i915/i915_screen.c
> @@ -172,6 +172,7 @@ i915_get_param(struct pipe_screen *screen, enum pipe_cap cap)
>     /* Supported features (boolean caps). */
>     case PIPE_CAP_ANISOTROPIC_FILTER:
>     case PIPE_CAP_NPOT_TEXTURES:
> +   case PIPE_CAP_MIXED_FRAMEBUFFER_SIZES:
>     case PIPE_CAP_POINT_SPRITE:
>     case PIPE_CAP_PRIMITIVE_RESTART: /* draw module */
>     case PIPE_CAP_TEXTURE_SHADOW_MAP:
> diff --git a/src/gallium/drivers/ilo/ilo_screen.c b/src/gallium/drivers/ilo/ilo_screen.c
> index 3f8d431..ddf11ff 100644
> --- a/src/gallium/drivers/ilo/ilo_screen.c
> +++ b/src/gallium/drivers/ilo/ilo_screen.c
> @@ -286,6 +286,7 @@ ilo_get_param(struct pipe_screen *screen, enum pipe_cap param)
>
>     switch (param) {
>     case PIPE_CAP_NPOT_TEXTURES:
> +   case PIPE_CAP_MIXED_FRAMEBUFFER_SIZES:
>     case PIPE_CAP_TWO_SIDED_STENCIL:
>        return true;
>     case PIPE_CAP_MAX_DUAL_SOURCE_RENDER_TARGETS:
> diff --git a/src/gallium/drivers/llvmpipe/lp_screen.c b/src/gallium/drivers/llvmpipe/lp_screen.c
> index b3cd77f..2bbc2c9 100644
> --- a/src/gallium/drivers/llvmpipe/lp_screen.c
> +++ b/src/gallium/drivers/llvmpipe/lp_screen.c
> @@ -109,6 +109,7 @@ llvmpipe_get_param(struct pipe_screen *screen, enum pipe_cap param)
>     case PIPE_CAP_MAX_COMBINED_SAMPLERS:
>        return 2 * PIPE_MAX_SAMPLERS;  /* VS + FS samplers */
>     case PIPE_CAP_NPOT_TEXTURES:
> +   case PIPE_CAP_MIXED_FRAMEBUFFER_SIZES:
>        return 1;
>     case PIPE_CAP_TWO_SIDED_STENCIL:
>        return 1;
> diff --git a/src/gallium/drivers/nouveau/nv30/nv30_screen.c b/src/gallium/drivers/nouveau/nv30/nv30_screen.c
> index 50ddfec..807100e 100644
> --- a/src/gallium/drivers/nouveau/nv30/nv30_screen.c
> +++ b/src/gallium/drivers/nouveau/nv30/nv30_screen.c
> @@ -125,6 +125,7 @@ nv30_screen_get_param(struct pipe_screen *pscreen, enum pipe_cap param)
>     case PIPE_CAP_QUERY_PIPELINE_STATISTICS:
>     case PIPE_CAP_TEXTURE_BORDER_COLOR_QUIRK:
>     case PIPE_CAP_MAX_TEXTURE_BUFFER_SIZE:
> +   case PIPE_CAP_MIXED_FRAMEBUFFER_SIZES:
>        return 0;
>     case PIPE_CAP_VERTEX_BUFFER_OFFSET_4BYTE_ALIGNED_ONLY:
>     case PIPE_CAP_VERTEX_BUFFER_STRIDE_4BYTE_ALIGNED_ONLY:
> diff --git a/src/gallium/drivers/nouveau/nv50/nv50_screen.c b/src/gallium/drivers/nouveau/nv50/nv50_screen.c
> index f454ec7..43a2d96 100644
> --- a/src/gallium/drivers/nouveau/nv50/nv50_screen.c
> +++ b/src/gallium/drivers/nouveau/nv50/nv50_screen.c
> @@ -103,6 +103,7 @@ nv50_screen_get_param(struct pipe_screen *pscreen, enum pipe_cap param)
>     case PIPE_CAP_TEXTURE_SWIZZLE:
>     case PIPE_CAP_TEXTURE_SHADOW_MAP:
>     case PIPE_CAP_NPOT_TEXTURES:
> +   case PIPE_CAP_MIXED_FRAMEBUFFER_SIZES:
>     case PIPE_CAP_ANISOTROPIC_FILTER:
>     case PIPE_CAP_SCALED_RESOLVE:
>     case PIPE_CAP_TEXTURE_BUFFER_OBJECTS:
> diff --git a/src/gallium/drivers/nouveau/nvc0/nvc0_screen.c b/src/gallium/drivers/nouveau/nvc0/nvc0_screen.c
> index ff7890b..253ee79 100644
> --- a/src/gallium/drivers/nouveau/nvc0/nvc0_screen.c
> +++ b/src/gallium/drivers/nouveau/nvc0/nvc0_screen.c
> @@ -88,6 +88,7 @@ nvc0_screen_get_param(struct pipe_screen *pscreen, enum pipe_cap param)
>     case PIPE_CAP_TEXTURE_SWIZZLE:
>     case PIPE_CAP_TEXTURE_SHADOW_MAP:
>     case PIPE_CAP_NPOT_TEXTURES:
> +   case PIPE_CAP_MIXED_FRAMEBUFFER_SIZES:
>     case PIPE_CAP_ANISOTROPIC_FILTER:
>     case PIPE_CAP_SEAMLESS_CUBE_MAP:
>     case PIPE_CAP_CUBE_MAP_ARRAY:
> diff --git a/src/gallium/drivers/r300/r300_screen.c b/src/gallium/drivers/r300/r300_screen.c
> index dd036fc..7d7efca 100644
> --- a/src/gallium/drivers/r300/r300_screen.c
> +++ b/src/gallium/drivers/r300/r300_screen.c
> @@ -89,6 +89,7 @@ static int r300_get_param(struct pipe_screen* pscreen, enum pipe_cap param)
>      switch (param) {
>          /* Supported features (boolean caps). */
>          case PIPE_CAP_NPOT_TEXTURES:
> +        case PIPE_CAP_MIXED_FRAMEBUFFER_SIZES:
>          case PIPE_CAP_TWO_SIDED_STENCIL:
>          case PIPE_CAP_ANISOTROPIC_FILTER:
>          case PIPE_CAP_POINT_SPRITE:
> diff --git a/src/gallium/drivers/r600/r600_pipe.c b/src/gallium/drivers/r600/r600_pipe.c
> index e091b08..ba436b6 100644
> --- a/src/gallium/drivers/r600/r600_pipe.c
> +++ b/src/gallium/drivers/r600/r600_pipe.c
> @@ -466,6 +466,7 @@ static int r600_get_param(struct pipe_screen* pscreen, enum pipe_cap param)
>         switch (param) {
>         /* Supported features (boolean caps). */
>         case PIPE_CAP_NPOT_TEXTURES:
> +       case PIPE_CAP_MIXED_FRAMEBUFFER_SIZES:
>         case PIPE_CAP_TWO_SIDED_STENCIL:
>         case PIPE_CAP_ANISOTROPIC_FILTER:
>         case PIPE_CAP_POINT_SPRITE:
> diff --git a/src/gallium/drivers/radeonsi/radeonsi_pipe.c b/src/gallium/drivers/radeonsi/radeonsi_pipe.c
> index c3250e4..d1706d6 100644
> --- a/src/gallium/drivers/radeonsi/radeonsi_pipe.c
> +++ b/src/gallium/drivers/radeonsi/radeonsi_pipe.c
> @@ -375,6 +375,7 @@ static int r600_get_param(struct pipe_screen* pscreen, enum pipe_cap param)
>         case PIPE_CAP_USER_CONSTANT_BUFFERS:
>         case PIPE_CAP_START_INSTANCE:
>         case PIPE_CAP_NPOT_TEXTURES:
> +       case PIPE_CAP_MIXED_FRAMEBUFFER_SIZES:
>          case PIPE_CAP_PREFER_BLIT_BASED_TEXTURE_TRANSFER:
>         case PIPE_CAP_TGSI_INSTANCEID:
>         case PIPE_CAP_COMPUTE:
> diff --git a/src/gallium/drivers/softpipe/sp_screen.c b/src/gallium/drivers/softpipe/sp_screen.c
> index 4762ac3..47ef20e 100644
> --- a/src/gallium/drivers/softpipe/sp_screen.c
> +++ b/src/gallium/drivers/softpipe/sp_screen.c
> @@ -69,6 +69,7 @@ softpipe_get_param(struct pipe_screen *screen, enum pipe_cap param)
>     case PIPE_CAP_MAX_COMBINED_SAMPLERS:
>        return 2 * PIPE_MAX_SAMPLERS;  /* VS + FS */
>     case PIPE_CAP_NPOT_TEXTURES:
> +   case PIPE_CAP_MIXED_FRAMEBUFFER_SIZES:
>        return 1;
>     case PIPE_CAP_TWO_SIDED_STENCIL:
>        return 1;
> diff --git a/src/gallium/drivers/svga/svga_screen.c b/src/gallium/drivers/svga/svga_screen.c
> index a1108c6..8f3d692 100644
> --- a/src/gallium/drivers/svga/svga_screen.c
> +++ b/src/gallium/drivers/svga/svga_screen.c
> @@ -141,6 +141,7 @@ svga_get_param(struct pipe_screen *screen, enum pipe_cap param)
>     case PIPE_CAP_MAX_COMBINED_SAMPLERS:
>        return 16;
>     case PIPE_CAP_NPOT_TEXTURES:
> +   case PIPE_CAP_MIXED_FRAMEBUFFER_SIZES:
>        return 1;
>     case PIPE_CAP_TWO_SIDED_STENCIL:
>        return 1;
> diff --git a/src/gallium/include/pipe/p_defines.h b/src/gallium/include/pipe/p_defines.h
> index 63869c9..db6db32 100644
> --- a/src/gallium/include/pipe/p_defines.h
> +++ b/src/gallium/include/pipe/p_defines.h
> @@ -512,7 +512,8 @@ enum pipe_cap {
>     PIPE_CAP_TEXTURE_BORDER_COLOR_QUIRK = 82,
>     PIPE_CAP_MAX_TEXTURE_BUFFER_SIZE = 83,
>     PIPE_CAP_MAX_VIEWPORTS = 84,
> -   PIPE_CAP_ENDIANNESS = 85
> +   PIPE_CAP_ENDIANNESS = 85,
> +   PIPE_CAP_MIXED_FRAMEBUFFER_SIZES = 86
>  };
>
>  #define PIPE_QUIRK_TEXTURE_BORDER_COLOR_SWIZZLE_NV50 (1 << 0)
> --
> 1.8.1.5
>
