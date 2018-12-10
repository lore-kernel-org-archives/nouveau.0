From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: next/master boot bisection: Oops in nouveau driver on
 jetson-tk1
Date: Mon, 10 Dec 2018 17:26:22 +0100
Message-ID: <20181210162622.GB4789@ulmo>
References: <89fa50d0-945f-d1ed-ae55-ee947187f209@collabora.com>
 <95255117123da3702da585491d2fdd74890937c0.camel@redhat.com>
 <16ca4f0f-6800-7204-6fc2-286caa7b850a@collabora.com>
 <20181210142559.GB6307@sirena.org.uk>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0913471051=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20181210142559.GB6307-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Guillaume Tucker <guillaume.tucker-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, kernel-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
List-Id: nouveau.vger.kernel.org


--===============0913471051==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="nVMJ2NtxeReIH9PS"
Content-Disposition: inline


--nVMJ2NtxeReIH9PS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 10, 2018 at 02:25:59PM +0000, Mark Brown wrote:
> On Mon, Dec 10, 2018 at 10:00:08AM +0000, Guillaume Tucker wrote:
> > On 08/12/2018 00:08, Lyude Paul wrote:
> > > uhhhhhhhhhhhhh
> > > didn't we fix this weeks ago? with "drm/nouveau: tegra: Call
> > > nouveau_drm_device_init()"
> >=20
> > Yes here's the fix from Thierry:
> >=20
> >   https://patchwork.freedesktop.org/patch/263587/
> >=20
> >=20
> > and I can confirm that it does fix the Oops when applied on top
> > of next-20181206 (what I used for the bisection last week):
> >=20
> >   http://lava.baylibre.com:10080/scheduler/job/71109
> >=20
> >=20
> > However the fix doesn't appear to have been applied in any
> > upstream tree yet.
>=20
> This has been broken for a considerable time now with no response from
> Ben - is there some other path we can use to get the fix merged?

I suppose we could go directly via Dave. But Ben's usually pretty
responsive, so he probably just missed it. Let me ping him on IRC, maybe
that'll get his attention.

Thierry

--nVMJ2NtxeReIH9PS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlwOk64ACgkQ3SOs138+
s6F6XQ/9ES0hTsz4LycsQufs+tw97MIYsZy4gUvyiX5rhUXz6/9wI5JVsEz+GV8z
Xd8Jn7FgbLh6lP1QW9+19mfUaLJfdRz/u2OmOUI+iQrPtpDIuLEiI5dHrUnYlVwr
88MvV265t9Wua8zD2NndZbwAU20iYBGTsaSUnqmw+vmvxP6z+Yr3ULoNqET3OFV+
1M+Lu6I+4ZCSvv14pjACQYzX4h5puXHk8Y1B8/3if4PFgA6ZQ5aILk4HFw232OLz
wQyDZEhfsRz0gb1kkBZuBq/UfTHGjSJ589L9RjNTy/yOmrFfTTb5o/KlzlvmK1Yz
nOFgkpNF2xLpniULwO3dWeI2GMjRidgGWAKqaxWpgXtDpE6hwFnKU8FEFgzOw9sc
kecoaAt8dOgrYnCC99hAM9qRcvwgXutN4gSVmDaLfJvecRbCk80tlJ42q5ujEMvE
CwBm7l7nuYPp0Yql/0A56YoYUIftVJtPr/cthtFZMA879tSzppwpxngaCu5k04uh
3yQulluwPJAkhgnljzAWa9+krla7Mfekr2Jy7O1OBVKbNpUVWfsXqPlfL4hky9b5
21REm8d8itrxAhZUzb979DicV1b8cx6gJodDfc+IHq8l8Pohi0RJZmfn5OnDY/cp
4LjjuH4nlSP1FDsGKomypqGAgoBeLQioyIrP0cCWprJFaJHHM6I=
=P7H+
-----END PGP SIGNATURE-----

--nVMJ2NtxeReIH9PS--

--===============0913471051==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0913471051==--
