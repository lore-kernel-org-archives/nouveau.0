From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH] drm/nouveau: fix nv40 gart size
Date: Tue, 19 Oct 2010 17:02:49 +0200
Message-ID: <87lj5ucjja.fsf@riseup.net>
References: <1287321287.2215.13.camel@workstation> <87sk03d33v.fsf@riseup.net>
	<1287414570.2373.5.camel@workstation>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2020910898=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1287414570.2373.5.camel@workstation> (Lucas Stach's message of
	"Mon, 18 Oct 2010 17:09:30 +0200")
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Cc: Nouveau Dev List <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

--===============2020910898==
Content-Type: multipart/signed; boundary="==-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"

--==-=-=
Content-Type: multipart/mixed; boundary="=-=-="

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org> writes:

> Oh, yes. It seems my email client had some good lunch with the tabs.
>
> I added the patch as an attachment. Hope it works this time.
>
> -- Lucas
>
Thanks, pushed.

> Am Montag, den 18.10.2010, 15:47 +0200 schrieb Francisco Jerez:=20
>> Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org> writes:
>>=20
>> > Nouveau sets GART size to 64MiB for all cards before nv50, but nv40 has
>> > enough RAMIN space to support 512MiB GART size. This patch fixes this
>> > value to make use of this hardware capability.
>> >
>> > Signed-off-by: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
>> > ---
>> The patch doesn't seem to apply, I guess it's been corrupted on the way.
>> Can you please resend?

--=-=-=--

--==-=-=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iF4EAREIAAYFAky9sxoACgkQg5k4nX1Sv1vFNQD+OAVAHY2PxCXQw9E97iAtQOSd
LcBDKYVqX3ONl+IARb8A/AofMzZvD5n4uBvMRBU1dR3sie536W9R7JkUuyiEUD10
=BIMl
-----END PGP SIGNATURE-----
--==-=-=--

--===============2020910898==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2020910898==--
