From: Shahar Or <mightyiampresence-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: GTX 1080 Ti (NV132/GP102)
Date: Mon, 21 Aug 2017 14:01:36 +0000
Message-ID: <CAF3gKszQB4CDfKESqVFWjzE8vhMu3KzSCyXRKQvUww8WBWwRXA@mail.gmail.com>
References: <CAF3gKsxF4aHmPXaBp_hBWU9YY0b4POU7Q-zVMxQdvfLPXbLkQA@mail.gmail.com>
 <CAKb7UvizmS==c21wZfe2V2q1p7awpWmi8FwQhYJWX-V+sxcdgQ@mail.gmail.com>
 <CAF3gKsx=HrJEB+cmJU8comm6F4JbEC0ATHG76sT34sR4qhuVeg@mail.gmail.com>
 <CAKb7UvhwFfUF4Nn-4uW9ykK=T1nSbJYMvDkO9OmA6j6SiGyGQQ@mail.gmail.com>
 <CAF3gKszoN1kSZD7RBAnvJ=BqsMRK37ws3-vNp6wdys=V62D4vg@mail.gmail.com>
 <20170525162044.jit5ciapzee2b5gg@pmoreau.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0214395661=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20170525162044.jit5ciapzee2b5gg-WLoDKDh+7sdAfugRpC6u6w@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

--===============0214395661==
Content-Type: multipart/alternative; boundary="f403045f8f826b34cd055743ebe0"

--f403045f8f826b34cd055743ebe0
Content-Type: text/plain; charset="UTF-8"

Since the Ubuntu 17.10 that I'm running now has Linux 4.12, there should be
some support for my card, yet I still experience the same phenomenon.

If I DO NOT use `nomodeset`, I see the boot log shooting through and then
blank. I can tell that it is not a system halt, because I can
ctrl-alt-delete and the OS catches that and safely reboots.

It is the official Ubuntu 4.12.0-11-generic, x86_64.

03:00.0 VGA compatible controller: NVIDIA Corporation GP102 [GeForce GTX
1080 Ti] (rev a1)

How can I further help you help me, please?

On Thu, May 25, 2017 at 7:20 PM Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org> wrote:

> > Another issue is that in Google Chrome I seem have no hardware
> acceleration
> > for anything other than "Multiple Raster Threads". See attached.
>
> Two things: you are using nomodeset, and hardware acceleration for Pascal
> cards
> was only merged in 4.12 (which has not been released yet), as pointed out
> by
> Ilia.
>
> Pierre
>

--f403045f8f826b34cd055743ebe0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Since the Ubuntu 17.10 that I&#39;m running now has Linux =
4.12, there should be some support for my card, yet I still experience the =
same phenomenon.<div><br></div><div>If I DO NOT use `nomodeset`, I see the =
boot log shooting through and then blank. I can tell that it is not a syste=
m halt, because I can ctrl-alt-delete and the OS catches that and safely re=
boots.</div><div><br></div><div>It is the official Ubuntu 4.12.0-11-generic=
, x86_64.</div><div><br></div><div>03:00.0 VGA compatible controller: NVIDI=
A Corporation GP102 [GeForce GTX 1080 Ti] (rev a1)<br></div><div><br></div>=
<div>How can I further help you help me, please?</div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr">On Thu, May 25, 2017 at 7:20 PM Pierre Mo=
reau &lt;<a href=3D"mailto:pierre.morrow-GANU6spQydw@public.gmane.org">pierre.morrow-GANU6spQydw@public.gmane.org</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex">&gt; Another issue is t=
hat in Google Chrome I seem have no hardware acceleration<br>
&gt; for anything other than &quot;Multiple Raster Threads&quot;. See attac=
hed.<br>
<br>
Two things: you are using nomodeset, and hardware acceleration for Pascal c=
ards<br>
was only merged in 4.12 (which has not been released yet), as pointed out b=
y<br>
Ilia.<br>
<br>
Pierre<br>
</blockquote></div>

--f403045f8f826b34cd055743ebe0--

--===============0214395661==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0214395661==--
