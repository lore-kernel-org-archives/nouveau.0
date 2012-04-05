From: Daniel Wallace <daniel.wallace-/4noJB3qBVQ3uPMLIKxrzw@public.gmane.org>
Subject: nvidia gt 545 and nouveau
Date: Wed, 4 Apr 2012 20:25:12 -0400
Message-ID: <20120405002512.GA1517@Daniel-Tower>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0835770871=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0835770871==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wac7ysb48OaltWcw"
Content-Disposition: inline


--wac7ysb48OaltWcw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

I have 2 monitors plugged into the same nvidia card
(running nouveau) one can be either DVI-I or VGA(vga right now) and the
other is hdmi, right now, I am just trying to get the monitors to not
be clones of each other and to be side by side. When i do xrandr
--output HDMI-1 --pos 0x0 --output VGA-1 --auto --right-of HDMI-1, the
whole screen freezes with the mouse in between the 2 monitors and I
can't do anything except kill the power and reboot, Anyone have any
ideas where to start, because I have looked for several hours now and I=20
can't find anything that would be causing this issue.

What happens when It freezes is the mouse literally gets stuck in=20
between the two screens (half on either screen) and since I am unable
to do any commands with the keyboard I can't take a screen shot.  I
would really like to be able to use nouveau and xrandr, because I don't
really want to use Xinerama with the proprietary drivers because then I
am unable to use compositing.

Any thoughts and questions would be greatly appreciated.

Thanks,
Daniel Wallace

--wac7ysb48OaltWcw
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQEcBAEBAgAGBQJPfOZoAAoJEF+l5VRPAQ1IX1IH/RXCVPjepAtfmuw42XXeuvX7
dOlz+GzuRZVk4tLB9fq3HHU1gaN8zd0LYrb86Q7eDBrNO7x2vtwnJcWOaN+sfYLE
zz0eE0OIYyFNXQcUruJrZZQgVfNaYRvf+w6qfAm2HzOOQTXzcFdRpbWkc7RgPi3E
6nM0CJvS6/m38bQ4lgTVnT/2BQXnzYbdveNr9oLjeJTLH0/oPYeK4QFHb68dlEZ3
9jr3JGPCABAmvYlLjyeIwwRncyuILS6lvbRa2q8tbxPtaxMHbhR8a2XS5SRnqnX9
FjGUhp9gNU1iNIRFgWMUhZ8GfbnLBIkBmeeqMeu1NaaUYkZB1ProCcrXZxiuZWA=
=1FdE
-----END PGP SIGNATURE-----

--wac7ysb48OaltWcw--

--===============0835770871==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0835770871==--
