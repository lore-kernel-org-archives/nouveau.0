From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: next/master boot bisection: Oops in nouveau driver on
 jetson-tk1
Date: Tue, 11 Dec 2018 00:51:28 +0000
Message-ID: <20181211005128.GA3004@sirena.org.uk>
References: <89fa50d0-945f-d1ed-ae55-ee947187f209@collabora.com>
 <95255117123da3702da585491d2fdd74890937c0.camel@redhat.com>
 <16ca4f0f-6800-7204-6fc2-286caa7b850a@collabora.com>
 <20181210142559.GB6307@sirena.org.uk> <20181210162622.GB4789@ulmo>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1468085478=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20181210162622.GB4789@ulmo>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Guillaume Tucker <guillaume.tucker-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, kernel-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
List-Id: nouveau.vger.kernel.org


--===============1468085478==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Qxx1br4bt0+wmkIi"
Content-Disposition: inline


--Qxx1br4bt0+wmkIi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Dec 10, 2018 at 05:26:22PM +0100, Thierry Reding wrote:
> On Mon, Dec 10, 2018 at 02:25:59PM +0000, Mark Brown wrote:

> > This has been broken for a considerable time now with no response from
> > Ben - is there some other path we can use to get the fix merged?

> I suppose we could go directly via Dave. But Ben's usually pretty
> responsive, so he probably just missed it. Let me ping him on IRC, maybe
> that'll get his attention.

This is at least the third go at reporting this as a boot failure IIRC
so these clearly aren't doing the trick :/ .  Perhaps a resend as well?

--Qxx1br4bt0+wmkIi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlwPCg0ACgkQJNaLcl1U
h9COzggAg0zNEhWVa+Iz0oQAKqj0KyMUg0Vf2WMO1tGdUfeMcT5QCmhGqrlN6nEh
NUKJT6A3b3uVnh9HzSrBjzfXM9wfS8DSdMYGoXzN5cQVnlN3u0Awe4mwlAjR4r0W
aEPrMlJS3iIZ74uGMKrB+LzmKF1h79fu5ssL0Bdvh3lvYm5asUA6I1zpy3GX4K04
LaupBTL92aPrV/Nxhu52li1N0sEWszq0Rkm6vlbHbUu5pSLuPrjSck1nn87H4K/g
aNyMm8GV9PMhij+OoAFti1Gr7MhLG/hxlkpXxw4iHtOwd8jmVsTRc/NzNiEAxj9+
x3Vhm9WafzqtTDnxv3/scLHx3iHmgw==
=/7qx
-----END PGP SIGNATURE-----

--Qxx1br4bt0+wmkIi--

--===============1468085478==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1468085478==--
