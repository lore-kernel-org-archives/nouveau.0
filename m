From: Lekensteyn <lekensteyn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: properly check for _DSM function support and Optimus
 support for vga_switcheroo
Date: Mon, 19 Dec 2011 10:44:02 +0100
Message-ID: <CALBR5Zw0gEDqKrSUF3R30tSSC6DUgfhVm0Y1Mp60e4bB4ObijQ@mail.gmail.com>
References: <CALBR5ZxR9iuvT57bDZ8yW9ZkZjuoUhBTYw4HBsmsiwoRi4gSkw@mail.gmail.com>
	<CALBR5ZyE2ZRX7eFBhooB22e9BRf0f3H2xqtvXB2iwe8nvKKnvw@mail.gmail.com>
	<CAOB9epp8EdpetsPStfdnGNx5-2dKi42j3DQiVKN_dzMdFcssWA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1499739850=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAOB9epp8EdpetsPStfdnGNx5-2dKi42j3DQiVKN_dzMdFcssWA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: =?ISO-8859-1?Q?Omar_Andr=E9s_Zapata_Mesa?= <andresete.chaos-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============1499739850==
Content-Type: multipart/alternative; boundary=14dae934054f6edc9604b46eca64

--14dae934054f6edc9604b46eca64
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

It's works on a muxless Clevo B7130  intel / nvidia GT425M. It has also
been tested
on the legacy optimus call, although that crashed X
http://pastebin.com/9Sum3tT3
That bug is said to be fixed
http://cgit.freedesktop.org/xorg/xserver/commit/?id=3Dfb22a408c69a84f819051=
47de9e82cf66ffb6eb2

2011/12/19 Omar Andr=E9s Zapata Mesa <andresete.chaos-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

> Tested on toshiba m645 optimus intel/nvidia 310m
> output
> bbswitch: Found discrete VGA device 0000:01:00.0: \_SB_.PCI0.P0P2.VGA_
> [21832.787656] bbswitch: detected an Optimus _DSM function
> [21832.787664] bbswitch: Succesfully loaded. Discrete card 0000:01:00.0 i=
s
> on
> but dont work nvidia video card.  do it work with not mux optimus?
>
>
> On Sat, Dec 17, 2011 at 5:50 PM, Lekensteyn <lekensteyn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
>> Hello guys,
>>
>> I've prepared a patch based on my findings for the bbswitch module
>> (https://github.com/Lekensteyn/acpi-stuff/tree/master/bbswitch). This
>> adds a proper
>> check whether a _DSM function is supported or not and make OFF / ON for
>> vga_switcheroo work for nVidia Optimus models. The patch is based agains=
t
>> the
>> mainline kernel.
>>
>> It has been tested on my Clevo B7130 laptop running kernel 3.2 which has
>> a GT425M
>> dGPU:
>> # cat /sys/kernel/debug/vgaswitcheroo/switch
>> 0:IGD:+:Pwr:0000:00:02.0
>> 1:DIS: :Pwr:0000:01:00.0
>> # tee /sys/kernel/debug/vgaswitcheroo/switch <<<OFF
>> OFF
>> # cat /sys/kernel/debug/vgaswitcheroo/switch
>> 0:IGD:+:Pwr:0000:00:02.0
>> 1:DIS: :Off:0000:01:00.0
>> # tee /sys/kernel/debug/vgaswitcheroo/switch <<<ON
>> ON
>> # cat /sys/kernel/debug/vgaswitcheroo/switch
>> 0:IGD:+:Pwr:0000:00:02.0
>> 1:DIS: :Pwr:0000:01:00.0
>>
>> The iGPU/dGPU LEDS on the keyboard also change as a result.
>>
>> A second patch to make the device stay off after suspend is in progress.
>>
>> Regards,
>> Peter
>>
>>
>> _______________________________________________
>> Nouveau mailing list
>> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
>> http://lists.freedesktop.org/mailman/listinfo/nouveau
>>
>>
>
>
> --
> Omar Andres Zapata Mesa
> Fundamental Interaction Phenomenology Gruop (Gfif)
> Head Developer
> http://gfif.udea.edu.co
> Gfif Developers (Gfif Dev)
> Division of computer science
> http://gfifdev.udea.edu.co
> System Engineering Student
> Universidad de Antioquia At Medellin - Colombia
> Usuario Linux  #490962
>
>

--14dae934054f6edc9604b46eca64
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

It&#39;s works on a muxless Clevo B7130=A0 intel / nvidia GT425M. It has al=
so been tested<br>on the legacy optimus call, although that crashed X <a hr=
ef=3D"http://pastebin.com/9Sum3tT3">http://pastebin.com/9Sum3tT3</a><br>Tha=
t bug is said to be fixed<br>
<a href=3D"http://cgit.freedesktop.org/xorg/xserver/commit/?id=3Dfb22a408c6=
9a84f81905147de9e82cf66ffb6eb2">http://cgit.freedesktop.org/xorg/xserver/co=
mmit/?id=3Dfb22a408c69a84f81905147de9e82cf66ffb6eb2</a><br><br><div class=
=3D"gmail_quote">
2011/12/19 Omar Andr=E9s Zapata Mesa <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:andresete.chaos-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org">andresete.chaos-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>&gt;</span><br><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex">
Tested on toshiba m645 optimus intel/nvidia 310m<br>output<br>bbswitch: Fou=
nd discrete VGA device 0000:01:00.0: \_SB_.PCI0.P0P2.VGA_<br>[21832.787656]=
 bbswitch: detected an Optimus _DSM function<br>[21832.787664] bbswitch: Su=
ccesfully loaded. Discrete card 0000:01:00.0 is on<br>




but dont work nvidia video card. =A0do it work with not mux optimus?<div><b=
r></div><div><br><div class=3D"gmail_quote"><div><div class=3D"h5">On Sat, =
Dec 17, 2011 at 5:50 PM, Lekensteyn <span dir=3D"ltr">&lt;<a href=3D"mailto=
:lekensteyn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" target=3D"_blank">lekensteyn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>&gt;</span=
> wrote:<br>


</div></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex"><div><div class=3D"h5">

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
<br></div></div>_______________________________________________<br>
Nouveau mailing list<br>
<a href=3D"mailto:Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" target=3D"_blank">Nouveau@=
lists.freedesktop.org</a><br>
<a href=3D"http://lists.freedesktop.org/mailman/listinfo/nouveau" target=3D=
"_blank">http://lists.freedesktop.org/mailman/listinfo/nouveau</a><br>
<br></blockquote></div><span class=3D"HOEnZb"><font color=3D"#888888"><br><=
br clear=3D"all"><br>-- <br><span style=3D"font-family:arial,sans-serif;fon=
t-size:13px;background-color:rgb(255,255,255)"><span style=3D"border-collap=
se:collapse;font-family:arial,sans-serif;font-size:13px">Omar Andres Zapata=
 Mesa</span><div>




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
</font></span></div>
</blockquote></div><br>

--14dae934054f6edc9604b46eca64--

--===============1499739850==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1499739850==--
