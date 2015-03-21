From: Megaf <mmegaf-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: nouveau locking up on Debian Jessie.
Date: Sat, 21 Mar 2015 14:47:15 +0000
Message-ID: <CAH0ntzzkQqxgfRi7RWW5bmVLYe2h3aN1uv3L+hffQYXX6=Dzmg@mail.gmail.com>
References: <CAH0ntzyWJLoMuGoDrviRG9ufDR7vO02TaQPppQGW0xZ092dsWA@mail.gmail.com>
 <CAKb7UvhORYk+R=ur1B0-7vH5s3CTGVNVKuEG_gt9WUwdcgeFzA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1125241321=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAKb7UvhORYk+R=ur1B0-7vH5s3CTGVNVKuEG_gt9WUwdcgeFzA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

--===============1125241321==
Content-Type: multipart/alternative; boundary=001a1140a9c6a987090511cd8476

--001a1140a9c6a987090511cd8476
Content-Type: text/plain; charset=UTF-8

Hi,

Unfortunately I'm not really comfortable editing code, I'm using the
current X11 and nouveau from Debian Jessie repos.
I've noticed that this begun to happen on Debian Jessie, Debian Wheezy (The
current stable) don't have this problem.

https://packages.debian.org/wheezy/xserver-xorg-video-nouveau
https://packages.debian.org/jessie/xserver-xorg-video-nouveau

If you tell me exactly what file to modify I will try.

My guess about the issue is the GPU rendering of the web browsers is
somehow conflicting with video players/3D apps/games since this lockup is
much rarer when a single application is using the GPU, either for GL
rendering or some video decoding task.

--001a1140a9c6a987090511cd8476
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,=C2=A0<div><br></div><div>Unfortunately I&#39;m not rea=
lly comfortable editing code, I&#39;m using the current X11 and nouveau fro=
m Debian Jessie repos.</div><div>I&#39;ve noticed that this begun to happen=
 on Debian Jessie, Debian Wheezy (The current stable) don&#39;t have this p=
roblem.</div><div><br></div><div><a href=3D"https://packages.debian.org/whe=
ezy/xserver-xorg-video-nouveau">https://packages.debian.org/wheezy/xserver-=
xorg-video-nouveau</a><br></div><div><a href=3D"https://packages.debian.org=
/jessie/xserver-xorg-video-nouveau">https://packages.debian.org/jessie/xser=
ver-xorg-video-nouveau</a><br></div><div><br></div><div>If you tell me exac=
tly what file to modify I will try.</div><div><br></div><div>My guess about=
 the issue is the GPU rendering of the web browsers is somehow conflicting =
with video players/3D apps/games since this lockup is much rarer when a sin=
gle application is using the GPU, either for GL rendering or some video dec=
oding task.</div></div>

--001a1140a9c6a987090511cd8476--

--===============1125241321==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1125241321==--
