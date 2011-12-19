From: Lekensteyn <lekensteyn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: properly check for _DSM function support and Optimus
 support for vga_switcheroo
Date: Mon, 19 Dec 2011 14:26:27 +0100
Message-ID: <CALBR5ZzZpnZp4=65tFv=_ZJfz+eaxxMLk-T-5hWzHUhwSf+U=w@mail.gmail.com>
References: <CALBR5ZxR9iuvT57bDZ8yW9ZkZjuoUhBTYw4HBsmsiwoRi4gSkw@mail.gmail.com>
	<CALBR5ZyE2ZRX7eFBhooB22e9BRf0f3H2xqtvXB2iwe8nvKKnvw@mail.gmail.com>
	<CAOB9epp8EdpetsPStfdnGNx5-2dKi42j3DQiVKN_dzMdFcssWA@mail.gmail.com>
	<CALBR5Zw0gEDqKrSUF3R30tSSC6DUgfhVm0Y1Mp60e4bB4ObijQ@mail.gmail.com>
	<CAG2kNCwBwRJ_VrS9NHnmGvOTTLuwmBKd5kG8OknJG+f20Kvqsg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1717548914=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAG2kNCwBwRJ_VrS9NHnmGvOTTLuwmBKd5kG8OknJG+f20Kvqsg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Gianluca Cecchi <gianluca.cecchi-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============1717548914==
Content-Type: multipart/alternative; boundary=14dae93407bbdb487704b471e51b

--14dae93407bbdb487704b471e51b
Content-Type: text/plain; charset=ISO-8859-1

A quickly written way to test this module is described for Ubuntu at
http://pastebin.com/c5XqKSsW. Basically, you need to apply the patch on
nouveau
and rebuild the nouveau kernel module.

A comparison of different methods that works for toggling the dGPU is
available:
https://github.com/Bumblebee-Project/Bumblebee/wiki/Comparison-of-PM-methods

Regards,
Lekensteyn

On Mon, Dec 19, 2011 at 11:04 AM, Gianluca Cecchi <gianluca.cecchi-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
> wrote:

> >> On Sat, Dec 17, 2011 at 5:50 PM, Lekensteyn <lekensteyn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> wrote:
> >>>
> >>> Hello guys,
> >>>
> >>> I've prepared a patch based on my findings for the bbswitch module
> >>> (https://github.com/Lekensteyn/acpi-stuff/tree/master/bbswitch). This
> >>> adds a proper
> >>> check whether a _DSM function is supported or not and make OFF / ON for
> >>> vga_switcheroo work for nVidia Optimus models. The patch is based
> against
> >>> the
> >>> mainline kernel.
> >>>
> >>> It has been tested on my Clevo B7130 laptop running kernel 3.2 which
> has
>
> Hello,
> I have an Asus U36SD laptop with Optimus and Fedora 16 with kernel
> 3.1.5-6.fc16.x86_64
> Any way I can test it?
> Currently  I'm using acpi_call to switch off nvidia card and gain 4w
> for more battery life.
>
> [g.cecchi@ope46 ~]$ lspci -vnnn|grep -i vga
> 00:02.0 VGA compatible controller [0300]: Intel Corporation 2nd
> Generation Core Processor Family Integrated Graphics Controller
> [8086:0126] (rev 09) (prog-if 00 [VGA controller])
> 01:00.0 VGA compatible controller [0300]: nVidia Corporation Device
> [10de:1050] (rev ff) (prog-if ff)
>
> What benefit would it give me? Chance to use nvidia for graphic
> related apps ? With nouveau andor nvidia proprietary driver?
> Thanks in advance for any pointer
>
> Gianluca
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
>

--14dae93407bbdb487704b471e51b
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

A quickly written way to test this module is described for Ubuntu at<br><a =
href=3D"http://pastebin.com/c5XqKSsW" target=3D"_blank">http://pastebin.com=
/c5XqKSsW</a>. Basically, you need to apply the patch on nouveau<br>and reb=
uild the nouveau kernel module.<br>
<br>A comparison of different methods that works for toggling the dGPU is a=
vailable:<br><a href=3D"https://github.com/Bumblebee-Project/Bumblebee/wiki=
/Comparison-of-PM-methods">https://github.com/Bumblebee-Project/Bumblebee/w=
iki/Comparison-of-PM-methods</a><br>

<br>Regards,<br>Lekensteyn<br><br><div class=3D"gmail_quote">On Mon, Dec 19=
, 2011 at 11:04 AM, Gianluca Cecchi <span dir=3D"ltr">&lt;<a href=3D"mailto=
:gianluca.cecchi-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" target=3D"_blank">gianluca.cecchi-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>=
&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
<div>&gt;&gt; On Sat, Dec 17, 2011 at 5:50 PM, Lekensteyn &lt;<a href=3D"ma=
ilto:lekensteyn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" target=3D"_blank">lekensteyn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>&gt; w=
rote:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Hello guys,<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; I&#39;ve prepared a patch based on my findings for the bbswitc=
h module<br>
&gt;&gt;&gt; (<a href=3D"https://github.com/Lekensteyn/acpi-stuff/tree/mast=
er/bbswitch" target=3D"_blank">https://github.com/Lekensteyn/acpi-stuff/tre=
e/master/bbswitch</a>). This<br>
&gt;&gt;&gt; adds a proper<br>
&gt;&gt;&gt; check whether a _DSM function is supported or not and make OFF=
 / ON for<br>
&gt;&gt;&gt; vga_switcheroo work for nVidia Optimus models. The patch is ba=
sed against<br>
&gt;&gt;&gt; the<br>
&gt;&gt;&gt; mainline kernel.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; It has been tested on my Clevo B7130 laptop running kernel 3.2=
 which has<br>
<br>
</div>Hello,<br>
I have an Asus U36SD laptop with Optimus and Fedora 16 with kernel<br>
3.1.5-6.fc16.x86_64<br>
Any way I can test it?<br>
Currently =A0I&#39;m using acpi_call to switch off nvidia card and gain 4w<=
br>
for more battery life.<br>
<br>
[g.cecchi@ope46 ~]$ lspci -vnnn|grep -i vga<br>
00:02.0 VGA compatible controller [0300]: Intel Corporation 2nd<br>
Generation Core Processor Family Integrated Graphics Controller<br>
[8086:0126] (rev 09) (prog-if 00 [VGA controller])<br>
01:00.0 VGA compatible controller [0300]: nVidia Corporation Device<br>
[10de:1050] (rev ff) (prog-if ff)<br>
<br>
What benefit would it give me? Chance to use nvidia for graphic<br>
related apps ? With nouveau andor nvidia proprietary driver?<br>
Thanks in advance for any pointer<br>
<span><font color=3D"#888888"><br>
Gianluca<br>
</font></span><div><div>_______________________________________________<br>
Nouveau mailing list<br>
<a href=3D"mailto:Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" target=3D"_blank">Nouveau@=
lists.freedesktop.org</a><br>
<a href=3D"http://lists.freedesktop.org/mailman/listinfo/nouveau" target=3D=
"_blank">http://lists.freedesktop.org/mailman/listinfo/nouveau</a><br>
</div></div></blockquote></div><br>

--14dae93407bbdb487704b471e51b--

--===============1717548914==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1717548914==--
