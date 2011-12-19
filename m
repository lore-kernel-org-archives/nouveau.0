From: =?ISO-8859-1?Q?Omar_Andr=E9s_Zapata_Mesa?= <andresete.chaos-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: properly check for _DSM function support and Optimus
 support for vga_switcheroo
Date: Sun, 18 Dec 2011 23:39:15 -0500
Message-ID: <CAOB9epp8EdpetsPStfdnGNx5-2dKi42j3DQiVKN_dzMdFcssWA@mail.gmail.com>
References: <CALBR5ZxR9iuvT57bDZ8yW9ZkZjuoUhBTYw4HBsmsiwoRi4gSkw@mail.gmail.com>
	<CALBR5ZyE2ZRX7eFBhooB22e9BRf0f3H2xqtvXB2iwe8nvKKnvw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1060521610=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CALBR5ZyE2ZRX7eFBhooB22e9BRf0f3H2xqtvXB2iwe8nvKKnvw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Lekensteyn <lekensteyn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============1060521610==
Content-Type: multipart/alternative; boundary=bcaec54ee922def73104b46a8a7a

--bcaec54ee922def73104b46a8a7a
Content-Type: text/plain; charset=ISO-8859-1

Tested on toshiba m645 optimus intel/nvidia 310m
output
bbswitch: Found discrete VGA device 0000:01:00.0: \_SB_.PCI0.P0P2.VGA_
[21832.787656] bbswitch: detected an Optimus _DSM function
[21832.787664] bbswitch: Succesfully loaded. Discrete card 0000:01:00.0 is
on
but dont work nvidia video card.  do it work with not mux optimus?


On Sat, Dec 17, 2011 at 5:50 PM, Lekensteyn <lekensteyn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> Hello guys,
>
> I've prepared a patch based on my findings for the bbswitch module
> (https://github.com/Lekensteyn/acpi-stuff/tree/master/bbswitch). This
> adds a proper
> check whether a _DSM function is supported or not and make OFF / ON for
> vga_switcheroo work for nVidia Optimus models. The patch is based against
> the
> mainline kernel.
>
> It has been tested on my Clevo B7130 laptop running kernel 3.2 which has a
> GT425M
> dGPU:
> # cat /sys/kernel/debug/vgaswitcheroo/switch
> 0:IGD:+:Pwr:0000:00:02.0
> 1:DIS: :Pwr:0000:01:00.0
> # tee /sys/kernel/debug/vgaswitcheroo/switch <<<OFF
> OFF
> # cat /sys/kernel/debug/vgaswitcheroo/switch
> 0:IGD:+:Pwr:0000:00:02.0
> 1:DIS: :Off:0000:01:00.0
> # tee /sys/kernel/debug/vgaswitcheroo/switch <<<ON
> ON
> # cat /sys/kernel/debug/vgaswitcheroo/switch
> 0:IGD:+:Pwr:0000:00:02.0
> 1:DIS: :Pwr:0000:01:00.0
>
> The iGPU/dGPU LEDS on the keyboard also change as a result.
>
> A second patch to make the device stay off after suspend is in progress.
>
> Regards,
> Peter
>
>
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
>
>


-- 
Omar Andres Zapata Mesa
Fundamental Interaction Phenomenology Gruop (Gfif)
Head Developer
http://gfif.udea.edu.co
Gfif Developers (Gfif Dev)
Division of computer science
http://gfifdev.udea.edu.co
System Engineering Student
Universidad de Antioquia At Medellin - Colombia
Usuario Linux  #490962

--bcaec54ee922def73104b46a8a7a
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Tested on toshiba m645 optimus intel/nvidia 310m<br>output<br>bbswitch: Fou=
nd discrete VGA device 0000:01:00.0: \_SB_.PCI0.P0P2.VGA_<br>[21832.787656]=
 bbswitch: detected an Optimus _DSM function<br>[21832.787664] bbswitch: Su=
ccesfully loaded. Discrete card 0000:01:00.0 is on<br>



but dont work nvidia video card. =A0do it work with not mux optimus?<div><b=
r></div><div><br><div class=3D"gmail_quote">On Sat, Dec 17, 2011 at 5:50 PM=
, Lekensteyn <span dir=3D"ltr">&lt;<a href=3D"mailto:lekensteyn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" =
target=3D"_blank">lekensteyn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">

Hello guys,<br><div class=3D"gmail_quote"><br>I&#39;ve prepared a patch bas=
ed on my findings for the bbswitch module<br>(<a href=3D"https://github.com=
/Lekensteyn/acpi-stuff/tree/master/bbswitch" target=3D"_blank">https://gith=
ub.com/Lekensteyn/acpi-stuff/tree/master/bbswitch</a>). This adds a proper<=
br>





check whether a _DSM function is supported or not and make OFF / ON for<br>=
vga_switcheroo work for nVidia Optimus models. The patch is based against t=
he<br>mainline kernel.<br><br>It has been tested on my Clevo B7130 laptop r=
unning kernel 3.2 which has a GT425M<br>





dGPU:<br># cat /sys/kernel/debug/vgaswitcheroo/switch<br>0:IGD:+:Pwr:0000:0=
0:02.0<br>1:DIS: :Pwr:0000:01:00.0<br># tee /sys/kernel/debug/vgaswitcheroo=
/switch &lt;&lt;&lt;OFF<br>OFF<br># cat /sys/kernel/debug/vgaswitcheroo/swi=
tch<br>





0:IGD:+:Pwr:0000:00:02.0<br>1:DIS: :Off:0000:01:00.0<br># tee /sys/kernel/d=
ebug/vgaswitcheroo/switch &lt;&lt;&lt;ON<br>ON<br># cat /sys/kernel/debug/v=
gaswitcheroo/switch<br>0:IGD:+:Pwr:0000:00:02.0<br>1:DIS: :Pwr:0000:01:00.0=
<br>





<br>The iGPU/dGPU LEDS on the keyboard also change as a result.<br><br>A se=
cond patch to make the device stay off after suspend is in progress.<br><br=
>Regards,<br>Peter<br>
</div><br>
<br>_______________________________________________<br>
Nouveau mailing list<br>
<a href=3D"mailto:Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" target=3D"_blank">Nouveau@=
lists.freedesktop.org</a><br>
<a href=3D"http://lists.freedesktop.org/mailman/listinfo/nouveau" target=3D=
"_blank">http://lists.freedesktop.org/mailman/listinfo/nouveau</a><br>
<br></blockquote></div><br><br clear=3D"all"><br>-- <br><span style=3D"font=
-family:arial,sans-serif;font-size:13px;background-color:rgb(255,255,255)">=
<span style=3D"border-collapse:collapse;font-family:arial,sans-serif;font-s=
ize:13px">Omar Andres Zapata Mesa</span><div>



<span style=3D"border-collapse:collapse;font-family:arial,helvetica,sans-se=
rif;font-size:13px;line-height:19px;white-space:pre-wrap">Fundamental Inter=
action Phenomenology Gruop (Gfif)</span><br><span style=3D"border-collapse:=
collapse;font-size:13px"><div style=3D"font-family:arial,sans-serif">



Head Developer=A0</div><div style=3D"font-family:arial,sans-serif"><font fa=
ce=3D"arial, helvetica, sans-serif"><a href=3D"http://gfif.udea.edu.co/" st=
yle=3D"color:rgb(64,100,128)" target=3D"_blank">http://gfif.udea.edu.co</a>=
<br></font></div>



</span><span style=3D"border-collapse:collapse;font-family:arial,sans-serif=
;font-size:13px">Gfif Developers (Gfif Dev)</span><span style=3D"border-col=
lapse:collapse;font-size:13px"><div style=3D"font-family:arial,sans-serif">=
Division of computer science=A0</div>



<div style=3D"font-family:arial,sans-serif"><a href=3D"http://gfifdev.udea.=
edu.co/" style=3D"color:rgb(64,100,128)" target=3D"_blank">http://gfifdev.u=
dea.edu.co</a></div><div style=3D"font-family:arial,sans-serif"><div>System=
 Engineering Student</div>



<div>Universidad de Antioquia At Medellin - Colombia</div><div>Usuario Linu=
x =A0#490962</div></div></span></div></span><br>
</div>

--bcaec54ee922def73104b46a8a7a--

--===============1060521610==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1060521610==--
