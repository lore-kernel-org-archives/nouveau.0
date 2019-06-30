From: Fernando Sahmkow <fsahmkow27-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Question on Conditional Rendering Maxwell/Pascal
Date: Sun, 30 Jun 2019 18:54:57 -0400
Message-ID: <CA+MSTo_HoKD2vxF68oJm6OpVf76Uy9shmB2itBucYv4CJj8VEg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1755129873=="
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
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============1755129873==
Content-Type: multipart/alternative; boundary="0000000000002c0ed5058c9267db"

--0000000000002c0ed5058c9267db
Content-Type: text/plain; charset="UTF-8"

So we are currently doing tests and complying with them in our Emulator.
Currently the conditional rendering test does not pass (no wonder we not
even implement it). I've been looking at the current documentation
https://github.com/envytools/envytools/blob/master/rnndb/graph/gf100_3d.xml#L796
So
far I don't understand how the cond address is used and to what it's
compared.
https://github.com/envytools/envytools/blob/0d91b8bcef3ceb47ff0b114025d301edb790d472/rnndb/g80_defs.xml#L61

It says it uses 2 queries, how do I know which query it's talking off and
what it's the comparison that should be done.

Also, does failing conditional rendering makes registers not write into the
engine or just drawcalls/claers are ignored?

--0000000000002c0ed5058c9267db
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">So we are currently doing tests and complying with them in=
 our Emulator. Currently the conditional rendering test does not pass (no w=
onder we not even implement it). I&#39;ve been looking at the current docum=
entation=C2=A0<a href=3D"https://github.com/envytools/envytools/blob/master=
/rnndb/graph/gf100_3d.xml#L796">https://github.com/envytools/envytools/blob=
/master/rnndb/graph/gf100_3d.xml#L796</a>=C2=A0So far I don&#39;t understan=
d how the cond address is used and to what it&#39;s compared.=C2=A0<a href=
=3D"https://github.com/envytools/envytools/blob/0d91b8bcef3ceb47ff0b114025d=
301edb790d472/rnndb/g80_defs.xml#L61">https://github.com/envytools/envytool=
s/blob/0d91b8bcef3ceb47ff0b114025d301edb790d472/rnndb/g80_defs.xml#L61</a><=
div><br></div><div>It says it uses 2 queries, how do I know which query it&=
#39;s talking off and what it&#39;s the comparison that should be done.</di=
v><div><br></div><div>Also, does failing conditional rendering makes regist=
ers not write into the engine or just drawcalls/claers are ignored?</div></=
div>

--0000000000002c0ed5058c9267db--

--===============1755129873==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1755129873==--
