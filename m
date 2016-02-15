From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 09/23] nv50-: separate vertex formats from
 surface format descriptions
Date: Mon, 15 Feb 2016 15:49:51 +1000
Message-ID: <56C166FF.9090204@gmail.com>
References: <1455514736-8909-1-git-send-email-skeggsb@gmail.com>
 <1455514736-8909-9-git-send-email-skeggsb@gmail.com>
 <CAKb7Uvg=rL_GLTRU+u_rvWZOmE8C1HiuonmgdvEKxV9ZzSyQ6A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1153757725=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAKb7Uvg=rL_GLTRU+u_rvWZOmE8C1HiuonmgdvEKxV9ZzSyQ6A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1153757725==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="1EX71eGK3jSDHRVn0uBPRSH4jUVdKcsDX"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--1EX71eGK3jSDHRVn0uBPRSH4jUVdKcsDX
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 02/15/2016 03:43 PM, Ilia Mirkin wrote:
> Why not fix the new names instead to be like the old names? Seems like
> that would be way simpler...
I initially did just that, then realised that:

- If we ever get official headers for the class, there's zero guarantee
they'll share names even then.
- We actually share very little information when defining the two
formats, so it causes no harm to split them.

Ben.

>=20
> On Feb 15, 2016 12:38 AM, "Ben Skeggs" <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
> <mailto:skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>> wrote:
>=20
>     From: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org <mailto:bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>>
>=20
>     We've previously had identical naming between vertex and texture
>     formats, so it mostly made sense to define these together.
>=20
>     However, upcoming patches are going to transition the driver over t=
o
>     using updated texture header definitions using NVIDIA's naming, and=
 this
>     will no longer be the case.
>=20
>     Signed-off-by: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
>     <mailto:bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>>
>     ---
>      src/gallium/drivers/nouveau/nv50/nv50_formats.c | 249
>     ++++++++++++++++++------
>      src/gallium/drivers/nouveau/nv50/nv50_screen.c  |   3 +-
>      src/gallium/drivers/nouveau/nv50/nv50_screen.h  |   5 +
>      src/gallium/drivers/nouveau/nv50/nv50_vbo.c     |   4 +-
>      src/gallium/drivers/nouveau/nvc0/nvc0_screen.c  |   3 +-
>      src/gallium/drivers/nouveau/nvc0/nvc0_screen.h  |   5 +
>      src/gallium/drivers/nouveau/nvc0/nvc0_vbo.c     |   4 +-
>      7 files changed, 206 insertions(+), 67 deletions(-)
>=20
>     diff --git a/src/gallium/drivers/nouveau/nv50/nv50_formats.c
>     b/src/gallium/drivers/nouveau/nv50/nv50_formats.c
>     index 49a93bf..a9ddae5 100644
>     --- a/src/gallium/drivers/nouveau/nv50/nv50_formats.c
>     +++ b/src/gallium/drivers/nouveau/nv50/nv50_formats.c
>     @@ -39,10 +39,9 @@
>       * C: render target (color), blendable only on nvc0
>       * D: scanout/display target, blendable
>       * Z: depth/stencil
>     - * V: vertex fetch
>       * I: image / surface, implies T
>       */
>     -#define U_V   PIPE_BIND_VERTEX_BUFFER
>     +#define U_V   0
>      #define U_T   PIPE_BIND_SAMPLER_VIEW
>      #define U_I   PIPE_BIND_SHADER_BUFFER | PIPE_BIND_SHADER_IMAGE |
>     PIPE_BIND_COMPUTE_RESOURCE
>      #define U_TR  PIPE_BIND_RENDER_TARGET | U_T
>     @@ -103,10 +102,7 @@
>            (NV50_TIC_TYPE_##t1 << NV50_TIC_0_TYPE1__SHIFT) |           =

>          \
>            (NV50_TIC_TYPE_##t2 << NV50_TIC_0_TYPE2__SHIFT) |           =

>          \
>            (NV50_TIC_TYPE_##t3 << NV50_TIC_0_TYPE3__SHIFT) |           =

>          \
>     -      NV50_TIC_0_FMT_##sz,                                        =
=20
>         \
>     -      NVXX_3D_VAF_SIZE(sz) |                                      =
=20
>         \
>     -      NVXX_3D_VAF_TYPE(t0) | (br << 31),                          =
=20
>         \
>     -      U_##u                                                       =

>          \
>     +      NV50_TIC_0_FMT_##sz, U_##u                                  =
=20
>         \
>         }
>=20
>      #define TBLENT_B_(pf, sf, r, g, b, a, t0, t1, t2, t3, sz, u)      =
=20
>         \
>     @@ -120,7 +116,7 @@
>            (NV50_TIC_TYPE_##t1 << NV50_TIC_0_TYPE1__SHIFT) |           =

>          \
>            (NV50_TIC_TYPE_##t2 << NV50_TIC_0_TYPE2__SHIFT) |           =

>          \
>            (NV50_TIC_TYPE_##t3 << NV50_TIC_0_TYPE3__SHIFT) |           =

>          \
>     -      NV50_TIC_0_FMT_##sz, 0, U_##u                               =

>          \
>     +      NV50_TIC_0_FMT_##sz, U_##u                                  =
=20
>         \
>         }
>=20
>      #define C4A(p, n, r, g, b, a, t, s, u, br)                        =
=20
>         \
>     @@ -308,6 +304,10 @@ const struct nv50_format
>     nv50_format_table[PIPE_FORMAT_COUNT] =3D
>         I3B(R32G32B32X32_SINT, RGBX32_SINT, C0, C1, C2, xx, SINT,
>     32_32_32_32, TR),
>         I3B(R32G32B32X32_UINT, RGBX32_UINT, C0, C1, C2, xx, UINT,
>     32_32_32_32, TR),
>=20
>     +   F3A(R32G32B32_FLOAT, NONE, C0, C1, C2, xx, FLOAT, 32_32_32, tV)=
,
>     +   I3A(R32G32B32_SINT, NONE, C0, C1, C2, xx, SINT, 32_32_32, tV),
>     +   I3A(R32G32B32_UINT, NONE, C0, C1, C2, xx, UINT, 32_32_32, tV),
>     +
>         F2A(R32G32_FLOAT, RG32_FLOAT, C0, C1, xx, xx, FLOAT, 32_32, IBV=
),
>         F2A(R32G32_UNORM, NONE, C0, C1, xx, xx, UNORM, 32_32, TV),
>         F2A(R32G32_SNORM, NONE, C0, C1, xx, xx, SNORM, 32_32, TV),
>     @@ -381,64 +381,191 @@ const struct nv50_format
>     nv50_format_table[PIPE_FORMAT_COUNT] =3D
>                   C0, C1, C2, ONE_FLOAT, SNORM, SNORM, UNORM, UNORM,
>     8_8_8_8, T),
>         TBLENT_B_(R5SG5SB6U_NORM, 0,
>                   C0, C1, C2, ONE_FLOAT, SNORM, SNORM, UNORM, UNORM,
>     5_5_6, T),
>     +};
>=20
>     -   /* vertex-only formats: */
>     +#define V_TBLENT_A_(pf, sf, r, g, b, a, t0, t1, t2, t3, sz, u, br)=
=20
>         \
>     +   [PIPE_FORMAT_##pf] =3D {                                       =
 =20
>          \
>     +      NVXX_3D_VAF_SIZE(sz) | NVXX_3D_VAF_TYPE(t0) | (br << 31),   =

>          \
>     +      PIPE_BIND_VERTEX_BUFFER                                     =

>          \
>     +   }
>=20
>     -   C4A(R32G32B32A32_SSCALED, NONE, C0, C1, C2, C3, SSCALED,
>     32_32_32_32, V, 0),
>     -   C4A(R32G32B32A32_USCALED, NONE, C0, C1, C2, C3, USCALED,
>     32_32_32_32, V, 0),
>     -   F3A(R32G32B32_FLOAT, NONE, C0, C1, C2, xx, FLOAT, 32_32_32, tV)=
,
>     -   F3A(R32G32B32_UNORM, NONE, C0, C1, C2, xx, UNORM, 32_32_32, V),=

>     -   F3A(R32G32B32_SNORM, NONE, C0, C1, C2, xx, SNORM, 32_32_32, V),=

>     -   I3A(R32G32B32_SINT, NONE, C0, C1, C2, xx, SINT, 32_32_32, tV),
>     -   I3A(R32G32B32_UINT, NONE, C0, C1, C2, xx, UINT, 32_32_32, tV),
>     -   F3A(R32G32B32_SSCALED, NONE, C0, C1, C2, xx, SSCALED, 32_32_32,=
 V),
>     -   F3A(R32G32B32_USCALED, NONE, C0, C1, C2, xx, USCALED, 32_32_32,=
 V),
>     -   F2A(R32G32_SSCALED, NONE, C0, C1, xx, xx, SSCALED, 32_32, V),
>     -   F2A(R32G32_USCALED, NONE, C0, C1, xx, xx, USCALED, 32_32, V),
>     -   F1A(R32_SSCALED, NONE, C0, xx, xx, xx, SSCALED, 32, V),
>     -   F1A(R32_USCALED, NONE, C0, xx, xx, xx, USCALED, 32, V),
>     -
>     -   C4A(R16G16B16A16_SSCALED, NONE, C0, C1, C2, C3, SSCALED,
>     16_16_16_16, V, 0),
>     -   C4A(R16G16B16A16_USCALED, NONE, C0, C1, C2, C3, USCALED,
>     16_16_16_16, V, 0),
>     -   F3A(R16G16B16_FLOAT, NONE, C0, C1, C2, xx, FLOAT, 16_16_16, V),=

>     -   F3A(R16G16B16_UNORM, NONE, C0, C1, C2, xx, UNORM, 16_16_16, V),=

>     -   F3A(R16G16B16_SNORM, NONE, C0, C1, C2, xx, SNORM, 16_16_16, V),=

>     -   I3A(R16G16B16_SINT, NONE, C0, C1, C2, xx, SINT, 16_16_16, V),
>     -   I3A(R16G16B16_UINT, NONE, C0, C1, C2, xx, UINT, 16_16_16, V),
>     -   F3A(R16G16B16_SSCALED, NONE, C0, C1, C2, xx, SSCALED, 16_16_16,=
 V),
>     -   F3A(R16G16B16_USCALED, NONE, C0, C1, C2, xx, USCALED, 16_16_16,=
 V),
>     -   F2A(R16G16_SSCALED, NONE, C0, C1, xx, xx, SSCALED, 16_16, V),
>     -   F2A(R16G16_USCALED, NONE, C0, C1, xx, xx, USCALED, 16_16, V),
>     -   F1A(R16_SSCALED, NONE, C0, xx, xx, xx, SSCALED, 16, V),
>     -   F1A(R16_USCALED, NONE, C0, xx, xx, xx, USCALED, 16, V),
>     -
>     -   C4A(R10G10B10A2_USCALED, NONE, C0, C1, C2, C3, USCALED,
>     10_10_10_2, V, 0),
>     -   C4A(R10G10B10A2_SSCALED, NONE, C0, C1, C2, C3, SSCALED,
>     10_10_10_2, V, 0),
>     -   C4A(B10G10R10A2_USCALED, NONE, C0, C1, C2, C3, USCALED,
>     10_10_10_2, V, 1),
>     -   C4A(B10G10R10A2_SSCALED, NONE, C0, C1, C2, C3, SSCALED,
>     10_10_10_2, V, 1),
>     -
>     -   C4A(R8G8B8A8_SSCALED, NONE, C0, C1, C2, C3, SSCALED, 8_8_8_8, V=
, 0),
>     -   C4A(R8G8B8A8_USCALED, NONE, C0, C1, C2, C3, USCALED, 8_8_8_8, V=
, 0),
>     -   F3A(R8G8B8_UNORM, NONE, C0, C1, C2, xx, UNORM, 8_8_8, V),
>     -   F3A(R8G8B8_SNORM, NONE, C0, C1, C2, xx, SNORM, 8_8_8, V),
>     -   I2A(R8G8B8_SINT, NONE, C0, C1, C2, xx, SINT, 8_8_8, V),
>     -   I2A(R8G8B8_UINT, NONE, C0, C1, C2, xx, UINT, 8_8_8, V),
>     -   F3A(R8G8B8_SSCALED, NONE, C0, C1, C2, xx, SSCALED, 8_8_8, V),
>     -   F3A(R8G8B8_USCALED, NONE, C0, C1, C2, xx, USCALED, 8_8_8, V),
>     -   F2A(R8G8_SSCALED, NONE, C0, C1, xx, xx, SSCALED, 8_8, V),
>     -   F2A(R8G8_USCALED, NONE, C0, C1, xx, xx, USCALED, 8_8, V),
>     -   F1A(R8_SSCALED, NONE, C0, xx, xx, xx, SSCALED, 8, V),
>     -   F1A(R8_USCALED, NONE, C0, xx, xx, xx, USCALED, 8, V),
>     +#define V_TBLENT_B_(pf, sf, r, g, b, a, t0, t1, t2, t3, sz, u)    =
=20
>         \
>     +   [PIPE_FORMAT_##pf] =3D {                                       =
 =20
>          \
>     +      0,                                                          =
=20
>         \
>     +      PIPE_BIND_VERTEX_BUFFER                                     =

>          \
>     +   }
>     +
>     +#define V_C4A(p, n, r, g, b, a, t, s, u, br)                      =
=20
>           \
>     +   V_TBLENT_A_(p, NV50_SURFACE_FORMAT_##n, r, g, b, a, t, t, t, t,=

>     s, u, br)
>     +#define V_C4B(p, n, r, g, b, a, t, s, u)                          =
=20
>           \
>     +   V_TBLENT_B_(p, NV50_SURFACE_FORMAT_##n, r, g, b, a, t, t, t, t,=

>     s, u)
>     +
>     +#define V_ZXB(p, n, r, g, b, a, t, s, u)                          =
=20
>           \
>     +   V_TBLENT_B_(p, NV50_ZETA_FORMAT_##n,                           =

>            \
>     +             r, g, b, ONE_FLOAT, t, UINT, UINT, UINT, s, u)
>     +#define V_ZSB(p, n, r, g, b, a, t, s, u)                          =
=20
>           \
>     +   V_TBLENT_B_(p, NV50_ZETA_FORMAT_##n,                           =

>            \
>     +             r, g, b, ONE_FLOAT, t, UINT, UINT, UINT, s, u)
>     +#define V_SZB(p, n, r, g, b, a, t, s, u)                          =
=20
>           \
>     +   V_TBLENT_B_(p, NV50_ZETA_FORMAT_##n,                           =

>            \
>     +             r, g, b, ONE_FLOAT, UINT, t, UINT, UINT, s, u)
>     +#define V_SXB(p, r, s, u)                                         =

>            \
>     +   V_TBLENT_B_(p, NV50_ZETA_FORMAT_NONE,                          =
=20
>           \
>     +             r, r, r, r, UINT, UINT, UINT, UINT, s, u)
>     +
>     +#define V_F3A(p, n, r, g, b, a, t, s, u)          \
>     +   V_C4A(p, n, r, g, b, ONE_FLOAT, t, s, u, 0)
>     +#define V_I3A(p, n, r, g, b, a, t, s, u)          \
>     +   V_C4A(p, n, r, g, b, ONE_INT, t, s, u, 0)
>     +#define V_F3B(p, n, r, g, b, a, t, s, u)          \
>     +   V_C4B(p, n, r, g, b, ONE_FLOAT, t, s, u)
>     +#define V_I3B(p, n, r, g, b, a, t, s, u)          \
>     +   V_C4B(p, n, r, g, b, ONE_INT, t, s, u)
>     +
>     +#define V_F2A(p, n, r, g, b, a, t, s, u)          \
>     +   V_C4A(p, n, r, g, ZERO, ONE_FLOAT, t, s, u, 0)
>     +#define V_I2A(p, n, r, g, b, a, t, s, u)          \
>     +   V_C4A(p, n, r, g, ZERO, ONE_INT, t, s, u, 0)
>     +#define V_F2B(p, n, r, g, b, a, t, s, u)          \
>     +   V_C4B(p, n, r, g, ZERO, ONE_FLOAT, t, s, u)
>     +#define V_I2B(p, n, r, g, b, a, t, s, u)          \
>     +   V_C4B(p, n, r, g, ZERO, ONE_INT, t, s, u)
>     +
>     +#define V_F1A(p, n, r, g, b, a, t, s, u)             \
>     +   V_C4A(p, n, r, ZERO, ZERO, ONE_FLOAT, t, s, u, 0)
>     +#define V_I1A(p, n, r, g, b, a, t, s, u)             \
>     +   V_C4A(p, n, r, ZERO, ZERO, ONE_INT, t, s, u, 0)
>     +#define V_F1B(p, n, r, g, b, a, t, s, u)          \
>     +   V_C4B(p, n, r, ZERO, ZERO, ONE_FLOAT, t, s, u)
>     +#define V_I1B(p, n, r, g, b, a, t, s, u)          \
>     +   V_C4B(p, n, r, ZERO, ZERO, ONE_INT, t, s, u)
>     +
>     +#define V_A1B(p, n, r, g, b, a, t, s, u)          \
>     +   V_C4B(p, n, ZERO, ZERO, ZERO, a, t, s, u)
>     +
>     +#if NOUVEAU_DRIVER =3D=3D 0xc0
>     +const struct nvc0_vertex_format nvc0_vertex_format[PIPE_FORMAT_COU=
NT] =3D
>     +#else
>     +const struct nv50_vertex_format nv50_vertex_format[PIPE_FORMAT_COU=
NT] =3D
>     +#endif
>     +{
>     +   V_C4A(B8G8R8A8_UNORM, BGRA8_UNORM, C2, C1, C0, C3, UNORM,
>     8_8_8_8, TDV, 1),
>     +   V_C4A(R8G8B8A8_UNORM, RGBA8_UNORM, C0, C1, C2, C3, UNORM,
>     8_8_8_8, IBV, 0),
>     +
>     +   V_C4A(R10G10B10A2_UNORM, RGB10_A2_UNORM, C0, C1, C2, C3, UNORM,=

>     10_10_10_2, IBV, 0),
>     +   V_C4A(B10G10R10A2_UNORM, BGR10_A2_UNORM, C2, C1, C0, C3, UNORM,=

>     10_10_10_2, TDV, 1),
>     +   V_C4A(R10G10B10A2_SNORM, NONE, C0, C1, C2, C3, SNORM,
>     10_10_10_2, TV, 0),
>     +   V_C4A(B10G10R10A2_SNORM, NONE, C2, C1, C0, C3, SNORM,
>     10_10_10_2, TV, 1),
>     +   V_C4A(R10G10B10A2_UINT, RGB10_A2_UINT, C0, C1, C2, C3, UINT,
>     10_10_10_2, TRV, 0),
>     +   V_C4A(B10G10R10A2_UINT, RGB10_A2_UINT, C2, C1, C0, C3, UINT,
>     10_10_10_2, TV, 0),
>     +
>     +   V_F3A(R11G11B10_FLOAT, R11G11B10_FLOAT, C0, C1, C2, xx, FLOAT,
>     11_11_10, IBV),
>     +
>     +   V_C4A(R32G32B32A32_FLOAT, RGBA32_FLOAT, C0, C1, C2, C3, FLOAT,
>     32_32_32_32, IBV, 0),
>     +   V_C4A(R32G32B32A32_UNORM, NONE, C0, C1, C2, C3, UNORM,
>     32_32_32_32, TV, 0),
>     +   V_C4A(R32G32B32A32_SNORM, NONE, C0, C1, C2, C3, SNORM,
>     32_32_32_32, TV, 0),
>     +   V_C4A(R32G32B32A32_SINT, RGBA32_SINT, C0, C1, C2, C3, SINT,
>     32_32_32_32, IRV, 0),
>     +   V_C4A(R32G32B32A32_UINT, RGBA32_UINT, C0, C1, C2, C3, UINT,
>     32_32_32_32, IRV, 0),
>     +
>     +   V_F2A(R32G32_FLOAT, RG32_FLOAT, C0, C1, xx, xx, FLOAT, 32_32, I=
BV),
>     +   V_F2A(R32G32_UNORM, NONE, C0, C1, xx, xx, UNORM, 32_32, TV),
>     +   V_F2A(R32G32_SNORM, NONE, C0, C1, xx, xx, SNORM, 32_32, TV),
>     +   V_I2A(R32G32_SINT, RG32_SINT, C0, C1, xx, xx, SINT, 32_32, IRV)=
,
>     +   V_I2A(R32G32_UINT, RG32_UINT, C0, C1, xx, xx, UINT, 32_32, IRV)=
,
>     +
>     +   V_F1A(R32_FLOAT, R32_FLOAT, C0, xx, xx, xx, FLOAT, 32, IBV),
>     +   V_F1A(R32_UNORM, NONE, C0, xx, xx, xx, UNORM, 32, TV),
>     +   V_F1A(R32_SNORM, NONE, C0, xx, xx, xx, SNORM, 32, TV),
>     +   V_I1A(R32_SINT, R32_SINT, C0, xx, xx, xx, SINT, 32, IRV),
>     +   V_I1A(R32_UINT, R32_UINT, C0, xx, xx, xx, UINT, 32, IRV),
>     +
>     +   V_C4A(R16G16B16A16_FLOAT, RGBA16_FLOAT, C0, C1, C2, C3, FLOAT,
>     16_16_16_16, IBV, 0),
>     +   V_C4A(R16G16B16A16_UNORM, RGBA16_UNORM, C0, C1, C2, C3, UNORM,
>     16_16_16_16, ICV, 0),
>     +   V_C4A(R16G16B16A16_SNORM, RGBA16_SNORM, C0, C1, C2, C3, SNORM,
>     16_16_16_16, ICV, 0),
>     +   V_C4A(R16G16B16A16_SINT, RGBA16_SINT, C0, C1, C2, C3, SINT,
>     16_16_16_16, IRV, 0),
>     +   V_C4A(R16G16B16A16_UINT, RGBA16_UINT, C0, C1, C2, C3, UINT,
>     16_16_16_16, IRV, 0),
>     +
>     +   V_F2A(R16G16_FLOAT, RG16_FLOAT, C0, C1, xx, xx, FLOAT, 16_16, I=
BV),
>     +   V_F2A(R16G16_UNORM, RG16_UNORM, C0, C1, xx, xx, UNORM, 16_16, I=
CV),
>     +   V_F2A(R16G16_SNORM, RG16_SNORM, C0, C1, xx, xx, SNORM, 16_16, I=
CV),
>     +   V_I2A(R16G16_SINT, RG16_SINT, C0, C1, xx, xx, SINT, 16_16, IRV)=
,
>     +   V_I2A(R16G16_UINT, RG16_UINT, C0, C1, xx, xx, UINT, 16_16, IRV)=
,
>     +
>     +   V_F1A(R16_FLOAT, R16_FLOAT, C0, xx, xx, xx, FLOAT, 16, IBV),
>     +   V_F1A(R16_UNORM, R16_UNORM, C0, xx, xx, xx, UNORM, 16, ICV),
>     +   V_F1A(R16_SNORM, R16_SNORM, C0, xx, xx, xx, SNORM, 16, ICV),
>     +   V_I1A(R16_SINT, R16_SINT, C0, xx, xx, xx, SINT, 16, IRV),
>     +   V_I1A(R16_UINT, R16_UINT, C0, xx, xx, xx, UINT, 16, IRV),
>     +
>     +   V_C4A(R8G8B8A8_SNORM, RGBA8_SNORM, C0, C1, C2, C3, SNORM,
>     8_8_8_8, ICV, 0),
>     +   V_C4A(R8G8B8A8_SINT, RGBA8_SINT, C0, C1, C2, C3, SINT, 8_8_8_8,=

>     IRV, 0),
>     +   V_C4A(R8G8B8A8_UINT, RGBA8_UINT, C0, C1, C2, C3, UINT, 8_8_8_8,=

>     IRV, 0),
>     +
>     +   V_F2A(R8G8_UNORM, RG8_UNORM, C0, C1, xx, xx, UNORM, 8_8, IBV),
>     +   V_F2A(R8G8_SNORM, RG8_SNORM, C0, C1, xx, xx, SNORM, 8_8, ICV),
>     +   V_I2A(R8G8_SINT, RG8_SINT, C0, C1, xx, xx, SINT, 8_8, IRV),
>     +   V_I2A(R8G8_UINT, RG8_UINT, C0, C1, xx, xx, UINT, 8_8, IRV),
>     +
>     +   V_F1A(R8_UNORM, R8_UNORM, C0, xx, xx, xx, UNORM, 8, IBV),
>     +   V_F1A(R8_SNORM, R8_SNORM, C0, xx, xx, xx, SNORM, 8, ICV),
>     +   V_I1A(R8_SINT, R8_SINT, C0, xx, xx, xx, SINT, 8, IRV),
>     +   V_I1A(R8_UINT, R8_UINT, C0, xx, xx, xx, UINT, 8, IRV),
>     +
>     +   V_C4A(R32G32B32A32_SSCALED, NONE, C0, C1, C2, C3, SSCALED,
>     32_32_32_32, V, 0),
>     +   V_C4A(R32G32B32A32_USCALED, NONE, C0, C1, C2, C3, USCALED,
>     32_32_32_32, V, 0),
>     +   V_F3A(R32G32B32_FLOAT, NONE, C0, C1, C2, xx, FLOAT, 32_32_32, t=
V),
>     +   V_F3A(R32G32B32_UNORM, NONE, C0, C1, C2, xx, UNORM, 32_32_32, V=
),
>     +   V_F3A(R32G32B32_SNORM, NONE, C0, C1, C2, xx, SNORM, 32_32_32, V=
),
>     +   V_I3A(R32G32B32_SINT, NONE, C0, C1, C2, xx, SINT, 32_32_32, tV)=
,
>     +   V_I3A(R32G32B32_UINT, NONE, C0, C1, C2, xx, UINT, 32_32_32, tV)=
,
>     +   V_F3A(R32G32B32_SSCALED, NONE, C0, C1, C2, xx, SSCALED,
>     32_32_32, V),
>     +   V_F3A(R32G32B32_USCALED, NONE, C0, C1, C2, xx, USCALED,
>     32_32_32, V),
>     +   V_F2A(R32G32_SSCALED, NONE, C0, C1, xx, xx, SSCALED, 32_32, V),=

>     +   V_F2A(R32G32_USCALED, NONE, C0, C1, xx, xx, USCALED, 32_32, V),=

>     +   V_F1A(R32_SSCALED, NONE, C0, xx, xx, xx, SSCALED, 32, V),
>     +   V_F1A(R32_USCALED, NONE, C0, xx, xx, xx, USCALED, 32, V),
>     +
>     +   V_C4A(R16G16B16A16_SSCALED, NONE, C0, C1, C2, C3, SSCALED,
>     16_16_16_16, V, 0),
>     +   V_C4A(R16G16B16A16_USCALED, NONE, C0, C1, C2, C3, USCALED,
>     16_16_16_16, V, 0),
>     +   V_F3A(R16G16B16_FLOAT, NONE, C0, C1, C2, xx, FLOAT, 16_16_16, V=
),
>     +   V_F3A(R16G16B16_UNORM, NONE, C0, C1, C2, xx, UNORM, 16_16_16, V=
),
>     +   V_F3A(R16G16B16_SNORM, NONE, C0, C1, C2, xx, SNORM, 16_16_16, V=
),
>     +   V_I3A(R16G16B16_SINT, NONE, C0, C1, C2, xx, SINT, 16_16_16, V),=

>     +   V_I3A(R16G16B16_UINT, NONE, C0, C1, C2, xx, UINT, 16_16_16, V),=

>     +   V_F3A(R16G16B16_SSCALED, NONE, C0, C1, C2, xx, SSCALED,
>     16_16_16, V),
>     +   V_F3A(R16G16B16_USCALED, NONE, C0, C1, C2, xx, USCALED,
>     16_16_16, V),
>     +   V_F2A(R16G16_SSCALED, NONE, C0, C1, xx, xx, SSCALED, 16_16, V),=

>     +   V_F2A(R16G16_USCALED, NONE, C0, C1, xx, xx, USCALED, 16_16, V),=

>     +   V_F1A(R16_SSCALED, NONE, C0, xx, xx, xx, SSCALED, 16, V),
>     +   V_F1A(R16_USCALED, NONE, C0, xx, xx, xx, USCALED, 16, V),
>     +
>     +   V_C4A(R10G10B10A2_USCALED, NONE, C0, C1, C2, C3, USCALED,
>     10_10_10_2, V, 0),
>     +   V_C4A(R10G10B10A2_SSCALED, NONE, C0, C1, C2, C3, SSCALED,
>     10_10_10_2, V, 0),
>     +   V_C4A(B10G10R10A2_USCALED, NONE, C0, C1, C2, C3, USCALED,
>     10_10_10_2, V, 1),
>     +   V_C4A(B10G10R10A2_SSCALED, NONE, C0, C1, C2, C3, SSCALED,
>     10_10_10_2, V, 1),
>     +
>     +   V_C4A(R8G8B8A8_SSCALED, NONE, C0, C1, C2, C3, SSCALED, 8_8_8_8,=

>     V, 0),
>     +   V_C4A(R8G8B8A8_USCALED, NONE, C0, C1, C2, C3, USCALED, 8_8_8_8,=

>     V, 0),
>     +   V_F3A(R8G8B8_UNORM, NONE, C0, C1, C2, xx, UNORM, 8_8_8, V),
>     +   V_F3A(R8G8B8_SNORM, NONE, C0, C1, C2, xx, SNORM, 8_8_8, V),
>     +   V_I2A(R8G8B8_SINT, NONE, C0, C1, C2, xx, SINT, 8_8_8, V),
>     +   V_I2A(R8G8B8_UINT, NONE, C0, C1, C2, xx, UINT, 8_8_8, V),
>     +   V_F3A(R8G8B8_SSCALED, NONE, C0, C1, C2, xx, SSCALED, 8_8_8, V),=

>     +   V_F3A(R8G8B8_USCALED, NONE, C0, C1, C2, xx, USCALED, 8_8_8, V),=

>     +   V_F2A(R8G8_SSCALED, NONE, C0, C1, xx, xx, SSCALED, 8_8, V),
>     +   V_F2A(R8G8_USCALED, NONE, C0, C1, xx, xx, USCALED, 8_8, V),
>     +   V_F1A(R8_SSCALED, NONE, C0, xx, xx, xx, SSCALED, 8, V),
>     +   V_F1A(R8_USCALED, NONE, C0, xx, xx, xx, USCALED, 8, V),
>=20
>         /* FIXED types: not supported natively, converted on VBO push *=
/
>=20
>     -   C4B(R32G32B32A32_FIXED, NONE, C0, C1, C2, C3, FLOAT,
>     32_32_32_32, V),
>     -   F3B(R32G32B32_FIXED, NONE, C0, C1, C2, xx, FLOAT, 32_32_32, V),=

>     -   F2B(R32G32_FIXED, NONE, C0, C1, xx, xx, FLOAT, 32_32, V),
>     -   F1B(R32_FIXED, NONE, C0, xx, xx, xx, FLOAT, 32, V),
>     +   V_C4B(R32G32B32A32_FIXED, NONE, C0, C1, C2, C3, FLOAT,
>     32_32_32_32, V),
>     +   V_F3B(R32G32B32_FIXED, NONE, C0, C1, C2, xx, FLOAT, 32_32_32, V=
),
>     +   V_F2B(R32G32_FIXED, NONE, C0, C1, xx, xx, FLOAT, 32_32, V),
>     +   V_F1B(R32_FIXED, NONE, C0, xx, xx, xx, FLOAT, 32, V),
>=20
>     -   C4B(R64G64B64A64_FLOAT, NONE, C0, C1, C2, C3, FLOAT,
>     32_32_32_32, V),
>     -   F3B(R64G64B64_FLOAT, NONE, C0, C1, C2, xx, FLOAT, 32_32_32, V),=

>     -   F2B(R64G64_FLOAT, NONE, C0, C1, xx, xx, FLOAT, 32_32, V),
>     -   F1B(R64_FLOAT, NONE, C0, xx, xx, xx, FLOAT, 32, V),
>     +   V_C4B(R64G64B64A64_FLOAT, NONE, C0, C1, C2, C3, FLOAT,
>     32_32_32_32, V),
>     +   V_F3B(R64G64B64_FLOAT, NONE, C0, C1, C2, xx, FLOAT, 32_32_32, V=
),
>     +   V_F2B(R64G64_FLOAT, NONE, C0, C1, xx, xx, FLOAT, 32_32, V),
>     +   V_F1B(R64_FLOAT, NONE, C0, xx, xx, xx, FLOAT, 32, V),
>      };
>     diff --git a/src/gallium/drivers/nouveau/nv50/nv50_screen.c
>     b/src/gallium/drivers/nouveau/nv50/nv50_screen.c
>     index fd7b3d9..057e065 100644
>     --- a/src/gallium/drivers/nouveau/nv50/nv50_screen.c
>     +++ b/src/gallium/drivers/nouveau/nv50/nv50_screen.c
>     @@ -72,7 +72,8 @@ nv50_screen_is_format_supported(struct pipe_scree=
n
>     *pscreen,
>                       PIPE_BIND_TRANSFER_WRITE |
>                       PIPE_BIND_SHARED);
>=20
>     -   return (nv50_format_table[format].usage & bindings) =3D=3D bind=
ings;
>     +   return (( nv50_format_table[format].usage |
>     +            nv50_vertex_format[format].usage) & bindings) =3D=3D b=
indings;
>      }
>=20
>      static int
>     diff --git a/src/gallium/drivers/nouveau/nv50/nv50_screen.h
>     b/src/gallium/drivers/nouveau/nv50/nv50_screen.h
>     index 2a4983d..a117237 100644
>     --- a/src/gallium/drivers/nouveau/nv50/nv50_screen.h
>     +++ b/src/gallium/drivers/nouveau/nv50/nv50_screen.h
>     @@ -157,11 +157,16 @@ nv50_resource_validate(struct nv04_resource
>     *res, uint32_t flags)
>      struct nv50_format {
>         uint32_t rt;
>         uint32_t tic;
>     +   uint32_t usage;
>     +};
>     +
>     +struct nv50_vertex_format {
>         uint32_t vtx;
>         uint32_t usage;
>      };
>=20
>      extern const struct nv50_format nv50_format_table[];
>     +extern const struct nv50_vertex_format nv50_vertex_format[];
>=20
>      static inline void
>      nv50_screen_tic_unlock(struct nv50_screen *screen, struct
>     nv50_tic_entry *tic)
>     diff --git a/src/gallium/drivers/nouveau/nv50/nv50_vbo.c
>     b/src/gallium/drivers/nouveau/nv50/nv50_vbo.c
>     index 5369d52..028f4c8 100644
>     --- a/src/gallium/drivers/nouveau/nv50/nv50_vbo.c
>     +++ b/src/gallium/drivers/nouveau/nv50/nv50_vbo.c
>     @@ -76,7 +76,7 @@ nv50_vertex_state_create(struct pipe_context *pip=
e,
>              enum pipe_format fmt =3D ve->src_format;
>=20
>              so->element[i].pipe =3D elements[i];
>     -        so->element[i].state =3D nv50_format_table[fmt].vtx;
>     +        so->element[i].state =3D nv50_vertex_format[fmt].vtx;
>=20
>              if (!so->element[i].state) {
>                  switch (util_format_get_nr_components(fmt)) {
>     @@ -89,7 +89,7 @@ nv50_vertex_state_create(struct pipe_context *pip=
e,
>                      FREE(so);
>                      return NULL;
>                  }
>     -            so->element[i].state =3D nv50_format_table[fmt].vtx;
>     +            so->element[i].state =3D nv50_vertex_format[fmt].vtx;
>                  so->need_conversion =3D true;
>                  pipe_debug_message(&nouveau_context(pipe)->debug, FALL=
BACK,
>                                     "Converting vertex element %d, no h=
w
>     format %s",
>     diff --git a/src/gallium/drivers/nouveau/nvc0/nvc0_screen.c
>     b/src/gallium/drivers/nouveau/nvc0/nvc0_screen.c
>     index 2b12de4..d435bec 100644
>     --- a/src/gallium/drivers/nouveau/nvc0/nvc0_screen.c
>     +++ b/src/gallium/drivers/nouveau/nvc0/nvc0_screen.c
>     @@ -61,7 +61,8 @@ nvc0_screen_is_format_supported(struct pipe_scree=
n
>     *pscreen,
>                       PIPE_BIND_TRANSFER_WRITE |
>                       PIPE_BIND_SHARED);
>=20
>     -   return (nvc0_format_table[format].usage & bindings) =3D=3D bind=
ings;
>     +   return (( nvc0_format_table[format].usage |
>     +            nvc0_vertex_format[format].usage) & bindings) =3D=3D b=
indings;
>      }
>=20
>      static int
>     diff --git a/src/gallium/drivers/nouveau/nvc0/nvc0_screen.h
>     b/src/gallium/drivers/nouveau/nvc0/nvc0_screen.h
>     index 1a56177..e2b617f 100644
>     --- a/src/gallium/drivers/nouveau/nvc0/nvc0_screen.h
>     +++ b/src/gallium/drivers/nouveau/nvc0/nvc0_screen.h
>     @@ -165,11 +165,16 @@ nvc0_resource_validate(struct nv04_resource
>     *res, uint32_t flags)
>      struct nvc0_format {
>         uint32_t rt;
>         uint32_t tic;
>     +   uint32_t usage;
>     +};
>     +
>     +struct nvc0_vertex_format {
>         uint32_t vtx;
>         uint32_t usage;
>      };
>=20
>      extern const struct nvc0_format nvc0_format_table[];
>     +extern const struct nvc0_vertex_format nvc0_vertex_format[];
>=20
>      static inline void
>      nvc0_screen_tic_unlock(struct nvc0_screen *screen, struct
>     nv50_tic_entry *tic)
>     diff --git a/src/gallium/drivers/nouveau/nvc0/nvc0_vbo.c
>     b/src/gallium/drivers/nouveau/nvc0/nvc0_vbo.c
>     index 032b3c1..8239624 100644
>     --- a/src/gallium/drivers/nouveau/nvc0/nvc0_vbo.c
>     +++ b/src/gallium/drivers/nouveau/nvc0/nvc0_vbo.c
>     @@ -80,7 +80,7 @@ nvc0_vertex_state_create(struct pipe_context *pip=
e,
>              enum pipe_format fmt =3D ve->src_format;
>=20
>              so->element[i].pipe =3D elements[i];
>     -        so->element[i].state =3D nvc0_format_table[fmt].vtx;
>     +        so->element[i].state =3D nvc0_vertex_format[fmt].vtx;
>=20
>              if (!so->element[i].state) {
>                  switch (util_format_get_nr_components(fmt)) {
>     @@ -93,7 +93,7 @@ nvc0_vertex_state_create(struct pipe_context *pip=
e,
>                      FREE(so);
>                      return NULL;
>                  }
>     -            so->element[i].state =3D nvc0_format_table[fmt].vtx;
>     +            so->element[i].state =3D nvc0_vertex_format[fmt].vtx;
>                  so->need_conversion =3D true;
>                  pipe_debug_message(&nouveau_context(pipe)->debug, FALL=
BACK,
>                                     "Converting vertex element %d, no h=
w
>     format %s",
>     --
>     2.7.0
>=20
>     _______________________________________________
>     Nouveau mailing list
>     Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org <mailto:Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org=
>
>     https://lists.freedesktop.org/mailman/listinfo/nouveau
>=20


--1EX71eGK3jSDHRVn0uBPRSH4jUVdKcsDX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWwWb/AAoJEHYLnGJQkpH7x6IP/1SozKWVLsEiy1B3KvC1Jwp3
9NxR92VPgeW/aXXhBvWpeZMbpW918/RiWHLZP6YBO1aakVbozOo0vtFRk74OQ1aU
dOO0kAE7OK12ZPsKWoRbj90cz0Av/ilLtGBjEHIy4oKcpka3yCX0VFo40bek/vct
3fDy/AwHxDggBfV3jpEaUmS0du4owIDSC7bUcV9HYzX62HQmKShQrsybfguXtzZU
gURk4TOgz4rmXX/1xJoRyolJYEFBavSWC2yVEhTfCQ057Q4qk43aZQhfgNpVr2Lk
3QMXixkO8ZCcGfLVfgINGxzFEHppvADgK/CJIXnqWYlwvaKPljX44gzB3MtvoCHF
8gEDxycCcxluIpf8GSbdEMjv5v4RQ2Pj647WmP8OOzH4+u50OUyoLdqxAplxdoBt
TXIuj/CN7htC8zeP7leSBJIy1G4KpDEDMUi/c6uNEmssYvZYFR+8OqrqIoT+UG1n
MXrnXQXBCKYy1LNsyyfgUwlI8w1rs18gA6L5xgsj2VBViQf9L0QBPPf50VUeK6aZ
jY5sufxGrilhGBYwciYcIR4SlGIR2Dvsks2CRxX8RdwMlbK5+GAbB/mdU1H9EG//
wZW1qhadt++S3DpTmDcUwVQnqOQYGK0MxScj9a4/WWOsi9fyzC9bA7JYlDW/CA+c
Sldk+McHTI3/+4E3JWFf
=Azmx
-----END PGP SIGNATURE-----

--1EX71eGK3jSDHRVn0uBPRSH4jUVdKcsDX--

--===============1153757725==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1153757725==--
