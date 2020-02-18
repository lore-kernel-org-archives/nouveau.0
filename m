From: Thomas Zimmermann <tzimmermann-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH 8/8] drm/ttm: do not keep GPU dependent addresses
Date: Tue, 18 Feb 2020 19:16:08 +0100
Message-ID: <5b8db944-5a55-8161-6ab6-98490cfb0562@suse.de>
References: <20200217150427.49994-1-nirmoy.das@amd.com>
 <20200217150427.49994-9-nirmoy.das@amd.com>
 <c3a20c1b-0520-1995-7445-9e3f3ea77394@suse.de>
 <9db59846-90b4-2b9a-8200-69297112693a@amd.com>
 <edc985f1-8856-4d1a-8960-efe4d21b960d@amd.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0439664713=="
Return-path: <amd-gfx-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <edc985f1-8856-4d1a-8960-efe4d21b960d-5C7GfCeVMHo@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:amd-gfx-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: amd-gfx-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "amd-gfx" <amd-gfx-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Nirmoy <nirmodas-5C7GfCeVMHo@public.gmane.org>, =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig-5C7GfCeVMHo@public.gmane.org>, Nirmoy Das <nirmoy.aiemd-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: thellstrom-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, kenny.ho-5C7GfCeVMHo@public.gmane.org, amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, nirmoy.das-5C7GfCeVMHo@public.gmane.org, linux-graphics-maintainer-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org, bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, alexander.deucher-5C7GfCeVMHo@public.gmane.org, sean-p7yTbzM4H96eqtR555YLDQ@public.gmane.org, kraxel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
List-Id: nouveau.vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0439664713==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="2FpYNFovlXIxQgABC0dwSvgcJqNG8hZKH"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--2FpYNFovlXIxQgABC0dwSvgcJqNG8hZKH
Content-Type: multipart/mixed; boundary="8kFX9osUBXFmJcRTklmEoYxEWgDw3kiMW";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann-l3A5Bk7waGM@public.gmane.org>
To: Nirmoy <nirmodas-5C7GfCeVMHo@public.gmane.org>, =?UTF-8?Q?Christian_K=c3=b6nig?=
 <christian.koenig-5C7GfCeVMHo@public.gmane.org>, Nirmoy Das <nirmoy.aiemd-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>,
 dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: thellstrom-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, kenny.ho-5C7GfCeVMHo@public.gmane.org,
 amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, nirmoy.das-5C7GfCeVMHo@public.gmane.org,
 linux-graphics-maintainer-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org, bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org,
 nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, alexander.deucher-5C7GfCeVMHo@public.gmane.org, sean-p7yTbzM4H96eqtR555YLDQ@public.gmane.org,
 kraxel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Message-ID: <5b8db944-5a55-8161-6ab6-98490cfb0562-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH 8/8] drm/ttm: do not keep GPU dependent addresses
References: <20200217150427.49994-1-nirmoy.das-5C7GfCeVMHo@public.gmane.org>
 <20200217150427.49994-9-nirmoy.das-5C7GfCeVMHo@public.gmane.org>
 <c3a20c1b-0520-1995-7445-9e3f3ea77394-l3A5Bk7waGM@public.gmane.org>
 <9db59846-90b4-2b9a-8200-69297112693a-5C7GfCeVMHo@public.gmane.org>
 <edc985f1-8856-4d1a-8960-efe4d21b960d-5C7GfCeVMHo@public.gmane.org>
In-Reply-To: <edc985f1-8856-4d1a-8960-efe4d21b960d-5C7GfCeVMHo@public.gmane.org>

--8kFX9osUBXFmJcRTklmEoYxEWgDw3kiMW
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 18.02.20 um 18:13 schrieb Nirmoy:
>=20
> On 2/18/20 1:44 PM, Christian K=C3=B6nig wrote:
>> Am 18.02.20 um 13:40 schrieb Thomas Zimmermann:
>>> Hi
>>>
>>> Am 17.02.20 um 16:04 schrieb Nirmoy Das:
>>>> GPU address handling is device specific and should be handle by its
>>>> device
>>>> driver.
>>>>
>>>> Signed-off-by: Nirmoy Das <nirmoy.das-5C7GfCeVMHo@public.gmane.org>
>>>> ---
>>>> =C2=A0 drivers/gpu/drm/ttm/ttm_bo.c=C2=A0=C2=A0=C2=A0 | 7 -------
>>>> =C2=A0 include/drm/ttm/ttm_bo_api.h=C2=A0=C2=A0=C2=A0 | 2 --
>>>> =C2=A0 include/drm/ttm/ttm_bo_driver.h | 1 -
>>>> =C2=A0 3 files changed, 10 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c
>>>> b/drivers/gpu/drm/ttm/ttm_bo.c
>>>> index 151edfd8de77..d5885cd609a3 100644
>>>> --- a/drivers/gpu/drm/ttm/ttm_bo.c
>>>> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
>>>> @@ -85,7 +85,6 @@ static void ttm_mem_type_debug(struct
>>>> ttm_bo_device *bdev, struct drm_printer *p
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_printf(p, "=C2=A0=C2=A0=C2=A0 has=
_type: %d\n", man->has_type);
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_printf(p, "=C2=A0=C2=A0=C2=A0 use=
_type: %d\n", man->use_type);
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_printf(p, "=C2=A0=C2=A0=C2=A0 fla=
gs: 0x%08X\n", man->flags);
>>>> -=C2=A0=C2=A0=C2=A0 drm_printf(p, "=C2=A0=C2=A0=C2=A0 gpu_offset: 0x=
%08llX\n", man->gpu_offset);
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_printf(p, "=C2=A0=C2=A0=C2=A0 siz=
e: %llu\n", man->size);
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_printf(p, "=C2=A0=C2=A0=C2=A0 ava=
ilable_caching: 0x%08X\n",
>>>> man->available_caching);
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_printf(p, "=C2=A0=C2=A0=C2=A0 def=
ault_caching: 0x%08X\n",
>>>> man->default_caching);
>>>> @@ -345,12 +344,6 @@ static int ttm_bo_handle_move_mem(struct
>>>> ttm_buffer_object *bo,
>>>> =C2=A0 moved:
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bo->evicted =3D false;
>>>> =C2=A0 -=C2=A0=C2=A0=C2=A0 if (bo->mem.mm_node)
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bo->offset =3D (bo->mem.=
start << PAGE_SHIFT) +
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
bdev->man[bo->mem.mem_type].gpu_offset;
>>>> -=C2=A0=C2=A0=C2=A0 else
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bo->offset =3D 0;
>>>> -
>>> After moving this into users, the else branch has been lost. Is
>>> 'bo->mem.mm_node' always true?
>>
>> At least for the amdgpu and radeon use cases, yes.
>>
>> But that is a rather good question I mean for it is illegal to get the=

>> GPU BO address if it is inaccessible (e.g. in the system domain).
>>
>> Could be that some driver relied on the behavior to get 0 for the
>> system domain here.
>=20
> I wonder how to verify that ?
>=20
> If I understand correctly:
>=20
> 1 qxl uses bo->offset only in qxl_bo_physical_address() which is not in=
=C2=A0
> system domain.
>=20
> 2 unfortunately I can't say the same for bochs but it works with this
> patch series so I think bochs is fine as well.
>=20
> 3 vmwgfx uses bo->offset only when bo->mem.mem_type =3D=3D TTM_PL_VRAM =
so
> vmwgfx should be fine.
>=20
> 4 amdgpu and radeon runs with 'bo->mem.mm_node' always true
>=20
> I am not sure about=C2=A0 nouveau as bo->offset is being used in many p=
laces.
>=20
> I could probably mirror the removed logic to nouveau as

I suggest to introduce a ttm helper that contains the original branching
and use it everywhere. Something like

  s64 ttm_bo_offset(struct ttm_buffer_object *bo)
  {
     if (WARN_ON_ONCE(!bo->mem.mm_node))
         return 0;
     return bo->mem.start << PAGE_SHIFT;
  }

Could be static inline. The warning should point to broken drivers. This
also gets rid of the ugly shift in the drivers.

Best regards
Thomas


>=20
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c
> b/drivers/gpu/drm/nouveau/nouveau_bo.c
> index f8015e0318d7..5a6a2af91318 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> @@ -1317,6 +1317,10 @@ nouveau_bo_move_ntfy(struct ttm_buffer_object
> *bo, bool evict,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 list_for_each_entry(vma, &nvbo->vma_list, head) {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nouvea=
u_vma_map(vma, mem);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 }
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 if (bo->mem.mm_node)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nvbo->offset=
 =3D (new_reg->start << PAGE_SHIFT);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 else
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nvbo->offset=
 =3D 0;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 list_for_each_entry(vma, &nvbo->vma_list, head) {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 WARN_O=
N(ttm_bo_wait(bo, false, false));
>=20
> Regards,
>=20
> Nirmoy
>=20
>=20
>>
>> Regards,
>> Christian.
>>
>>>
>>> Best regards
>>> Thomas
>>>
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ctx->bytes_moved +=3D bo->num_pages <=
< PAGE_SHIFT;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>>>> =C2=A0 diff --git a/include/drm/ttm/ttm_bo_api.h
>>>> b/include/drm/ttm/ttm_bo_api.h
>>>> index b9bc1b00142e..d6f39ee5bf5d 100644
>>>> --- a/include/drm/ttm/ttm_bo_api.h
>>>> +++ b/include/drm/ttm/ttm_bo_api.h
>>>> @@ -213,8 +213,6 @@ struct ttm_buffer_object {
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * either of these locks held.
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>>>> =C2=A0 -=C2=A0=C2=A0=C2=A0 uint64_t offset; /* GPU address space is =
independent of CPU
>>>> word size */
>>>> -
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct sg_table *sg;
>>>> =C2=A0 };
>>>> =C2=A0 diff --git a/include/drm/ttm/ttm_bo_driver.h
>>>> b/include/drm/ttm/ttm_bo_driver.h
>>>> index c9e0fd09f4b2..c8ce6c181abe 100644
>>>> --- a/include/drm/ttm/ttm_bo_driver.h
>>>> +++ b/include/drm/ttm/ttm_bo_driver.h
>>>> @@ -177,7 +177,6 @@ struct ttm_mem_type_manager {
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool has_type;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool use_type;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint32_t flags;
>>>> -=C2=A0=C2=A0=C2=A0 uint64_t gpu_offset; /* GPU address space is ind=
ependent of CPU
>>>> word size */
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint64_t size;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint32_t available_caching;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint32_t default_caching;
>>>>
>>
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


--8kFX9osUBXFmJcRTklmEoYxEWgDw3kiMW--

--2FpYNFovlXIxQgABC0dwSvgcJqNG8hZKH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl5MKegACgkQaA3BHVML
eiPLmAf/XSJQY4qYaVUbzr30C7lZmwph8iZD5GCExhr5eurd8ybw8/97o+9aiwH0
mdEclOvgJFaTanaObGvcqhi6bry7dA3KtCFKkcgdKUdXd+YLdHnsjAr+IO1opkVI
QrRUHYjKKE64PsYYmGL5OjFVYnXQZoaR++dJ1K9n0Ywyc4uKbAaanlJdCPmtZTSA
sHQdWkmBoMpmUlW+yTE5OWmX6y3Odv7cDYEHI1xD4L9lUvEd/kTWp1w6ZEH0hx3U
vO1Mq7IQ2LuC3ZEpYg0Kn5t4MSdEL6gl60fRs8nrlvinksRG8CJL+B/BdV+jUKm9
vOTorceJITCSTqK5PfepaphzJfwMnQ==
=MYTX
-----END PGP SIGNATURE-----

--2FpYNFovlXIxQgABC0dwSvgcJqNG8hZKH--

--===============0439664713==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
amd-gfx mailing list
amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--===============0439664713==--
