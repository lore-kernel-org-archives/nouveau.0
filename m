From: Thomas Zimmermann <tzimmermann-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH v3 00/22] Convert all remaining drivers to GEM object
 functions
Date: Fri, 25 Sep 2020 10:40:10 +0200
Message-ID: <6c6b429c-8f74-99f3-73de-920dad26197a@suse.de>
References: <20200923102159.24084-1-tzimmermann@suse.de>
 <f6ee9aab-1568-1896-ef07-a4de6ceec989@amd.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0865185446=="
Return-path: <amd-gfx-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <f6ee9aab-1568-1896-ef07-a4de6ceec989-5C7GfCeVMHo@public.gmane.org>
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
--===============0865185446==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="LabGFb9cZphJ6FpQUA9KWxOwS9aPh02zb"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--LabGFb9cZphJ6FpQUA9KWxOwS9aPh02zb
Content-Type: multipart/mixed; boundary="YrgllsXxrG3yDVk9eYt3PnZ2tiJ3YeTQ7";
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
 emil.velikov-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org, laurentiu.palcu-0KzQaVfr69FBDgjK7y7TUQ@public.gmane.org,
 shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org,
 festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-imx-3arQi8VN3Tc@public.gmane.org
Cc: amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org,
 etnaviv-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org,
 linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, intel-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org,
 linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org,
 freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org,
 linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org,
 xen-devel-GuqFBffKawtpuQazS67q72D2FQJk+8+b@public.gmane.org
Message-ID: <6c6b429c-8f74-99f3-73de-920dad26197a-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH v3 00/22] Convert all remaining drivers to GEM object
 functions
References: <20200923102159.24084-1-tzimmermann-l3A5Bk7waGM@public.gmane.org>
 <f6ee9aab-1568-1896-ef07-a4de6ceec989-5C7GfCeVMHo@public.gmane.org>
In-Reply-To: <f6ee9aab-1568-1896-ef07-a4de6ceec989-5C7GfCeVMHo@public.gmane.org>

--YrgllsXxrG3yDVk9eYt3PnZ2tiJ3YeTQ7
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 23.09.20 um 16:33 schrieb Christian K=C3=B6nig:
> Feel free to add an Acked-by: Christian K=C3=B6nig <christian.koenig@am=
d.com>
> to all patches which I haven't explicitly reviewed.

Done, thanks.

>=20
> I would say we should just push this to drm-misc-next now.

It's merged now.

Best regards
Thomas

>=20
> Thanks for the nice cleanup,
> Christian.
>=20
> Am 23.09.20 um 12:21 schrieb Thomas Zimmermann:
>> The GEM and PRIME related callbacks in struct drm_driver are
>> deprecated in
>> favor of GEM object functions in struct drm_gem_object_funcs. This
>> patchset
>> converts the remaining drivers to object functions and removes most of=

>> the
>> obsolete interfaces.
>>
>> Version 3 of this patchset mostly fixes drm_gem_prime_handle_to_fd and=

>> updates i.MX's dcss driver. The driver was missing from earlier versio=
ns
>> and still needs review.
>>
>> Patches #1 to #6, #8 to #17 and #19 to #20 convert DRM drivers to GEM
>> object
>> functions, one by one. Each patch moves existing callbacks from struct=

>> drm_driver to an instance of struct drm_gem_object_funcs, and sets the=
se
>> funcs when the GEM object is initialized. The expection is
>> .gem_prime_mmap.
>> There are different ways of how drivers implement the callback, and
>> moving
>> it to GEM object functions requires a closer review for each.
>>
>> Patch #18 fixes virtgpu to use GEM object functions where possible. Th=
e
>> driver recently introduced a function for one of the deprecated
>> callbacks.
>>
>> Patches #7 and #20 convert i.MX's dcss and xlnx to CMA helper macros.
>> There's
>> no apparent reason why the drivers do the GEM setup on their's own.
>> Using CMA
>> helper macros adds GEM object functions implicitly.
>>
>> With most of the GEM and PRIME moved to GEM object functions, related
>> code
>> in struct drm_driver and in the DRM core/helpers is being removed by
>> patch
>> #22.
>>
>> Further testing is welcome. I tested the drivers for which I have HW
>> available. These are gma500, i915, nouveau, radeon and vc4. The consol=
e,
>> Weston and Xorg apparently work with the patches applied.
>>
>> v3:
>> =C2=A0=C2=A0=C2=A0=C2=A0* restore default call to drm_gem_prime_export=
() in
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_gem_prime_handle_to_fd()
>> =C2=A0=C2=A0=C2=A0=C2=A0* return -ENOSYS if get_sg_table is not set
>> =C2=A0=C2=A0=C2=A0=C2=A0* drop all checks for obj->funcs
>> =C2=A0=C2=A0=C2=A0=C2=A0* clean up TODO list and documentation
>> v2:
>> =C2=A0=C2=A0=C2=A0=C2=A0* moved code in amdgpu and radeon
>> =C2=A0=C2=A0=C2=A0=C2=A0* made several functions static in various dri=
vers
>> =C2=A0=C2=A0=C2=A0=C2=A0* updated TODO-list item
>> =C2=A0=C2=A0=C2=A0=C2=A0* fix virtgpu
>>
>> Thomas Zimmermann (22):
>> =C2=A0=C2=A0 drm/amdgpu: Introduce GEM object functions
>> =C2=A0=C2=A0 drm/armada: Introduce GEM object functions
>> =C2=A0=C2=A0 drm/etnaviv: Introduce GEM object functions
>> =C2=A0=C2=A0 drm/exynos: Introduce GEM object functions
>> =C2=A0=C2=A0 drm/gma500: Introduce GEM object functions
>> =C2=A0=C2=A0 drm/i915: Introduce GEM object functions
>> =C2=A0=C2=A0 drm/imx/dcss: Initialize DRM driver instance with CMA hel=
per macro
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
>> =C2=A0 Documentation/gpu/drm-mm.rst=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
 4 +-
>> =C2=A0 Documentation/gpu/todo.rst=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0 9 +-
>> =C2=A0 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 6 --
>> =C2=A0 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 23 +++--
>> =C2=A0 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.h=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 5 --
>> =C2=A0 drivers/gpu/drm/armada/armada_drv.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 3 -
>> =C2=A0 drivers/gpu/drm/armada/armada_gem.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 12 ++-
>> =C2=A0 drivers/gpu/drm/armada/armada_gem.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 -
>> =C2=A0 drivers/gpu/drm/drm_gem.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 53 ++++--------
>> =C2=A0 drivers/gpu/drm/drm_gem_cma_helper.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 8 +-
>> =C2=A0 drivers/gpu/drm/drm_prime.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
| 14 +--
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
>> =C2=A0 drivers/gpu/drm/imx/dcss/dcss-kms.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 14 +--
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
>> =C2=A0 drivers/gpu/drm/rockchip/rockchip_drm_gem.c=C2=A0=C2=A0 | 12 ++=
-
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
>> =C2=A0 include/drm/drm_gem.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
>> =C2=A0 59 files changed, 333 insertions(+), 375 deletions(-)
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


--YrgllsXxrG3yDVk9eYt3PnZ2tiJ3YeTQ7--

--LabGFb9cZphJ6FpQUA9KWxOwS9aPh02zb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFIBAEBCAAyFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl9trOsUHHR6aW1tZXJt
YW5uQHN1c2UuZGUACgkQaA3BHVMLeiOxhwgAkAYiN5cpH8HCfFm3pzUjLe2BtrJz
k+Vt8Wd5qvXc3y7iQBBR9qx0E6z51ZNcxHhULFx+Wyw10/EVyYFJHNJO2440itG5
nHcvl5zihIXi5kx82/2AhYI0rWUDgvkNFz4tiqTYfdyEFW2RWBYNb0cAhJPGpVQN
7GRODf0jQdkZK3W79ZKSzjqq2lx3dlwviA0EYCWhe6yKDyUXC9/3oWiJlmf4Mlp5
mHUlNVt+QVbdOxtYtGJ9nBC6iRxS2xUPfAVJPTPELlCphnxroZPrkNd1x+O+zMNv
5giRN+hDTtrRwlH+XPkgqtpwt/LD2tMSFBAZscDhhifadDzYXOKCgjfQvg==
=AWHl
-----END PGP SIGNATURE-----

--LabGFb9cZphJ6FpQUA9KWxOwS9aPh02zb--

--===============0865185446==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
amd-gfx mailing list
amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--===============0865185446==--
