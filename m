From: Eric Biggers <ebiggers3-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [REGRESSION] nouveau: Crash in
	gk104_fifo_intr_runlist()
Date: Tue, 11 Aug 2015 20:01:42 -0500
Message-ID: <CAPWJ_tKisH541xkEU6PV8GdxOOCvByh9FsmV2VtxjcqLwOtTXQ@mail.gmail.com>
References: <20150809170634.GA2712@zyxyz>
 <CAKb7Uviet+Bg_KBnaOHGm7b-0vppu6pLDkE-UcoaCcdZ7fEaUg@mail.gmail.com>
 <CAAVeFuLkJ9daa=G6EWA+jf4v_cfvBHgqF5hP4L-v139vOubNkA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1320164250=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAAVeFuLkJ9daa=G6EWA+jf4v_cfvBHgqF5hP4L-v139vOubNkA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

--===============1320164250==
Content-Type: multipart/alternative; boundary=001a113472520e2119051d12c397

--001a113472520e2119051d12c397
Content-Type: text/plain; charset=UTF-8

Hi,

I think I've done about 10 reboots with the commit reverted and I never
experienced the crash.  But with 4.2.0-rc6 I get the crash on about every
other reboot.

Probably relevant: the computer on which the crash occurs has two GPUs (one
Intel and one Nvidia).  The Intel one is actually being used, whereas I
presume the Nvidia one is being automatically disabled shortly after boot,
perhaps when the crash occurs...

Eric

On Mon, Aug 10, 2015 at 11:28 PM, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
wrote:

> Indeed, and I am actually surprised to see one here. I will
> double-check that patch.
>
> Eric, would you be able to give an estimate of the repro rate for this
> issue? More testing with and without the patch would be welcome, it'd
> be good to know whether it is actually the culprit or not.
>
> On Mon, Aug 10, 2015 at 2:28 AM, Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> wrote:
> > Alexandre, could you take a look? 0xbad* generally comes from bad mmio
> > reads.
> >
> > On Aug 9, 2015 1:08 PM, "Eric Biggers" <ebiggers3-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> >>
> >> Hi,
> >>
> >> I am testing Linux v4.2-rc5 and I am sporadically getting crashes
> shortly
> >> after
> >> startup in gk104_fifo_intr_runlist().  What I've found is that the
> 'mask'
> >> value
> >> read from offset 0x2a00 comes back as '0xbad0da00'.  This causes the
> >> 'engn'
> >> variable to be assigned the value 9, which is invalid; then wake_up() is
> >> called
> >> on an uninitialized waitqueue which causes the crash.
> >>
> >> Reverting commit 1addc12648521d ("drm/nouveau/fifo/gk104: kick channels
> >> when
> >> deactivating them") seemed to make the problem go away, although I can't
> >> be 100%
> >> sure because the problem is sporadic.
> >>
> >> Attached an example of the kernel log up to the crash.
> >>
> >> Eric
> >>
> >> _______________________________________________
> >> Nouveau mailing list
> >> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> >> http://lists.freedesktop.org/mailman/listinfo/nouveau
> >>
> >
>

--001a113472520e2119051d12c397
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div>Hi,<br><br></div>I think I&#39;ve done abou=
t 10 reboots with the commit reverted and I never experienced the crash.=C2=
=A0 But with 4.2.0-rc6 I get the crash on about every other reboot.<br><br>=
</div>Probably relevant: the computer on which the crash occurs has two GPU=
s (one Intel and one Nvidia).=C2=A0 The Intel one is actually being used, w=
hereas I presume the Nvidia one is being automatically disabled shortly aft=
er boot, perhaps when the crash occurs...<br><br></div>Eric<br></div><div c=
lass=3D"gmail_extra"><br><div class=3D"gmail_quote">On Mon, Aug 10, 2015 at=
 11:28 PM, Alexandre Courbot <span dir=3D"ltr">&lt;<a href=3D"mailto:gnurou=
@gmail.com" target=3D"_blank">gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>&gt;</span> wrote:<br><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex">Indeed, and I am actually surprised to see one =
here. I will<br>
double-check that patch.<br>
<br>
Eric, would you be able to give an estimate of the repro rate for this<br>
issue? More testing with and without the patch would be welcome, it&#39;d<b=
r>
be good to know whether it is actually the culprit or not.<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
On Mon, Aug 10, 2015 at 2:28 AM, Ilia Mirkin &lt;<a href=3D"mailto:imirkin@=
alum.mit.edu">imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org</a>&gt; wrote:<br>
&gt; Alexandre, could you take a look? 0xbad* generally comes from bad mmio=
<br>
&gt; reads.<br>
&gt;<br>
&gt; On Aug 9, 2015 1:08 PM, &quot;Eric Biggers&quot; &lt;<a href=3D"mailto=
:ebiggers3-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org">ebiggers3-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; Hi,<br>
&gt;&gt;<br>
&gt;&gt; I am testing Linux v4.2-rc5 and I am sporadically getting crashes =
shortly<br>
&gt;&gt; after<br>
&gt;&gt; startup in gk104_fifo_intr_runlist().=C2=A0 What I&#39;ve found is=
 that the &#39;mask&#39;<br>
&gt;&gt; value<br>
&gt;&gt; read from offset 0x2a00 comes back as &#39;0xbad0da00&#39;.=C2=A0 =
This causes the<br>
&gt;&gt; &#39;engn&#39;<br>
&gt;&gt; variable to be assigned the value 9, which is invalid; then wake_u=
p() is<br>
&gt;&gt; called<br>
&gt;&gt; on an uninitialized waitqueue which causes the crash.<br>
&gt;&gt;<br>
&gt;&gt; Reverting commit 1addc12648521d (&quot;drm/nouveau/fifo/gk104: kic=
k channels<br>
&gt;&gt; when<br>
&gt;&gt; deactivating them&quot;) seemed to make the problem go away, altho=
ugh I can&#39;t<br>
&gt;&gt; be 100%<br>
&gt;&gt; sure because the problem is sporadic.<br>
&gt;&gt;<br>
&gt;&gt; Attached an example of the kernel log up to the crash.<br>
&gt;&gt;<br>
&gt;&gt; Eric<br>
&gt;&gt;<br>
&gt;&gt; _______________________________________________<br>
&gt;&gt; Nouveau mailing list<br>
&gt;&gt; <a href=3D"mailto:Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org">Nouveau-PD4FTy7X32mzQB+pC5nmwQ@public.gmane.org=
edesktop.org</a><br>
&gt;&gt; <a href=3D"http://lists.freedesktop.org/mailman/listinfo/nouveau" =
rel=3D"noreferrer" target=3D"_blank">http://lists.freedesktop.org/mailman/l=
istinfo/nouveau</a><br>
&gt;&gt;<br>
&gt;<br>
</div></div></blockquote></div><br></div>

--001a113472520e2119051d12c397--

--===============1320164250==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1320164250==--
