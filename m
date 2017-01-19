From: Shailesh Tripathi <shailesh.tripathi.ece13-JkSQ4JD02HUxFYw1CcD5bw@public.gmane.org>
Subject: Re: GSOC project
Date: Thu, 19 Jan 2017 22:10:45 +0530
Message-ID: <CAKjXbhBHMFT-BvaJT2qgOUpZr3NOADc2_V5USX5VgoUS4hzSGw@mail.gmail.com>
References: <CAKjXbhDDYmbex1gq_1HesZxXMwHFHdQ24N0w76Uq0d8R-cgS5g@mail.gmail.com>
 <CAKb7Uvio0ZzR6CskosBBO2SEQqid5wStX1XJE_gnc13Pq=SKbw@mail.gmail.com>
 <0CF44955-BA88-4D54-B6EF-A272A4A02B3E@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1908972179=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <0CF44955-BA88-4D54-B6EF-A272A4A02B3E-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Karol Herbst <karolherbst-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============1908972179==
Content-Type: multipart/alternative; boundary=001a1145b3aceec2710546753103

--001a1145b3aceec2710546753103
Content-Type: text/plain; charset=UTF-8

Hello,
Even I think it would be a very big project for just 3 months, but it would
be fun learning and developing this. I feel I have the required skills and
would like to learn more for this. I have just one doubt regarding the GPU
required for the task. Will a normal NVIDIA GT 740m would be enough or we
need better GPUs like Tesla or Quadro? In the latter case how can one
proceed in case of its unavailability?

Regards
Shailesh

Shailesh Tripathi
B.Tech. Part-III
Electronics Engineering
IIT-BHU (Varanasi)

On Wed, Jan 18, 2017 at 3:48 AM, Karol Herbst <karolherbst-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> Hi,
>
> I think a nice project would be to write an application to figure out
> those latencies automatically maybe even based on envydis.
>
> It could generate latency information based on thread count, register
> usage, instruction/instruction class, hw unit used. Or even tries to figure
> out what kind of units exist. Like instructions out of a group which are
> free to issue/execute after instructions out of another one.
>
> I could imagine, that this allone might be a really huge project, but
> useful for future and past chipsets.
>
> On 17 January 2017 10:28:20 p.m. GMT+01:00, Ilia Mirkin <
> imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> wrote:
> >There's not a lot of information about it. Basically we need 2
> >instruction
> >scheduling passes -- one pre-RA and one post-RA. The prerequisites are
> >"know how compilers work" and "have a GPU that you can test performance
> >on".
> >
> >I won't beat around the bush - this is a very tough project. Every
> >attempt
> >at it so far has basically failed. There are a lot of issues that have
> >to
> >be dealt with, like how to properly get the instruction latency
> >information, and how to apply it while taking ideas like register
> >pressure
> >into account.
> >
> >You can read up on the nouveau codegen compiler here:
> >https://cgit.freedesktop.org/mesa/mesa/tree/src/gallium/
> drivers/nouveau/codegen/
> >
> >Cheers,
> >
> >  -ilia
> >
> >
> >On Tue, Jan 17, 2017 at 8:58 AM, Shailesh Tripathi <
> >shailesh.tripathi.ece13-JkSQ4JD02HUxFYw1CcD5bw@public.gmane.org> wrote:
> >
> >> Hello,
> >> I am quite interested in the project "Instruction Scheduler" under
> >X.org.
> >> Please tell me where can I find a detailed idea of the project and
> >how to
> >> start it. I think I have the given prerequisites.
> >>
> >> Regards
> >> Shailesh Tripathi
> >>
> >>
> >> Shailesh Tripathi
> >> B.Tech. Part-IV
> >> Electronics Engineering
> >> IIT-BHU (Varanasi)
> >>
> >> _______________________________________________
> >> Nouveau mailing list
> >> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> >> https://lists.freedesktop.org/mailman/listinfo/nouveau
> >>
> >>
>

--001a1145b3aceec2710546753103
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<div>Even I think it would be a very big project for=
 just 3 months, but it would be fun learning and developing this. I feel I =
have the required skills and would like to learn more for this. I have just=
 one doubt regarding the GPU required for the task. Will a normal NVIDIA GT=
 740m would be enough or we need better GPUs like Tesla or Quadro? In the l=
atter case how can one proceed in case of its unavailability?</div><div><br=
></div><div>Regards</div><div>Shailesh</div><img src=3D"http://t.sidekickop=
en16.com/e1t/o/5/f18dQhb0S7ks8dDMPbW2n0x6l2B9gXrN7sKj6v4dZ2TW7grXpR2BpsbFW8=
qSCp03LvrVvW6tjL5Z1k1H6H0?si=3D4873706252271616&amp;pi=3Db06da9ec-33b4-4eb3=
-e88a-385056fc69f2" style=3D"display:none!important" height=3D"1" width=3D"=
1"></div><div class=3D"gmail_extra"><br clear=3D"all"><div><div class=3D"gm=
ail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div><di=
v dir=3D"ltr"><span style=3D"font-size:12.8px"><font face=3D"tahoma, sans-s=
erif" color=3D"#999999">Shailesh Tripathi</font></span><div style=3D"font-s=
ize:12.8px"><font face=3D"tahoma, sans-serif" color=3D"#999999">B.Tech. Par=
t-III</font></div><div style=3D"font-size:12.8px"><font face=3D"tahoma, san=
s-serif" color=3D"#999999">Electronics Engineering</font></div><div style=
=3D"font-size:12.8px"><font face=3D"tahoma, sans-serif" color=3D"#999999">I=
IT-BHU (Varanasi)</font></div></div></div></div></div></div>
<br><div class=3D"gmail_quote">On Wed, Jan 18, 2017 at 3:48 AM, Karol Herbs=
t <span dir=3D"ltr">&lt;<a href=3D"mailto:karolherbst-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" target=3D"=
_blank">karolherbst-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>&gt;</span> wrote:<br><blockquote class=3D=
"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex">Hi,<br>
<br>
I think a nice project would be to write an application to figure out those=
 latencies automatically maybe even based on envydis.<br>
<br>
It could generate latency information based on thread count, register usage=
, instruction/instruction class, hw unit used. Or even tries to figure out =
what kind of units exist. Like instructions out of a group which are free t=
o issue/execute after instructions out of another one.<br>
<br>
I could imagine, that this allone might be a really huge project, but usefu=
l for future and past chipsets.<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
On 17 January 2017 10:28:20 p.m. GMT+01:00, Ilia Mirkin &lt;<a href=3D"mail=
to:imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org">imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org</a>&gt; wrote:<br>
&gt;There&#39;s not a lot of information about it. Basically we need 2<br>
&gt;instruction<br>
&gt;scheduling passes -- one pre-RA and one post-RA. The prerequisites are<=
br>
&gt;&quot;know how compilers work&quot; and &quot;have a GPU that you can t=
est performance<br>
&gt;on&quot;.<br>
&gt;<br>
&gt;I won&#39;t beat around the bush - this is a very tough project. Every<=
br>
&gt;attempt<br>
&gt;at it so far has basically failed. There are a lot of issues that have<=
br>
&gt;to<br>
&gt;be dealt with, like how to properly get the instruction latency<br>
&gt;information, and how to apply it while taking ideas like register<br>
&gt;pressure<br>
&gt;into account.<br>
&gt;<br>
&gt;You can read up on the nouveau codegen compiler here:<br>
&gt;<a href=3D"https://cgit.freedesktop.org/mesa/mesa/tree/src/gallium/driv=
ers/nouveau/codegen/" rel=3D"noreferrer" target=3D"_blank">https://cgit.fre=
edesktop.org/<wbr>mesa/mesa/tree/src/gallium/<wbr>drivers/nouveau/codegen/<=
/a><br>
&gt;<br>
&gt;Cheers,<br>
&gt;<br>
&gt;=C2=A0 -ilia<br>
&gt;<br>
&gt;<br>
&gt;On Tue, Jan 17, 2017 at 8:58 AM, Shailesh Tripathi &lt;<br>
&gt;<a href=3D"mailto:shailesh.tripathi.ece13-JkSQ4JD02HUxFYw1CcD5bw@public.gmane.org">shailesh.tripath=
i.ece13@<wbr>itbhu.ac.in</a>&gt; wrote:<br>
&gt;<br>
&gt;&gt; Hello,<br>
&gt;&gt; I am quite interested in the project &quot;Instruction Scheduler&q=
uot; under<br>
&gt;X.org.<br>
&gt;&gt; Please tell me where can I find a detailed idea of the project and=
<br>
&gt;how to<br>
&gt;&gt; start it. I think I have the given prerequisites.<br>
&gt;&gt;<br>
&gt;&gt; Regards<br>
&gt;&gt; Shailesh Tripathi<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; Shailesh Tripathi<br>
&gt;&gt; B.Tech. Part-IV<br>
&gt;&gt; Electronics Engineering<br>
&gt;&gt; IIT-BHU (Varanasi)<br>
&gt;&gt;<br>
</div></div><div class=3D"HOEnZb"><div class=3D"h5">&gt;&gt; ______________=
________________<wbr>_________________<br>
&gt;&gt; Nouveau mailing list<br>
&gt;&gt; <a href=3D"mailto:Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org">Nouveau-PD4FTy7X32mzQB+pC5nmwQ@public.gmane.org=
edesktop.org</a><br>
&gt;&gt; <a href=3D"https://lists.freedesktop.org/mailman/listinfo/nouveau"=
 rel=3D"noreferrer" target=3D"_blank">https://lists.freedesktop.org/<wbr>ma=
ilman/listinfo/nouveau</a><br>
&gt;&gt;<br>
&gt;&gt;<br>
</div></div></blockquote></div><br></div>

--001a1145b3aceec2710546753103--

--===============1908972179==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1908972179==--
