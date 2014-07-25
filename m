From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: [PATCH] nv50/ir: (trivial) initialize pointer to
	silence warning
Date: Fri, 25 Jul 2014 12:58:55 -0400
Message-ID: <CAKb7UvgG5WfF3guH-g34Fr5-Yzh9NWq8ThBXAx3uzhE6x+cA8w@mail.gmail.com>
References: <1406302615-12971-1-git-send-email-tobias.johannes.klausmann@mni.thm.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1624270320=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1406302615-12971-1-git-send-email-tobias.johannes.klausmann-AqjdNwhu20eELgA04lAiVw@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Tobias Klausmann <tobias.johannes.klausmann-AqjdNwhu20eELgA04lAiVw@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============1624270320==
Content-Type: multipart/alternative; boundary=089e013cbd821e5eb704ff077da3

--089e013cbd821e5eb704ff077da3
Content-Type: text/plain; charset=UTF-8

What warning with what compiler? Pretty sure this builds cleanly for me.

On Jul 25, 2014 11:37 AM, "Tobias Klausmann" <
tobias.johannes.klausmann-AqjdNwhu20eELgA04lAiVw@public.gmane.org> wrote:
>
> Signed-off-by: Tobias Klausmann <tobias.johannes.klausmann-AqjdNwhu20eELgA04lAiVw@public.gmane.org>
> ---
>  src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp
b/src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp
> index 14b6d68..7aa4728 100644
> --- a/src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp
> +++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp
> @@ -2139,7 +2139,7 @@ Converter::handleINTERP(Value *dst[4])
>  {
>     // Check whether the input is linear. All other attributes ignored.
>     Instruction *insn;
> -   Value *offset = NULL, *ptr = NULL, *w;
> +   Value *offset = NULL, *ptr = NULL, *w = NULL;
>     bool linear;
>     operation op;
>     int c, mode;
> --
> 1.8.4.5
>

--089e013cbd821e5eb704ff077da3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">What warning with what compiler? Pretty sure this builds cle=
anly for me.</p>
<p dir=3D"ltr">On Jul 25, 2014 11:37 AM, &quot;Tobias Klausmann&quot; &lt;<=
a href=3D"mailto:tobias.johannes.klausmann-AqjdNwhu20eELgA04lAiVw@public.gmane.org">tobias.johannes.klau=
smann-AqjdNwhu20eELgA04lAiVw@public.gmane.org</a>&gt; wrote:<br>
&gt;<br>
&gt; Signed-off-by: Tobias Klausmann &lt;<a href=3D"mailto:tobias.johannes.=
klausmann-AqjdNwhu20eELgA04lAiVw@public.gmane.org">tobias.johannes.klausmann-AqjdNwhu20eELgA04lAiVw@public.gmane.org</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp | 2 +-=
<br>
&gt; =C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp=
 b/src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp<br>
&gt; index 14b6d68..7aa4728 100644<br>
&gt; --- a/src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp<br>
&gt; +++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp<br>
&gt; @@ -2139,7 +2139,7 @@ Converter::handleINTERP(Value *dst[4])<br>
&gt; =C2=A0{<br>
&gt; =C2=A0 =C2=A0 // Check whether the input is linear. All other attribut=
es ignored.<br>
&gt; =C2=A0 =C2=A0 Instruction *insn;<br>
&gt; - =C2=A0 Value *offset =3D NULL, *ptr =3D NULL, *w;<br>
&gt; + =C2=A0 Value *offset =3D NULL, *ptr =3D NULL, *w =3D NULL;<br>
&gt; =C2=A0 =C2=A0 bool linear;<br>
&gt; =C2=A0 =C2=A0 operation op;<br>
&gt; =C2=A0 =C2=A0 int c, mode;<br>
&gt; --<br>
&gt; 1.8.4.5<br>
&gt;<br>
</p>

--089e013cbd821e5eb704ff077da3--

--===============1624270320==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1624270320==--
