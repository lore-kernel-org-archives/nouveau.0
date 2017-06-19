From: Aaryaman Vasishta <jem456.vasishta-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3] nv110/exa: update sched codes
Date: Tue, 20 Jun 2017 00:22:48 +0900
Message-ID: <CABVHfRuq=5obep+Q7DujB-FxuDGBHrj-xPWXPbf=hkkaSVUMCA@mail.gmail.com>
References: <20170610071057.13520-1-jem456.vasishta@gmail.com>
 <CABVHfRuD4FqyvZGwn9ybsL9rATwyAbdCLRBF44VPzhQvNC1ZhQ@mail.gmail.com>
 <dbc1de05-d4e1-403f-5492-3b9f96cfaae0@gmail.com>
 <CAKb7UvgYJBWtnRpUmfJnYMc5MFuvheznpUVn-ymLfYkkSKSyPg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1952067570=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAKb7UvgYJBWtnRpUmfJnYMc5MFuvheznpUVn-ymLfYkkSKSyPg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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

--===============1952067570==
Content-Type: multipart/alternative; boundary="001a1137289a6206b6055251b6da"

--001a1137289a6206b6055251b6da
Content-Type: text/plain; charset="UTF-8"

Sorry for the late response, been busy with some personal stuff + work...

On Tue, Jun 13, 2017 at 6:52 AM, Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> wrote:

> On Mon, Jun 12, 2017 at 5:46 PM, Samuel Pitoiset
> <samuel.pitoiset-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> >
> >
> > On 06/10/2017 09:14 AM, Aaryaman Vasishta wrote:
> >>
> >> See the 'wt' on the first fmul in exacanv110.fp, exacmnv110.fp and
> >> exasanv110.fp. Any ideas on what could be causing the first fmul to
> require
> >> $r0 and/or $r1?
> >
> >
> > 'tex nodep $r4 $r2 0x0 0x1 t2d 0xf'
> >
> > is actually:
> >
> > 'tex nodep $r4:$r7 $r2 0x0 0x1 t2d 0xf'
>
That's definitely confusing, but quite interesting.

>
> Actually more like:
>
> tex nodep $r4:$r5:$r6:$r7 $r2:$r3 ...
>
Any idea why is it this way? The only way I could figure out so far is by
trial and error, but is there any better way to detect such dependencies?

In the mean time, I'll update the shaders again and start to do some tests.
Any tips on how to proceed doing so would really be appreciated ^_^

Cheers,
Aaryaman

--001a1137289a6206b6055251b6da
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Sorry for the late response, been busy with some personal =
stuff + work...<br><div class=3D"gmail_extra"><br><div class=3D"gmail_quote=
">On Tue, Jun 13, 2017 at 6:52 AM, Ilia Mirkin <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org" target=3D"_blank">imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On M=
on, Jun 12, 2017 at 5:46 PM, Samuel Pitoiset<br>
&lt;<a href=3D"mailto:samuel.pitoiset-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org">samuel.pitoiset-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org<=
/a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt; On 06/10/2017 09:14 AM, Aaryaman Vasishta wrote:<br>
&gt;&gt;<br>
&gt;&gt; See the &#39;wt&#39; on the first fmul in exacanv110.fp, exacmnv11=
0.fp and<br>
&gt;&gt; exasanv110.fp. Any ideas on what could be causing the first fmul t=
o require<br>
&gt;&gt; $r0 and/or $r1?<br>
&gt;<br>
&gt;<br>
&gt; &#39;tex nodep $r4 $r2 0x0 0x1 t2d 0xf&#39;<br>
&gt;<br>
&gt; is actually:<br>
&gt;<br>
&gt; &#39;tex nodep $r4:$r7 $r2 0x0 0x1 t2d 0xf&#39;<br></span></blockquote=
><div>That&#39;s definitely confusing, but quite interesting.=C2=A0</div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex"><span class=3D"">
<br>
</span>Actually more like:<br>
<br>
tex nodep $r4:$r5:$r6:$r7 $r2:$r3 ...<br></blockquote><div>Any idea why is =
it this way? The only way I could figure out so far is by trial and error, =
but is there any better way to detect such dependencies?</div><div><br></di=
v><div>In the mean time, I&#39;ll update the shaders again and start to do =
some tests. Any tips on how to proceed doing so would really be appreciated=
 ^_^</div><div><br></div><div>Cheers,</div><div>Aaryaman</div></div><br></d=
iv></div>

--001a1137289a6206b6055251b6da--

--===============1952067570==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1952067570==--
