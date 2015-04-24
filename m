From: Daniel Melo Jorge da Cunha <dmjcunha-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: nouveau X nvidia
Date: Fri, 24 Apr 2015 11:19:23 -0400
Message-ID: <CANbfre4mer87vrhknjig38XfOfuHsPv_BGpMRvkD=KWcNwD57w@mail.gmail.com>
References: <CANbfre5uh0N52RKPh0uPPna2oMYdrx=ymSBnV=EStvJB1HtXbw@mail.gmail.com>
 <CAKb7UvhW+ktyUgrXj7WJXLrDPnTVfA2WB_pQjY9kXN=ULcx3iQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0795749937=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAKb7UvhW+ktyUgrXj7WJXLrDPnTVfA2WB_pQjY9kXN=ULcx3iQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

--===============0795749937==
Content-Type: multipart/alternative; boundary=001a113459acce65bc051479ebca

--001a113459acce65bc051479ebca
Content-Type: text/plain; charset=UTF-8

I'm sorry for my ignorance but I must ask. When you wrote:
"The nouveau driver's GL implementation is going to be rather
 different from NVIDIA's in many..."

Do you mean that valgrind-mmt will output differently in nouveau
drivers'GL and NVIDIA's driver?

Again, thanks for any help.

2015-04-24 10:34 GMT-04:00 Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>:

> Ideally valgrind output for both should be identical -- no leaks :)
>
> Are you asking about valgrind-mmt perhaps? The nouveau driver's GL
> implementation is going to be rather different from NVIDIA's in many
> many respects, both at the micro level (e.g. order of state being
> emitted and when that's done), to the entire approach to e.g. fbo
> flipping and lots of other things.
>
> On Fri, Apr 24, 2015 at 10:12 AM, Daniel Melo Jorge da Cunha
> <dmjcunha-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > Hi, just a question.
> >
> > If I had two systems, one with nouveau and the other with nvidia. And
> then I
> > valgrind
> > glxgears, for example.
> >
> > Would valgrind's output: 1- be the same in both systems? 2- be as much
> close
> > as
> > possible in both systems (the differences being due to implementations in
> > the
> > proprietary driver which are not implemented in nouveau) ? 3- or would
> it be
> > entirely
> > different in both systems?
> >
> > Thanks in advance for any help..
> >
> > _______________________________________________
> > Nouveau mailing list
> > Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> > http://lists.freedesktop.org/mailman/listinfo/nouveau
> >
>

--001a113459acce65bc051479ebca
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;m sorry for my ignorance but I must ask. When you wr=
ote:<div><span style=3D"font-size:12.8000001907349px">&quot;The nouveau dri=
ver&#39;s GL=C2=A0</span><span style=3D"font-size:12.8000001907349px">imple=
mentation is going to be rather</span></div><div><span style=3D"font-size:1=
2.8000001907349px">=C2=A0different from NVIDIA&#39;s in many...&quot;</span=
><br></div><div><span style=3D"font-size:12.8000001907349px"><br></span></d=
iv><div><span style=3D"font-size:12.8000001907349px">Do you mean that valgr=
ind-mmt will output differently in nouveau</span></div><div><span style=3D"=
font-size:12.8000001907349px">drivers&#39;GL and NVIDIA&#39;s driver?</span=
></div><div><span style=3D"font-size:12.8000001907349px"><br></span></div><=
div><span style=3D"font-size:12.8000001907349px">Again, thanks for any help=
.</span></div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quot=
e">2015-04-24 10:34 GMT-04:00 Ilia Mirkin <span dir=3D"ltr">&lt;<a href=3D"=
mailto:imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org" target=3D"_blank">imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org</a>&gt;=
</span>:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">Ideally valgrind output for both=
 should be identical -- no leaks :)<br>
<br>
Are you asking about valgrind-mmt perhaps? The nouveau driver&#39;s GL<br>
implementation is going to be rather different from NVIDIA&#39;s in many<br=
>
many respects, both at the micro level (e.g. order of state being<br>
emitted and when that&#39;s done), to the entire approach to e.g. fbo<br>
flipping and lots of other things.<br>
<div><div class=3D"h5"><br>
On Fri, Apr 24, 2015 at 10:12 AM, Daniel Melo Jorge da Cunha<br>
&lt;<a href=3D"mailto:dmjcunha-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org">dmjcunha-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>&gt; wrote:=
<br>
&gt; Hi, just a question.<br>
&gt;<br>
&gt; If I had two systems, one with nouveau and the other with nvidia. And =
then I<br>
&gt; valgrind<br>
&gt; glxgears, for example.<br>
&gt;<br>
&gt; Would valgrind&#39;s output: 1- be the same in both systems? 2- be as =
much close<br>
&gt; as<br>
&gt; possible in both systems (the differences being due to implementations=
 in<br>
&gt; the<br>
&gt; proprietary driver which are not implemented in nouveau) ? 3- or would=
 it be<br>
&gt; entirely<br>
&gt; different in both systems?<br>
&gt;<br>
&gt; Thanks in advance for any help..<br>
&gt;<br>
</div></div>&gt; _______________________________________________<br>
&gt; Nouveau mailing list<br>
&gt; <a href=3D"mailto:Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org">Nouveau-PD4FTy7X32mqWrfYKbYh0A@public.gmane.org=
ktop.org</a><br>
&gt; <a href=3D"http://lists.freedesktop.org/mailman/listinfo/nouveau" targ=
et=3D"_blank">http://lists.freedesktop.org/mailman/listinfo/nouveau</a><br>
&gt;<br>
</blockquote></div><br></div>

--001a113459acce65bc051479ebca--

--===============0795749937==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0795749937==--
