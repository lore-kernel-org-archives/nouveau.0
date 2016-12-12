From: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] drm/nouveau: fix unknown chipset for GTX 1060
Date: Mon, 12 Dec 2016 21:44:13 +1000
Message-ID: <ef88b8cc-7d2e-5d71-38bb-9da1b891584d@redhat.com>
References: <1481541993-40287-1-git-send-email-chiu@endlessm.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0085187877=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1481541993-40287-1-git-send-email-chiu-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Chris Chiu <chiu-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Karol Herbst <nouveau-lIBOoy2+GI7scQ4cX5LuPg@public.gmane.org>, Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-6IF/jdPJHihWk0Htik3J/w@public.gmane.org
List-Id: nouveau.vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0085187877==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="uutoAr8v8kpJOvqhtBPi1HmEkQlGwLMuM"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--uutoAr8v8kpJOvqhtBPi1HmEkQlGwLMuM
Content-Type: multipart/mixed; boundary="73kBIt0gF0jQ8peatns6ExxXTfueXSaCt"
From: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
To: Chris Chiu <chiu-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>,
 Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>,
 Karol Herbst <nouveau-lIBOoy2+GI7scQ4cX5LuPg@public.gmane.org>, Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>,
 dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org,
 linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-6IF/jdPJHihWk0Htik3J/w@public.gmane.org
Message-ID: <ef88b8cc-7d2e-5d71-38bb-9da1b891584d-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] drm/nouveau: fix unknown chipset for GTX 1060
References: <1481541993-40287-1-git-send-email-chiu-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>
In-Reply-To: <1481541993-40287-1-git-send-email-chiu-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>

--73kBIt0gF0jQ8peatns6ExxXTfueXSaCt
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 12/12/2016 09:26 PM, Chris Chiu wrote:
> Nouveau driver shows unknown chipset (136000a1) for GTX 1060, so it
> only gives VGA resolution on screen. Use the same chipset as nv134
> then it shows FullHD. This commit copies fields from nv134_chipset
> to nv136_chipset for GTX 1060.
I have one of these sitting on my desk, but won't be merging support for
it until it's been confirmed that no additional changes are required vs
GP104.  We've been bitten by just making these kind of blind assumptions
before.

Thanks,
Ben.

>=20
> Signed-off-by: Chris Chiu <chiu-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>
> ---
>  drivers/gpu/drm/nouveau/nvkm/engine/device/base.c | 29 +++++++++++++++=
++++++++
>  1 file changed, 29 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c b/driver=
s/gpu/drm/nouveau/nvkm/engine/device/base.c
> index 7218a06..7c6eece 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
> @@ -2209,6 +2209,34 @@ nv134_chipset =3D {
>  	.fifo =3D gp100_fifo_new,
>  };
> =20
> +static const struct nvkm_device_chip
> +nv136_chipset =3D {
> +	.name =3D "GP104",
> +	.bar =3D gf100_bar_new,
> +	.bios =3D nvkm_bios_new,
> +	.bus =3D gf100_bus_new,
> +	.devinit =3D gm200_devinit_new,
> +	.fb =3D gp104_fb_new,
> +	.fuse =3D gm107_fuse_new,
> +	.gpio =3D gk104_gpio_new,
> +	.i2c =3D gm200_i2c_new,
> +	.ibus =3D gm200_ibus_new,
> +	.imem =3D nv50_instmem_new,
> +	.ltc =3D gp100_ltc_new,
> +	.mc =3D gp100_mc_new,
> +	.mmu =3D gf100_mmu_new,
> +	.pci =3D gp100_pci_new,
> +	.timer =3D gk20a_timer_new,
> +	.top =3D gk104_top_new,
> +	.ce[0] =3D gp104_ce_new,
> +	.ce[1] =3D gp104_ce_new,
> +	.ce[2] =3D gp104_ce_new,
> +	.ce[3] =3D gp104_ce_new,
> +	.disp =3D gp104_disp_new,
> +	.dma =3D gf119_dma_new,
> +	.fifo =3D gp100_fifo_new,
> +};
> +
>  static int
>  nvkm_device_event_ctor(struct nvkm_object *object, void *data, u32 siz=
e,
>  		       struct nvkm_notify *notify)
> @@ -2644,6 +2672,7 @@ nvkm_device_ctor(const struct nvkm_device_func *f=
unc,
>  		case 0x12b: device->chip =3D &nv12b_chipset; break;
>  		case 0x130: device->chip =3D &nv130_chipset; break;
>  		case 0x134: device->chip =3D &nv134_chipset; break;
> +		case 0x136: device->chip =3D &nv136_chipset; break;
>  		default:
>  			nvdev_error(device, "unknown chipset (%08x)\n", boot0);
>  			goto done;
>=20


--73kBIt0gF0jQ8peatns6ExxXTfueXSaCt--

--uutoAr8v8kpJOvqhtBPi1HmEkQlGwLMuM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEETp/uv2nr9kIVth0/dgucYlCSkfsFAlhOjY0ACgkQdgucYlCS
kftr6RAA2G5A79R+Va3HoyD/SZvZCAFG5VnRQ0LARH3EWzLibqXHgLbU7SBPpzpH
96GqqNsi1CK5ceF0jHly3dyMtatxbRPRf1Za3oOjZ0WmDScEkaINJ4cQ+UDZz/u9
drU2ZdR8hBBoQM8e0h8IO433s+heFyZlrGALP6LXPtbKJt4uxmBEWxNwWVd1+5Wx
QQK7PXJ2sLX6ItmqG7IDDwMQV4GKrxf9fzrd4p98YZlRKypM9Fg75ej1eXf2qjw9
DeNi8Yv1WkokpGZ8ZE5WYzACFBba1wsMEJlMIUruBwSusMMB+InU+4Op18XvBVVU
Ort3N4zaprvuWrUxYprz9RrwlemYvgd2SuYDoavIrsiToeUvlh9MkGuv0i5no16V
ryAu9T2feMGAdHtH4d2Kbn4DAAGeUBKVMGl1vr1rjCq+0+mvewBnQiVBjwk3z1Xz
q1jvEwnzE0eGXIpVZiGiDYs2riVEC9hIYaKK44PIVBjJnrq5NGLZQcCLzQjsZlAJ
ZP5KLzVGvSsp25GhB+ZuOzUuL0a7TB25AMYQi6ScQLXQf5qFICLwWq5r1lYjh4GW
9Cg++MP4O9XJBamnyhALljp51t1J5FqfB+UirZrM2iaT6ZiEMgZI933k8yf4kuuh
Q7/8y5EraREXgpW1n0qGK88HaIHxDcxNzdzXxxc0+9dFFbCaFfw=
=X9NF
-----END PGP SIGNATURE-----

--uutoAr8v8kpJOvqhtBPi1HmEkQlGwLMuM--

--===============0085187877==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0085187877==--
