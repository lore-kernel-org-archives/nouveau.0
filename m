From: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: nvfx
Date: Sat, 24 Jul 2010 01:52:57 +0200
Message-ID: <AANLkTinq3k-+XxDD1_X_5dNetHaXsj9g2Ji9ez+dqMjD@mail.gmail.com>
References: <AANLkTinqWb6nC0fcFU_kWmDs4fmGTxudmuN-GSmQjFlu@mail.gmail.com>
	<AANLkTimX_IgQ0eZvNYrVE_0lyiDv6vqQ7D7WUqyBZIlp@mail.gmail.com>
	<20100618180509.23f24f1b.mandin.patrice@orange.fr>
	<AANLkTilelUM7VKRRLs9Ep4Ewn00mJvKoKqeWkyZt-0h2@mail.gmail.com>
	<20100723190133.9e3e7320.mandin.patrice@orange.fr>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1395640096=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20100723190133.9e3e7320.mandin.patrice-1tsiiZ//OF9QFI55V6+gNQ@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Patrice Mandin <mandin.patrice-1tsiiZ//OF9QFI55V6+gNQ@public.gmane.org>
Cc: nouveau <Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

--===============1395640096==
Content-Type: multipart/alternative; boundary=002215974c5abbb751048c16bd21

--002215974c5abbb751048c16bd21
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 23, 2010 at 7:01 PM, Patrice Mandin <mandin.patrice-1tsiiZ//OF9QFI55V6+gNQ@public.gmane.org>w=
rote:

> Le Fri, 18 Jun 2010 18:43:27 +0200
> Marek Ol=C5=A1=C3=A1k <maraeo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> a =C3=A9crit:
>
> > On Fri, Jun 18, 2010 at 6:05 PM, Patrice Mandin <
> mandin.patrice-1tsiiZ//OF9QFI55V6+gNQ@public.gmane.org>wrote:
> >
> > > Le Thu, 17 Jun 2010 03:35:19 +0200
> > > Marek Ol=C5=A1=C3=A1k <maraeo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> a =C3=A9crit:
> > >
> > > > On Fri, Jun 11, 2010 at 3:37 PM, Xavier Chantry <
> > > chantry.xavier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>wrote:
> > > >
> > > > > Hi Marek
> > > > >
> > > > > Thanks a lot for your rebasing work.
> > > > > Here is my report :
> > > > >
> > > > > - all my games that broke with temporaries patch (they were eithe=
r
> > > > > completely black or lot of black screen flash every frame) behave
> > > > > badly, but in different ways :
> > > > > * etracer is very slow and often crash in ttm code [1] (I think
> this
> > > > > is an old bug that just resurrected, no idea why)
> > > > > * foobillard is very slow and still flash a bit
> > > > > * strangely, neverball seems to work, I get similar results than
> with
> > > > > old nvfx-next-6b branch with temporaries reverted. no black flash
> > > > > while playing.
> > > > > * glest segfault [2]
> > > > >
> > > > > I also compared with piglit the old nvfx branch with the new merg=
ed
> one
> > > :
> > > > > 114/174 vs 113/174
> > > > > That looks quite good with 3 new pass, but 4 new fail :
> > > > > * fbo-copypix
> > > > > Returncode was -6
> > > > > * glean pbo
> > > > >
> > > ../../../../src/gallium/auxiliary/util/u_inlines.h:77:pipe_reference:
> > > > > Assertion `pipe_is_referenced(reference)\\\' failed.
> > > > > * texCombine4:  FAIL rgba8, db, z24, s8, win+pmap, id 33
> > > > > * fp-long-alu
> > > > >
> > > >
> > > > Hi Xavier,
> > > >
> > > > Sorry for the late reply.
> > > >
> > > > The assertion in pipe_reference can be fixed quite easily I think.
> There
> > > is
> > > > pipe_*_reference missing somewhere.
> > > >
> > > > Concerning fp-long-alu, there are new CAPs for shader limits which
> should
> > > be
> > > > filled out but I don't know what values to put there. If the two ge=
t
> > > fixed,
> > > > it will hopefully be just 2 new failures along with 3 that pass.
> > > >
> > > >
> > > > > There is just fp-long-alu that is for sure a regression caused by
> new
> > > > > master code (some gallium changes). I don't know about the 3
> others.
> > > > >
> > > > > It might be worth to re-test everything on your new branch with
> this
> > > > > patch reverted :
> > > > > nvfx: rewrite render temporaries code, also affecting 2D and
> resource
> > > code
> > > > >
> > > >
> > > > Here is the tree with the commit reverted:
> > > >
> > > > git://anongit.freedesktop.org/~mareko/mesa<http://anongit.freedeskt=
op.org/%7Emareko/mesa>
> <http://anongit.freedesktop.org/%7Emareko/mesa>nvfx-next-6b-notemps
> > > >
> > > > It is compile-tested so if it does not work, there is nothing I can
> do
> > > about
> > > > it.
> > > >
> > > > -Marek
> > >
> > > I just tested the new tree nvfx-next-6b-notemps, I think we should go
> > > some commits before, because Luca removed the check in fbo setting
> > > between difference in bits between colour and depth/stencil buffer, a=
nd
> > > nv30 hw does not support that (they must be equal) and doing that
> > > simply hang the gpu.
> > >
> > > Commit 4787059263755fb92b2bb09ac71658d9b4cc9368 'nvfx: new 2D: add
> > > support for render temporaries' removed this check and fbo tests
> > > trigger the bug. Maybe Luca was planning to use temporaries to avoid
> > > this check, but unfortunately we do not know if he finished it or not=
.
> >
> > I do not want to guess here. I would like to hear something from Luca
> before
> > doing anything else with his code.
>
> It has been 3 months since latest Luca's sign, and I'm afraid it will
> be a while before it changes :-(.
>
> Marek, if you are still interested in merging stuff from nvfx-next-6b,
> I would like to propose up to commit
> 9a4c66b0d1963c4d90fccac41e7aa48105835857 included (as I said before,
> the following ones bring back nasty regression regarding fbo stuff,
> hanging the gpu hard).
>

9a4c66b0d1963c4d90fccac41e7aa48105835857 doesn't compile, so I went one
commit back.

It's here for testing:
git://anongit.freedesktop.org/~mareko/mesa nvfx-new

Please let me know if it works.

-Marek

--002215974c5abbb751048c16bd21
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Fri, Jul 23, 2010 at 7:01 PM, Patrice Mandin =
<span dir=3D"ltr">&lt;<a href=3D"mailto:mandin.patrice-1tsiiZ//OF9QFI55V6+gNQ@public.gmane.org" target=3D=
"_blank">mandin.patrice-1tsiiZ//OF9QFI55V6+gNQ@public.gmane.org</a>&gt;</span> wrote:<br><blockquote clas=
s=3D"gmail_quote" style=3D"margin: 0pt 0pt 0pt 0.8ex; border-left: 1px soli=
d rgb(204, 204, 204); padding-left: 1ex;">


Le Fri, 18 Jun 2010 18:43:27 +0200<br>
<div><div></div><div>Marek Ol=C5=A1=C3=A1k &lt;<a href=3D"mailto:maraeo@gma=
il.com" target=3D"_blank">maraeo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>&gt; a =C3=A9crit:<br>
<br>
&gt; On Fri, Jun 18, 2010 at 6:05 PM, Patrice Mandin &lt;<a href=3D"mailto:=
mandin.patrice-1tsiiZ//OF9QFI55V6+gNQ@public.gmane.org" target=3D"_blank">mandin.patrice-1tsiiZ//OF9QFI55V6+gNQ@public.gmane.org</a>&gt=
;wrote:<br>
&gt;<br>
&gt; &gt; Le Thu, 17 Jun 2010 03:35:19 +0200<br>
&gt; &gt; Marek Ol=C5=A1=C3=A1k &lt;<a href=3D"mailto:maraeo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" tar=
get=3D"_blank">maraeo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>&gt; a =C3=A9crit:<br>
&gt; &gt;<br>
&gt; &gt; &gt; On Fri, Jun 11, 2010 at 3:37 PM, Xavier Chantry &lt;<br>
&gt; &gt; <a href=3D"mailto:chantry.xavier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" target=3D"_blank">cha=
ntry.xavier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>&gt;wrote:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Hi Marek<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Thanks a lot for your rebasing work.<br>
&gt; &gt; &gt; &gt; Here is my report :<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; - all my games that broke with temporaries patch (they =
were either<br>
&gt; &gt; &gt; &gt; completely black or lot of black screen flash every fra=
me) behave<br>
&gt; &gt; &gt; &gt; badly, but in different ways :<br>
&gt; &gt; &gt; &gt; * etracer is very slow and often crash in ttm code [1] =
(I think this<br>
&gt; &gt; &gt; &gt; is an old bug that just resurrected, no idea why)<br>
&gt; &gt; &gt; &gt; * foobillard is very slow and still flash a bit<br>
&gt; &gt; &gt; &gt; * strangely, neverball seems to work, I get similar res=
ults than with<br>
&gt; &gt; &gt; &gt; old nvfx-next-6b branch with temporaries reverted. no b=
lack flash<br>
&gt; &gt; &gt; &gt; while playing.<br>
&gt; &gt; &gt; &gt; * glest segfault [2]<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; I also compared with piglit the old nvfx branch with th=
e new merged one<br>
&gt; &gt; :<br>
&gt; &gt; &gt; &gt; 114/174 vs 113/174<br>
&gt; &gt; &gt; &gt; That looks quite good with 3 new pass, but 4 new fail :=
<br>
&gt; &gt; &gt; &gt; * fbo-copypix<br>
&gt; &gt; &gt; &gt; Returncode was -6<br>
&gt; &gt; &gt; &gt; * glean pbo<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; ../../../../src/gallium/auxiliary/util/u_inlines.h:77:pipe_refere=
nce:<br>
&gt; &gt; &gt; &gt; Assertion `pipe_is_referenced(reference)\\\&#39; failed=
.<br>
&gt; &gt; &gt; &gt; * texCombine4: =C2=A0FAIL rgba8, db, z24, s8, win+pmap,=
 id 33<br>
&gt; &gt; &gt; &gt; * fp-long-alu<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Hi Xavier,<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Sorry for the late reply.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; The assertion in pipe_reference can be fixed quite easily I =
think. There<br>
&gt; &gt; is<br>
&gt; &gt; &gt; pipe_*_reference missing somewhere.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Concerning fp-long-alu, there are new CAPs for shader limits=
 which should<br>
&gt; &gt; be<br>
&gt; &gt; &gt; filled out but I don&#39;t know what values to put there. If=
 the two get<br>
&gt; &gt; fixed,<br>
&gt; &gt; &gt; it will hopefully be just 2 new failures along with 3 that p=
ass.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; There is just fp-long-alu that is for sure a regression=
 caused by new<br>
&gt; &gt; &gt; &gt; master code (some gallium changes). I don&#39;t know ab=
out the 3 others.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; It might be worth to re-test everything on your new bra=
nch with this<br>
&gt; &gt; &gt; &gt; patch reverted :<br>
&gt; &gt; &gt; &gt; nvfx: rewrite render temporaries code, also affecting 2=
D and resource<br>
&gt; &gt; code<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Here is the tree with the commit reverted:<br>
&gt; &gt; &gt;<br>
</div></div>&gt; &gt; &gt; git://<a href=3D"http://anongit.freedesktop.org/=
%7Emareko/mesa" target=3D"_blank">anongit.freedesktop.org/~mareko/mesa</a>&=
lt;<a href=3D"http://anongit.freedesktop.org/%7Emareko/mesa" target=3D"_bla=
nk">http://anongit.freedesktop.org/%7Emareko/mesa</a>&gt;nvfx-next-6b-notem=
ps<br>



<div>&gt; &gt; &gt;<br>
&gt; &gt; &gt; It is compile-tested so if it does not work, there is nothin=
g I can do<br>
&gt; &gt; about<br>
&gt; &gt; &gt; it.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; -Marek<br>
&gt; &gt;<br>
&gt; &gt; I just tested the new tree nvfx-next-6b-notemps, I think we shoul=
d go<br>
&gt; &gt; some commits before, because Luca removed the check in fbo settin=
g<br>
&gt; &gt; between difference in bits between colour and depth/stencil buffe=
r, and<br>
&gt; &gt; nv30 hw does not support that (they must be equal) and doing that=
<br>
&gt; &gt; simply hang the gpu.<br>
&gt; &gt;<br>
&gt; &gt; Commit 4787059263755fb92b2bb09ac71658d9b4cc9368 &#39;nvfx: new 2D=
: add<br>
&gt; &gt; support for render temporaries&#39; removed this check and fbo te=
sts<br>
&gt; &gt; trigger the bug. Maybe Luca was planning to use temporaries to av=
oid<br>
&gt; &gt; this check, but unfortunately we do not know if he finished it or=
 not.<br>
&gt;<br>
&gt; I do not want to guess here. I would like to hear something from Luca =
before<br>
&gt; doing anything else with his code.<br>
<br>
</div>It has been 3 months since latest Luca&#39;s sign, and I&#39;m afraid=
 it will<br>
be a while before it changes :-(.<br>
<br>
Marek, if you are still interested in merging stuff from nvfx-next-6b,<br>
I would like to propose up to commit<br>
9a4c66b0d1963c4d90fccac41e7aa48105835857 included (as I said before,<br>
the following ones bring back nasty regression regarding fbo stuff,<br>
hanging the gpu hard).<br></blockquote><div><br>9a4c66b0d1963c4d90fccac41e7=
aa48105835857 doesn&#39;t compile, so I went one commit back.<br><br>It&#39=
;s here for testing:<br>git://<a href=3D"http://anongit.freedesktop.org/~ma=
reko/mesa">anongit.freedesktop.org/~mareko/mesa</a> nvfx-new<br>


<br>Please let me know if it works.<br><br>-Marek<br></div></div>

--002215974c5abbb751048c16bd21--

--===============1395640096==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1395640096==--
