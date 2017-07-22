From: Rhys Kidd <rhyskidd-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Nouveau driver for NVIDIA Quadro M620?
Date: Sat, 22 Jul 2017 13:47:38 -0400
Message-ID: <CA+iOQUGROJqDRpd-aAFNm_b2iBvR7HTYu3HESUicrcLg0DBGHg@mail.gmail.com>
References: <4c4e6209-1e00-3353-18b5-80fd7fc2ac6f@ucl.ac.uk>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0594636927=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <4c4e6209-1e00-3353-18b5-80fd7fc2ac6f-hclig2XLE9Zaa/9Udqfwiw@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Patrick Guio <p.guio-hclig2XLE9Zaa/9Udqfwiw@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============0594636927==
Content-Type: multipart/alternative; boundary="001a11435f16e797660554eb9306"

--001a11435f16e797660554eb9306
Content-Type: text/plain; charset="UTF-8"

On 18 July 2017 at 11:42, Patrick Guio <p.guio-hclig2XLE9Zaa/9Udqfwiw@public.gmane.org> wrote:

>
> Dear Nouveau developers,
>
> I have a Dell precision M3520 laptop and I have installed fedora 26 but
> the nouveau driver does not seem to recognise my graphic card NVIDIA
> Quadro M620. Indeed I can't see it in the llist of the supported card.
> Do you have any idea whether it will become available and when?
>

Not all typical online listings report that particular card, although I've
found one that notes the Quadro M620 is 1st generation Maxwell-series GPU
built on the GM107 architecture.

GM107 is reasonably well supported for basic bring up on nouveau. So
provided you are using a new enough Linux kernel (probably 4.11+) then you
should at least be able to bring up a display and run at the lowest power
state. However, there are certain use-cases, such as OpenCL / CUDA compute
that nouveau currently does not provide.

What is the exact problem you are having where the nouveau driver is not
recognising your graphics card?

A copy of your dmesg output may be helpful.



>
> Thank you for your help.
>
> All the best,
>
> Patrick
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
>

--001a11435f16e797660554eb9306
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 18 July 2017 at 11:42, Patrick Guio <span dir=3D"ltr">&=
lt;<a href=3D"mailto:p.guio-hclig2XLE9Zaa/9Udqfwiw@public.gmane.org" target=3D"_blank">p.guio-hclig2XLE9Zaa/9Udqfwiw@public.gmane.org</=
a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=3D"gmail_quot=
e"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex"><br>
Dear Nouveau developers,<br>
<br>
I have a Dell precision M3520 laptop and I have installed fedora 26 but<br>
the nouveau driver does not seem to recognise my graphic card NVIDIA<br>
Quadro M620. Indeed I can&#39;t see it in the llist of the supported card.<=
br>
Do you have any idea whether it will become available and when?<br></blockq=
uote><div><br></div><div>Not all typical online listings report that partic=
ular card, although I&#39;ve found one that notes the Quadro M620 is 1st ge=
neration Maxwell-series GPU built on the GM107 architecture.<br><br></div><=
div>GM107 is reasonably well supported for basic bring up on nouveau. So pr=
ovided you are using a new enough Linux kernel (probably 4.11+) then you sh=
ould at least be able to bring up a display and run at the lowest power sta=
te. However, there are certain use-cases, such as OpenCL / CUDA compute tha=
t nouveau currently does not provide.<br><br>What is the exact problem you =
are having where the nouveau driver is not recognising your graphics card?<=
br><br></div><div>A copy of your dmesg output may be helpful.<br></div><div=
><br>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Thank you for your help.<br>
<br>
All the best,<br>
<br>
Patrick<br>
______________________________<wbr>_________________<br>
Nouveau mailing list<br>
<a href=3D"mailto:Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org">Nouveau-PD4FTy7X32lNgt0PjOBp9/rsn8yoX9R0@public.gmane.org=
org</a><br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/nouveau" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.freedesktop.org/<wbr>mailman/lis=
tinfo/nouveau</a><br>
</blockquote></div><br></div></div>

--001a11435f16e797660554eb9306--

--===============0594636927==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0594636927==--
