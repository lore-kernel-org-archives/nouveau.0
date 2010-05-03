From: =?ISO-8859-1?Q?Jos=E9?= Fonseca <jfonseca@vmware.com>
Subject: Re: [Mesa3d-dev] _mesa_init_texture_s3tc() vs
 util_format_s3tc_init()
Date: Mon, 03 May 2010 12:57:12 +0100
Message-ID: <1272887832.15272.624.camel@jfonseca-laptop.eng.vmware.com>
References: <q2xb67489df1005030136k889d7b6fg51c4a3961f052787@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable
Return-path: <mesa3d-dev-bounces@lists.sourceforge.net>
In-Reply-To: <q2xb67489df1005030136k889d7b6fg51c4a3961f052787@mail.gmail.com>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/mesa3d-dev>,
	<mailto:mesa3d-dev-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=mesa3d-dev>
List-Post: <mailto:mesa3d-dev@lists.sourceforge.net>
List-Help: <mailto:mesa3d-dev-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/mesa3d-dev>,
	<mailto:mesa3d-dev-request@lists.sourceforge.net?subject=subscribe>
Errors-To: mesa3d-dev-bounces@lists.sourceforge.net
To: Xavier Chantry <chantry.xavier@gmail.com>
Cc: nouveau <Nouveau@lists.freedesktop.org>, mesa3d-dev <mesa3d-dev@lists.sourceforge.net>
List-Id: nouveau.vger.kernel.org

On Mon, 2010-05-03 at 01:36 -0700, Xavier Chantry wrote:
> I am trying to understand the s3tc init code as nv50 gallium has a
> problem with that.
> =

> It looks like some drivers (r300g and llvmpipe) actually inits s3tc in
> two places :
> ./src/mesa/main/texcompress_s3tc.c _mesa_init_texture_s3tc()
> ./src/gallium/auxiliary/util/u_format_s3tc.c util_format_s3tc_init()
> =

> Here is an extract of the backtrace calls while loading fgfs on llvmpipe :
> driCreateScreen -> llvmpipe_create_screen -> util_format_s3tc_init
> driCreateContext -> st_create_context -> _mesa_create_context_for_api
> -> init_attrib_groups -> _mesa_init_texture_s3tc
>
> These two functions seem to do more or less the same job, and
> apparently, the classic mesa init is unused for a gallium driver.
> So I suppose that init is not necessary, but it happens because
> gallium and mesa are tightly tied together, and create context is
> handled similarly, but it shouldn't hurt ?

Both inits are necessary. The same .so is used for both paths, but given
that gallium and mesa do not depend on each other that's the way to do
it. Gallium and mesa also have seperate format translation functions.

At least until we start factoring code into a separate library. (I said
I'd do it, but stuff came up and I couldn't do when I thought, and I
don't know when I'll be able to do it...)

> Additionally r300g and llvmpipe added util_format_s3tc_init to their
> create_screen functions, and util/u_format_s3tc.c apparently contains
> all the functions that a gallium driver uses.
> So I suppose that nvfx and nv50 should do the same ?
> =

> If that's correct, the patch below might not be completely wrong.
> =

> On Mon, May 3, 2010 at 12:44 AM, Xavier Chantry
> <chantry.xavier@gmail.com> wrote:
> > flightgear now dies with :
> > Mesa warning: external dxt library not available: texstore_rgba_dxt3
> > util/u_format_s3tc.c:66:util_format_dxt3_rgba_fetch_stub: Assertion `0'=
 failed.
> >
> > I don't really understand what these stubs are about, they were
> > introduced by following commit :
> > commit d96e87c3c513f8ed350ae24425edb74b6d6fcc13
> > Author: Jos=E9 Fonseca <jfonseca@vmware.com>
> > Date:   Wed Apr 7 20:47:38 2010 +0100
> >
> >    util: Use stubs for the dynamically loaded S3TC functions.
> >
> >    Loosely based on Luca Barbieri's commit
> >    52e9b990a192a9329006d5f7dd2ac222effea5a5.
> >
> > Looking at llvm and r300 code and trying to guess, I came up with the
> > following patch that allows flightgear to start again. But I don't
> > really understand that stuff so it could be wrong.
> > nvfx is probably affected as well.
> >
> >
> > diff --git a/src/gallium/drivers/nouveau/nouveau_screen.c
> > b/src/gallium/drivers/nouveau/nouveau_screen.c
> > index 233a91a..a91b00b 100644
> > --- a/src/gallium/drivers/nouveau/nouveau_screen.c
> > +++ b/src/gallium/drivers/nouveau/nouveau_screen.c
> > @@ -5,6 +5,7 @@
> >  #include "util/u_memory.h"
> >  #include "util/u_inlines.h"
> >  #include "util/u_format.h"
> > +#include "util/u_format_s3tc.h"
> >
> >  #include <stdio.h>
> >  #include <errno.h>
> > @@ -248,6 +249,8 @@ nouveau_screen_init(struct nouveau_screen *screen,
> > struct nouveau_device *dev)
> >        pscreen->fence_signalled =3D nouveau_screen_fence_signalled;
> >        pscreen->fence_finish =3D nouveau_screen_fence_finish;
> >
> > +       util_format_s3tc_init();
> > +
> >        return 0;
> >  }
> >
> > diff --git a/src/gallium/drivers/nv50/nv50_screen.c
> > b/src/gallium/drivers/nv50/nv50_screen.c
> > index 2dd1042..0d74c90 100644
> > --- a/src/gallium/drivers/nv50/nv50_screen.c
> > +++ b/src/gallium/drivers/nv50/nv50_screen.c
> > @@ -20,6 +20,7 @@
> >  * SOFTWARE.
> >  */
> >
> > +#include "util/u_format_s3tc.h"
> >  #include "pipe/p_screen.h"
> >
> >  #include "nv50_context.h"
> > @@ -72,10 +73,6 @@ nv50_screen_is_format_supported(struct pipe_screen *=
pscreen,
> >                case PIPE_FORMAT_A8_UNORM:
> >                case PIPE_FORMAT_I8_UNORM:
> >                case PIPE_FORMAT_L8A8_UNORM:
> > -               case PIPE_FORMAT_DXT1_RGB:
> > -               case PIPE_FORMAT_DXT1_RGBA:
> > -               case PIPE_FORMAT_DXT3_RGBA:
> > -               case PIPE_FORMAT_DXT5_RGBA:
> >                case PIPE_FORMAT_S8_USCALED_Z24_UNORM:
> >                case PIPE_FORMAT_Z24_UNORM_S8_USCALED:
> >                case PIPE_FORMAT_Z32_FLOAT:
> > @@ -85,6 +82,11 @@ nv50_screen_is_format_supported(struct pipe_screen *=
pscreen,
> >                case PIPE_FORMAT_R16G16_SNORM:
> >                case PIPE_FORMAT_R16G16_UNORM:
> >                        return TRUE;
> > +               case PIPE_FORMAT_DXT1_RGB:
> > +               case PIPE_FORMAT_DXT1_RGBA:
> > +               case PIPE_FORMAT_DXT3_RGBA:
> > +               case PIPE_FORMAT_DXT5_RGBA:
> > +                       return util_format_s3tc_enabled;
> >                default:
> >                        break;
> >                }
> >

You should only advertise PIPE_FORMAT_DXT* for BIND_SAMPLER_VIEW, or you
may end up in very weird paths. Same for YUV.

Jose


---------------------------------------------------------------------------=
---
