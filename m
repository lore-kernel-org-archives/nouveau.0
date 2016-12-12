From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: [bug report] drm/nouveau/imem: convert to new-style
	nvkm_subdev
Date: Mon, 12 Dec 2016 07:22:31 -0500
Message-ID: <CAKb7UvikZ-sjLTpUyapJjpEDFXJPVkGLWuvaPGa5_eFQY0EtkA@mail.gmail.com>
References: <20161212115922.GA16588@elgon.mountain>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0798705120=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20161212115922.GA16588-mgFCXtclrQlZLf2FXnZxJA@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

--===============0798705120==
Content-Type: multipart/alternative; boundary=94eb2c0b067469220605437528d8

--94eb2c0b067469220605437528d8
Content-Type: text/plain; charset=UTF-8

If ret == 0, then node should not be null. Either that no longer holds, or
your static checker is no longer able to deduce that.

On Dec 12, 2016 7:07 AM, "Dan Carpenter" <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org> wrote:

> [ No idea why it's only complaining about this a year later... -dan ]
>
> Hello Ben Skeggs,
>
> This is a semi-automatic email about new static checker warnings.
>
> The patch b7a2bc1886d0: "drm/nouveau/imem: convert to new-style
> nvkm_subdev" from Aug 20, 2015, leads to the following Smatch
> complaint:
>
> drivers/gpu/drm/nouveau/nvkm/subdev/instmem/gk20a.c:536
> gk20a_instobj_new()
>          error: we previously assumed 'node' could be null (see line 532)
>
> drivers/gpu/drm/nouveau/nvkm/subdev/instmem/gk20a.c
>    531                                               align, &node);
>    532          *pmemory = node ? &node->memory : NULL;
>                            ^^^^
> Added a new check for NULL.
>
>    533          if (ret)
>    534                  return ret;
>    535
>    536          node->imem = imem;
>                 ^^^^^^^^^^
> Unchecked dereference.
>
>    537
>    538          /* present memory for being mapped using small pages */
>
> regards,
> dan carpenter
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
>

--94eb2c0b067469220605437528d8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">If ret =3D=3D 0, then node should not be null. Either tha=
t no longer holds, or your static checker is no longer able to deduce that.=
</div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Dec 12, =
2016 7:07 AM, &quot;Dan Carpenter&quot; &lt;<a href=3D"mailto:dan.carpenter=
@oracle.com">dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org</a>&gt; wrote:<br type=3D"attribution=
"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex">[ No idea why it&#39;s only complaining ab=
out this a year later... -dan ]<br>
<br>
Hello Ben Skeggs,<br>
<br>
This is a semi-automatic email about new static checker warnings.<br>
<br>
The patch b7a2bc1886d0: &quot;drm/nouveau/imem: convert to new-style<br>
nvkm_subdev&quot; from Aug 20, 2015, leads to the following Smatch<br>
complaint:<br>
<br>
drivers/gpu/drm/nouveau/nvkm/<wbr>subdev/instmem/gk20a.c:536 gk20a_instobj_=
new()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error: we previously assumed &#39;node&#3=
9; could be null (see line 532)<br>
<br>
drivers/gpu/drm/nouveau/nvkm/<wbr>subdev/instmem/gk20a.c<br>
=C2=A0 =C2=A0531=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0align, &amp;node);<br>
=C2=A0 =C2=A0532=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *pmemory =3D node ? &amp=
;node-&gt;memory : NULL;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0^^^^<br>
Added a new check for NULL.<br>
<br>
=C2=A0 =C2=A0533=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret)<br>
=C2=A0 =C2=A0534=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return ret;<br>
=C2=A0 =C2=A0535<br>
=C2=A0 =C2=A0536=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 node-&gt;imem =3D imem;<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^^^^^^^^^^<br>
Unchecked dereference.<br>
<br>
=C2=A0 =C2=A0537<br>
=C2=A0 =C2=A0538=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* present memory for be=
ing mapped using small pages */<br>
<br>
regards,<br>
dan carpenter<br>
______________________________<wbr>_________________<br>
Nouveau mailing list<br>
<a href=3D"mailto:Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org">Nouveau-PD4FTy7X32lNgt0PjOBp9/rsn8yoX9R0@public.gmane.org=
org</a><br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/nouveau" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.freedesktop.org/<wbr>mailman/lis=
tinfo/nouveau</a><br>
</blockquote></div></div>

--94eb2c0b067469220605437528d8--

--===============0798705120==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0798705120==--
