From: Nick Tenney <nick.tenney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] nouveau/bl: Assign different names to
	interfaces
Date: Fri, 15 Apr 2016 14:40:18 -0400
Message-ID: <CAJnVJep-31cBSnJkDO4cNUPpVHvaSs=bx1pCpO01=DoTp+st=g@mail.gmail.com>
References: <1460732242-4161-1-git-send-email-pierre.morrow@free.fr>
 <CAKb7Uvg3OxWuooJ=otSb1N_yRr1VcVgvH4K0DDy1zzDs9js4CA@mail.gmail.com>
 <20160415152212.GA1697@Thessia.alltele.se>
 <CAKb7UviwNACmbjk-TpMzUKhvFO8ES+7fqn6UBvzJA_S-WYb96Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1614195848=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAKb7UviwNACmbjk-TpMzUKhvFO8ES+7fqn6UBvzJA_S-WYb96Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

--===============1614195848==
Content-Type: multipart/alternative; boundary=001a113fd402e1472605308a5890

--001a113fd402e1472605308a5890
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 15, 2016 at 11:25 AM, Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> wrote:

> On Fri, Apr 15, 2016 at 11:22 AM, Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org>
> wrote:
> > On 11:06 AM - Apr 15 2016, Ilia Mirkin wrote:
> >> On Fri, Apr 15, 2016 at 10:57 AM, Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org=
>
> wrote:
> >> > Currently, every backlight interface created by Nouveau uses the sam=
e
> name,
> >> > nv_backlight. This leads to a sysfs warning as it tries to create an
> already
> >> > existing folder. This patch adds a incremented number to the name,
> but keeps
> >> > the initial name as nv_backlight, to avoid possibly breaking
> userspace; the
> >> > second interface will be named nv_backlight1, and so on.
> >> >
> >> > Fixes: fdo#86539
>
 I believe Bugzilla: https://bugs.freedesktop.org/show_bug.cgi?id=3D86539 i=
s
the preferred format. I think this is picked up by the mesa release scripts
or some such.

> >> > Signed-off-by: Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org>
> >> > ---
> >> >  drm/nouveau/nouveau_backlight.c | 35
> +++++++++++++++++++++++++++++++++--
> >> >  1 file changed, 33 insertions(+), 2 deletions(-)
> >> >
> >> > diff --git a/drm/nouveau/nouveau_backlight.c
> b/drm/nouveau/nouveau_backlight.c
> >> > index 89eb460..914e2cb 100644
> >> > --- a/drm/nouveau/nouveau_backlight.c
> >> > +++ b/drm/nouveau/nouveau_backlight.c
> >> > @@ -36,6 +36,10 @@
> >> >  #include "nouveau_reg.h"
> >> >  #include "nouveau_encoder.h"
> >> >
> >> > +static atomic_t bl_interfaces_nb =3D { 0 };
> >>
> >> static data is initialized to 0, this should be unnecessary.
> >
> > I didn=E2=80=99t know that. But on the other hand, I like having it exp=
licit,
> and it
> > should not add any overhead.
>
> It increases the size of the object file. I believe it's kernel policy
> to avoid static initializations to 0. (Note that this doesn't hold in
> regular user applications, just the kernel.)
>
>   -ilia
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
>

--001a113fd402e1472605308a5890
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><div class=3D"gmail_quote">=
On Fri, Apr 15, 2016 at 11:25 AM, Ilia Mirkin <span dir=3D"ltr">&lt;<a href=
=3D"mailto:imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org" target=3D"_blank">imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><sp=
an class=3D"">On Fri, Apr 15, 2016 at 11:22 AM, Pierre Moreau &lt;<a href=
=3D"mailto:pierre.morrow-GANU6spQydw@public.gmane.org">pierre.morrow-GANU6spQydw@public.gmane.org</a>&gt; wrote:<br>
&gt; On 11:06 AM - Apr 15 2016, Ilia Mirkin wrote:<br>
&gt;&gt; On Fri, Apr 15, 2016 at 10:57 AM, Pierre Moreau &lt;<a href=3D"mai=
lto:pierre.morrow-GANU6spQydw@public.gmane.org">pierre.morrow-GANU6spQydw@public.gmane.org</a>&gt; wrote:<br>
&gt;&gt; &gt; Currently, every backlight interface created by Nouveau uses =
the same name,<br>
&gt;&gt; &gt; nv_backlight. This leads to a sysfs warning as it tries to cr=
eate an already<br>
&gt;&gt; &gt; existing folder. This patch adds a incremented number to the =
name, but keeps<br>
&gt;&gt; &gt; the initial name as nv_backlight, to avoid possibly breaking =
userspace; the<br>
&gt;&gt; &gt; second interface will be named nv_backlight1, and so on.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Fixes: fdo#86539<br></span></blockquote><div>=C2=A0I believe =
Bugzilla: <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D86539">=
https://bugs.freedesktop.org/show_bug.cgi?id=3D86539</a> is the preferred f=
ormat. I think this is picked up by the mesa release scripts or some such.<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex"><span class=3D""=
>
&gt;&gt; &gt; Signed-off-by: Pierre Moreau &lt;<a href=3D"mailto:pierre.mor=
row-GANU6spQydw@public.gmane.org">pierre.morrow-GANU6spQydw@public.gmane.org</a>&gt;<br>
&gt;&gt; &gt; ---<br>
&gt;&gt; &gt;=C2=A0 drm/nouveau/nouveau_backlight.c | 35 ++++++++++++++++++=
+++++++++++++++--<br>
&gt;&gt; &gt;=C2=A0 1 file changed, 33 insertions(+), 2 deletions(-)<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; diff --git a/drm/nouveau/nouveau_backlight.c b/drm/nouveau/no=
uveau_backlight.c<br>
&gt;&gt; &gt; index 89eb460..914e2cb 100644<br>
&gt;&gt; &gt; --- a/drm/nouveau/nouveau_backlight.c<br>
&gt;&gt; &gt; +++ b/drm/nouveau/nouveau_backlight.c<br>
&gt;&gt; &gt; @@ -36,6 +36,10 @@<br>
&gt;&gt; &gt;=C2=A0 #include &quot;nouveau_reg.h&quot;<br>
&gt;&gt; &gt;=C2=A0 #include &quot;nouveau_encoder.h&quot;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; +static atomic_t bl_interfaces_nb =3D { 0 };<br>
&gt;&gt;<br>
&gt;&gt; static data is initialized to 0, this should be unnecessary.<br>
&gt;<br>
&gt; I didn=E2=80=99t know that. But on the other hand, I like having it ex=
plicit, and it<br>
&gt; should not add any overhead.<br>
<br>
</span>It increases the size of the object file. I believe it&#39;s kernel =
policy<br>
to avoid static initializations to 0. (Note that this doesn&#39;t hold in<b=
r>
regular user applications, just the kernel.)<br>
<span class=3D""><font color=3D"#888888"><br>
=C2=A0 -ilia<br>
</font></span><div class=3D""><div class=3D"h5">___________________________=
____________________<br>
Nouveau mailing list<br>
<a href=3D"mailto:Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org">Nouveau-PD4FTy7X32lNgt0PjOBp9/rsn8yoX9R0@public.gmane.org=
org</a><br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/nouveau" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.freedesktop.org/mailman/listinfo=
/nouveau</a><br>
</div></div></blockquote></div><br></div></div>

--001a113fd402e1472605308a5890--

--===============1614195848==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1614195848==--
