From: Daniel Melo Jorge da Cunha <dmjcunha-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: a few questions about OpenGL and nouveau
Date: Tue, 5 Apr 2016 14:38:57 -0400
Message-ID: <CANbfre7Pb3fCVm21YdiHrw3QUXmyTVd7u9kMtG3VZTb0AeckiA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0476532202=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

--===============0476532202==
Content-Type: multipart/alternative; boundary=001a113a74f67cb5fb052fc1280d

--001a113a74f67cb5fb052fc1280d
Content-Type: text/plain; charset=UTF-8

Hi... I know... glBegin/glEnd is deprecated but I have an old computer
32bit CPU,
running fedora 19, mesa-9.2.4, NV63... any help are welcomed.

Please forgive if I misuderstood everything.

So I have a simple OpenGL program that draws a black background and a white
line... I will write the code of myline() inside of main() so as I can
learn.

main (..) {
X and glX stuff...

/* at this moment I think what was sent to the card was the
nv30_screen_create(...)
that valgrind--mmt outputs 0x4e000 in the first line of valgrind--mmt hex
until
PUSH_DATA (push, NV05_SIFM_COLOR_CONVERSION_TRUNCATE); which happens to be
line 65
of valgrind--mmt output */

glViewport(...);

void mydrawline(void)
{
    glClearColor(0.0, 0.0, 0.0, 1.0);
    glClear(GL_COLOR_BUFFER_BIT);

/* at this point I guess it ends up calling nv30_clear(...) which calls
BEGIN_NV04(push, NV30_3D(CLEAR_DEPTH_VALUE), 3); and the valgrind--mmt
output is
0xcfd8c in line 281 of the valgrind-mmt's output file.
As I can see there is 215 lines (from 66 to 280) of valgrind--mmt that I do
not know
from where is it coming. I could dig in nv30_state_validate(...) but at
this moment I
think nv30->dirty is 0 so validate->func(nv30) is not called. Help,
please.*/


/* This I guess is mesa stuff... */
    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();
    glOrtho(0, 300, 0, 300, -1, 1);
    glMatrixMode(GL_MODELVIEW);

/*Here another question. Does glBegin end up calling a driver code like
BEGIN_NV04(...) that instructs the card to get the next 3 floats for color
more 3 for the first vertex and another 3 for the other? Also at this moment
the video card memory is already mapped (I guess...) so are these floats
fetched
by the pusher of the card and draw the line, possibly when glXSwapBuffers
is called?
Is the glColor(...) (the three floats) stored in the mmapped twice, one for
each
vertex? HELP I'M LOST :( This mine consideration is wrong... I guess...
st_draw.c
coments that all "rendering" is done through st_draw_vbo() which would end
up
calling nv30_draw_vbo() which would send data to the card... but where is
the
missing link?? The floats (for the vertices and color) are already mapped by
ctx->Driver.MapBufferRange...*/

    glBegin(GL_LINES);
    glColor3f(1.0, 1.0, 1.0);
    glVertex3f(0.0f, 0.0f, 0.0f);
    glVertex3f(50.0f, 50.0f, 1.0f);
    glEnd();
}

glXSwapBuffers();
}

Thanks in advance.

--001a113a74f67cb5fb052fc1280d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi... I know... glBegin/glEnd is deprecated but I have an =
old computer 32bit CPU,<br>running fedora 19, mesa-9.2.4, NV63... any help =
are welcomed.<br><br>Please forgive if I misuderstood everything.<br><br>So=
 I have a simple OpenGL program that draws a black background and a white<b=
r>line... I will write the code of myline() inside of main() so as I can le=
arn.<br><br>main (..) {<br>X and glX stuff...<br><br>/* at this moment I th=
ink what was sent to the card was the nv30_screen_create(...)<br>that valgr=
ind--mmt outputs 0x4e000 in the first line of valgrind--mmt hex until<br>PU=
SH_DATA (push, NV05_SIFM_COLOR_CONVERSION_TRUNCATE); which happens to be li=
ne 65<br>of valgrind--mmt output */<br><br>glViewport(...);<br><br>void myd=
rawline(void)<br>{<br>=C2=A0=C2=A0=C2=A0 glClearColor(0.0, 0.0, 0.0, 1.0);<=
br>=C2=A0=C2=A0=C2=A0 glClear(GL_COLOR_BUFFER_BIT);<br><br>/* at this point=
 I guess it ends up calling nv30_clear(...) which calls<br>BEGIN_NV04(push,=
 NV30_3D(CLEAR_DEPTH_VALUE), 3); and the valgrind--mmt output is<br>0xcfd8c=
 in line 281 of the valgrind-mmt&#39;s output file. <br>As I can see there =
is 215 lines (from 66 to 280) of valgrind--mmt that I do not know<br>from w=
here is it coming. I could dig in nv30_state_validate(...) but at this mome=
nt I<br>think nv30-&gt;dirty is 0 so validate-&gt;func(nv30) is not called.=
 Help, please.*/<br><br><br>/* This I guess is mesa stuff... */<br>=C2=A0=
=C2=A0=C2=A0 glMatrixMode(GL_PROJECTION);<br>=C2=A0=C2=A0=C2=A0 glLoadIdent=
ity();<br>=C2=A0=C2=A0=C2=A0 glOrtho(0, 300, 0, 300, -1, 1);<br>=C2=A0=C2=
=A0=C2=A0 glMatrixMode(GL_MODELVIEW);<br><br>/*Here another question. Does =
glBegin end up calling a driver code like<br>BEGIN_NV04(...) that instructs=
 the card to get the next 3 floats for color<br>more 3 for the first vertex=
 and another 3 for the other? Also at this moment<br>the video card memory =
is already mapped (I guess...) so are these floats fetched<br>by the pusher=
 of the card and draw the line, possibly when glXSwapBuffers is called?<br>=
Is the glColor(...) (the three floats) stored in the mmapped twice, one for=
 each<br>vertex? HELP I&#39;M LOST :( This mine consideration is wrong... I=
 guess... st_draw.c<br>coments that all &quot;rendering&quot; is done throu=
gh st_draw_vbo() which would end up<br>calling nv30_draw_vbo() which would =
send data to the card... but where is the<br>missing link?? The floats (for=
 the vertices and color) are already mapped by<br>ctx-&gt;Driver.MapBufferR=
ange...*/<br><br>=C2=A0=C2=A0=C2=A0 glBegin(GL_LINES);<br>=C2=A0=C2=A0=C2=
=A0 glColor3f(1.0, 1.0, 1.0);<br>=C2=A0=C2=A0=C2=A0 glVertex3f(0.0f, 0.0f, =
0.0f);<br>=C2=A0=C2=A0=C2=A0 glVertex3f(50.0f, 50.0f, 1.0f);<br>=C2=A0=C2=
=A0=C2=A0 glEnd();<br>}<br><br>glXSwapBuffers();<br>}<br><br>Thanks in adva=
nce.<br></div>

--001a113a74f67cb5fb052fc1280d--

--===============0476532202==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0476532202==--
