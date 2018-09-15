From: =?UTF-8?B?0JDQu9C10LrRgdC10Lkg0JPRg9Cx0YHQutC40Lk=?=
 <a.gubskiy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: pstate changing
Date: Sat, 15 Sep 2018 09:18:35 +0300
Message-ID: <CAF4qy4+24=nK1PranU17d9JMS-G=Awb29hSmTko1+e7GYksbeA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0834145977=="
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

--===============0834145977==
Content-Type: multipart/alternative; boundary="000000000000a57ade0575e2e9ba"

--000000000000a57ade0575e2e9ba
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Greetings!
I have very old notebook with 8400M Gs.
And I'm experience some overheating on high clocks. I want to change pstate
for AC mode.
Currently I have
sudo cat /sys/kernel/debug/dri/0/pstate
20: core 169 MHz shader 338 MHz memory 100 MHz
21: core 275 MHz shader 550 MHz memory 200 MHz
22: core 400 MHz shader 800 MHz memory 400 MHz
AC: core 275 MHz shader 550 MHz memory 199 MHz

And I want to set AC to 20 instead of 21.
Could you please give me some advise how can I do this?
I'm running lubuntu 18.04

uname -a
Linux tashpc 4.15.0-33-generic #36-Ubuntu SMP Wed Aug 15 16:00:05 UTC 2018
x86_64 x86_64 x86_64 GNU/Linux
Thanks!

--=20
=D0=A1 =D1=83=D0=B2=D0=B0=D0=B6=D0=B5=D0=BD=D0=B8=D0=B5=D0=BC,
=D0=93=D1=83=D0=B1=D1=81=D0=BA=D0=B8=D0=B9 =D0=90=D0=BB=D0=B5=D0=BA=D1=81=
=D0=B5=D0=B9.

--000000000000a57ade0575e2e9ba
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Greetings!<div>I have very old notebook with 8400M Gs.</di=
v><div>And I&#39;m experience some overheating on high clocks. I want to ch=
ange pstate for AC mode.</div><div>Currently I have<br clear=3D"all"><div><=
div>sudo cat /sys/kernel/debug/dri/0/pstate</div><div>20: core 169 MHz shad=
er 338 MHz memory 100 MHz</div><div>21: core 275 MHz shader 550 MHz memory =
200 MHz</div><div>22: core 400 MHz shader 800 MHz memory 400 MHz</div><div>=
AC: core 275 MHz shader 550 MHz memory 199 MHz</div></div><div><br></div><d=
iv>And I want to set AC to 20 instead of 21.</div><div>Could you please giv=
e me some advise how can I do this?</div><div>I&#39;m running lubuntu 18.04=
</div><div><div><br></div><div>uname -a</div><div>Linux tashpc 4.15.0-33-ge=
neric #36-Ubuntu SMP Wed Aug 15 16:00:05 UTC 2018 x86_64 x86_64 x86_64 GNU/=
Linux</div></div><div>Thanks!</div></div><div><br></div>-- <br><div dir=3D"=
ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=
=3D"ltr"><div><div dir=3D"ltr"><div>=D0=A1 =D1=83=D0=B2=D0=B0=D0=B6=D0=B5=
=D0=BD=D0=B8=D0=B5=D0=BC,<br>=D0=93=D1=83=D0=B1=D1=81=D0=BA=D0=B8=D0=B9 =D0=
=90=D0=BB=D0=B5=D0=BA=D1=81=D0=B5=D0=B9.</div><div></div></div></div></div>=
</div></div>

--000000000000a57ade0575e2e9ba--

--===============0834145977==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0834145977==--
