From: Eric F <3rik.gm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: IMPORTANT : Regression since kernel > 3.4 as regards
 suspend to RAM while using 3D accel
Date: Sun, 30 Jun 2013 19:42:19 +0200
Message-ID: <CA+T9nP8sBKxafn0szfpDcfudvJvMTsEvCL8eYzcV+EfYfX+3rQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0292424090=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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

--===============0292424090==
Content-Type: multipart/alternative; boundary=047d7b66fd3b38dbf204e062a2ed

--047d7b66fd3b38dbf204e062a2ed
Content-Type: text/plain; charset=ISO-8859-1

Hello,

Been wondering why I could never resume from s2r. That's because I always
use 3D accel (compiz, cairo-dock). I have tested each Arch kernel releases,
hoping each time to get s2r to work.

Tired of this, I decided to use 3.4 LTS... 3.4.50
... And guess what ? I could resume from suspend to RAM 100% of the time !!!

I know it may be a hard work for you, but suspend to RAM while using 3D
accel only works with this kernel (and maybe 3.4.51, will give a try).

Suspend to RAM is important for battery saving for laptops.
I use GT555M nvc3.

Best regards,

Eric

--047d7b66fd3b38dbf204e062a2ed
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><div><div><div><div><div>Hello,<br><br></di=
v>Been wondering why I could never resume from s2r. That&#39;s because I al=
ways use 3D accel (compiz, cairo-dock). I have tested each Arch kernel rele=
ases, hoping each time to get s2r to work.<br>
<br></div>Tired of this, I decided to use 3.4 LTS... 3.4.50<br></div>... An=
d guess what ? I could resume from suspend to RAM 100% of the time !!!<br><=
br></div>I know it may be a hard work for you, but suspend to RAM while usi=
ng 3D accel only works with this kernel (and maybe 3.4.51, will give a try)=
.<br>
<br></div>Suspend to RAM is important for battery saving for laptops.<br></=
div>I use GT555M nvc3.<br><br></div>Best regards,<br><br></div>Eric<br></di=
v>

--047d7b66fd3b38dbf204e062a2ed--

--===============0292424090==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0292424090==--
