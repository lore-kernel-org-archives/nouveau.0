From: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: nvfx
Date: Thu, 17 Jun 2010 03:35:19 +0200
Message-ID: <AANLkTimX_IgQ0eZvNYrVE_0lyiDv6vqQ7D7WUqyBZIlp@mail.gmail.com>
References: <AANLkTinqWb6nC0fcFU_kWmDs4fmGTxudmuN-GSmQjFlu@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1726865821=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <AANLkTinqWb6nC0fcFU_kWmDs4fmGTxudmuN-GSmQjFlu-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
To: Xavier Chantry <chantry.xavier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau <Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

--===============1726865821==
Content-Type: multipart/alternative; boundary=0016367d674eb1c3cc04892fdbd9

--0016367d674eb1c3cc04892fdbd9
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Jun 11, 2010 at 3:37 PM, Xavier Chantry <chantry.xavier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>wrote:

> Hi Marek
>
> Thanks a lot for your rebasing work.
> Here is my report :
>
> - all my games that broke with temporaries patch (they were either
> completely black or lot of black screen flash every frame) behave
> badly, but in different ways :
> * etracer is very slow and often crash in ttm code [1] (I think this
> is an old bug that just resurrected, no idea why)
> * foobillard is very slow and still flash a bit
> * strangely, neverball seems to work, I get similar results than with
> old nvfx-next-6b branch with temporaries reverted. no black flash
> while playing.
> * glest segfault [2]
>
> I also compared with piglit the old nvfx branch with the new merged one :
> 114/174 vs 113/174
> That looks quite good with 3 new pass, but 4 new fail :
> * fbo-copypix
> Returncode was -6
> * glean pbo
>     ../../../../src/gallium/auxiliary/util/u_inlines.h:77:pipe_reference:
> Assertion `pipe_is_referenced(reference)\\\' failed.
> * texCombine4:  FAIL rgba8, db, z24, s8, win+pmap, id 33
> * fp-long-alu
>

Hi Xavier,

Sorry for the late reply.

The assertion in pipe_reference can be fixed quite easily I think. There is
pipe_*_reference missing somewhere.

Concerning fp-long-alu, there are new CAPs for shader limits which should be
filled out but I don't know what values to put there. If the two get fixed,
it will hopefully be just 2 new failures along with 3 that pass.


> There is just fp-long-alu that is for sure a regression caused by new
> master code (some gallium changes). I don't know about the 3 others.
>
> It might be worth to re-test everything on your new branch with this
> patch reverted :
> nvfx: rewrite render temporaries code, also affecting 2D and resource code
>

Here is the tree with the commit reverted:

git://anongit.freedesktop.org/~mareko/mesa nvfx-next-6b-notemps

It is compile-tested so if it does not work, there is nothing I can do about
it.

-Marek

--0016367d674eb1c3cc04892fdbd9
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Fri, Jun 11, 2010 at 3:37 PM, Xavier Chantry =
<span dir=3D"ltr">&lt;<a href=3D"mailto:chantry.xavier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" target=3D=
"_blank">chantry.xavier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>&gt;</span> wrote:<br><blockquote clas=
s=3D"gmail_quote" style=3D"margin: 0pt 0pt 0pt 0.8ex; border-left: 1px soli=
d rgb(204, 204, 204); padding-left: 1ex;">



Hi Marek<br>
<br>
Thanks a lot for your rebasing work.<br>
Here is my report :<br>
<br>
- all my games that broke with temporaries patch (they were either<br>
completely black or lot of black screen flash every frame) behave<br>
badly, but in different ways :<br>
* etracer is very slow and often crash in ttm code [1] (I think this<br>
is an old bug that just resurrected, no idea why)<br>
* foobillard is very slow and still flash a bit<br>
* strangely, neverball seems to work, I get similar results than with<br>
old nvfx-next-6b branch with temporaries reverted. no black flash<br>
while playing.<br>
* glest segfault [2]<br>
<br>
I also compared with piglit the old nvfx branch with the new merged one :<b=
r>
114/174 vs 113/174<br>
That looks quite good with 3 new pass, but 4 new fail :<br>
* fbo-copypix<br>
Returncode was -6<br>
* glean pbo<br>
 =A0 =A0 ../../../../src/gallium/auxiliary/util/u_inlines.h:77:pipe_referen=
ce:<br>
Assertion `pipe_is_referenced(reference)\\\&#39; failed.<br>
* texCombine4: =A0FAIL rgba8, db, z24, s8, win+pmap, id 33<br>
* fp-long-alu<br></blockquote><div><br>Hi Xavier,<br><br>Sorry for the late=
 reply.<br><br>The assertion in pipe_reference can be fixed quite easily I =
think. There is pipe_*_reference missing somewhere.<br><br>Concerning fp-lo=
ng-alu, there are new CAPs for shader limits which should be filled out but=
 I don&#39;t know what values to put there. If the two get fixed, it will h=
opefully be just 2 new failures along with 3 that pass.<br>



<br></div><blockquote class=3D"gmail_quote" style=3D"margin: 0pt 0pt 0pt 0.=
8ex; border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">
<br>
There is just fp-long-alu that is for sure a regression caused by new<br>
master code (some gallium changes). I don&#39;t know about the 3 others.<br=
>
<br>
It might be worth to re-test everything on your new branch with this<br>
patch reverted :<br>
<div>nvfx: rewrite render temporaries code, also affecting 2D and resource =
code<br></div></blockquote></div><br>Here is the tree with the commit rever=
ted:<br><br>git://<a href=3D"http://anongit.freedesktop.org/~mareko/mesa">a=
nongit.freedesktop.org/~mareko/mesa</a> nvfx-next-6b-notemps<br>

<br>It is compile-tested so if it does not work, there is nothing I can do =
about it.<br><br>-Marek<br>


--0016367d674eb1c3cc04892fdbd9--

--===============1726865821==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1726865821==--
