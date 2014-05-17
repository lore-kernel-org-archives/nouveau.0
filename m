From: Ben Skeggs <skeggsb@gmail.com>
Subject: Re: [Nouveau] [PATCH] clk: allow config option to enable reclocking
Date: Sat, 17 May 2014 13:17:31 +1000
Message-ID: <CACAvsv5an3rkOtk=rPixGcunadZgRDQsXrEnozO65v8uTwaw3A@mail.gmail.com>
References: <1400258565-28941-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1057685838=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1400258565-28941-1-git-send-email-imirkin@alum.mit.edu>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Ilia Mirkin <imirkin@alum.mit.edu>
Cc: nouveau@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>, dri-devel@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

--===============1057685838==
Content-Type: multipart/alternative; boundary=001a11c3b23a7c618904f98ff8f4

--001a11c3b23a7c618904f98ff8f4
Content-Type: text/plain; charset=UTF-8

On 17 May 2014 02:43, "Ilia Mirkin" <imirkin@alum.mit.edu> wrote:
>
> Adds a NvReclock boolean option to allow the user to enable (or disable)
> reclocking. All chipsets default to off, except NVAA/NVAC, which are
> reportedly complete.
Hey Ilia,

I think I've expressed my thoughts on this previously via IRC, but let me
stick them here too so there's a record of the current state...

For nvaa/nvac, yes, let's enable it by default. It should, apparently, be
good enough that it has a decent chance of working.  It's not like we're
attempting anything automatic yet, so, this won't break anything for people
who aren't trying..

I'm on the fence about Kepler. It actually might work to some extent in a
decent number of cases already, there's potentially some severe issues even
with engine clocks on some  boards that I'm aware of, so it's not just a
memory reclocking worry here.

That said, it has a good chance of working for some people. So. Thoughts?
I'm also talking making "NvMemExec" default on here too.  Again, causing a
fuck-up will still require direct user action.

For the rest (Hm, except maybe nv40, a lot will probably be ok..) There's
*very* little chance memory reclocking will work, even on the systems where
it used to. The code is far less complete, as it was broken in general, and
I haven't yet had the time to *properly* reverse engineer the sequence
needed to stably reclock memory.  Kepler is the only implementation where
that's even been started.  Tl;dr - unless you're working on the code for
Tesla/Fermi, there's zero point even trying it. So, the block should stay.

Personally, as you know, I'm more comfortable leaving it developer-only
still (except nvaa/nvac) until it at least works on all our own boards
without any major known missing bits..  But yeah, for the ones mentioned
above, I guess it's a possibility if people *really* want...

I can only envision that if we allow this even just in the places it's
known to be partially broken, certain sensationalist, er, people, will feel
the need to test and complain about how broken it all really is... And then
retest on a regular basis, despite there having been *zero* work done
because no-one has the time, and then complain about the exact same thing
AGAIN! (WHOA.. I'm done ranting now :p)

Anyways, that's my thoughts on the matter :)

Comments, suggestions?

Thanks,
Ben.

>
> Signed-off-by: Ilia Mirkin <imirkin@alum.mit.edu>
> ---
>
> Ben, I know you've been saying that reclocking is in a pretty bad state,
but I
> do think that there are going to be groups of people for whom the current
code
> can work at least a little bit. May as well let them try it. The memory
script
> execution is still behind the extra-special flag as well...
>
> Also this provides a way forward to enable reclocking on some chips and
leave
> it off for others, by default.
>
>  nvkm/include/subdev/clock.h | 8 +++++---
>  nvkm/subdev/clock/base.c    | 8 ++++++--
>  nvkm/subdev/clock/nv04.c    | 3 ++-
>  nvkm/subdev/clock/nv40.c    | 3 ++-
>  nvkm/subdev/clock/nv50.c    | 2 +-
>  nvkm/subdev/clock/nva3.c    | 3 ++-
>  nvkm/subdev/clock/nvaa.c    | 3 ++-
>  nvkm/subdev/clock/nvc0.c    | 3 ++-
>  nvkm/subdev/clock/nve0.c    | 3 ++-
>  9 files changed, 24 insertions(+), 12 deletions(-)
>
> diff --git a/nvkm/include/subdev/clock.h b/nvkm/include/subdev/clock.h
> index 8f4ced7..c01e29c 100644
> --- a/nvkm/include/subdev/clock.h
> +++ b/nvkm/include/subdev/clock.h
> @@ -77,6 +77,8 @@ struct nouveau_clock {
>         int tstate; /* thermal adjustment (max-) */
>         int dstate; /* display adjustment (min+) */
>
> +       bool allow_reclock;
> +
>         int  (*read)(struct nouveau_clock *, enum nv_clk_src);
>         int  (*calc)(struct nouveau_clock *, struct nouveau_cstate *);
>         int  (*prog)(struct nouveau_clock *);
> @@ -106,8 +108,8 @@ struct nouveau_clocks {
>         int mdiv;
>  };
>
> -#define nouveau_clock_create(p,e,o,i,d)
       \
> -       nouveau_clock_create_((p), (e), (o), (i), sizeof(**d), (void **)d)
> +#define nouveau_clock_create(p,e,o,i,r,d)
       \
> +       nouveau_clock_create_((p), (e), (o), (i), (r), sizeof(**d), (void
**)d)
>  #define nouveau_clock_destroy(p) ({
       \
>         struct nouveau_clock *clk = (p);
      \
>         _nouveau_clock_dtor(nv_object(clk));
      \
> @@ -121,7 +123,7 @@ struct nouveau_clocks {
>
>  int  nouveau_clock_create_(struct nouveau_object *, struct
nouveau_object *,
>                            struct nouveau_oclass *,
> -                          struct nouveau_clocks *, int, void **);
> +                          struct nouveau_clocks *, bool, int, void **);
>  void _nouveau_clock_dtor(struct nouveau_object *);
>  int _nouveau_clock_init(struct nouveau_object *);
>  #define _nouveau_clock_fini _nouveau_subdev_fini
> diff --git a/nvkm/subdev/clock/base.c b/nvkm/subdev/clock/base.c
> index dd62bae..80ad9d3 100644
> --- a/nvkm/subdev/clock/base.c
> +++ b/nvkm/subdev/clock/base.c
> @@ -346,8 +346,8 @@ nouveau_clock_ustate_update(struct nouveau_clock
*clk, int req)
>         struct nouveau_pstate *pstate;
>         int i = 0;
>
> -       /* YKW repellant */
> -       return -ENOSYS;
> +       if (!clk->allow_reclock)
> +               return -ENOSYS;
>
>         if (req != -1 && req != -2) {
>                 list_for_each_entry(pstate, &clk->states, head) {
> @@ -456,6 +456,7 @@ nouveau_clock_create_(struct nouveau_object *parent,
>                       struct nouveau_object *engine,
>                       struct nouveau_oclass *oclass,
>                       struct nouveau_clocks *clocks,
> +                     bool allow_reclock,
>                       int length, void **object)
>  {
>         struct nouveau_device *device = nv_device(parent);
> @@ -478,6 +479,9 @@ nouveau_clock_create_(struct nouveau_object *parent,
>                 ret = nouveau_pstate_new(clk, idx++);
>         } while (ret == 0);
>
> +       clk->allow_reclock =
> +               nouveau_boolopt(device->cfgopt, "NvReclock",
allow_reclock);
> +
>         mode = nouveau_stropt(device->cfgopt, "NvClkMode", &arglen);
>         if (mode) {
>                 if (!strncasecmpz(mode, "disabled", arglen)) {
> diff --git a/nvkm/subdev/clock/nv04.c b/nvkm/subdev/clock/nv04.c
> index b74db6c..eb2d442 100644
> --- a/nvkm/subdev/clock/nv04.c
> +++ b/nvkm/subdev/clock/nv04.c
> @@ -82,7 +82,8 @@ nv04_clock_ctor(struct nouveau_object *parent, struct
nouveau_object *engine,
>         struct nv04_clock_priv *priv;
>         int ret;
>
> -       ret = nouveau_clock_create(parent, engine, oclass, nv04_domain,
&priv);
> +       ret = nouveau_clock_create(parent, engine, oclass, nv04_domain,
false,
> +                                  &priv);
>         *pobject = nv_object(priv);
>         if (ret)
>                 return ret;
> diff --git a/nvkm/subdev/clock/nv40.c b/nvkm/subdev/clock/nv40.c
> index db7346f..651e299 100644
> --- a/nvkm/subdev/clock/nv40.c
> +++ b/nvkm/subdev/clock/nv40.c
> @@ -213,7 +213,8 @@ nv40_clock_ctor(struct nouveau_object *parent, struct
nouveau_object *engine,
>         struct nv40_clock_priv *priv;
>         int ret;
>
> -       ret = nouveau_clock_create(parent, engine, oclass, nv40_domain,
&priv);
> +       ret = nouveau_clock_create(parent, engine, oclass, nv40_domain,
false,
> +                                  &priv);
>         *pobject = nv_object(priv);
>         if (ret)
>                 return ret;
> diff --git a/nvkm/subdev/clock/nv50.c b/nvkm/subdev/clock/nv50.c
> index 250a6d9..8c13277 100644
> --- a/nvkm/subdev/clock/nv50.c
> +++ b/nvkm/subdev/clock/nv50.c
> @@ -507,7 +507,7 @@ nv50_clock_ctor(struct nouveau_object *parent, struct
nouveau_object *engine,
>         int ret;
>
>         ret = nouveau_clock_create(parent, engine, oclass,
pclass->domains,
> -                                 &priv);
> +                                  false, &priv);
>         *pobject = nv_object(priv);
>         if (ret)
>                 return ret;
> diff --git a/nvkm/subdev/clock/nva3.c b/nvkm/subdev/clock/nva3.c
> index 4f5a137..9fb5835 100644
> --- a/nvkm/subdev/clock/nva3.c
> +++ b/nvkm/subdev/clock/nva3.c
> @@ -302,7 +302,8 @@ nva3_clock_ctor(struct nouveau_object *parent, struct
nouveau_object *engine,
>         struct nva3_clock_priv *priv;
>         int ret;
>
> -       ret = nouveau_clock_create(parent, engine, oclass, nva3_domain,
&priv);
> +       ret = nouveau_clock_create(parent, engine, oclass, nva3_domain,
false,
> +                                  &priv);
>         *pobject = nv_object(priv);
>         if (ret)
>                 return ret;
> diff --git a/nvkm/subdev/clock/nvaa.c b/nvkm/subdev/clock/nvaa.c
> index 7a723b4..6a65fc9 100644
> --- a/nvkm/subdev/clock/nvaa.c
> +++ b/nvkm/subdev/clock/nvaa.c
> @@ -421,7 +421,8 @@ nvaa_clock_ctor(struct nouveau_object *parent, struct
nouveau_object *engine,
>         struct nvaa_clock_priv *priv;
>         int ret;
>
> -       ret = nouveau_clock_create(parent, engine, oclass, nvaa_domains,
&priv);
> +       ret = nouveau_clock_create(parent, engine, oclass, nvaa_domains,
true,
> +                                  &priv);
>         *pobject = nv_object(priv);
>         if (ret)
>                 return ret;
> diff --git a/nvkm/subdev/clock/nvc0.c b/nvkm/subdev/clock/nvc0.c
> index c310572..dbf8517 100644
> --- a/nvkm/subdev/clock/nvc0.c
> +++ b/nvkm/subdev/clock/nvc0.c
> @@ -437,7 +437,8 @@ nvc0_clock_ctor(struct nouveau_object *parent, struct
nouveau_object *engine,
>         struct nvc0_clock_priv *priv;
>         int ret;
>
> -       ret = nouveau_clock_create(parent, engine, oclass, nvc0_domain,
&priv);
> +       ret = nouveau_clock_create(parent, engine, oclass, nvc0_domain,
false,
> +                                  &priv);
>         *pobject = nv_object(priv);
>         if (ret)
>                 return ret;
> diff --git a/nvkm/subdev/clock/nve0.c b/nvkm/subdev/clock/nve0.c
> index d3c37c9..860aa73 100644
> --- a/nvkm/subdev/clock/nve0.c
> +++ b/nvkm/subdev/clock/nve0.c
> @@ -473,7 +473,8 @@ nve0_clock_ctor(struct nouveau_object *parent, struct
nouveau_object *engine,
>         struct nve0_clock_priv *priv;
>         int ret;
>
> -       ret = nouveau_clock_create(parent, engine, oclass, nve0_domain,
&priv);
> +       ret = nouveau_clock_create(parent, engine, oclass, nve0_domain,
false,
> +                                  &priv);
>         *pobject = nv_object(priv);
>         if (ret)
>                 return ret;
> --
> 1.8.5.5
>
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau

--001a11c3b23a7c618904f98ff8f4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">On 17 May 2014 02:43, &quot;Ilia Mirkin&quot; &lt;<a href=3D=
"mailto:imirkin@alum.mit.edu">imirkin@alum.mit.edu</a>&gt; wrote:<br>
&gt;<br>
&gt; Adds a NvReclock boolean option to allow the user to enable (or disabl=
e)<br>
&gt; reclocking. All chipsets default to off, except NVAA/NVAC, which are<b=
r>
&gt; reportedly complete.<br>
Hey Ilia,</p>
<p dir=3D"ltr">I think I&#39;ve expressed my thoughts on this previously vi=
a IRC, but let me stick them here too so there&#39;s a record of the curren=
t state...</p>
<p dir=3D"ltr">For nvaa/nvac, yes, let&#39;s enable it by default. It shoul=
d, apparently, be good enough that it has a decent chance of working.=C2=A0=
 It&#39;s not like we&#39;re attempting anything automatic yet, so, this wo=
n&#39;t break anything for people who aren&#39;t trying..</p>

<p dir=3D"ltr">I&#39;m on the fence about Kepler. It actually might work to=
 some extent in a decent number of cases already, there&#39;s potentially s=
ome severe issues even with engine clocks on some=C2=A0 boards that I&#39;m=
 aware of, so it&#39;s not just a memory reclocking worry here.</p>

<p dir=3D"ltr">That said, it has a good chance of working for some people. =
So. Thoughts? I&#39;m also talking making &quot;NvMemExec&quot; default on =
here too.=C2=A0 Again, causing a fuck-up will still require direct user act=
ion.</p>

<p dir=3D"ltr">For the rest (Hm, except maybe nv40, a lot will probably be =
ok..) There&#39;s *very* little chance memory reclocking will work, even on=
 the systems where it used to. The code is far less complete, as it was bro=
ken in general, and I haven&#39;t yet had the time to *properly* reverse en=
gineer the sequence needed to stably reclock memory.=C2=A0 Kepler is the on=
ly implementation where that&#39;s even been started.=C2=A0 Tl;dr - unless =
you&#39;re working on the code for Tesla/Fermi, there&#39;s zero point even=
 trying it. So, the block should stay.</p>

<p dir=3D"ltr">Personally, as you know, I&#39;m more comfortable leaving it=
 developer-only still (except nvaa/nvac) until it at least works on all our=
 own boards without any major known missing bits..=C2=A0 But yeah, for the =
ones mentioned above, I guess it&#39;s a possibility if people *really* wan=
t...</p>

<p dir=3D"ltr">I can only envision that if we allow this even just in the p=
laces it&#39;s known to be partially broken, certain sensationalist, er, pe=
ople, will feel the need to test and complain about how broken it all reall=
y is... And then retest on a regular basis, despite there having been *zero=
* work done because no-one has the time, and then complain about the exact =
same thing AGAIN! (WHOA.. I&#39;m done ranting now :p)</p>

<p dir=3D"ltr">Anyways, that&#39;s my thoughts on the matter :)</p>
<p dir=3D"ltr">Comments, suggestions?</p>
<p dir=3D"ltr">Thanks, <br>
Ben. </p>
<p dir=3D"ltr">&gt;<br>
&gt; Signed-off-by: Ilia Mirkin &lt;<a href=3D"mailto:imirkin@alum.mit.edu"=
>imirkin@alum.mit.edu</a>&gt;<br>
&gt; ---<br>
&gt;<br>
&gt; Ben, I know you&#39;ve been saying that reclocking is in a pretty bad =
state, but I<br>
&gt; do think that there are going to be groups of people for whom the curr=
ent code<br>
&gt; can work at least a little bit. May as well let them try it. The memor=
y script<br>
&gt; execution is still behind the extra-special flag as well...<br>
&gt;<br>
&gt; Also this provides a way forward to enable reclocking on some chips an=
d leave<br>
&gt; it off for others, by default.<br>
&gt;<br>
&gt; =C2=A0nvkm/include/subdev/clock.h | 8 +++++---<br>
&gt; =C2=A0nvkm/subdev/clock/base.c =C2=A0 =C2=A0| 8 ++++++--<br>
&gt; =C2=A0nvkm/subdev/clock/nv04.c =C2=A0 =C2=A0| 3 ++-<br>
&gt; =C2=A0nvkm/subdev/clock/nv40.c =C2=A0 =C2=A0| 3 ++-<br>
&gt; =C2=A0nvkm/subdev/clock/nv50.c =C2=A0 =C2=A0| 2 +-<br>
&gt; =C2=A0nvkm/subdev/clock/nva3.c =C2=A0 =C2=A0| 3 ++-<br>
&gt; =C2=A0nvkm/subdev/clock/nvaa.c =C2=A0 =C2=A0| 3 ++-<br>
&gt; =C2=A0nvkm/subdev/clock/nvc0.c =C2=A0 =C2=A0| 3 ++-<br>
&gt; =C2=A0nvkm/subdev/clock/nve0.c =C2=A0 =C2=A0| 3 ++-<br>
&gt; =C2=A09 files changed, 24 insertions(+), 12 deletions(-)<br>
&gt;<br>
&gt; diff --git a/nvkm/include/subdev/clock.h b/nvkm/include/subdev/clock.h=
<br>
&gt; index 8f4ced7..c01e29c 100644<br>
&gt; --- a/nvkm/include/subdev/clock.h<br>
&gt; +++ b/nvkm/include/subdev/clock.h<br>
&gt; @@ -77,6 +77,8 @@ struct nouveau_clock {<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 int tstate; /* thermal adjustment (max-) *=
/<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 int dstate; /* display adjustment (min+) *=
/<br>
&gt;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 bool allow_reclock;<br>
&gt; +<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 int =C2=A0(*read)(struct nouveau_clock *, =
enum nv_clk_src);<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 int =C2=A0(*calc)(struct nouveau_clock *, =
struct nouveau_cstate *);<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 int =C2=A0(*prog)(struct nouveau_clock *);=
<br>
&gt; @@ -106,8 +108,8 @@ struct nouveau_clocks {<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 int mdiv;<br>
&gt; =C2=A0};<br>
&gt;<br>
&gt; -#define nouveau_clock_create(p,e,o,i,d) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt; - =C2=A0 =C2=A0 =C2=A0 nouveau_clock_create_((p), (e), (o), (i), sizeo=
f(**d), (void **)d)<br>
&gt; +#define nouveau_clock_create(p,e,o,i,r,d) =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 nouveau_clock_create_((p), (e), (o), (i), (r), =
sizeof(**d), (void **)d)<br>
&gt; =C2=A0#define nouveau_clock_destroy(p) ({ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct nouveau_clock *clk =3D (p); =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 _nouveau_clock_dtor(nv_object(clk)); =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt; @@ -121,7 +123,7 @@ struct nouveau_clocks {<br>
&gt;<br>
&gt; =C2=A0int =C2=A0nouveau_clock_create_(struct nouveau_object *, struct =
nouveau_object *,<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0struct nouveau_oclass *,<br>
&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0struct nouveau_clocks *, int, void **);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0struct nouveau_clocks *, bool, int, void **);<br>
&gt; =C2=A0void _nouveau_clock_dtor(struct nouveau_object *);<br>
&gt; =C2=A0int _nouveau_clock_init(struct nouveau_object *);<br>
&gt; =C2=A0#define _nouveau_clock_fini _nouveau_subdev_fini<br>
&gt; diff --git a/nvkm/subdev/clock/base.c b/nvkm/subdev/clock/base.c<br>
&gt; index dd62bae..80ad9d3 100644<br>
&gt; --- a/nvkm/subdev/clock/base.c<br>
&gt; +++ b/nvkm/subdev/clock/base.c<br>
&gt; @@ -346,8 +346,8 @@ nouveau_clock_ustate_update(struct nouveau_clock *=
clk, int req)<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct nouveau_pstate *pstate;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 int i =3D 0;<br>
&gt;<br>
&gt; - =C2=A0 =C2=A0 =C2=A0 /* YKW repellant */<br>
&gt; - =C2=A0 =C2=A0 =C2=A0 return -ENOSYS;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 if (!clk-&gt;allow_reclock)<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENOSYS;<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (req !=3D -1 &amp;&amp; req !=3D -2) {<=
br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 list_for_each_=
entry(pstate, &amp;clk-&gt;states, head) {<br>
&gt; @@ -456,6 +456,7 @@ nouveau_clock_create_(struct nouveau_object *paren=
t,<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 struct nouveau_object *engine,<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 struct nouveau_oclass *oclass,<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 struct nouveau_clocks *clocks,<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 bool allow_reclock,<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 int length, void **object)<br>
&gt; =C2=A0{<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct nouveau_device *device =3D nv_devic=
e(parent);<br>
&gt; @@ -478,6 +479,9 @@ nouveau_clock_create_(struct nouveau_object *paren=
t,<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D nouvea=
u_pstate_new(clk, idx++);<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 } while (ret =3D=3D 0);<br>
&gt;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 clk-&gt;allow_reclock =3D<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nouveau_boolopt(dev=
ice-&gt;cfgopt, &quot;NvReclock&quot;, allow_reclock);<br>
&gt; +<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 mode =3D nouveau_stropt(device-&gt;cfgopt,=
 &quot;NvClkMode&quot;, &amp;arglen);<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (mode) {<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!strncasec=
mpz(mode, &quot;disabled&quot;, arglen)) {<br>
&gt; diff --git a/nvkm/subdev/clock/nv04.c b/nvkm/subdev/clock/nv04.c<br>
&gt; index b74db6c..eb2d442 100644<br>
&gt; --- a/nvkm/subdev/clock/nv04.c<br>
&gt; +++ b/nvkm/subdev/clock/nv04.c<br>
&gt; @@ -82,7 +82,8 @@ nv04_clock_ctor(struct nouveau_object *parent, struc=
t nouveau_object *engine,<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct nv04_clock_priv *priv;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 int ret;<br>
&gt;<br>
&gt; - =C2=A0 =C2=A0 =C2=A0 ret =3D nouveau_clock_create(parent, engine, oc=
lass, nv04_domain, &amp;priv);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 ret =3D nouveau_clock_create(parent, engine, oc=
lass, nv04_domain, false,<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;priv);<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 *pobject =3D nv_object(priv);<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret)<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;<br=
>
&gt; diff --git a/nvkm/subdev/clock/nv40.c b/nvkm/subdev/clock/nv40.c<br>
&gt; index db7346f..651e299 100644<br>
&gt; --- a/nvkm/subdev/clock/nv40.c<br>
&gt; +++ b/nvkm/subdev/clock/nv40.c<br>
&gt; @@ -213,7 +213,8 @@ nv40_clock_ctor(struct nouveau_object *parent, str=
uct nouveau_object *engine,<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct nv40_clock_priv *priv;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 int ret;<br>
&gt;<br>
&gt; - =C2=A0 =C2=A0 =C2=A0 ret =3D nouveau_clock_create(parent, engine, oc=
lass, nv40_domain, &amp;priv);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 ret =3D nouveau_clock_create(parent, engine, oc=
lass, nv40_domain, false,<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;priv);<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 *pobject =3D nv_object(priv);<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret)<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;<br=
>
&gt; diff --git a/nvkm/subdev/clock/nv50.c b/nvkm/subdev/clock/nv50.c<br>
&gt; index 250a6d9..8c13277 100644<br>
&gt; --- a/nvkm/subdev/clock/nv50.c<br>
&gt; +++ b/nvkm/subdev/clock/nv50.c<br>
&gt; @@ -507,7 +507,7 @@ nv50_clock_ctor(struct nouveau_object *parent, str=
uct nouveau_object *engine,<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 int ret;<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D nouveau_clock_create(parent, engin=
e, oclass, pclass-&gt;domains,<br>
&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;priv);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0false, &amp;priv);<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 *pobject =3D nv_object(priv);<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret)<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;<br=
>
&gt; diff --git a/nvkm/subdev/clock/nva3.c b/nvkm/subdev/clock/nva3.c<br>
&gt; index 4f5a137..9fb5835 100644<br>
&gt; --- a/nvkm/subdev/clock/nva3.c<br>
&gt; +++ b/nvkm/subdev/clock/nva3.c<br>
&gt; @@ -302,7 +302,8 @@ nva3_clock_ctor(struct nouveau_object *parent, str=
uct nouveau_object *engine,<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct nva3_clock_priv *priv;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 int ret;<br>
&gt;<br>
&gt; - =C2=A0 =C2=A0 =C2=A0 ret =3D nouveau_clock_create(parent, engine, oc=
lass, nva3_domain, &amp;priv);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 ret =3D nouveau_clock_create(parent, engine, oc=
lass, nva3_domain, false,<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;priv);<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 *pobject =3D nv_object(priv);<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret)<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;<br=
>
&gt; diff --git a/nvkm/subdev/clock/nvaa.c b/nvkm/subdev/clock/nvaa.c<br>
&gt; index 7a723b4..6a65fc9 100644<br>
&gt; --- a/nvkm/subdev/clock/nvaa.c<br>
&gt; +++ b/nvkm/subdev/clock/nvaa.c<br>
&gt; @@ -421,7 +421,8 @@ nvaa_clock_ctor(struct nouveau_object *parent, str=
uct nouveau_object *engine,<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct nvaa_clock_priv *priv;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 int ret;<br>
&gt;<br>
&gt; - =C2=A0 =C2=A0 =C2=A0 ret =3D nouveau_clock_create(parent, engine, oc=
lass, nvaa_domains, &amp;priv);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 ret =3D nouveau_clock_create(parent, engine, oc=
lass, nvaa_domains, true,<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;priv);<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 *pobject =3D nv_object(priv);<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret)<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;<br=
>
&gt; diff --git a/nvkm/subdev/clock/nvc0.c b/nvkm/subdev/clock/nvc0.c<br>
&gt; index c310572..dbf8517 100644<br>
&gt; --- a/nvkm/subdev/clock/nvc0.c<br>
&gt; +++ b/nvkm/subdev/clock/nvc0.c<br>
&gt; @@ -437,7 +437,8 @@ nvc0_clock_ctor(struct nouveau_object *parent, str=
uct nouveau_object *engine,<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct nvc0_clock_priv *priv;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 int ret;<br>
&gt;<br>
&gt; - =C2=A0 =C2=A0 =C2=A0 ret =3D nouveau_clock_create(parent, engine, oc=
lass, nvc0_domain, &amp;priv);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 ret =3D nouveau_clock_create(parent, engine, oc=
lass, nvc0_domain, false,<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;priv);<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 *pobject =3D nv_object(priv);<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret)<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;<br=
>
&gt; diff --git a/nvkm/subdev/clock/nve0.c b/nvkm/subdev/clock/nve0.c<br>
&gt; index d3c37c9..860aa73 100644<br>
&gt; --- a/nvkm/subdev/clock/nve0.c<br>
&gt; +++ b/nvkm/subdev/clock/nve0.c<br>
&gt; @@ -473,7 +473,8 @@ nve0_clock_ctor(struct nouveau_object *parent, str=
uct nouveau_object *engine,<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct nve0_clock_priv *priv;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 int ret;<br>
&gt;<br>
&gt; - =C2=A0 =C2=A0 =C2=A0 ret =3D nouveau_clock_create(parent, engine, oc=
lass, nve0_domain, &amp;priv);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 ret =3D nouveau_clock_create(parent, engine, oc=
lass, nve0_domain, false,<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;priv);<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 *pobject =3D nv_object(priv);<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret)<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;<br=
>
&gt; --<br>
&gt; 1.8.5.5<br>
&gt;<br>
&gt; _______________________________________________<br>
&gt; Nouveau mailing list<br>
&gt; <a href=3D"mailto:Nouveau@lists.freedesktop.org">Nouveau@lists.freedes=
ktop.org</a><br>
&gt; <a href=3D"http://lists.freedesktop.org/mailman/listinfo/nouveau">http=
://lists.freedesktop.org/mailman/listinfo/nouveau</a><br>
</p>

--001a11c3b23a7c618904f98ff8f4--

--===============1057685838==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1057685838==--
