From: Daniel Melo Jorge da Cunha <dmjcunha-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: a few questions about OpenGL and nouveau
Date: Tue, 5 Apr 2016 15:26:05 -0400
Message-ID: <CANbfre6ciZR0ViV-2n-X9WUmoQjqsPW9m0SPzZQd8yxj5JxjEg@mail.gmail.com>
References: <CANbfre7Pb3fCVm21YdiHrw3QUXmyTVd7u9kMtG3VZTb0AeckiA@mail.gmail.com>
 <CAKb7UvjJJxWAnbw7qdofKW7WpdtWKce-OsSLCTZeAe_KZGQAOw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0054083388=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAKb7UvjJJxWAnbw7qdofKW7WpdtWKce-OsSLCTZeAe_KZGQAOw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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

--===============0054083388==
Content-Type: multipart/alternative; boundary=001a1144c44c002aa5052fc1d126

--001a1144c44c002aa5052fc1d126
Content-Type: text/plain; charset=UTF-8

Hi, TBH not even I know what do I want :)))

The "dirty...", "I think, but am not sure..." and "The gallium
state tracker..." paragraphs are enough "food for thought" for me.

I'll spend eons digging it... Thank you.

2016-04-05 14:54 GMT-04:00 Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>:

> On Tue, Apr 5, 2016 at 2:38 PM, Daniel Melo Jorge da Cunha
> <dmjcunha-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > Hi... I know... glBegin/glEnd is deprecated but I have an old computer
> 32bit
> > CPU,
> > running fedora 19, mesa-9.2.4, NV63... any help are welcomed.
>
> I've fixed a *ton* of nv3x/nv4x issues since then, I'd recommend
> giving Mesa 11.2.0 a whirl.
>
> >
> > Please forgive if I misuderstood everything.
> >
> > So I have a simple OpenGL program that draws a black background and a
> white
> > line... I will write the code of myline() inside of main() so as I can
> > learn.
> >
> > main (..) {
> > X and glX stuff...
> >
> > /* at this moment I think what was sent to the card was the
> > nv30_screen_create(...)
> > that valgrind--mmt outputs 0x4e000 in the first line of valgrind--mmt hex
> > until
>
> You'll want to use demmt, part of envytools. It should auto-decode
> stuff. If it doesn't, let me know (and send me the mmt).
>
> > PUSH_DATA (push, NV05_SIFM_COLOR_CONVERSION_TRUNCATE); which happens to
> be
> > line 65
> > of valgrind--mmt output */
> >
> > glViewport(...);
> >
> > void mydrawline(void)
> > {
> >     glClearColor(0.0, 0.0, 0.0, 1.0);
> >     glClear(GL_COLOR_BUFFER_BIT);
> >
> > /* at this point I guess it ends up calling nv30_clear(...) which calls
> > BEGIN_NV04(push, NV30_3D(CLEAR_DEPTH_VALUE), 3); and the valgrind--mmt
> > output is
> > 0xcfd8c in line 281 of the valgrind-mmt's output file.
> > As I can see there is 215 lines (from 66 to 280) of valgrind--mmt that I
> do
> > not know
> > from where is it coming. I could dig in nv30_state_validate(...) but at
> this
> > moment I
> > think nv30->dirty is 0 so validate->func(nv30) is not called. Help,
> > please.*/
>
> dirty definitely shouldn't be 0... it has to bind a framebuffer at least.
>
> >
> >
> > /* This I guess is mesa stuff... */
> >     glMatrixMode(GL_PROJECTION);
> >     glLoadIdentity();
> >     glOrtho(0, 300, 0, 300, -1, 1);
> >     glMatrixMode(GL_MODELVIEW);
> >
> > /*Here another question. Does glBegin end up calling a driver code like
> > BEGIN_NV04(...) that instructs the card to get the next 3 floats for
> color
> > more 3 for the first vertex and another 3 for the other? Also at this
> moment
> > the video card memory is already mapped (I guess...) so are these floats
> > fetched
> > by the pusher of the card and draw the line, possibly when
> glXSwapBuffers is
> > called?
> > Is the glColor(...) (the three floats) stored in the mmapped twice, one
> for
> > each
> > vertex?
>
> I think, but am not sure, that it will come in as a constant attribute
> (i.e. a VBO attribute with stride 0).
>
> > HELP I'M LOST :( This mine consideration is wrong... I guess...
> > st_draw.c
> > coments that all "rendering" is done through st_draw_vbo() which would
> end
> > up
> > calling nv30_draw_vbo() which would send data to the card... but where is
> > the
> > missing link?? The floats (for the vertices and color) are already
> mapped by
> > ctx->Driver.MapBufferRange...*/
>
> The gallium state tracker does not support immediate vertex
> submission. There's a "vbo" layer in front of it which converts
> immediate vertex submissions into writes to a VBO, which is then bound
> and drawn with.
>
> You may be interested in doing GALLIUM_TRACE=foo.xml [on a debug mesa
> build] which will create an xml file of all the state tracker calls.
> It will show you the VBO setup, etc.
>
> State is only emitted at draw time (or something like blits, clears,
> etc). So doing glViewport() does nothing. It dirties internal state,
> which is then emitted at draw time.
>
> TBH I'm not sure what your actual question is... but hope I've
> answered at least some of it?
>
>   -ilia
>

--001a1144c44c002aa5052fc1d126
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>Hi, TBH not even I know what do I want :)))<br><=
br></div>The &quot;dirty...&quot;, &quot;I think, but am not sure...&quot; =
and &quot;The gallium<br>state tracker...&quot; paragraphs are enough &quot=
;food for thought&quot; for me.<br><br></div><div>I&#39;ll spend eons diggi=
ng it... Thank you.<br></div></div><div class=3D"gmail_extra"><br><div clas=
s=3D"gmail_quote">2016-04-05 14:54 GMT-04:00 Ilia Mirkin <span dir=3D"ltr">=
&lt;<a href=3D"mailto:imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org" target=3D"_blank">imirkin@alum.=
mit.edu</a>&gt;</span>:<br><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">=
On Tue, Apr 5, 2016 at 2:38 PM, Daniel Melo Jorge da Cunha<br>
&lt;<a href=3D"mailto:dmjcunha-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org">dmjcunha-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>&gt; wrote:=
<br>
&gt; Hi... I know... glBegin/glEnd is deprecated but I have an old computer=
 32bit<br>
&gt; CPU,<br>
&gt; running fedora 19, mesa-9.2.4, NV63... any help are welcomed.<br>
<br>
</span>I&#39;ve fixed a *ton* of nv3x/nv4x issues since then, I&#39;d recom=
mend<br>
giving Mesa 11.2.0 a whirl.<br>
<span class=3D""><br>
&gt;<br>
&gt; Please forgive if I misuderstood everything.<br>
&gt;<br>
&gt; So I have a simple OpenGL program that draws a black background and a =
white<br>
&gt; line... I will write the code of myline() inside of main() so as I can=
<br>
&gt; learn.<br>
&gt;<br>
&gt; main (..) {<br>
&gt; X and glX stuff...<br>
&gt;<br>
&gt; /* at this moment I think what was sent to the card was the<br>
&gt; nv30_screen_create(...)<br>
&gt; that valgrind--mmt outputs 0x4e000 in the first line of valgrind--mmt =
hex<br>
&gt; until<br>
<br>
</span>You&#39;ll want to use demmt, part of envytools. It should auto-deco=
de<br>
stuff. If it doesn&#39;t, let me know (and send me the mmt).<br>
<span class=3D""><br>
&gt; PUSH_DATA (push, NV05_SIFM_COLOR_CONVERSION_TRUNCATE); which happens t=
o be<br>
&gt; line 65<br>
&gt; of valgrind--mmt output */<br>
&gt;<br>
&gt; glViewport(...);<br>
&gt;<br>
&gt; void mydrawline(void)<br>
&gt; {<br>
&gt;=C2=A0 =C2=A0 =C2=A0glClearColor(0.0, 0.0, 0.0, 1.0);<br>
&gt;=C2=A0 =C2=A0 =C2=A0glClear(GL_COLOR_BUFFER_BIT);<br>
&gt;<br>
&gt; /* at this point I guess it ends up calling nv30_clear(...) which call=
s<br>
&gt; BEGIN_NV04(push, NV30_3D(CLEAR_DEPTH_VALUE), 3); and the valgrind--mmt=
<br>
&gt; output is<br>
&gt; 0xcfd8c in line 281 of the valgrind-mmt&#39;s output file.<br>
&gt; As I can see there is 215 lines (from 66 to 280) of valgrind--mmt that=
 I do<br>
&gt; not know<br>
&gt; from where is it coming. I could dig in nv30_state_validate(...) but a=
t this<br>
&gt; moment I<br>
&gt; think nv30-&gt;dirty is 0 so validate-&gt;func(nv30) is not called. He=
lp,<br>
&gt; please.*/<br>
<br>
</span>dirty definitely shouldn&#39;t be 0... it has to bind a framebuffer =
at least.<br>
<span class=3D""><br>
&gt;<br>
&gt;<br>
&gt; /* This I guess is mesa stuff... */<br>
&gt;=C2=A0 =C2=A0 =C2=A0glMatrixMode(GL_PROJECTION);<br>
&gt;=C2=A0 =C2=A0 =C2=A0glLoadIdentity();<br>
&gt;=C2=A0 =C2=A0 =C2=A0glOrtho(0, 300, 0, 300, -1, 1);<br>
&gt;=C2=A0 =C2=A0 =C2=A0glMatrixMode(GL_MODELVIEW);<br>
&gt;<br>
&gt; /*Here another question. Does glBegin end up calling a driver code lik=
e<br>
&gt; BEGIN_NV04(...) that instructs the card to get the next 3 floats for c=
olor<br>
&gt; more 3 for the first vertex and another 3 for the other? Also at this =
moment<br>
&gt; the video card memory is already mapped (I guess...) so are these floa=
ts<br>
&gt; fetched<br>
&gt; by the pusher of the card and draw the line, possibly when glXSwapBuff=
ers is<br>
&gt; called?<br>
&gt; Is the glColor(...) (the three floats) stored in the mmapped twice, on=
e for<br>
&gt; each<br>
&gt; vertex?<br>
<br>
</span>I think, but am not sure, that it will come in as a constant attribu=
te<br>
(i.e. a VBO attribute with stride 0).<br>
<span class=3D""><br>
&gt; HELP I&#39;M LOST :( This mine consideration is wrong... I guess...<br=
>
&gt; st_draw.c<br>
&gt; coments that all &quot;rendering&quot; is done through st_draw_vbo() w=
hich would end<br>
&gt; up<br>
&gt; calling nv30_draw_vbo() which would send data to the card... but where=
 is<br>
&gt; the<br>
&gt; missing link?? The floats (for the vertices and color) are already map=
ped by<br>
&gt; ctx-&gt;Driver.MapBufferRange...*/<br>
<br>
</span>The gallium state tracker does not support immediate vertex<br>
submission. There&#39;s a &quot;vbo&quot; layer in front of it which conver=
ts<br>
immediate vertex submissions into writes to a VBO, which is then bound<br>
and drawn with.<br>
<br>
You may be interested in doing GALLIUM_TRACE=3Dfoo.xml [on a debug mesa<br>
build] which will create an xml file of all the state tracker calls.<br>
It will show you the VBO setup, etc.<br>
<br>
State is only emitted at draw time (or something like blits, clears,<br>
etc). So doing glViewport() does nothing. It dirties internal state,<br>
which is then emitted at draw time.<br>
<br>
TBH I&#39;m not sure what your actual question is... but hope I&#39;ve<br>
answered at least some of it?<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
=C2=A0 -ilia<br>
</font></span></blockquote></div><br></div>

--001a1144c44c002aa5052fc1d126--

--===============0054083388==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0054083388==--
