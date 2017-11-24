From: Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org>
Subject: Re: [PATCH v3] nouveau/compiler: Allow to omit line
 numbers when printing instructions
Date: Fri, 24 Nov 2017 17:10:17 +0100
Message-ID: <20171124161017.dwozoi4b7aqyyrbf@pmoreau.org>
References: <20171120221501.pz3oprojv3switve@pmoreau.org>
 <20171124155529.8990-1-tobias.johannes.klausmann@mni.thm.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0341662949=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20171124155529.8990-1-tobias.johannes.klausmann-AqjdNwhu20eELgA04lAiVw@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Tobias Klausmann <tobias.johannes.klausmann-AqjdNwhu20eELgA04lAiVw@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0341662949==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3jafvqqt4prjd4t4"
Content-Disposition: inline


--3jafvqqt4prjd4t4
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

(Comment is a bit further down)

On 2017-11-24 =E2=80=94 16:55, Tobias Klausmann wrote:
> This comes in handy when checking "NV50_PROG_DEBUG=3D1" outputs with diff!
>=20
> V2:
>  - Use environmental variable (Karol Herbst)
> V3:
>  - Use the already populated nv50_ir_prog_info to forward information to =
the
>    print pass (Pierre Moreau)
>=20
> Signed-off-by: Tobias Klausmann <tobias.johannes.klausmann-AqjdNwhu20eELgA04lAiVw@public.gmane.org>
> ---
>  src/gallium/drivers/nouveau/codegen/nv50_ir_driver.h  |  1 +
>  src/gallium/drivers/nouveau/codegen/nv50_ir_print.cpp | 12 +++++++++---
>  src/gallium/drivers/nouveau/nouveau_compiler.c        |  2 ++
>  src/gallium/drivers/nouveau/nv50/nv50_program.c       |  2 ++
>  src/gallium/drivers/nouveau/nvc0/nvc0_program.c       |  2 ++
>  5 files changed, 16 insertions(+), 3 deletions(-)
>=20
> diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_driver.h b/src/g=
allium/drivers/nouveau/codegen/nv50_ir_driver.h
> index ffd53c9cd3..604a22ba89 100644
> --- a/src/gallium/drivers/nouveau/codegen/nv50_ir_driver.h
> +++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_driver.h
> @@ -82,6 +82,7 @@ struct nv50_ir_prog_info
> =20
>     uint8_t optLevel; /* optimization level (0 to 3) */
>     uint8_t dbgFlags;
> +   bool omitLineNum;

You could maybe add a comment that it only affects when printing the program
(in debug mode), but the patch is nonetheless:

Reviewed-by: Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org>

> =20
>     struct {
>        int16_t maxGPR;     /* may be -1 if none used */
> diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_print.cpp b/src/=
gallium/drivers/nouveau/codegen/nv50_ir_print.cpp
> index 9145801b62..eb7e9057b5 100644
> --- a/src/gallium/drivers/nouveau/codegen/nv50_ir_print.cpp
> +++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_print.cpp
> @@ -691,7 +691,7 @@ void Instruction::print() const
>  class PrintPass : public Pass
>  {
>  public:
> -   PrintPass() : serial(0) { }
> +   PrintPass(bool omitLineNum =3D false) : serial(0), omit_serial(omitLi=
neNum) { }
> =20
>     virtual bool visit(Function *);
>     virtual bool visit(BasicBlock *);
> @@ -699,6 +699,7 @@ public:
> =20
>  private:
>     int serial;
> +   bool omit_serial;
>  };
> =20
>  bool
> @@ -762,7 +763,12 @@ PrintPass::visit(BasicBlock *bb)
>  bool
>  PrintPass::visit(Instruction *insn)
>  {
> -   INFO("%3i: ", serial++);
> +   if (omit_serial) {
> +      INFO("     ");
> +      serial++;
> +   }
> +   else
> +      INFO("%3i: ", serial++);
>     insn->print();
>     return true;
>  }
> @@ -777,7 +783,7 @@ Function::print()
>  void
>  Program::print()
>  {
> -   PrintPass pass;
> +   PrintPass pass(driver->omitLineNum);
>     init_colours();
>     pass.run(this, true, false);
>  }
> diff --git a/src/gallium/drivers/nouveau/nouveau_compiler.c b/src/gallium=
/drivers/nouveau/nouveau_compiler.c
> index 3151a6f420..1214cf3565 100644
> --- a/src/gallium/drivers/nouveau/nouveau_compiler.c
> +++ b/src/gallium/drivers/nouveau/nouveau_compiler.c
> @@ -122,6 +122,8 @@ nouveau_codegen(int chipset, int type, struct tgsi_to=
ken tokens[],
> =20
>     info.optLevel =3D debug_get_num_option("NV50_PROG_OPTIMIZE", 3);
>     info.dbgFlags =3D debug_get_num_option("NV50_PROG_DEBUG", 0);
> +   info.omitLineNum =3D
> +         debug_get_num_option("NV50_PROG_DEBUG_OMIT_LINENUM", 0) ? true =
: false;
> =20
>     ret =3D nv50_ir_generate_code(&info);
>     if (ret) {
> diff --git a/src/gallium/drivers/nouveau/nv50/nv50_program.c b/src/galliu=
m/drivers/nouveau/nv50/nv50_program.c
> index 6e943a3d94..fb5c9ed777 100644
> --- a/src/gallium/drivers/nouveau/nv50/nv50_program.c
> +++ b/src/gallium/drivers/nouveau/nv50/nv50_program.c
> @@ -367,6 +367,8 @@ nv50_program_translate(struct nv50_program *prog, uin=
t16_t chipset,
>  #ifdef DEBUG
>     info->optLevel =3D debug_get_num_option("NV50_PROG_OPTIMIZE", 3);
>     info->dbgFlags =3D debug_get_num_option("NV50_PROG_DEBUG", 0);
> +   info->omitLineNum =3D
> +         debug_get_num_option("NV50_PROG_DEBUG_OMIT_LINENUM", 0) ? true =
: false;
>  #else
>     info->optLevel =3D 3;
>  #endif
> diff --git a/src/gallium/drivers/nouveau/nvc0/nvc0_program.c b/src/galliu=
m/drivers/nouveau/nvc0/nvc0_program.c
> index c95a96c717..8dced66437 100644
> --- a/src/gallium/drivers/nouveau/nvc0/nvc0_program.c
> +++ b/src/gallium/drivers/nouveau/nvc0/nvc0_program.c
> @@ -575,6 +575,8 @@ nvc0_program_translate(struct nvc0_program *prog, uin=
t16_t chipset,
>     info->target =3D debug_get_num_option("NV50_PROG_CHIPSET", chipset);
>     info->optLevel =3D debug_get_num_option("NV50_PROG_OPTIMIZE", 3);
>     info->dbgFlags =3D debug_get_num_option("NV50_PROG_DEBUG", 0);
> +   info->omitLineNum =3D
> +         debug_get_num_option("NV50_PROG_DEBUG_OMIT_LINENUM", 0) ? true =
: false;
>  #else
>     info->optLevel =3D 3;
>  #endif
> --=20
> 2.15.0
>=20
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau

--3jafvqqt4prjd4t4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEYgBv5JnnDxeItcEHU3l4X80+KSQFAloYRGUACgkQU3l4X80+
KSSyuQ//bPJvqdGArHyCOhgf6TWLys7reio55fh3S6+YseI0bmxYf7iHRfjxu0eH
0Jtn+pgn1UCOPQ/O1SCe/9DYmc5QwftjbUzIuyZVywSRjjtxq8MUGo/OOgdE3h0W
jMmjbgTZoGRJIYaIFpikY5HGsWHlIEKq1hlSnFeLygXRuDnBBagdqAlWtUMN0/pU
K+aKPnv7estvrjn21IObSLN1TrOmCIxdotH3XG7bRx3nVlfebJOqdsnTwlA3KLpf
ofa2lnUUba7mqeeAaFWtS0tgkjnEYptHh7pSyaXjUKT5tSB2U+4Gr/LuD3xSHtnt
48RpYdhq+6Ckchh/3+fx4rYvvZqnnQorEN0ZAiVZ1cthjKpgvl7kIVIIiB0/8cy5
gpNJXoDYCTchuYbP+28bfhYgs5THA7YAU7psFYGZJMJsBRMmx/5LF+xD+9YfJ4ww
Gpvo1gDWQUyi53bwXmMq6qGXx6WjLP0tbg2PdQ+JCaNFDG/FkWPz1kiPqbOPqgQv
4f3kcKlud7noc7BVrW7OVjhsU/aHfJvCEFk1Ed41nK5STIEfC513Bu8D8GjW7u8I
EGS2kW8sPxg8skLdZjj+P+a0GBsCsO8QYIlsDvfxfAt7MPk0t0siKMZerBFznoim
u3qM/0AhtryAWkuZpX9C7HL0sds9417hVZvIu2X1lLQkb/61GRg=
=acxQ
-----END PGP SIGNATURE-----

--3jafvqqt4prjd4t4--

--===============0341662949==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0341662949==--
