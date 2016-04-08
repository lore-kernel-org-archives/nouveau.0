From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: [PATCH] nouveau: codegen: Take src swizzle into
	account on loads
Date: Fri, 8 Apr 2016 09:56:17 -0400
Message-ID: <CAKb7UvjvWrs1bS1S6Q-SEgSoSWLOEZOhTiJbVoAoqpVQR27jWA@mail.gmail.com>
References: <1460035648-3804-1-git-send-email-hdegoede@redhat.com>
 <CAKb7Uvhf=6TngukZe976+fX2zibE6U4D05zYOUEj_F5mCVKOBA@mail.gmail.com>
 <5707797B.4040708@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0357545580=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <5707797B.4040708-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
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
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============0357545580==
Content-Type: multipart/alternative; boundary=001a1141fb12168510052ff98f9c

--001a1141fb12168510052ff98f9c
Content-Type: text/plain; charset=UTF-8

Ah, I may have read over your commit too hastily. Will have another look.
On Apr 8, 2016 5:27 AM, "Hans de Goede" <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:

> Hi,
>
> On 07-04-16 15:58, Ilia Mirkin wrote:
>
>> That's wrong.
>>
>
> It used to work with the old RES[] code and if one cannot specify
> a source swizzle, then how can I do something like
>
> LOAD TEMP[0].y, MEMORY[0], address
>
> And get the data at absolute global memory address "address" into
> TEMP[0].y ?
>
> This is a must-have for llvm to be able to generate working TGSI code,
> I do not see any way around this.
>
> AFAIK this is exactly what src-swizzling is for. Also note that
> this commit does not change anything if no src-swizzling is specified,
> in that case things work exactly as before.
>
> > The spec for the instruction needs to be clarified...
>
>> The current nouveau impl is correct - only the .x of the address
>> should be loaded, with up to 16 bytes read into the destination.
>>
>
> Ah note this is not about swizzling on the address, that indeed
> makes no sense given how the addressing works for BUFFERS / MEMORY,
> no this is about adding a swizlling postfix to the buffer / memory
> resource specification, for example:
>
> LOAD TEMP[0].y, MEMORY[0].xxxx, TEMP[0]
>
> See the swizzling is done on the resource, not on the address, so
> the swizzling specifies swizzling of the up to 16 bytes read from
> address, it does not influence the address handling at all.
>
> I now see I made an error in my commit msg, it gives the following
> example:
>
> LOAD TEMP[0].y, MEMORY[0].xxxx, TEMP[0].x
>
> This clearly is wrong, the last TEMP[0].x is not even valid TGSI,
> the correct example would be:
>
> LOAD TEMP[0].y, MEMORY[0].xxxx, TEMP[0]
>
> Regards,
>
> Hans
>
>
> On Thu, Apr 7, 2016 at 9:27 AM, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
>>
>>> The llvm TGSI backend does things like:
>>>
>>>
>>>
>>> Expecting the data at address TEMP[0].x to get loaded to
>>> TEMP[0].y. Before this commit the data at TEMP[0].x + 4 would be
>>> loaded instead. This commit fixes this.
>>>
>>> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>>> ---
>>>   src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp | 8 ++++++--
>>>   1 file changed, 6 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp
>>> b/src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp
>>> index 557608e..cc51f5a 100644
>>> --- a/src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp
>>> +++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp
>>> @@ -2279,12 +2279,16 @@ Converter::handleLOAD(Value *dst0[4])
>>>
>>>            Value *off = fetchSrc(1, c);
>>>            Symbol *sym;
>>> +         uint32_t src0_component_offset = tgsi.getSrc(0).getSwizzle(c)
>>> * 4;
>>> +
>>>            if (tgsi.getSrc(1).getFile() == TGSI_FILE_IMMEDIATE) {
>>>               off = NULL;
>>>               sym = makeSym(tgsi.getSrc(0).getFile(), r, -1, c,
>>> -                          tgsi.getSrc(1).getValueU32(0, info) + 4 * c);
>>> +                          tgsi.getSrc(1).getValueU32(0, info) +
>>> +                          src0_component_offset);
>>>            } else {
>>> -            sym = makeSym(tgsi.getSrc(0).getFile(), r, -1, c, 4 * c);
>>> +            sym = makeSym(tgsi.getSrc(0).getFile(), r, -1, c,
>>> +                          src0_component_offset);
>>>            }
>>>
>>>            Instruction *ld = mkLoad(TYPE_U32, dst0[c], sym, off);
>>> --
>>> 2.7.3
>>>
>>>

--001a1141fb12168510052ff98f9c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">Ah, I may have read over your commit too hastily. Will have =
another look.</p>
<div class=3D"gmail_quote">On Apr 8, 2016 5:27 AM, &quot;Hans de Goede&quot=
; &lt;<a href=3D"mailto:hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org">hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org</a>&gt; wr=
ote:<br type=3D"attribution"><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi,<br>
<br>
On 07-04-16 15:58, Ilia Mirkin wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
That&#39;s wrong.<br>
</blockquote>
<br>
It used to work with the old RES[] code and if one cannot specify<br>
a source swizzle, then how can I do something like<br>
<br>
LOAD TEMP[0].y, MEMORY[0], address<br>
<br>
And get the data at absolute global memory address &quot;address&quot; into=
 TEMP[0].y ?<br>
<br>
This is a must-have for llvm to be able to generate working TGSI code,<br>
I do not see any way around this.<br>
<br>
AFAIK this is exactly what src-swizzling is for. Also note that<br>
this commit does not change anything if no src-swizzling is specified,<br>
in that case things work exactly as before.<br>
<br>
&gt; The spec for the instruction needs to be clarified...<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
The current nouveau impl is correct - only the .x of the address<br>
should be loaded, with up to 16 bytes read into the destination.<br>
</blockquote>
<br>
Ah note this is not about swizzling on the address, that indeed<br>
makes no sense given how the addressing works for BUFFERS / MEMORY,<br>
no this is about adding a swizlling postfix to the buffer / memory<br>
resource specification, for example:<br>
<br>
LOAD TEMP[0].y, MEMORY[0].xxxx, TEMP[0]<br>
<br>
See the swizzling is done on the resource, not on the address, so<br>
the swizzling specifies swizzling of the up to 16 bytes read from<br>
address, it does not influence the address handling at all.<br>
<br>
I now see I made an error in my commit msg, it gives the following<br>
example:<br>
<br>
LOAD TEMP[0].y, MEMORY[0].xxxx, TEMP[0].x<br>
<br>
This clearly is wrong, the last TEMP[0].x is not even valid TGSI,<br>
the correct example would be:<br>
<br>
LOAD TEMP[0].y, MEMORY[0].xxxx, TEMP[0]<br>
<br>
Regards,<br>
<br>
Hans<br>
<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
On Thu, Apr 7, 2016 at 9:27 AM, Hans de Goede &lt;<a href=3D"mailto:hdegoed=
e@redhat.com" target=3D"_blank">hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org</a>&gt; wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
The llvm TGSI backend does things like:<br>
<br>
<br>
<br>
Expecting the data at address TEMP[0].x to get loaded to<br>
TEMP[0].y. Before this commit the data at TEMP[0].x + 4 would be<br>
loaded instead. This commit fixes this.<br>
<br>
Signed-off-by: Hans de Goede &lt;<a href=3D"mailto:hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org" tar=
get=3D"_blank">hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org</a>&gt;<br>
---<br>
=C2=A0 src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp | 8 ++++++=
--<br>
=C2=A0 1 file changed, 6 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp b/sr=
c/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp<br>
index 557608e..cc51f5a 100644<br>
--- a/src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp<br>
+++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp<br>
@@ -2279,12 +2279,16 @@ Converter::handleLOAD(Value *dst0[4])<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Value *off =3D fetchSrc(1, c);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Symbol *sym;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t src0_component_offset =3D tgsi.=
getSrc(0).getSwizzle(c) * 4;<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (tgsi.getSrc(1).getFile() =3D=
=3D TGSI_FILE_IMMEDIATE) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 off =3D NULL;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sym =3D makeSym(tgsi.getSr=
c(0).getFile(), r, -1, c,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 tgsi.getSrc(1).getValueU32(0, info) + 4 * c);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 tgsi.getSrc(1).getValueU32(0, info) +<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 src0_component_offset);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sym =3D makeSym(tgsi.getSrc(0).g=
etFile(), r, -1, c, 4 * c);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sym =3D makeSym(tgsi.getSrc(0).g=
etFile(), r, -1, c,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 src0_component_offset);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Instruction *ld =3D mkLoad(TYPE_U3=
2, dst0[c], sym, off);<br>
--<br>
2.7.3<br>
<br>
</blockquote></blockquote>
</blockquote></div>

--001a1141fb12168510052ff98f9c--

--===============0357545580==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0357545580==--
