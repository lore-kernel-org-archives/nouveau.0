From: Fernando Sahmkow <fsahmkow27-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Questions on GPU syncpoint handling from inside the GPU
Date: Tue, 2 Apr 2019 11:11:49 -0400
Message-ID: <CA+MSTo9rS0orUXA2eAqmi8x143zL8y7xSs3zx4kTemRv9sWf4g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2122960962=="
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

--===============2122960962==
Content-Type: multipart/alternative; boundary="00000000000007805805858d8fce"

--00000000000007805805858d8fce
Content-Type: text/plain; charset="UTF-8"

Hi guys how are you doing? I have some questions on how the GPU handles
syncpoints from the commandlist.

I do know the register 0xB2 is the one written in the Maxwell3D Engine. As
far as I know bits 0:15 are the syncpoint id, bit 16 is unknown for me, bit
20 is increment? What other bits are set and what should be done on
increment?

Thanks in advance.

--00000000000007805805858d8fce
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi guys how are you doing? I have some questions on how th=
e GPU handles syncpoints from the commandlist.<div><br></div><div>I do know=
 the register 0xB2 is the one written in the Maxwell3D Engine. As far as I =
know bits 0:15 are the syncpoint id, bit 16 is unknown for me, bit 20 is in=
crement? What other bits are set and what should be done on increment?<div =
dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><d=
iv dir=3D"ltr"></div></div></div><div><br></div><div>Thanks in advance.</di=
v></div>

--00000000000007805805858d8fce--

--===============2122960962==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============2122960962==--
