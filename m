From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: [bug report] drm/nouveau/disp/nv50-: add channel
 interfaces to control error interrupts
Date: Tue, 26 Jun 2018 07:54:47 -0400
Message-ID: <CAKb7Uvh8WqNrcsTD8w8FkOhU7qdvJDEPnx4QE3Gq7ksra13u1w@mail.gmail.com>
References: <20180626084902.xozx6436ocfiq7tj@kili.mountain>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0729636555=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20180626084902.xozx6436ocfiq7tj-vMlZ3nK25oGAIHFoDFOv9A@public.gmane.org>
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
Cc: nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

--===============0729636555==
Content-Type: multipart/alternative; boundary="000000000000ecde62056f8a32a7"

--000000000000ecde62056f8a32a7
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 26, 2018, 04:49 Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org> wrote:

> Hello Ben Skeggs,
>
> The patch a9c44a88ca2f: "drm/nouveau/disp/nv50-: add channel
> interfaces to control error interrupts" from May 8, 2018, leads to
> the following static checker warning:
>
>         drivers/gpu/drm/nouveau/nvkm/engine/disp/channv50.c:169
> nv50_disp_chan_intr()
>         warn: should '65537 << chan->chid.user' be a 64 bit type?
>
> drivers/gpu/drm/nouveau/nvkm/engine/disp/channv50.c
>    165  void
>    166  nv50_disp_chan_intr(struct nv50_disp_chan *chan, bool en)
>    167  {
>    168          struct nvkm_device *device =
> chan->disp->base.engine.subdev.device;
>    169          const u64 mask = 0x00010001 << chan->chid.user;
>                                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> Can this shift wrap?
>

This should be a u32, not u64. Same for mask below. The value of user is
<16.


>    170          const u64 data = en ? 0x00010000 : 0x00000000;
>

Ben, is this a bug? Shouldn't this also be shifted?

   171          nvkm_mask(device, 0x610028, mask, data);

   172  }
>
> regards,
> dan carpenter
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
>

--000000000000ecde62056f8a32a7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr">=
On Tue, Jun 26, 2018, 04:49 Dan Carpenter &lt;<a href=3D"mailto:dan.carpent=
er-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org">dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc soli=
d;padding-left:1ex">Hello Ben Skeggs,<br>
<br>
The patch a9c44a88ca2f: &quot;drm/nouveau/disp/nv50-: add channel<br>
interfaces to control error interrupts&quot; from May 8, 2018, leads to<br>
the following static checker warning:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 drivers/gpu/drm/nouveau/nvkm/engine/disp/channv=
50.c:169 nv50_disp_chan_intr()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 warn: should &#39;65537 &lt;&lt; chan-&gt;chid.=
user&#39; be a 64 bit type?<br>
<br>
drivers/gpu/drm/nouveau/nvkm/engine/disp/channv50.c<br>
=C2=A0 =C2=A0165=C2=A0 void<br>
=C2=A0 =C2=A0166=C2=A0 nv50_disp_chan_intr(struct nv50_disp_chan *chan, boo=
l en)<br>
=C2=A0 =C2=A0167=C2=A0 {<br>
=C2=A0 =C2=A0168=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct nvkm_device *devi=
ce =3D chan-&gt;disp-&gt;base.engine.subdev.device;<br>
=C2=A0 =C2=A0169=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const u64 mask =3D 0x000=
10001 &lt;&lt; chan-&gt;chid.user;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^^^^^^^^^^^^^^^^^^^^^^^^^^^^^<=
br>
Can this shift wrap?<br></blockquote></div></div><div dir=3D"auto"><br></di=
v><div dir=3D"auto">This should be a u32, not u64. Same for mask below. The=
 value of user is &lt;16.</div><div dir=3D"auto"><br></div><div dir=3D"auto=
"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
=C2=A0 =C2=A0170=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const u64 data =3D en ? =
0x00010000 : 0x00000000;<br></blockquote></div></div><div dir=3D"auto"><br>=
</div><div dir=3D"auto">Ben, is this a bug? Shouldn&#39;t this also be shif=
ted?</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail=
_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex">
=C2=A0 =C2=A0171=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nvkm_mask(device, 0x6100=
28, mask, data);</blockquote></div></div><div dir=3D"auto"><div class=3D"gm=
ail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex">
=C2=A0 =C2=A0172=C2=A0 }<br>
<br>
regards,<br>
dan carpenter<br>
_______________________________________________<br>
Nouveau mailing list<br>
<a href=3D"mailto:Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" target=3D"_blank" rel=3D"n=
oreferrer">Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org</a><br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/nouveau" rel=3D"n=
oreferrer noreferrer" target=3D"_blank">https://lists.freedesktop.org/mailm=
an/listinfo/nouveau</a><br>
</blockquote></div></div></div>

--000000000000ecde62056f8a32a7--

--===============0729636555==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0729636555==--
