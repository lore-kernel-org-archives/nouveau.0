From: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 1/2] drm/ttm: Rename ttm_bo_global_{init,release}() to
 ttm_bo_global_ref_{,}()
Date: Tue, 16 Oct 2018 13:01:54 +0200
Message-ID: <ffc03d8b-8b36-1d9a-7910-4635e15f388a@suse.de>
References: <20181016080409.18838-1-tzimmermann@suse.de>
 <20181016080409.18838-2-tzimmermann@suse.de>
 <72d9ad54-af52-55a2-8537-2327fd6f0357@amd.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0858626278=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <72d9ad54-af52-55a2-8537-2327fd6f0357@amd.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: "Koenig, Christian" <Christian.Koenig@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>, "Zhang, Jerry" <Jerry.Zhang@amd.com>, "airlied@linux.ie" <airlied@linux.ie>, "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>, "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>, "maxime.ripard@bootlin.com" <maxime.ripard@bootlin.com>, "sean@poorly.run" <sean@poorly.run>, "Deucher, Alexander" <Alexander.Deucher@amd.com>, "corbet@lwn.net" <corbet@lwn.net>, "Zhou, David(ChunMing)" <David1.Zhou@amd.com>, "kraxel@redhat.com" <kraxel@redhat.com>, "z.liuxinliang@hisilicon.com" <z.liuxinliang@hisilicon.com>, "zourongrong@gmail.com" <zourongrong@gmail.com>, "kong.kongxinwei@hisilicon.com" <kong.kongxinwei@hisilicon.com>, "puck.chen@hisilicon.com" <puck.chen@hisilicon.com>, "bskeggs@redhat.com" <bskeggs@redhat.com>, "linux-graphics-maintainer@vmware.com" <linux-graphics-mai>
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, "virtualization@lists.linux-foundation.org" <virtualization@lists.linux-foundation.org>
List-Id: nouveau.vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0858626278==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="IegJRBBGRrHpbvmI1FQ3HqNl7yqUUx2yn"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--IegJRBBGRrHpbvmI1FQ3HqNl7yqUUx2yn
Content-Type: multipart/mixed; boundary="aqw5qCNun51dt71dkYYqITfSPvJbflam9";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Huang, Ray" <Ray.Huang@amd.com>, "Zhang, Jerry" <Jerry.Zhang@amd.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "maxime.ripard@bootlin.com" <maxime.ripard@bootlin.com>,
 "sean@poorly.run" <sean@poorly.run>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "corbet@lwn.net" <corbet@lwn.net>,
 "Zhou, David(ChunMing)" <David1.Zhou@amd.com>,
 "kraxel@redhat.com" <kraxel@redhat.com>,
 "z.liuxinliang@hisilicon.com" <z.liuxinliang@hisilicon.com>,
 "zourongrong@gmail.com" <zourongrong@gmail.com>,
 "kong.kongxinwei@hisilicon.com" <kong.kongxinwei@hisilicon.com>,
 "puck.chen@hisilicon.com" <puck.chen@hisilicon.com>,
 "bskeggs@redhat.com" <bskeggs@redhat.com>,
 "linux-graphics-maintainer@vmware.com"
 <linux-graphics-maintainer@vmware.com>, "syeh@vmware.com" <syeh@vmware.com>,
 "thellstrom@vmware.com" <thellstrom@vmware.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>
Message-ID: <ffc03d8b-8b36-1d9a-7910-4635e15f388a@suse.de>
Subject: Re: [PATCH 1/2] drm/ttm: Rename ttm_bo_global_{init,release}() to
 ttm_bo_global_ref_{,}()
References: <20181016080409.18838-1-tzimmermann@suse.de>
 <20181016080409.18838-2-tzimmermann@suse.de>
 <72d9ad54-af52-55a2-8537-2327fd6f0357@amd.com>
In-Reply-To: <72d9ad54-af52-55a2-8537-2327fd6f0357@amd.com>

--aqw5qCNun51dt71dkYYqITfSPvJbflam9
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Am 16.10.18 um 12:43 schrieb Koenig, Christian:
> Am 16.10.2018 um 10:04 schrieb Thomas Zimmermann:
>> The functions ttm_bo_global_init() and ttm_bo_global_release() do not
>> receive an argument of type struct ttm_bo_global. Both take a struct
>> drm_global_reference that contains points to a struct ttm_bo_global_re=
f.
>> Renaming them reflects this.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>=20
> Reviewed and pushed upstream.

Thank you!

>=20
> Christian.
>=20
>> ---
>>   Documentation/gpu/drm-mm.rst                | 4 ++--
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c     | 4 ++--
>>   drivers/gpu/drm/ast/ast_ttm.c               | 4 ++--
>>   drivers/gpu/drm/bochs/bochs_mm.c            | 4 ++--
>>   drivers/gpu/drm/cirrus/cirrus_ttm.c         | 4 ++--
>>   drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c | 4 ++--
>>   drivers/gpu/drm/mgag200/mgag200_ttm.c       | 4 ++--
>>   drivers/gpu/drm/nouveau/nouveau_ttm.c       | 4 ++--
>>   drivers/gpu/drm/qxl/qxl_ttm.c               | 4 ++--
>>   drivers/gpu/drm/radeon/radeon_ttm.c         | 4 ++--
>>   drivers/gpu/drm/ttm/ttm_bo.c                | 8 ++++----
>>   drivers/gpu/drm/virtio/virtgpu_ttm.c        | 4 ++--
>>   drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c    | 4 ++--
>>   drivers/staging/vboxvideo/vbox_ttm.c        | 4 ++--
>>   include/drm/ttm/ttm_bo_driver.h             | 4 ++--
>>   15 files changed, 32 insertions(+), 32 deletions(-)
>>
>> diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.r=
st
>> index e725e8449e72..d0f3c6b03200 100644
>> --- a/Documentation/gpu/drm-mm.rst
>> +++ b/Documentation/gpu/drm-mm.rst
>> @@ -72,8 +72,8 @@ object TTM to provide a pool for buffer object alloc=
ation by clients and
>>   the kernel itself. The type of this object should be
>>   TTM_GLOBAL_TTM_BO, and its size should be sizeof(struct
>>   ttm_bo_global). Again, driver-specific init and release functions ma=
y
>> -be provided, likely eventually calling ttm_bo_global_init() and
>> -ttm_bo_global_release(), respectively. Also, like the previous
>> +be provided, likely eventually calling ttm_bo_global_ref_init() and
>> +ttm_bo_global_ref_release(), respectively. Also, like the previous
>>   object, ttm_global_item_ref() is used to create an initial reference=

>>   count for the TTM, which will call your initialization function.
>>  =20
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_ttm.c
>> index a44fc12ae1f9..3a6802846698 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>> @@ -125,8 +125,8 @@ static int amdgpu_ttm_global_init(struct amdgpu_de=
vice *adev)
>>   	global_ref =3D &adev->mman.bo_global_ref.ref;
>>   	global_ref->global_type =3D DRM_GLOBAL_TTM_BO;
>>   	global_ref->size =3D sizeof(struct ttm_bo_global);
>> -	global_ref->init =3D &ttm_bo_global_init;
>> -	global_ref->release =3D &ttm_bo_global_release;
>> +	global_ref->init =3D &ttm_bo_global_ref_init;
>> +	global_ref->release =3D &ttm_bo_global_ref_release;
>>   	r =3D drm_global_item_ref(global_ref);
>>   	if (r) {
>>   		DRM_ERROR("Failed setting up TTM BO subsystem.\n");
>> diff --git a/drivers/gpu/drm/ast/ast_ttm.c b/drivers/gpu/drm/ast/ast_t=
tm.c
>> index fe354ebf374d..d21fbd26785a 100644
>> --- a/drivers/gpu/drm/ast/ast_ttm.c
>> +++ b/drivers/gpu/drm/ast/ast_ttm.c
>> @@ -70,8 +70,8 @@ static int ast_ttm_global_init(struct ast_private *a=
st)
>>   	global_ref =3D &ast->ttm.bo_global_ref.ref;
>>   	global_ref->global_type =3D DRM_GLOBAL_TTM_BO;
>>   	global_ref->size =3D sizeof(struct ttm_bo_global);
>> -	global_ref->init =3D &ttm_bo_global_init;
>> -	global_ref->release =3D &ttm_bo_global_release;
>> +	global_ref->init =3D &ttm_bo_global_ref_init;
>> +	global_ref->release =3D &ttm_bo_global_ref_release;
>>   	r =3D drm_global_item_ref(global_ref);
>>   	if (r !=3D 0) {
>>   		DRM_ERROR("Failed setting up TTM BO subsystem.\n");
>> diff --git a/drivers/gpu/drm/bochs/bochs_mm.c b/drivers/gpu/drm/bochs/=
bochs_mm.c
>> index e6ccf7fa92d4..ff4f41dec228 100644
>> --- a/drivers/gpu/drm/bochs/bochs_mm.c
>> +++ b/drivers/gpu/drm/bochs/bochs_mm.c
>> @@ -48,8 +48,8 @@ static int bochs_ttm_global_init(struct bochs_device=
 *bochs)
>>   	global_ref =3D &bochs->ttm.bo_global_ref.ref;
>>   	global_ref->global_type =3D DRM_GLOBAL_TTM_BO;
>>   	global_ref->size =3D sizeof(struct ttm_bo_global);
>> -	global_ref->init =3D &ttm_bo_global_init;
>> -	global_ref->release =3D &ttm_bo_global_release;
>> +	global_ref->init =3D &ttm_bo_global_ref_init;
>> +	global_ref->release =3D &ttm_bo_global_ref_release;
>>   	r =3D drm_global_item_ref(global_ref);
>>   	if (r !=3D 0) {
>>   		DRM_ERROR("Failed setting up TTM BO subsystem.\n");
>> diff --git a/drivers/gpu/drm/cirrus/cirrus_ttm.c b/drivers/gpu/drm/cir=
rus/cirrus_ttm.c
>> index f21953243790..2e2141f26c5b 100644
>> --- a/drivers/gpu/drm/cirrus/cirrus_ttm.c
>> +++ b/drivers/gpu/drm/cirrus/cirrus_ttm.c
>> @@ -70,8 +70,8 @@ static int cirrus_ttm_global_init(struct cirrus_devi=
ce *cirrus)
>>   	global_ref =3D &cirrus->ttm.bo_global_ref.ref;
>>   	global_ref->global_type =3D DRM_GLOBAL_TTM_BO;
>>   	global_ref->size =3D sizeof(struct ttm_bo_global);
>> -	global_ref->init =3D &ttm_bo_global_init;
>> -	global_ref->release =3D &ttm_bo_global_release;
>> +	global_ref->init =3D &ttm_bo_global_ref_init;
>> +	global_ref->release =3D &ttm_bo_global_ref_release;
>>   	r =3D drm_global_item_ref(global_ref);
>>   	if (r !=3D 0) {
>>   		DRM_ERROR("Failed setting up TTM BO subsystem.\n");
>> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c b/drivers/gpu=
/drm/hisilicon/hibmc/hibmc_ttm.c
>> index 2e3e0bdb8932..0454aa43ffc6 100644
>> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c
>> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c
>> @@ -59,8 +59,8 @@ static int hibmc_ttm_global_init(struct hibmc_drm_pr=
ivate *hibmc)
>>   		hibmc->mem_global_ref.object;
>>   	hibmc->bo_global_ref.ref.global_type =3D DRM_GLOBAL_TTM_BO;
>>   	hibmc->bo_global_ref.ref.size =3D sizeof(struct ttm_bo_global);
>> -	hibmc->bo_global_ref.ref.init =3D &ttm_bo_global_init;
>> -	hibmc->bo_global_ref.ref.release =3D &ttm_bo_global_release;
>> +	hibmc->bo_global_ref.ref.init =3D &ttm_bo_global_ref_init;
>> +	hibmc->bo_global_ref.ref.release =3D &ttm_bo_global_ref_release;
>>   	ret =3D drm_global_item_ref(&hibmc->bo_global_ref.ref);
>>   	if (ret) {
>>   		DRM_ERROR("failed setting up TTM BO subsystem: %d\n", ret);
>> diff --git a/drivers/gpu/drm/mgag200/mgag200_ttm.c b/drivers/gpu/drm/m=
gag200/mgag200_ttm.c
>> index 05570f0de4d7..3444b539e7f4 100644
>> --- a/drivers/gpu/drm/mgag200/mgag200_ttm.c
>> +++ b/drivers/gpu/drm/mgag200/mgag200_ttm.c
>> @@ -70,8 +70,8 @@ static int mgag200_ttm_global_init(struct mga_device=
 *ast)
>>   	global_ref =3D &ast->ttm.bo_global_ref.ref;
>>   	global_ref->global_type =3D DRM_GLOBAL_TTM_BO;
>>   	global_ref->size =3D sizeof(struct ttm_bo_global);
>> -	global_ref->init =3D &ttm_bo_global_init;
>> -	global_ref->release =3D &ttm_bo_global_release;
>> +	global_ref->init =3D &ttm_bo_global_ref_init;
>> +	global_ref->release =3D &ttm_bo_global_ref_release;
>>   	r =3D drm_global_item_ref(global_ref);
>>   	if (r !=3D 0) {
>>   		DRM_ERROR("Failed setting up TTM BO subsystem.\n");
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_ttm.c b/drivers/gpu/drm/n=
ouveau/nouveau_ttm.c
>> index 8edb9f2a4269..a293383c8654 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_ttm.c
>> +++ b/drivers/gpu/drm/nouveau/nouveau_ttm.c
>> @@ -209,8 +209,8 @@ nouveau_ttm_global_init(struct nouveau_drm *drm)
>>   	global_ref =3D &drm->ttm.bo_global_ref.ref;
>>   	global_ref->global_type =3D DRM_GLOBAL_TTM_BO;
>>   	global_ref->size =3D sizeof(struct ttm_bo_global);
>> -	global_ref->init =3D &ttm_bo_global_init;
>> -	global_ref->release =3D &ttm_bo_global_release;
>> +	global_ref->init =3D &ttm_bo_global_ref_init;
>> +	global_ref->release =3D &ttm_bo_global_ref_release;
>>  =20
>>   	ret =3D drm_global_item_ref(global_ref);
>>   	if (unlikely(ret !=3D 0)) {
>> diff --git a/drivers/gpu/drm/qxl/qxl_ttm.c b/drivers/gpu/drm/qxl/qxl_t=
tm.c
>> index 86a1fb32f6db..db2a0036e9c4 100644
>> --- a/drivers/gpu/drm/qxl/qxl_ttm.c
>> +++ b/drivers/gpu/drm/qxl/qxl_ttm.c
>> @@ -80,8 +80,8 @@ static int qxl_ttm_global_init(struct qxl_device *qd=
ev)
>>   	global_ref =3D &qdev->mman.bo_global_ref.ref;
>>   	global_ref->global_type =3D DRM_GLOBAL_TTM_BO;
>>   	global_ref->size =3D sizeof(struct ttm_bo_global);
>> -	global_ref->init =3D &ttm_bo_global_init;
>> -	global_ref->release =3D &ttm_bo_global_release;
>> +	global_ref->init =3D &ttm_bo_global_ref_init;
>> +	global_ref->release =3D &ttm_bo_global_ref_release;
>>   	r =3D drm_global_item_ref(global_ref);
>>   	if (r !=3D 0) {
>>   		DRM_ERROR("Failed setting up TTM BO subsystem.\n");
>> diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/rad=
eon/radeon_ttm.c
>> index cbb67e9ffb3a..dac4ec5a120b 100644
>> --- a/drivers/gpu/drm/radeon/radeon_ttm.c
>> +++ b/drivers/gpu/drm/radeon/radeon_ttm.c
>> @@ -97,8 +97,8 @@ static int radeon_ttm_global_init(struct radeon_devi=
ce *rdev)
>>   	global_ref =3D &rdev->mman.bo_global_ref.ref;
>>   	global_ref->global_type =3D DRM_GLOBAL_TTM_BO;
>>   	global_ref->size =3D sizeof(struct ttm_bo_global);
>> -	global_ref->init =3D &ttm_bo_global_init;
>> -	global_ref->release =3D &ttm_bo_global_release;
>> +	global_ref->init =3D &ttm_bo_global_ref_init;
>> +	global_ref->release =3D &ttm_bo_global_ref_release;
>>   	r =3D drm_global_item_ref(global_ref);
>>   	if (r !=3D 0) {
>>   		DRM_ERROR("Failed setting up TTM BO subsystem.\n");
>> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo=
=2Ec
>> index 26b889f86670..9c2bb880491e 100644
>> --- a/drivers/gpu/drm/ttm/ttm_bo.c
>> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
>> @@ -1522,16 +1522,16 @@ static void ttm_bo_global_kobj_release(struct =
kobject *kobj)
>>   	kfree(glob);
>>   }
>>  =20
>> -void ttm_bo_global_release(struct drm_global_reference *ref)
>> +void ttm_bo_global_ref_release(struct drm_global_reference *ref)
>>   {
>>   	struct ttm_bo_global *glob =3D ref->object;
>>  =20
>>   	kobject_del(&glob->kobj);
>>   	kobject_put(&glob->kobj);
>>   }
>> -EXPORT_SYMBOL(ttm_bo_global_release);
>> +EXPORT_SYMBOL(ttm_bo_global_ref_release);
>>  =20
>> -int ttm_bo_global_init(struct drm_global_reference *ref)
>> +int ttm_bo_global_ref_init(struct drm_global_reference *ref)
>>   {
>>   	struct ttm_bo_global_ref *bo_ref =3D
>>   		container_of(ref, struct ttm_bo_global_ref, ref);
>> @@ -1564,7 +1564,7 @@ int ttm_bo_global_init(struct drm_global_referen=
ce *ref)
>>   	kfree(glob);
>>   	return ret;
>>   }
>> -EXPORT_SYMBOL(ttm_bo_global_init);
>> +EXPORT_SYMBOL(ttm_bo_global_ref_init);
>>  =20
>>  =20
>>   int ttm_bo_device_release(struct ttm_bo_device *bdev)
>> diff --git a/drivers/gpu/drm/virtio/virtgpu_ttm.c b/drivers/gpu/drm/vi=
rtio/virtgpu_ttm.c
>> index e3152d45c5f1..526a5e48dc3b 100644
>> --- a/drivers/gpu/drm/virtio/virtgpu_ttm.c
>> +++ b/drivers/gpu/drm/virtio/virtgpu_ttm.c
>> @@ -84,8 +84,8 @@ static int virtio_gpu_ttm_global_init(struct virtio_=
gpu_device *vgdev)
>>   	global_ref =3D &vgdev->mman.bo_global_ref.ref;
>>   	global_ref->global_type =3D DRM_GLOBAL_TTM_BO;
>>   	global_ref->size =3D sizeof(struct ttm_bo_global);
>> -	global_ref->init =3D &ttm_bo_global_init;
>> -	global_ref->release =3D &ttm_bo_global_release;
>> +	global_ref->init =3D &ttm_bo_global_ref_init;
>> +	global_ref->release =3D &ttm_bo_global_ref_release;
>>   	r =3D drm_global_item_ref(global_ref);
>>   	if (r !=3D 0) {
>>   		DRM_ERROR("Failed setting up TTM BO subsystem.\n");
>> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c b/drivers/gpu/dr=
m/vmwgfx/vmwgfx_ttm_glue.c
>> index 7b1e5a5cbd2c..f3ce43c41978 100644
>> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c
>> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c
>> @@ -76,8 +76,8 @@ int vmw_ttm_global_init(struct vmw_private *dev_priv=
)
>>   	global_ref =3D &dev_priv->bo_global_ref.ref;
>>   	global_ref->global_type =3D DRM_GLOBAL_TTM_BO;
>>   	global_ref->size =3D sizeof(struct ttm_bo_global);
>> -	global_ref->init =3D &ttm_bo_global_init;
>> -	global_ref->release =3D &ttm_bo_global_release;
>> +	global_ref->init =3D &ttm_bo_global_ref_init;
>> +	global_ref->release =3D &ttm_bo_global_ref_release;
>>   	ret =3D drm_global_item_ref(global_ref);
>>  =20
>>   	if (unlikely(ret !=3D 0)) {
>> diff --git a/drivers/staging/vboxvideo/vbox_ttm.c b/drivers/staging/vb=
oxvideo/vbox_ttm.c
>> index 548edb7c494b..2329a55d4636 100644
>> --- a/drivers/staging/vboxvideo/vbox_ttm.c
>> +++ b/drivers/staging/vboxvideo/vbox_ttm.c
>> @@ -68,8 +68,8 @@ static int vbox_ttm_global_init(struct vbox_private =
*vbox)
>>   	global_ref =3D &vbox->ttm.bo_global_ref.ref;
>>   	global_ref->global_type =3D DRM_GLOBAL_TTM_BO;
>>   	global_ref->size =3D sizeof(struct ttm_bo_global);
>> -	global_ref->init =3D &ttm_bo_global_init;
>> -	global_ref->release =3D &ttm_bo_global_release;
>> +	global_ref->init =3D &ttm_bo_global_ref_init;
>> +	global_ref->release =3D &ttm_bo_global_ref_release;
>>  =20
>>   	ret =3D drm_global_item_ref(global_ref);
>>   	if (ret) {
>> diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo_=
driver.h
>> index e4fee8e02559..c3c0751dec63 100644
>> --- a/include/drm/ttm/ttm_bo_driver.h
>> +++ b/include/drm/ttm/ttm_bo_driver.h
>> @@ -578,8 +578,8 @@ void ttm_bo_mem_put(struct ttm_buffer_object *bo, =
struct ttm_mem_reg *mem);
>>   void ttm_bo_mem_put_locked(struct ttm_buffer_object *bo,
>>   			   struct ttm_mem_reg *mem);
>>  =20
>> -void ttm_bo_global_release(struct drm_global_reference *ref);
>> -int ttm_bo_global_init(struct drm_global_reference *ref);
>> +void ttm_bo_global_ref_release(struct drm_global_reference *ref);
>> +int ttm_bo_global_ref_init(struct drm_global_reference *ref);
>>  =20
>>   int ttm_bo_device_release(struct ttm_bo_device *bdev);
>>  =20
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Linux GmbH, Maxfeldstr. 5, D-90409 N=C3=BCrnberg
Tel: +49-911-74053-0; Fax: +49-911-7417755;  https://www.suse.com/
SUSE Linux GmbH, GF: Felix Imend=C3=B6rffer, Jane Smithard,
Graham Norton, HRB 21284 (AG N=C3=BCrnberg)


--aqw5qCNun51dt71dkYYqITfSPvJbflam9--

--IegJRBBGRrHpbvmI1FQ3HqNl7yqUUx2yn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAlvFxSIACgkQaA3BHVML
eiMKvAf/Zq4Lm0GEOaHfWU+wpo0I7iKtWkVoTJt+L96PYhEH+VkK503iUWKeVmuG
NogWJLcAlIzVbj3amj8zehE8kt4cUY8gS+gaZcr+oZbSrq/oOLFV+gmkWxhWiXnW
PtaD+pfhT8EPLRO1WNSz0KGAtH+SB2mQypyq+AjcnXCXm0Bpt395JJlK9ea6D6Yl
qxg3H5XcV3o0ZD6JokOQdXla6pqdHvpo+x6Uc4u2aY6auuVranKHqUXO67rgMDYC
BaRGRi2mdnTUn2fBPB7swLUMhmZmE/LVxuZ5RPNJ46Dx4/6xDuTK3z2fOi5Q1VRy
0wOHAf2wK8jM42Z9xLJ1I4/up4iP9g==
=lBYT
-----END PGP SIGNATURE-----

--IegJRBBGRrHpbvmI1FQ3HqNl7yqUUx2yn--

--===============0858626278==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0858626278==--
