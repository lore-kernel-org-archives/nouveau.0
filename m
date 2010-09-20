From: Abelenda Diego <diego.abelenda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Problems with dual head on NVidia Quadro NVS 295
Date: Mon, 20 Sep 2010 17:53:22 +0200
Message-ID: <20100920175322.3ea3ed7e@Lina>
References: <4C977BF6.20505@cs.toronto.edu>
Reply-To: diego.abelenda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1948340157=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <4C977BF6.20505-26n5VD7DAF2Tm46uYYfjYg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Stefan Mathe <mstefan-26n5VD7DAF2Tm46uYYfjYg@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============1948340157==
Content-Type: multipart/signed; micalg=PGP-SHA1;
 boundary="Sig_/J=GFX8rsQ.euj0GKgJm49Tj"; protocol="application/pgp-signature"

--Sig_/J=GFX8rsQ.euj0GKgJm49Tj
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 20 Sep 2010 18:21:26 +0300
Stefan Mathe <mstefan-26n5VD7DAF2Tm46uYYfjYg@public.gmane.org> wrote:

> Hello,
>=20
> I'm having problems configuring the dual-head display using an NVidia
> Quadro NVS 295 display card. It uses two identical LCD monitors (model
> HP LP2475w), connected using DP cables. If I connect one single
> monitor (either to the DP-1 or to the DP-2 output), the desktop shows
> up correctly. If I connect both monitors, only the left monitor shows
> the image, and the desktop is extended as if the second monitor were
> showing something. But the right monitor remains blank.
>=20
> I am using OpenSUSE 11.3, with the nouveau drivers included in its
> kernel (kernel version 2.6.34). The relevant parts of xorg.conf.d are:
>=20
> Section "Device"
>   Identifier "Default Device"
>   Option "SWcursor" "true"
>   Option "monitor-DP-1" "LeftMonitor"
>   Option "monitor-DP-2" "RightMonitor"
> EndSection
>=20
> Section "Monitor"
>   Identifier "LeftMonitor"
>   Option "PreferredMode" "1920x1200"
> EndSection
>=20
> Section "Monitor"
>   Identifier "RightMonitor"
>   Option     "RightOf" "LeftMonitor"
>   Option     "PreferredMode" "1920x1200"
> EndSection
>=20
> Section "Screen"
>   Identifier "Default Screen"
>   Device "Default Device"
>   Monitor "LeftMonitor"
>   DefaultDepth 24
>   SubSection "Display"
>      Depth 24
>      Virtual 3840 1200
>   EndSubSection
> EndSection
>=20
> Section "ServerLayout"
>   Identifier "Layout0"
>   Screen 0 "Default Screen" 0 0
> EndSection
>=20
> Note that I had to set the mouse cursor to software rendering because
> it was not showing up at all when using hardware rendering (cursor was
> entirely invisible but the mouse was operational).
>=20
> The output of the "xrandr" command is:
>=20
> Screen 0: minimum 320 x 200, current 3840 x 1200, maximum 8192 x 8192
> DP-1 connected 1920x1200+0+0 (normal left inverted right x axis y
> axis) 546mm x 352mm
>    1920x1200      60.0*+   59.9=20
>    1920x1080      60.0=20
>    1600x1200      60.0=20
>    1680x1050      60.0=20
>    1600x1000      60.0=20
>    1280x1024      75.0=20
>    1280x960       60.0=20
>    1152x864       75.0=20
>    1024x768       75.1     60.0=20
>    832x624        74.6=20
>    800x600        75.0     60.3=20
>    640x480        75.0     60.0=20
>    720x400        70.1=20
> DP-2 connected 1920x1200+1920+0 (normal left inverted right x axis y
> axis) 546mm x 352mm
>    1920x1200      60.0*+   59.9=20
>    1600x1200      60.0=20
>    1680x1050      60.0=20
>    1600x1000      60.0=20
>    1280x1024      75.0=20
>    1280x960       60.0=20
>    1152x864       75.0=20
>    1024x768       75.1     60.0=20
>    832x624        74.6=20
>    800x600        75.0     60.3=20
>    640x480        75.0     60.0=20
>    720x400        70.1=20
>=20
> I have also attached my Xorg.0.log file.
>=20
> Many thanks in advance for the help,
> Stefan.

Got exactly the same problem with an nvidia 9600GT and two DVI cables.
Using gentoo and I tested the kernels 2.6.34 2.6.35 and the 2.6.36_rc
nothing changed. Until now I had the two screens connected via a
DVI-to-VGA adapter and there was another problem, there was some
static on the second screen, but the nvidia proprietary driver did the
same thing.

--Sig_/J=GFX8rsQ.euj0GKgJm49Tj
Content-Type: application/pgp-signature; name=signature.asc
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.16 (GNU/Linux)

iQIcBAEBAgAGBQJMl4N1AAoJEKJk+FAH5Bn4BaYQAJd66dhKfSGscCBnMtzU/IQ4
8qiQGARXnKPuT0NjM01aqoKIYOWt0OtVpoB76iMbVMXGQR/1LKaZUxnXG0l9Hy4D
ebd/NCTFdpF0emWsy2VQ74rzdErZ4EjFuxv9/IL/UAiI/bkFySbhphXujmwm12Y1
C8wf4fOegFmn5Kt+BEVp96BG5jsllybT/pqETxd+VqsUC1hOUXpDMZq7xY+Vlvsb
jQnryet+sLB/K/ceUmIZIhWFcjblMZBl3Bd+JKJaTnhPKx4Kn5b8OKHXLa9lWPvO
u3qg0YqD7s9Oj4Ybs/6MUMJW0aR1YQJWXuiTYU0R6XfqC35E0x3Cr/kndjt6YqUc
Dmv35ktq4EY9CAdS23KjVFP9KyIYcYmAhfH4qratTxxfULKpQTgFGeYLCe2ew0I7
PhNKXXveMCtafbVjEA5aYq9/ZIexMRtbI4RwmADhWYN3KfflWzLAHcI4D1UhdP3n
ronaW28kNAj3CVfqMNJnvtNkG8WZhgMPhKMDTzda6iNKStr77ETZ1zGi9rX6dX3S
6RGm2jPDzHReb8Fihpo2kJSPiGksT1AS6PslcQkZbEwfvkEG6tQEmAwsAZaLLpQP
OOetdq4Dle0sP/u4J5ELV6QwSN6ehMccGiHso37zRTAgreJXfkYC6XcqnGytbhjV
Sh2zyOryRz6MRf6aCaAW
=fMHI
-----END PGP SIGNATURE-----

--Sig_/J=GFX8rsQ.euj0GKgJm49Tj--

--===============1948340157==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1948340157==--
