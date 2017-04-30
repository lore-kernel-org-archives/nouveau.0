From: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: Re: [PATCH v2] nv50/ir: optimize shl(a, 0) to a
Date: Sun, 30 Apr 2017 10:09:04 -0400
Message-ID: <CAKb7Uvj9sQzs_detk=pd1kf5tSpz=m9+SyA2sk9V4XTH=oYuEw@mail.gmail.com>
References: <20170429220934.3355-1-karolherbst@gmail.com>
 <CAKb7UvgimVPhzybu-ewdN0AUUJkRpAaivxbAO+v3L5UC2SPqLA@mail.gmail.com>
 <CAEXux-b4v4JgsOq4xpdribgeV0k3dm7tRE-4cgz9E8Aj6MqpZg@mail.gmail.com>
 <CAKb7Uvg2ZxT4JyfeG24BLDTKHXbFuyx=H2tRnQBM63h1k_kJ8Q@mail.gmail.com>
 <CAKb7UvjfCUF2_WN9FrjoZnpX_2K+YwY9_PhPYjH=fOfM2SRN8A@mail.gmail.com>
 <CAEXux-a0_eMe34mQ8khWf4zO6RgP-j4zRXX2TBew=dVPfvm5jw@mail.gmail.com>
 <CAKb7Uvi+en__r67VrjV2hfMHTcXSJCXzjhhGekKYei84bKyE5g@mail.gmail.com>
 <CAKb7UvhThjsNh+85-SEvhNHkcmVuuy7itN+6X+DaW2jMM10OVQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0836588652=="
Return-path: <mesa-dev-bounces@lists.freedesktop.org>
In-Reply-To: <CAKb7UvhThjsNh+85-SEvhNHkcmVuuy7itN+6X+DaW2jMM10OVQ@mail.gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/mesa-dev>,
 <mailto:mesa-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/mesa-dev>
List-Post: <mailto:mesa-dev@lists.freedesktop.org>
List-Help: <mailto:mesa-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/mesa-dev>,
 <mailto:mesa-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: mesa-dev-bounces@lists.freedesktop.org
Sender: "mesa-dev" <mesa-dev-bounces@lists.freedesktop.org>
To: Karol Herbst <karolherbst@gmail.com>
Cc: nouveau@lists.freedesktop.org, mesa-dev@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

--===============0836588652==
Content-Type: multipart/alternative; boundary=001a113e4784731109054e62d94b

--001a113e4784731109054e62d94b
Content-Type: text/plain; charset=UTF-8

On Apr 30, 2017 8:14 AM, "Karol Herbst" <karolherbst@gmail.com> wrote:

2017-04-30 2:28 GMT+02:00 Ilia Mirkin <imirkin@alum.mit.edu>:
> Maybe in a separate change. I'd want to double check on all gens. I think
> the thing I suggested is sufficient.
>

well, if I just fixup the op, I kind of have to fix the mod as well.
And if I use getOp, it could also return a OP_CVT, so I have to do the
check.

I don't see how I can only use getOp, but not fixing the mod?


Perhaps this all doesn't work the way I remember. Will try to look during
the week.


> On Apr 29, 2017 8:09 PM, "Karol Herbst" <karolherbst@gmail.com> wrote:
>
> 2017-04-30 0:28 GMT+02:00 Ilia Mirkin <imirkin@alum.mit.edu>:
>> On Sat, Apr 29, 2017 at 6:09 PM, Karol Herbst <karolherbst@gmail.com>
>> wrote:
>>> helps two alien isolation shaders
>>>
>>> shader-db:
>>> total instructions in shared programs : 4251497 -> 4251494 (-0.00%)
>>> total gprs used in shared programs    : 513962 -> 513962 (0.00%)
>>> total local used in shared programs   : 29797 -> 29797 (0.00%)
>>> total bytes used in shared programs   : 38960264 -> 38960232 (-0.00%)
>>>
>>>                 local        gpr       inst      bytes
>>>     helped           0           0           2           2
>>>       hurt           0           0           0           0
>>>
>>> v2: handle potential mods on src0
>>>
>>> Signed-off-by: Karol Herbst <karolherbst@gmail.com>
>>> Reviewed-by: Samuel Pitoiset <samuel.pitoiset@gmail.com>
>>> Reviewed-by: Ilia Mirkin <imirkin@alum.mit.edu>
>>> ---
>>>  src/gallium/drivers/nouveau/codegen/nv50_ir_peephole.cpp | 7 +++++++
>>>  1 file changed, 7 insertions(+)
>>>
>>> diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_peephole.cpp
>>> b/src/gallium/drivers/nouveau/codegen/nv50_ir_peephole.cpp
>>> index 015def0391..82da0d3e48 100644
>>> --- a/src/gallium/drivers/nouveau/codegen/nv50_ir_peephole.cpp
>>> +++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_peephole.cpp
>>> @@ -1284,6 +1284,13 @@ ConstantFolding::opnd(Instruction *i,
>>> ImmediateValue &imm0, int s)
>>>
>>>     case OP_SHL:
>>>     {
>>> +      if (s == 1 && imm0.isInteger(0)) {
>>> +         i->op = i->src(0).mod.getOp();
>>> +         if (i->op != OP_CVT)
>>> +            i->src(0).mod = 0;
>>
>> Is this necessary? Presumably if the op != 0, then op == OP_CVT...
>>
>
> yeah, no idea. I just thought I do it right when I actually depend on
> the getOp magic. But we can't emit any mods to begin with, so maybe we
> should just drop the mod handling and be done with it?
>
>>> +         i->setSrc(1, NULL);
>>> +         break;
>>> +      }
>>>        if (s != 1 || i->src(0).mod != Modifier(0))
>>>           break;
>>>        // try to concatenate shifts
>>> --
>>> 2.12.2
>>>
>
>

--001a113e4784731109054e62d94b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><div class=3D"gmail_extra"><br><div class=3D"gma=
il_quote">On Apr 30, 2017 8:14 AM, &quot;Karol Herbst&quot; &lt;<a href=3D"=
mailto:karolherbst@gmail.com">karolherbst@gmail.com</a>&gt; wrote:<br type=
=3D"attribution"><blockquote class=3D"quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex"><div class=3D"quoted-text">2017-0=
4-30 2:28 GMT+02:00 Ilia Mirkin &lt;<a href=3D"mailto:imirkin@alum.mit.edu"=
>imirkin@alum.mit.edu</a>&gt;:<br>
&gt; Maybe in a separate change. I&#39;d want to double check on all gens. =
I think<br>
&gt; the thing I suggested is sufficient.<br>
&gt;<br>
<br>
</div>well, if I just fixup the op, I kind of have to fix the mod as well.<=
br>
And if I use getOp, it could also return a OP_CVT, so I have to do the<br>
check.<br>
<br>
I don&#39;t see how I can only use getOp, but not fixing the mod?<br></bloc=
kquote></div></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Perh=
aps this all doesn&#39;t work the way I remember. Will try to look during t=
he week.</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"g=
mail_extra"><div class=3D"gmail_quote"><blockquote class=3D"quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<div class=3D"elided-text"><br>
&gt; On Apr 29, 2017 8:09 PM, &quot;Karol Herbst&quot; &lt;<a href=3D"mailt=
o:karolherbst@gmail.com">karolherbst@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; 2017-04-30 0:28 GMT+02:00 Ilia Mirkin &lt;<a href=3D"mailto:imirkin@al=
um.mit.edu">imirkin@alum.mit.edu</a>&gt;:<br>
&gt;&gt; On Sat, Apr 29, 2017 at 6:09 PM, Karol Herbst &lt;<a href=3D"mailt=
o:karolherbst@gmail.com">karolherbst@gmail.com</a>&gt;<br>
&gt;&gt; wrote:<br>
&gt;&gt;&gt; helps two alien isolation shaders<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; shader-db:<br>
&gt;&gt;&gt; total instructions in shared programs : 4251497 -&gt; 4251494 =
(-0.00%)<br>
&gt;&gt;&gt; total gprs used in shared programs=C2=A0 =C2=A0 : 513962 -&gt;=
 513962 (0.00%)<br>
&gt;&gt;&gt; total local used in shared programs=C2=A0 =C2=A0: 29797 -&gt; =
29797 (0.00%)<br>
&gt;&gt;&gt; total bytes used in shared programs=C2=A0 =C2=A0: 38960264 -&g=
t; 38960232 (-0.00%)<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0l=
ocal=C2=A0 =C2=A0 =C2=A0 =C2=A0 gpr=C2=A0 =C2=A0 =C2=A0 =C2=A0inst=C2=A0 =
=C2=A0 =C2=A0 bytes<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0helped=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A00=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A02=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A02<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0hurt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A00=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A00=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; v2: handle potential mods on src0<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Signed-off-by: Karol Herbst &lt;<a href=3D"mailto:karolherbst@=
gmail.com">karolherbst@gmail.com</a>&gt;<br>
&gt;&gt;&gt; Reviewed-by: Samuel Pitoiset &lt;<a href=3D"mailto:samuel.pito=
iset@gmail.com">samuel.pitoiset@gmail.com</a>&gt;<br>
&gt;&gt;&gt; Reviewed-by: Ilia Mirkin &lt;<a href=3D"mailto:imirkin@alum.mi=
t.edu">imirkin@alum.mit.edu</a>&gt;<br>
&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;=C2=A0 src/gallium/drivers/nouveau/<wbr>codegen/nv50_ir_peephol=
e.cpp | 7 +++++++<br>
&gt;&gt;&gt;=C2=A0 1 file changed, 7 insertions(+)<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; diff --git a/src/gallium/drivers/nouveau/<wbr>codegen/nv50_ir_=
peephole.cpp<br>
&gt;&gt;&gt; b/src/gallium/drivers/nouveau/<wbr>codegen/nv50_ir_peephole.cp=
p<br>
&gt;&gt;&gt; index 015def0391..82da0d3e48 100644<br>
&gt;&gt;&gt; --- a/src/gallium/drivers/nouveau/<wbr>codegen/nv50_ir_peephol=
e.cpp<br>
&gt;&gt;&gt; +++ b/src/gallium/drivers/nouveau/<wbr>codegen/nv50_ir_peephol=
e.cpp<br>
&gt;&gt;&gt; @@ -1284,6 +1284,13 @@ ConstantFolding::opnd(<wbr>Instruction =
*i,<br>
&gt;&gt;&gt; ImmediateValue &amp;imm0, int s)<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0case OP_SHL:<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0{<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 if (s =3D=3D 1 &amp;&amp; imm0.isInteger=
(0)) {<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i-&gt;op =3D i-&gt;src(0).m=
od.getOp();<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (i-&gt;op !=3D OP_CVT)<b=
r>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i-&gt;src(0).mod =
=3D 0;<br>
&gt;&gt;<br>
&gt;&gt; Is this necessary? Presumably if the op !=3D 0, then op =3D=3D OP_=
CVT...<br>
&gt;&gt;<br>
&gt;<br>
&gt; yeah, no idea. I just thought I do it right when I actually depend on<=
br>
&gt; the getOp magic. But we can&#39;t emit any mods to begin with, so mayb=
e we<br>
&gt; should just drop the mod handling and be done with it?<br>
&gt;<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i-&gt;setSrc(1, NULL);<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (s !=3D 1 || i-&gt;src(0).mod !=
=3D Modifier(0))<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 // try to concatenate shifts<br>
&gt;&gt;&gt; --<br>
&gt;&gt;&gt; 2.12.2<br>
&gt;&gt;&gt;<br>
&gt;<br>
&gt;<br>
</div></blockquote></div><br></div></div></div>

--001a113e4784731109054e62d94b--

--===============0836588652==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbWVzYS1kZXYg
bWFpbGluZyBsaXN0Cm1lc2EtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL21lc2EtZGV2Cg==

--===============0836588652==--
