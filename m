From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] drm/nouveau: add default debug level override
Date: Thu, 13 Sep 2012 22:09:33 +1000
Message-ID: <CACAvsv4QTGOjVDZPNyg1UMxEWkRrOQVceDXfaO7nVoWmP8YMWg@mail.gmail.com>
References: <20120912225006.GC8067@joi.lan>
	<20120913020920.GA11828@nisroch.bne.redhat.com>
	<20120913112516.GA3243@joi.lan>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0469356917=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20120913112516.GA3243-OI9uyE9O0yo@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

--===============0469356917==
Content-Type: multipart/alternative; boundary=bcaec54b54342e7fef04c9942e26

--bcaec54b54342e7fef04c9942e26
Content-Type: text/plain; charset=ISO-8859-1

On Thursday, September 13, 2012, Marcin Slusarz wrote:

> On Thu, Sep 13, 2012 at 12:09:20PM +1000, Ben Skeggs wrote:
> > On Thu, Sep 13, 2012 at 12:50:06AM +0200, Marcin Slusarz wrote:
> > > Useful when we don't know which subsystem is failing.
> > This is really unnecessary unless I'm missing something.  You can pass
> nouveau.debug=LEVEL (without specifying a subdev name) to set the default
> already.
>
> Does not work for me: http://bpaste.net/show/45252/

nouveau.debug=paranoia ;)

As mentioned previously, i'll document this somewhere.


> (ignore gpio debugging messages - I'm looking for suspend regression)
>
> > >
> > > Signed-off-by: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org <javascript:;>
> >
> > > ---
> > >  drivers/gpu/drm/nouveau/core/core/option.c | 9 ++++++++-
> > >  1 file changed, 8 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/nouveau/core/core/option.c
> b/drivers/gpu/drm/nouveau/core/core/option.c
> > > index 62a432e..fde06b0 100644
> > > --- a/drivers/gpu/drm/nouveau/core/core/option.c
> > > +++ b/drivers/gpu/drm/nouveau/core/core/option.c
> > > @@ -22,9 +22,16 @@
> > >   * Authors: Ben Skeggs
> > >   */
> > >
> > > +#include <linux/module.h>
> > >  #include <core/option.h>
> > >  #include <core/debug.h>
> > >
> > > +MODULE_PARM_DESC(debug_level, "nv_printk level (0-"
> > > +           __stringify(CONFIG_NOUVEAU_DEBUG) ", default "
> > > +           __stringify(CONFIG_NOUVEAU_DEBUG_DEFAULT) ")");
> > > +static int nouveau_debug_level = CONFIG_NOUVEAU_DEBUG_DEFAULT;
> > > +module_param_named(debug_level, nouveau_debug_level, int, 0400);
> > > +
> > >  /* compares unterminated string 'str' with zero-terminated string
> 'cmp' */
> > >  static inline int
> > >  strncasecmpz(const char *str, const char *cmp, size_t len)
> > > @@ -86,7 +93,7 @@ nouveau_boolopt(const char *optstr, const char *opt,
> bool value)
> > >  int
> > >  nouveau_dbgopt(const char *optstr, const char *sub)
> > >  {
> > > -   int mode = 1, level = CONFIG_NOUVEAU_DEBUG_DEFAULT;
> > > +   int mode = 1, level = nouveau_debug_level;
> > >
> > >     while (optstr) {
> > >             int len = strcspn(optstr, ",=");
> > > --
> > > 1.7.12
> > >
>

--bcaec54b54342e7fef04c9942e26
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thursday, September 13, 2012, Marcin Slusarz  wrote:<br><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex">On Thu, Sep 13, 2012 at 12:09:20PM +1000, Ben Skeggs wrote:<=
br>

&gt; On Thu, Sep 13, 2012 at 12:50:06AM +0200, Marcin Slusarz wrote:<br>
&gt; &gt; Useful when we don&#39;t know which subsystem is failing.<br>
&gt; This is really unnecessary unless I&#39;m missing something. =A0You ca=
n pass nouveau.debug=3DLEVEL (without specifying a subdev name) to set the =
default already.<br>
<br>
Does not work for me: <a href=3D"http://bpaste.net/show/45252/" target=3D"_=
blank">http://bpaste.net/show/45252/</a></blockquote><div>nouveau.debug=3Dp=
aranoia ;)</div><div><br></div><div>As mentioned previously, i&#39;ll docum=
ent this somewhere.</div>
<div>=A0<span></span></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
(ignore gpio debugging messages - I&#39;m looking for suspend regression)<b=
r>
<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Marcin Slusarz &lt;<a href=3D"javascript:;" onclic=
k=3D"_e(event, &#39;cvml&#39;, &#39;marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org&#39;)">marcin.=
slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt; =A0drivers/gpu/drm/nouveau/core/core/option.c | 9 ++++++++-<br>
&gt; &gt; =A01 file changed, 8 insertions(+), 1 deletion(-)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/drivers/gpu/drm/nouveau/core/core/option.c b/drivers=
/gpu/drm/nouveau/core/core/option.c<br>
&gt; &gt; index 62a432e..fde06b0 100644<br>
&gt; &gt; --- a/drivers/gpu/drm/nouveau/core/core/option.c<br>
&gt; &gt; +++ b/drivers/gpu/drm/nouveau/core/core/option.c<br>
&gt; &gt; @@ -22,9 +22,16 @@<br>
&gt; &gt; =A0 * Authors: Ben Skeggs<br>
&gt; &gt; =A0 */<br>
&gt; &gt;<br>
&gt; &gt; +#include &lt;linux/module.h&gt;<br>
&gt; &gt; =A0#include &lt;core/option.h&gt;<br>
&gt; &gt; =A0#include &lt;core/debug.h&gt;<br>
&gt; &gt;<br>
&gt; &gt; +MODULE_PARM_DESC(debug_level, &quot;nv_printk level (0-&quot;<br=
>
&gt; &gt; + =A0 =A0 =A0 =A0 =A0 __stringify(CONFIG_NOUVEAU_DEBUG) &quot;, d=
efault &quot;<br>
&gt; &gt; + =A0 =A0 =A0 =A0 =A0 __stringify(CONFIG_NOUVEAU_DEBUG_DEFAULT) &=
quot;)&quot;);<br>
&gt; &gt; +static int nouveau_debug_level =3D CONFIG_NOUVEAU_DEBUG_DEFAULT;=
<br>
&gt; &gt; +module_param_named(debug_level, nouveau_debug_level, int, 0400);=
<br>
&gt; &gt; +<br>
&gt; &gt; =A0/* compares unterminated string &#39;str&#39; with zero-termin=
ated string &#39;cmp&#39; */<br>
&gt; &gt; =A0static inline int<br>
&gt; &gt; =A0strncasecmpz(const char *str, const char *cmp, size_t len)<br>
&gt; &gt; @@ -86,7 +93,7 @@ nouveau_boolopt(const char *optstr, const char =
*opt, bool value)<br>
&gt; &gt; =A0int<br>
&gt; &gt; =A0nouveau_dbgopt(const char *optstr, const char *sub)<br>
&gt; &gt; =A0{<br>
&gt; &gt; - =A0 int mode =3D 1, level =3D CONFIG_NOUVEAU_DEBUG_DEFAULT;<br>
&gt; &gt; + =A0 int mode =3D 1, level =3D nouveau_debug_level;<br>
&gt; &gt;<br>
&gt; &gt; =A0 =A0 while (optstr) {<br>
&gt; &gt; =A0 =A0 =A0 =A0 =A0 =A0 int len =3D strcspn(optstr, &quot;,=3D&qu=
ot;);<br>
&gt; &gt; --<br>
&gt; &gt; 1.7.12<br>
&gt; &gt;<br>
</blockquote>

--bcaec54b54342e7fef04c9942e26--

--===============0469356917==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0469356917==--
