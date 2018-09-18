From: Rhys Kidd <rhyskidd-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: System hang on Alienware 13 with NVIDIA GP106M
Date: Mon, 17 Sep 2018 22:55:02 -0400
Message-ID: <CA+iOQUGdv-YcqbGFD41UNH3bKAb2fRZUdfY83As2XHxoGqRFWg@mail.gmail.com>
References: <b6247ef5-93dd-b70c-4354-81b8b0da74f8@comcast.net>
 <3113e290-747f-885b-29a9-0821665c7b95@comcast.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1689709338=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <3113e290-747f-885b-29a9-0821665c7b95-Wuw85uim5zDR7s880joybQ@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: hdf3-Wuw85uim5zDR7s880joybQ@public.gmane.org
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============1689709338==
Content-Type: multipart/alternative; boundary="00000000000040a23a05761c6b03"

--00000000000040a23a05761c6b03
Content-Type: text/plain; charset="UTF-8"

We've seen a number of power management and secboot issues with the
Pascal-series mobile GPUs.
Without a command line it is hard to debug remotely, but see, as one
possible example: https://bugs.freedesktop.org/show_bug.cgi?id=100228

Can you try booting with a kernel command line that includes
"nouveau.runpm=0" as a debugging step.

On Mon, 17 Sep 2018 at 17:46, don fisher <hdf3-Wuw85uim5zDR7s880joybQ@public.gmane.org> wrote:

> Alienware 17 r5 also with same graphics (GP106M and Intel 3e9b) does
> boot from same disk. I look in hwinfo --gfxcard and it says both the
> Intel (on i915) and the Nvidia (nouveau) are both present. What command
> tells me which driver is being used?
>
> Thanks.
> Don
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
>

--00000000000040a23a05761c6b03
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>We&#39;ve seen a number of power man=
agement and secboot issues with the Pascal-series mobile GPUs.</div><div>Wi=
thout a command line it is hard to debug remotely, but see, as one possible=
 example: <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100228"=
>https://bugs.freedesktop.org/show_bug.cgi?id=3D100228</a> <br></div><div><=
br></div><div>Can you try booting with a kernel command line that includes =
&quot;nouveau.runpm=3D0&quot; as a debugging step.<br></div></div></div><br=
><div class=3D"gmail_quote"><div dir=3D"ltr">On Mon, 17 Sep 2018 at 17:46, =
don fisher &lt;<a href=3D"mailto:hdf3-Wuw85uim5zDR7s880joybQ@public.gmane.org" target=3D"_blank">hdf3@c=
omcast.net</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Alienwar=
e 17 r5 also with same graphics (GP106M and Intel 3e9b) does <br>
boot from same disk. I look in hwinfo --gfxcard and it says both the <br>
Intel (on i915) and the Nvidia (nouveau) are both present. What command <br=
>
tells me which driver is being used?<br>
<br>
Thanks.<br>
Don<br>
_______________________________________________<br>
Nouveau mailing list<br>
<a href=3D"mailto:Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" target=3D"_blank">Nouveau@=
lists.freedesktop.org</a><br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/nouveau" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.freedesktop.org/mailman/listinfo=
/nouveau</a><br>
</blockquote></div>

--00000000000040a23a05761c6b03--

--===============1689709338==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1689709338==--
