From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 23/23] nvc0: implement support for maxwell
 texture headers
Date: Tue, 16 Feb 2016 07:40:15 +1000
Message-ID: <56C245BF.50908@gmail.com>
References: <1455514736-8909-1-git-send-email-skeggsb@gmail.com>
 <1455514736-8909-23-git-send-email-skeggsb@gmail.com>
 <CAKb7UvgjAjgyvMUS31fS8Jq+vqsO_XyeVreuFsaioU1etoQ_pw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1377737295=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAKb7UvgjAjgyvMUS31fS8Jq+vqsO_XyeVreuFsaioU1etoQ_pw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1377737295==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="CiKpBgEBSIfWHCwlCtQmclgpk7rCvHbTt"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--CiKpBgEBSIfWHCwlCtQmclgpk7rCvHbTt
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 02/16/2016 03:47 AM, Ilia Mirkin wrote:
> Can you push this to a repo somewhere? I want to see what the final
> version looks like after all your changes, but it's hard to see that
> with these patches.
https://github.com/skeggsb/Mesa/commits/master

>=20
> On Mon, Feb 15, 2016 at 12:38 AM, Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:=

>> From: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>>
>> Adds support for the new TIC layout that's present on Maxwell GPUs,
>> heavily based on the code for the existing layout.
>>
>> This code is required for GM20x support.  While GM10x supports the old=
er
>> layout still, this commit switches it to use the updated version inste=
ad.
>>
>> Piglit testing shows zero regressions on GM107.
>>
>> Signed-off-by: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>> ---
>>  src/gallium/drivers/nouveau/nvc0/nvc0_screen.c |   8 +
>>  src/gallium/drivers/nouveau/nvc0/nvc0_screen.h |   1 +
>>  src/gallium/drivers/nouveau/nvc0/nvc0_tex.c    | 201 ++++++++++++++++=
++++++++-
>>  3 files changed, 204 insertions(+), 6 deletions(-)
>>
>> diff --git a/src/gallium/drivers/nouveau/nvc0/nvc0_screen.c b/src/gall=
ium/drivers/nouveau/nvc0/nvc0_screen.c
>> index d435bec..820e38d 100644
>> --- a/src/gallium/drivers/nouveau/nvc0/nvc0_screen.c
>> +++ b/src/gallium/drivers/nouveau/nvc0/nvc0_screen.c
>> @@ -991,6 +991,14 @@ nvc0_screen_create(struct nouveau_device *dev)
>>     PUSH_DATAh(push, screen->txc->offset);
>>     PUSH_DATA (push, screen->txc->offset);
>>     PUSH_DATA (push, NVC0_TIC_MAX_ENTRIES - 1);
>> +   if (screen->eng3d->oclass >=3D GM107_3D_CLASS) {
>> +      screen->tic.maxwell =3D true;
>> +      if (screen->eng3d->oclass =3D=3D GM107_3D_CLASS) {
>> +         screen->tic.maxwell =3D
>> +            debug_get_bool_option("NOUVEAU_MAXWELL_TIC", true);
>> +         IMMED_NVC0(push, SUBC_3D(0x0f10), screen->tic.maxwell);
>> +      }
>> +   }
>>
>>     BEGIN_NVC0(push, NVC0_3D(TSC_ADDRESS_HIGH), 3);
>>     PUSH_DATAh(push, screen->txc->offset + 65536);
>> diff --git a/src/gallium/drivers/nouveau/nvc0/nvc0_screen.h b/src/gall=
ium/drivers/nouveau/nvc0/nvc0_screen.h
>> index 40c9c7a..f34fabd 100644
>> --- a/src/gallium/drivers/nouveau/nvc0/nvc0_screen.h
>> +++ b/src/gallium/drivers/nouveau/nvc0/nvc0_screen.h
>> @@ -83,6 +83,7 @@ struct nvc0_screen {
>>        void **entries;
>>        int next;
>>        uint32_t lock[NVC0_TIC_MAX_ENTRIES / 32];
>> +      bool maxwell;
>>     } tic;
>>
>>     struct {
>> diff --git a/src/gallium/drivers/nouveau/nvc0/nvc0_tex.c b/src/gallium=
/drivers/nouveau/nvc0/nvc0_tex.c
>> index ae4d53c..c0da959 100644
>> --- a/src/gallium/drivers/nouveau/nvc0/nvc0_tex.c
>> +++ b/src/gallium/drivers/nouveau/nvc0/nvc0_tex.c
>> @@ -22,6 +22,7 @@
>>
>>  #include "nvc0/nvc0_context.h"
>>  #include "nvc0/nvc0_resource.h"
>> +#include "nvc0/gm107_texture.xml.h"
>>  #include "nv50/g80_texture.xml.h"
>>  #include "nv50/g80_defs.xml.h"
>>
>> @@ -59,12 +60,188 @@ nvc0_create_sampler_view(struct pipe_context *pip=
e,
>>     return nvc0_create_texture_view(pipe, res, templ, flags, templ->ta=
rget);
>>  }
>>
>> -struct pipe_sampler_view *
>> -nvc0_create_texture_view(struct pipe_context *pipe,
>> -                         struct pipe_resource *texture,
>> -                         const struct pipe_sampler_view *templ,
>> -                         uint32_t flags,
>> -                         enum pipe_texture_target target)
>> +static struct pipe_sampler_view *
>> +gm107_create_texture_view(struct pipe_context *pipe,
>> +                          struct pipe_resource *texture,
>> +                          const struct pipe_sampler_view *templ,
>> +                          uint32_t flags,
>> +                          enum pipe_texture_target target)
>> +{
>> +   const struct util_format_description *desc;
>> +   const struct nvc0_format *fmt;
>> +   uint64_t address;
>> +   uint32_t *tic;
>> +   uint32_t swz[4];
>> +   uint32_t width, height;
>> +   uint32_t depth;
>> +   struct nv50_tic_entry *view;
>> +   struct nv50_miptree *mt;
>> +   bool tex_int;
>> +
>> +   view =3D MALLOC_STRUCT(nv50_tic_entry);
>> +   if (!view)
>> +      return NULL;
>> +   mt =3D nv50_miptree(texture);
>> +
>> +   view->pipe =3D *templ;
>> +   view->pipe.reference.count =3D 1;
>> +   view->pipe.texture =3D NULL;
>> +   view->pipe.context =3D pipe;
>> +
>> +   view->id =3D -1;
>> +
>> +   pipe_resource_reference(&view->pipe.texture, texture);
>> +
>> +   tic =3D &view->tic[0];
>> +
>> +   desc =3D util_format_description(view->pipe.format);
>> +   tex_int =3D util_format_is_pure_integer(view->pipe.format);
>> +
>> +   fmt =3D &nvc0_format_table[view->pipe.format];
>> +   swz[0] =3D nv50_tic_swizzle(fmt, view->pipe.swizzle_r, tex_int);
>> +   swz[1] =3D nv50_tic_swizzle(fmt, view->pipe.swizzle_g, tex_int);
>> +   swz[2] =3D nv50_tic_swizzle(fmt, view->pipe.swizzle_b, tex_int);
>> +   swz[3] =3D nv50_tic_swizzle(fmt, view->pipe.swizzle_a, tex_int);
>> +
>> +   tic[0]  =3D fmt->tic.format << GM107_TIC2_0_COMPONENTS_SIZES__SHIF=
T;
>> +   tic[0] |=3D fmt->tic.type_r << GM107_TIC2_0_R_DATA_TYPE__SHIFT;
>> +   tic[0] |=3D fmt->tic.type_g << GM107_TIC2_0_G_DATA_TYPE__SHIFT;
>> +   tic[0] |=3D fmt->tic.type_b << GM107_TIC2_0_B_DATA_TYPE__SHIFT;
>> +   tic[0] |=3D fmt->tic.type_a << GM107_TIC2_0_A_DATA_TYPE__SHIFT;
>> +   tic[0] |=3D swz[0] << GM107_TIC2_0_X_SOURCE__SHIFT;
>> +   tic[0] |=3D swz[1] << GM107_TIC2_0_Y_SOURCE__SHIFT;
>> +   tic[0] |=3D swz[2] << GM107_TIC2_0_Z_SOURCE__SHIFT;
>> +   tic[0] |=3D swz[3] << GM107_TIC2_0_W_SOURCE__SHIFT;
>> +   // PACK_COMPONENTS?
>> +
>> +   address =3D mt->base.address;
>> +
>> +   tic[3]  =3D GM107_TIC2_3_LOD_ANISO_QUALITY_2;
>> +   tic[4]  =3D GM107_TIC2_4_SECTOR_PROMOTION_PROMOTE_TO_2_V;
>> +   tic[4] |=3D GM107_TIC2_4_BORDER_SIZE_SAMPLER_COLOR;
>> +
>> +   if (desc->colorspace =3D=3D UTIL_FORMAT_COLORSPACE_SRGB)
>> +      tic[4] |=3D GM107_TIC2_4_SRGB_CONVERSION;
>> +
>> +   if (!(flags & NV50_TEXVIEW_SCALED_COORDS))
>> +      tic[5] =3D GM107_TIC2_5_NORMALIZED_COORDS;
>> +   else
>> +      tic[5] =3D 0;
>> +
>> +   /* check for linear storage type */
>> +   if (unlikely(!nouveau_bo_memtype(nv04_resource(texture)->bo))) {
>> +      if (texture->target =3D=3D PIPE_BUFFER) {
>> +         assert(!(tic[5] & GM107_TIC2_5_NORMALIZED_COORDS));
>> +         width =3D view->pipe.u.buf.last_element - view->pipe.u.buf.f=
irst_element;
>> +         address +=3D
>> +            view->pipe.u.buf.first_element * desc->block.bits / 8;
>> +         tic[2]  =3D GM107_TIC2_2_HEADER_VERSION_ONE_D_BUFFER;
>> +         tic[3] |=3D width >> 16;
>> +         tic[4] |=3D GM107_TIC2_4_TEXTURE_TYPE_ONE_D_BUFFER;
>> +         tic[4] |=3D width & 0xffff;
>> +      } else {
>> +         assert(!(mt->level[0].pitch & 0x1f));
>> +         /* must be 2D texture without mip maps */
>> +         tic[2]  =3D GM107_TIC2_2_HEADER_VERSION_PITCH;
>> +         tic[4] |=3D GM107_TIC2_4_TEXTURE_TYPE_TWO_D_NO_MIPMAP;
>> +         tic[3] |=3D mt->level[0].pitch >> 5;
>> +         tic[4] |=3D mt->base.base.width0 - 1;
>> +         tic[5] |=3D 0 << GM107_TIC2_5_DEPTH_MINUS_ONE__SHIFT;
>> +         tic[5] |=3D mt->base.base.height0 - 1;
>> +      }
>> +      tic[1]  =3D address;
>> +      tic[2] |=3D address >> 32;
>> +      tic[6]  =3D 0;
>> +      tic[7]  =3D 0;
>> +      return &view->pipe;
>> +   }
>> +
>> +   tic[2]  =3D GM107_TIC2_2_HEADER_VERSION_BLOCKLINEAR;
>> +   tic[3] |=3D
>> +      ((mt->level[0].tile_mode & 0x0f0) >> 4 << 3) |
>> +      ((mt->level[0].tile_mode & 0xf00) >> 8 << 6);
>> +
>> +   depth =3D MAX2(mt->base.base.array_size, mt->base.base.depth0);
>> +
>> +   if (mt->base.base.array_size > 1) {
>> +      /* there doesn't seem to be a base layer field in TIC */
>> +      address +=3D view->pipe.u.tex.first_layer * mt->layer_stride;
>> +      depth =3D view->pipe.u.tex.last_layer - view->pipe.u.tex.first_=
layer + 1;
>> +   }
>> +   tic[1]  =3D address;
>> +   tic[2] |=3D address >> 32;
>> +
>> +   switch (target) {
>> +   case PIPE_TEXTURE_1D:
>> +      tic[4] |=3D GM107_TIC2_4_TEXTURE_TYPE_ONE_D;
>> +      break;
>> +   case PIPE_TEXTURE_2D:
>> +      tic[4] |=3D GM107_TIC2_4_TEXTURE_TYPE_TWO_D;
>> +      break;
>> +   case PIPE_TEXTURE_RECT:
>> +      tic[4] |=3D GM107_TIC2_4_TEXTURE_TYPE_TWO_D;
>> +      break;
>> +   case PIPE_TEXTURE_3D:
>> +      tic[4] |=3D GM107_TIC2_4_TEXTURE_TYPE_THREE_D;
>> +      break;
>> +   case PIPE_TEXTURE_CUBE:
>> +      depth /=3D 6;
>> +      tic[4] |=3D GM107_TIC2_4_TEXTURE_TYPE_CUBEMAP;
>> +      break;
>> +   case PIPE_TEXTURE_1D_ARRAY:
>> +      tic[4] |=3D GM107_TIC2_4_TEXTURE_TYPE_ONE_D_ARRAY;
>> +      break;
>> +   case PIPE_TEXTURE_2D_ARRAY:
>> +      tic[4] |=3D GM107_TIC2_4_TEXTURE_TYPE_TWO_D_ARRAY;
>> +      break;
>> +   case PIPE_TEXTURE_CUBE_ARRAY:
>> +      depth /=3D 6;
>> +      tic[4] |=3D GM107_TIC2_4_TEXTURE_TYPE_CUBE_ARRAY;
>> +      break;
>> +   default:
>> +      unreachable("unexpected/invalid texture target");
>> +   }
>> +
>> +   tic[3] |=3D (flags & NV50_TEXVIEW_FILTER_MSAA8) ?
>> +             GM107_TIC2_3_USE_HEADER_OPT_CONTROL :
>> +             GM107_TIC2_3_LOD_ANISO_QUALITY_HIGH |
>> +             GM107_TIC2_3_LOD_ISO_QUALITY_HIGH;
>> +
>> +   if (flags & NV50_TEXVIEW_ACCESS_RESOLVE) {
>> +      width =3D mt->base.base.width0 << mt->ms_x;
>> +      height =3D mt->base.base.height0 << mt->ms_y;
>> +   } else {
>> +      width =3D mt->base.base.width0;
>> +      height =3D mt->base.base.height0;
>> +   }
>> +
>> +   tic[4] |=3D width - 1;
>> +
>> +   tic[5] |=3D (height - 1) & 0xffff;
>> +   tic[5] |=3D (depth - 1) << GM107_TIC2_5_DEPTH_MINUS_ONE__SHIFT;
>> +   tic[3] |=3D mt->base.base.last_level << GM107_TIC2_3_MAX_MIP_LEVEL=
__SHIFT;
>> +
>> +   /* sampling points: (?) */
>> +   if ((flags & NV50_TEXVIEW_ACCESS_RESOLVE) && mt->ms_x > 1) {
>> +      tic[6]  =3D GM107_TIC2_6_ANISO_FINE_SPREAD_MODIFIER_CONST_TWO;
>> +      tic[6] |=3D GM107_TIC2_6_MAX_ANISOTROPY_2_TO_1;
>> +   } else {
>> +      tic[6] |  GM107_TIC2_6_ANISO_FINE_SPREAD_FUNC_TWO;
>> +      tic[6] |=3D GM107_TIC2_6_ANISO_COARSE_SPREAD_FUNC_ONE;
>> +   }
>> +
>> +   tic[7]  =3D (view->pipe.u.tex.last_level << 4) | view->pipe.u.tex.=
first_level;
>> +   tic[7] |=3D mt->ms_mode << GM107_TIC2_7_MULTI_SAMPLE_COUNT__SHIFT;=

>> +
>> +   return &view->pipe;
>> +}
>> +
>> +static struct pipe_sampler_view *
>> +gf100_create_texture_view(struct pipe_context *pipe,
>> +                          struct pipe_resource *texture,
>> +                          const struct pipe_sampler_view *templ,
>> +                          uint32_t flags,
>> +                          enum pipe_texture_target target)
>>  {
>>     const struct util_format_description *desc;
>>     const struct nvc0_format *fmt;
>> @@ -221,6 +398,18 @@ nvc0_create_texture_view(struct pipe_context *pip=
e,
>>     return &view->pipe;
>>  }
>>
>> +struct pipe_sampler_view *
>> +nvc0_create_texture_view(struct pipe_context *pipe,
>> +                         struct pipe_resource *texture,
>> +                         const struct pipe_sampler_view *templ,
>> +                         uint32_t flags,
>> +                         enum pipe_texture_target target)
>> +{
>> +   if (nvc0_context(pipe)->screen->tic.maxwell)
>> +      return gm107_create_texture_view(pipe, texture, templ, flags, t=
arget);
>> +   return gf100_create_texture_view(pipe, texture, templ, flags, targ=
et);
>> +}
>> +
>>  static void
>>  nvc0_update_tic(struct nvc0_context *nvc0, struct nv50_tic_entry *tic=
,
>>                  struct nv04_resource *res)
>> --
>> 2.7.0
>>
>> _______________________________________________
>> Nouveau mailing list
>> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
>> https://lists.freedesktop.org/mailman/listinfo/nouveau


--CiKpBgEBSIfWHCwlCtQmclgpk7rCvHbTt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWwkW/AAoJEHYLnGJQkpH7OdsQAIl1f4BVrt1aQRxzBm9N+3C1
1FpV6oUpPhrLrxFLxG6LQ/iYgq1PatWrkquq6uj9ldrnXQxllviipZPk0wDjlzJg
RdKD57GsCE7OWQfxp/P5DaLxKTvVN+h/6VAGGMEgr6RR3TGjr4OWuJdn9qIWGKwz
udyM6tQ14J8NaUK+9f26pyWv8Cf7NQbPaphoyRSK7nkAlGU/MDKHLXohettTqVxb
gqrFrsm9iX6xribqmO0zFG/iFZ5zH/n4PRJl3Ydv5A4cPhYefouXTqD4ao3HygCT
/LILmzyXU87dkndSgSMQ/Ad/T1WkSuIXD5uL/O1rp7fJn28X2uLAZ9SHddQxFbZ6
rkiyM0WXQ9A9DxpvKgWH32aK2AvhLJ/iSPYRNnGAumDnV/OwNaF8J89nIU+VMuP2
gGFIr7A1hMbMSSdUllQH7yAhX1VS6pcwWJa2B48y97CV8wZdNruxOqq2nWTVrujT
LQ7DggT+Z3uM3Hwld9yGFq3WkWFX+lZTWzQRjs4a/HnD0jYU0QRhIIt6OOLN68Td
syuRSMwZDq8FplbugDLoCUf2i+tt2uZTg4CecIf5mK2skQzavpXNH1HFs9AlYmd2
LLKW+a6foqWKdg37vsIMlUsMt0KJfyk6uubGcQUNmjr5dAwnlg9iFYCpRqRQIuBO
wiYYFM+SPebpmhkS4eaN
=z9mo
-----END PGP SIGNATURE-----

--CiKpBgEBSIfWHCwlCtQmclgpk7rCvHbTt--

--===============1377737295==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1377737295==--
