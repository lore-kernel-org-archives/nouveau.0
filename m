From: Thomas Zimmermann <tzimmermann-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH 06/20] drm/i915: Introduce GEM object functions
Date: Thu, 13 Aug 2020 11:13:04 +0200
Message-ID: <ce599990-7b0e-d0b1-8df2-ae3499560510@suse.de>
References: <20200813083644.31711-1-tzimmermann@suse.de>
 <20200813083644.31711-7-tzimmermann@suse.de> <877du2j4lf.fsf@intel.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0052426818=="
Return-path: <amd-gfx-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <877du2j4lf.fsf-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:amd-gfx-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: amd-gfx-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "amd-gfx" <amd-gfx-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Jani Nikula <jani.nikula-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, alexander.deucher-5C7GfCeVMHo@public.gmane.org, christian.koenig-5C7GfCeVMHo@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, daniel-/w4YWyX8dFk@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, maarten.lankhorst-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, mripard-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, christian.gmeiner-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, patrik.r.jakobsson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, joonas.lahtinen-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, rodrigo.vivi-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, chunkuang.hu-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sean-p7yTbzM4H96eqtR555YLDQ@public.gmane.org, bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, tomi.valkeinen-l0cyMroinI0@public.gmane.org, eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org, hjc-TNX95d0MmH7DzftRWevZcw@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, rodrigosiqueiramelo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, hamohammed.sa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, oleksandr_andrushchenko-uRwfk40T5oI@public.gmane.org, hyun.kwon-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org
Cc: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, intel-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, etnaviv-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, xen-devel-GuqFBffKawtpuQazS67q72D2FQJk+8+b@public.gmane.org, freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: nouveau.vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0052426818==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="2y1rj4S6iEPyEIbObjrxB2iAqUSpEnhqy"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--2y1rj4S6iEPyEIbObjrxB2iAqUSpEnhqy
Content-Type: multipart/mixed; boundary="yYJlHp22f67rhAArb1qx5xbB6QTfa6gjL";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann-l3A5Bk7waGM@public.gmane.org>
To: Jani Nikula <jani.nikula-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, alexander.deucher-5C7GfCeVMHo@public.gmane.org,
 christian.koenig-5C7GfCeVMHo@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, daniel-/w4YWyX8dFk@public.gmane.org,
 linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, maarten.lankhorst-VuQAYsv1563Yd54FQh9/CA@public.gmane.org,
 mripard-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, christian.gmeiner-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org,
 inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org,
 kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org,
 patrik.r.jakobsson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, joonas.lahtinen-VuQAYsv1563Yd54FQh9/CA@public.gmane.org,
 rodrigo.vivi-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, chunkuang.hu-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org,
 matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sean-p7yTbzM4H96eqtR555YLDQ@public.gmane.org,
 bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, tomi.valkeinen-l0cyMroinI0@public.gmane.org, eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org,
 hjc-TNX95d0MmH7DzftRWevZcw@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org,
 jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, rodrigosiqueiramelo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org,
 hamohammed.sa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, oleksandr_andrushchenko-uRwfk40T5oI@public.gmane.org,
 hyun.kwon-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org,
 michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, sumit.semwal-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, evan.quan-5C7GfCeVMHo@public.gmane.org,
 Hawking.Zhang-5C7GfCeVMHo@public.gmane.org, tianci.yin-5C7GfCeVMHo@public.gmane.org, marek.olsak-5C7GfCeVMHo@public.gmane.org,
 hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, andrey.grodzovsky-5C7GfCeVMHo@public.gmane.org, Felix.Kuehling-5C7GfCeVMHo@public.gmane.org,
 xinhui.pan-5C7GfCeVMHo@public.gmane.org, aaron.liu-5C7GfCeVMHo@public.gmane.org, nirmoy.das-5C7GfCeVMHo@public.gmane.org,
 chris-Y6uKTt2uX1cEflXRtASbqLVCufUGDwFn@public.gmane.org, matthew.auld-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org,
 abdiel.janulgue-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, tvrtko.ursulin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org,
 andi.shyti-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org, miaoqinglang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org,
 emil.velikov-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org
Cc: amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org,
 etnaviv-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org,
 linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, intel-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org,
 linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org,
 freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org,
 linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org,
 xen-devel-GuqFBffKawtpuQazS67q72D2FQJk+8+b@public.gmane.org
Message-ID: <ce599990-7b0e-d0b1-8df2-ae3499560510-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH 06/20] drm/i915: Introduce GEM object functions
References: <20200813083644.31711-1-tzimmermann-l3A5Bk7waGM@public.gmane.org>
 <20200813083644.31711-7-tzimmermann-l3A5Bk7waGM@public.gmane.org> <877du2j4lf.fsf-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
In-Reply-To: <877du2j4lf.fsf-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>

--yYJlHp22f67rhAArb1qx5xbB6QTfa6gjL
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 13.08.20 um 11:08 schrieb Jani Nikula:
> On Thu, 13 Aug 2020, Thomas Zimmermann <tzimmermann-l3A5Bk7waGM@public.gmane.org> wrote:
>> GEM object functions deprecate several similar callback interfaces in
>> struct drm_driver. This patch replaces the per-driver callbacks with
>> per-instance callbacks in i915.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann-l3A5Bk7waGM@public.gmane.org>
>> ---
>>  drivers/gpu/drm/i915/gem/i915_gem_object.c       |  9 ++++++++-
>>  drivers/gpu/drm/i915/i915_drv.c                  | 10 ++++++----
>>  drivers/gpu/drm/i915/i915_drv.h                  |  1 +
>>  drivers/gpu/drm/i915/selftests/mock_gem_device.c |  3 ---
>>  4 files changed, 15 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/=
drm/i915/gem/i915_gem_object.c
>> index c8421fd9d2dc..bc15ee4f2bd5 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
>> @@ -41,7 +41,14 @@ static struct i915_global_object {
>> =20
>>  struct drm_i915_gem_object *i915_gem_object_alloc(void)
>>  {
>> -	return kmem_cache_zalloc(global.slab_objects, GFP_KERNEL);
>> +	struct drm_i915_gem_object *obj;
>> +
>> +	obj =3D kmem_cache_zalloc(global.slab_objects, GFP_KERNEL);
>> +	if (!obj)
>> +		return NULL;
>> +	obj->base.funcs =3D &i915_gem_object_funcs;
>> +
>> +	return obj;
>>  }
>> =20
>>  void i915_gem_object_free(struct drm_i915_gem_object *obj)
>> diff --git a/drivers/gpu/drm/i915/i915_drv.c b/drivers/gpu/drm/i915/i9=
15_drv.c
>> index 068447f565a9..b09eee11c540 100644
>> --- a/drivers/gpu/drm/i915/i915_drv.c
>> +++ b/drivers/gpu/drm/i915/i915_drv.c
>> @@ -1840,6 +1840,12 @@ static const struct drm_ioctl_desc i915_ioctls[=
] =3D {
>>  	DRM_IOCTL_DEF_DRV(I915_GEM_VM_DESTROY, i915_gem_vm_destroy_ioctl, DR=
M_RENDER_ALLOW),
>>  };
>> =20
>> +const struct drm_gem_object_funcs i915_gem_object_funcs =3D {
>> +	.free =3D i915_gem_free_object,
>> +	.close =3D i915_gem_close_object,
>> +	.export =3D i915_gem_prime_export,
>> +};
>> +
>=20
> Any reason not to make this static in i915_gem_object.c next to its onl=
y
> user?

That is just an oversight. Will be fixed in the next iteration. Thanks.

Best regards
Thomas

>=20
> BR,
> Jani.
>=20
>=20
>>  static struct drm_driver driver =3D {
>>  	/* Don't use MTRRs here; the Xserver or userspace app should
>>  	 * deal with them for Intel hardware.
>> @@ -1853,12 +1859,8 @@ static struct drm_driver driver =3D {
>>  	.lastclose =3D i915_driver_lastclose,
>>  	.postclose =3D i915_driver_postclose,
>> =20
>> -	.gem_close_object =3D i915_gem_close_object,
>> -	.gem_free_object_unlocked =3D i915_gem_free_object,
>> -
>>  	.prime_handle_to_fd =3D drm_gem_prime_handle_to_fd,
>>  	.prime_fd_to_handle =3D drm_gem_prime_fd_to_handle,
>> -	.gem_prime_export =3D i915_gem_prime_export,
>>  	.gem_prime_import =3D i915_gem_prime_import,
>> =20
>>  	.dumb_create =3D i915_gem_dumb_create,
>> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i9=
15_drv.h
>> index bacb4c762f5b..666db65fe69e 100644
>> --- a/drivers/gpu/drm/i915/i915_drv.h
>> +++ b/drivers/gpu/drm/i915/i915_drv.h
>> @@ -1736,6 +1736,7 @@ intel_ggtt_update_needs_vtd_wa(struct drm_i915_p=
rivate *dev_priv)
>> =20
>>  /* i915_drv.c */
>>  extern const struct dev_pm_ops i915_pm_ops;
>> +extern const struct drm_gem_object_funcs i915_gem_object_funcs;
>> =20
>>  int i915_driver_probe(struct pci_dev *pdev, const struct pci_device_i=
d *ent);
>>  void i915_driver_remove(struct drm_i915_private *i915);
>> diff --git a/drivers/gpu/drm/i915/selftests/mock_gem_device.c b/driver=
s/gpu/drm/i915/selftests/mock_gem_device.c
>> index ce4d4303229c..4725dad63e0a 100644
>> --- a/drivers/gpu/drm/i915/selftests/mock_gem_device.c
>> +++ b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
>> @@ -86,9 +86,6 @@ static struct drm_driver mock_driver =3D {
>>  	.name =3D "mock",
>>  	.driver_features =3D DRIVER_GEM,
>>  	.release =3D mock_device_release,
>> -
>> -	.gem_close_object =3D i915_gem_close_object,
>> -	.gem_free_object_unlocked =3D i915_gem_free_object,
>>  };
>> =20
>>  static void release_dev(struct device *dev)
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--yYJlHp22f67rhAArb1qx5xbB6QTfa6gjL--

--2y1rj4S6iEPyEIbObjrxB2iAqUSpEnhqy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFIBAEBCAAyFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl81BCAUHHR6aW1tZXJt
YW5uQHN1c2UuZGUACgkQaA3BHVMLeiN1ywf/TqGV8rsRsYb3ww1QippHM0DMEqo+
g5vm+Ctnvb+7yYo55pBoy8VEA970jCg0p6DPFL/qs1Tgtbcz3OD7CTs31iLaYKHU
ERKsFVmG/Hu80m0rBZDTZkRoTxqe3YdsVWT0f5Xit6uCvLLVC3A7bkuVP7CmMC6p
F4csWP6RkD3FCCqZQTSgCJqnhy2Y3BuD3oeVumqDUfeLWSf8fh3cd45Oy3vn990a
L8lS7mR1NTADuYO/AmVtxTgU42KttCnazOpd79Zluy8poPpVtfKdGp1sKdLuUKWf
yNcvr8w6ucWFKZ6eqBOVGvTgmNIsF1v1JXcFuizVX8HnDY0pSs27p4kt3w==
=BuPp
-----END PGP SIGNATURE-----

--2y1rj4S6iEPyEIbObjrxB2iAqUSpEnhqy--

--===============0052426818==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
amd-gfx mailing list
amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--===============0052426818==--
