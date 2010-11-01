From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: Re: [RFC/PATCH] Switch dri driver to use rules-ng-ng
	headers
Date: Mon, 01 Nov 2010 18:15:28 +0100
Message-ID: <87k4kx7yof.fsf@riseup.net>
References: <1288571454-8151-1-git-send-email-noviktor@seznam.cz>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1456731329=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1288571454-8151-1-git-send-email-noviktor-9Vj9tDbzfuSlVyrhU4qvOw@public.gmane.org> ("Viktor
	=?utf-8?Q?Novotn=C3=BD=22's?= message of "Mon,
	1 Nov 2010 01:30:45 +0100")
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
Cc: Marcin-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org, nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

--===============1456731329==
Content-Type: multipart/signed; boundary="==-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"

--==-=-=
Content-Type: multipart/mixed; boundary="=-=-="

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Viktor Novotn=C3=BD <noviktor-9Vj9tDbzfuSlVyrhU4qvOw@public.gmane.org> writes:

> From: Viktor Novotn=C3=BD <noviktor-9Vj9tDbzfuSlVyrhU4qvOw@public.gmane.org>
>
> Hi,
>
> following patches make the dri driver use rules-ng-ng(rnn) generated
> register definitions instead of renouveau generated ones.  First set
> of 5 patches is for mesa repository, second set of 4 patches is for
> rnn and consists of changes ported from renouveau.
>
Some renames seem awkward to me, but I can get used to it. I'm OK with
the change as long as Ben agrees with it too (along with a similar change
for the DDX), and the rnn repository moves somewhere we can all commit to
(i.e. sourceforge).

Marcin? What are your feelings with regard to that possibility?

BTW, is rnn already a complete replacement of the renouveau database? Can
it be used to turn renouveau/mmt dumps into a human readable form?

> One thing I do not understand is, why rnn does not generate
> NV20_3D_TEX_ENABLE__LEN(should be 4), so any pointers on what to do
> are welcome, as are any other comments, suggestions etc.
>
That's no big deal, there's already a define with the number of texture
samplers in nv20_driver.h:35.

> Regards
> 	Viktor
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau

--=-=-=--

--==-=-=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iF4EAREIAAYFAkzO9bAACgkQg5k4nX1Sv1sSvQEAkotXY1vxLfJoacYdNBRfGryC
HYIqD+l6ed6DxOYGa0QA+QHuuSoQbzDmX8d0MspAAf0N3pQXVamdKMSvAZF2ZP/c
=Zo2p
-----END PGP SIGNATURE-----
--==-=-=--

--===============1456731329==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1456731329==--
