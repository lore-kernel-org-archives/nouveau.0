From: fbs 777 <fbs777-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Fwd:  disable EDID for arcade monitor?
Date: Sun, 25 Mar 2012 16:39:52 -0300
Message-ID: <CAPET_G9DY=YrAqEBTJQdVASzZh1SGpa6pgDr2P+Xj=t=zcU2fw@mail.gmail.com>
References: <CAPET_G_qFDahfUmoK5hhiNvZBcnRntP_r0s4-pmHjE72h6J-yQ@mail.gmail.com>
	<op.wbqp6smp8t7z9u@arch-laptop>
	<CAPET_G8byKvvODxWcz9CpbCAGUQMTEZxWxxJY8w-x66oPvj6Mw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0124102104=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAPET_G8byKvvODxWcz9CpbCAGUQMTEZxWxxJY8w-x66oPvj6Mw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============0124102104==
Content-Type: multipart/alternative; boundary=20cf306f76bcebb35604bc166b99

--20cf306f76bcebb35604bc166b99
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

yeah, i was reading the nouveau manual and i think there is no way to
configure to ignore the EDID.

Modeline is fine, the same modeline works fine with proprietary nvidia
driver with NOEDID option.

I will try to submit a bug-report, but its a embeeded system, so its a
litle hard to generate and get logs...

Em 25 de mar=E7o de 2012 16:09, Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>escr=
eveu:

On Sun, 25 Mar 2012 19:54:20 +0100, fbs 777 <fbs777-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
>  I cant make the nouveau work with an arcade monitor, problably because t=
he
>> EDID.
>> I can make modeline work fine to reduce the horizontal to 15khz, tested =
in
>> a normal pc monitor (with ugly visual because the 15khz in horizontal).
>> But when i try in the arcade monitor, dont show any image after xorg
>> start.
>>
> As far as I'm aware there is no option to ignore the EDID
> If you have provided a comprehensive Modeline, nouveau should use it
>
> In either case you should consider
> * trying the xorg-edgers packages
> * submit a bug-report, attaching Xorg.0.log & dmesg
>
> Cheers
> Emil
>
>

--20cf306f76bcebb35604bc166b99
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">yeah, i was reading the nouveau manual and i thi=
nk there is no way to configure to ignore the EDID.<div><br></div><div>Mode=
line is fine, the same modeline works fine with proprietary nvidia driver w=
ith NOEDID option.</div>

<div><br></div><div>I will try to submit a bug-report, but its a embeeded s=
ystem, so its a litle hard to generate and get logs...<br><br><div class=3D=
"gmail_quote">Em 25 de mar=E7o de 2012 16:09, Emil Velikov <span dir=3D"ltr=
">&lt;<a href=3D"mailto:emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" target=3D"_blank">emil.l.=
velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>&gt;</span> escreveu:<div>
<div class=3D"h5"><br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div>On Sun, 25 Mar 2012 19:54:20 +0100, fbs=
 777 &lt;<a href=3D"mailto:fbs777-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" target=3D"_blank">fbs777@gmail=
.com</a>&gt; wrote:<br>


<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
I cant make the nouveau work with an arcade monitor, problably because the<=
br>
EDID.<br>
I can make modeline work fine to reduce the horizontal to 15khz, tested in<=
br>
a normal pc monitor (with ugly visual because the 15khz in horizontal).<br>
But when i try in the arcade monitor, dont show any image after xorg start.=
<br>
</blockquote></div>
As far as I&#39;m aware there is no option to ignore the EDID<br>
If you have provided a comprehensive Modeline, nouveau should use it<br>
<br>
In either case you should consider<br>
* trying the xorg-edgers packages<br>
* submit a bug-report, attaching Xorg.0.log &amp; dmesg<br>
<br>
Cheers<span><font color=3D"#888888"><br>
Emil<br>
<br>
</font></span></blockquote></div></div></div><br></div>
</div><br>

--20cf306f76bcebb35604bc166b99--

--===============0124102104==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0124102104==--
