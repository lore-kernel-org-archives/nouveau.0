From: Baoyou Xie <baoyou.xie@linaro.org>
Subject: Re: [PATCH v2] drm/nouveau/gr: mark gm107_grctx_generate_tpcid()
 static
Date: Tue, 30 Aug 2016 19:39:27 +0800
Message-ID: <CA+DQWkws5sJMnJagECjXdbEKOdFZ8LLbwm9ng6dYt26KUXUQRQ@mail.gmail.com>
References: <1472475747-30296-1-git-send-email-baoyou.xie@linaro.org>
 <CAOw6vbL9C1o+-1w1=cuwazhS6CqhofsiBbBZjYvBsDT+_dcQ6A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0661637213=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAOw6vbL9C1o+-1w1=cuwazhS6CqhofsiBbBZjYvBsDT+_dcQ6A@mail.gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Sean Paul <seanpaul@google.com>
Cc: Arnd Bergmann <arnd@arndb.de>, nouveau@lists.freedesktop.org, xie.baoyou@zte.com.cn, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, bskeggs@redhat.com
List-Id: nouveau.vger.kernel.org

--===============0661637213==
Content-Type: multipart/alternative; boundary=001a113f8742e71084053b486ef9

--001a113f8742e71084053b486ef9
Content-Type: text/plain; charset=UTF-8

On 30 August 2016 at 00:01, Sean Paul <seanpaul@google.com> wrote:

> On Mon, Aug 29, 2016 at 9:02 AM, Baoyou Xie <baoyou.xie@linaro.org> wrote:
> > We get 1 warning when build kernel with W=1:
> > drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgm107.c:937:1: warning: no
> previous prototype for 'gm107_grctx_generate_tpcid' [-Wmissing-prototypes]
> >
> > In fact, this function is only used in the file in which it is
> > declared and don't need a declaration, but can be made static.
> > so this patch marks this function with 'static'.
> >
>
> It would make things a lot easier if you either consolidated all of
> these static changes into one patch, or released them as a series.
>
>
Do you mean that I need to consolidate all of them into one patch this
time? or next time?


> Sean
>
>
> > Signed-off-by: Baoyou Xie <baoyou.xie@linaro.org>
> > ---
> >  drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgm107.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgm107.c
> b/drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgm107.c
> > index 6d3c501..4c4b5ab 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgm107.c
> > +++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgm107.c
> > @@ -933,7 +933,7 @@ gm107_grctx_generate_attrib(struct gf100_grctx
> *info)
> >         }
> >  }
> >
> > -void
> > +static void
> >  gm107_grctx_generate_tpcid(struct gf100_gr *gr)
> >  {
> >         struct nvkm_device *device = gr->base.engine.subdev.device;
> > --
> > 2.7.4
> >
>

--001a113f8742e71084053b486ef9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On 30 August 2016 at 00:01, Sean Paul <span dir=3D"ltr">&lt;<a href=3D"=
mailto:seanpaul@google.com" target=3D"_blank">seanpaul@google.com</a>&gt;</=
span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><span cla=
ss=3D"">On Mon, Aug 29, 2016 at 9:02 AM, Baoyou Xie &lt;<a href=3D"mailto:b=
aoyou.xie@linaro.org">baoyou.xie@linaro.org</a>&gt; wrote:<br>
&gt; We get 1 warning when build kernel with W=3D1:<br>
&gt; drivers/gpu/drm/nouveau/nvkm/<wbr>engine/gr/ctxgm107.c:937:1: warning:=
 no previous prototype for &#39;gm107_grctx_generate_tpcid&#39; [-Wmissing-=
prototypes]<br>
&gt;<br>
&gt; In fact, this function is only used in the file in which it is<br>
&gt; declared and don&#39;t need a declaration, but can be made static.<br>
&gt; so this patch marks this function with &#39;static&#39;.<br>
&gt;<br>
<br>
</span>It would make things a lot easier if you either consolidated all of<=
br>
these static changes into one patch, or released them as a series.<br>
<span class=3D""><font color=3D"#888888"><br></font></span></blockquote><di=
v>=C2=A0</div><div>Do you mean that I need to consolidate all of them into =
one patch this time? or next time?<br></div><div>=C2=A0</div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex"><span class=3D""><font color=3D"#888888=
">
Sean<br>
</font></span><div class=3D""><div class=3D"h5"><br>
<br>
&gt; Signed-off-by: Baoyou Xie &lt;<a href=3D"mailto:baoyou.xie@linaro.org"=
>baoyou.xie@linaro.org</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 drivers/gpu/drm/nouveau/nvkm/<wbr>engine/gr/ctxgm107.c | 2 +-<br=
>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/drivers/gpu/drm/nouveau/<wbr>nvkm/engine/gr/ctxgm107.c b/=
drivers/gpu/drm/nouveau/<wbr>nvkm/engine/gr/ctxgm107.c<br>
&gt; index 6d3c501..4c4b5ab 100644<br>
&gt; --- a/drivers/gpu/drm/nouveau/<wbr>nvkm/engine/gr/ctxgm107.c<br>
&gt; +++ b/drivers/gpu/drm/nouveau/<wbr>nvkm/engine/gr/ctxgm107.c<br>
&gt; @@ -933,7 +933,7 @@ gm107_grctx_generate_attrib(<wbr>struct gf100_grct=
x *info)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt; -void<br>
&gt; +static void<br>
&gt;=C2=A0 gm107_grctx_generate_tpcid(<wbr>struct gf100_gr *gr)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct nvkm_device *device =3D gr-&gt=
;base.engine.subdev.device;<br>
&gt; --<br>
&gt; 2.7.4<br>
&gt;<br>
</div></div></blockquote></div><br></div></div>

--001a113f8742e71084053b486ef9--

--===============0661637213==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0661637213==--
