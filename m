From: Anthony Callegaro <callytic-GANU6spQydw@public.gmane.org>
Subject: Re: [PATCH] nouveau: avoid running out of relocs (attempt
 5)
Date: Mon, 14 Dec 2009 11:13:09 +0000
Message-ID: <1260789189.2532.31.camel@anthony>
References: <1260716857-6599-1-git-send-email-madman2003@gmail.com>
	<91752840912131234s65c0f4fenc3a9d9c39b3d41b1@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1774274569=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <91752840912131234s65c0f4fenc3a9d9c39b3d41b1-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Mime-version: 1.0
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org


--===============1774274569==
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature"; boundary="=-DWpmspa1hAvD022FS85I"


--=-DWpmspa1hAvD022FS85I
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Re-posting to the list :o(

On Sun, 2009-12-13 at 21:34 +0100, Xavier wrote:
> Tested on NV35.
> No obvious regressions on xmoto and teeworlds (I didn't benchmark
> though, but the perf felt similar).
>=20
> I was wondering, is there any practical testsuite for this kind of
> regression testing ?
> It would be cool to just run a set of tests known to work on nv30 for
> example, and getting automatically a summary of the results. Then run
> again after a patch and compare.
> Any suggestions that get close to that are welcome :)

Well we could set up a PTS test farm. Apparently Phoromatic is now able
to be coupled with git to find the commit from which a regression was
introduced. I never been a fan of benchmarking but I see major interest
in this new automatic testing tool, especially now that it is able to
return image quality and so driver bugs. So if we could find enough
people interested with a panel of all cards, we could provide the
developers with a great tool to check that their modifications didn't
broke anything.

Just a thought.
LeTic


--=-DWpmspa1hAvD022FS85I
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEUEABECAAYFAksmHcMACgkQNSoUaANIAMhdNACWMQOG+fmcRk6PDI5easROlEQV
ZwCfYOF2Fwy/YYDDMoCaErkMYcY3IHA=
=jtun
-----END PGP SIGNATURE-----

--=-DWpmspa1hAvD022FS85I--


--===============1774274569==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1774274569==--
