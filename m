From: "Hanno =?utf-8?q?B=C3=B6ck?=" <hanno-60OJuG18Xr6zQB+pC5nmwQ@public.gmane.org>
Subject: Re: Current state - how to get gallium-stuff running?
Date: Sat, 8 Mar 2008 15:04:30 +0100
Message-ID: <200803081504.35171.hanno@hboeck.de>
References: <200803072132.23321.hanno@hboeck.de>
	<1204932443.8406.21.camel@CowboyLaputopu>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2145957280=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1204932443.8406.21.camel@CowboyLaputopu>
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
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============2145957280==
Content-Type: multipart/signed;
  boundary="nextPart1438259.9uZN7rRvEC";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart1438259.9uZN7rRvEC
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Am Samstag 08 M=C3=A4rz 2008 schrieb Christopher James Halse Rogers:
> First, the obligatory disclaimer: "really working" doesn't exactly
> translate to "Wooo!  I can drop that annoying binary blob!".  You should
> be able to get textured OpenGL support, and be able to run OpenArena at
> reasonable framerates until it crashes, though :).

Yeah, I'm fully aware of that and most I expect is some "wow, it (somehow)=
=20
works" just ofr my curiosity.

> I've seen other people reporting this error.  I've never seen it myself,
> which suggests to me that it's user error _somewhere_ :).  Can you
> describe the exact steps you took, and their output.

Using Gentoo, using the nouveau-overlay. Installing git-packages of libdrm,=
=20
x11-drm, xf86-video-nouveau. Changed mesa-package to fetch nouveau/mesa git=
=20
with gallium-0.1 branch. installed that.

modprobe nouveau
starting x

So, as I'm installing the stuff directly into the system (I know I'm crazy)=
, I=20
think the LD_foo doesn't apply to me.

http://rafb.net/p/EgQT6K88.html
Xorg.0.log if it's helping.

=2D-=20
Hanno B=C3=B6ck		Blog:		http://www.hboeck.de/
GPG: 3DBD3B20		Jabber/Mail:	hanno-60OJuG18Xr6zQB+pC5nmwQ@public.gmane.org

--nextPart1438259.9uZN7rRvEC
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.7 (GNU/Linux)

iD8DBQBH0pzzr2QksT29OyARAjmpAJ9dCabjguFeD1MLW87rLqcuwpfFOwCeOse4
evD7L+pXtaB7TB56dXoeSiY=
=X407
-----END PGP SIGNATURE-----

--nextPart1438259.9uZN7rRvEC--

--===============2145957280==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2145957280==--
