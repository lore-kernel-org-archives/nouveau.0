From: Christopher James Halse Rogers <chalserogers-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: KMS instructions
Date: Wed, 25 Mar 2009 08:07:39 +1100
Message-ID: <1237928859.4750.10.camel@CowboyLaputopu>
References: <8b96e3d20903241244i314351fdk80b54c24ec05b352@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0524512537=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <8b96e3d20903241244i314351fdk80b54c24ec05b352-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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


--===============0524512537==
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature"; boundary="=-hD5lhrfJkcp4hC7jvqyo"


--=-hD5lhrfJkcp4hC7jvqyo
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Tue, 2009-03-24 at 16:44 -0300, Luiz Angelo Daros de Luca wrote:
> Hello,
>=20
> I'm using nouveau in a NV44 for some time now. I specially use randr
> in a rotated/dualhead setup with 2 monitors (15' and 19').
> In my last build, randr stopped to work. If I change
> resolution/rotate/span a screen, xorg crashes.
>=20
> I wrote a simple script to update nouveau, build and install. I'm
> attaching it. Feel free to do anything with it.
>=20
> I didn't find any instructions in the wiki how to test KMS. Maybe my
> problems are related to some tests on KMS side. Is there someone with
> the knowledge and will to add the instructions?

It's not going to be a KMS issue.  Unless things have changed in the
last couple of weeks, KMS is currently only available for nv5x/nv6x, and
only if you deliberately build from the modesetting-gem branch of drm.

I'd suggest filing a bug, attaching Xorg.0.log & dmesg with drm loaded
with the 'debug=3D1' parameter as usual.  If you've got the facilities,
attaching gdb and a getting a backtrace would probably be welcome, too!

--=-hD5lhrfJkcp4hC7jvqyo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEABECAAYFAknJS5QACgkQ/Aocxi8wZlFuvACgitVzCrR/g9CHW/sClcVLnBxb
nvAAn1QRs4cJjomuspxcbNFjJNoYliFH
=cAVq
-----END PGP SIGNATURE-----

--=-hD5lhrfJkcp4hC7jvqyo--


--===============0524512537==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0524512537==--
