From: Thomas Zimmermann <tzimmermann-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH 01/20] drm/amdgpu: Introduce GEM object
 functions
Date: Mon, 14 Sep 2020 17:05:49 +0200
Message-ID: <c445493b-9914-63f2-1cf2-c3c1de14e3e5@suse.de>
References: <20200813083644.31711-1-tzimmermann@suse.de>
 <20200813083644.31711-2-tzimmermann@suse.de>
 <5c1b3cab-1898-46df-2c5c-23ab6cbfbb7a@amd.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1272768310=="
Return-path: <freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <5c1b3cab-1898-46df-2c5c-23ab6cbfbb7a-5C7GfCeVMHo@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/freedreno>,
 <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/freedreno>
List-Post: <mailto:freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/freedreno>,
 <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Freedreno" <freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig-5C7GfCeVMHo@public.gmane.org>, alexander.deucher-5C7GfCeVMHo@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, daniel-/w4YWyX8dFk@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, maarten.lankhorst-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, mripard-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, christian.gmeiner-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, patrik.r.jakobsson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jani.nikula-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, joonas.lahtinen-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, rodrigo.vivi-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, chunkuang.hu-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sean-p7yTbzM4H96eqtR555YLDQ@public.gmane.org, bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, tomi.valkeinen-l0cyMroinI0@public.gmane.org, eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org, hjc-TNX95d0MmH7DzftRWevZcw@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, rodrigosiqueiramelo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, hamohammed.sa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, oleksandr_andrushchenko-uRwfk40T5oI@public.gmane.org, hyun.kwon-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, laurent.pin
Cc: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, intel-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, etnaviv-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, xen-devel-GuqFBffKawtpuQazS67q72D2FQJk+8+b@public.gmane.org, freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: nouveau.vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1272768310==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="MeVdSsKebthdc7DC8hvgqWlLwpjnz0H9f"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--MeVdSsKebthdc7DC8hvgqWlLwpjnz0H9f
Content-Type: multipart/mixed; boundary="zniUnHMaoWytGRm2jwIkKjV0oPt2fa9bx";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann-l3A5Bk7waGM@public.gmane.org>
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig-5C7GfCeVMHo@public.gmane.org>,
 alexander.deucher-5C7GfCeVMHo@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, daniel-/w4YWyX8dFk@public.gmane.org,
 linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, maarten.lankhorst-VuQAYsv1563Yd54FQh9/CA@public.gmane.org,
 mripard-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, christian.gmeiner-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org,
 inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org,
 kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org,
 patrik.r.jakobsson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jani.nikula-VuQAYsv1563Yd54FQh9/CA@public.gmane.org,
 joonas.lahtinen-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, rodrigo.vivi-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org,
 chunkuang.hu-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org,
 robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sean-p7yTbzM4H96eqtR555YLDQ@public.gmane.org, bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org,
 tomi.valkeinen-l0cyMroinI0@public.gmane.org, eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org, hjc-TNX95d0MmH7DzftRWevZcw@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org,
 thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org,
 rodrigosiqueiramelo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, hamohammed.sa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org,
 oleksandr_andrushchenko-uRwfk40T5oI@public.gmane.org, hyun.kwon-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org,
 laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org,
 sumit.semwal-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, evan.quan-5C7GfCeVMHo@public.gmane.org, Hawking.Zhang-5C7GfCeVMHo@public.gmane.org,
 tianci.yin-5C7GfCeVMHo@public.gmane.org, marek.olsak-5C7GfCeVMHo@public.gmane.org, hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org,
 andrey.grodzovsky-5C7GfCeVMHo@public.gmane.org, Felix.Kuehling-5C7GfCeVMHo@public.gmane.org, xinhui.pan-5C7GfCeVMHo@public.gmane.org,
 aaron.liu-5C7GfCeVMHo@public.gmane.org, nirmoy.das-5C7GfCeVMHo@public.gmane.org, chris-Y6uKTt2uX1cEflXRtASbqLVCufUGDwFn@public.gmane.org,
 matthew.auld-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, abdiel.janulgue-VuQAYsv1563Yd54FQh9/CA@public.gmane.org,
 tvrtko.ursulin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, andi.shyti-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org,
 miaoqinglang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, emil.velikov-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org
Cc: amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org,
 etnaviv-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org,
 linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, intel-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org,
 linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org,
 freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org,
 linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org,
 xen-devel-GuqFBffKawtpuQazS67q72D2FQJk+8+b@public.gmane.org
Message-ID: <c445493b-9914-63f2-1cf2-c3c1de14e3e5-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH 01/20] drm/amdgpu: Introduce GEM object functions
References: <20200813083644.31711-1-tzimmermann-l3A5Bk7waGM@public.gmane.org>
 <20200813083644.31711-2-tzimmermann-l3A5Bk7waGM@public.gmane.org>
 <5c1b3cab-1898-46df-2c5c-23ab6cbfbb7a-5C7GfCeVMHo@public.gmane.org>
In-Reply-To: <5c1b3cab-1898-46df-2c5c-23ab6cbfbb7a-5C7GfCeVMHo@public.gmane.org>

--zniUnHMaoWytGRm2jwIkKjV0oPt2fa9bx
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 13.08.20 um 12:22 schrieb Christian K=C3=B6nig:
> Am 13.08.20 um 10:36 schrieb Thomas Zimmermann:
>> GEM object functions deprecate several similar callback interfaces in
>> struct drm_driver. This patch replaces the per-driver callbacks with
>> per-instance callbacks in amdgpu. The only exception is gem_prime_mmap=
,
>> which is non-trivial to convert.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann-l3A5Bk7waGM@public.gmane.org>
>> ---
>> =C2=A0 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c=C2=A0=C2=A0=C2=A0 |=C2=A0=
 6 ------
>> =C2=A0 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 12 ++++++++++++
>> =C2=A0 2 files changed, 12 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>> index 81a79760ca61..51525b8774c9 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>> @@ -1468,19 +1468,13 @@ static struct drm_driver kms_driver =3D {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .lastclose =3D amdgpu_driver_lastclose_=
kms,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .irq_handler =3D amdgpu_irq_handler,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .ioctls =3D amdgpu_ioctls_kms,
>> -=C2=A0=C2=A0=C2=A0 .gem_free_object_unlocked =3D amdgpu_gem_object_fr=
ee,
>> -=C2=A0=C2=A0=C2=A0 .gem_open_object =3D amdgpu_gem_object_open,
>> -=C2=A0=C2=A0=C2=A0 .gem_close_object =3D amdgpu_gem_object_close,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .dumb_create =3D amdgpu_mode_dumb_creat=
e,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .dumb_map_offset =3D amdgpu_mode_dumb_m=
map,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .fops =3D &amdgpu_driver_kms_fops,
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .prime_handle_to_fd =3D drm_gem_=
prime_handle_to_fd,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .prime_fd_to_handle =3D drm_gem_prime_f=
d_to_handle,
>> -=C2=A0=C2=A0=C2=A0 .gem_prime_export =3D amdgpu_gem_prime_export,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .gem_prime_import =3D amdgpu_gem_prime_=
import,
>> -=C2=A0=C2=A0=C2=A0 .gem_prime_vmap =3D amdgpu_gem_prime_vmap,
>> -=C2=A0=C2=A0=C2=A0 .gem_prime_vunmap =3D amdgpu_gem_prime_vunmap,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .gem_prime_mmap =3D amdgpu_gem_prime_mm=
ap,
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .name =3D DRIVER_NAME,
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>> index 43f4966331dd..ca2b79f94e99 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>> @@ -36,6 +36,7 @@
>> =C2=A0 #include <drm/amdgpu_drm.h>
>> =C2=A0 #include <drm/drm_cache.h>
>> =C2=A0 #include "amdgpu.h"
>> +#include "amdgpu_dma_buf.h"
>> =C2=A0 #include "amdgpu_trace.h"
>> =C2=A0 #include "amdgpu_amdkfd.h"
>> =C2=A0 @@ -510,6 +511,15 @@ bool amdgpu_bo_support_uswc(u64 bo_flags)
>> =C2=A0 #endif
>> =C2=A0 }
>> =C2=A0 +static const struct drm_gem_object_funcs amdgpu_gem_object_fun=
cs =3D {
>> +=C2=A0=C2=A0=C2=A0 .free =3D amdgpu_gem_object_free,
>> +=C2=A0=C2=A0=C2=A0 .open =3D amdgpu_gem_object_open,
>> +=C2=A0=C2=A0=C2=A0 .close =3D amdgpu_gem_object_close,
>> +=C2=A0=C2=A0=C2=A0 .export =3D amdgpu_gem_prime_export,
>> +=C2=A0=C2=A0=C2=A0 .vmap =3D amdgpu_gem_prime_vmap,
>> +=C2=A0=C2=A0=C2=A0 .vunmap =3D amdgpu_gem_prime_vunmap,
>> +};
>> +
>=20
> Wrong file, this belongs into amdgpu_gem.c
>=20
>> =C2=A0 static int amdgpu_bo_do_create(struct amdgpu_device *adev,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct amdgpu_bo_param *=
bp,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct amdgpu_bo **bo_pt=
r)
>> @@ -552,6 +562,8 @@ static int amdgpu_bo_do_create(struct
>> amdgpu_device *adev,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bo =3D kzalloc(sizeof(struct amdgpu_bo)=
, GFP_KERNEL);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (bo =3D=3D NULL)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -ENOMEM;=

>> +
>> +=C2=A0=C2=A0=C2=A0 bo->tbo.base.funcs =3D &amdgpu_gem_object_funcs;
>=20
> And this should probably go into amdgpu_gem_object_create().

I'm trying to understand what amdgpu does.  What about all the places
where amdgpu calls amdgpu_bo_create() internally? Wouldn't these miss
the free callback for the GEM object?

Best regards
Thomas

>=20
> Apart from that looks like a good idea to me.
>=20
> Christian.
>=20
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_gem_private_object_init(adev->ddev,=
 &bo->tbo.base, size);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 INIT_LIST_HEAD(&bo->shadow_list);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bo->vm_bo =3D NULL;
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--zniUnHMaoWytGRm2jwIkKjV0oPt2fa9bx--

--MeVdSsKebthdc7DC8hvgqWlLwpjnz0H9f
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFIBAEBCAAyFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl9fhs0UHHR6aW1tZXJt
YW5uQHN1c2UuZGUACgkQaA3BHVMLeiPJNAgAlfJhPTx8SHwyCGcF7SoXCxqFUag5
/hXG2aWBOQj0PGNIWjEqH/FwrQApUbBmpbBWXncgOJjyevY1bY3RXSi+ibAW263g
1lb0Cf5fR55oudCzfJIiQhM5nXHpnbDTdEq1kVtVf4mD3cn1eyPWtOgpXIklFs+w
YSnklFEtZsXQnHs9whrVXf1UPUoecKtVRfIflZBfGttuRdODIknW+9iFA/+QYggh
4WsKIHEpME3IpnfYOqS6yZ3oqcKeROalr2HZ6EUy/NaixshxCZxnLQVMNWx7saKP
aygn2TEK3CwcBwiYGlPcx3/VFCRdviSNuxDmkZ5CV3ceT5gUjE0suBVVaA==
=QxSN
-----END PGP SIGNATURE-----

--MeVdSsKebthdc7DC8hvgqWlLwpjnz0H9f--

--===============1272768310==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Freedreno mailing list
Freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
https://lists.freedesktop.org/mailman/listinfo/freedreno

--===============1272768310==--
