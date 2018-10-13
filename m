From: Fernando Sahmkow <fsahmkow27-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Question on Render Targets Register: Array Mode
Date: Sat, 13 Oct 2018 17:40:02 -0400
Message-ID: <CA+MSTo83b+J2==2+35rfCa9Jvx0EuYCOm1_htrwHAFyL+SD5hA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0670653431=="
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

--===============0670653431==
Content-Type: multipart/alternative; boundary="0000000000009446180578230c43"

--0000000000009446180578230c43
Content-Type: text/plain; charset="UTF-8"

So there's a register in Render Targets called Array Mode:
https://github.com/envytools/envytools/blob/master/rnndb/graph/gf100_3d.xml#L289

We've witnessed values of 1 and 6 (array mode -> layers) but we can't tell
their meaning. Do you guys got any related info?

Thanks in advance.

--0000000000009446180578230c43
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">So there&#39;s a register in Render Targe=
ts called Array Mode:<div><a href=3D"https://github.com/envytools/envytools=
/blob/master/rnndb/graph/gf100_3d.xml#L289">https://github.com/envytools/en=
vytools/blob/master/rnndb/graph/gf100_3d.xml#L289</a></div><div><br></div><=
div>We&#39;ve witnessed values of 1 and 6 (array mode -&gt; layers) but we =
can&#39;t tell their meaning. Do you guys got any related info?</div><div><=
br></div><div>Thanks in advance.<div dir=3D"ltr" class=3D"gmail_signature">=
</div></div></div></div>

--0000000000009446180578230c43--

--===============0670653431==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0670653431==--
