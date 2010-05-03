From: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Mesa3d-dev] _mesa_init_texture_s3tc() vs
	util_format_s3tc_init()
Date: Mon, 3 May 2010 14:18:45 +0200
Message-ID: <p2o5d1e685e1005030518yd32004b9p9a113bb0a85789ae@mail.gmail.com>
References: <q2xb67489df1005030136k889d7b6fg51c4a3961f052787@mail.gmail.com>
	<1272887832.15272.624.camel@jfonseca-laptop.eng.vmware.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0101295935=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1272887832.15272.624.camel-pSl1YM2wAhRt9hlZCtusMxL+8ZyvpDYTWa6EbPWFt8Q@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Mime-version: 1.0
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: =?ISO-8859-1?Q?Jos=E9_Fonseca?= <jfonseca-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org>
Cc: nouveau <Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, mesa3d-dev <mesa3d-dev-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Id: nouveau.vger.kernel.org

--===============0101295935==
Content-Type: multipart/alternative; boundary=0016e6dab056f3377a0485af9918

--0016e6dab056f3377a0485af9918
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, May 3, 2010 at 1:57 PM, Jos=E9 Fonseca <jfonseca-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org> wrote:

> On Mon, 2010-05-03 at 01:36 -0700, Xavier Chantry wrote:
> > I am trying to understand the s3tc init code as nv50 gallium has a
> > problem with that.
> >
> > It looks like some drivers (r300g and llvmpipe) actually inits s3tc in
> > two places :
> > ./src/mesa/main/texcompress_s3tc.c _mesa_init_texture_s3tc()
> > ./src/gallium/auxiliary/util/u_format_s3tc.c util_format_s3tc_init()
> >
> > Here is an extract of the backtrace calls while loading fgfs on llvmpip=
e
> :
> > driCreateScreen -> llvmpipe_create_screen -> util_format_s3tc_init
> > driCreateContext -> st_create_context -> _mesa_create_context_for_api
> > -> init_attrib_groups -> _mesa_init_texture_s3tc
> >
> > These two functions seem to do more or less the same job, and
> > apparently, the classic mesa init is unused for a gallium driver.
> > So I suppose that init is not necessary, but it happens because
> > gallium and mesa are tightly tied together, and create context is
> > handled similarly, but it shouldn't hurt ?
>
> Both inits are necessary. The same .so is used for both paths, but given
> that gallium and mesa do not depend on each other that's the way to do
> it. Gallium and mesa also have seperate format translation functions.
>
> At least until we start factoring code into a separate library. (I said
> I'd do it, but stuff came up and I couldn't do when I thought, and I
> don't know when I'll be able to do it...)
>
> > Additionally r300g and llvmpipe added util_format_s3tc_init to their
> > create_screen functions, and util/u_format_s3tc.c apparently contains
> > all the functions that a gallium driver uses.
> > So I suppose that nvfx and nv50 should do the same ?
> >
> > If that's correct, the patch below might not be completely wrong.
> >
> > On Mon, May 3, 2010 at 12:44 AM, Xavier Chantry
> > <chantry.xavier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > > flightgear now dies with :
> > > Mesa warning: external dxt library not available: texstore_rgba_dxt3
> > > util/u_format_s3tc.c:66:util_format_dxt3_rgba_fetch_stub: Assertion `=
0'
> failed.
> > >
> > > I don't really understand what these stubs are about, they were
> > > introduced by following commit :
> > > commit d96e87c3c513f8ed350ae24425edb74b6d6fcc13
> > > Author: Jos=E9 Fonseca <jfonseca-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org>
> > > Date:   Wed Apr 7 20:47:38 2010 +0100
> > >
> > >    util: Use stubs for the dynamically loaded S3TC functions.
> > >
> > >    Loosely based on Luca Barbieri's commit
> > >    52e9b990a192a9329006d5f7dd2ac222effea5a5.
> > >
> > > Looking at llvm and r300 code and trying to guess, I came up with the
> > > following patch that allows flightgear to start again. But I don't
> > > really understand that stuff so it could be wrong.
> > > nvfx is probably affected as well.
> > >
> > >
> > > diff --git a/src/gallium/drivers/nouveau/nouveau_screen.c
> > > b/src/gallium/drivers/nouveau/nouveau_screen.c
> > > index 233a91a..a91b00b 100644
> > > --- a/src/gallium/drivers/nouveau/nouveau_screen.c
> > > +++ b/src/gallium/drivers/nouveau/nouveau_screen.c
> > > @@ -5,6 +5,7 @@
> > >  #include "util/u_memory.h"
> > >  #include "util/u_inlines.h"
> > >  #include "util/u_format.h"
> > > +#include "util/u_format_s3tc.h"
> > >
> > >  #include <stdio.h>
> > >  #include <errno.h>
> > > @@ -248,6 +249,8 @@ nouveau_screen_init(struct nouveau_screen *screen=
,
> > > struct nouveau_device *dev)
> > >        pscreen->fence_signalled =3D nouveau_screen_fence_signalled;
> > >        pscreen->fence_finish =3D nouveau_screen_fence_finish;
> > >
> > > +       util_format_s3tc_init();
> > > +
> > >        return 0;
> > >  }
> > >
> > > diff --git a/src/gallium/drivers/nv50/nv50_screen.c
> > > b/src/gallium/drivers/nv50/nv50_screen.c
> > > index 2dd1042..0d74c90 100644
> > > --- a/src/gallium/drivers/nv50/nv50_screen.c
> > > +++ b/src/gallium/drivers/nv50/nv50_screen.c
> > > @@ -20,6 +20,7 @@
> > >  * SOFTWARE.
> > >  */
> > >
> > > +#include "util/u_format_s3tc.h"
> > >  #include "pipe/p_screen.h"
> > >
> > >  #include "nv50_context.h"
> > > @@ -72,10 +73,6 @@ nv50_screen_is_format_supported(struct pipe_screen
> *pscreen,
> > >                case PIPE_FORMAT_A8_UNORM:
> > >                case PIPE_FORMAT_I8_UNORM:
> > >                case PIPE_FORMAT_L8A8_UNORM:
> > > -               case PIPE_FORMAT_DXT1_RGB:
> > > -               case PIPE_FORMAT_DXT1_RGBA:
> > > -               case PIPE_FORMAT_DXT3_RGBA:
> > > -               case PIPE_FORMAT_DXT5_RGBA:
> > >                case PIPE_FORMAT_S8_USCALED_Z24_UNORM:
> > >                case PIPE_FORMAT_Z24_UNORM_S8_USCALED:
> > >                case PIPE_FORMAT_Z32_FLOAT:
> > > @@ -85,6 +82,11 @@ nv50_screen_is_format_supported(struct pipe_screen
> *pscreen,
> > >                case PIPE_FORMAT_R16G16_SNORM:
> > >                case PIPE_FORMAT_R16G16_UNORM:
> > >                        return TRUE;
> > > +               case PIPE_FORMAT_DXT1_RGB:
> > > +               case PIPE_FORMAT_DXT1_RGBA:
> > > +               case PIPE_FORMAT_DXT3_RGBA:
> > > +               case PIPE_FORMAT_DXT5_RGBA:
> > > +                       return util_format_s3tc_enabled;
> > >                default:
> > >                        break;
> > >                }
> > >
>
> You should only advertise PIPE_FORMAT_DXT* for BIND_SAMPLER_VIEW, or you
> may end up in very weird paths. Same for YUV.
>

I think my hw supports rendering to YUV textures, it's been even implemente=
d
in r300g but not tested. I am not sure who's gonna use such a feature.
Should I disable it then?

-Marek

--0016e6dab056f3377a0485af9918
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Mon, May 3, 2010 at 1:57 PM, Jos=E9 Fonseca <=
span dir=3D"ltr">&lt;<a href=3D"mailto:jfonseca-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org">jfonseca@vmware=
.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"bo=
rder-left: 1px solid rgb(204, 204, 204); margin: 0pt 0pt 0pt 0.8ex; padding=
-left: 1ex;">

<div class=3D"im">On Mon, 2010-05-03 at 01:36 -0700, Xavier Chantry wrote:<=
br>
&gt; I am trying to understand the s3tc init code as nv50 gallium has a<br>
&gt; problem with that.<br>
&gt;<br>
&gt; It looks like some drivers (r300g and llvmpipe) actually inits s3tc in=
<br>
&gt; two places :<br>
&gt; ./src/mesa/main/texcompress_s3tc.c _mesa_init_texture_s3tc()<br>
&gt; ./src/gallium/auxiliary/util/u_format_s3tc.c util_format_s3tc_init()<b=
r>
&gt;<br>
&gt; Here is an extract of the backtrace calls while loading fgfs on llvmpi=
pe :<br>
&gt; driCreateScreen -&gt; llvmpipe_create_screen -&gt; util_format_s3tc_in=
it<br>
&gt; driCreateContext -&gt; st_create_context -&gt; _mesa_create_context_fo=
r_api<br>
&gt; -&gt; init_attrib_groups -&gt; _mesa_init_texture_s3tc<br>
&gt;<br>
&gt; These two functions seem to do more or less the same job, and<br>
&gt; apparently, the classic mesa init is unused for a gallium driver.<br>
&gt; So I suppose that init is not necessary, but it happens because<br>
&gt; gallium and mesa are tightly tied together, and create context is<br>
&gt; handled similarly, but it shouldn&#39;t hurt ?<br>
<br>
</div>Both inits are necessary. The same .so is used for both paths, but gi=
ven<br>
that gallium and mesa do not depend on each other that&#39;s the way to do<=
br>
it. Gallium and mesa also have seperate format translation functions.<br>
<br>
At least until we start factoring code into a separate library. (I said<br>
I&#39;d do it, but stuff came up and I couldn&#39;t do when I thought, and =
I<br>
don&#39;t know when I&#39;ll be able to do it...)<br>
<div><div></div><div class=3D"h5"><br>
&gt; Additionally r300g and llvmpipe added util_format_s3tc_init to their<b=
r>
&gt; create_screen functions, and util/u_format_s3tc.c apparently contains<=
br>
&gt; all the functions that a gallium driver uses.<br>
&gt; So I suppose that nvfx and nv50 should do the same ?<br>
&gt;<br>
&gt; If that&#39;s correct, the patch below might not be completely wrong.<=
br>
&gt;<br>
&gt; On Mon, May 3, 2010 at 12:44 AM, Xavier Chantry<br>
&gt; &lt;<a href=3D"mailto:chantry.xavier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org">chantry.xavier@gmail.c=
om</a>&gt; wrote:<br>
&gt; &gt; flightgear now dies with :<br>
&gt; &gt; Mesa warning: external dxt library not available: texstore_rgba_d=
xt3<br>
&gt; &gt; util/u_format_s3tc.c:66:util_format_dxt3_rgba_fetch_stub: Asserti=
on `0&#39; failed.<br>
&gt; &gt;<br>
&gt; &gt; I don&#39;t really understand what these stubs are about, they we=
re<br>
&gt; &gt; introduced by following commit :<br>
&gt; &gt; commit d96e87c3c513f8ed350ae24425edb74b6d6fcc13<br>
&gt; &gt; Author: Jos=E9 Fonseca &lt;<a href=3D"mailto:jfonseca-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org"=
>jfonseca-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org</a>&gt;<br>
&gt; &gt; Date: =A0 Wed Apr 7 20:47:38 2010 +0100<br>
&gt; &gt;<br>
&gt; &gt; =A0 =A0util: Use stubs for the dynamically loaded S3TC functions.=
<br>
&gt; &gt;<br>
&gt; &gt; =A0 =A0Loosely based on Luca Barbieri&#39;s commit<br>
&gt; &gt; =A0 =A052e9b990a192a9329006d5f7dd2ac222effea5a5.<br>
&gt; &gt;<br>
&gt; &gt; Looking at llvm and r300 code and trying to guess, I came up with=
 the<br>
&gt; &gt; following patch that allows flightgear to start again. But I don&=
#39;t<br>
&gt; &gt; really understand that stuff so it could be wrong.<br>
&gt; &gt; nvfx is probably affected as well.<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/src/gallium/drivers/nouveau/nouveau_screen.c<br>
&gt; &gt; b/src/gallium/drivers/nouveau/nouveau_screen.c<br>
&gt; &gt; index 233a91a..a91b00b 100644<br>
&gt; &gt; --- a/src/gallium/drivers/nouveau/nouveau_screen.c<br>
&gt; &gt; +++ b/src/gallium/drivers/nouveau/nouveau_screen.c<br>
&gt; &gt; @@ -5,6 +5,7 @@<br>
&gt; &gt; =A0#include &quot;util/u_memory.h&quot;<br>
&gt; &gt; =A0#include &quot;util/u_inlines.h&quot;<br>
&gt; &gt; =A0#include &quot;util/u_format.h&quot;<br>
&gt; &gt; +#include &quot;util/u_format_s3tc.h&quot;<br>
&gt; &gt;<br>
&gt; &gt; =A0#include &lt;stdio.h&gt;<br>
&gt; &gt; =A0#include &lt;errno.h&gt;<br>
&gt; &gt; @@ -248,6 +249,8 @@ nouveau_screen_init(struct nouveau_screen *sc=
reen,<br>
&gt; &gt; struct nouveau_device *dev)<br>
&gt; &gt; =A0 =A0 =A0 =A0pscreen-&gt;fence_signalled =3D nouveau_screen_fen=
ce_signalled;<br>
&gt; &gt; =A0 =A0 =A0 =A0pscreen-&gt;fence_finish =3D nouveau_screen_fence_=
finish;<br>
&gt; &gt;<br>
&gt; &gt; + =A0 =A0 =A0 util_format_s3tc_init();<br>
&gt; &gt; +<br>
&gt; &gt; =A0 =A0 =A0 =A0return 0;<br>
&gt; &gt; =A0}<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/src/gallium/drivers/nv50/nv50_screen.c<br>
&gt; &gt; b/src/gallium/drivers/nv50/nv50_screen.c<br>
&gt; &gt; index 2dd1042..0d74c90 100644<br>
&gt; &gt; --- a/src/gallium/drivers/nv50/nv50_screen.c<br>
&gt; &gt; +++ b/src/gallium/drivers/nv50/nv50_screen.c<br>
&gt; &gt; @@ -20,6 +20,7 @@<br>
&gt; &gt; =A0* SOFTWARE.<br>
&gt; &gt; =A0*/<br>
&gt; &gt;<br>
&gt; &gt; +#include &quot;util/u_format_s3tc.h&quot;<br>
&gt; &gt; =A0#include &quot;pipe/p_screen.h&quot;<br>
&gt; &gt;<br>
&gt; &gt; =A0#include &quot;nv50_context.h&quot;<br>
&gt; &gt; @@ -72,10 +73,6 @@ nv50_screen_is_format_supported(struct pipe_sc=
reen *pscreen,<br>
&gt; &gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0case PIPE_FORMAT_A8_UNORM:<br>
&gt; &gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0case PIPE_FORMAT_I8_UNORM:<br>
&gt; &gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0case PIPE_FORMAT_L8A8_UNORM:<br>
&gt; &gt; - =A0 =A0 =A0 =A0 =A0 =A0 =A0 case PIPE_FORMAT_DXT1_RGB:<br>
&gt; &gt; - =A0 =A0 =A0 =A0 =A0 =A0 =A0 case PIPE_FORMAT_DXT1_RGBA:<br>
&gt; &gt; - =A0 =A0 =A0 =A0 =A0 =A0 =A0 case PIPE_FORMAT_DXT3_RGBA:<br>
&gt; &gt; - =A0 =A0 =A0 =A0 =A0 =A0 =A0 case PIPE_FORMAT_DXT5_RGBA:<br>
&gt; &gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0case PIPE_FORMAT_S8_USCALED_Z24_UN=
ORM:<br>
&gt; &gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0case PIPE_FORMAT_Z24_UNORM_S8_USCA=
LED:<br>
&gt; &gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0case PIPE_FORMAT_Z32_FLOAT:<br>
&gt; &gt; @@ -85,6 +82,11 @@ nv50_screen_is_format_supported(struct pipe_sc=
reen *pscreen,<br>
&gt; &gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0case PIPE_FORMAT_R16G16_SNORM:<br>
&gt; &gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0case PIPE_FORMAT_R16G16_UNORM:<br>
&gt; &gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return TRUE;<br>
&gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 case PIPE_FORMAT_DXT1_RGB:<br>
&gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 case PIPE_FORMAT_DXT1_RGBA:<br>
&gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 case PIPE_FORMAT_DXT3_RGBA:<br>
&gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 case PIPE_FORMAT_DXT5_RGBA:<br>
&gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return util_format_=
s3tc_enabled;<br>
&gt; &gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0default:<br>
&gt; &gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0break;<br>
&gt; &gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}<br>
&gt; &gt;<br>
<br>
</div></div>You should only advertise PIPE_FORMAT_DXT* for BIND_SAMPLER_VIE=
W, or you<br>
may end up in very weird paths. Same for YUV.<br></blockquote></div><br>I t=
hink my hw supports rendering to YUV textures, it&#39;s been even implement=
ed in r300g but not tested. I am not sure who&#39;s gonna use such a featur=
e. Should I disable it then?<br>

<br>-Marek<br>

--0016e6dab056f3377a0485af9918--

--===============0101295935==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0101295935==--
