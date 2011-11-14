From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: Re: Older Nvidia hardware driver state
Date: Mon, 14 Nov 2011 12:48:50 +0100
Message-ID: <877h32c4bh.fsf@riseup.net>
References: <CAEk2StnHM+Gr_GZkg=RJP5ooJR02YJFMmxQXq8rqc8SeCDC_rg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0720848190=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAEk2StnHM+Gr_GZkg=RJP5ooJR02YJFMmxQXq8rqc8SeCDC_rg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
	(Patrick Baggett's message of "Sun, 13 Nov 2011 19:34:35 -0600")
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Patrick Baggett <baggett.patrick-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============0720848190==
Content-Type: multipart/signed; boundary="==-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"

--==-=-=
Content-Type: multipart/mixed; boundary="=-=-="

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Patrick Baggett <baggett.patrick-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:

> Hi all!
>
Hi,

> I read that the older Nvidia hardware (maybe < GF8) is in a different driver
> and no longer maintained. Is that the case?

Yes and no.  If you're talking about the 3d drivers, I've done pretty
much nothing as maintainer of the nv04-nv20 driver in the last few
months, and the same goes for the nv30-nv40 driver, mostly because of
lack of time of the people involved.  If you're talking about 2d, the
situation is considerably better.

And of course there's hardware-specific code different for each card
generation, but IMHO calling them different separate drivers would be
wrong, there's a significant amount of shared code.

> I have a GeForce 4000 MX that I'm trying to get to work on
> debian/sparc64, which I admit is a bit of longshot, but I was
> wondering how much effort it would take to even get the driver to
> build, and then to function. I'm very proficient in C but don't have
> much experience writing drivers.
>
It *should* be functional to a large extent, it's just that it might
have bred a few bugs while we weren't looking :).  In any case your help
is very welcome if you know how to program, feel free to address any
questions to this mailing list or to the #nouveau IRC channel.

> Patrick Baggett
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau

--=-=-=--

--==-=-=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iF4EAREIAAYFAk7BACIACgkQg5k4nX1Sv1uDGAD+Kv7G1+BSwrkblEtg2UTc+iAo
fz7ZK4R1RFiuJgG49nUA/0FE7BbVc4OBjb+oI1U2c0blxZ4gaJeq9Rzvtcm18Qbt
=SpQw
-----END PGP SIGNATURE-----
--==-=-=--

--===============0720848190==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0720848190==--
