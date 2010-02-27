From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: Re: GeForce 6150SE: DVI-connector not detected
Date: Sat, 27 Feb 2010 16:50:21 +0100
Message-ID: <87hbp2ptj6.fsf@riseup.net>
References: <4B88FC7A.6010403@googlemail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0491003959=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <4B88FC7A.6010403-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> (Frank Schaefer's message of
	"Sat, 27 Feb 2010 12:05:30 +0100")
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Mime-version: 1.0
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Frank Schaefer <fschaefer.oss-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============0491003959==
Content-Type: multipart/signed; boundary="==-=-=";
	micalg=pgp-sha1; protocol="application/pgp-signature"

--==-=-=
Content-Type: multipart/mixed; boundary="=-=-="

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi,

Frank Schaefer <fschaefer.oss-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> writes:

> Hi,
>
> today I tested kernel 2.6.33 and it seems that nouveau doesn't detect
> the DVI-connector of my GeForce 6150SE (Asus M2N-VM DH).
> The screen turns black during boot-process immediately after the "[drm]
> nouveau ..." messages appeared.
>
It looks like your IGP uses some sort of weird-ass external TMDS
encoder, an mmiotrace from the blob enabling DVI on this card might be
useful, see [1] and the mmiotrace docs in the linux kernel tree for the
details.

[1] http://nouveau.freedesktop.org/wiki/MmioTrace

> The board has two connectors (DVI + VGA) and I'm using the DVI-connector
> only. Everything is fine when I use a VGA-cable instead.
>
> See boot.msg in the attachment. Please tell me if you need further
> informations. I can also test patches.
>
> Regards,
> Frank Schaefer
>

--=-=-=--

--==-=-=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkuJPz0ACgkQ196Zy2qEI5fPAQCgxEBQq9nLTqd68Zcf5M9FGONn
WAcAnA5760o685j8RtcI7Ugk1GMwmDpU
=FiEm
-----END PGP SIGNATURE-----
--==-=-=--

--===============0491003959==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0491003959==--
