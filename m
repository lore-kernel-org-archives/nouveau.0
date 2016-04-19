From: Daniel Melo Jorge da Cunha <dmjcunha-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: more one question regarding gl and nouveau
Date: Tue, 19 Apr 2016 11:01:58 -0400
Message-ID: <CANbfre7816jaediY_BF7+-KqunZuT-PxTPyvymSvXWmp=ksm0A@mail.gmail.com>
References: <CANbfre6wFU1rfeWuoQpB-KxdgfhWS=TCoKyhVgCAh-Fz6JTNUg@mail.gmail.com>
 <CAKb7UvjLUJScWX+6x8ov=PP+WVGYueyc30yYLKrGVBNzbEg20w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2045908796=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAKb7UvjLUJScWX+6x8ov=PP+WVGYueyc30yYLKrGVBNzbEg20w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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

--===============2045908796==
Content-Type: multipart/alternative; boundary=001a1139c8f83e17df0530d7c29f

--001a1139c8f83e17df0530d7c29f
Content-Type: text/plain; charset=UTF-8

Hi Ilia, you were straight to the point for me in:

"src/mesa/vbo will upload it to a vbo. The driver then points the
hardware at the vbo and tells it to read from there."

But where is it the function that implements this? Is it in
nv30_draw_vbo(...)? Please, give me a function name or
at least a file name?

2016-04-19 10:04 GMT-04:00 Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>:

> On Tue, Apr 19, 2016 at 8:52 AM, Daniel Melo Jorge da Cunha
> <dmjcunha-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > Hi, for example, if I have glVertex3f(0.75, 0.75, 1.0) how the video card
> > processes
> > these three floats? Does the card work with floats? Does (mesa? gallium?
> > driver?)
> > process these three input floats before it is sent to the card? Where is
> the
> > code
> > for it?
>
> src/mesa/vbo will upload it to a vbo. The driver then points the
> hardware at the vbo and tells it to read from there. (Under some
> circumstances, the vbo data might have to be transformed on the cpu as
> well if the driver can't handle the format.)
>
> >
> > If you say the floats are memory mapped as in
> > exec->vtx.buffer_map = (GLfloat *)ctx->Driver.MapBufferRange(...) I would
> > say
> > from what I learned that it has to pass through gallium and that means:
> > st_draw_vbo(...) ending up in nv30_draw_vbo(..) but these functions don't
> > make
> > any reference to those (memory mapped) input floats. So where is the
> piece
> > of
> > code that instructs the card to fetch those three (possibly processed)
> input
> > floats
> > and send them to the card?
> >
> > Thanks in advance.
>
> The vbo module converts this to the equivalent of
>
> glGenBuffers(1, &buf)
> glBindBuffer(GL_ARRAY_BUFFER, buf)
> glBufferData(GL_ARRAY_BUFFER, ...)
> foo = glMapBuffer(buf)
> write vertex values to foo
> glVertexAttribPointer(0, 3, GL_FLOAT, GL_FALSE, 0, 0);
> draw
>
> Hope that helps,
>
>   -ilia
>

--001a1139c8f83e17df0530d7c29f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div>Hi Ilia, you were straight to the point for=
 me in:<br><br>&quot;src/mesa/vbo will upload it to a vbo. The driver then =
points the<br>
hardware at the vbo and tells it to read from there.&quot;<br><br></div>But=
 where is it the function that implements this? Is it in<br></div>nv30_draw=
_vbo(...)? Please, give me a function name or<br></div>at least a file name=
?<br></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">2016-0=
4-19 10:04 GMT-04:00 Ilia Mirkin <span dir=3D"ltr">&lt;<a href=3D"mailto:im=
irkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org" target=3D"_blank">imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org</a>&gt;</span>:<=
br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex"><span class=3D"">On Tue, Apr 19, 2016 at =
8:52 AM, Daniel Melo Jorge da Cunha<br>
&lt;<a href=3D"mailto:dmjcunha-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org">dmjcunha-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>&gt; wrote:=
<br>
&gt; Hi, for example, if I have glVertex3f(0.75, 0.75, 1.0) how the video c=
ard<br>
&gt; processes<br>
&gt; these three floats? Does the card work with floats? Does (mesa? galliu=
m?<br>
&gt; driver?)<br>
&gt; process these three input floats before it is sent to the card? Where =
is the<br>
&gt; code<br>
&gt; for it?<br>
<br>
</span>src/mesa/vbo will upload it to a vbo. The driver then points the<br>
hardware at the vbo and tells it to read from there. (Under some<br>
circumstances, the vbo data might have to be transformed on the cpu as<br>
well if the driver can&#39;t handle the format.)<br>
<span class=3D""><br>
&gt;<br>
&gt; If you say the floats are memory mapped as in<br>
&gt; exec-&gt;vtx.buffer_map =3D (GLfloat *)ctx-&gt;Driver.MapBufferRange(.=
..) I would<br>
&gt; say<br>
&gt; from what I learned that it has to pass through gallium and that means=
:<br>
&gt; st_draw_vbo(...) ending up in nv30_draw_vbo(..) but these functions do=
n&#39;t<br>
&gt; make<br>
&gt; any reference to those (memory mapped) input floats. So where is the p=
iece<br>
&gt; of<br>
&gt; code that instructs the card to fetch those three (possibly processed)=
 input<br>
&gt; floats<br>
&gt; and send them to the card?<br>
&gt;<br>
&gt; Thanks in advance.<br>
<br>
</span>The vbo module converts this to the equivalent of<br>
<br>
glGenBuffers(1, &amp;buf)<br>
glBindBuffer(GL_ARRAY_BUFFER, buf)<br>
glBufferData(GL_ARRAY_BUFFER, ...)<br>
foo =3D glMapBuffer(buf)<br>
write vertex values to foo<br>
glVertexAttribPointer(0, 3, GL_FLOAT, GL_FALSE, 0, 0);<br>
draw<br>
<br>
Hope that helps,<br>
<br>
=C2=A0 -ilia<br>
</blockquote></div><br></div>

--001a1139c8f83e17df0530d7c29f--

--===============2045908796==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============2045908796==--
