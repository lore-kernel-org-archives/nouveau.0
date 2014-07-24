From: Patrick Baggett <baggett.patrick-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Text sometimes missing on NV18 based laptop
Date: Thu, 24 Jul 2014 09:00:42 -0500
Message-ID: <CAEk2StnAg55AhTMQ3TxQRpWUes_fndKDGMG2Q1N5qA-O+j7KCg@mail.gmail.com>
References: <CAFvQSYQr3Bk=eFPW5V3NUMptDhU9Q36tvu8_1zXh0oQtibQ83A@mail.gmail.com>
 <CAFvQSYQ4QXW=0NqXj=fWAzTTQtmLoJpA1GmrK3QuKforVRprjQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1596173252=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAFvQSYQ4QXW=0NqXj=fWAzTTQtmLoJpA1GmrK3QuKforVRprjQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Clemens Eisserer <linuxhippy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

--===============1596173252==
Content-Type: multipart/alternative; boundary=089e01160848e85c4104fef0e13a

--089e01160848e85c4104fef0e13a
Content-Type: text/plain; charset=UTF-8

On Wed, Jul 23, 2014 at 9:32 AM, Clemens Eisserer <linuxhippy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
wrote:

> Hi again,
>
> > On my NV18 based laptop I experience artifacts related to text
> > (however, 2D performance is really great these days):
> > - With grayscale AA text is sometimes missing, often visible on the XFCE
> desktop
> > - With subpixel (rgb) AA, even non-text related occur (icons are
> > misrendered, ...)
> >
> > I've reported the issues here:
> > https://bugs.freedesktop.org/show_bug.cgi?id=81283
>
> I know NV1x isn't anything spectacular or exciting to work on, however
> on that notebook I don't have any choice.
> Therefore I would be really grateful for advice how to narrow the
> issues reported down.
>
> Even finding a way to selectively turn off the accel-paths which cause
> the issue would be a big win, as with noaccel the system is barely
> useable.
>
>
I'm going to set up an old P4 system with a GeForce4 -- I'll see if there
is of those suggestion that Illia made that I can try out...


> Thank you in advance, Clemens
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
>

--089e01160848e85c4104fef0e13a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Wed, Jul 23, 2014 at 9:32 AM, Clemens Eisserer <span dir=3D"ltr"=
>&lt;<a href=3D"mailto:linuxhippy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" target=3D"_blank">linuxhippy@g=
mail.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">Hi again,<br>
<br>
&gt; On my NV18 based laptop I experience artifacts related to text<br>
&gt; (however, 2D performance is really great these days):<br>
&gt; - With grayscale AA text is sometimes missing, often visible on the XF=
CE desktop<br>
&gt; - With subpixel (rgb) AA, even non-text related occur (icons are<br>
&gt; misrendered, ...)<br>
&gt;<br>
&gt; I&#39;ve reported the issues here:<br>
&gt; <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D81283" targe=
t=3D"_blank">https://bugs.freedesktop.org/show_bug.cgi?id=3D81283</a><br>
<br>
I know NV1x isn&#39;t anything spectacular or exciting to work on, however<=
br>
on that notebook I don&#39;t have any choice.<br>
Therefore I would be really grateful for advice how to narrow the<br>
issues reported down.<br>
<br>
Even finding a way to selectively turn off the accel-paths which cause<br>
the issue would be a big win, as with noaccel the system is barely<br>
useable.<br>
<br></blockquote><div><br></div><div>I&#39;m going to set up an old P4 syst=
em with a GeForce4 -- I&#39;ll see if there is of those suggestion that Ill=
ia made that I can try out...</div><div>=C2=A0</div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex">

Thank you in advance, Clemens<br>
_______________________________________________<br>
Nouveau mailing list<br>
<a href=3D"mailto:Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org">Nouveau-PD4FTy7X32lNgt0PjOBp9/rsn8yoX9R0@public.gmane.org=
org</a><br>
<a href=3D"http://lists.freedesktop.org/mailman/listinfo/nouveau" target=3D=
"_blank">http://lists.freedesktop.org/mailman/listinfo/nouveau</a><br>
</blockquote></div><br></div></div>

--089e01160848e85c4104fef0e13a--

--===============1596173252==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1596173252==--
