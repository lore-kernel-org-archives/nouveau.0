From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH v2 0/2] S3TC support for nv10-20
Date: Wed, 02 May 2012 03:14:57 +0200
Message-ID: <87sjfjv0xa.fsf@riseup.net>
References: <4F7F0E8A.6020403@seznam.cz> <1335270921.13186.7.camel@nisroch>
	<87ty09upbv.fsf@riseup.net>
	<1335878631-15336-1-git-send-email-noviktor@seznam.cz>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0713266416=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1335878631-15336-1-git-send-email-noviktor-9Vj9tDbzfuSlVyrhU4qvOw@public.gmane.org> ("Viktor
	\=\?utf-8\?Q\?Novotn\=C3\=BD\=22's\?\= message of "Tue,
	1 May 2012 15:23:49 +0200")
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Viktor =?utf-8?Q?Novotn=C3=BD?= <noviktor-9Vj9tDbzfuSlVyrhU4qvOw@public.gmane.org>
Cc: nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

--===============0713266416==
Content-Type: multipart/signed; boundary="==-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"

--==-=-=
Content-Type: multipart/mixed; boundary="=-=-="

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Viktor Novotn=C3=BD <noviktor-9Vj9tDbzfuSlVyrhU4qvOw@public.gmane.org> writes:

> Hi,
>
> thanks for feedback, I finally got to get through your comments - I hope =
it's OK now.

Hey, thanks, both patches pushed.

> BTW if you are going to test this, it seems to me that 784dd51198 have br=
oken piglit's
> fbo-generatemipmap-formats and s3tc-teximage tests, could you confirm?
>
Yeah, those also fail for me here.

> 	Viktor
>

--=-=-=--

--==-=-=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iF4EAREIAAYFAk+gipgACgkQg5k4nX1Sv1vVMQEAniu6cLQ1n7BVN/q24ZqpegEh
W9Qg9g5SmnnES3cdDAoA/Aqz/REsUSPDXhRsq11gk3M3k/C5IF17W9pS86hLYULz
=Th/B
-----END PGP SIGNATURE-----
--==-=-=--

--===============0713266416==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0713266416==--
