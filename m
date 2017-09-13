From: Shahar Or <mightyiampresence-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: GTX 1080 Ti (NV132/GP102)
Date: Wed, 13 Sep 2017 18:35:55 +0000
Message-ID: <CAF3gKszQ6XFBntSgoxnuaEiGjphyD+L0ZAvgwqrwy3EC7z9k1A@mail.gmail.com>
References: <CAF3gKsxF4aHmPXaBp_hBWU9YY0b4POU7Q-zVMxQdvfLPXbLkQA@mail.gmail.com>
 <CAKb7UvizmS==c21wZfe2V2q1p7awpWmi8FwQhYJWX-V+sxcdgQ@mail.gmail.com>
 <CAF3gKsx=HrJEB+cmJU8comm6F4JbEC0ATHG76sT34sR4qhuVeg@mail.gmail.com>
 <CAKb7UvhwFfUF4Nn-4uW9ykK=T1nSbJYMvDkO9OmA6j6SiGyGQQ@mail.gmail.com>
 <CAF3gKszoN1kSZD7RBAnvJ=BqsMRK37ws3-vNp6wdys=V62D4vg@mail.gmail.com>
 <20170525162044.jit5ciapzee2b5gg@pmoreau.org>
 <CAF3gKszQB4CDfKESqVFWjzE8vhMu3KzSCyXRKQvUww8WBWwRXA@mail.gmail.com>
 <1503706621.2730.3.camel@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1388617831=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1503706621.2730.3.camel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: rosenp-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Eden Berger <eden2036-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: nouveau.vger.kernel.org

--===============1388617831==
Content-Type: multipart/alternative; boundary="94eb2c14a384cc0f420559166ec2"

--94eb2c14a384cc0f420559166ec2
Content-Type: text/plain; charset="UTF-8"

Hey. Thanks for the tip. I finally got around to capturing these long
entries. So, here they are:
http://paste.ubuntu.com/25529150/

I hope it helps. What you can see in it, are two consecutive boot-ups. The
first is without `nomodeset` and therefore fails (so I don't get any
display output) and the second is with `nomodeset` so I do get a usable
computer but no GPU acceleration.

What do the logs tell us, please?

On Sat, Aug 26, 2017 at 3:17 AM <rosenp-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> dmesg | grep nouveau . You can do this if you have ssh enabled on your
> machine.
>
> On my 980, There was an issue introduced in 4.12 which gives me similar
> behavior where I cannot boot up GNOME. Commit that fixes it which is
> part of 4.13 is called "add support for address-only transactions".
>
> Ask your distro to backport.
>
> On Mon, 2017-08-21 at 14:01 +0000, Shahar Or wrote:
> > Since the Ubuntu 17.10 that I'm running now has Linux 4.12, there
> > should be some support for my card, yet I still experience the same
> > phenomenon.
> >
> > If I DO NOT use `nomodeset`, I see the boot log shooting through and
> > then blank. I can tell that it is not a system halt, because I can
> > ctrl-alt-delete and the OS catches that and safely reboots.
> >
> > It is the official Ubuntu 4.12.0-11-generic, x86_64.
> >
> > 03:00.0 VGA compatible controller: NVIDIA Corporation GP102 [GeForce
> > GTX 1080 Ti] (rev a1)
> >
> > How can I further help you help me, please?
> >
> > On Thu, May 25, 2017 at 7:20 PM Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org>
> > wrote:
> > > > Another issue is that in Google Chrome I seem have no hardware
> > > acceleration
> > > > for anything other than "Multiple Raster Threads". See attached.
> > >
> > > Two things: you are using nomodeset, and hardware acceleration for
> > > Pascal cards
> > > was only merged in 4.12 (which has not been released yet), as
> > > pointed out by
> > > Ilia.
> > >
> > > Pierre
> >
> > _______________________________________________
> > Nouveau mailing list
> > Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> > https://lists.freedesktop.org/mailman/listinfo/nouveau
>

--94eb2c14a384cc0f420559166ec2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hey. Thanks for the tip. I finally got around to capturing=
 these long entries. So, here they are:<br><a href=3D"http://paste.ubuntu.c=
om/25529150/">http://paste.ubuntu.com/25529150/</a><div><br></div><div>I ho=
pe it helps. What you can see in it, are two consecutive boot-ups. The firs=
t is without `nomodeset` and therefore fails (so I don&#39;t get any displa=
y output) and the second is with `nomodeset` so I do get a usable computer =
but no GPU acceleration.</div><div><br></div><div>What do the logs tell us,=
 please?</div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Sat, =
Aug 26, 2017 at 3:17 AM &lt;<a href=3D"mailto:rosenp-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org">rosenp@gmai=
l.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">dmesg | grep n=
ouveau . You can do this if you have ssh enabled on your<br>
machine.<br>
<br>
On my 980, There was an issue introduced in 4.12 which gives me similar<br>
behavior where I cannot boot up GNOME. Commit that fixes it which is<br>
part of 4.13 is called &quot;add support for address-only transactions&quot=
;.<br>
<br>
Ask your distro to backport.<br>
<br>
On Mon, 2017-08-21 at 14:01 +0000, Shahar Or wrote:<br>
&gt; Since the Ubuntu 17.10 that I&#39;m running now has Linux 4.12, there<=
br>
&gt; should be some support for my card, yet I still experience the same<br=
>
&gt; phenomenon.<br>
&gt;<br>
&gt; If I DO NOT use `nomodeset`, I see the boot log shooting through and<b=
r>
&gt; then blank. I can tell that it is not a system halt, because I can<br>
&gt; ctrl-alt-delete and the OS catches that and safely reboots.<br>
&gt;<br>
&gt; It is the official Ubuntu 4.12.0-11-generic, x86_64.<br>
&gt;<br>
&gt; 03:00.0 VGA compatible controller: NVIDIA Corporation GP102 [GeForce<b=
r>
&gt; GTX 1080 Ti] (rev a1)<br>
&gt;<br>
&gt; How can I further help you help me, please?<br>
&gt;<br>
&gt; On Thu, May 25, 2017 at 7:20 PM Pierre Moreau &lt;<a href=3D"mailto:pi=
erre.morrow-GANU6spQydw@public.gmane.org" target=3D"_blank">pierre.morrow-GANU6spQydw@public.gmane.org</a>&gt;<br>
&gt; wrote:<br>
&gt; &gt; &gt; Another issue is that in Google Chrome I seem have no hardwa=
re<br>
&gt; &gt; acceleration<br>
&gt; &gt; &gt; for anything other than &quot;Multiple Raster Threads&quot;.=
 See attached.<br>
&gt; &gt;<br>
&gt; &gt; Two things: you are using nomodeset, and hardware acceleration fo=
r<br>
&gt; &gt; Pascal cards<br>
&gt; &gt; was only merged in 4.12 (which has not been released yet), as<br>
&gt; &gt; pointed out by<br>
&gt; &gt; Ilia.<br>
&gt; &gt;<br>
&gt; &gt; Pierre<br>
&gt;<br>
&gt; _______________________________________________<br>
&gt; Nouveau mailing list<br>
&gt; <a href=3D"mailto:Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" target=3D"_blank">Nou=
veau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org</a><br>
&gt; <a href=3D"https://lists.freedesktop.org/mailman/listinfo/nouveau" rel=
=3D"noreferrer" target=3D"_blank">https://lists.freedesktop.org/mailman/lis=
tinfo/nouveau</a><br>
</blockquote></div></div></div>

--94eb2c14a384cc0f420559166ec2--

--===============1388617831==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1388617831==--
