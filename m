From: Rhys Kidd <rhyskidd-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: nouveau to gp104m
Date: Thu, 25 Jan 2018 22:28:48 -0500
Message-ID: <CA+iOQUEA5Q_jcX+bBsTcT-_MZn7Ge-oBf_nGWMTNetf=TXOf8Q@mail.gmail.com>
References: <SG2PR0301MB19491407D2ED77BC796DD053C9E10@SG2PR0301MB1949.apcprd03.prod.outlook.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0965195179=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <SG2PR0301MB19491407D2ED77BC796DD053C9E10-ojOI3mzuqf+xW1/gmettOy3djsjZacpUnBOFsp37pqbUKgpGm//BTAC/G2K4zDHf@public.gmane.org>
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

--===============0965195179==
Content-Type: multipart/alternative; boundary="94eb2c08ed98a6dd450563a57e58"

--94eb2c08ed98a6dd450563a57e58
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 25 January 2018 at 10:57, =E5=8D=83=E5=8D=83 =E5=A4=A7=E6=B0=B8 <aiolia_=
tdy3-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org> wrote:

> Hi,everyone
>
>           I use the centos 7 of 4.14.12-rt10 kernel with the GP104M
> [GeForce GTX 1070 Mobile] display card.BUT,I did not find the support of =
it
> in the nouveau drivers. I clone the branch 4.14 of nouveau.git. After
> compile it with my kernel ,I found the GP104m had been not support. Could=
 I
> get the newest updates? Thanks in advance
>
>
GP104 should be supported via your kernel (at least display and basic
acceleration).

You will also need to ensure you have the sufficiently current
linux-firmware files for the GP1xx series. See:
https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git=
/log/nvidia/gp104

There may also be particular bugs that you are experiencing early in the
boot process that prevent the system from booting to desktop normally. Once
you've ensured the prior steps are done, provide a link to your dmesg
output (kernel debug log) if you need assistance working out what is going
wrong.



>
> Best Wishes
>
> Aiolia
>
>
>
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
>
>

--94eb2c08ed98a6dd450563a57e58
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 25 January 2018 at 10:57, =E5=8D=83=E5=8D=83 =E5=A4=A7=
=E6=B0=B8 <span dir=3D"ltr">&lt;<a href=3D"mailto:aiolia_tdy3-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org" =
target=3D"_blank">aiolia_tdy3-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org</a>&gt;</span> wrote:<br><div cla=
ss=3D"gmail_extra"><div class=3D"gmail_quote"><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">




<div dir=3D"ltr">
<div style=3D"font-family:Calibri,Helvetica,sans-serif;font-size:12pt;color=
:rgb(0,0,0);background-color:transparent">
Hi,everyone<br>
<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 I use the centos 7 o=
f 4.14.12-rt10 kernel with the GP104M [GeForce GTX 1070 Mobile] display car=
d.BUT,I did not find the support of it in the nouveau drivers. I clone the =
branch 4.14 of nouveau.git. After compile it with my kernel ,I found the GP=
104m
 had been not support. Could I get the newest updates? Thanks in advance<br=
>
<br></div></div></blockquote><div><br></div><div>GP104 should be supported =
via your kernel (at least display and basic acceleration).<br><br></div><di=
v>You will also need to ensure you have the sufficiently current linux-firm=
ware files for the GP1xx series. See: <a href=3D"https://git.kernel.org/pub=
/scm/linux/kernel/git/firmware/linux-firmware.git/log/nvidia/gp104">https:/=
/git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/log/nv=
idia/gp104</a><br><br></div><div>There may also be particular bugs that you=
 are experiencing early in the boot process that prevent the system from bo=
oting to desktop normally. Once you&#39;ve ensured the prior steps are done=
, provide a link to your dmesg output (kernel debug log) if you need assist=
ance working out what is going wrong.<br><br>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div style=3D"font-family=
:Calibri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0);background-co=
lor:transparent">
<br>
Best Wishes<br>
<br>
Aiolia<br>
<br>
<br>
</div>
</div>

<br>______________________________<wbr>_________________<br>
Nouveau mailing list<br>
<a href=3D"mailto:Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org">Nouveau-PD4FTy7X32lNgt0PjOBp9/rsn8yoX9R0@public.gmane.org=
org</a><br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/nouveau" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.freedesktop.org/<wbr>mailman/lis=
tinfo/nouveau</a><br>
<br></blockquote></div><br></div></div>

--94eb2c08ed98a6dd450563a57e58--

--===============0965195179==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0965195179==--
