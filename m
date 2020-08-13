From: Thomas Zimmermann <tzimmermann-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH 19/20] drm/xlnx: Initialize DRM driver instance with CMA
 helper macro
Date: Thu, 13 Aug 2020 15:57:32 +0200
Message-ID: <a8e39798-9812-e325-255a-e6536cb32339@suse.de>
References: <20200813083644.31711-1-tzimmermann@suse.de>
 <20200813083644.31711-20-tzimmermann@suse.de>
 <20200813133605.GJ6057@pendragon.ideasonboard.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="tbCt2o5uFn9Z4Xo4P1cpCcyhXosV08OH6"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200813133605.GJ6057-N3hz7ZxfLydczECFQUw77jytWr6r+dGw0E9HWUfgJXw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Cc: hamohammed.sa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org, emil.velikov-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org, abdiel.janulgue-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, oleksandr_andrushchenko-uRwfk40T5oI@public.gmane.org, tomi.valkeinen-l0cyMroinI0@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, xen-devel-GuqFBffKawtpuQazS67q72D2FQJk+8+b@public.gmane.org, intel-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, matthew.auld-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, chunkuang.hu-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, andi.shyti-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, marek.olsak-5C7GfCeVMHo@public.gmane.org, tianci.yin-5C7GfCeVMHo@public.gmane.org, etnaviv-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.orglinux
List-Id: nouveau.vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--tbCt2o5uFn9Z4Xo4P1cpCcyhXosV08OH6
Content-Type: multipart/mixed; boundary="Orz2ZqpSWnksEfl2yo6RF3aBwExLujGG6";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann-l3A5Bk7waGM@public.gmane.org>
To: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Cc: hamohammed.sa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org,
 dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org,
 thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org,
 emil.velikov-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org, abdiel.janulgue-VuQAYsv1563Yd54FQh9/CA@public.gmane.org,
 linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org,
 oleksandr_andrushchenko-uRwfk40T5oI@public.gmane.org, tomi.valkeinen-l0cyMroinI0@public.gmane.org,
 linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org,
 linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org,
 xen-devel-GuqFBffKawtpuQazS67q72D2FQJk+8+b@public.gmane.org, intel-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org,
 matthew.auld-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, chunkuang.hu-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, andi.shyti-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org,
 linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, marek.olsak-5C7GfCeVMHo@public.gmane.org, tianci.yin-5C7GfCeVMHo@public.gmane.org,
 etnaviv-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org,
 linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, rodrigo.vivi-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org,
 matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, evan.quan-5C7GfCeVMHo@public.gmane.org, sean-p7yTbzM4H96eqtR555YLDQ@public.gmane.org,
 linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, tvrtko.ursulin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org,
 amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, chris-Y6uKTt2uX1cEflXRtASbqLVCufUGDwFn@public.gmane.org,
 hyun.kwon-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, rodrigosiqueiramelo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, aaron.liu-5C7GfCeVMHo@public.gmane.org,
 Felix.Kuehling-5C7GfCeVMHo@public.gmane.org, xinhui.pan-5C7GfCeVMHo@public.gmane.org, sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org,
 hjc-TNX95d0MmH7DzftRWevZcw@public.gmane.org, miaoqinglang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org,
 nirmoy.das-5C7GfCeVMHo@public.gmane.org, alexander.deucher-5C7GfCeVMHo@public.gmane.org, Hawking.Zhang-5C7GfCeVMHo@public.gmane.org,
 freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, christian.koenig-5C7GfCeVMHo@public.gmane.org
Message-ID: <a8e39798-9812-e325-255a-e6536cb32339-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH 19/20] drm/xlnx: Initialize DRM driver instance with CMA
 helper macro
References: <20200813083644.31711-1-tzimmermann-l3A5Bk7waGM@public.gmane.org>
 <20200813083644.31711-20-tzimmermann-l3A5Bk7waGM@public.gmane.org>
 <20200813133605.GJ6057-N3hz7ZxfLydczECFQUw77jytWr6r+dGw0E9HWUfgJXw@public.gmane.org>
In-Reply-To: <20200813133605.GJ6057-N3hz7ZxfLydczECFQUw77jytWr6r+dGw0E9HWUfgJXw@public.gmane.org>

--Orz2ZqpSWnksEfl2yo6RF3aBwExLujGG6
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 13.08.20 um 15:36 schrieb Laurent Pinchart:
> Hi Thomas,
>=20
> Thank you for the patch.
>=20
> On Thu, Aug 13, 2020 at 10:36:43AM +0200, Thomas Zimmermann wrote:
>> The xlnx driver uses CMA helpers with default callback functions.
>> Initialize the driver structure with the rsp CMA helper macro. The
>> driver is being converted to use GEM object functions as part of
>> this change.
>>
>> Two callbacks, .dumb_destroy and .gem_prime_import, were initialized
>> to their default implementations, so they are just kept empty now.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann-l3A5Bk7waGM@public.gmane.org>
>> ---
>>  drivers/gpu/drm/xlnx/zynqmp_dpsub.c | 14 +-------------
>>  1 file changed, 1 insertion(+), 13 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c b/drivers/gpu/drm/xln=
x/zynqmp_dpsub.c
>> index 26328c76305b..058044dcc062 100644
>> --- a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
>> +++ b/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
>> @@ -80,19 +80,7 @@ static struct drm_driver zynqmp_dpsub_drm_driver =3D=
 {
>>  	.driver_features		=3D DRIVER_MODESET | DRIVER_GEM |
>>  					  DRIVER_ATOMIC,
>> =20
>> -	.prime_handle_to_fd		=3D drm_gem_prime_handle_to_fd,
>> -	.prime_fd_to_handle		=3D drm_gem_prime_fd_to_handle,
>> -	.gem_prime_export		=3D drm_gem_prime_export,
>> -	.gem_prime_import		=3D drm_gem_prime_import,
>> -	.gem_prime_get_sg_table		=3D drm_gem_cma_prime_get_sg_table,
>> -	.gem_prime_import_sg_table	=3D drm_gem_cma_prime_import_sg_table,
>> -	.gem_prime_vmap			=3D drm_gem_cma_prime_vmap,
>> -	.gem_prime_vunmap		=3D drm_gem_cma_prime_vunmap,
>> -	.gem_prime_mmap			=3D drm_gem_cma_prime_mmap,
>> -	.gem_free_object_unlocked	=3D drm_gem_cma_free_object,
>> -	.gem_vm_ops			=3D &drm_gem_cma_vm_ops,
>> -	.dumb_create			=3D zynqmp_dpsub_dumb_create,
>> -	.dumb_destroy			=3D drm_gem_dumb_destroy,
>> +	DRM_GEM_CMA_DRIVER_OPS_VMAP_WITH_DUMB_CREATE(zynqmp_dpsub_dumb_creat=
e),
>=20
> The only effective change here is
>=20
> -	.gem_prime_import_sg_table	=3D drm_gem_cma_prime_import_sg_table,
> -	.gem_prime_mmap			=3D drm_gem_cma_prime_mmap,
> +	.gem_prime_import_sg_table	=3D drm_gem_cma_prime_import_sg_table_vmap=
,
> +	.gem_prime_mmap			=3D drm_gem_prime_mmap,
>=20
> The change is significant, and I have a hard time following the code to=

> verify that it's correct, or if it's an undesired side effect. If it's
> correct, could the change be mentioned in the commit message, with at
> least a brief explanation of why this is correct, and what the
> consequences here ?

I think this is a mistake that I didn't notice. Thanks for spotting it.
Initializing the driver structure
DRM_GEM_CMA_DRIVER_OPS_WITH_DUMB_CREATE should fix it. I'll change this
for the patch's next revision.

Best regards
Thomas

>=20
>> =20
>>  	.fops				=3D &zynqmp_dpsub_drm_fops,
>> =20
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--Orz2ZqpSWnksEfl2yo6RF3aBwExLujGG6--

--tbCt2o5uFn9Z4Xo4P1cpCcyhXosV08OH6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFIBAEBCAAyFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl81RswUHHR6aW1tZXJt
YW5uQHN1c2UuZGUACgkQaA3BHVMLeiPfqAgAoOYcX5UFEbejKi/wGBq3HxlV2lCp
5M6+u8OsIfDWcmroBE+YK419eRwDbsNeDSbzHs7GVQ7SOEeltGdgRpf7QuaUgupn
VJmuMSjAwqbV0l5nyd5DD0Tr2Z/QOxaLAguvxUcSTOdYWAuqLwTo6X5+butu86YB
tEBhKOk6Vzm8C5KA3Loy27We59QzBmDHJ+cdzEhsM1AG0SPJ5sePjMiKFMM3Mo4u
8+HQ3wVLzYAQVhK7Q8bUM/6yIv+AQaAfoNtG3zPI7q9FKKKMbBbTVQV0YeZUKC4T
kIHdnG+dlK834qYxJmlxWwcU8XjHoiAbQYJDfpmjeYw++Xz1MePDB6MG2g==
=PGhi
-----END PGP SIGNATURE-----

--tbCt2o5uFn9Z4Xo4P1cpCcyhXosV08OH6--
