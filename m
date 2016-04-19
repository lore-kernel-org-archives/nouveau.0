From: Daniel Melo Jorge da Cunha <dmjcunha-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: more one question regarding gl and nouveau
Date: Tue, 19 Apr 2016 08:52:18 -0400
Message-ID: <CANbfre6wFU1rfeWuoQpB-KxdgfhWS=TCoKyhVgCAh-Fz6JTNUg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0778946088=="
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

--===============0778946088==
Content-Type: multipart/alternative; boundary=001a114d7b868513c40530d5f248

--001a114d7b868513c40530d5f248
Content-Type: text/plain; charset=UTF-8

Hi, for example, if I have glVertex3f(0.75, 0.75, 1.0) how the video card
processes
these three floats? Does the card work with floats? Does (mesa? gallium?
driver?)
process these three input floats before it is sent to the card? Where is
the code
for it?

If you say the floats are memory mapped as in
exec->vtx.buffer_map = (GLfloat *)ctx->Driver.MapBufferRange(...) I would
say
from what I learned that it has to pass through gallium and that means:
st_draw_vbo(...) ending up in nv30_draw_vbo(..) but these functions don't
make
any reference to those (memory mapped) input floats. So where is the piece
of
code that instructs the card to fetch those three (possibly processed)
input floats
and send them to the card?

Thanks in advance.

--001a114d7b868513c40530d5f248
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><div><div><div><div><div><div>Hi, for examp=
le, if I have glVertex3f(0.75, 0.75, 1.0) how the video card processes<br><=
/div>these three floats? Does the card work with floats? Does (mesa? galliu=
m? driver?)<br></div>process these three input floats before it is sent to =
the card? Where is the code<br></div>for it?<br><br></div>If you say the fl=
oats are memory mapped as in<br>exec-&gt;vtx.buffer_map =3D (GLfloat *)ctx-=
&gt;Driver.MapBufferRange(...) I would say<br></div>from what I learned tha=
t it has to pass through gallium and that means:<br></div>st_draw_vbo(...) =
ending up in nv30_draw_vbo(..) but these functions don&#39;t make<br></div>=
any reference to those (memory mapped) input floats. So where is the piece =
of<br></div>code that instructs the card to fetch those three (possibly pro=
cessed) input floats<br></div><div>and send them to the card?<br></div><div=
><br></div>Thanks in advance.<br></div>

--001a114d7b868513c40530d5f248--

--===============0778946088==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0778946088==--
