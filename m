From: Fernando Sahmkow <fsahmkow27-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Render Targets and Pitch Linear Textures in
 Maxwell/Pascal Question
Date: Fri, 1 Feb 2019 18:22:36 -0400
Message-ID: <CA+MSTo8A59Kw4n6eF77OC7tVLQBbBcnogpaPQKKkX8Lyyvy6rQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0154132883=="
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

--===============0154132883==
Content-Type: multipart/alternative; boundary="0000000000004564f50580dc95ca"

--0000000000004564f50580dc95ca
Content-Type: text/plain; charset="UTF-8"

So I have been going on over the documentation trying to figure out the
exact layout of Pitch Linear Textures and find some missing values.

First Question: What's the correct layout of pitch linear textures in
memory? Is padding of the pitch added at start or at the end? Do they have
some kind of header? Currently I see them as a normal texture matrix with
just pitch at the end of each row but If I send the game this values, they
go into an ternal loop.

Second Question: Pitch Value in Render Targets. In the registers in
https://github.com/envytools/envytools/blob/master/rnndb/graph/gf100_3d.xml#L282
the pitch does not appear anywhere, where is it stored for Render Targets.

Thanks in advance and I hope you guys can provide me some info.

--0000000000004564f50580dc95ca
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">So I have been going on over the document=
ation trying to figure out the exact layout of Pitch Linear Textures and fi=
nd some missing values.<div><br></div><div>First Question: What&#39;s the c=
orrect layout of pitch linear textures in memory? Is padding of the pitch a=
dded at start or at the end? Do they have some kind of header? Currently I =
see them as a normal texture matrix with just pitch at the end of each row =
but If I send the game this values, they go into an ternal loop.</div><div>=
<br></div><div>Second Question: Pitch Value in Render Targets. In the regis=
ters in=C2=A0<a href=3D"https://github.com/envytools/envytools/blob/master/=
rnndb/graph/gf100_3d.xml#L282">https://github.com/envytools/envytools/blob/=
master/rnndb/graph/gf100_3d.xml#L282</a> the pitch does not appear anywhere=
, where is it stored for Render Targets.</div><div><br></div><div>Thanks in=
 advance and I hope you guys can provide me some info.</div></div></div>

--0000000000004564f50580dc95ca--

--===============0154132883==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0154132883==--
