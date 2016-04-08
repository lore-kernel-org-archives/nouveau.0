From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] tegra: acquire and enable reference clock if
 needed
Date: Fri, 8 Apr 2016 11:03:43 +0200
Message-ID: <20160408090343.GA4652@ulmo.ba.sec>
References: <1459478264-27990-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0437583646=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1459478264-27990-1-git-send-email-acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org


--===============0437583646==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="n8g4imXOkfNTN/H1"
Content-Disposition: inline


--n8g4imXOkfNTN/H1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 01, 2016 at 11:37:44AM +0900, Alexandre Courbot wrote:
> GM20B requires an extra clock compared to GK20A. Add that information
> into the platform data and acquire and enable this clock if necessary.
>=20
> Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> Hi Ben,
>=20
> The DT bindings for this have been approved but not merged yet. This means
> that for 4.6 GM20B will fail to probe unless the DT is patched - but this
> is better than the current situation where it silently freezes. Can you
> take this for the next -rc? Thanks!
>=20
>  drm/nouveau/include/nvkm/core/tegra.h  |  5 +++++
>  drm/nouveau/nouveau_platform.c         |  7 ++++++-
>  drm/nouveau/nvkm/engine/device/tegra.c | 17 +++++++++++++++++
>  3 files changed, 28 insertions(+), 1 deletion(-)

Yes, this looks like the proper fix for Tegra210:

Reviewed-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--n8g4imXOkfNTN/H1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXB3PtAAoJEN0jrNd/PrOhW9AP/jpqTHktkJ58zGdRM40RBawr
nz6GeAO62Ra6jeGIYo2OsGN+XyGoEm5nBmb3ligFw7OrKOYeXzrHUJbrfkM1IDCP
zQ3Smp4lC8u9m3M1djCQQvYkokxRm88JNEk0IdBvhr0M9Y2UGChKpFvVV+C6ATMV
smr4cpAtxskLwePNSC8XCbAafIuemOhGmZO0Rj2Vrl01QEkkON8I4t147gSDIBdF
Qo0dOICrTVbMIu9zHrMJUywsRk7+WJsIGf8DgknT6DGJoboVDAVCxqJourhVHbfL
3Y6+yXNMoHE5gOKbuoikYUgkhovi7fuMXv9uRVxG6IR97goiUoH7jc3zjPW8vtah
25h4KKtcOyL8dk72ukKwrcij8HbRnSFUfAH8m7QY00JsP0SqXmWJZ2/oM6F9NKI0
VgQDdiMKC+w+ytVXa1upCFsDs8iVAqIlGgvd365FKmHRsxCpO+pV8y0hFaOoy8+k
JT5R/pRGGAGSdbEsLhfMZaL7PMvY80hXOIqApO9W3cMs8i4bNRgd1gtuT+spC1Gc
m9ExGDogND3WVwSPb6W3HU8HgUxqq0AQ1v8KG0RMmziB96+UgXAOtzlWzNrkTROf
bTPZuxjlVzyHbDJct/kfcfoUdRoXoWfuIFQrFxrIroKUONKiCzBsAtVrhLtwtuNk
EHaGcQq/qlboGR85yO2q
=nH1/
-----END PGP SIGNATURE-----

--n8g4imXOkfNTN/H1--

--===============0437583646==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0437583646==--
