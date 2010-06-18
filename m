From: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: nvfx
Date: Fri, 18 Jun 2010 18:43:27 +0200
Message-ID: <AANLkTilelUM7VKRRLs9Ep4Ewn00mJvKoKqeWkyZt-0h2@mail.gmail.com>
References: <AANLkTinqWb6nC0fcFU_kWmDs4fmGTxudmuN-GSmQjFlu@mail.gmail.com>
	<AANLkTimX_IgQ0eZvNYrVE_0lyiDv6vqQ7D7WUqyBZIlp@mail.gmail.com>
	<20100618180509.23f24f1b.mandin.patrice@orange.fr>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2023346522=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20100618180509.23f24f1b.mandin.patrice-1tsiiZ//OF9QFI55V6+gNQ@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Mime-version: 1.0
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Patrice Mandin <mandin.patrice-1tsiiZ//OF9QFI55V6+gNQ@public.gmane.org>
Cc: nouveau <Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

--===============2023346522==
Content-Type: multipart/alternative; boundary=0016364c7af352749d048950a937

--0016364c7af352749d048950a937
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 18, 2010 at 6:05 PM, Patrice Mandin <mandin.patrice-1tsiiZ//OF9QFI55V6+gNQ@public.gmane.org>w=
rote:

> Le Thu, 17 Jun 2010 03:35:19 +0200
> Marek Ol=C5=A1=C3=A1k <maraeo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> a =C3=A9crit:
>
> > On Fri, Jun 11, 2010 at 3:37 PM, Xavier Chantry <
> chantry.xavier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>wrote:
> >
> > > Hi Marek
> > >
> > > Thanks a lot for your rebasing work.
> > > Here is my report :
> > >
> > > - all my games that broke with temporaries patch (they were either
> > > completely black or lot of black screen flash every frame) behave
> > > badly, but in different ways :
> > > * etracer is very slow and often crash in ttm code [1] (I think this
> > > is an old bug that just resurrected, no idea why)
> > > * foobillard is very slow and still flash a bit
> > > * strangely, neverball seems to work, I get similar results than with
> > > old nvfx-next-6b branch with temporaries reverted. no black flash
> > > while playing.
> > > * glest segfault [2]
> > >
> > > I also compared with piglit the old nvfx branch with the new merged o=
ne
> :
> > > 114/174 vs 113/174
> > > That looks quite good with 3 new pass, but 4 new fail :
> > > * fbo-copypix
> > > Returncode was -6
> > > * glean pbo
> > >
> ../../../../src/gallium/auxiliary/util/u_inlines.h:77:pipe_reference:
> > > Assertion `pipe_is_referenced(reference)\\\' failed.
> > > * texCombine4:  FAIL rgba8, db, z24, s8, win+pmap, id 33
> > > * fp-long-alu
> > >
> >
> > Hi Xavier,
> >
> > Sorry for the late reply.
> >
> > The assertion in pipe_reference can be fixed quite easily I think. Ther=
e
> is
> > pipe_*_reference missing somewhere.
> >
> > Concerning fp-long-alu, there are new CAPs for shader limits which shou=
ld
> be
> > filled out but I don't know what values to put there. If the two get
> fixed,
> > it will hopefully be just 2 new failures along with 3 that pass.
> >
> >
> > > There is just fp-long-alu that is for sure a regression caused by new
> > > master code (some gallium changes). I don't know about the 3 others.
> > >
> > > It might be worth to re-test everything on your new branch with this
> > > patch reverted :
> > > nvfx: rewrite render temporaries code, also affecting 2D and resource
> code
> > >
> >
> > Here is the tree with the commit reverted:
> >
> > git://anongit.freedesktop.org/~mareko/mesa<http://anongit.freedesktop.o=
rg/%7Emareko/mesa>nvfx-next-6b-notemps
> >
> > It is compile-tested so if it does not work, there is nothing I can do
> about
> > it.
> >
> > -Marek
>
> I just tested the new tree nvfx-next-6b-notemps, I think we should go
> some commits before, because Luca removed the check in fbo setting
> between difference in bits between colour and depth/stencil buffer, and
> nv30 hw does not support that (they must be equal) and doing that
> simply hang the gpu.
>
> Commit 4787059263755fb92b2bb09ac71658d9b4cc9368 'nvfx: new 2D: add
> support for render temporaries' removed this check and fbo tests
> trigger the bug. Maybe Luca was planning to use temporaries to avoid
> this check, but unfortunately we do not know if he finished it or not.
>

I do not want to guess here. I would like to hear something from Luca befor=
e
doing anything else with his code.

-Marek


> --
> Patrice Mandin
> WWW: http://pmandin.atari.org/
> Programmeur Linux, Atari
> Sp=C3=A9cialit=C3=A9: D=C3=A9veloppement, jeux
>
> "who writes the code, decides"
>
>
>

--0016364c7af352749d048950a937
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Fri, Jun 18, 2010 at 6:05 PM, Patrice Mandin =
<span dir=3D"ltr">&lt;<a href=3D"mailto:mandin.patrice-1tsiiZ//OF9QFI55V6+gNQ@public.gmane.org">mandin.pa=
trice-1tsiiZ//OF9QFI55V6+gNQ@public.gmane.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" =
style=3D"margin: 0pt 0pt 0pt 0.8ex; border-left: 1px solid rgb(204, 204, 20=
4); padding-left: 1ex;">

Le Thu, 17 Jun 2010 03:35:19 +0200<br>
Marek Ol=C5=A1=C3=A1k &lt;<a href=3D"mailto:maraeo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org">maraeo@gmail.=
com</a>&gt; a =C3=A9crit:<br>
<div><div></div><div class=3D"h5"><br>
&gt; On Fri, Jun 11, 2010 at 3:37 PM, Xavier Chantry &lt;<a href=3D"mailto:=
chantry.xavier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org">chantry.xavier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>&gt;wrote:<br>
&gt;<br>
&gt; &gt; Hi Marek<br>
&gt; &gt;<br>
&gt; &gt; Thanks a lot for your rebasing work.<br>
&gt; &gt; Here is my report :<br>
&gt; &gt;<br>
&gt; &gt; - all my games that broke with temporaries patch (they were eithe=
r<br>
&gt; &gt; completely black or lot of black screen flash every frame) behave=
<br>
&gt; &gt; badly, but in different ways :<br>
&gt; &gt; * etracer is very slow and often crash in ttm code [1] (I think t=
his<br>
&gt; &gt; is an old bug that just resurrected, no idea why)<br>
&gt; &gt; * foobillard is very slow and still flash a bit<br>
&gt; &gt; * strangely, neverball seems to work, I get similar results than =
with<br>
&gt; &gt; old nvfx-next-6b branch with temporaries reverted. no black flash=
<br>
&gt; &gt; while playing.<br>
&gt; &gt; * glest segfault [2]<br>
&gt; &gt;<br>
&gt; &gt; I also compared with piglit the old nvfx branch with the new merg=
ed one :<br>
&gt; &gt; 114/174 vs 113/174<br>
&gt; &gt; That looks quite good with 3 new pass, but 4 new fail :<br>
&gt; &gt; * fbo-copypix<br>
&gt; &gt; Returncode was -6<br>
&gt; &gt; * glean pbo<br>
&gt; &gt; =C2=A0 =C2=A0 ../../../../src/gallium/auxiliary/util/u_inlines.h:=
77:pipe_reference:<br>
&gt; &gt; Assertion `pipe_is_referenced(reference)\\\&#39; failed.<br>
&gt; &gt; * texCombine4: =C2=A0FAIL rgba8, db, z24, s8, win+pmap, id 33<br>
&gt; &gt; * fp-long-alu<br>
&gt; &gt;<br>
&gt;<br>
&gt; Hi Xavier,<br>
&gt;<br>
&gt; Sorry for the late reply.<br>
&gt;<br>
&gt; The assertion in pipe_reference can be fixed quite easily I think. The=
re is<br>
&gt; pipe_*_reference missing somewhere.<br>
&gt;<br>
&gt; Concerning fp-long-alu, there are new CAPs for shader limits which sho=
uld be<br>
&gt; filled out but I don&#39;t know what values to put there. If the two g=
et fixed,<br>
&gt; it will hopefully be just 2 new failures along with 3 that pass.<br>
&gt;<br>
&gt;<br>
&gt; &gt; There is just fp-long-alu that is for sure a regression caused by=
 new<br>
&gt; &gt; master code (some gallium changes). I don&#39;t know about the 3 =
others.<br>
&gt; &gt;<br>
&gt; &gt; It might be worth to re-test everything on your new branch with t=
his<br>
&gt; &gt; patch reverted :<br>
&gt; &gt; nvfx: rewrite render temporaries code, also affecting 2D and reso=
urce code<br>
&gt; &gt;<br>
&gt;<br>
&gt; Here is the tree with the commit reverted:<br>
&gt;<br>
&gt; git://<a href=3D"http://anongit.freedesktop.org/%7Emareko/mesa" target=
=3D"_blank">anongit.freedesktop.org/~mareko/mesa</a> nvfx-next-6b-notemps<b=
r>
&gt;<br>
&gt; It is compile-tested so if it does not work, there is nothing I can do=
 about<br>
&gt; it.<br>
&gt;<br>
&gt; -Marek<br>
<br>
</div></div>I just tested the new tree nvfx-next-6b-notemps, I think we sho=
uld go<br>
some commits before, because Luca removed the check in fbo setting<br>
between difference in bits between colour and depth/stencil buffer, and<br>
nv30 hw does not support that (they must be equal) and doing that<br>
simply hang the gpu.<br>
<br>
Commit 4787059263755fb92b2bb09ac71658d9b4cc9368 &#39;nvfx: new 2D: add<br>
support for render temporaries&#39; removed this check and fbo tests<br>
trigger the bug. Maybe Luca was planning to use temporaries to avoid<br>
this check, but unfortunately we do not know if he finished it or not.<br><=
/blockquote><div><br>I do not want to guess here. I would like to hear some=
thing from Luca before doing anything else with his code.<br><br>-Marek<br>

<br></div><blockquote class=3D"gmail_quote" style=3D"margin: 0pt 0pt 0pt 0.=
8ex; border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">
<font color=3D"#888888"><br>
--<br>
Patrice Mandin<br>
WWW: <a href=3D"http://pmandin.atari.org/" target=3D"_blank">http://pmandin=
.atari.org/</a><br>
Programmeur Linux, Atari<br>
Sp=C3=A9cialit=C3=A9: D=C3=A9veloppement, jeux<br>
<br>
&quot;who writes the code, decides&quot;<br>
<br>
<br>
</font></blockquote></div>

--0016364c7af352749d048950a937--

--===============2023346522==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2023346522==--
