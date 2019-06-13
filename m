From: Fernando Sahmkow <fsahmkow27-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Question on interoperability with Nouveau
Date: Thu, 13 Jun 2019 09:42:09 -0400
Message-ID: <CA+MSTo-h0aOj25dJNmoavQvRLTjEEekKFVSV3ixdLLcZwmJ_dQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0414508906=="
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

--===============0414508906==
Content-Type: multipart/alternative; boundary="000000000000f55f35058b34b265"

--000000000000f55f35058b34b265
Content-Type: text/plain; charset="UTF-8"

Hi guys again. A homebrew developer (homebrew is custom software made for
the switch using openGL under nouveau) reported to me that 'glGenerateMipmap'
wasn't working on yuzu (Nintendo Switch emulator). I looked into it and I
noticed all the triangle data used by nouveau to render the mipmaps was all
zeroed out, meaning that probably we don't implement the mechanism you guys
use to upload that data.

How can I track this in your code and know what you guys use to upload the
triangles data into gpu memory ?

--000000000000f55f35058b34b265
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi guys again. A homebrew developer (homebrew is custom so=
ftware made for the switch using openGL under nouveau) reported to me that =
&#39;<span style=3D"background-color:transparent;font-family:SFMono-Regular=
,Consolas,&quot;Liberation Mono&quot;,Menlo,Courier,monospace;color:rgb(36,=
41,46);font-size:11.9px">glGenerateMipmap&#39; wasn&#39;t working on yuzu (=
Nintendo Switch emulator). I looked into it and I noticed all the triangle =
data used by nouveau to render the mipmaps was all zeroed out, meaning that=
 probably we don&#39;t implement the mechanism you guys use to upload that =
data.<br><br>How can I track this in your code and know what you guys use t=
o upload the triangles data into gpu memory ?</span><div dir=3D"ltr" class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature"></div></div>

--000000000000f55f35058b34b265--

--===============0414508906==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0414508906==--
