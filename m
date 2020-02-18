From: Thomas Zimmermann <tzimmermann-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH 8/8] drm/ttm: do not keep GPU dependent addresses
Date: Tue, 18 Feb 2020 19:28:23 +0100
Message-ID: <48a5e3e2-cb9d-8328-1529-3558601ba860@suse.de>
References: <20200217150427.49994-1-nirmoy.das@amd.com>
 <20200217150427.49994-9-nirmoy.das@amd.com>
 <c3a20c1b-0520-1995-7445-9e3f3ea77394@suse.de>
 <9db59846-90b4-2b9a-8200-69297112693a@amd.com>
 <edc985f1-8856-4d1a-8960-efe4d21b960d@amd.com>
 <5b8db944-5a55-8161-6ab6-98490cfb0562@suse.de>
 <f8534965-ea14-bbac-bd34-06b951766a7c@amd.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1638770956=="
Return-path: <amd-gfx-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <f8534965-ea14-bbac-bd34-06b951766a7c-5C7GfCeVMHo@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:amd-gfx-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: amd-gfx-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "amd-gfx" <amd-gfx-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig-5C7GfCeVMHo@public.gmane.org>, Nirmoy <nirmodas-5C7GfCeVMHo@public.gmane.org>, Nirmoy Das <nirmoy.aiemd-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: thellstrom-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, kenny.ho-5C7GfCeVMHo@public.gmane.org, amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, nirmoy.das-5C7GfCeVMHo@public.gmane.org, linux-graphics-maintainer-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org, bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, alexander.deucher-5C7GfCeVMHo@public.gmane.org, sean-p7yTbzM4H96eqtR555YLDQ@public.gmane.org, kraxel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
List-Id: nouveau.vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1638770956==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="5odbZ9nBjSpbEGJk3Eu9ZnKJP14fWy4mO"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--5odbZ9nBjSpbEGJk3Eu9ZnKJP14fWy4mO
Content-Type: multipart/mixed; boundary="2QTwX1RqQT5bd67J6YiyKh3dVgnvqnLoS";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann-l3A5Bk7waGM@public.gmane.org>
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig-5C7GfCeVMHo@public.gmane.org>,
 Nirmoy <nirmodas-5C7GfCeVMHo@public.gmane.org>, Nirmoy Das <nirmoy.aiemd-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>,
 dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: thellstrom-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, kenny.ho-5C7GfCeVMHo@public.gmane.org,
 amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, nirmoy.das-5C7GfCeVMHo@public.gmane.org,
 linux-graphics-maintainer-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org, bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org,
 nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, alexander.deucher-5C7GfCeVMHo@public.gmane.org, sean-p7yTbzM4H96eqtR555YLDQ@public.gmane.org,
 kraxel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Message-ID: <48a5e3e2-cb9d-8328-1529-3558601ba860-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH 8/8] drm/ttm: do not keep GPU dependent addresses
References: <20200217150427.49994-1-nirmoy.das-5C7GfCeVMHo@public.gmane.org>
 <20200217150427.49994-9-nirmoy.das-5C7GfCeVMHo@public.gmane.org>
 <c3a20c1b-0520-1995-7445-9e3f3ea77394-l3A5Bk7waGM@public.gmane.org>
 <9db59846-90b4-2b9a-8200-69297112693a-5C7GfCeVMHo@public.gmane.org>
 <edc985f1-8856-4d1a-8960-efe4d21b960d-5C7GfCeVMHo@public.gmane.org>
 <5b8db944-5a55-8161-6ab6-98490cfb0562-l3A5Bk7waGM@public.gmane.org>
 <f8534965-ea14-bbac-bd34-06b951766a7c-5C7GfCeVMHo@public.gmane.org>
In-Reply-To: <f8534965-ea14-bbac-bd34-06b951766a7c-5C7GfCeVMHo@public.gmane.org>

--2QTwX1RqQT5bd67J6YiyKh3dVgnvqnLoS
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 18.02.20 um 19:23 schrieb Christian K=C3=B6nig:
> Am 18.02.20 um 19:16 schrieb Thomas Zimmermann:
>> Hi
>>
>> Am 18.02.20 um 18:13 schrieb Nirmoy:
>>> On 2/18/20 1:44 PM, Christian K=C3=B6nig wrote:
>>>> Am 18.02.20 um 13:40 schrieb Thomas Zimmermann:
>>>>> Hi
>>>>>
>>>>> Am 17.02.20 um 16:04 schrieb Nirmoy Das:
>>>>>> GPU address handling is device specific and should be handle by it=
s
>>>>>> device
>>>>>> driver.
>>>>>>
>>>>>> Signed-off-by: Nirmoy Das <nirmoy.das-5C7GfCeVMHo@public.gmane.org>
>>>>>> ---
>>>>>> =C2=A0=C2=A0 drivers/gpu/drm/ttm/ttm_bo.c=C2=A0=C2=A0=C2=A0 | 7 --=
-----
>>>>>> =C2=A0=C2=A0 include/drm/ttm/ttm_bo_api.h=C2=A0=C2=A0=C2=A0 | 2 --=

>>>>>> =C2=A0=C2=A0 include/drm/ttm/ttm_bo_driver.h | 1 -
>>>>>> =C2=A0=C2=A0 3 files changed, 10 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c
>>>>>> b/drivers/gpu/drm/ttm/ttm_bo.c
>>>>>> index 151edfd8de77..d5885cd609a3 100644
>>>>>> --- a/drivers/gpu/drm/ttm/ttm_bo.c
>>>>>> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
>>>>>> @@ -85,7 +85,6 @@ static void ttm_mem_type_debug(struct
>>>>>> ttm_bo_device *bdev, struct drm_printer *p
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_printf(p, "=C2=A0=C2=A0=C2=
=A0 has_type: %d\n", man->has_type);
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_printf(p, "=C2=A0=C2=A0=C2=
=A0 use_type: %d\n", man->use_type);
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_printf(p, "=C2=A0=C2=A0=C2=
=A0 flags: 0x%08X\n", man->flags);
>>>>>> -=C2=A0=C2=A0=C2=A0 drm_printf(p, "=C2=A0=C2=A0=C2=A0 gpu_offset: =
0x%08llX\n", man->gpu_offset);
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_printf(p, "=C2=A0=C2=A0=C2=
=A0 size: %llu\n", man->size);
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_printf(p, "=C2=A0=C2=A0=C2=
=A0 available_caching: 0x%08X\n",
>>>>>> man->available_caching);
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_printf(p, "=C2=A0=C2=A0=C2=
=A0 default_caching: 0x%08X\n",
>>>>>> man->default_caching);
>>>>>> @@ -345,12 +344,6 @@ static int ttm_bo_handle_move_mem(struct
>>>>>> ttm_buffer_object *bo,
>>>>>> =C2=A0=C2=A0 moved:
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bo->evicted =3D false;
>>>>>> =C2=A0=C2=A0 -=C2=A0=C2=A0=C2=A0 if (bo->mem.mm_node)
>>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bo->offset =3D (bo->me=
m.start << PAGE_SHIFT) +
>>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 bdev->man[bo->mem.mem_type].gpu_offset;
>>>>>> -=C2=A0=C2=A0=C2=A0 else
>>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bo->offset =3D 0;
>>>>>> -
>>>>> After moving this into users, the else branch has been lost. Is
>>>>> 'bo->mem.mm_node' always true?
>>>> At least for the amdgpu and radeon use cases, yes.
>>>>
>>>> But that is a rather good question I mean for it is illegal to get t=
he
>>>> GPU BO address if it is inaccessible (e.g. in the system domain).
>>>>
>>>> Could be that some driver relied on the behavior to get 0 for the
>>>> system domain here.
>>> I wonder how to verify that ?
>>>
>>> If I understand correctly:
>>>
>>> 1 qxl uses bo->offset only in qxl_bo_physical_address() which is not =
in
>>> system domain.
>>>
>>> 2 unfortunately I can't say the same for bochs but it works with this=

>>> patch series so I think bochs is fine as well.
>>>
>>> 3 vmwgfx uses bo->offset only when bo->mem.mem_type =3D=3D TTM_PL_VRA=
M so
>>> vmwgfx should be fine.
>>>
>>> 4 amdgpu and radeon runs with 'bo->mem.mm_node' always true
>>>
>>> I am not sure about=C2=A0 nouveau as bo->offset is being used in many=
 places.
>>>
>>> I could probably mirror the removed logic to nouveau as
>> I suggest to introduce a ttm helper that contains the original branchi=
ng
>> and use it everywhere. Something like
>>
>> =C2=A0=C2=A0 s64 ttm_bo_offset(struct ttm_buffer_object *bo)
>> =C2=A0=C2=A0 {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (WARN_ON_ONCE(!bo->mem.mm_node))
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return bo->mem.start << PAGE_SHIFT;
>> =C2=A0=C2=A0 }
>>
>> Could be static inline. The warning should point to broken drivers. Th=
is
>> also gets rid of the ugly shift in the drivers.
>=20
> Big NAK on this. That is exactly what we should NOT do.
>=20
> See the shift belongs into the driver, because it is driver dependent i=
f
> we work with page or byte offsets.
>=20
> For amdgpu we for example want to work with byte offsets and TTM should=

> not make any assumption about what bo->mem.start actually contains.

OK. What about something like ttm_bo_pg_offset()? Same code without the
shift. Would also make it clear that it's a page offset.

Best regards
Thomas

>=20
> Regards,
> Christian.
>=20
>>
>> Best regards
>> Thomas
>>
>>
>>> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c
>>> b/drivers/gpu/drm/nouveau/nouveau_bo.c
>>> index f8015e0318d7..5a6a2af91318 100644
>>> --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
>>> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
>>> @@ -1317,6 +1317,10 @@ nouveau_bo_move_ntfy(struct ttm_buffer_object
>>> *bo, bool evict,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 list_for_each_entry(vma, &nvbo->vma_list, hea=
d) {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 nouveau_vma_map(vma, mem);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 if (bo->mem.mm_node)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nvbo->off=
set =3D (new_reg->start << PAGE_SHIFT);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 else
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nvbo->off=
set =3D 0;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 list_for_each_entry(vma, &nvbo->vma_list, hea=
d) {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 WARN_ON(ttm_bo_wait(bo, false, false));
>>>
>>> Regards,
>>>
>>> Nirmoy
>>>
>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>> Best regards
>>>>> Thomas
>>>>>
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ctx->bytes_moved +=3D bo->num=
_pages << PAGE_SHIFT;
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>>>>>> =C2=A0=C2=A0 diff --git a/include/drm/ttm/ttm_bo_api.h
>>>>>> b/include/drm/ttm/ttm_bo_api.h
>>>>>> index b9bc1b00142e..d6f39ee5bf5d 100644
>>>>>> --- a/include/drm/ttm/ttm_bo_api.h
>>>>>> +++ b/include/drm/ttm/ttm_bo_api.h
>>>>>> @@ -213,8 +213,6 @@ struct ttm_buffer_object {
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * either of these locks=
 held.
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>>>>>> =C2=A0=C2=A0 -=C2=A0=C2=A0=C2=A0 uint64_t offset; /* GPU address s=
pace is independent of CPU
>>>>>> word size */
>>>>>> -
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct sg_table *sg;
>>>>>> =C2=A0=C2=A0 };
>>>>>> =C2=A0=C2=A0 diff --git a/include/drm/ttm/ttm_bo_driver.h
>>>>>> b/include/drm/ttm/ttm_bo_driver.h
>>>>>> index c9e0fd09f4b2..c8ce6c181abe 100644
>>>>>> --- a/include/drm/ttm/ttm_bo_driver.h
>>>>>> +++ b/include/drm/ttm/ttm_bo_driver.h
>>>>>> @@ -177,7 +177,6 @@ struct ttm_mem_type_manager {
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool has_type;
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool use_type;
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint32_t flags;
>>>>>> -=C2=A0=C2=A0=C2=A0 uint64_t gpu_offset; /* GPU address space is i=
ndependent of CPU
>>>>>> word size */
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint64_t size;
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint32_t available_caching;
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint32_t default_caching;
>>>>>>
>>> _______________________________________________
>>> dri-devel mailing list
>>> dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
>>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
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


--2QTwX1RqQT5bd67J6YiyKh3dVgnvqnLoS--

--5odbZ9nBjSpbEGJk3Eu9ZnKJP14fWy4mO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl5MLMcACgkQaA3BHVML
eiNMyAf8CRXNe9aql1MAVwCdSaR9/4hR9LapRxTs2j/wUe55kLexyQ+0cL+yy+uI
hEb8040nUSfLMezCn37xkbRqSsyS8dFmUSg2yJ/o9/1Tk6BZAUwelAFjGWEb+ttv
yowsCV4C7e6jd9Eo8+UepmXP15TGEUFhJ3vrLfIfi2tRbivcVu6BD0tie5WBJOzB
/Ty0eRtvDADEQbXJ9lzU+M0I6M3FVj90WYE/dSc5JvanqjCAbJ6kymmqJ/g8qQZ1
U+f5SM5UTKVDByGqTittRs4iw2Jq9dT5Mb8wNQpJHTL53sxURAiWsFOYmGmSkK12
oTPO51lCj/wzY1gRDkxbB0c9RzzgtQ==
=nFJ7
-----END PGP SIGNATURE-----

--5odbZ9nBjSpbEGJk3Eu9ZnKJP14fWy4mO--

--===============1638770956==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
amd-gfx mailing list
amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--===============1638770956==--
