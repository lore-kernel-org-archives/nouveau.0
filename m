From: Matthias Nagel <matthias.h.nagel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Help to debug random lockups on NVA3
Date: Fri, 20 Dec 2013 09:19:25 +0100
Message-ID: <CAN39ZY9whU9kf=RGeyGCBUgfYrwADGqrN-hR1UM_EWvsBv0r0Q@mail.gmail.com>
References: <52B3EF80.9030705@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1078128515=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <52B3EF80.9030705-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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

--===============1078128515==
Content-Type: multipart/alternative; boundary=089e0149c646a3f26a04edf2ef40

--089e0149c646a3f26a04edf2ef40
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,
do you have a second computer at hand? Often, if the display freezes, you
can still login via ssh. Run "dmesg" via remote shell and copy the output
to your other computer. Sometimes your are even able to restart X or reboot
the computer properly at least.
Matthias


2013/12/20 Yuriy Kolesnikov <yurikoles-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

> Hello, all!
> Since switching to nouveau I'm encouranting random system hangs, e.g.
> video freeze and sounds still playing. And I was unable to switch to
> terminal. But problem is that I can't find anything relevant to this issu=
e
> in logs, I tried to search in dmesg and Xorg logs. Please help to debug!
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
>



--=20
Matthias Nagel
Parkstra=C3=9Fe 27
76131 Karlsruhe

Festnetz: +49-721-96869289
Mobil: +49-151-15998774
e-Mail: matthias.h.nagel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
ICQ: 499797758
Skype: nagmat84

--089e0149c646a3f26a04edf2ef40
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>Hi,<br></div>do you have a second computer at ha=
nd? Often, if=20
the display freezes, you can still login via ssh. Run &quot;dmesg&quot; via=
 remote
 shell and copy the output to your other computer. Sometimes your are=20
even able to restart X or reboot the computer properly at least.<br></div>M=
atthias</div><div class=3D"gmail_extra"><br><br><div class=3D"gmail_quote">=
2013/12/20 Yuriy Kolesnikov <span dir=3D"ltr">&lt;<a href=3D"mailto:yurikol=
es-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" target=3D"_blank">yurikoles-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>&gt;</span><br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">Hello, all!<br>
Since switching to nouveau I&#39;m encouranting random system hangs, e.g. v=
ideo freeze and sounds still playing. And I was unable to switch to termina=
l. But problem is that I can&#39;t find anything relevant to this issue in =
logs, I tried to search in dmesg and Xorg logs. Please help to debug!<br>

______________________________<u></u>_________________<br>
Nouveau mailing list<br>
<a href=3D"mailto:Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" target=3D"_blank">Nouveau@=
lists.freedesktop.org</a><br>
<a href=3D"http://lists.freedesktop.org/mailman/listinfo/nouveau" target=3D=
"_blank">http://lists.freedesktop.org/<u></u>mailman/listinfo/nouveau</a><b=
r>
</blockquote></div><br><br clear=3D"all"><br>-- <br>Matthias Nagel<br>Parks=
tra=C3=9Fe 27<br>76131 Karlsruhe<br><br>Festnetz: +49-721-96869289<br>Mobil=
: +49-151-15998774<br>e-Mail: <a href=3D"mailto:matthias.h.nagel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org"=
 target=3D"_blank">matthias.h.nagel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a><br>
ICQ: 499797758<br>Skype: nagmat84
</div>

--089e0149c646a3f26a04edf2ef40--

--===============1078128515==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1078128515==--
