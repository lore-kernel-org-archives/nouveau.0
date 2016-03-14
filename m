From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: [RFC mesa] nouveau: Add support for OpenCL global
	memory buffers
Date: Mon, 14 Mar 2016 11:05:14 -0400
Message-ID: <CAKb7UvgcDxt0_GHr6W5zNvUwEY8FJSSfPD3wEhqr4t-3i5xPLg@mail.gmail.com>
References: <1457961752-1461-1-git-send-email-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1702253420=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1457961752-1461-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============1702253420==
Content-Type: multipart/alternative; boundary=047d7b3a9acaaa2c95052e039b57

--047d7b3a9acaaa2c95052e039b57
Content-Type: text/plain; charset=UTF-8

There's a less hacky and more hacky way forward. The more hacky solution is
to set file index to -1 or something and then not do the lowering when you
see that.

The less hacky solution is the one you proposed as #1 - introduce a new
file for "buffer" memory and lower it to the global file by adding a base
offset.

Right now the meaning of global is overloaded - before lowering it
implicitly includes the buffer vase address, and after lowering, it
explicitly includes it. Splitting it out I to another file type seems like
the cleaner way forward, not sure what issue you were seeing with that
approach. (I didn't understand your argument about potential future
issues.) What I really don't want is to somehow differentiate glsl-sourced
and opencl-sourced compute programs in the backend.
On Mar 14, 2016 6:22 AM, "Hans de Goede" <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:

> This little "hack" fixes the use of OpenCL global memory buffers with
> nouveau, but clearly the #if 0 is not a solution as it breaks buffers
> with GLSL.
>
> The reason I'm posting this as an RFC patch is to discuss how to solve
> this properly, 2 solutions come to mind:
>
> 1) Use separate nv50_ir::FILE_MEMORY_xxx values for buffers versus
>    TGSI_FILE_MEMORY with TGSI_MEMORY_TYPE_GLOBAL, looking at
> translateFile()
>    we currently have:
>
>    case TGSI_FILE_BUFFER:          return nv50_ir::FILE_MEMORY_GLOBAL;
>    case TGSI_FILE_MEMORY:          return nv50_ir::FILE_MEMORY_GLOBAL;
>
>    So doing a s/nv50_ir::FILE_MEMORY_GLOBAL/nv50_ir::FILE_MEMORY_BUFFER/
>    everywhere and then adding a new FILE_MEMORY_GLOBAL seems like an
>    obvious fix.
>
>    But I'm afraid that we will have similar issues with OpenCL using
>    flat addresses where as GLSL will have some implied base-address /
>    offset in other places too, which brings me to solution 2:
>
> 2) Add a flag to Program to indicate that it is an OpenCL compute kernel;
>    or possible use a different Program::TYPE_* for OpenCL ?
>
>    I've a feeling that this is what we want since the addressing models
>    are just different and we likely will need to implement different
> behavior
>    in various places based on this.
>
>    This will also allow us to use INPUT and CONST in tgsi code build from
>    OpenCL programs and use that flag to do the right thing, rather then
>    introducing new MEMORY[x], INPUT resp. MEMORY[x], CONST declarations
>    for this.
>
>    I'm esp. worried that once GLSL gets global support it will want
>    different behavior for TGSI_FILE_MEMORY with TGSI_MEMORY_TYPE_GLOBAL
>    then OpenCL, just like things are now with buffers, rendering solution
>    1. a non solution
>
> So I'm seeking input on how to move forward with this ...  ?
>
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> ---
>  src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp     | 4 ++++
>  src/gallium/drivers/nouveau/codegen/nv50_ir_lowering_nvc0.cpp | 2 ++
>  2 files changed, 6 insertions(+)
>
> diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp
> b/src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp
> index de0c72b..15012ac 100644
> --- a/src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp
> +++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp
> @@ -1525,6 +1525,10 @@ Converter::makeSym(uint tgsiFile, int fileIdx, int
> idx, int c, uint32_t address)
>
>     if (tgsiFile == TGSI_FILE_MEMORY) {
>        switch (code->memoryFiles[fileIdx].mem_type) {
> +      case TGSI_MEMORY_TYPE_GLOBAL:
> +         /* No-op this is the default for TGSI_FILE_MEMORY */
> +         sym->setFile(FILE_MEMORY_GLOBAL);
> +         break;
>        case TGSI_MEMORY_TYPE_SHARED:
>           sym->setFile(FILE_MEMORY_SHARED);
>           break;
> diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_lowering_nvc0.cpp
> b/src/gallium/drivers/nouveau/codegen/nv50_ir_lowering_nvc0.cpp
> index 6cb4dd4..bcc96de 100644
> --- a/src/gallium/drivers/nouveau/codegen/nv50_ir_lowering_nvc0.cpp
> +++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_lowering_nvc0.cpp
> @@ -2106,6 +2106,7 @@ NVC0LoweringPass::visit(Instruction *i)
>        } else if (i->src(0).getFile() == FILE_SHADER_OUTPUT) {
>           assert(prog->getType() == Program::TYPE_TESSELLATION_CONTROL);
>           i->op = OP_VFETCH;
> +#if 0
>        } else if (i->src(0).getFile() == FILE_MEMORY_GLOBAL) {
>           Value *ind = i->getIndirect(0, 1);
>           Value *ptr = loadResInfo64(ind, i->getSrc(0)->reg.fileIndex *
> 16);
> @@ -2126,6 +2127,7 @@ NVC0LoweringPass::visit(Instruction *i)
>           if (i->defExists(0)) {
>              bld.mkMov(i->getDef(0), bld.mkImm(0));
>           }
> +#endif
>        }
>        break;
>     case OP_ATOM:
> --
> 2.7.2
>
>

--047d7b3a9acaaa2c95052e039b57
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">There&#39;s a less hacky and more hacky way forward. The mor=
e hacky solution is to set file index to -1 or something and then not do th=
e lowering when you see that.</p>
<p dir=3D"ltr">The less hacky solution is the one you proposed as #1 - intr=
oduce a new file for &quot;buffer&quot; memory and lower it to the global f=
ile by adding a base offset.</p>
<p dir=3D"ltr">Right now the meaning of global is overloaded - before lower=
ing it implicitly includes the buffer vase address, and after lowering, it =
explicitly includes it. Splitting it out I to another file type seems like =
the cleaner way forward, not sure what issue you were seeing with that appr=
oach. (I didn&#39;t understand your argument about potential future issues.=
) What I really don&#39;t want is to somehow differentiate glsl-sourced and=
 opencl-sourced compute programs in the backend.</p>
<div class=3D"gmail_quote">On Mar 14, 2016 6:22 AM, &quot;Hans de Goede&quo=
t; &lt;<a href=3D"mailto:hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org">hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org</a>&gt; w=
rote:<br type=3D"attribution"><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">This little &q=
uot;hack&quot; fixes the use of OpenCL global memory buffers with<br>
nouveau, but clearly the #if 0 is not a solution as it breaks buffers<br>
with GLSL.<br>
<br>
The reason I&#39;m posting this as an RFC patch is to discuss how to solve<=
br>
this properly, 2 solutions come to mind:<br>
<br>
1) Use separate nv50_ir::FILE_MEMORY_xxx values for buffers versus<br>
=C2=A0 =C2=A0TGSI_FILE_MEMORY with TGSI_MEMORY_TYPE_GLOBAL, looking at tran=
slateFile()<br>
=C2=A0 =C2=A0we currently have:<br>
<br>
=C2=A0 =C2=A0case TGSI_FILE_BUFFER:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 retur=
n nv50_ir::FILE_MEMORY_GLOBAL;<br>
=C2=A0 =C2=A0case TGSI_FILE_MEMORY:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 retur=
n nv50_ir::FILE_MEMORY_GLOBAL;<br>
<br>
=C2=A0 =C2=A0So doing a s/nv50_ir::FILE_MEMORY_GLOBAL/nv50_ir::FILE_MEMORY_=
BUFFER/<br>
=C2=A0 =C2=A0everywhere and then adding a new FILE_MEMORY_GLOBAL seems like=
 an<br>
=C2=A0 =C2=A0obvious fix.<br>
<br>
=C2=A0 =C2=A0But I&#39;m afraid that we will have similar issues with OpenC=
L using<br>
=C2=A0 =C2=A0flat addresses where as GLSL will have some implied base-addre=
ss /<br>
=C2=A0 =C2=A0offset in other places too, which brings me to solution 2:<br>
<br>
2) Add a flag to Program to indicate that it is an OpenCL compute kernel;<b=
r>
=C2=A0 =C2=A0or possible use a different Program::TYPE_* for OpenCL ?<br>
<br>
=C2=A0 =C2=A0I&#39;ve a feeling that this is what we want since the address=
ing models<br>
=C2=A0 =C2=A0are just different and we likely will need to implement differ=
ent behavior<br>
=C2=A0 =C2=A0in various places based on this.<br>
<br>
=C2=A0 =C2=A0This will also allow us to use INPUT and CONST in tgsi code bu=
ild from<br>
=C2=A0 =C2=A0OpenCL programs and use that flag to do the right thing, rathe=
r then<br>
=C2=A0 =C2=A0introducing new MEMORY[x], INPUT resp. MEMORY[x], CONST declar=
ations<br>
=C2=A0 =C2=A0for this.<br>
<br>
=C2=A0 =C2=A0I&#39;m esp. worried that once GLSL gets global support it wil=
l want<br>
=C2=A0 =C2=A0different behavior for TGSI_FILE_MEMORY with TGSI_MEMORY_TYPE_=
GLOBAL<br>
=C2=A0 =C2=A0then OpenCL, just like things are now with buffers, rendering =
solution<br>
=C2=A0 =C2=A01. a non solution<br>
<br>
So I&#39;m seeking input on how to move forward with this ...=C2=A0 ?<br>
<br>
Signed-off-by: Hans de Goede &lt;<a href=3D"mailto:hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org">hde=
goede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org</a>&gt;<br>
---<br>
=C2=A0src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp=C2=A0 =C2=
=A0 =C2=A0| 4 ++++<br>
=C2=A0src/gallium/drivers/nouveau/codegen/nv50_ir_lowering_nvc0.cpp | 2 ++<=
br>
=C2=A02 files changed, 6 insertions(+)<br>
<br>
diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp b/sr=
c/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp<br>
index de0c72b..15012ac 100644<br>
--- a/src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp<br>
+++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp<br>
@@ -1525,6 +1525,10 @@ Converter::makeSym(uint tgsiFile, int fileIdx, int i=
dx, int c, uint32_t address)<br>
<br>
=C2=A0 =C2=A0 if (tgsiFile =3D=3D TGSI_FILE_MEMORY) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0switch (code-&gt;memoryFiles[fileIdx].mem_type) =
{<br>
+=C2=A0 =C2=A0 =C2=A0 case TGSI_MEMORY_TYPE_GLOBAL:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* No-op this is the default for TGSI_FI=
LE_MEMORY */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sym-&gt;setFile(FILE_MEMORY_GLOBAL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0case TGSI_MEMORY_TYPE_SHARED:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sym-&gt;setFile(FILE_MEMORY_SHARED);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_lowering_nvc0.cpp =
b/src/gallium/drivers/nouveau/codegen/nv50_ir_lowering_nvc0.cpp<br>
index 6cb4dd4..bcc96de 100644<br>
--- a/src/gallium/drivers/nouveau/codegen/nv50_ir_lowering_nvc0.cpp<br>
+++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_lowering_nvc0.cpp<br>
@@ -2106,6 +2106,7 @@ NVC0LoweringPass::visit(Instruction *i)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0} else if (i-&gt;src(0).getFile() =3D=3D FILE_SH=
ADER_OUTPUT) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 assert(prog-&gt;getType() =3D=3D Program=
::TYPE_TESSELLATION_CONTROL);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i-&gt;op =3D OP_VFETCH;<br>
+#if 0<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0} else if (i-&gt;src(0).getFile() =3D=3D FILE_ME=
MORY_GLOBAL) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Value *ind =3D i-&gt;getIndirect(0, 1);<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Value *ptr =3D loadResInfo64(ind, i-&gt;=
getSrc(0)-&gt;reg.fileIndex * 16);<br>
@@ -2126,6 +2127,7 @@ NVC0LoweringPass::visit(Instruction *i)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (i-&gt;defExists(0)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bld.mkMov(i-&gt;getDef(0), =
bld.mkImm(0));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+#endif<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 case OP_ATOM:<br>
--<br>
2.7.2<br>
<br>
</blockquote></div>

--047d7b3a9acaaa2c95052e039b57--

--===============1702253420==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1702253420==--
