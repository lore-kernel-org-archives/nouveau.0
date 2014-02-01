From: =?ISO-8859-1?Q?Christian_St=F6veken?= <christian.stoeveken-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Fwd:  videowall
Date: Sat, 1 Feb 2014 18:45:51 +0100
Message-ID: <CAAstKWAiwVMcM60m+sJZZDFrECiTAt=VHrka1VUnCAvM2kGjPw@mail.gmail.com>
References: <CAAstKWBDuS39wcEaFBey_keocpK5ATdRw6sA7E3xm6MTY6a74g@mail.gmail.com>
	<CAKb7Uvi1OGma3-vVzyh8DxuLgh5kiVR_Uwt-==NzAwJ6=6a6Bg@mail.gmail.com>
	<CAPM=9tzYKN245Y0ucEXLn=ZukboLi+VVV52YM2oEyeqf9WScJg@mail.gmail.com>
	<CAAstKWCnVzEohN7YvsTWvDU8SM5Vd4NmQM2d+jftYKijLj3aqg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0726787571=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAAstKWCnVzEohN7YvsTWvDU8SM5Vd4NmQM2d+jftYKijLj3aqg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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

--===============0726787571==
Content-Type: multipart/alternative; boundary=047d7b5d25e490b55a04f15bdce1

--047d7b5d25e490b55a04f15bdce1
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Jan 31, 2014 at 11:25 AM, Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
>
> You'll probably run out of PCI address space with too many cards,
>
> Dave.
>

That could possibly happen - I don't know how to check though.

Looks like the ID's are fine to me.

Could CONFIG_VGA_ARB_MAX_GPUS (is set to 16) be the problem?


xorg.conf_10gpu_20ZH_failstoadd16
https://gist.github.com/excogitation/8755687

Xorg.0.log_10gpu_20ZH_failstoadd16
https://gist.github.com/excogitation/8755639

xorg.conf_8gpu_16_screens_working
https://gist.github.com/excogitation/8755668

Xorg.0.log_8gpu_16_screens_working
https://gist.github.com/excogitation/8755656

--047d7b5d25e490b55a04f15bdce1
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr"><div><div clas=
s=3D"h5"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On Fri, Jan =
31, 2014 at 11:25 AM, Dave Airlie <span dir=3D"ltr">&lt;<a href=3D"mailto:a=
irlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" target=3D"_blank">airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>&gt;</span> wrote:=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex">
<div><div>
<br>
</div></div>You&#39;ll probably run out of PCI address space with too many =
cards,<br>
<br>
Dave.<br>
</blockquote></div><br></div></div></div><div class=3D"gmail_extra">That co=
uld possibly happen - I don&#39;t know how to check though.</div><div class=
=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Looks like the ID&#39=
;s are fine to me.</div>

<div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Could=A0CON=
FIG_VGA_ARB_MAX_GPUS (is set to 16) be the problem?</div><div class=3D"gmai=
l_extra"><br></div><div class=3D"gmail_extra"><br></div><div class=3D"gmail=
_extra">

xorg.conf_10gpu_20ZH_failstoadd16<br></div><div class=3D"gmail_extra"><a hr=
ef=3D"https://gist.github.com/excogitation/8755687" target=3D"_blank">https=
://gist.github.com/excogitation/8755687</a><br></div><div class=3D"gmail_ex=
tra">
<br></div><div class=3D"gmail_extra">
Xorg.0.log_10gpu_20ZH_failstoadd16<br></div><div class=3D"gmail_extra"><a h=
ref=3D"https://gist.github.com/excogitation/8755639" target=3D"_blank">http=
s://gist.github.com/excogitation/8755639</a><br></div><div class=3D"gmail_e=
xtra">
<br></div><div class=3D"gmail_extra">
xorg.conf_8gpu_16_screens_working<br></div><div class=3D"gmail_extra"><a hr=
ef=3D"https://gist.github.com/excogitation/8755668" target=3D"_blank">https=
://gist.github.com/excogitation/8755668</a><br></div><div class=3D"gmail_ex=
tra">
<br></div><div class=3D"gmail_extra">
Xorg.0.log_8gpu_16_screens_working<br></div><div class=3D"gmail_extra"><a h=
ref=3D"https://gist.github.com/excogitation/8755656" target=3D"_blank">http=
s://gist.github.com/excogitation/8755656</a><br></div><div class=3D"gmail_e=
xtra">
<br></div></div>
</div><br></div>

--047d7b5d25e490b55a04f15bdce1--

--===============0726787571==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0726787571==--
