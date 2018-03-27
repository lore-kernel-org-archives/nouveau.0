From: Arushi Singhal <arushisinghal19971997-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] gpu: drm: nouveau: Use
 list_for_each_entry_from_reverse
Date: Tue, 27 Mar 2018 16:59:26 +0530
Message-ID: <CA+XqjF_iDq1KXcKp2j_HYz3JBg+GgKvkVXQ8Y62r8jNiGhE8=w@mail.gmail.com>
References: <20180327091156.GA23787@seema-Inspiron-15-3567>
 <CACAvsv5Wzd6yFsweNXRNA93i5UeTX5qrb_xwPOeobqSjhLEMjg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0866980353=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CACAvsv5Wzd6yFsweNXRNA93i5UeTX5qrb_xwPOeobqSjhLEMjg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, outreachy-kernel <outreachy-kernel-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

--===============0866980353==
Content-Type: multipart/alternative; boundary="00000000000002e425056863345d"

--00000000000002e425056863345d
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 27, 2018 at 2:44 PM, Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> On 27 March 2018 at 19:11, Arushi Singhal
> <arushisinghal19971997-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > It's better to use "list_for_each_entry_from_reverse" for iterating list
> > than "for loop" as it makes the code more clear to read.
> > This patch replace "for loop" with "list_for_each_entry_from_reverse"
> > and remove "cstate" variable as it is redundant in the code.
> I would prefer to also see "start" renamed to "cstate" with this change.
>
Hello Ben

Yes, using cstate is more accurate, as most of the functions are using
"cstate" variable.

Best
Arushi

>
> Ben.
>
> >
> > Signed-off-by: Arushi Singhal <arushisinghal19971997-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > ---
> >  drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c | 8 +++-----
> >  1 file changed, 3 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c
> b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c
> > index 81c3567..5e56f74 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c
> > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c
> > @@ -113,7 +113,6 @@ nvkm_cstate_find_best(struct nvkm_clk *clk, struct
> nvkm_pstate *pstate,
> >  {
> >         struct nvkm_device *device = clk->subdev.device;
> >         struct nvkm_volt *volt = device->volt;
> > -       struct nvkm_cstate *cstate;
> >         int max_volt;
> >
> >         if (!pstate || !start)
> > @@ -133,13 +132,12 @@ nvkm_cstate_find_best(struct nvkm_clk *clk, struct
> nvkm_pstate *pstate,
> >                 max_volt = min(max_volt,
> >                                nvkm_volt_map(volt, volt->max2_id,
> clk->temp));
> >
> > -       for (cstate = start; &cstate->head != &pstate->list;
> > -            cstate = list_prev_entry(cstate, head)) {
> > -               if (nvkm_cstate_valid(clk, cstate, max_volt, clk->temp))
> > +       list_for_each_entry_from_reverse(start, &pstate->list, head) {
> > +               if (nvkm_cstate_valid(clk, start, max_volt, clk->temp))
> >                         break;
> >         }
> >
> > -       return cstate;
> > +       return start;
> >  }
> >
> >  static struct nvkm_cstate *
> > --
> > 2.7.4
> >
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
>

--00000000000002e425056863345d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Tue, Mar 27, 2018 at 2:44 PM, Ben Skeggs <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" target=3D"_blank">skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex">On 27 March 2018 at 19:11,=
 Arushi Singhal<br>
<span class=3D"">&lt;<a href=3D"mailto:arushisinghal19971997-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org">aru=
shisinghal19971997@gmail.<wbr>com</a>&gt; wrote:<br>
&gt; It&#39;s better to use &quot;list_for_each_entry_from_<wbr>reverse&quo=
t; for iterating list<br>
&gt; than &quot;for loop&quot; as it makes the code more clear to read.<br>
&gt; This patch replace &quot;for loop&quot; with &quot;list_for_each_entry=
_from_<wbr>reverse&quot;<br>
&gt; and remove &quot;cstate&quot; variable as it is redundant in the code.=
<br>
</span>I would prefer to also see &quot;start&quot; renamed to &quot;cstate=
&quot; with this change.<br></blockquote><div>Hello Ben<br><br>Yes, using c=
state is more accurate, as most of the functions are using &quot;cstate&quo=
t; variable.<br><br></div><div>Best<br></div><div>Arushi<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex">
<br>
Ben.<br>
<div><div class=3D"h5"><br>
&gt;<br>
&gt; Signed-off-by: Arushi Singhal &lt;<a href=3D"mailto:arushisinghal19971=
997-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org">arushisinghal19971997@gmail.<wbr>com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 drivers/gpu/drm/nouveau/nvkm/<wbr>subdev/clk/base.c | 8 +++-----=
<br>
&gt;=C2=A0 1 file changed, 3 insertions(+), 5 deletions(-)<br>
&gt;<br>
&gt; diff --git a/drivers/gpu/drm/nouveau/<wbr>nvkm/subdev/clk/base.c b/dri=
vers/gpu/drm/nouveau/<wbr>nvkm/subdev/clk/base.c<br>
&gt; index 81c3567..5e56f74 100644<br>
&gt; --- a/drivers/gpu/drm/nouveau/<wbr>nvkm/subdev/clk/base.c<br>
&gt; +++ b/drivers/gpu/drm/nouveau/<wbr>nvkm/subdev/clk/base.c<br>
&gt; @@ -113,7 +113,6 @@ nvkm_cstate_find_best(struct nvkm_clk *clk, struct=
 nvkm_pstate *pstate,<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct nvkm_device *device =3D clk-&g=
t;subdev.device;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct nvkm_volt *volt =3D device-&gt=
;volt;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0struct nvkm_cstate *cstate;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int max_volt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!pstate || !start)<br>
&gt; @@ -133,13 +132,12 @@ nvkm_cstate_find_best(struct nvkm_clk *clk, stru=
ct nvkm_pstate *pstate,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0max_volt =
=3D min(max_volt,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nvkm_volt_map(volt, volt-&gt;max2=
_id, clk-&gt;temp));<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0for (cstate =3D start; &amp;cstate-&gt;hea=
d !=3D &amp;pstate-&gt;list;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cstate =3D list_prev_entry(=
cstate, head)) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (nvkm_cstat=
e_valid(clk, cstate, max_volt, clk-&gt;temp))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0list_for_each_entry_from_<wbr>reverse(star=
t, &amp;pstate-&gt;list, head) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (nvkm_cstat=
e_valid(clk, start, max_volt, clk-&gt;temp))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0break;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0return cstate;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return start;<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt;=C2=A0 static struct nvkm_cstate *<br>
&gt; --<br>
&gt; 2.7.4<br>
&gt;<br>
</div></div>&gt; ______________________________<wbr>_________________<br>
&gt; dri-devel mailing list<br>
&gt; <a href=3D"mailto:dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org">dri-devel-PD4FTy7X32mzQB+pC5nmwQ@public.gmane.org=
edesktop.<wbr>org</a><br>
&gt; <a href=3D"https://lists.freedesktop.org/mailman/listinfo/dri-devel" r=
el=3D"noreferrer" target=3D"_blank">https://lists.freedesktop.org/<wbr>mail=
man/listinfo/dri-devel</a><br>
</blockquote></div><br></div></div>

--00000000000002e425056863345d--

--===============0866980353==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0866980353==--
