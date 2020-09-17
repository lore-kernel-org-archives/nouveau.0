From: Thomas Zimmermann <tzimmermann-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH v2 00/21] Convert all remaining drivers to GEM object
 functions
Date: Thu, 17 Sep 2020 09:05:19 +0200
Message-ID: <94b4d32e-92f2-cc29-1d59-b9b10b814220@suse.de>
References: <20200915145958.19993-1-tzimmermann@suse.de>
 <b527fde4-b456-6683-4a9e-0f7dcf1525be@amd.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0269446819=="
Return-path: <amd-gfx-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <b527fde4-b456-6683-4a9e-0f7dcf1525be-5C7GfCeVMHo@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:amd-gfx-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: amd-gfx-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "amd-gfx" <amd-gfx-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig-5C7GfCeVMHo@public.gmane.org>, alexander.deucher-5C7GfCeVMHo@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, daniel-/w4YWyX8dFk@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, maarten.lankhorst-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, mripard-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, christian.gmeiner-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, patrik.r.jakobsson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jani.nikula-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, joonas.lahtinen-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, rodrigo.vivi-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, chunkuang.hu-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sean-p7yTbzM4H96eqtR555YLDQ@public.gmane.org, bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, tomi.valkeinen-l0cyMroinI0@public.gmane.org, eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org, hjc-TNX95d0MmH7DzftRWevZcw@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, rodrigosiqueiramelo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, hamohammed.sa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, oleksandr_andrushchenko-uRwfk40T5oI@public.gmane.org, hyun.kwon-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, laurent.pin
Cc: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, intel-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, etnaviv-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, xen-devel-GuqFBffKawtpuQazS67q72D2FQJk+8+b@public.gmane.org, freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: nouveau.vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0269446819==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="IlbjXZFzpa1bxN3Foosb3hob3NomxLQSR"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--IlbjXZFzpa1bxN3Foosb3hob3NomxLQSR
Content-Type: multipart/mixed; boundary="MOeMuup4o07wOcrSIw7xNuGzkQ7VfpmEx";
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
 matthew.auld-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, tvrtko.ursulin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org,
 andi.shyti-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org, miaoqinglang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org,
 emil.velikov-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org
Cc: amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org,
 etnaviv-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org,
 linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, intel-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org,
 linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org,
 freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org,
 linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org,
 xen-devel-GuqFBffKawtpuQazS67q72D2FQJk+8+b@public.gmane.org
Message-ID: <94b4d32e-92f2-cc29-1d59-b9b10b814220-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH v2 00/21] Convert all remaining drivers to GEM object
 functions
References: <20200915145958.19993-1-tzimmermann-l3A5Bk7waGM@public.gmane.org>
 <b527fde4-b456-6683-4a9e-0f7dcf1525be-5C7GfCeVMHo@public.gmane.org>
In-Reply-To: <b527fde4-b456-6683-4a9e-0f7dcf1525be-5C7GfCeVMHo@public.gmane.org>

--MOeMuup4o07wOcrSIw7xNuGzkQ7VfpmEx
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 15.09.20 um 17:25 schrieb Christian K=C3=B6nig:
> Added my rb to the amdgpu and radeon patches.
>=20
> Should we pick those up through the amd branches or do you want to push=

> everything to drm-misc-next?
>=20
> I think the later since this should result in much merge clash.

Yes, preferable, I'd merge it all through drm-misc.

Best regards
Thomas

>=20
> Christian.
>=20
> Am 15.09.20 um 16:59 schrieb Thomas Zimmermann:
>> The GEM and PRIME related callbacks in struct drm_driver are
>> deprecated in
>> favor of GEM object functions in struct drm_gem_object_funcs. This
>> patchset
>> converts the remaining drivers to object functions and removes most of=

>> the
>> obsolete interfaces.
>>
>> Patches #1 to #16 and #18 to #19 convert DRM drivers to GEM object
>> functions,
>> one by one. Each patch moves existing callbacks from struct drm_driver=

>> to an
>> instance of struct drm_gem_object_funcs, and sets these funcs when the=

>> GEM
>> object is initialized. The expection is .gem_prime_mmap. There are
>> different
>> ways of how drivers implement the callback, and moving it to GEM objec=
t
>> functions requires a closer review for each.
>>
>> Patch #17 fixes virtgpu to use GEM object functions where possible. Th=
e
>> driver recently introduced a function for one of the deprecated
>> callbacks.
>>
>> Patch #20 converts xlnx to CMA helper macros. There's no apparent reas=
on
>> why the driver does the GEM setup on it's own. Using CMA helper macros=

>> adds GEM object functions implicitly.
>>
>> With most of the GEM and PRIME moved to GEM object functions, related
>> code
>> in struct drm_driver and in the DRM core/helpers is being removed by
>> patch
>> #21.
>>
>> Further testing is welcome. I tested the drivers for which I have HW
>> available. These are gma500, i915, nouveau, radeon and vc4. The consol=
e,
>> Weston and Xorg apparently work with the patches applied.
>>
>> v2:
>> =C2=A0=C2=A0=C2=A0=C2=A0* moved code in amdgpu and radeon
>> =C2=A0=C2=A0=C2=A0=C2=A0* made several functions static in various dri=
vers
>> =C2=A0=C2=A0=C2=A0=C2=A0* updated TODO-list item
>> =C2=A0=C2=A0=C2=A0=C2=A0* fix virtgpu
>>
>> Thomas Zimmermann (21):
>> =C2=A0=C2=A0 drm/amdgpu: Introduce GEM object functions
>> =C2=A0=C2=A0 drm/armada: Introduce GEM object functions
>> =C2=A0=C2=A0 drm/etnaviv: Introduce GEM object functions
>> =C2=A0=C2=A0 drm/exynos: Introduce GEM object functions
>> =C2=A0=C2=A0 drm/gma500: Introduce GEM object functions
>> =C2=A0=C2=A0 drm/i915: Introduce GEM object functions
>> =C2=A0=C2=A0 drm/mediatek: Introduce GEM object functions
>> =C2=A0=C2=A0 drm/msm: Introduce GEM object funcs
>> =C2=A0=C2=A0 drm/nouveau: Introduce GEM object functions
>> =C2=A0=C2=A0 drm/omapdrm: Introduce GEM object functions
>> =C2=A0=C2=A0 drm/pl111: Introduce GEM object functions
>> =C2=A0=C2=A0 drm/radeon: Introduce GEM object functions
>> =C2=A0=C2=A0 drm/rockchip: Convert to drm_gem_object_funcs
>> =C2=A0=C2=A0 drm/tegra: Introduce GEM object functions
>> =C2=A0=C2=A0 drm/vc4: Introduce GEM object functions
>> =C2=A0=C2=A0 drm/vgem: Introduce GEM object functions
>> =C2=A0=C2=A0 drm/virtgpu: Set PRIME export function in struct drm_gem_=
object_funcs
>> =C2=A0=C2=A0 drm/vkms: Introduce GEM object functions
>> =C2=A0=C2=A0 drm/xen: Introduce GEM object functions
>> =C2=A0=C2=A0 drm/xlnx: Initialize DRM driver instance with CMA helper =
macro
>> =C2=A0=C2=A0 drm: Remove obsolete GEM and PRIME callbacks from struct =
drm_driver
>>
>> =C2=A0 Documentation/gpu/todo.rst=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0 7 +-
>> =C2=A0 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 6 --
>> =C2=A0 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 23 +++--
>> =C2=A0 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.h=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 5 --
>> =C2=A0 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c=C2=A0=C2=A0=C2=A0 |=C2=
=A0 1 +
>> =C2=A0 drivers/gpu/drm/armada/armada_drv.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 3 -
>> =C2=A0 drivers/gpu/drm/armada/armada_gem.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 12 ++-
>> =C2=A0 drivers/gpu/drm/armada/armada_gem.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 -
>> =C2=A0 drivers/gpu/drm/drm_gem.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 35 ++------
>> =C2=A0 drivers/gpu/drm/drm_gem_cma_helper.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 6 +-
>> =C2=A0 drivers/gpu/drm/drm_prime.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
| 17 ++--
>> =C2=A0 drivers/gpu/drm/etnaviv/etnaviv_drv.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 13 ---
>> =C2=A0 drivers/gpu/drm/etnaviv/etnaviv_drv.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 -
>> =C2=A0 drivers/gpu/drm/etnaviv/etnaviv_gem.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 19 ++++-
>> =C2=A0 drivers/gpu/drm/exynos/exynos_drm_drv.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 10 ---
>> =C2=A0 drivers/gpu/drm/exynos/exynos_drm_gem.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 15 ++++
>> =C2=A0 drivers/gpu/drm/gma500/framebuffer.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +
>> =C2=A0 drivers/gpu/drm/gma500/gem.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 18 +=
++-
>> =C2=A0 drivers/gpu/drm/gma500/gem.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
 3 +
>> =C2=A0 drivers/gpu/drm/gma500/psb_drv.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 9 --
>> =C2=A0 drivers/gpu/drm/gma500/psb_drv.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 -
>> =C2=A0 drivers/gpu/drm/i915/gem/i915_gem_object.c=C2=A0=C2=A0=C2=A0 | =
21 ++++-
>> =C2=A0 drivers/gpu/drm/i915/gem/i915_gem_object.h=C2=A0=C2=A0=C2=A0 |=C2=
=A0 3 -
>> =C2=A0 drivers/gpu/drm/i915/i915_drv.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 4 -
>> =C2=A0 .../gpu/drm/i915/selftests/mock_gem_device.c=C2=A0 |=C2=A0 3 -
>> =C2=A0 drivers/gpu/drm/mediatek/mtk_drm_drv.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 5 --
>> =C2=A0 drivers/gpu/drm/mediatek/mtk_drm_gem.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 11 +++
>> =C2=A0 drivers/gpu/drm/msm/msm_drv.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 13 ---
>> =C2=A0 drivers/gpu/drm/msm/msm_drv.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 -
>> =C2=A0 drivers/gpu/drm/msm/msm_gem.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 19 ++++-
>> =C2=A0 drivers/gpu/drm/nouveau/nouveau_drm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 9 --
>> =C2=A0 drivers/gpu/drm/nouveau/nouveau_gem.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 13 +++
>> =C2=A0 drivers/gpu/drm/nouveau/nouveau_gem.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +
>> =C2=A0 drivers/gpu/drm/nouveau/nouveau_prime.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 2 +
>> =C2=A0 drivers/gpu/drm/omapdrm/omap_drv.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 9 --
>> =C2=A0 drivers/gpu/drm/omapdrm/omap_gem.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 18 +++-
>> =C2=A0 drivers/gpu/drm/omapdrm/omap_gem.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 -
>> =C2=A0 drivers/gpu/drm/pl111/pl111_drv.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 5 +-
>> =C2=A0 drivers/gpu/drm/radeon/radeon_drv.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 23 +----
>> =C2=A0 drivers/gpu/drm/radeon/radeon_gem.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 31 ++++++-
>> =C2=A0 drivers/gpu/drm/rockchip/rockchip_drm_drv.c=C2=A0=C2=A0 |=C2=A0=
 5 --
>> =C2=A0 drivers/gpu/drm/rockchip/rockchip_drm_gem.c=C2=A0=C2=A0 | 10 ++=
+
>> =C2=A0 drivers/gpu/drm/tegra/drm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
|=C2=A0 4 -
>> =C2=A0 drivers/gpu/drm/tegra/gem.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
|=C2=A0 8 ++
>> =C2=A0 drivers/gpu/drm/vc4/vc4_bo.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 21 +=
+++-
>> =C2=A0 drivers/gpu/drm/vc4/vc4_drv.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 12 ---
>> =C2=A0 drivers/gpu/drm/vc4/vc4_drv.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 -
>> =C2=A0 drivers/gpu/drm/vgem/vgem_drv.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 21 +++--
>> =C2=A0 drivers/gpu/drm/virtio/virtgpu_drv.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 -
>> =C2=A0 drivers/gpu/drm/virtio/virtgpu_object.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 1 +
>> =C2=A0 drivers/gpu/drm/vkms/vkms_drv.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 8 --
>> =C2=A0 drivers/gpu/drm/vkms/vkms_gem.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 13 +++
>> =C2=A0 drivers/gpu/drm/xen/xen_drm_front.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 44 ++++------
>> =C2=A0 drivers/gpu/drm/xen/xen_drm_front.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +
>> =C2=A0 drivers/gpu/drm/xen/xen_drm_front_gem.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 15 ++++
>> =C2=A0 drivers/gpu/drm/xlnx/zynqmp_dpsub.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 14 +--
>> =C2=A0 include/drm/drm_drv.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 85 +------------------
>> =C2=A0 57 files changed, 319 insertions(+), 349 deletions(-)
>>
>> --=20
>> 2.28.0
>>
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--MOeMuup4o07wOcrSIw7xNuGzkQ7VfpmEx--

--IlbjXZFzpa1bxN3Foosb3hob3NomxLQSR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFIBAEBCAAyFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl9jCrIUHHR6aW1tZXJt
YW5uQHN1c2UuZGUACgkQaA3BHVMLeiNzVwf+LuvZqcvZRWJqBwD/EReZk8QEdB4C
gFkyqltsHWaQRxf+it2Dp14i6FxEXB7E3aVwF5jPAdikNLapTbkD9Y/2xPJQr+MR
GJLLPZPYWT8OMyj5OitKkx0wGAHp+CZTn/GXhI7YyECfs2Jdwy7ZPJ4FpzCgB4Dy
btJKCeubADE1QK+I9K2E2dYATQP5BDfqZsBLXrTF+Lu4ZzqYLGAyM04KIlou4XNS
I4MWAApxCCZloSTMlpYYOH3hyupIlLwCnmSvIlrAa2gUGPGzy82UmH/7lPMlFRIR
1bYU5b70s8vx4bS0brsRnZhYfmGewk+4sIcsneQfbRHKw459wJ4h46CbrA==
=kk1b
-----END PGP SIGNATURE-----

--IlbjXZFzpa1bxN3Foosb3hob3NomxLQSR--

--===============0269446819==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
amd-gfx mailing list
amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--===============0269446819==--
