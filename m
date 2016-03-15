From: Pedro Francisco <pedrogfrancisco-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: VNC on Optimus systems (is|may be) broken
Date: Tue, 15 Mar 2016 19:09:18 +0000
Message-ID: <CAJZjf_yLqBsbC4THqg6CSRY62dB_f5BoDEbcudqTCDBdeaJWqw@mail.gmail.com>
References: <CAJZjf_xrjZS==gg1=MXBNrchtJpwKhHb5bn8pPOtgmAcXvY=Tg@mail.gmail.com>
 <CAKb7Uvg6HgrVxBfxWPWXN_+yXvMGCC63a8WjCRyyAysU5VBhxg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0443809604=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAKb7Uvg6HgrVxBfxWPWXN_+yXvMGCC63a8WjCRyyAysU5VBhxg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============0443809604==
Content-Type: multipart/alternative; boundary=001a113fa3fe4fb913052e1b22aa

--001a113fa3fe4fb913052e1b22aa
Content-Type: text/plain; charset=UTF-8

I decided to install Nvidia driver and, while I borked the install,
blacklisting nouveau seemed to fix VNC.

I will retest again just to be certain, but thought of asking here first.
Em 15/03/2016 19:06, "Ilia Mirkin" <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> escreveu:

> On an optimus system, the display is normally driven by the intel GPU.
> What makes you suspect nouveau is involved at all?
>
> On Tue, Mar 15, 2016 at 3:02 PM, Pedro Francisco
> <pedrogfrancisco-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > Hello!
> > I'm investigating a case where x11vnc (or RealVNC server or vino) on a
> > _real_ X11 server seems to be broken with any VNC viewer.
> >
> > By broken I mean: it seems to keep old frames in memory, in such a way
> > that in every three frames, two are from the past and one is the
> > current one.
> >
> > This is easily spotted when using gnome-shell and looking at the clock
> > at the top. Besides being 'old', the pictures are "pixel-perfect" and
> > not corrupted in any way.
> >
> >
> > So, here am I trying to debug it.
> > Do you have anything to suggest I check before re-running the test?
> > (namely, blacklisting nouveau and rebuilding initramfs and check if
> > the problem is gone).
> >
> >
> > P.S.: virtual VNC servers are _not_ broken.
> >
> > Thanks in Advance,
> > Pedro
> > _______________________________________________
> > Nouveau mailing list
> > Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> > https://lists.freedesktop.org/mailman/listinfo/nouveau
>

--001a113fa3fe4fb913052e1b22aa
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">I decided to install Nvidia driver and, while I borked the i=
nstall, blacklisting nouveau seemed to fix VNC.</p>
<p dir=3D"ltr">I will retest again just to be certain, but thought of askin=
g here first.</p>
<div class=3D"gmail_quote">Em 15/03/2016 19:06, &quot;Ilia Mirkin&quot; &lt=
;<a href=3D"mailto:imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org">imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org</a>&gt; escre=
veu:<br type=3D"attribution"><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On an optimus s=
ystem, the display is normally driven by the intel GPU.<br>
What makes you suspect nouveau is involved at all?<br>
<br>
On Tue, Mar 15, 2016 at 3:02 PM, Pedro Francisco<br>
&lt;<a href=3D"mailto:pedrogfrancisco-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org">pedrogfrancisco-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org<=
/a>&gt; wrote:<br>
&gt; Hello!<br>
&gt; I&#39;m investigating a case where x11vnc (or RealVNC server or vino) =
on a<br>
&gt; _real_ X11 server seems to be broken with any VNC viewer.<br>
&gt;<br>
&gt; By broken I mean: it seems to keep old frames in memory, in such a way=
<br>
&gt; that in every three frames, two are from the past and one is the<br>
&gt; current one.<br>
&gt;<br>
&gt; This is easily spotted when using gnome-shell and looking at the clock=
<br>
&gt; at the top. Besides being &#39;old&#39;, the pictures are &quot;pixel-=
perfect&quot; and<br>
&gt; not corrupted in any way.<br>
&gt;<br>
&gt;<br>
&gt; So, here am I trying to debug it.<br>
&gt; Do you have anything to suggest I check before re-running the test?<br=
>
&gt; (namely, blacklisting nouveau and rebuilding initramfs and check if<br=
>
&gt; the problem is gone).<br>
&gt;<br>
&gt;<br>
&gt; P.S.: virtual VNC servers are _not_ broken.<br>
&gt;<br>
&gt; Thanks in Advance,<br>
&gt; Pedro<br>
&gt; _______________________________________________<br>
&gt; Nouveau mailing list<br>
&gt; <a href=3D"mailto:Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org">Nouveau-PD4FTy7X32mqWrfYKbYh0A@public.gmane.org=
ktop.org</a><br>
&gt; <a href=3D"https://lists.freedesktop.org/mailman/listinfo/nouveau" rel=
=3D"noreferrer" target=3D"_blank">https://lists.freedesktop.org/mailman/lis=
tinfo/nouveau</a><br>
</blockquote></div>

--001a113fa3fe4fb913052e1b22aa--

--===============0443809604==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0443809604==--
