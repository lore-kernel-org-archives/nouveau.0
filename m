From: Aaron Watry <awatry@gmail.com>
Subject: Re: [PATCH mesa 2/3] tgsi: Add support for global /
 local / input MEMORY
Date: Thu, 10 Mar 2016 09:35:11 -0600
Message-ID: <CAM+GqJYP4Wx2RwwhndYxMJ9wASgq3qr_yfn+8J0zLfjVPrtPMg@mail.gmail.com>
References: <1457622887-19328-1-git-send-email-hdegoede@redhat.com>
 <1457622887-19328-3-git-send-email-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0104368529=="
Return-path: <mesa-dev-bounces@lists.freedesktop.org>
In-Reply-To: <1457622887-19328-3-git-send-email-hdegoede@redhat.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/mesa-dev>,
 <mailto:mesa-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/mesa-dev>
List-Post: <mailto:mesa-dev@lists.freedesktop.org>
List-Help: <mailto:mesa-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/mesa-dev>,
 <mailto:mesa-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: mesa-dev-bounces@lists.freedesktop.org
Sender: "mesa-dev" <mesa-dev-bounces@lists.freedesktop.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: mesa-dev <mesa-dev@lists.freedesktop.org>, nouveau@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

--===============0104368529==
Content-Type: multipart/alternative; boundary=001a114202f867a6f4052db38fdb

--001a114202f867a6f4052db38fdb
Content-Type: text/plain; charset=UTF-8

On Thu, Mar 10, 2016 at 9:14 AM, Hans de Goede <hdegoede@redhat.com> wrote:

> Extend the MEMORY file support to differentiate between global, local
> and shared memory, as well as "input" memory.
>
> "MEMORY[x], INPUT" is intended to access OpenCL kernel parameters, a
> special memory type is added for this, since the actual storage of these
> (e.g. UBO-s) may differ per implementation. The uploading of kernel
> parameters is handled by launch_grid, "MEMORY[x], INPUT" allows drivers
> to use an access mechanism for parameter reads which matches with the
> upload method.
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  src/gallium/auxiliary/tgsi/tgsi_build.c            |  8 +++----
>  src/gallium/auxiliary/tgsi/tgsi_dump.c             |  9 ++++++--
>  src/gallium/auxiliary/tgsi/tgsi_text.c             | 14 ++++++++++--
>  src/gallium/auxiliary/tgsi/tgsi_ureg.c             | 25
> ++++++++++++----------
>  src/gallium/auxiliary/tgsi/tgsi_ureg.h             |  2 +-
>  .../drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp  |  7 +++---
>  src/gallium/include/pipe/p_shader_tokens.h         | 10 +++++++--
>  src/mesa/state_tracker/st_glsl_to_tgsi.cpp         |  2 +-
>  8 files changed, 51 insertions(+), 26 deletions(-)
>
> diff --git a/src/gallium/auxiliary/tgsi/tgsi_build.c
> b/src/gallium/auxiliary/tgsi/tgsi_build.c
> index c420ae1..b108ade 100644
> --- a/src/gallium/auxiliary/tgsi/tgsi_build.c
> +++ b/src/gallium/auxiliary/tgsi/tgsi_build.c
> @@ -111,7 +111,7 @@ tgsi_default_declaration( void )
>     declaration.Local = 0;
>     declaration.Array = 0;
>     declaration.Atomic = 0;
> -   declaration.Shared = 0;
> +   declaration.MemType = TGSI_MEMORY_TYPE_GLOBAL;
>     declaration.Padding = 0;
>
>     return declaration;
> @@ -128,7 +128,7 @@ tgsi_build_declaration(
>     unsigned local,
>     unsigned array,
>     unsigned atomic,
> -   unsigned shared,
> +   unsigned mem_type,
>     struct tgsi_header *header )
>  {
>     struct tgsi_declaration declaration;
> @@ -146,7 +146,7 @@ tgsi_build_declaration(
>     declaration.Local = local;
>     declaration.Array = array;
>     declaration.Atomic = atomic;
> -   declaration.Shared = shared;
> +   declaration.MemType = mem_type;
>     header_bodysize_grow( header );
>
>     return declaration;
> @@ -406,7 +406,7 @@ tgsi_build_full_declaration(
>        full_decl->Declaration.Local,
>        full_decl->Declaration.Array,
>        full_decl->Declaration.Atomic,
> -      full_decl->Declaration.Shared,
> +      full_decl->Declaration.MemType,
>        header );
>
>     if (maxsize <= size)
> diff --git a/src/gallium/auxiliary/tgsi/tgsi_dump.c
> b/src/gallium/auxiliary/tgsi/tgsi_dump.c
> index f232f38..273f0ae 100644
> --- a/src/gallium/auxiliary/tgsi/tgsi_dump.c
> +++ b/src/gallium/auxiliary/tgsi/tgsi_dump.c
> @@ -365,8 +365,13 @@ iter_declaration(
>     }
>
>     if (decl->Declaration.File == TGSI_FILE_MEMORY) {
> -      if (decl->Declaration.Shared)
> -         TXT(", SHARED");
> +      switch (decl->Declaration.MemType) {
> +      /* Note: ,GLOBAL is optional / the default */
> +      case TGSI_MEMORY_TYPE_GLOBAL: TXT(", GLOBAL"); break;
> +      case TGSI_MEMORY_TYPE_LOCAL:  TXT(", LOCAL");  break;
> +      case TGSI_MEMORY_TYPE_SHARED: TXT(", SHARED"); break;
> +      case TGSI_MEMORY_TYPE_INPUT:  TXT(", INPUT");  break;
> +      }
>     }
>
>     if (decl->Declaration.File == TGSI_FILE_SAMPLER_VIEW) {
> diff --git a/src/gallium/auxiliary/tgsi/tgsi_text.c
> b/src/gallium/auxiliary/tgsi/tgsi_text.c
> index 77598d2..9438e3b 100644
> --- a/src/gallium/auxiliary/tgsi/tgsi_text.c
> +++ b/src/gallium/auxiliary/tgsi/tgsi_text.c
> @@ -1390,8 +1390,18 @@ static boolean parse_declaration( struct
> translate_ctx *ctx )
>              ctx->cur = cur;
>           }
>        } else if (file == TGSI_FILE_MEMORY) {
> -         if (str_match_nocase_whole(&cur, "SHARED")) {
> -            decl.Declaration.Shared = 1;
> +         if (str_match_nocase_whole(&cur, "GLOBAL")) {
> +            /* Note this is a no-op global is the default */
> +            decl.Declaration.MemType = TGSI_MEMORY_TYPE_GLOBAL;
> +            ctx->cur = cur;
> +         } else if (str_match_nocase_whole(&cur, "LOCAL")) {
> +            decl.Declaration.MemType = TGSI_MEMORY_TYPE_LOCAL;
> +            ctx->cur = cur;
> +         } else if (str_match_nocase_whole(&cur, "SHARED")) {
> +            decl.Declaration.MemType = TGSI_MEMORY_TYPE_SHARED;
> +            ctx->cur = cur;
> +         } else if (str_match_nocase_whole(&cur, "INPUT")) {
> +            decl.Declaration.MemType = TGSI_MEMORY_TYPE_INPUT;
>              ctx->cur = cur;
>           }
>        } else {
> diff --git a/src/gallium/auxiliary/tgsi/tgsi_ureg.c
> b/src/gallium/auxiliary/tgsi/tgsi_ureg.c
> index e1a7278..9e10044 100644
> --- a/src/gallium/auxiliary/tgsi/tgsi_ureg.c
> +++ b/src/gallium/auxiliary/tgsi/tgsi_ureg.c
> @@ -190,7 +190,7 @@ struct ureg_program
>
>     struct ureg_tokens domain[2];
>
> -   bool use_shared_memory;
> +   bool use_memory[TGSI_MEMORY_TYPE_COUNT];
>  };
>
>  static union tgsi_any_token error_tokens[32];
> @@ -729,13 +729,14 @@ struct ureg_src ureg_DECL_buffer(struct ureg_program
> *ureg, unsigned nr,
>     return reg;
>  }
>
> -/* Allocate a shared memory area.
> +/* Allocate a memory area.
>   */
> -struct ureg_src ureg_DECL_shared_memory(struct ureg_program *ureg)
> +struct ureg_src ureg_DECL_memory(struct ureg_program *ureg,
> +                                 unsigned memory_type)
>  {
> -   struct ureg_src reg = ureg_src_register(TGSI_FILE_MEMORY, 0);
> +   struct ureg_src reg = ureg_src_register(TGSI_FILE_MEMORY, memory_type);
>
> -   ureg->use_shared_memory = true;
> +   ureg->use_memory[memory_type] = true;
>     return reg;
>  }
>
> @@ -1666,7 +1667,7 @@ emit_decl_buffer(struct ureg_program *ureg,
>  }
>
>  static void
> -emit_decl_shared_memory(struct ureg_program *ureg)
> +emit_decl_memory(struct ureg_program *ureg, unsigned memory_type)
>  {
>     union tgsi_any_token *out = get_tokens(ureg, DOMAIN_DECL, 2);
>
> @@ -1675,11 +1676,11 @@ emit_decl_shared_memory(struct ureg_program *ureg)
>     out[0].decl.NrTokens = 2;
>     out[0].decl.File = TGSI_FILE_MEMORY;
>     out[0].decl.UsageMask = TGSI_WRITEMASK_XYZW;
> -   out[0].decl.Shared = true;
> +   out[0].decl.MemType = memory_type;
>
>     out[1].value = 0;
> -   out[1].decl_range.First = 0;
> -   out[1].decl_range.Last = 0;
> +   out[1].decl_range.First = memory_type;
> +   out[1].decl_range.Last = memory_type;
>  }
>
>  static void
> @@ -1854,8 +1855,10 @@ static void emit_decls( struct ureg_program *ureg )
>        emit_decl_buffer(ureg, ureg->buffer[i].index,
> ureg->buffer[i].atomic);
>     }
>
> -   if (ureg->use_shared_memory)
> -      emit_decl_shared_memory(ureg);
> +   for (i = 0; i < TGSI_MEMORY_TYPE_COUNT; i++) {
> +      if (ureg->use_memory[i])
> +         emit_decl_memory(ureg, i);
> +   }
>
>     if (ureg->const_decls.nr_constant_ranges) {
>        for (i = 0; i < ureg->const_decls.nr_constant_ranges; i++) {
> diff --git a/src/gallium/auxiliary/tgsi/tgsi_ureg.h
> b/src/gallium/auxiliary/tgsi/tgsi_ureg.h
> index 6a3b5dd..7c7a89e 100644
> --- a/src/gallium/auxiliary/tgsi/tgsi_ureg.h
> +++ b/src/gallium/auxiliary/tgsi/tgsi_ureg.h
> @@ -338,7 +338,7 @@ struct ureg_src
>  ureg_DECL_buffer(struct ureg_program *ureg, unsigned nr, bool atomic);
>
>  struct ureg_src
> -ureg_DECL_shared_memory(struct ureg_program *ureg);
> +ureg_DECL_memory(struct ureg_program *ureg, unsigned memory_type);
>
>  static inline struct ureg_src
>  ureg_imm4f( struct ureg_program *ureg,
> diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp
> b/src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp
> index 8683722..a8258af 100644
> --- a/src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp
> +++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp
> @@ -860,7 +860,7 @@ public:
>     std::vector<Resource> resources;
>
>     struct MemoryFile {
> -      bool shared;
> +      uint8_t mem_type; // TGSI_MEMORY_TYPE_*
>     };
>     std::vector<MemoryFile> memoryFiles;
>
> @@ -1218,7 +1218,7 @@ bool Source::scanDeclaration(const struct
> tgsi_full_declaration *decl)
>        break;
>     case TGSI_FILE_MEMORY:
>        for (i = first; i <= last; ++i)
> -         memoryFiles[i].shared = decl->Declaration.Shared;
> +         memoryFiles[i].mem_type = decl->Declaration.MemType;
>        break;
>     case TGSI_FILE_NULL:
>     case TGSI_FILE_TEMPORARY:
> @@ -1523,7 +1523,8 @@ Converter::makeSym(uint tgsiFile, int fileIdx, int
> idx, int c, uint32_t address)
>
>     sym->reg.fileIndex = fileIdx;
>
> -   if (tgsiFile == TGSI_FILE_MEMORY && code->memoryFiles[fileIdx].shared)
> +   if (tgsiFile == TGSI_FILE_MEMORY &&
> +       code->memoryFiles[fileIdx].mem_type == TGSI_MEMORY_TYPE_SHARED)
>        sym->setFile(FILE_MEMORY_SHARED);
>
>     if (idx >= 0) {
> diff --git a/src/gallium/include/pipe/p_shader_tokens.h
> b/src/gallium/include/pipe/p_shader_tokens.h
> index 9d4a96a..0b8d7fb 100644
> --- a/src/gallium/include/pipe/p_shader_tokens.h
> +++ b/src/gallium/include/pipe/p_shader_tokens.h
> @@ -117,6 +117,12 @@ enum tgsi_file_type {
>  #define TGSI_CYLINDRICAL_WRAP_Z (1 << 2)
>  #define TGSI_CYLINDRICAL_WRAP_W (1 << 3)
>
> +#define TGSI_MEMORY_TYPE_GLOBAL        0 /* GLSL global / OpenCL global
>   */
> +#define TGSI_MEMORY_TYPE_LOCAL         1 /* GLSL local  / OpenCL private
>  */
> +#define TGSI_MEMORY_TYPE_SHARED        2 /* GLSL shared / OpenCL local
>  */
> +#define TGSI_MEMORY_TYPE_INPUT         3 /* For OpenCL kernel input
> params */
>

Note: I know little about how you are approaching the CL implementation for
Nouveau...

Should I expect to see an entry in here anywhere for the CONSTANT memory
type?

My GL knowledge is pretty basic. Would that map reasonably to something
like a GL UBO? Do we need an explicit type for CL constant buffers?

--Aaron



> +#define TGSI_MEMORY_TYPE_COUNT         4
> +
>  struct tgsi_declaration
>  {
>     unsigned Type        : 4;  /**< TGSI_TOKEN_TYPE_DECLARATION */
> @@ -130,8 +136,8 @@ struct tgsi_declaration
>     unsigned Local       : 1;  /**< optimize as subroutine local variable?
> */
>     unsigned Array       : 1;  /**< extra array info? */
>     unsigned Atomic      : 1;  /**< atomic only? for TGSI_FILE_BUFFER */
> -   unsigned Shared      : 1;  /**< shared storage for TGSI_FILE_MEMORY */
> -   unsigned Padding     : 4;
> +   unsigned MemType     : 2;  /**< TGSI_MEMORY_TYPE_x for
> TGSI_FILE_MEMORY */
> +   unsigned Padding     : 3;
>  };
>
>  struct tgsi_declaration_range
> diff --git a/src/mesa/state_tracker/st_glsl_to_tgsi.cpp
> b/src/mesa/state_tracker/st_glsl_to_tgsi.cpp
> index 26e463e..9b8bf8e 100644
> --- a/src/mesa/state_tracker/st_glsl_to_tgsi.cpp
> +++ b/src/mesa/state_tracker/st_glsl_to_tgsi.cpp
> @@ -6281,7 +6281,7 @@ st_translate_program(
>     }
>
>     if (program->use_shared_memory)
> -      t->shared_memory = ureg_DECL_shared_memory(ureg);
> +      t->shared_memory = ureg_DECL_memory(ureg, TGSI_MEMORY_TYPE_SHARED);
>
>     for (i = 0; i < program->shader->NumImages; i++) {
>        if (program->images_used & (1 << i)) {
> --
> 2.7.2
>
> _______________________________________________
> mesa-dev mailing list
> mesa-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/mesa-dev
>

--001a114202f867a6f4052db38fdb
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Thu, Mar 10, 2016 at 9:14 AM, Hans de Goede <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:hdegoede@redhat.com" target=3D"_blank">hdegoede@redhat.com<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
Extend the MEMORY file support to differentiate between global, local<br>
and shared memory, as well as &quot;input&quot; memory.<br>
<br>
&quot;MEMORY[x], INPUT&quot; is intended to access OpenCL kernel parameters=
, a<br>
special memory type is added for this, since the actual storage of these<br=
>
(e.g. UBO-s) may differ per implementation. The uploading of kernel<br>
parameters is handled by launch_grid, &quot;MEMORY[x], INPUT&quot; allows d=
rivers<br>
to use an access mechanism for parameter reads which matches with the<br>
upload method.<br>
<br>
Signed-off-by: Hans de Goede &lt;<a href=3D"mailto:hdegoede@redhat.com">hde=
goede@redhat.com</a>&gt;<br>
---<br>
=C2=A0src/gallium/auxiliary/tgsi/tgsi_build.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 8 +++----<br>
=C2=A0src/gallium/auxiliary/tgsi/tgsi_dump.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 9 ++++++--<br>
=C2=A0src/gallium/auxiliary/tgsi/tgsi_text.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 14 ++++++++++--<br>
=C2=A0src/gallium/auxiliary/tgsi/tgsi_ureg.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 25 ++++++++++++----------<br>
=C2=A0src/gallium/auxiliary/tgsi/tgsi_ureg.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
=C2=A0.../drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp=C2=A0 |=C2=A0 7 +++=
---<br>
=C2=A0src/gallium/include/pipe/p_shader_tokens.h=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0| 10 +++++++--<br>
=C2=A0src/mesa/state_tracker/st_glsl_to_tgsi.cpp=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 2 +-<br>
=C2=A08 files changed, 51 insertions(+), 26 deletions(-)<br>
<br>
diff --git a/src/gallium/auxiliary/tgsi/tgsi_build.c b/src/gallium/auxiliar=
y/tgsi/tgsi_build.c<br>
index c420ae1..b108ade 100644<br>
--- a/src/gallium/auxiliary/tgsi/tgsi_build.c<br>
+++ b/src/gallium/auxiliary/tgsi/tgsi_build.c<br>
@@ -111,7 +111,7 @@ tgsi_default_declaration( void )<br>
=C2=A0 =C2=A0 declaration.Local =3D 0;<br>
=C2=A0 =C2=A0 declaration.Array =3D 0;<br>
=C2=A0 =C2=A0 declaration.Atomic =3D 0;<br>
-=C2=A0 =C2=A0declaration.Shared =3D 0;<br>
+=C2=A0 =C2=A0declaration.MemType =3D TGSI_MEMORY_TYPE_GLOBAL;<br>
=C2=A0 =C2=A0 declaration.Padding =3D 0;<br>
<br>
=C2=A0 =C2=A0 return declaration;<br>
@@ -128,7 +128,7 @@ tgsi_build_declaration(<br>
=C2=A0 =C2=A0 unsigned local,<br>
=C2=A0 =C2=A0 unsigned array,<br>
=C2=A0 =C2=A0 unsigned atomic,<br>
-=C2=A0 =C2=A0unsigned shared,<br>
+=C2=A0 =C2=A0unsigned mem_type,<br>
=C2=A0 =C2=A0 struct tgsi_header *header )<br>
=C2=A0{<br>
=C2=A0 =C2=A0 struct tgsi_declaration declaration;<br>
@@ -146,7 +146,7 @@ tgsi_build_declaration(<br>
=C2=A0 =C2=A0 declaration.Local =3D local;<br>
=C2=A0 =C2=A0 declaration.Array =3D array;<br>
=C2=A0 =C2=A0 declaration.Atomic =3D atomic;<br>
-=C2=A0 =C2=A0declaration.Shared =3D shared;<br>
+=C2=A0 =C2=A0declaration.MemType =3D mem_type;<br>
=C2=A0 =C2=A0 header_bodysize_grow( header );<br>
<br>
=C2=A0 =C2=A0 return declaration;<br>
@@ -406,7 +406,7 @@ tgsi_build_full_declaration(<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0full_decl-&gt;Declaration.Local,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0full_decl-&gt;Declaration.Array,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0full_decl-&gt;Declaration.Atomic,<br>
-=C2=A0 =C2=A0 =C2=A0 full_decl-&gt;Declaration.Shared,<br>
+=C2=A0 =C2=A0 =C2=A0 full_decl-&gt;Declaration.MemType,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0header );<br>
<br>
=C2=A0 =C2=A0 if (maxsize &lt;=3D size)<br>
diff --git a/src/gallium/auxiliary/tgsi/tgsi_dump.c b/src/gallium/auxiliary=
/tgsi/tgsi_dump.c<br>
index f232f38..273f0ae 100644<br>
--- a/src/gallium/auxiliary/tgsi/tgsi_dump.c<br>
+++ b/src/gallium/auxiliary/tgsi/tgsi_dump.c<br>
@@ -365,8 +365,13 @@ iter_declaration(<br>
=C2=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0 if (decl-&gt;Declaration.File =3D=3D TGSI_FILE_MEMORY) {<br>
-=C2=A0 =C2=A0 =C2=A0 if (decl-&gt;Declaration.Shared)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TXT(&quot;, SHARED&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 switch (decl-&gt;Declaration.MemType) {<br>
+=C2=A0 =C2=A0 =C2=A0 /* Note: ,GLOBAL is optional / the default */<br>
+=C2=A0 =C2=A0 =C2=A0 case TGSI_MEMORY_TYPE_GLOBAL: TXT(&quot;, GLOBAL&quot=
;); break;<br>
+=C2=A0 =C2=A0 =C2=A0 case TGSI_MEMORY_TYPE_LOCAL:=C2=A0 TXT(&quot;, LOCAL&=
quot;);=C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 case TGSI_MEMORY_TYPE_SHARED: TXT(&quot;, SHARED&quot=
;); break;<br>
+=C2=A0 =C2=A0 =C2=A0 case TGSI_MEMORY_TYPE_INPUT:=C2=A0 TXT(&quot;, INPUT&=
quot;);=C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0 if (decl-&gt;Declaration.File =3D=3D TGSI_FILE_SAMPLER_VIEW) =
{<br>
diff --git a/src/gallium/auxiliary/tgsi/tgsi_text.c b/src/gallium/auxiliary=
/tgsi/tgsi_text.c<br>
index 77598d2..9438e3b 100644<br>
--- a/src/gallium/auxiliary/tgsi/tgsi_text.c<br>
+++ b/src/gallium/auxiliary/tgsi/tgsi_text.c<br>
@@ -1390,8 +1390,18 @@ static boolean parse_declaration( struct translate_c=
tx *ctx )<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ctx-&gt;cur =3D cur;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0} else if (file =3D=3D TGSI_FILE_MEMORY) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (str_match_nocase_whole(&amp;cur, &qu=
ot;SHARED&quot;)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 decl.Declaration.Shared =3D 1;<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (str_match_nocase_whole(&amp;cur, &qu=
ot;GLOBAL&quot;)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Note this is a no-op global i=
s the default */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 decl.Declaration.MemType =3D TGS=
I_MEMORY_TYPE_GLOBAL;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ctx-&gt;cur =3D cur;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else if (str_match_nocase_whole(&amp;c=
ur, &quot;LOCAL&quot;)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 decl.Declaration.MemType =3D TGS=
I_MEMORY_TYPE_LOCAL;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ctx-&gt;cur =3D cur;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else if (str_match_nocase_whole(&amp;c=
ur, &quot;SHARED&quot;)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 decl.Declaration.MemType =3D TGS=
I_MEMORY_TYPE_SHARED;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ctx-&gt;cur =3D cur;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else if (str_match_nocase_whole(&amp;c=
ur, &quot;INPUT&quot;)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 decl.Declaration.MemType =3D TGS=
I_MEMORY_TYPE_INPUT;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ctx-&gt;cur =3D cur;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
diff --git a/src/gallium/auxiliary/tgsi/tgsi_ureg.c b/src/gallium/auxiliary=
/tgsi/tgsi_ureg.c<br>
index e1a7278..9e10044 100644<br>
--- a/src/gallium/auxiliary/tgsi/tgsi_ureg.c<br>
+++ b/src/gallium/auxiliary/tgsi/tgsi_ureg.c<br>
@@ -190,7 +190,7 @@ struct ureg_program<br>
<br>
=C2=A0 =C2=A0 struct ureg_tokens domain[2];<br>
<br>
-=C2=A0 =C2=A0bool use_shared_memory;<br>
+=C2=A0 =C2=A0bool use_memory[TGSI_MEMORY_TYPE_COUNT];<br>
=C2=A0};<br>
<br>
=C2=A0static union tgsi_any_token error_tokens[32];<br>
@@ -729,13 +729,14 @@ struct ureg_src ureg_DECL_buffer(struct ureg_program =
*ureg, unsigned nr,<br>
=C2=A0 =C2=A0 return reg;<br>
=C2=A0}<br>
<br>
-/* Allocate a shared memory area.<br>
+/* Allocate a memory area.<br>
=C2=A0 */<br>
-struct ureg_src ureg_DECL_shared_memory(struct ureg_program *ureg)<br>
+struct ureg_src ureg_DECL_memory(struct ureg_program *ureg,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned memory_type)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0struct ureg_src reg =3D ureg_src_register(TGSI_FILE_MEMORY, 0=
);<br>
+=C2=A0 =C2=A0struct ureg_src reg =3D ureg_src_register(TGSI_FILE_MEMORY, m=
emory_type);<br>
<br>
-=C2=A0 =C2=A0ureg-&gt;use_shared_memory =3D true;<br>
+=C2=A0 =C2=A0ureg-&gt;use_memory[memory_type] =3D true;<br>
=C2=A0 =C2=A0 return reg;<br>
=C2=A0}<br>
<br>
@@ -1666,7 +1667,7 @@ emit_decl_buffer(struct ureg_program *ureg,<br>
=C2=A0}<br>
<br>
=C2=A0static void<br>
-emit_decl_shared_memory(struct ureg_program *ureg)<br>
+emit_decl_memory(struct ureg_program *ureg, unsigned memory_type)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 union tgsi_any_token *out =3D get_tokens(ureg, DOMAIN_DECL, 2=
);<br>
<br>
@@ -1675,11 +1676,11 @@ emit_decl_shared_memory(struct ureg_program *ureg)<=
br>
=C2=A0 =C2=A0 out[0].decl.NrTokens =3D 2;<br>
=C2=A0 =C2=A0 out[0].decl.File =3D TGSI_FILE_MEMORY;<br>
=C2=A0 =C2=A0 out[0].decl.UsageMask =3D TGSI_WRITEMASK_XYZW;<br>
-=C2=A0 =C2=A0out[0].decl.Shared =3D true;<br>
+=C2=A0 =C2=A0out[0].decl.MemType =3D memory_type;<br>
<br>
=C2=A0 =C2=A0 out[1].value =3D 0;<br>
-=C2=A0 =C2=A0out[1].decl_range.First =3D 0;<br>
-=C2=A0 =C2=A0out[1].decl_range.Last =3D 0;<br>
+=C2=A0 =C2=A0out[1].decl_range.First =3D memory_type;<br>
+=C2=A0 =C2=A0out[1].decl_range.Last =3D memory_type;<br>
=C2=A0}<br>
<br>
=C2=A0static void<br>
@@ -1854,8 +1855,10 @@ static void emit_decls( struct ureg_program *ureg )<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0emit_decl_buffer(ureg, ureg-&gt;buffer[i].index,=
 ureg-&gt;buffer[i].atomic);<br>
=C2=A0 =C2=A0 }<br>
<br>
-=C2=A0 =C2=A0if (ureg-&gt;use_shared_memory)<br>
-=C2=A0 =C2=A0 =C2=A0 emit_decl_shared_memory(ureg);<br>
+=C2=A0 =C2=A0for (i =3D 0; i &lt; TGSI_MEMORY_TYPE_COUNT; i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 if (ureg-&gt;use_memory[i])<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0emit_decl_memory(ureg, i);<br>
+=C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 if (ureg-&gt;const_decls.nr_constant_ranges) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; ureg-&gt;const_decls.nr_con=
stant_ranges; i++) {<br>
diff --git a/src/gallium/auxiliary/tgsi/tgsi_ureg.h b/src/gallium/auxiliary=
/tgsi/tgsi_ureg.h<br>
index 6a3b5dd..7c7a89e 100644<br>
--- a/src/gallium/auxiliary/tgsi/tgsi_ureg.h<br>
+++ b/src/gallium/auxiliary/tgsi/tgsi_ureg.h<br>
@@ -338,7 +338,7 @@ struct ureg_src<br>
=C2=A0ureg_DECL_buffer(struct ureg_program *ureg, unsigned nr, bool atomic)=
;<br>
<br>
=C2=A0struct ureg_src<br>
-ureg_DECL_shared_memory(struct ureg_program *ureg);<br>
+ureg_DECL_memory(struct ureg_program *ureg, unsigned memory_type);<br>
<br>
=C2=A0static inline struct ureg_src<br>
=C2=A0ureg_imm4f( struct ureg_program *ureg,<br>
diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp b/sr=
c/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp<br>
index 8683722..a8258af 100644<br>
--- a/src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp<br>
+++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp<br>
@@ -860,7 +860,7 @@ public:<br>
=C2=A0 =C2=A0 std::vector&lt;Resource&gt; resources;<br>
<br>
=C2=A0 =C2=A0 struct MemoryFile {<br>
-=C2=A0 =C2=A0 =C2=A0 bool shared;<br>
+=C2=A0 =C2=A0 =C2=A0 uint8_t mem_type; // TGSI_MEMORY_TYPE_*<br>
=C2=A0 =C2=A0 };<br>
=C2=A0 =C2=A0 std::vector&lt;MemoryFile&gt; memoryFiles;<br>
<br>
@@ -1218,7 +1218,7 @@ bool Source::scanDeclaration(const struct tgsi_full_d=
eclaration *decl)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 case TGSI_FILE_MEMORY:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D first; i &lt;=3D last; ++i)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memoryFiles[i].shared =3D decl-&gt;Decla=
ration.Shared;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memoryFiles[i].mem_type =3D decl-&gt;Dec=
laration.MemType;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 case TGSI_FILE_NULL:<br>
=C2=A0 =C2=A0 case TGSI_FILE_TEMPORARY:<br>
@@ -1523,7 +1523,8 @@ Converter::makeSym(uint tgsiFile, int fileIdx, int id=
x, int c, uint32_t address)<br>
<br>
=C2=A0 =C2=A0 sym-&gt;reg.fileIndex =3D fileIdx;<br>
<br>
-=C2=A0 =C2=A0if (tgsiFile =3D=3D TGSI_FILE_MEMORY &amp;&amp; code-&gt;memo=
ryFiles[fileIdx].shared)<br>
+=C2=A0 =C2=A0if (tgsiFile =3D=3D TGSI_FILE_MEMORY &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0code-&gt;memoryFiles[fileIdx].mem_type =3D=3D T=
GSI_MEMORY_TYPE_SHARED)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0sym-&gt;setFile(FILE_MEMORY_SHARED);<br>
<br>
=C2=A0 =C2=A0 if (idx &gt;=3D 0) {<br>
diff --git a/src/gallium/include/pipe/p_shader_tokens.h b/src/gallium/inclu=
de/pipe/p_shader_tokens.h<br>
index 9d4a96a..0b8d7fb 100644<br>
--- a/src/gallium/include/pipe/p_shader_tokens.h<br>
+++ b/src/gallium/include/pipe/p_shader_tokens.h<br>
@@ -117,6 +117,12 @@ enum tgsi_file_type {<br>
=C2=A0#define TGSI_CYLINDRICAL_WRAP_Z (1 &lt;&lt; 2)<br>
=C2=A0#define TGSI_CYLINDRICAL_WRAP_W (1 &lt;&lt; 3)<br>
<br>
+#define TGSI_MEMORY_TYPE_GLOBAL=C2=A0 =C2=A0 =C2=A0 =C2=A0 0 /* GLSL globa=
l / OpenCL global=C2=A0 =C2=A0 */<br>
+#define TGSI_MEMORY_TYPE_LOCAL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01 /* GLSL =
local=C2=A0 / OpenCL private=C2=A0 =C2=A0*/<br>
+#define TGSI_MEMORY_TYPE_SHARED=C2=A0 =C2=A0 =C2=A0 =C2=A0 2 /* GLSL share=
d / OpenCL local=C2=A0 =C2=A0 =C2=A0*/<br>
+#define TGSI_MEMORY_TYPE_INPUT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A03 /* For O=
penCL kernel input params */<br></blockquote><div><br></div><div>Note: I kn=
ow little about how you are approaching the CL implementation for Nouveau..=
.<br><br></div><div>Should I expect to see an entry in here anywhere for th=
e CONSTANT memory type?<br><br></div><div>My GL knowledge is pretty basic. =
Would that map reasonably to something like a GL UBO? Do we need an explici=
t type for CL constant buffers?<br><br></div><div>--Aaron<br></div><div><br=
>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+#define TGSI_MEMORY_TYPE_COUNT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A04<br>
+<br>
=C2=A0struct tgsi_declaration<br>
=C2=A0{<br>
=C2=A0 =C2=A0 unsigned Type=C2=A0 =C2=A0 =C2=A0 =C2=A0 : 4;=C2=A0 /**&lt; T=
GSI_TOKEN_TYPE_DECLARATION */<br>
@@ -130,8 +136,8 @@ struct tgsi_declaration<br>
=C2=A0 =C2=A0 unsigned Local=C2=A0 =C2=A0 =C2=A0 =C2=A0: 1;=C2=A0 /**&lt; o=
ptimize as subroutine local variable? */<br>
=C2=A0 =C2=A0 unsigned Array=C2=A0 =C2=A0 =C2=A0 =C2=A0: 1;=C2=A0 /**&lt; e=
xtra array info? */<br>
=C2=A0 =C2=A0 unsigned Atomic=C2=A0 =C2=A0 =C2=A0 : 1;=C2=A0 /**&lt; atomic=
 only? for TGSI_FILE_BUFFER */<br>
-=C2=A0 =C2=A0unsigned Shared=C2=A0 =C2=A0 =C2=A0 : 1;=C2=A0 /**&lt; shared=
 storage for TGSI_FILE_MEMORY */<br>
-=C2=A0 =C2=A0unsigned Padding=C2=A0 =C2=A0 =C2=A0: 4;<br>
+=C2=A0 =C2=A0unsigned MemType=C2=A0 =C2=A0 =C2=A0: 2;=C2=A0 /**&lt; TGSI_M=
EMORY_TYPE_x for TGSI_FILE_MEMORY */<br>
+=C2=A0 =C2=A0unsigned Padding=C2=A0 =C2=A0 =C2=A0: 3;<br>
=C2=A0};<br>
<br>
=C2=A0struct tgsi_declaration_range<br>
diff --git a/src/mesa/state_tracker/st_glsl_to_tgsi.cpp b/src/mesa/state_tr=
acker/st_glsl_to_tgsi.cpp<br>
index 26e463e..9b8bf8e 100644<br>
--- a/src/mesa/state_tracker/st_glsl_to_tgsi.cpp<br>
+++ b/src/mesa/state_tracker/st_glsl_to_tgsi.cpp<br>
@@ -6281,7 +6281,7 @@ st_translate_program(<br>
=C2=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0 if (program-&gt;use_shared_memory)<br>
-=C2=A0 =C2=A0 =C2=A0 t-&gt;shared_memory =3D ureg_DECL_shared_memory(ureg)=
;<br>
+=C2=A0 =C2=A0 =C2=A0 t-&gt;shared_memory =3D ureg_DECL_memory(ureg, TGSI_M=
EMORY_TYPE_SHARED);<br>
<br>
=C2=A0 =C2=A0 for (i =3D 0; i &lt; program-&gt;shader-&gt;NumImages; i++) {=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0if (program-&gt;images_used &amp; (1 &lt;&lt; i)=
) {<br>
<span class=3D""><font color=3D"#888888">--<br>
2.7.2<br>
<br>
_______________________________________________<br>
mesa-dev mailing list<br>
<a href=3D"mailto:mesa-dev@lists.freedesktop.org">mesa-dev@lists.freedeskto=
p.org</a><br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/mesa-dev" rel=3D"=
noreferrer" target=3D"_blank">https://lists.freedesktop.org/mailman/listinf=
o/mesa-dev</a><br>
</font></span></blockquote></div><br></div></div>

--001a114202f867a6f4052db38fdb--

--===============0104368529==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbWVzYS1kZXYg
bWFpbGluZyBsaXN0Cm1lc2EtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL21lc2EtZGV2Cg==

--===============0104368529==--
