From: Karol Herbst <karolherbst-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] pmu/fuc: don't use movw directly anymore
Date: Wed, 1 Nov 2017 21:00:14 +0100
Message-ID: <CAEXux-YhN896YvLXqZLFmOiGwOFDZqz7fgRQyQW+YTLjLMbNNw@mail.gmail.com>
References: <20171101165131.7222-1-kherbst@redhat.com>
 <CAKb7UvhkvpVCmcjS2wq_H8az8JSNecvVVAtMZH9x71Hpu6Xezg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1187121010=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAKb7UvhkvpVCmcjS2wq_H8az8JSNecvVVAtMZH9x71Hpu6Xezg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

--===============1187121010==
Content-Type: multipart/alternative; boundary="001a11474b60e8e8a9055cf1516e"

--001a11474b60e8e8a9055cf1516e
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 1, 2017 at 6:14 PM, Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> wrote:

> On Wed, Nov 1, 2017 at 12:51 PM, Karol Herbst <kherbst-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> > fixes compilation issues with recent envytools, because movw was removed
> > from fuc5, because it doesn't exist there anymore. The current code is
> > most likely broken for fuc5 hardware as well and might have triggered all
> > kinds of random memory reclocking fails.
> >
> > Changes in fuc3 binaries are tue do opcode optimizations using shorter
> > opcodes when possible.
>
> Might I suggest the following wording for the commit:
>
> ---------------8<----------------
> Fixes failure to compile with recent envyas as a result of the 'movw'
> alias being removed for v5.
>
> A bit of history:
>
> v3 only has a 16-bit sign-extended immediate mov op. In order to set
> the high bits, there's a separate 'sethi' op. envyas validates that
> the value passed to mov(imm) is between -0x8000 and 0x7fff. In order
> to simplify macros that load both the low and high word, a 'movw'
> alias was added which takes an unsigned 16-bit immediate. However the
> actual hardware op still sign extends.
>
> v5 has a full 32-bit immediate mov op. The v3 16-bit immediate mov op
> is gone (loads 0 into the dst reg). However due to a bug in envyas,
> the movw alias still existed, and selected the no-longer-present v3
> 16-bit immediate mov op. As a result usage of movw on v5 is the same
> as mov with a 0x0 argument.
>
> The proper fix throughout is to only ever use the 'movw' alias in
> combination with 'sethi'. Anything else should get the sign-extended
> validation to ensure that the intended value ends up in the
> destination register.
>
> Changes in fuc3 binaries is the result of a different encoding being
> selected for a mov with an 8-bit value.
> ---------------8<----------------
>

yeah, that sounds perfect. Thanks!


>
> >
> > Signed-off-by: Karol Herbst <kherbst-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> > ---
> >  drm/nouveau/nvkm/subdev/pmu/fuc/gf100.fuc3.h |  746 +++++++++----------
> >  drm/nouveau/nvkm/subdev/pmu/fuc/gk208.fuc5.h |  802
> ++++++++++----------
> >  drm/nouveau/nvkm/subdev/pmu/fuc/gt215.fuc3.h | 1006
> +++++++++++++-------------
> >  drm/nouveau/nvkm/subdev/pmu/fuc/memx.fuc     |   30 +-
> >  4 files changed, 1292 insertions(+), 1292 deletions(-)
> >
>
> [...]
>
> > diff --git a/drm/nouveau/nvkm/subdev/pmu/fuc/memx.fuc
> b/drm/nouveau/nvkm/subdev/pmu/fuc/memx.fuc
> > index ec03f9a4..1663bf94 100644
> > --- a/drm/nouveau/nvkm/subdev/pmu/fuc/memx.fuc
> > +++ b/drm/nouveau/nvkm/subdev/pmu/fuc/memx.fuc
> > @@ -82,15 +82,15 @@ memx_train_tail:
> >  // $r0  - zero
> >  memx_func_enter:
> >  #if NVKM_PPWR_CHIPSET == GT215
> > -       movw $r8 0x1610
> > +       mov $r8 0x1610
> >         nv_rd32($r7, $r8)
> >         imm32($r6, 0xfffffffc)
> >         and $r7 $r6
> > -       movw $r6 0x2
> > +       mov $r6 0x2
> >         or $r7 $r6
> >         nv_wr32($r8, $r7)
> >  #else
> > -       movw $r6 0x001620
> > +       mov $r6 0x001620
> >         imm32($r7, ~0x00000aa2);
> >         nv_rd32($r8, $r6)
> >         and $r8 $r7
> > @@ -101,7 +101,7 @@ memx_func_enter:
> >         and $r8 $r7
> >         nv_wr32($r6, $r8)
> >
> > -       movw $r6 0x0026f0
> > +       mov $r6 0x0026f0
> >         nv_rd32($r8, $r6)
> >         and $r8 $r7
> >         nv_wr32($r6, $r8)
> > @@ -136,19 +136,19 @@ memx_func_leave:
> >                 bra nz #memx_func_leave_wait
> >
> >  #if NVKM_PPWR_CHIPSET == GT215
> > -       movw $r8 0x1610
> > +       mov $r8 0x1610
> >         nv_rd32($r7, $r8)
> >         imm32($r6, 0xffffffcc)
> >         and $r7 $r6
> >         nv_wr32($r8, $r7)
> >  #else
> > -       movw $r6 0x0026f0
> > +       mov $r6 0x0026f0
> >         imm32($r7, 0x00000001)
> >         nv_rd32($r8, $r6)
> >         or $r8 $r7
> >         nv_wr32($r6, $r8)
> >
> > -       movw $r6 0x001620
> > +       mov $r6 0x001620
> >         nv_rd32($r8, $r6)
> >         or $r8 $r7
> >         nv_wr32($r6, $r8)
> > @@ -177,11 +177,11 @@ memx_func_wait_vblank:
> >         bra #memx_func_wait_vblank_fini
> >
> >         memx_func_wait_vblank_head1:
> > -       movw $r7 0x20
> > +       mov $r7 0x20
> >         bra #memx_func_wait_vblank_0
> >
> >         memx_func_wait_vblank_head0:
> > -       movw $r7 0x8
> > +       mov $r7 0x8
> >
> >         memx_func_wait_vblank_0:
> >                 nv_iord($r6, NV_PPWR_INPUT)
> > @@ -273,13 +273,13 @@ memx_func_train:
> >  // $r5 - outer loop counter
> >  // $r6 - inner loop counter
> >  // $r7 - entry counter (#memx_train_head + $r7)
> > -       movw $r5 0x3
> > -       movw $r7 0x0
> > +       mov $r5 0x3
> > +       mov $r7 0x0
> >
> >  // Read random memory to wake up... things
> >         imm32($r9, 0x700000)
> >         nv_rd32($r8,$r9)
> > -       movw $r14 0x2710
> > +       mov $r14 0x2710
> >         call(nsec)
> >
> >         memx_func_train_loop_outer:
> > @@ -289,9 +289,9 @@ memx_func_train:
> >                 nv_wr32($r9, $r8)
> >                 push $r5
> >
> > -               movw $r6 0x0
> > +               mov $r6 0x0
> >                 memx_func_train_loop_inner:
> > -                       movw $r8 0x1111
> > +                       mov $r8 0x1111
> >                         mulu $r9 $r6 $r8
> >                         shl b32 $r8 $r9 0x10
> >                         or $r8 $r9
> > @@ -315,7 +315,7 @@ memx_func_train:
> >
> >                         // $r5 - inner inner loop counter
> >                         // $r9 - result
> > -                       movw $r5 0
> > +                       mov $r5 0
> >                         imm32($r9, 0x8300ffff)
> >                         memx_func_train_loop_4x:
> >                                 imm32($r10, 0x100080)
> > --
> > 2.14.2
> >
> > _______________________________________________
> > Nouveau mailing list
> > Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> > https://lists.freedesktop.org/mailman/listinfo/nouveau
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
>

--001a11474b60e8e8a9055cf1516e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Wed, Nov 1, 2017 at 6:14 PM, Ilia Mirkin <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org" target=3D"_blank">imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Wed, Nov 1, 2017 =
at 12:51 PM, Karol Herbst &lt;<a href=3D"mailto:kherbst-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org">kherbst=
@redhat.com</a>&gt; wrote:<br>
&gt; fixes compilation issues with recent envytools, because movw was remov=
ed<br>
&gt; from fuc5, because it doesn&#39;t exist there anymore. The current cod=
e is<br>
&gt; most likely broken for fuc5 hardware as well and might have triggered =
all<br>
&gt; kinds of random memory reclocking fails.<br>
&gt;<br>
&gt; Changes in fuc3 binaries are tue do opcode optimizations using shorter=
<br>
&gt; opcodes when possible.<br>
<br>
Might I suggest the following wording for the commit:<br>
<br>
---------------8&lt;-------------<wbr>---<br>
Fixes failure to compile with recent envyas as a result of the &#39;movw&#3=
9;<br>
alias being removed for v5.<br>
<br>
A bit of history:<br>
<br>
v3 only has a 16-bit sign-extended immediate mov op. In order to set<br>
the high bits, there&#39;s a separate &#39;sethi&#39; op. envyas validates =
that<br>
the value passed to mov(imm) is between -0x8000 and 0x7fff. In order<br>
to simplify macros that load both the low and high word, a &#39;movw&#39;<b=
r>
alias was added which takes an unsigned 16-bit immediate. However the<br>
actual hardware op still sign extends.<br>
<br>
v5 has a full 32-bit immediate mov op. The v3 16-bit immediate mov op<br>
is gone (loads 0 into the dst reg). However due to a bug in envyas,<br>
the movw alias still existed, and selected the no-longer-present v3<br>
16-bit immediate mov op. As a result usage of movw on v5 is the same<br>
as mov with a 0x0 argument.<br>
<br>
The proper fix throughout is to only ever use the &#39;movw&#39; alias in<b=
r>
combination with &#39;sethi&#39;. Anything else should get the sign-extende=
d<br>
validation to ensure that the intended value ends up in the<br>
destination register.<br>
<br>
Changes in fuc3 binaries is the result of a different encoding being<br>
selected for a mov with an 8-bit value.<br>
---------------8&lt;-------------<wbr>---<br></blockquote><div><br></div><d=
iv>yeah, that sounds perfect. Thanks!</div><div>=C2=A0</div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pa=
dding-left:1ex">
<br>
&gt;<br>
&gt; Signed-off-by: Karol Herbst &lt;<a href=3D"mailto:kherbst-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org">=
kherbst-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 drm/nouveau/nvkm/subdev/pmu/<wbr>fuc/gf100.fuc3.h |=C2=A0 746 ++=
+++++++----------<br>
&gt;=C2=A0 drm/nouveau/nvkm/subdev/pmu/<wbr>fuc/gk208.fuc5.h |=C2=A0 802 ++=
++++++++----------<br>
&gt;=C2=A0 drm/nouveau/nvkm/subdev/pmu/<wbr>fuc/gt215.fuc3.h | 1006 +++++++=
++++++-------------<br>
&gt;=C2=A0 drm/nouveau/nvkm/subdev/pmu/<wbr>fuc/memx.fuc=C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A030 +-<br>
&gt;=C2=A0 4 files changed, 1292 insertions(+), 1292 deletions(-)<br>
&gt;<br>
<br>
[...]<br>
<br>
&gt; diff --git a/drm/nouveau/nvkm/subdev/pmu/<wbr>fuc/memx.fuc b/drm/nouve=
au/nvkm/subdev/pmu/<wbr>fuc/memx.fuc<br>
&gt; index ec03f9a4..1663bf94 100644<br>
&gt; --- a/drm/nouveau/nvkm/subdev/pmu/<wbr>fuc/memx.fuc<br>
&gt; +++ b/drm/nouveau/nvkm/subdev/pmu/<wbr>fuc/memx.fuc<br>
&gt; @@ -82,15 +82,15 @@ memx_train_tail:<br>
&gt;=C2=A0 // $r0=C2=A0 - zero<br>
&gt;=C2=A0 memx_func_enter:<br>
&gt;=C2=A0 #if NVKM_PPWR_CHIPSET =3D=3D GT215<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0movw $r8 0x1610<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0mov $r8 0x1610<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nv_rd32($r7, $r8)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0imm32($r6, 0xfffffffc)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0and $r7 $r6<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0movw $r6 0x2<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0mov $r6 0x2<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0or $r7 $r6<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nv_wr32($r8, $r7)<br>
&gt;=C2=A0 #else<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0movw $r6 0x001620<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0mov $r6 0x001620<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0imm32($r7, ~0x00000aa2);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nv_rd32($r8, $r6)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0and $r8 $r7<br>
&gt; @@ -101,7 +101,7 @@ memx_func_enter:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0and $r8 $r7<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nv_wr32($r6, $r8)<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0movw $r6 0x0026f0<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0mov $r6 0x0026f0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nv_rd32($r8, $r6)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0and $r8 $r7<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nv_wr32($r6, $r8)<br>
&gt; @@ -136,19 +136,19 @@ memx_func_leave:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bra nz #m=
emx_func_leave_wait<br>
&gt;<br>
&gt;=C2=A0 #if NVKM_PPWR_CHIPSET =3D=3D GT215<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0movw $r8 0x1610<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0mov $r8 0x1610<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nv_rd32($r7, $r8)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0imm32($r6, 0xffffffcc)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0and $r7 $r6<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nv_wr32($r8, $r7)<br>
&gt;=C2=A0 #else<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0movw $r6 0x0026f0<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0mov $r6 0x0026f0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0imm32($r7, 0x00000001)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nv_rd32($r8, $r6)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0or $r8 $r7<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nv_wr32($r6, $r8)<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0movw $r6 0x001620<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0mov $r6 0x001620<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nv_rd32($r8, $r6)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0or $r8 $r7<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nv_wr32($r6, $r8)<br>
&gt; @@ -177,11 +177,11 @@ memx_func_wait_vblank:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bra #memx_func_wait_vblank_fini<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memx_func_wait_vblank_head1:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0movw $r7 0x20<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0mov $r7 0x20<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bra #memx_func_wait_vblank_0<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memx_func_wait_vblank_head0:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0movw $r7 0x8<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0mov $r7 0x8<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memx_func_wait_vblank_0:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nv_iord($=
r6, NV_PPWR_INPUT)<br>
&gt; @@ -273,13 +273,13 @@ memx_func_train:<br>
&gt;=C2=A0 // $r5 - outer loop counter<br>
&gt;=C2=A0 // $r6 - inner loop counter<br>
&gt;=C2=A0 // $r7 - entry counter (#memx_train_head + $r7)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0movw $r5 0x3<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0movw $r7 0x0<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0mov $r5 0x3<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0mov $r7 0x0<br>
&gt;<br>
&gt;=C2=A0 // Read random memory to wake up... things<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0imm32($r9, 0x700000)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nv_rd32($r8,$r9)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0movw $r14 0x2710<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0mov $r14 0x2710<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0call(nsec)<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memx_func_train_loop_outer:<br>
&gt; @@ -289,9 +289,9 @@ memx_func_train:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nv_wr32($=
r9, $r8)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0push $r5<=
br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0movw $r6 0x0<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mov $r6 0x0<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memx_func=
_train_loop_inner:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0movw $r8 0x1111<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0mov $r8 0x1111<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0mulu $r9 $r6 $r8<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0shl b32 $r8 $r9 0x10<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0or $r8 $r9<br>
&gt; @@ -315,7 +315,7 @@ memx_func_train:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0// $r5 - inner inner loop counter<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0// $r9 - result<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0movw $r5 0<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0mov $r5 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0imm32($r9, 0x8300ffff)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0memx_func_train_loop_4x:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0imm32($r10, 0x100080)<br>
&gt; --<br>
&gt; 2.14.2<br>
&gt;<br>
&gt; ______________________________<wbr>_________________<br>
&gt; Nouveau mailing list<br>
&gt; <a href=3D"mailto:Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org">Nouveau-PD4FTy7X32mqWrfYKbYh0A@public.gmane.org=
ktop.org</a><br>
&gt; <a href=3D"https://lists.freedesktop.org/mailman/listinfo/nouveau" rel=
=3D"noreferrer" target=3D"_blank">https://lists.freedesktop.org/<wbr>mailma=
n/listinfo/nouveau</a><br>
______________________________<wbr>_________________<br>
Nouveau mailing list<br>
<a href=3D"mailto:Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org">Nouveau-PD4FTy7X32lNgt0PjOBp9/rsn8yoX9R0@public.gmane.org=
org</a><br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/nouveau" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.freedesktop.org/<wbr>mailman/lis=
tinfo/nouveau</a><br>
</blockquote></div><br></div></div>

--001a11474b60e8e8a9055cf1516e--

--===============1187121010==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1187121010==--
