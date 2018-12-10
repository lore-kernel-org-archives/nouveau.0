From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: next/master boot bisection: Oops in nouveau driver on
 jetson-tk1
Date: Mon, 10 Dec 2018 14:25:59 +0000
Message-ID: <20181210142559.GB6307@sirena.org.uk>
References: <89fa50d0-945f-d1ed-ae55-ee947187f209@collabora.com>
 <95255117123da3702da585491d2fdd74890937c0.camel@redhat.com>
 <16ca4f0f-6800-7204-6fc2-286caa7b850a@collabora.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0288559628=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <16ca4f0f-6800-7204-6fc2-286caa7b850a-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Guillaume Tucker <guillaume.tucker-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, kernel-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0288559628==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tsOsTdHNUZQcU9Ye"
Content-Disposition: inline


--tsOsTdHNUZQcU9Ye
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 10, 2018 at 10:00:08AM +0000, Guillaume Tucker wrote:
> On 08/12/2018 00:08, Lyude Paul wrote:
> > uhhhhhhhhhhhhh
> > didn't we fix this weeks ago? with "drm/nouveau: tegra: Call
> > nouveau_drm_device_init()"
>=20
> Yes here's the fix from Thierry:
>=20
>   https://patchwork.freedesktop.org/patch/263587/
>=20
>=20
> and I can confirm that it does fix the Oops when applied on top
> of next-20181206 (what I used for the bisection last week):
>=20
>   http://lava.baylibre.com:10080/scheduler/job/71109
>=20
>=20
> However the fix doesn't appear to have been applied in any
> upstream tree yet.

This has been broken for a considerable time now with no response from
Ben - is there some other path we can use to get the fix merged?

--tsOsTdHNUZQcU9Ye
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlwOd3YACgkQJNaLcl1U
h9B6Rgf/bJtsIULPYVRHDpanZzM0vxe8mXIyPKGEXQDuiqx31rFQqH8gFpBlfbth
IFTG5eZ/8u88YVZkmCNTYBGQN/e+4m1bkBPLA7yOYivI9wvEQMxhqeIZk17TU2h9
RmASuzBghhL13HemWXo8qEy4dkMl60J2YiqGrOUFjFEdeupX50bLUZ52PgSKTaWI
xMiZn6F9EIC0nBpFS30AFKtl+rORHq2Psv3C9J6LiqEtODS+qLNp3WI+qELH+WaX
vvm4qfw0jtn329X3BgoO6SszYggGF/Za04tj6m5148lENqGXzHoSIKdIxlulLIdT
vccDmTSma5GrJRfbgbwxuhkSaifRzA==
=TjTM
-----END PGP SIGNATURE-----

--tsOsTdHNUZQcU9Ye--

--===============0288559628==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0288559628==--
