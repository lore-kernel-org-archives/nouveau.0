From: Christopher James Halse Rogers <raof-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org>
Subject: Re: Blank screen at startup (conflict with VESA VGA)
Date: Tue, 13 Apr 2010 11:15:28 +1000
Message-ID: <1271121328.3035.2.camel@Spike>
References: <4BBB8B8E.9050004@epsm.fr> <20100410220119.GA2949@joi.lan>
	<4BC1DF11.3000603@epsm.fr> <20100411153919.GA12618@joi.lan>
	<4BC1FA45.1050808@epsm.fr> <20100411170535.GA4016@joi.lan>
	<4BC2231C.2060509@epsm.fr> <4BC2BA76.8040509@epsm.fr>
	<20100412101413.GA2733@joi.lan> <4BC2F69E.6000905@epsm.fr>
	<20100412105013.GA2789@joi.lan>
	<20100412200458.0380a4fe@daedalus.pq.iki.fi>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1234770282=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20100412200458.0380a4fe-cxYvVS3buNOdIgDiPM52R8c4bpwCjbIv@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
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


--===============1234770282==
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature"; boundary="=-vlVLjhhKtxmNPIjTL+hd"


--=-vlVLjhhKtxmNPIjTL+hd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2010-04-12 at 20:04 +0300, Pekka Paalanen wrote:
> On Mon, 12 Apr 2010 12:50:13 +0200
> Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>=20
> > I'm not aware of any trick to make both nv and nouveau working.
> > Maybe there should be a way to prevent nv (and vesa, but not
> > fbdev) from loading when KMS is in use?
>=20
> Yeah, there was a brief discussion about that recently:
> http://people.freedesktop.org/~cbrill/dri-log/index.php?date=3D2010-03-21=
&channel=3Dnouveau&show_html=3Dtrue&highlight_names=3D&update=3DUpdate&date=
=3D2010-03-21
>=20
> I haven't heard anything about it since.
>=20

I wrote a patch for vesa on bugzilla[1] to do exactly that; a similar
one for nv wouldn't be hard.

[1] https://bugs.freedesktop.org/show_bug.cgi?id=3D26878

--=-vlVLjhhKtxmNPIjTL+hd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQEcBAABAgAGBQJLw8WjAAoJEBUHnPSAqAygKTwH/RqJb6kuK2Q6QvGzUyloJOlV
LblxSKiAHXG9vUgmeLjZmVGXw1BkEdOj7XjOQL/tXZnwD60ftnid33yZGot3jFJs
JTiAhyipgCCexAIuZ4+Ws7lSoSZY1tfMGlSDOE2/QQET/fJH/CdqWvWSiY00susq
I/oh1Klbf1QngIISEdcFltYrcHJlIu4aZzfTU644q6Mps3+94N3EAruOnLlJi9DO
30NaFJt8h1x5GGf+m4HLKINRhLtXbauzYLuJGLkoH5NMXY2hSe/5Gg4KDpanUElk
PF0LWH6E13T5PcVunivBq4c4Qwk9aMjezJsIuEVwZbsi6NXbpKAu1MoYTw7qNLA=
=zrCo
-----END PGP SIGNATURE-----

--=-vlVLjhhKtxmNPIjTL+hd--


--===============1234770282==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1234770282==--
