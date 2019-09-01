From: Denis Fateyev <denis-3qcFKRLn+ydBDgjK7y7TUQ@public.gmane.org>
Subject: nvkm_pmu_reset issue with Optimus card
Date: Mon, 2 Sep 2019 00:22:45 +0600
Message-ID: <CADsrgyYsLqC9-D6GjAjK5HAmoEY7QnAM5rXqjBetyTPzGEAd0A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0936542221=="
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

--===============0936542221==
Content-Type: multipart/alternative; boundary="000000000000cb3e96059181f188"

--000000000000cb3e96059181f188
Content-Type: text/plain; charset="UTF-8"

Hello there,

I have got an Asus notebook with Optimus technology support on board:

$ lspci -vnn | grep '\''[030[02]\]'
00:02.0 VGA compatible controller [0300]: Intel Corporation HD Graphics 530
[8086:191b] (rev 06) (prog-if 00 [VGA controller])
01:00.0 3D controller [0302]: NVIDIA Corporation GM107M [GeForce GTX 960M]
[10de:139b] (rev ff) (prog-if ff)

My system is a fully updated Fedora 30 with the kernel version 5.2.9.
The problem is that every time when "nouveau" is activated the system hangs
shortly with multiple dumps in dmesg.
I have already reported the issue to RHBZ [1], as I have understood this is
a known issue.

Practically, I can bring it up with Bumblebee + Intel + proprietary drivers
+ acpi_osi='Windows 2009', but instead I would like to get the Intel +
Nouveau solution working.
Are there any fixes or ideas on how I could achieve that?
I could help with more testing the issue if needed.

Thanks,

[1] https://bugzilla.redhat.com/show_bug.cgi?id=1699677

-- 
wbr, Denis.

--000000000000cb3e96059181f188
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello there,</div><div><br></div><div>I have got an A=
sus notebook with Optimus technology support on board:</div><div><br></div>=
<div>$ lspci -vnn | grep &#39;\&#39;&#39;[030[02]\]&#39;<br>00:02.0 VGA com=
patible controller [0300]: Intel Corporation HD Graphics 530 [8086:191b] (r=
ev 06) (prog-if 00 [VGA controller])<br>01:00.0 3D controller [0302]: NVIDI=
A Corporation GM107M [GeForce GTX 960M] [10de:139b] (rev ff) (prog-if ff)</=
div><div><br></div><div>My system is a fully updated Fedora 30 with the ker=
nel version 5.2.9.<br></div><div>The problem is that every time when &quot;=
nouveau&quot; is activated the system hangs shortly with multiple dumps in =
dmesg.</div><div>I have already reported the issue to RHBZ [1], as I have u=
nderstood this is a known issue.</div><div><br></div><div>Practically, I ca=
n bring it up with Bumblebee + Intel + proprietary drivers + acpi_osi=3D&#3=
9;Windows 2009&#39;, but instead I would like to get the Intel=C2=A0+ Nouve=
au solution working.</div><div>Are there any fixes or ideas on how I could =
achieve that?</div><div>I could help with more testing the issue if needed.=
</div><div><br></div><div>Thanks,<br></div><div></div><div><br></div><div>[=
1] <a href=3D"https://bugzilla.redhat.com/show_bug.cgi?id=3D1699677">https:=
//bugzilla.redhat.com/show_bug.cgi?id=3D1699677</a></div><div><br>-- <br><d=
iv dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"=
><div dir=3D"ltr">wbr, Denis.<font size=3D"2"><br></font></div></div></div>=
</div>

--000000000000cb3e96059181f188--

--===============0936542221==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0936542221==--
