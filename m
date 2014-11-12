From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: [PATCH] nvc0: remove unused nvc0_screen::mm_VRAM_fe0
Date: Wed, 12 Nov 2014 01:07:28 -0500
Message-ID: <CAKb7UvipWpaYXEE22Tyt8ostiohL=xfHgcfAnv3Sgz5gE62J-g@mail.gmail.com>
References: <1414405588-17705-1-git-send-email-acourbot@nvidia.com>
 <1414406209-25574-1-git-send-email-acourbot@nvidia.com>
 <CAAVeFuJHdUVGUScxrYsgTXNbR7hYjxvgzqi8Bk6TVF7uaOu7cw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0532974116=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAAVeFuJHdUVGUScxrYsgTXNbR7hYjxvgzqi8Bk6TVF7uaOu7cw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

--===============0532974116==
Content-Type: multipart/alternative; boundary=001a113ced32df84310507a335e2

--001a113ced32df84310507a335e2
Content-Type: text/plain; charset=UTF-8

LG. I had this same patch locally I think... I came up with it after I went
looking at the various VRAM usage after you were asking questions about it.

On Tue, Nov 11, 2014 at 11:59 PM, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
wrote:

> Ping, how about this guy?
>
> On Mon, Oct 27, 2014 at 7:36 PM, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> wrote:
> > This member is declared, allocated and destroyed, but doesn't seem to be
> > used or referenced anywhere in the code.
> >
> > Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > ---
> > Resending after fixing typo in email address - apologies for the
> inconvenience.
> >
> >  src/gallium/drivers/nouveau/nvc0/nvc0_screen.c | 3 ---
> >  src/gallium/drivers/nouveau/nvc0/nvc0_screen.h | 2 --
> >  2 files changed, 5 deletions(-)
> >
> > diff --git a/src/gallium/drivers/nouveau/nvc0/nvc0_screen.c
> b/src/gallium/drivers/nouveau/nvc0/nvc0_screen.c
> > index a7581f286cfc..61b381693224 100644
> > --- a/src/gallium/drivers/nouveau/nvc0/nvc0_screen.c
> > +++ b/src/gallium/drivers/nouveau/nvc0/nvc0_screen.c
> > @@ -407,8 +407,6 @@ nvc0_screen_destroy(struct pipe_screen *pscreen)
> >
> >     FREE(screen->tic.entries);
> >
> > -   nouveau_mm_destroy(screen->mm_VRAM_fe0);
> > -
> >     nouveau_object_del(&screen->eng3d);
> >     nouveau_object_del(&screen->eng2d);
> >     nouveau_object_del(&screen->m2mf);
> > @@ -1027,7 +1025,6 @@ nvc0_screen_create(struct nouveau_device *dev)
> >
> >     mm_config.nvc0.tile_mode = 0;
> >     mm_config.nvc0.memtype = 0xfe0;
> > -   screen->mm_VRAM_fe0 = nouveau_mm_create(dev, NOUVEAU_BO_VRAM,
> &mm_config);
> >
> >     if (!nvc0_blitter_create(screen))
> >        goto fail;
> > diff --git a/src/gallium/drivers/nouveau/nvc0/nvc0_screen.h
> b/src/gallium/drivers/nouveau/nvc0/nvc0_screen.h
> > index 4802057f70ee..8a1991f52eb4 100644
> > --- a/src/gallium/drivers/nouveau/nvc0/nvc0_screen.h
> > +++ b/src/gallium/drivers/nouveau/nvc0/nvc0_screen.h
> > @@ -73,8 +73,6 @@ struct nvc0_screen {
> >        boolean mp_counters_enabled;
> >     } pm;
> >
> > -   struct nouveau_mman *mm_VRAM_fe0;
> > -
> >     struct nouveau_object *eng3d; /* sqrt(1/2)|kepler> +
> sqrt(1/2)|fermi> */
> >     struct nouveau_object *eng2d;
> >     struct nouveau_object *m2mf;
> > --
> > 2.1.2
> >
>

--001a113ced32df84310507a335e2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">LG. I had this same patch locally I think... I came up wit=
h it after I went looking at the various VRAM usage after you were asking q=
uestions about it.</div><div class=3D"gmail_extra"><br><div class=3D"gmail_=
quote">On Tue, Nov 11, 2014 at 11:59 PM, Alexandre Courbot <span dir=3D"ltr=
">&lt;<a href=3D"mailto:gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" target=3D"_blank">gnurou-Re5JQEeQqe8@public.gmane.org=
m</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Ping, how about t=
his guy?<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
On Mon, Oct 27, 2014 at 7:36 PM, Alexandre Courbot &lt;<a href=3D"mailto:ac=
ourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org">acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org</a>&gt; wrote:<br>
&gt; This member is declared, allocated and destroyed, but doesn&#39;t seem=
 to be<br>
&gt; used or referenced anywhere in the code.<br>
&gt;<br>
&gt; Signed-off-by: Alexandre Courbot &lt;<a href=3D"mailto:acourbot@nvidia=
.com">acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org</a>&gt;<br>
&gt; ---<br>
&gt; Resending after fixing typo in email address - apologies for the incon=
venience.<br>
&gt;<br>
&gt;=C2=A0 src/gallium/drivers/nouveau/nvc0/nvc0_screen.c | 3 ---<br>
&gt;=C2=A0 src/gallium/drivers/nouveau/nvc0/nvc0_screen.h | 2 --<br>
&gt;=C2=A0 2 files changed, 5 deletions(-)<br>
&gt;<br>
&gt; diff --git a/src/gallium/drivers/nouveau/nvc0/nvc0_screen.c b/src/gall=
ium/drivers/nouveau/nvc0/nvc0_screen.c<br>
&gt; index a7581f286cfc..61b381693224 100644<br>
&gt; --- a/src/gallium/drivers/nouveau/nvc0/nvc0_screen.c<br>
&gt; +++ b/src/gallium/drivers/nouveau/nvc0/nvc0_screen.c<br>
&gt; @@ -407,8 +407,6 @@ nvc0_screen_destroy(struct pipe_screen *pscreen)<b=
r>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0FREE(screen-&gt;tic.entries);<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0nouveau_mm_destroy(screen-&gt;mm_VRAM_fe0);<br>
&gt; -<br>
&gt;=C2=A0 =C2=A0 =C2=A0nouveau_object_del(&amp;screen-&gt;eng3d);<br>
&gt;=C2=A0 =C2=A0 =C2=A0nouveau_object_del(&amp;screen-&gt;eng2d);<br>
&gt;=C2=A0 =C2=A0 =C2=A0nouveau_object_del(&amp;screen-&gt;m2mf);<br>
&gt; @@ -1027,7 +1025,6 @@ nvc0_screen_create(struct nouveau_device *dev)<b=
r>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0mm_config.nvc0.tile_mode =3D 0;<br>
&gt;=C2=A0 =C2=A0 =C2=A0mm_config.nvc0.memtype =3D 0xfe0;<br>
&gt; -=C2=A0 =C2=A0screen-&gt;mm_VRAM_fe0 =3D nouveau_mm_create(dev, NOUVEA=
U_BO_VRAM, &amp;mm_config);<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0if (!nvc0_blitter_create(screen))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail;<br>
&gt; diff --git a/src/gallium/drivers/nouveau/nvc0/nvc0_screen.h b/src/gall=
ium/drivers/nouveau/nvc0/nvc0_screen.h<br>
&gt; index 4802057f70ee..8a1991f52eb4 100644<br>
&gt; --- a/src/gallium/drivers/nouveau/nvc0/nvc0_screen.h<br>
&gt; +++ b/src/gallium/drivers/nouveau/nvc0/nvc0_screen.h<br>
&gt; @@ -73,8 +73,6 @@ struct nvc0_screen {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 boolean mp_counters_enabled;<br>
&gt;=C2=A0 =C2=A0 =C2=A0} pm;<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0struct nouveau_mman *mm_VRAM_fe0;<br>
&gt; -<br>
&gt;=C2=A0 =C2=A0 =C2=A0struct nouveau_object *eng3d; /* sqrt(1/2)|kepler&g=
t; + sqrt(1/2)|fermi&gt; */<br>
&gt;=C2=A0 =C2=A0 =C2=A0struct nouveau_object *eng2d;<br>
&gt;=C2=A0 =C2=A0 =C2=A0struct nouveau_object *m2mf;<br>
&gt; --<br>
&gt; 2.1.2<br>
&gt;<br>
</div></div></blockquote></div><br></div>

--001a113ced32df84310507a335e2--

--===============0532974116==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0532974116==--
