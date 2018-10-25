From: Fernando Sahmkow <fsahmkow27-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Questions on Blocklinear Mipmaps and auto-sizing
Date: Thu, 25 Oct 2018 06:30:34 -0400
Message-ID: <CA+MSTo_A-O=2QPLQxMV=NwmzJO1E43TjN=LmabHnFh=n2KtNLg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0862834768=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============0862834768==
Content-Type: multipart/alternative; boundary="00000000000096646005790b182e"

--00000000000096646005790b182e
Content-Type: text/plain; charset="UTF-8"

I'm currently implementing mipmaps but I have a set of troubles guessing
the block height and block depth of them. According to
https://envytools.readthedocs.io/en/latest/hw/memory/g80-surface.html#textures-mipmapping-and-arrays
the texture unit auto resizes mipmaps' blocks but how do I know how many
blocks each one uses?

I'm currently using this algorithm:
        u32 height = MipHeight(mip_level);
        u32 gobs_in_y = (height + 7) / 8;
        u32 bh = block_height;
        // Magical block resizing algorithm, needs more testing.
        while (bh > 1 && (gobs_in_y + bh - 1) / bh <= 2) {
            bh >>= 1;
        }
        return bh;
it works 95% of the time but doesn't fit the correct block size all the
time. Do you guys got any info on the correct algorithm used?

--00000000000096646005790b182e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div>I&#39;m currently i=
mplementing mipmaps but I have a set of troubles guessing the block height =
and block depth of them. According to=C2=A0<a href=3D"https://envytools.rea=
dthedocs.io/en/latest/hw/memory/g80-surface.html#textures-mipmapping-and-ar=
rays">https://envytools.readthedocs.io/en/latest/hw/memory/g80-surface.html=
#textures-mipmapping-and-arrays</a> the texture unit auto resizes mipmaps&#=
39; blocks but how do I know how many blocks each one uses?</div><div><br><=
/div><div>I&#39;m currently using this algorithm:</div><div><div>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 u32 height =3D MipHeight(mip_level);</div><div>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 u32 gobs_in_y =3D (height + 7) / 8;</div><div>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 u32 bh =3D block_height;</div><div>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 // Magical block resizing algorithm, needs more testing.</div><div>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 while (bh &gt; 1 &amp;&amp; (gobs_in_y + bh - 1=
) / bh &lt;=3D 2) {</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bh =
&gt;&gt;=3D 1;</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 }</div><div>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 return bh;</div></div><div>it works 95% of the time but d=
oesn&#39;t fit the correct block size all the time. Do you guys got any inf=
o on the correct algorithm used?</div><div dir=3D"ltr" class=3D"gmail_signa=
ture"><div dir=3D"ltr"></div></div></div></div></div>

--00000000000096646005790b182e--

--===============0862834768==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0862834768==--
