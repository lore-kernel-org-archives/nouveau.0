From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: GSOC project
Date: Tue, 17 Jan 2017 16:28:20 -0500
Message-ID: <CAKb7Uvio0ZzR6CskosBBO2SEQqid5wStX1XJE_gnc13Pq=SKbw@mail.gmail.com>
References: <CAKjXbhDDYmbex1gq_1HesZxXMwHFHdQ24N0w76Uq0d8R-cgS5g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1059895304=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAKjXbhDDYmbex1gq_1HesZxXMwHFHdQ24N0w76Uq0d8R-cgS5g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Shailesh Tripathi <shailesh.tripathi.ece13-JkSQ4JD02HUxFYw1CcD5bw@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

--===============1059895304==
Content-Type: multipart/alternative; boundary=001a11479b4ab88b4b054650fa05

--001a11479b4ab88b4b054650fa05
Content-Type: text/plain; charset=UTF-8

There's not a lot of information about it. Basically we need 2 instruction
scheduling passes -- one pre-RA and one post-RA. The prerequisites are
"know how compilers work" and "have a GPU that you can test performance on".

I won't beat around the bush - this is a very tough project. Every attempt
at it so far has basically failed. There are a lot of issues that have to
be dealt with, like how to properly get the instruction latency
information, and how to apply it while taking ideas like register pressure
into account.

You can read up on the nouveau codegen compiler here:
https://cgit.freedesktop.org/mesa/mesa/tree/src/gallium/drivers/nouveau/codegen/

Cheers,

  -ilia


On Tue, Jan 17, 2017 at 8:58 AM, Shailesh Tripathi <
shailesh.tripathi.ece13-JkSQ4JD02HUxFYw1CcD5bw@public.gmane.org> wrote:

> Hello,
> I am quite interested in the project "Instruction Scheduler" under X.org.
> Please tell me where can I find a detailed idea of the project and how to
> start it. I think I have the given prerequisites.
>
> Regards
> Shailesh Tripathi
>
>
> Shailesh Tripathi
> B.Tech. Part-IV
> Electronics Engineering
> IIT-BHU (Varanasi)
>
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
>
>

--001a11479b4ab88b4b054650fa05
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">There&#39;s not a lot of information about it. Basically w=
e need 2 instruction scheduling passes -- one pre-RA and one post-RA. The p=
rerequisites are &quot;know how compilers work&quot; and &quot;have a GPU t=
hat you can test performance on&quot;.<div><br></div><div>I won&#39;t beat =
around the bush - this is a very tough project. Every attempt at it so far =
has basically failed. There are a lot of issues that have to be dealt with,=
 like how to properly get the instruction latency information, and how to a=
pply it while taking ideas like register pressure into account.</div><div><=
br></div><div>You can read up on the nouveau codegen compiler here:=C2=A0<a=
 href=3D"https://cgit.freedesktop.org/mesa/mesa/tree/src/gallium/drivers/no=
uveau/codegen/">https://cgit.freedesktop.org/mesa/mesa/tree/src/gallium/dri=
vers/nouveau/codegen/</a></div><div><br></div><div>Cheers,</div><div><br></=
div><div>=C2=A0 -ilia</div><div><br></div></div><div class=3D"gmail_extra">=
<br><div class=3D"gmail_quote">On Tue, Jan 17, 2017 at 8:58 AM, Shailesh Tr=
ipathi <span dir=3D"ltr">&lt;<a href=3D"mailto:shailesh.tripathi.ece13@itbh=
u.ac.in" target=3D"_blank">shailesh.tripathi.ece13-JkSQ4JD02HUxFYw1CcD5bw@public.gmane.org</a>&gt;</spa=
n> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div>Hello,</d=
iv><div>I am quite interested in the project &quot;Instruction Scheduler&qu=
ot; under X.org. Please tell me where can I find a detailed idea of the pro=
ject and how to start it. I think I have the given prerequisites.=C2=A0</di=
v><div><br></div><div>Regards</div><div>Shailesh Tripathi</div><span class=
=3D"HOEnZb"><font color=3D"#888888"><div><br></div><br clear=3D"all"><div><=
div class=3D"m_-5216163690798339499gmail_signature"><div dir=3D"ltr"><div><=
div dir=3D"ltr"><span style=3D"font-size:12.8px"><font face=3D"tahoma, sans=
-serif" color=3D"#999999">Shailesh Tripathi</font></span><div style=3D"font=
-size:12.8px"><font face=3D"tahoma, sans-serif" color=3D"#999999">B.Tech. P=
art-IV</font></div><div style=3D"font-size:12.8px"><font face=3D"tahoma, sa=
ns-serif" color=3D"#999999">Electronics Engineering</font></div><div style=
=3D"font-size:12.8px"><font face=3D"tahoma, sans-serif" color=3D"#999999">I=
IT-BHU (Varanasi)</font></div></div></div></div></div></div>
<img style=3D"display:none!important" height=3D"1" width=3D"1"></font></spa=
n></div>
<br>______________________________<wbr>_________________<br>
Nouveau mailing list<br>
<a href=3D"mailto:Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org">Nouveau-PD4FTy7X32lNgt0PjOBp9/rsn8yoX9R0@public.gmane.org=
org</a><br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/nouveau" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.freedesktop.org/<wbr>mailman/lis=
tinfo/nouveau</a><br>
<br></blockquote></div><br></div>

--001a11479b4ab88b4b054650fa05--

--===============1059895304==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1059895304==--
