From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: Re: [RFC/PATCH] Switch dri driver to use rules-ng-ng
	headers
Date: Mon, 15 Nov 2010 18:37:31 +0100
Message-ID: <87d3q6wkro.fsf@riseup.net>
References: <1288571454-8151-1-git-send-email-noviktor@seznam.cz>
	<87k4kewm2h.fsf@riseup.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0949459060=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <87k4kewm2h.fsf-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org> (Francisco Jerez's message of "Mon,
	15 Nov 2010 18:09:26 +0100")
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

--===============0949459060==
Content-Type: multipart/signed; boundary="==-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"

--==-=-=
Content-Type: multipart/mixed; boundary="=-=-="

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org> writes:

> Viktor Novotn=C3=BD <noviktor-9Vj9tDbzfuSlVyrhU4qvOw@public.gmane.org> writes:
>>
>> Hi,
>>
>> following patches make the dri driver use rules-ng-ng(rnn) generated reg=
ister definitions instead of renouveau generated ones.
>> First set of 5 patches is for mesa repository, second set of 4 patches i=
s for rnn and consists of changes ported from renouveau.
>>
> Everything pushed, thanks!

By the way, there's a new rules-ng-ng repository here:

   http://nouveau.git.sourceforge.net/git/gitweb.cgi?p=3Dnouveau/envytools;=
a=3Dsummary
   git://nouveau.git.sourceforge.net/gitroot/nouveau/envytools
   ssh://USERNAME-544KYIEcJNaTAPO+BZSMPv4XsKrqFRkM0e7PPNI6Mm0@public.gmane.org/gitroot/nouveau/envytools

Everyone that used to have write access to the renouveau database should
be able to commit there too.

--=-=-=--

--==-=-=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iF4EAREIAAYFAkzhb9sACgkQg5k4nX1Sv1sH9wD+JuRb1XxLOgQuKsBvjzv1D0wT
xh6XvTPbBE2rUdbxIeEA/1qXkCqNEbpVwLkdkjY4c8yeMVNN3nnhoWYZD/Arc2xz
=0lPn
-----END PGP SIGNATURE-----
--==-=-=--

--===============0949459060==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0949459060==--
