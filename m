From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: Re: Enabling TV-out with the nouveau driver
Date: Thu, 10 Jun 2010 12:37:34 +0200
Message-ID: <87k4q7mavl.fsf@riseup.net>
References: <4C10A1F8.4010107@romtelecom.ro>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0240158224=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <4C10A1F8.4010107-W9Zz3XeOr4Mo9/FJvwSGXQ@public.gmane.org> (Adrian Popa's message of "Thu,
	10 Jun 2010 11:27:36 +0300")
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Mime-version: 1.0
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Adrian Popa <adrian_gh.popa-W9Zz3XeOr4Mo9/FJvwSGXQ@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============0240158224==
Content-Type: multipart/signed; boundary="==-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"

--==-=-=
Content-Type: multipart/mixed; boundary="=-=-="

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Adrian Popa <adrian_gh.popa-W9Zz3XeOr4Mo9/FJvwSGXQ@public.gmane.org> writes:

> Hello everyone,
>
> First of all - congratulations on the success of your project. It was
> about time the community did something about the nvidia drivers! :)
>
> Now, I'm still experimenting with nouveau and I have enabled it on a
> test system that has a rather old Nvidia card (GeForce4 I think) with
> tv-out. Everything works fine, but I haven't been able to find any
> examples on how to configure tv-out so I can extend my desktop to my
> TV.

Which card exactly? nv1x-based gf4 cards should be fine but nv2x GPUs
need an external TV encoder chip (and right now we only have a driver
for ch7006 and similar external encoders). So, if your card has one of
the supported encoders, you'll see a "TV-1" connector in the output of
"xrandr".

>
> Can anyone help with a demo configuration of Xorg.conf?
>
It's configured as a regular RandR12 output, so it should just work with
the minimal xorg.conf [1], if you need to do something fancier like
changing the relative output positions or setting TV-specific
properties, see [2] and [3] (check out the TV-related kernel module
parameters too, see "modinfo nouveau").

> Also, I want to ask - if there is any chance of using two displays
> *and* enabling compositing (window transparency effects) - either with
> software or hardware acceleration?

It should work, but keep in mind that nv1x cards have a rather crude
pitch limitation (you'll get no hw accel if your desktop is larger than
2048x2048).

>
> By the way, I am using Xubuntu 10.04.
>
> Regards,
> Adrian
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau

[1] http://nouveau.freedesktop.org/wiki/InstallNouveau
[2] http://nouveau.freedesktop.org/wiki/Randr12
[3] http://wiki.debian.org/XStrikeForce/HowToRandR12

--=-=-=--

--==-=-=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iF4EAREIAAYFAkwQwG4ACgkQg5k4nX1Sv1tLPgD7BBN6jmZIYKPrcn3YVJXdI1qQ
VCwzakj8szSD078XXkkA+gKrXt+HsrZKYOBlN/ld+kdNlwSAUGuJnzoaLNmk3mY5
=KPuq
-----END PGP SIGNATURE-----
--==-=-=--

--===============0240158224==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0240158224==--
