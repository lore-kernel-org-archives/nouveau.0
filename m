From: Nikolay Amiantov <nikoamia-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Optimus switch corrupts memory on Lenovo T440p
Date: Mon, 27 Jan 2014 18:10:43 +0400
Message-ID: <CA+waHKXs3iXFPHinB3pqFNqazm+BoYSBZ7V_+5j22NK2xqUeFg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0890836460=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============0890836460==
Content-Type: multipart/alternative; boundary=047d7b62481a2a636404f0f44705

--047d7b62481a2a636404f0f44705
Content-Type: text/plain; charset=ISO-8859-1

Hello,
On new Lenovo T440p laptops with new BIOSes (1.16 and further) there is a
memory corruption when trying to disable, and then re-enable, nvidia GPU.
There is a bugreport for bbswitch (
https://github.com/Bumblebee-Project/bbswitch/issues/78), but this problem
shows even when doing disable and re-enable with acpi_call, and nouveau has
dynamic power management support too. I have been trying to investigate
into this problem for some time, and have really no idea what can I try
next. On Windows, this of course works, and I have setted up remote
kernel/ACPI debugging on it, which showed that there is practically no
difference in ACPI calls in Windows from nvidia driver. I've also
discovered correlation of this bug with reserved high memory, which looks
very strange by itself. You can read the whole bug history in this bug
report. I'm posting this to this mailing list to have some help/ideas
regarding this.

Nikolay Amiantov.

--047d7b62481a2a636404f0f44705
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>Hello,<br></div>On new Lenovo T440p laptops with=
 new BIOSes (1.16 and further) there is a memory corruption when trying to =
disable, and then re-enable, nvidia GPU. There is a bugreport for bbswitch =
(<a href=3D"https://github.com/Bumblebee-Project/bbswitch/issues/78">https:=
//github.com/Bumblebee-Project/bbswitch/issues/78</a>), but this problem sh=
ows even when doing disable and re-enable with acpi_call, and nouveau has d=
ynamic power management support too. I have been trying to investigate into=
 this problem for some time, and have really no idea what can I try next.  =
On Windows, this of course works, and I have setted up remote kernel/ACPI d=
ebugging on it, which showed that there is practically no difference in ACP=
I calls in Windows from nvidia driver. I&#39;ve also discovered correlation=
 of this bug with reserved high memory, which looks very strange by itself.=
 You can read the whole bug history in this bug report. I&#39;m posting thi=
s to this mailing list to have some help/ideas regarding this.<br>

<br></div>Nikolay Amiantov.<br></div>

--047d7b62481a2a636404f0f44705--

--===============0890836460==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0890836460==--
