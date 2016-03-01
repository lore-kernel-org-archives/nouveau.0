From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: GSOC 2016 Aspirant for Kepler Accelerated Video
	Encoding;
Date: Tue, 1 Mar 2016 03:56:58 -0500
Message-ID: <CAKb7UvgHcfyjYELwzC2wZN1Jb+XzSnpBcnjJOnkBbJXogJ_fYQ@mail.gmail.com>
References: <CAK25hWPBCiy5mys9D1FWO_3v+tFGv0RSdOgqmVz+bru=3csHOA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0653136830=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAK25hWPBCiy5mys9D1FWO_3v+tFGv0RSdOgqmVz+bru=3csHOA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Saket Sinha <saket.sinha89-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Peter Hutterer <peter.hutterer-Pf4JEFdB4epeoWH0uzbU5w@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============0653136830==
Content-Type: multipart/alternative; boundary=089e0112c3b0b5f8fb052cf8f21b

--089e0112c3b0b5f8fb052cf8f21b
Content-Type: text/plain; charset=UTF-8

First, make sure there's a mentor available -- I doubt I'll have time to do
it, but perhaps someone else will be able to.

I would recommend writing a minimal application that e.g. encodes a fixed
group of frames. You should then trace this app under the blob with both
mmiotrace to figure out how to configure the underlying engine (probably
just firmware to upload), as well as get a mmt trace to figure out the fifo
interface end of it.

You could then write a proof of concept app that ran on top of nouveau and
encoded those same frames (with a cooked cmd stream). Once that works, it's
just a question of generalizing the commands to deal with different
parameters, etc. (And sticking the whole thing into Mesa.)

This is what I did when re'ing VP2, you can see some of the programs I used
at github.com/imirkin/re-vp2. Obviously the ones needed here will be
different but it should give an idea of what I mean.

Hope this helps,

  -ilia
On Mar 1, 2016 12:13 AM, "Saket Sinha" <saket.sinha89-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> Hi,
>
> First of all, congratulations to the X.org team for selection into
> Google Summer of Code 2016.
>
> I would like to participate to Google Summer of Code 2016 by
> contributing to Kepler Accelerated Video Encoding for Nouveau.
>
> I request you to kindly guide me as to how to get started with this
> project.
>
>
> Regards,
> Saket Sinha
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
>

--089e0112c3b0b5f8fb052cf8f21b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">First, make sure there&#39;s a mentor available -- I doubt I=
&#39;ll have time to do it, but perhaps someone else will be able to.</p>
<p dir=3D"ltr">I would recommend writing a minimal application that e.g. en=
codes a fixed group of frames. You should then trace this app under the blo=
b with both mmiotrace to figure out how to configure the underlying engine =
(probably just firmware to upload), as well as get a mmt trace to figure ou=
t the fifo interface end of it.</p>
<p dir=3D"ltr">You could then write a proof of concept app that ran on top =
of nouveau and encoded those same frames (with a cooked cmd stream). Once t=
hat works, it&#39;s just a question of generalizing the commands to deal wi=
th different parameters, etc. (And sticking the whole thing into Mesa.)</p>
<p dir=3D"ltr">This is what I did when re&#39;ing VP2, you can see some of =
the programs I used at <a href=3D"http://github.com/imirkin/re-vp2">github.=
com/imirkin/re-vp2</a>. Obviously the ones needed here will be different bu=
t it should give an idea of what I mean.</p>
<p dir=3D"ltr">Hope this helps,</p>
<p dir=3D"ltr">=C2=A0 -ilia</p>
<div class=3D"gmail_quote">On Mar 1, 2016 12:13 AM, &quot;Saket Sinha&quot;=
 &lt;<a href=3D"mailto:saket.sinha89-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org">saket.sinha89-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>=
&gt; wrote:<br type=3D"attribution"><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi,<br>
<br>
First of all, congratulations to the X.org team for selection into<br>
Google Summer of Code 2016.<br>
<br>
I would like to participate to Google Summer of Code 2016 by<br>
contributing to Kepler Accelerated Video Encoding for Nouveau.<br>
<br>
I request you to kindly guide me as to how to get started with this project=
.<br>
<br>
<br>
Regards,<br>
Saket Sinha<br>
_______________________________________________<br>
Nouveau mailing list<br>
<a href=3D"mailto:Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org">Nouveau-PD4FTy7X32lNgt0PjOBp9/rsn8yoX9R0@public.gmane.org=
org</a><br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/nouveau" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.freedesktop.org/mailman/listinfo=
/nouveau</a><br>
</blockquote></div>

--089e0112c3b0b5f8fb052cf8f21b--

--===============0653136830==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0653136830==--
