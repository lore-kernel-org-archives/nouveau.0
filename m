From: Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org>
Subject: Re: [PATCH] drm/nouveau: add Maxwell to backlight
 initialization
Date: Sun, 22 May 2016 09:53:49 +0200
Message-ID: <20160522075349.GB4319@Thessia>
References: <1463856103-4002-1-git-send-email-farisbenbrahem@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1152723341=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1463856103-4002-1-git-send-email-farisbenbrahem-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Faris Alsalama <farisbenbrahem-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1152723341==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PuGuTyElPB9bOcsM"
Content-Disposition: inline


--PuGuTyElPB9bOcsM
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Acked-by: Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org>

On 02:41 PM - May 21 2016, Faris Alsalama wrote:
> Signed-off-by: Faris Alsalama <farisbenbrahem-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/gpu/drm/nouveau/nouveau_backlight.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nouveau_backlight.c b/drivers/gpu/dr=
m/nouveau/nouveau_backlight.c
> index 89eb460..dd1cc9b 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_backlight.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_backlight.c
> @@ -232,6 +232,7 @@ nouveau_backlight_init(struct drm_device *dev)
>  		case NV_DEVICE_INFO_V0_TESLA:
>  		case NV_DEVICE_INFO_V0_FERMI:
>  		case NV_DEVICE_INFO_V0_KEPLER:
> +		case NV_DEVICE_INFO_V0_MAXWELL:
>  			return nv50_backlight_init(connector);
>  		default:
>  			break;
> --=20
> 2.1.4
>=20
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau

--PuGuTyElPB9bOcsM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXQWWFAAoJEI7uMhYTPh3w/qYQAIJxdkFED65IYgHm2V1fSDxj
XuSWm9sOZnvbWTNkVTaM3aG5UlBcQg6Jo/yvoaolEZalBP84YldmyxgSXlpSR/QX
8P+rZipM5QXc1yOgnxLtMJHWfX0XAnTtAD9K8oL4RxQVrOhWHMhH2xe2p5U5atO7
Ia+yStR3QVGeszJXLy6AiUyBUF/uS9XcvRDn3zbBm/hFr+8OQwik70HZPFEmHHAR
IYR7TQ8MbzSDgmSzaykYDUKQELJeASn3GWulHnRcp08CkJKOOc92VpCTVoNeEon6
UPhgFV9AnuXp2/Yn6ckus8eaAuqOk/CtgZcgH70q6fGdDBi48sWUFaeoOdZmgslL
99n+c2kKMJrDmTcU1fgHgKWdCpKJl5Yz3Qkl/IMLzkBMAW32vn0uPnh8QqYC/YfR
gOMdxiuH4+Glrd1MFGuk1RLtZ+LbnW2fVbpJE5ge25ikcH0Kg3d7RWve7mZQuF6H
GABD2sTa6aph/uou3ju/BKijgFa0+YNwe4yMMzmWYoQvbgHz2Pp5HxiEmulKtmIg
hFgtD2VqAlrdtBPQNcq2nqFHS3f+S9N45KP6F2HMZZpPPmnhs7n5+0ptU0yFl8A7
fRY64H5FwkhCJZ7M2NkPMfVw43K/Z7nMM7lZoclv77k+oIil8g/W778KY2Y7DPDl
9prw83WhKtHFPUhLTJzz
=G6jJ
-----END PGP SIGNATURE-----

--PuGuTyElPB9bOcsM--

--===============1152723341==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1152723341==--
