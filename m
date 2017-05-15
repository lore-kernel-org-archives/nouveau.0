From: Max Ehrlich <max.ehr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: GP10x failures on 4.12rc1
Date: Mon, 15 May 2017 11:23:46 +0000
Message-ID: <CAPyx93wwPB+B+5QUO_8WWMZ63=XthTcUVjJG5rZ9fFTW5ZRO0A@mail.gmail.com>
References: <CAPyx93zPxNbK+Nfr53UaEbQcNgcXhDL7b26MK0ZJYLmiSvHJSA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2000732593=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAPyx93zPxNbK+Nfr53UaEbQcNgcXhDL7b26MK0ZJYLmiSvHJSA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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

--===============2000732593==
Content-Type: multipart/alternative; boundary="001a113f1bac773ea7054f8e4acc"

--001a113f1bac773ea7054f8e4acc
Content-Type: text/plain; charset="UTF-8"

Actually, I just forgot to include the latest linux-firmware, so now that
error is replaced with a new error. It appears I am seeing the same EDID
error reported here:
https://lists.freedesktop.org/archives/nouveau/2017-May/027914.html (I
think).



On Sun, May 14, 2017 at 3:09 PM Max Ehrlich <max.ehr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> I have two nvidia pascal cards on my machine, a GP107M (GeForce GTK 1050
> Mobile) and a GP104 (GTX 1080 connected via thunderbolt).
>
> With 4.12 RC1 (which I understand to include signed firmware from nVidia)
> neither of these cards work. Here is the output from demsg when I modprobe
> nouveau.
>
> [  112.565946] nouveau: detected PR support, will not use DSM
> [  112.565966] nouveau 0000:01:00.0: enabling device (0000 -> 0003)
> [  112.566063] nouveau 0000:01:00.0: unknown chipset (ffffffff)
> [  112.566067] nouveau: probe of 0000:01:00.0 failed with error -12
> [  112.566245] nouveau 0000:0b:00.0: NVIDIA GP104 (134000a1)
> [  112.850486] nouveau 0000:0b:00.0: bios: version 86.04.17.00.01
> [  112.855307] nouveau 0000:0b:00.0: Direct firmware load for
> nvidia/gp104/gr/sw_nonctx.bin failed with error -2
> [  112.855310] nouveau 0000:0b:00.0: gr: failed to load gr/sw_nonctx
> [  112.855315] nouveau 0000:0b:00.0: gr ctor failed, -2
> [  112.855322] nouveau: probe of 0000:0b:00.0 failed with error -2
>
> Let me know what else I can provide to help diagnose the issue, I am not
> familiar with the debugging process for this kind of thing
>

--001a113f1bac773ea7054f8e4acc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Actually, I just forgot to include the latest linux-firmwa=
re, so now that error is replaced with a new error. It appears I am seeing =
the same EDID error reported here:=C2=A0<a href=3D"https://lists.freedeskto=
p.org/archives/nouveau/2017-May/027914.html">https://lists.freedesktop.org/=
archives/nouveau/2017-May/027914.html</a>=C2=A0(I think).=C2=A0<div><br></d=
iv><div><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On =
Sun, May 14, 2017 at 3:09 PM Max Ehrlich &lt;<a href=3D"mailto:max.ehr@gmai=
l.com">max.ehr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex"><div dir=3D"ltr"><div>I have two nvidia pascal cards on my machine, a =
GP107M (GeForce GTK 1050 Mobile) and a GP104 (GTX 1080 connected via thunde=
rbolt).<br></div><div><br></div><div>With 4.12 RC1 (which I understand to i=
nclude signed firmware from nVidia) neither of these cards work. Here is th=
e output from demsg when I modprobe nouveau.</div><div><br></div><div>[ =C2=
=A0112.565946] nouveau: detected PR support, will not use DSM</div><div>[ =
=C2=A0112.565966] nouveau 0000:01:00.0: enabling device (0000 -&gt; 0003)</=
div><div>[ =C2=A0112.566063] nouveau 0000:01:00.0: unknown chipset (fffffff=
f)</div><div>[ =C2=A0112.566067] nouveau: probe of 0000:01:00.0 failed with=
 error -12</div><div>[ =C2=A0112.566245] nouveau 0000:0b:00.0: NVIDIA GP104=
 (134000a1)</div><div>[ =C2=A0112.850486] nouveau 0000:0b:00.0: bios: versi=
on 86.04.17.00.01</div><div>[ =C2=A0112.855307] nouveau 0000:0b:00.0: Direc=
t firmware load for nvidia/gp104/gr/sw_nonctx.bin failed with error -2</div=
><div>[ =C2=A0112.855310] nouveau 0000:0b:00.0: gr: failed to load gr/sw_no=
nctx</div><div>[ =C2=A0112.855315] nouveau 0000:0b:00.0: gr ctor failed, -2=
</div><div>[ =C2=A0112.855322] nouveau: probe of 0000:0b:00.0 failed with e=
rror -2</div><div><br></div><div>Let me know what else I can provide to hel=
p diagnose the issue, I am not familiar with the debugging process for this=
 kind of thing</div></div></blockquote></div>

--001a113f1bac773ea7054f8e4acc--

--===============2000732593==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============2000732593==--
