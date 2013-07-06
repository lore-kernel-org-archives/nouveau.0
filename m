From: Eric F <3rik.gm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: IMPORTANT : Regression since kernel > 3.4 as regards
 suspend to RAM while using 3D accel
Date: Sat, 6 Jul 2013 09:27:58 +0200
Message-ID: <CA+T9nP9cBcUmMZXNWVWCEacp=-BVRWNuiz8YeiWOVsyP5WDK=g@mail.gmail.com>
References: <CA+T9nP8sBKxafn0szfpDcfudvJvMTsEvCL8eYzcV+EfYfX+3rQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1338521677=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CA+T9nP8sBKxafn0szfpDcfudvJvMTsEvCL8eYzcV+EfYfX+3rQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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

--===============1338521677==
Content-Type: multipart/alternative; boundary=089e0122a97c28ab0a04e0d2c033

--089e0122a97c28ab0a04e0d2c033
Content-Type: text/plain; charset=ISO-8859-1

Hello,

After bisection I found the first bad commit :

5e120f6e4b3f35b741c5445dfc755f50128c3c44 is the first bad commit
commit 5e120f6e4b3f35b741c5445dfc755f50128c3c44
Author: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Date:   Mon Apr 30 13:55:29 2012 +1000

    drm/nouveau/fence: convert to exec engine, and improve channel sync

    Now have a somewhat simpler semaphore sync implementation for nv17:nv84,
    and a switched to using semaphores as fences on nv84+ and making use of
    the hardware's >= acquire operation.

    Signed-off-by: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

:040000 040000 8f2ca4ddf4969c75f688a96fdb152e449fda4852
da67a1bd8d608577e659a26715cf8af3644d8efe M    drivers

bad kernel name : 3.4.0-1-ARCH-00591-g5e120f6-dirty

Strangely, when I git checkout with the bad commit, it says :
"HEAD is now at 5e120f6... drm/nouveau/fence: convert to exec engine, and
improve channel sync"

But I checked, this commit 5e120f6e4b3f35b741c5445dfc755f50128c3c44 is the
first bad one.

Thanks for your future help,

Eric


2013/6/30 Eric F <3rik.gm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

> Hello,
>
> Been wondering why I could never resume from s2r. That's because I always
> use 3D accel (compiz, cairo-dock). I have tested each Arch kernel releases,
> hoping each time to get s2r to work.
>
> Tired of this, I decided to use 3.4 LTS... 3.4.50
> ... And guess what ? I could resume from suspend to RAM 100% of the time
> !!!
>
> I know it may be a hard work for you, but suspend to RAM while using 3D
> accel only works with this kernel (and maybe 3.4.51, will give a try).
>
> Suspend to RAM is important for battery saving for laptops.
> I use GT555M nvc3.
>
> Best regards,
>
> Eric
>

--089e0122a97c28ab0a04e0d2c033
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><div><div>Hello,<br><br></div>After bisecti=
on I found the first bad commit : <br><br>5e120f6e4b3f35b741c5445dfc755f501=
28c3c44 is the first bad commit<br>commit 5e120f6e4b3f35b741c5445dfc755f501=
28c3c44<br>
Author: Ben Skeggs &lt;<a href=3D"mailto:bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org">bskeggs@redhat=
.com</a>&gt;<br>Date:=A0=A0 Mon Apr 30 13:55:29 2012 +1000<br><br>=A0=A0=A0=
 drm/nouveau/fence: convert to exec engine, and improve channel sync<br>=A0=
=A0=A0 <br>=A0=A0=A0 Now have a somewhat simpler semaphore sync implementat=
ion for nv17:nv84,<br>
=A0=A0=A0 and a switched to using semaphores as fences on nv84+ and making =
use of<br>=A0=A0=A0 the hardware&#39;s &gt;=3D acquire operation.<br>=A0=A0=
=A0 <br>=A0=A0=A0 Signed-off-by: Ben Skeggs &lt;<a href=3D"mailto:bskeggs@r=
edhat.com">bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org</a>&gt;<br>
<br>:040000 040000 8f2ca4ddf4969c75f688a96fdb152e449fda4852 da67a1bd8d60857=
7e659a26715cf8af3644d8efe M=A0=A0=A0 drivers<br><br>bad kernel name : 3.4.0=
-1-ARCH-00591-g5e120f6-dirty<br><br></div>Strangely, when I git checkout wi=
th the bad commit, it says : <br>
&quot;HEAD is now at 5e120f6... drm/nouveau/fence: convert to exec engine, =
and improve channel sync&quot;<br><br></div>But I checked, this commit 5e12=
0f6e4b3f35b741c5445dfc755f50128c3c44 is the first bad one.<br><br></div>
Thanks for your future help,<br><br></div>Eric<br></div><div class=3D"gmail=
_extra"><br><br><div class=3D"gmail_quote">2013/6/30 Eric F <span dir=3D"lt=
r">&lt;<a href=3D"mailto:3rik.gm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" target=3D"_blank">3rik.gm@gmail=
.com</a>&gt;</span><br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div><div><div><div><div><d=
iv><div><div>Hello,<br><br></div>Been wondering why I could never resume fr=
om s2r. That&#39;s because I always use 3D accel (compiz, cairo-dock). I ha=
ve tested each Arch kernel releases, hoping each time to get s2r to work.<b=
r>

<br></div>Tired of this, I decided to use 3.4 LTS... 3.4.50<br></div>... An=
d guess what ? I could resume from suspend to RAM 100% of the time !!!<br><=
br></div>I know it may be a hard work for you, but suspend to RAM while usi=
ng 3D accel only works with this kernel (and maybe 3.4.51, will give a try)=
.<br>

<br></div>Suspend to RAM is important for battery saving for laptops.<br></=
div>I use GT555M nvc3.<br><br></div>Best regards,<br><br></div>Eric<br></di=
v>
</blockquote></div><br></div>

--089e0122a97c28ab0a04e0d2c033--

--===============1338521677==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1338521677==--
