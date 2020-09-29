From: Thomas Zimmermann <tzimmermann-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH v3 2/7] drm/ttm: Add ttm_kmap_obj_to_dma_buf_map() for
 type conversion
Date: Tue, 29 Sep 2020 19:49:30 +0200
Message-ID: <2614314a-81f7-4722-c400-68d90e48e09a@suse.de>
References: <20200929151437.19717-1-tzimmermann@suse.de>
 <20200929151437.19717-3-tzimmermann@suse.de>
 <8fad0114-064a-4ed5-c21d-d1b4294de0a1@amd.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1725065043=="
Return-path: <amd-gfx-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <8fad0114-064a-4ed5-c21d-d1b4294de0a1-5C7GfCeVMHo@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:amd-gfx-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: amd-gfx-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "amd-gfx" <amd-gfx-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig-5C7GfCeVMHo@public.gmane.org>, maarten.lankhorst-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, mripard-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, daniel-/w4YWyX8dFk@public.gmane.org, sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org, alexander.deucher-5C7GfCeVMHo@public.gmane.org, kraxel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux+etnaviv-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, christian.gmeiner-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, yuq825-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org, steven.price-5wv7dgnIgG8@public.gmane.org, alyssa.rosenzweig-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org, hjc-TNX95d0MmH7DzftRWevZcw@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, sean-p7yTbzM4H96eqtR555YLDQ@public.gmane.org, eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org, oleksandr_andrushchenko-uRwfk40T5oI@public.gmane.org, ray.huang-5C7GfCeVMHo@public.gmane.org, sumit.semwal-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, emil.velikov-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org, luben.tuikov-5C7GfCeVMHo@public.gmane.org, apaneers-5C7GfCeVMHo@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, melissa.srw-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, chris-Y6uKTt2uX1cEflXRtASbqLVCufUGDwFn@public.gmane.org
Cc: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lima-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, etnaviv-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, virtualization-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org, linaro-mm-sig-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, spice-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, xen-devel-GuqFBffKawtpuQazS67q72D2FQJk+8+b@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: nouveau.vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1725065043==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="TxZtp2xZDgS8tF4LCH0pvplac5jBMMD1n"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--TxZtp2xZDgS8tF4LCH0pvplac5jBMMD1n
Content-Type: multipart/mixed; boundary="KHQT7KYakINZF3D85LRV0AG8BWDH6IVnP";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann-l3A5Bk7waGM@public.gmane.org>
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig-5C7GfCeVMHo@public.gmane.org>,
 maarten.lankhorst-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, mripard-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org,
 daniel-/w4YWyX8dFk@public.gmane.org, sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org, alexander.deucher-5C7GfCeVMHo@public.gmane.org,
 kraxel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux+etnaviv-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org,
 christian.gmeiner-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org,
 sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org,
 krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, yuq825-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org,
 tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org, steven.price-5wv7dgnIgG8@public.gmane.org,
 alyssa.rosenzweig-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org, hjc-TNX95d0MmH7DzftRWevZcw@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org,
 hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, sean-p7yTbzM4H96eqtR555YLDQ@public.gmane.org, eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org,
 oleksandr_andrushchenko-uRwfk40T5oI@public.gmane.org, ray.huang-5C7GfCeVMHo@public.gmane.org,
 sumit.semwal-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, emil.velikov-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org, luben.tuikov-5C7GfCeVMHo@public.gmane.org,
 apaneers-5C7GfCeVMHo@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, melissa.srw-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org,
 chris-Y6uKTt2uX1cEflXRtASbqLVCufUGDwFn@public.gmane.org, miaoqinglang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org
Cc: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lima-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org,
 nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, etnaviv-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org,
 amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, virtualization-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org,
 linaro-mm-sig-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org,
 dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, xen-devel-GuqFBffKawtpuQazS67q72D2FQJk+8+b@public.gmane.org,
 spice-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org,
 linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Message-ID: <2614314a-81f7-4722-c400-68d90e48e09a-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH v3 2/7] drm/ttm: Add ttm_kmap_obj_to_dma_buf_map() for
 type conversion
References: <20200929151437.19717-1-tzimmermann-l3A5Bk7waGM@public.gmane.org>
 <20200929151437.19717-3-tzimmermann-l3A5Bk7waGM@public.gmane.org>
 <8fad0114-064a-4ed5-c21d-d1b4294de0a1-5C7GfCeVMHo@public.gmane.org>
In-Reply-To: <8fad0114-064a-4ed5-c21d-d1b4294de0a1-5C7GfCeVMHo@public.gmane.org>

--KHQT7KYakINZF3D85LRV0AG8BWDH6IVnP
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Christian

Am 29.09.20 um 17:35 schrieb Christian K=C3=B6nig:
> Am 29.09.20 um 17:14 schrieb Thomas Zimmermann:
>> The new helper ttm_kmap_obj_to_dma_buf() extracts address and location=

>> from and instance of TTM's kmap_obj and initializes struct dma_buf_map=

>> with these values. Helpful for TTM-based drivers.
>=20
> We could completely drop that if we use the same structure inside TTM a=
s
> well.
>=20
> Additional to that which driver is going to use this?

As Daniel mentioned, it's in patch 3. The TTM-based drivers will
retrieve the pointer via this function.

I do want to see all that being more tightly integrated into TTM, but
not in this series. This one is about fixing the bochs-on-sparc64
problem for good. Patch 7 adds an update to TTM to the DRM TODO list.

Best regards
Thomas

>=20
> Regards,
> Christian.
>=20
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann-l3A5Bk7waGM@public.gmane.org>
>> ---
>> =C2=A0 include/drm/ttm/ttm_bo_api.h | 24 ++++++++++++++++++++++++
>> =C2=A0 include/linux/dma-buf-map.h=C2=A0 | 20 ++++++++++++++++++++
>> =C2=A0 2 files changed, 44 insertions(+)
>>
>> diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api=
=2Eh
>> index c96a25d571c8..62d89f05a801 100644
>> --- a/include/drm/ttm/ttm_bo_api.h
>> +++ b/include/drm/ttm/ttm_bo_api.h
>> @@ -34,6 +34,7 @@
>> =C2=A0 #include <drm/drm_gem.h>
>> =C2=A0 #include <drm/drm_hashtab.h>
>> =C2=A0 #include <drm/drm_vma_manager.h>
>> +#include <linux/dma-buf-map.h>
>> =C2=A0 #include <linux/kref.h>
>> =C2=A0 #include <linux/list.h>
>> =C2=A0 #include <linux/wait.h>
>> @@ -486,6 +487,29 @@ static inline void *ttm_kmap_obj_virtual(struct
>> ttm_bo_kmap_obj *map,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return map->virtual;
>> =C2=A0 }
>> =C2=A0 +/**
>> + * ttm_kmap_obj_to_dma_buf_map
>> + *
>> + * @kmap: A struct ttm_bo_kmap_obj returned from ttm_bo_kmap.
>> + * @map: Returns the mapping as struct dma_buf_map
>> + *
>> + * Converts struct ttm_bo_kmap_obj to struct dma_buf_map. If the memo=
ry
>> + * is not mapped, the returned mapping is initialized to NULL.
>> + */
>> +static inline void ttm_kmap_obj_to_dma_buf_map(struct ttm_bo_kmap_obj=

>> *kmap,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 struct dma_buf_map *map)
>> +{
>> +=C2=A0=C2=A0=C2=A0 bool is_iomem;
>> +=C2=A0=C2=A0=C2=A0 void *vaddr =3D ttm_kmap_obj_virtual(kmap, &is_iom=
em);
>> +
>> +=C2=A0=C2=A0=C2=A0 if (!vaddr)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dma_buf_map_clear(map);
>> +=C2=A0=C2=A0=C2=A0 else if (is_iomem)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dma_buf_map_set_vaddr_iome=
m(map, (void __force __iomem *)vaddr);
>> +=C2=A0=C2=A0=C2=A0 else
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dma_buf_map_set_vaddr(map,=
 vaddr);
>> +}
>> +
>> =C2=A0 /**
>> =C2=A0=C2=A0 * ttm_bo_kmap
>> =C2=A0=C2=A0 *
>> diff --git a/include/linux/dma-buf-map.h b/include/linux/dma-buf-map.h=

>> index fd1aba545fdf..2e8bbecb5091 100644
>> --- a/include/linux/dma-buf-map.h
>> +++ b/include/linux/dma-buf-map.h
>> @@ -45,6 +45,12 @@
>> =C2=A0=C2=A0 *
>> =C2=A0=C2=A0 *=C2=A0=C2=A0=C2=A0 dma_buf_map_set_vaddr(&map. 0xdeadbea=
f);
>> =C2=A0=C2=A0 *
>> + * To set an address in I/O memory, use dma_buf_map_set_vaddr_iomem()=
=2E
>> + *
>> + * .. code-block:: c
>> + *
>> + *=C2=A0=C2=A0=C2=A0 dma_buf_map_set_vaddr_iomem(&map. 0xdeadbeaf);
>> + *
>> =C2=A0=C2=A0 * Test if a mapping is valid with either dma_buf_map_is_s=
et() or
>> =C2=A0=C2=A0 * dma_buf_map_is_null().
>> =C2=A0=C2=A0 *
>> @@ -118,6 +124,20 @@ static inline void dma_buf_map_set_vaddr(struct
>> dma_buf_map *map, void *vaddr)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 map->is_iomem =3D false;
>> =C2=A0 }
>> =C2=A0 +/**
>> + * dma_buf_map_set_vaddr_iomem - Sets a dma-buf mapping structure to
>> an address in I/O memory
>> + * @map:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 The dma-buf mappin=
g structure
>> + * @vaddr_iomem:=C2=A0=C2=A0=C2=A0 An I/O-memory address
>> + *
>> + * Sets the address and the I/O-memory flag.
>> + */
>> +static inline void dma_buf_map_set_vaddr_iomem(struct dma_buf_map *ma=
p,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 void __iomem *vaddr_iomem)
>> +{
>> +=C2=A0=C2=A0=C2=A0 map->vaddr_iomem =3D vaddr_iomem;
>> +=C2=A0=C2=A0=C2=A0 map->is_iomem =3D true;
>> +}
>> +
>> =C2=A0 /**
>> =C2=A0=C2=A0 * dma_buf_map_is_equal - Compares two dma-buf mapping str=
uctures
>> for equality
>> =C2=A0=C2=A0 * @lhs:=C2=A0=C2=A0=C2=A0 The dma-buf mapping structure
>=20
> _______________________________________________
> dri-devel mailing list
> dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--KHQT7KYakINZF3D85LRV0AG8BWDH6IVnP--

--TxZtp2xZDgS8tF4LCH0pvplac5jBMMD1n
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFIBAEBCAAyFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl9zc60UHHR6aW1tZXJt
YW5uQHN1c2UuZGUACgkQaA3BHVMLeiNPnwf/aCTKdBejEjGzelqMuF4UePySm/kg
uxWq4a3bhUNU/jUfaYErgmfPo7k2kd8GBKNwzUIWBmuanOtyVjPUASvzWxWn7GBo
c0Y2iWSttNk7zk3Qr330IDKDPtQjtzVbklLBu1YsbOQi0WqdzK0uFpRKl9MAvmth
5mi7+IzMbP/w3eu8z71VaPc7xy5tYCmeeyqeEPIEV3CoY4QnFaJDhRxenlDIZ/bR
M9RHikgzelrT1Nra42ooEtT6b3mBp4p63jHBHzTQnSjlAYT1khyKFLvQSHjNPyCN
GMHZqwUnG3U9EMjYvcGsvk7hZ4ROSOwVpq0j00R3hAK5rfbg6C1+v4XNSQ==
=/tV0
-----END PGP SIGNATURE-----

--TxZtp2xZDgS8tF4LCH0pvplac5jBMMD1n--

--===============1725065043==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
amd-gfx mailing list
amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--===============1725065043==--
