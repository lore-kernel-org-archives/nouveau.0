From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH] drm/nouveau/kms: Implement KDB debug hooks
	for nouveau KMS.
Date: Sat, 21 Aug 2010 04:22:24 +0200
Message-ID: <87eidsemcf.fsf@riseup.net>
References: <m3iq9yqd7w.fsf@pullcord.laptop.org>
	<4C5ACF3F.8050409@windriver.com>
	<m3hbj0fju3.fsf_-_@pullcord.laptop.org>
	<m3aaoimqrp.fsf_-_@pullcord.laptop.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1580974081=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <m3aaoimqrp.fsf_-_-0VGQAjvlmrQzNDMTQreKSUB+6BGkLq7r@public.gmane.org> (Chris Ball's message of
	"Thu, 19 Aug 2010 13:55:06 -0400")
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Chris Ball <cjb-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, kgdb-bugreport-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Jesse Barnes <jbarnes-Y1mF5jBUw70BENJcbMCuUQ@public.gmane.org>, Jason Wessel <jason.wessel-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>
List-Id: nouveau.vger.kernel.org

--===============1580974081==
Content-Type: multipart/signed; boundary="==-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"

--==-=-=
Content-Type: multipart/mixed; boundary="=-=-="

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Chris Ball <cjb-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org> writes:

> Hi,
>
> Here's a patch to add support for KMS debugging to Nouveau, along the
> style of the previous patches for Intel=C2=B9 and Radeon=C2=B2.  I'm only=
 able
> to test on nv50 here, so a test on nv04 would be much appreciated,
> and I've published instructions on how to test here=C2=B3.  Thanks!
>
There is a problem with this on pre-nv20 cards. Fbcon acceleration won't
work properly with IRQs disabled because you miss the context switching
interrupts: You'll get a locked up fbcon if you hit sysrq-g when there's
some process using the GPU.

I'd suggest disabling acceleration while in debug mode (e.g. using
nouveau_fbcon_save_disable_accel()). That aside the patch looks good to
me.

> - Chris.
>
> =C2=B9:  http://lkml.org/lkml/2010/8/5/280
> =C2=B2:  http://dev.laptop.org/~cjb/kdb-radeon.patch
> =C2=B3:  http://blog.printf.net/articles/2010/08/19/kdb-kms-for-nouveau-r=
adeon
>
>
> [...]

--=-=-=--

--==-=-=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iF4EAREIAAYFAkxvOGAACgkQg5k4nX1Sv1sAMAD/bIeG539kUUcWqyNxOLJJZ8os
3B7BBjLuwPDHCBYy570BAJHoqjTqXYxQOGnlbZMnpvEvUx0dWd/fuZ6w643Aq9Cw
=/jyI
-----END PGP SIGNATURE-----
--==-=-=--

--===============1580974081==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1580974081==--
