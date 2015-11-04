From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: Nouveau for FreeBSD
Date: Wed, 4 Nov 2015 02:13:24 -0500
Message-ID: <CAKb7UvjrHdygFy3+e9CdQ_9JqdyyMn6v4JROs8JKgifxRfhC_Q@mail.gmail.com>
References: <01e201d11694$9fb0a5a0$df11f0e0$@verizon.net>
 <20151104070855.5476436.86664.54094@pathscale.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1271269543=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20151104070855.5476436.86664.54094-Hl0AACgZOF5l57MIdRCFDg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: =?UTF-8?B?QyBCZXJnc3Ryw7Zt?= <cbergstrom-Hl0AACgZOF5l57MIdRCFDg@public.gmane.org>
Cc: Curtis Hamilton <hamiltcl-H+0wwilmMs3R7s880joybQ@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

--===============1271269543==
Content-Type: multipart/alternative; boundary=047d7bd6be0e0364a10523b1bf12

--047d7bd6be0e0364a10523b1bf12
Content-Type: text/plain; charset=UTF-8

Nouveau kernel module has a largely os-agnostic "core" component (called
nvkm/nvif now) which encompasses the actual operation of the GPU. The drm
wrapper around it provides the relevant interfaces for KMS/ioctls/etc. Any
port would want the ioctl bits as well, since that's what the userspace
mesa/ddx components rely on.

That said, I'm not aware of any serious effort to port nouveau to any other
OS.

  -ilia

On Wed, Nov 4, 2015 at 2:08 AM, <cbergstrom-Hl0AACgZOF5l57MIdRCFDg@public.gmane.org> wrote:

> Is anyone actually and or actively working on this?
> Github.com/pathscale/pscnv is totally bitrot but waaay more portable base.
> Nouveau made hard Linux assumptions that will be difficult to overcome
> afaik.
>
>
>
> *From: *Curtis Hamilton
> *Sent: *Wednesday, November 4, 2015 08:06
> *To: *nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> *Subject: *[Nouveau] Nouveau for FreeBSD
>
> Any progress on the FreeBSD front?
>
>
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
>
>

--047d7bd6be0e0364a10523b1bf12
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Nouveau kernel module has a largely os-agnostic &quot;core=
&quot; component (called nvkm/nvif now) which encompasses the actual operat=
ion of the GPU. The drm wrapper around it provides the relevant interfaces =
for KMS/ioctls/etc. Any port would want the ioctl bits as well, since that&=
#39;s what the userspace mesa/ddx components rely on.<div><br></div><div>Th=
at said, I&#39;m not aware of any serious effort to port nouveau to any oth=
er OS.</div><div><br></div><div>=C2=A0 -ilia</div></div><div class=3D"gmail=
_extra"><br><div class=3D"gmail_quote">On Wed, Nov 4, 2015 at 2:08 AM,  <sp=
an dir=3D"ltr">&lt;<a href=3D"mailto:cbergstrom-Hl0AACgZOF5l57MIdRCFDg@public.gmane.org" target=3D"_b=
lank">cbergstrom-Hl0AACgZOF5l57MIdRCFDg@public.gmane.org</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><div lang=3D"en-US" link=3D"#0563C1" vlink=3D"#954F72" style=
=3D"background-color:rgb(255,255,255);line-height:initial">                =
                                                                      <div =
style=3D"width:100%;font-size:initial;font-family:Calibri,&#39;Slate Pro&#3=
9;,sans-serif,sans-serif;color:rgb(31,73,125);text-align:initial;background=
-color:rgb(255,255,255)">Is anyone actually and or actively working on this=
? Github.com/pathscale/pscnv is totally bitrot but waaay more portable base=
. Nouveau made hard Linux assumptions that will be difficult to overcome af=
aik.</div><div style=3D"width:100%;font-size:initial;font-family:Calibri,&#=
39;Slate Pro&#39;,sans-serif,sans-serif;color:rgb(31,73,125);text-align:ini=
tial;background-color:rgb(255,255,255)"><br></div><div style=3D"width:100%;=
font-size:initial;font-family:Calibri,&#39;Slate Pro&#39;,sans-serif,sans-s=
erif;color:rgb(31,73,125);text-align:initial;background-color:rgb(255,255,2=
55)"><br></div>                                                            =
                                                                         <d=
iv style=3D"width:100%;font-size:initial;font-family:Calibri,&#39;Slate Pro=
&#39;,sans-serif,sans-serif;color:rgb(31,73,125);text-align:initial;backgro=
und-color:rgb(255,255,255)"><br style=3D"display:initial"></div>           =
                                                                           =
                                                                           =
                                  <div style=3D"font-size:initial;font-fami=
ly:Calibri,&#39;Slate Pro&#39;,sans-serif,sans-serif;color:rgb(31,73,125);t=
ext-align:initial;background-color:rgb(255,255,255)"></div>                =
                                                                           =
                                                                           =
            <table width=3D"100%" style=3D"background-color:white;border-sp=
acing:0px"> <tbody><tr><td colspan=3D"2" style=3D"font-size:initial;text-al=
ign:initial;background-color:rgb(255,255,255)">                           <=
div style=3D"border-style:solid none none;border-top-color:rgb(181,196,223)=
;border-top-width:1pt;padding:3pt 0in 0in;font-family:Tahoma,&#39;BB Alpha =
Sans&#39;,&#39;Slate Pro&#39;;font-size:10pt">  <div><b>From: </b>Curtis Ha=
milton</div><div><b>Sent: </b>Wednesday, November 4, 2015 08:06</div><div><=
b>To: </b><a href=3D"mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" target=3D"_blank=
">nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org</a></div><div><b>Subject: </b>[Nouveau] Nou=
veau for FreeBSD</div></div></td></tr></tbody></table><span class=3D""><div=
 style=3D"border-style:solid none none;border-top-color:rgb(186,188,209);bo=
rder-top-width:1pt;font-size:initial;text-align:initial;background-color:rg=
b(255,255,255)"></div><br><div><div><p class=3D"MsoNormal">Any progress on =
the FreeBSD front?<u></u><u></u></p></div><br></div></span></div>
<br>_______________________________________________<br>
Nouveau mailing list<br>
<a href=3D"mailto:Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org">Nouveau-PD4FTy7X32lNgt0PjOBp9/rsn8yoX9R0@public.gmane.org=
org</a><br>
<a href=3D"http://lists.freedesktop.org/mailman/listinfo/nouveau" rel=3D"no=
referrer" target=3D"_blank">http://lists.freedesktop.org/mailman/listinfo/n=
ouveau</a><br>
<br></blockquote></div><br></div>

--047d7bd6be0e0364a10523b1bf12--

--===============1271269543==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1271269543==--
