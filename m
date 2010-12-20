From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: Re: nouveau_bo_busy not supported in kernel anymore
Date: Mon, 20 Dec 2010 22:39:09 +0100
Message-ID: <87sjxs2kg2.fsf@riseup.net>
References: <1292880035.3094.266.camel@workstation>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1867257662=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1292880035.3094.266.camel@workstation> (Lucas Stach's message of
	"Mon, 20 Dec 2010 22:20:35 +0100")
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
Cc: Nouveau Dev List <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

--===============1867257662==
Content-Type: multipart/signed; boundary="==-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"

--==-=-=
Content-Type: multipart/mixed; boundary="=-=-="

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org> writes:

> Hi all,
>
> I want to bring up this issue again on the mailing list, since it got
> lost in some irc chat a few days ago.
>
> Deadwood came to the channel and noted that
> 25ee1f0e25195729f28b15f33d74db9ec6afd696 removes support for
> NOUVEAU_GEM_CPU_PREP_NOBLOCK in the kernel.

It doesn't, it just removes the NOBLOCK flag, because it's the default
(and only) behavior now.

>[...]

--=-=-=--

--==-=-=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iF4EAREIAAYFAk0PzP0ACgkQg5k4nX1Sv1sfJAD+KIo5If1zB0UJPKZyPABaNYxQ
34qkM/3oNltjzF7ex6AA/3W/kpVvOYdCg02J7WDQF8w/XRSNKVzb66YkPa7QBcNu
=z3PH
-----END PGP SIGNATURE-----
--==-=-=--

--===============1867257662==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1867257662==--
