From: =?ISO-8859-1?Q?St=E9phane_Marchesin?= <stephane.marchesin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Fwd: videowall
Date: Sat, 1 Feb 2014 12:35:06 -0800
Message-ID: <CACP_E+L1Ts4yU4+qh=psMrsX9AbPkmj3Ku48vSCPht=9E23B2Q@mail.gmail.com>
References: <CAAstKWBDuS39wcEaFBey_keocpK5ATdRw6sA7E3xm6MTY6a74g@mail.gmail.com>
	<CAKb7Uvi1OGma3-vVzyh8DxuLgh5kiVR_Uwt-==NzAwJ6=6a6Bg@mail.gmail.com>
	<CAPM=9tzYKN245Y0ucEXLn=ZukboLi+VVV52YM2oEyeqf9WScJg@mail.gmail.com>
	<CAAstKWCnVzEohN7YvsTWvDU8SM5Vd4NmQM2d+jftYKijLj3aqg@mail.gmail.com>
	<CAAstKWAiwVMcM60m+sJZZDFrECiTAt=VHrka1VUnCAvM2kGjPw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1295553557=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAAstKWAiwVMcM60m+sJZZDFrECiTAt=VHrka1VUnCAvM2kGjPw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: =?ISO-8859-1?Q?Christian_St=F6veken?= <christian.stoeveken-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

--===============1295553557==
Content-Type: multipart/alternative; boundary=001a11343fbc365d2804f15e3c2a

--001a11343fbc365d2804f15e3c2a
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 1, 2014 at 9:45 AM, Christian St=F6veken <
christian.stoeveken-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> On Fri, Jan 31, 2014 at 11:25 AM, Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>
>>
>> You'll probably run out of PCI address space with too many cards,
>>
>> Dave.
>>
>
> That could possibly happen - I don't know how to check though.
>
> Looks like the ID's are fine to me.
>
> Could CONFIG_VGA_ARB_MAX_GPUS (is set to 16) be the problem?
>

This problem happens way before the kernel starts. When the bios sets up
the pci resource space, you have something between 512M and 2GB available
for pci resources (this depends on the bios). Each card will usually eat
128M or 256M of pci resource space (although it depends on the cards) so
it's possible to run out. When that happens, some bioses won't boot, others
will just disable some devices. You can look for that info in your kernel
logs, the e820 area size is printed (look for something like e820: [mem
0xd0000000-0xffefffff] available for PCI devices). You can use lspci -v to
check if all the cards come up with their pci resources and how things fit
in there. If all of them have a pci resource then you're fine on that front=
.

St=E9phane

--001a11343fbc365d2804f15e3c2a
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Sat, Feb 1, 2014 at 9:45 AM, Christian St=F6veken <span dir=3D"l=
tr">&lt;<a href=3D"mailto:christian.stoeveken-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" target=3D"_blank">=
christian.stoeveken-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"lt=
r"><div class=3D"im">

<div><div><div class=3D"gmail_extra"><div class=3D"gmail_quote">On Fri, Jan=
 31, 2014 at 11:25 AM, Dave Airlie <span dir=3D"ltr">&lt;<a href=3D"mailto:=
airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" target=3D"_blank">airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>&gt;</span> wrote=
:<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;=
padding-left:1ex">


<div><div>
<br>
</div></div>You&#39;ll probably run out of PCI address space with too many =
cards,<br>
<br>
Dave.<br>
</blockquote></div><br></div></div></div></div><div class=3D"gmail_extra">T=
hat could possibly happen - I don&#39;t know how to check though.</div><div=
 class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Looks like the =
ID&#39;s are fine to me.</div>



<div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Could=A0CON=
FIG_VGA_ARB_MAX_GPUS (is set to 16) be the problem?</div></div></div></div>=
</blockquote><div><br></div><div>This problem happens way before the kernel=
 starts. When the bios sets up the pci resource space, you have something b=
etween 512M and 2GB available for pci resources (this depends on the bios).=
 Each card will usually eat 128M or 256M of pci resource space (although it=
 depends on the cards) so it&#39;s possible to run out. When that happens, =
some bioses won&#39;t boot, others will just disable some devices. You can =
look for that info in your kernel logs, the e820 area size is printed (look=
 for something like e820: [mem 0xd0000000-0xffefffff] available for PCI dev=
ices). You can use lspci -v to check if all the cards come up with their pc=
i resources and how things fit in there. If all of them have a pci resource=
 then you&#39;re fine on that front.</div>

<div><br></div><div>St=E9phane<br></div><div><br></div></div></div></div>

--001a11343fbc365d2804f15e3c2a--

--===============1295553557==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1295553557==--
