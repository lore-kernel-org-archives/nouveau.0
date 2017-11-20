From: Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org>
Subject: Re: [PATCH v2] nouveau/compiler: Allow to omit line
 numbers when printing instructions
Date: Mon, 20 Nov 2017 23:15:01 +0100
Message-ID: <20171120221501.pz3oprojv3switve@pmoreau.org>
References: <CACO55tvX6ozw94n1E1orFaQOUEkL=gJQO4g5aT5fzcxxvOnpqg@mail.gmail.com>
 <20171117162151.24941-1-tobias.johannes.klausmann@mni.thm.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1123328256=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20171117162151.24941-1-tobias.johannes.klausmann-AqjdNwhu20eELgA04lAiVw@public.gmane.org>
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


--===============1123328256==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ts4ckitoh4t3zobt"
Content-Disposition: inline


--ts4ckitoh4t3zobt
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The =E2=80=9CProgram=E2=80=9D class keeps a pointer to the =E2=80=9Cnv50_ir=
_prog_info=E2=80=9D structure, so you could
just use that in the =E2=80=9CProgram::print()=E2=80=9D function, rather th=
an passing the flag as
an argument to =E2=80=9Cprint=E2=80=9D.

Pierre

On 2017-11-17 =E2=80=94 17:21, Tobias Klausmann wrote:
> This comes in handy when checking "NV50_PROG_DEBUG=3D1" outputs with diff!
>=20
> V2:
>  - Use environmental variable (Karol Herbst)
>=20
> Signed-off-by: Tobias Klausmann <tobias.johannes.klausmann-AqjdNwhu20eELgA04lAiVw@public.gmane.org>
> ---
>  src/gallium/drivers/nouveau/codegen/nv50_ir.cpp        |  6 +++---
>  src/gallium/drivers/nouveau/codegen/nv50_ir.h          |  2 +-
>  src/gallium/drivers/nouveau/codegen/nv50_ir_driver.h   |  1 +
>  src/gallium/drivers/nouveau/codegen/nv50_ir_print.cpp  | 14 ++++++++++--=
--
>  src/gallium/drivers/nouveau/codegen/nv50_ir_target.cpp |  2 +-
>  src/gallium/drivers/nouveau/nouveau_compiler.c         |  3 +++
>  src/gallium/drivers/nouveau/nv50/nv50_program.c        |  2 ++
>  src/gallium/drivers/nouveau/nvc0/nvc0_program.c        |  2 ++
>  8 files changed, 23 insertions(+), 9 deletions(-)
>=20
> diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir.cpp b/src/galliu=
m/drivers/nouveau/codegen/nv50_ir.cpp
> index e9363101bf..4bf6c73837 100644
> --- a/src/gallium/drivers/nouveau/codegen/nv50_ir.cpp
> +++ b/src/gallium/drivers/nouveau/codegen/nv50_ir.cpp
> @@ -1249,7 +1249,7 @@ nv50_ir_generate_code(struct nv50_ir_prog_info *inf=
o)
>     if (ret < 0)
>        goto out;
>     if (prog->dbgFlags & NV50_IR_DEBUG_VERBOSE)
> -      prog->print();
> +      prog->print(info->omitLineNum);
> =20
>     targ->parseDriverInfo(info);
>     prog->getTarget()->runLegalizePass(prog, nv50_ir::CG_STAGE_PRE_SSA);
> @@ -1257,13 +1257,13 @@ nv50_ir_generate_code(struct nv50_ir_prog_info *i=
nfo)
>     prog->convertToSSA();
> =20
>     if (prog->dbgFlags & NV50_IR_DEBUG_VERBOSE)
> -      prog->print();
> +      prog->print(info->omitLineNum);
> =20
>     prog->optimizeSSA(info->optLevel);
>     prog->getTarget()->runLegalizePass(prog, nv50_ir::CG_STAGE_SSA);
> =20
>     if (prog->dbgFlags & NV50_IR_DEBUG_BASIC)
> -      prog->print();
> +      prog->print(info->omitLineNum);
> =20
>     if (!prog->registerAllocation()) {
>        ret =3D -4;
> diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir.h b/src/gallium/=
drivers/nouveau/codegen/nv50_ir.h
> index f2ce16d882..a3c7fd2f94 100644
> --- a/src/gallium/drivers/nouveau/codegen/nv50_ir.h
> +++ b/src/gallium/drivers/nouveau/codegen/nv50_ir.h
> @@ -1249,7 +1249,7 @@ public:
>     Program(Type type, Target *targ);
>     ~Program();
> =20
> -   void print();
> +   void print(bool omitLineNum);
> =20
>     Type getType() const { return progType; }
> =20
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
> =20
>     struct {
>        int16_t maxGPR;     /* may be -1 if none used */
> diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_print.cpp b/src/=
gallium/drivers/nouveau/codegen/nv50_ir_print.cpp
> index 9145801b62..d6fe928af4 100644
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
> @@ -775,9 +781,9 @@ Function::print()
>  }
> =20
>  void
> -Program::print()
> +Program::print(bool omitLineNum)
>  {
> -   PrintPass pass;
> +   PrintPass pass(omitLineNum);
>     init_colours();
>     pass.run(this, true, false);
>  }
> diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_target.cpp b/src=
/gallium/drivers/nouveau/codegen/nv50_ir_target.cpp
> index 298e7c6ef9..96ad70d28a 100644
> --- a/src/gallium/drivers/nouveau/codegen/nv50_ir_target.cpp
> +++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_target.cpp
> @@ -371,7 +371,7 @@ Program::emitBinary(struct nv50_ir_prog_info *info)
>     emit->prepareEmission(this);
> =20
>     if (dbgFlags & NV50_IR_DEBUG_BASIC)
> -      this->print();
> +      this->print(info->omitLineNum);
> =20
>     if (!binSize) {
>        code =3D NULL;
> diff --git a/src/gallium/drivers/nouveau/nouveau_compiler.c b/src/gallium=
/drivers/nouveau/nouveau_compiler.c
> index 3151a6f420..20a4966433 100644
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
> @@ -143,6 +145,7 @@ main(int argc, char *argv[])
>     FILE *f;
>     char text[65536] =3D {0};
>     unsigned size =3D 0, *code =3D NULL;
> +   bool omitLineNum =3D false;
> =20
>     for (i =3D 1; i < argc; i++) {
>        if (!strcmp(argv[i], "-a"))
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

--ts4ckitoh4t3zobt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEYgBv5JnnDxeItcEHU3l4X80+KSQFAloTU9sACgkQU3l4X80+
KSRI8hAArQ8c5fc2mShl0v4F6f1VhfsvYgeNomr5gmbrDXoVfBp0T9k/YvRWS/st
dhhtMriiBjcL6QHgC/g6jyYDlfS41vphWHHkM9BK/v8C2qxKpviODQKIoxFUM4QH
8IUMipomjuq90n0+wcvIhsG/BJEbb+z/dfAdlXLTkaqC0XqfXlZckBMJkLEM3qL9
wyTLAHb0uXEEXn5ksnSnA4FesdXbxrUbWgcsN9GpM4XVX3LlpygrwIPeHGd4QIYt
9XeTh+/sp/m24m0sof/ITfmCs6oYUPVNkapa09loKDSpR0zfldVQGG0D4IjsYixk
9CdPJpXV5QYCA0yAruTgYtEZODokdY7dA4/gbJWumP/yIvk7VwYBzE8UVoy3SyG0
mpJJunkeBSM/XJtjakCD3bIB2aLXRFf5qdbhauXYimcie5lXeMGJGQ/34hE/Zbiq
bBxGDMFZbVg5WC5GwF1gHdcr2tiCRLtVW9dIBKasfX0wdi8XBllm9EAkit5GaXPv
aPJ0UcVdo6I07TKpWMgwV2d6oVKrjBPFzF2mTLkpbkQKvEr8nQjboYjWeU4RKViK
rXASXxu5i458HIyqxtIasyJ6Nn465/MRGxhhcWh/Ea+y/0tSkt3ejzOojeYthH9v
RBay7gVADeTZtVo3NpWE2qXNXCvT2CooSWc7066GoBK1qgHpdZQ=
=srk8
-----END PGP SIGNATURE-----

--ts4ckitoh4t3zobt--

--===============1123328256==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1123328256==--
