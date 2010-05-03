From: Xavier Chantry <chantry.xavier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: _mesa_init_texture_s3tc() vs util_format_s3tc_init()
Date: Mon, 3 May 2010 10:36:22 +0200
Message-ID: <q2xb67489df1005030136k889d7b6fg51c4a3961f052787@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
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
To: nouveau <Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, mesa3d-dev <mesa3d-dev-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Id: nouveau.vger.kernel.org

I am trying to understand the s3tc init code as nv50 gallium has a
problem with that.

It looks like some drivers (r300g and llvmpipe) actually inits s3tc in
two places :
./src/mesa/main/texcompress_s3tc.c _mesa_init_texture_s3tc()
./src/gallium/auxiliary/util/u_format_s3tc.c util_format_s3tc_init()

Here is an extract of the backtrace calls while loading fgfs on llvmpipe :
driCreateScreen -> llvmpipe_create_screen -> util_format_s3tc_init
driCreateContext -> st_create_context -> _mesa_create_context_for_api
-> init_attrib_groups -> _mesa_init_texture_s3tc

These two functions seem to do more or less the same job, and
apparently, the classic mesa init is unused for a gallium driver.
So I suppose that init is not necessary, but it happens because
gallium and mesa are tightly tied together, and create context is
handled similarly, but it shouldn't hurt ?

Additionally r300g and llvmpipe added util_format_s3tc_init to their
create_screen functions, and util/u_format_s3tc.c apparently contains
all the functions that a gallium driver uses.
So I suppose that nvfx and nv50 should do the same ?

If that's correct, the patch below might not be completely wrong.

On Mon, May 3, 2010 at 12:44 AM, Xavier Chantry
<chantry.xavier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> flightgear now dies with :
> Mesa warning: external dxt library not available: texstore_rgba_dxt3
> util/u_format_s3tc.c:66:util_format_dxt3_rgba_fetch_stub: Assertion `0' f=
ailed.
>
> I don't really understand what these stubs are about, they were
> introduced by following commit :
> commit d96e87c3c513f8ed350ae24425edb74b6d6fcc13
> Author: Jos=E9 Fonseca <jfonseca-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org>
> Date: =A0 Wed Apr 7 20:47:38 2010 +0100
>
> =A0 =A0util: Use stubs for the dynamically loaded S3TC functions.
>
> =A0 =A0Loosely based on Luca Barbieri's commit
> =A0 =A052e9b990a192a9329006d5f7dd2ac222effea5a5.
>
> Looking at llvm and r300 code and trying to guess, I came up with the
> following patch that allows flightgear to start again. But I don't
> really understand that stuff so it could be wrong.
> nvfx is probably affected as well.
>
>
> diff --git a/src/gallium/drivers/nouveau/nouveau_screen.c
> b/src/gallium/drivers/nouveau/nouveau_screen.c
> index 233a91a..a91b00b 100644
> --- a/src/gallium/drivers/nouveau/nouveau_screen.c
> +++ b/src/gallium/drivers/nouveau/nouveau_screen.c
> @@ -5,6 +5,7 @@
> =A0#include "util/u_memory.h"
> =A0#include "util/u_inlines.h"
> =A0#include "util/u_format.h"
> +#include "util/u_format_s3tc.h"
>
> =A0#include <stdio.h>
> =A0#include <errno.h>
> @@ -248,6 +249,8 @@ nouveau_screen_init(struct nouveau_screen *screen,
> struct nouveau_device *dev)
> =A0 =A0 =A0 =A0pscreen->fence_signalled =3D nouveau_screen_fence_signalle=
d;
> =A0 =A0 =A0 =A0pscreen->fence_finish =3D nouveau_screen_fence_finish;
>
> + =A0 =A0 =A0 util_format_s3tc_init();
> +
> =A0 =A0 =A0 =A0return 0;
> =A0}
>
> diff --git a/src/gallium/drivers/nv50/nv50_screen.c
> b/src/gallium/drivers/nv50/nv50_screen.c
> index 2dd1042..0d74c90 100644
> --- a/src/gallium/drivers/nv50/nv50_screen.c
> +++ b/src/gallium/drivers/nv50/nv50_screen.c
> @@ -20,6 +20,7 @@
> =A0* SOFTWARE.
> =A0*/
>
> +#include "util/u_format_s3tc.h"
> =A0#include "pipe/p_screen.h"
>
> =A0#include "nv50_context.h"
> @@ -72,10 +73,6 @@ nv50_screen_is_format_supported(struct pipe_screen *ps=
creen,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0case PIPE_FORMAT_A8_UNORM:
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0case PIPE_FORMAT_I8_UNORM:
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0case PIPE_FORMAT_L8A8_UNORM:
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 case PIPE_FORMAT_DXT1_RGB:
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 case PIPE_FORMAT_DXT1_RGBA:
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 case PIPE_FORMAT_DXT3_RGBA:
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 case PIPE_FORMAT_DXT5_RGBA:
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0case PIPE_FORMAT_S8_USCALED_Z24_UNORM:
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0case PIPE_FORMAT_Z24_UNORM_S8_USCALED:
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0case PIPE_FORMAT_Z32_FLOAT:
> @@ -85,6 +82,11 @@ nv50_screen_is_format_supported(struct pipe_screen *ps=
creen,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0case PIPE_FORMAT_R16G16_SNORM:
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0case PIPE_FORMAT_R16G16_UNORM:
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return TRUE;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 case PIPE_FORMAT_DXT1_RGB:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 case PIPE_FORMAT_DXT1_RGBA:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 case PIPE_FORMAT_DXT3_RGBA:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 case PIPE_FORMAT_DXT5_RGBA:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return util_format_s3tc_ena=
bled;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0default:
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0break;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
>
