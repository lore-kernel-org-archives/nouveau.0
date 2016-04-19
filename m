From: Daniel Melo Jorge da Cunha <dmjcunha-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: more one question regarding gl and nouveau
Date: Tue, 19 Apr 2016 13:28:00 -0400
Message-ID: <CANbfre6KCS9y3JtoN9kcjyoPpZjTBo1yKWfZ=0grkTFUzv86uw@mail.gmail.com>
References: <CANbfre6wFU1rfeWuoQpB-KxdgfhWS=TCoKyhVgCAh-Fz6JTNUg@mail.gmail.com>
 <CAKb7UvjLUJScWX+6x8ov=PP+WVGYueyc30yYLKrGVBNzbEg20w@mail.gmail.com>
 <CANbfre7816jaediY_BF7+-KqunZuT-PxTPyvymSvXWmp=ksm0A@mail.gmail.com>
 <CAKb7Uvi9wiP9m=ixH_Y9D8HRxmMpAAgwUWoVcayt2vC45w5+yQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0117003515=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAKb7Uvi9wiP9m=ixH_Y9D8HRxmMpAAgwUWoVcayt2vC45w5+yQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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

--===============0117003515==
Content-Type: multipart/alternative; boundary=001a113535a28391e20530d9cc2c

--001a113535a28391e20530d9cc2c
Content-Type: text/plain; charset=UTF-8

Wow! Things go deep... :)
Thank you very much.

2016-04-19 11:44 GMT-04:00 Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>:

> On Tue, Apr 19, 2016 at 11:01 AM, Daniel Melo Jorge da Cunha
> <dmjcunha-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > Hi Ilia, you were straight to the point for me in:
> >
> > "src/mesa/vbo will upload it to a vbo. The driver then points the
> > hardware at the vbo and tells it to read from there."
> >
> > But where is it the function that implements this? Is it in
> > nv30_draw_vbo(...)? Please, give me a function name or
> > at least a file name?
>
> Before draw_vbo is called, the vbo will have been set up via
> pipe->bind_vertex_elements_state and pipe->set_vertex_buffers. The
> draw call will then validate those, by calling nv30_state_validate (or
> something along those lines) which will look at all the dirtied state
> and write that out to hw.
>
> There are also funny interactions with translate... for formats that
> aren't directly supported.
>
>   -ilia
>

--001a113535a28391e20530d9cc2c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Wow! Things go deep... :)<br></div>Thank you very muc=
h.<br></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">2016-=
04-19 11:44 GMT-04:00 Ilia Mirkin <span dir=3D"ltr">&lt;<a href=3D"mailto:i=
mirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org" target=3D"_blank">imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org</a>&gt;</span>:=
<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex"><span class=3D"">On Tue, Apr 19, 2016 at=
 11:01 AM, Daniel Melo Jorge da Cunha<br>
&lt;<a href=3D"mailto:dmjcunha-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org">dmjcunha-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>&gt; wrote:=
<br>
&gt; Hi Ilia, you were straight to the point for me in:<br>
&gt;<br>
&gt; &quot;src/mesa/vbo will upload it to a vbo. The driver then points the=
<br>
&gt; hardware at the vbo and tells it to read from there.&quot;<br>
&gt;<br>
&gt; But where is it the function that implements this? Is it in<br>
&gt; nv30_draw_vbo(...)? Please, give me a function name or<br>
&gt; at least a file name?<br>
<br>
</span>Before draw_vbo is called, the vbo will have been set up via<br>
pipe-&gt;bind_vertex_elements_state and pipe-&gt;set_vertex_buffers. The<br=
>
draw call will then validate those, by calling nv30_state_validate (or<br>
something along those lines) which will look at all the dirtied state<br>
and write that out to hw.<br>
<br>
There are also funny interactions with translate... for formats that<br>
aren&#39;t directly supported.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
=C2=A0 -ilia<br>
</font></span></blockquote></div><br></div>

--001a113535a28391e20530d9cc2c--

--===============0117003515==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0117003515==--
