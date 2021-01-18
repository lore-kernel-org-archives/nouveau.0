From: Thomas Zimmermann <tzimmermann-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH v3 2/8] drm/amdgpu: Remove references to struct
 drm_device.pdev
Date: Mon, 18 Jan 2021 16:02:38 +0100
Message-ID: <14e515eb-a79c-aafe-c202-0b44d8806181@suse.de>
References: <20210107080748.4768-1-tzimmermann@suse.de>
 <20210107080748.4768-3-tzimmermann@suse.de>
 <324f0bd9-7430-f42e-1170-4dbfc06ea904@amd.com>
 <5ce5f636-d428-c611-9db1-3172de2d56d2@suse.de>
 <CAKMK7uEwEvrTf2f3B1WsvaDaQg6o7ubXDNUhcX7eAd8vC05n-A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1157582765=="
Return-path: <amd-gfx-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAKMK7uEwEvrTf2f3B1WsvaDaQg6o7ubXDNUhcX7eAd8vC05n-A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:amd-gfx-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: amd-gfx-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "amd-gfx" <amd-gfx-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
Cc: intel-gvt-dev <intel-gvt-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, amd-gfx list <amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Dave Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Nouveau Dev <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, intel-gfx <intel-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Joonas Lahtinen <joonas.lahtinen-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, "Nikula,
 Jani" <jani.nikula-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Rodrigo Vivi <rodrigo.vivi-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Alex Deucher <alexander.deucher-5C7GfCeVMHo@public.gmane.org>, Sam Ravnborg <sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>, =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig-5C7GfCeVMHo@public.gmane.org>
List-Id: nouveau.vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1157582765==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="tdaG8xLM35UnWXdEbHGff0AxZRCvF7LCW"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--tdaG8xLM35UnWXdEbHGff0AxZRCvF7LCW
Content-Type: multipart/mixed; boundary="6YRCgSLfAwvdnVfl44dcGV93uAEaf6okD";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann-l3A5Bk7waGM@public.gmane.org>
To: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
Cc: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig-5C7GfCeVMHo@public.gmane.org>,
 Dave Airlie <airlied-cv59FeDIM0c@public.gmane.org>, "Nikula, Jani"
 <jani.nikula-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>,
 Joonas Lahtinen <joonas.lahtinen-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>,
 Rodrigo Vivi <rodrigo.vivi-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Sam Ravnborg <sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>,
 Nouveau Dev <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>,
 intel-gfx <intel-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>,
 dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>,
 amd-gfx list <amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>,
 Alex Deucher <alexander.deucher-5C7GfCeVMHo@public.gmane.org>,
 intel-gvt-dev <intel-gvt-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Message-ID: <14e515eb-a79c-aafe-c202-0b44d8806181-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH v3 2/8] drm/amdgpu: Remove references to struct
 drm_device.pdev
References: <20210107080748.4768-1-tzimmermann-l3A5Bk7waGM@public.gmane.org>
 <20210107080748.4768-3-tzimmermann-l3A5Bk7waGM@public.gmane.org>
 <324f0bd9-7430-f42e-1170-4dbfc06ea904-5C7GfCeVMHo@public.gmane.org>
 <5ce5f636-d428-c611-9db1-3172de2d56d2-l3A5Bk7waGM@public.gmane.org>
 <CAKMK7uEwEvrTf2f3B1WsvaDaQg6o7ubXDNUhcX7eAd8vC05n-A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
In-Reply-To: <CAKMK7uEwEvrTf2f3B1WsvaDaQg6o7ubXDNUhcX7eAd8vC05n-A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>

--6YRCgSLfAwvdnVfl44dcGV93uAEaf6okD
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 18.01.21 um 15:56 schrieb Daniel Vetter:
> On Mon, Jan 18, 2021 at 3:40 PM Thomas Zimmermann <tzimmermann-l3A5Bk7waGM@public.gmane.org>=
 wrote:
>>
>> Hi
>>
>> Am 18.01.21 um 14:50 schrieb Christian K=C3=B6nig:
>>> Hi Thomas,
>>>
>>> this patch unfortunately completely broke amdgpu.
>>>
>>> See the splat below:
>>>
>>> [   74.553881]
>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>> [   74.554060] BUG: KASAN: null-ptr-deref in
>>> drm_pci_set_busid+0x38/0x100 [drm]
>>> [   74.554393] Read of size 4 at addr 0000000000000038 by task Xorg/1=
115
>>>
>>> [   74.554585] CPU: 6 PID: 1115 Comm: Xorg Not tainted 5.11.0-rc2+ #7=
5
>>> [   74.554594] Hardware name: System manufacturer System Product
>>> Name/PRIME X399-A, BIOS 0808 10/12/2018
>>> [   74.554600] Call Trace:
>>> [   74.554605]  dump_stack+0x9d/0xce
>>> [   74.554616]  ? drm_pci_set_busid+0x38/0x100 [drm]
>>> [   74.554787]  kasan_report.cold+0x5d/0xd1
>>> [   74.554799]  ? drm_pci_set_busid+0x38/0x100 [drm]
>>> [   74.554969]  __asan_load4+0x6b/0x90
>>> [   74.554978]  drm_pci_set_busid+0x38/0x100 [drm]
>>> [   74.555148]  drm_setversion+0x2ce/0x350 [drm]
>>> [   74.555315]  ? drm_is_current_master+0x5d/0x70 [drm]
>>> [   74.555481]  drm_ioctl_kernel+0x16d/0x1c0 [drm]
>>> [   74.555648]  ? drm_ioctl_permit+0xb0/0xb0 [drm]
>>> [   74.555811]  ? drm_setversion+0x350/0x350 [drm]
>>> [   74.555973]  ? check_stack_object+0x2d/0xb0
>>> [   74.555985]  drm_ioctl+0x363/0x5a0 [drm]
>>> [   74.556147]  ? drm_ioctl_permit+0xb0/0xb0 [drm]
>>> [   74.556310]  ? drm_ioctl_kernel+0x1c0/0x1c0 [drm]
>>> [   74.556473]  ? __kasan_check_write+0x14/0x20
>>> [   74.556481]  ? _raw_spin_lock_irqsave+0x8e/0xf0
>>> [   74.556492]  ? _raw_spin_trylock_bh+0x100/0x100
>>> [   74.556504]  amdgpu_drm_ioctl+0x7e/0xd0 [amdgpu]
>>> [   74.557409]  __x64_sys_ioctl+0xc3/0x100
>>> [   74.557418]  do_syscall_64+0x38/0x90
>>> [   74.557427]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
>>>
>>> Any idea what's going wrong here?
>>
>> I meanwhile posted an updated patchset with a fix in patch 1. [1] Mayb=
e
>> you can apply this one and test.
>>
>> The original bug report and testing is at [2]. Apparently, DRM core ha=
s
>> to be changed together with drivers. I'm honestly not sure why.
>=20
> Same thing Chris pointed out on the i915 patch: If drivers stop
> setting drm->pdev, but core still uses it, we have booms. So that
> patch 1 needs to land asap I think.

Yep. But somehow my impression was that the DRM core also sets pdev=20
internally in drm_get_pci_dev(). But looking at it now, that code is=20
only used by legacy drivers. :/

Best regards
Thomas

> -Daniel
>=20
>>
>> Best regards
>> Thomas
>>
>> [1]
>> https://lore.kernel.org/dri-devel/20210118131420.15874-1-tzimmermann@s=
use.de/T/#m8a0cdf02375a4e23e194d2e7eb80e8738632ea84
>> [2]
>> https://lore.kernel.org/dri-devel/7851c78c-8c57-3c84-cd49-a72703095a5d=
@suse.de/
>>
>>>
>>> Thanks in advance,
>>> Christian.
>>>
>>> Am 07.01.21 um 09:07 schrieb Thomas Zimmermann:
>>>> Using struct drm_device.pdev is deprecated. Convert amdgpu to struct=

>>>> drm_device.dev. No functional changes.
>>>>
>>>> v3:
>>>>      * rebased
>>>>
>>>> Signed-off-by: Thomas Zimmermann <tzimmermann-l3A5Bk7waGM@public.gmane.org>
>>>> Acked-by: Christian K=C3=B6nig <christian.koenig-5C7GfCeVMHo@public.gmane.org>
>>>> Acked-by: Alex Deucher <alexander.deucher-5C7GfCeVMHo@public.gmane.org>
>>>> Acked-by: Sam Ravnborg <sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>
>>>> Cc: Alex Deucher <alexander.deucher-5C7GfCeVMHo@public.gmane.org>
>>>> Cc: Christian K=C3=B6nig <christian.koenig-5C7GfCeVMHo@public.gmane.org>
>>>> ---
>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_device.c  | 17 ++++++++--------=
-
>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_display.c |  1 +
>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c     |  1 -
>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c      |  2 +-
>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c     | 10 +++++-----
>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c     |  2 +-
>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c     | 10 +++++-----
>>>>    7 files changed, 21 insertions(+), 22 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>> index 7d16395ede0a..f7e2a878411e 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>> @@ -1423,9 +1423,9 @@ static void amdgpu_switcheroo_set_state(struct=

>>>> pci_dev *pdev,
>>>>            /* don't suspend or resume card normally */
>>>>            dev->switch_power_state =3D DRM_SWITCH_POWER_CHANGING;
>>>> -        pci_set_power_state(dev->pdev, PCI_D0);
>>>> -        amdgpu_device_load_pci_state(dev->pdev);
>>>> -        r =3D pci_enable_device(dev->pdev);
>>>> +        pci_set_power_state(pdev, PCI_D0);
>>>> +        amdgpu_device_load_pci_state(pdev);
>>>> +        r =3D pci_enable_device(pdev);
>>>>            if (r)
>>>>                DRM_WARN("pci_enable_device failed (%d)\n", r);
>>>>            amdgpu_device_resume(dev, true);
>>>> @@ -1437,10 +1437,10 @@ static void amdgpu_switcheroo_set_state(stru=
ct
>>>> pci_dev *pdev,
>>>>            drm_kms_helper_poll_disable(dev);
>>>>            dev->switch_power_state =3D DRM_SWITCH_POWER_CHANGING;
>>>>            amdgpu_device_suspend(dev, true);
>>>> -        amdgpu_device_cache_pci_state(dev->pdev);
>>>> +        amdgpu_device_cache_pci_state(pdev);
>>>>            /* Shut down the device */
>>>> -        pci_disable_device(dev->pdev);
>>>> -        pci_set_power_state(dev->pdev, PCI_D3cold);
>>>> +        pci_disable_device(pdev);
>>>> +        pci_set_power_state(pdev, PCI_D3cold);
>>>>            dev->switch_power_state =3D DRM_SWITCH_POWER_OFF;
>>>>        }
>>>>    }
>>>> @@ -1703,8 +1703,7 @@ static void
>>>> amdgpu_device_enable_virtual_display(struct amdgpu_device *adev)
>>>>        adev->enable_virtual_display =3D false;
>>>>        if (amdgpu_virtual_display) {
>>>> -        struct drm_device *ddev =3D adev_to_drm(adev);
>>>> -        const char *pci_address_name =3D pci_name(ddev->pdev);
>>>> +        const char *pci_address_name =3D pci_name(adev->pdev);
>>>>            char *pciaddstr, *pciaddstr_tmp, *pciaddname_tmp, *pciadd=
name;
>>>>            pciaddstr =3D kstrdup(amdgpu_virtual_display, GFP_KERNEL)=
;
>>>> @@ -3397,7 +3396,7 @@ int amdgpu_device_init(struct amdgpu_device *a=
dev,
>>>>            }
>>>>        }
>>>> -    pci_enable_pcie_error_reporting(adev->ddev.pdev);
>>>> +    pci_enable_pcie_error_reporting(adev->pdev);
>>>>        /* Post card if necessary */
>>>>        if (amdgpu_device_need_post(adev)) {
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
>>>> index f764803c53a4..0150a51b65ef 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
>>>> @@ -926,6 +926,7 @@ amdgpu_display_user_framebuffer_create(struct
>>>> drm_device *dev,
>>>>                           struct drm_file *file_priv,
>>>>                           const struct drm_mode_fb_cmd2 *mode_cmd)
>>>>    {
>>>> +    struct amdgpu_device *adev =3D drm_to_adev(dev);
>>>>        struct drm_gem_object *obj;
>>>>        struct amdgpu_framebuffer *amdgpu_fb;
>>>>        int ret;
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>>> index 72efd579ec5e..b4ea67e12ada 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>>> @@ -1204,7 +1204,6 @@ static int amdgpu_pci_probe(struct pci_dev *pd=
ev,
>>>>        if (ret)
>>>>            return ret;
>>>> -    ddev->pdev =3D pdev;
>>>>        pci_set_drvdata(pdev, ddev);
>>>>        ret =3D amdgpu_driver_load_kms(adev, ent->driver_data);
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c
>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c
>>>> index 0bf7d36c6686..51cd49c6f38f 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c
>>>> @@ -271,7 +271,7 @@ static int amdgpufb_create(struct drm_fb_helper
>>>> *helper,
>>>>        DRM_INFO("fb depth is %d\n", fb->format->depth);
>>>>        DRM_INFO("   pitch is %d\n", fb->pitches[0]);
>>>> -    vga_switcheroo_client_fb_set(adev_to_drm(adev)->pdev, info);
>>>> +    vga_switcheroo_client_fb_set(adev->pdev, info);
>>>>        return 0;
>>>>    out:
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>>>> index d0a1fee1f5f6..a5c42c3004a0 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>>>> @@ -619,7 +619,7 @@ int amdgpu_gem_va_ioctl(struct drm_device *dev,
>>>> void *data,
>>>>        int r =3D 0;
>>>>        if (args->va_address < AMDGPU_VA_RESERVED_SIZE) {
>>>> -        dev_dbg(&dev->pdev->dev,
>>>> +        dev_dbg(dev->dev,
>>>>                "va_address 0x%LX is in reserved area 0x%LX\n",
>>>>                args->va_address, AMDGPU_VA_RESERVED_SIZE);
>>>>            return -EINVAL;
>>>> @@ -627,7 +627,7 @@ int amdgpu_gem_va_ioctl(struct drm_device *dev,
>>>> void *data,
>>>>        if (args->va_address >=3D AMDGPU_GMC_HOLE_START &&
>>>>            args->va_address < AMDGPU_GMC_HOLE_END) {
>>>> -        dev_dbg(&dev->pdev->dev,
>>>> +        dev_dbg(dev->dev,
>>>>                "va_address 0x%LX is in VA hole 0x%LX-0x%LX\n",
>>>>                args->va_address, AMDGPU_GMC_HOLE_START,
>>>>                AMDGPU_GMC_HOLE_END);
>>>> @@ -639,14 +639,14 @@ int amdgpu_gem_va_ioctl(struct drm_device *dev=
,
>>>> void *data,
>>>>        vm_size =3D adev->vm_manager.max_pfn * AMDGPU_GPU_PAGE_SIZE;
>>>>        vm_size -=3D AMDGPU_VA_RESERVED_SIZE;
>>>>        if (args->va_address + args->map_size > vm_size) {
>>>> -        dev_dbg(&dev->pdev->dev,
>>>> +        dev_dbg(dev->dev,
>>>>                "va_address 0x%llx is in top reserved area 0x%llx\n",=

>>>>                args->va_address + args->map_size, vm_size);
>>>>            return -EINVAL;
>>>>        }
>>>>        if ((args->flags & ~valid_flags) && (args->flags & ~prt_flags=
)) {
>>>> -        dev_dbg(&dev->pdev->dev, "invalid flags combination 0x%08X\=
n",
>>>> +        dev_dbg(dev->dev, "invalid flags combination 0x%08X\n",
>>>>                args->flags);
>>>>            return -EINVAL;
>>>>        }
>>>> @@ -658,7 +658,7 @@ int amdgpu_gem_va_ioctl(struct drm_device *dev,
>>>> void *data,
>>>>        case AMDGPU_VA_OP_REPLACE:
>>>>            break;
>>>>        default:
>>>> -        dev_dbg(&dev->pdev->dev, "unsupported operation %d\n",
>>>> +        dev_dbg(dev->dev, "unsupported operation %d\n",
>>>>                args->operation);
>>>>            return -EINVAL;
>>>>        }
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c
>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c
>>>> index 47cad23a6b9e..bca4dddd5a15 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c
>>>> @@ -176,7 +176,7 @@ struct amdgpu_i2c_chan *amdgpu_i2c_create(struct=

>>>> drm_device *dev,
>>>>        i2c->rec =3D *rec;
>>>>        i2c->adapter.owner =3D THIS_MODULE;
>>>>        i2c->adapter.class =3D I2C_CLASS_DDC;
>>>> -    i2c->adapter.dev.parent =3D &dev->pdev->dev;
>>>> +    i2c->adapter.dev.parent =3D dev->dev;
>>>>        i2c->dev =3D dev;
>>>>        i2c_set_adapdata(&i2c->adapter, i2c);
>>>>        mutex_init(&i2c->mutex);
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
>>>> index b16b32797624..3c37cf1ae8b7 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
>>>> @@ -142,7 +142,7 @@ int amdgpu_driver_load_kms(struct amdgpu_device
>>>> *adev, unsigned long flags)
>>>>            (amdgpu_is_atpx_hybrid() ||
>>>>             amdgpu_has_atpx_dgpu_power_cntl()) &&
>>>>            ((flags & AMD_IS_APU) =3D=3D 0) &&
>>>> -        !pci_is_thunderbolt_attached(dev->pdev))
>>>> +        !pci_is_thunderbolt_attached(to_pci_dev(dev->dev)))
>>>>            flags |=3D AMD_IS_PX;
>>>>        parent =3D pci_upstream_bridge(adev->pdev);
>>>> @@ -156,7 +156,7 @@ int amdgpu_driver_load_kms(struct amdgpu_device
>>>> *adev, unsigned long flags)
>>>>         */
>>>>        r =3D amdgpu_device_init(adev, flags);
>>>>        if (r) {
>>>> -        dev_err(&dev->pdev->dev, "Fatal error during GPU init\n");
>>>> +        dev_err(dev->dev, "Fatal error during GPU init\n");
>>>>            goto out;
>>>>        }
>>>> @@ -199,7 +199,7 @@ int amdgpu_driver_load_kms(struct amdgpu_device
>>>> *adev, unsigned long flags)
>>>>        acpi_status =3D amdgpu_acpi_init(adev);
>>>>        if (acpi_status)
>>>> -        dev_dbg(&dev->pdev->dev, "Error during ACPI methods call\n"=
);
>>>> +        dev_dbg(dev->dev, "Error during ACPI methods call\n");
>>>>        if (adev->runpm) {
>>>>            /* only need to skip on ATPX */
>>>> @@ -735,10 +735,10 @@ int amdgpu_info_ioctl(struct drm_device *dev,
>>>> void *data, struct drm_file *filp)
>>>>            if (!dev_info)
>>>>                return -ENOMEM;
>>>> -        dev_info->device_id =3D dev->pdev->device;
>>>> +        dev_info->device_id =3D adev->pdev->device;
>>>>            dev_info->chip_rev =3D adev->rev_id;
>>>>            dev_info->external_rev =3D adev->external_rev_id;
>>>> -        dev_info->pci_rev =3D dev->pdev->revision;
>>>> +        dev_info->pci_rev =3D adev->pdev->revision;
>>>>            dev_info->family =3D adev->family;
>>>>            dev_info->num_shader_engines =3D
>>>> adev->gfx.config.max_shader_engines;
>>>>            dev_info->num_shader_arrays_per_engine =3D
>>>> adev->gfx.config.max_sh_per_se;
>>>
>>> _______________________________________________
>>> dri-devel mailing list
>>> dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
>>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>>
>> --
>> Thomas Zimmermann
>> Graphics Driver Developer
>> SUSE Software Solutions Germany GmbH
>> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
>> (HRB 36809, AG N=C3=BCrnberg)
>> Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer
>>
>=20
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--6YRCgSLfAwvdnVfl44dcGV93uAEaf6okD--

--tdaG8xLM35UnWXdEbHGff0AxZRCvF7LCW
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmAFow4FAwAAAAAACgkQlh/E3EQov+Be
Uw//YywJiU2NfSkDu6wvQnLdCAi4YGNld3p4pq/oY8eRMjOb8DDGt7kCJdoaahUJkBG3+9GkwzFn
31qsdLOGQjDNYSXpwDz/T/h1dEe3Mys52HrzzL1ofCOqGHlVNWEveQPcxBqHRjJX/cLCJ3oGC0xo
RqYDTN4g0HGdOZ/z/TI0FCQpztDJNZmailQNK733Nypa3yT67IXtY0oy28UdMcKizmHd0GrLjI+Z
2NnBBcwt+8i2tWYVG85ZGr51xMWY9aMIitb7lk69zMKeWhV1Fyp92GRa19ZyI8BMI7zmjHz0rhW5
LzIYqsWT36DvekBIMan5c6SKv3n/lzoY59Ci5Us2K6ut3aGHw4Q+M8/KkVzUZbLgR2ONzphAZ0n/
dnBejgvJ4fk7DGv4msbUCz6FCWdbV2gwHPb9N7UIaC9awG9xbeTtU3pyw/1UlvLIeV7LCrKZyKwa
hV35a/FBWsuSLcyGAbM+V4SIC9vOOrOhLJ62LuB+/k5QpMx/43pIcw/6cGyqkcHkQyqSaJyKP9N6
X0zd9Is9Rcda98O7Ok2dudmZ8i1rEhypkctxU/rjBmODopsRSBzwTmIKzzDWx8puXDjXemPbA7dk
GpBqWuA9sMXrCfum9ntLGWcQKd8ryUdA8AIl+kpaOFANYl3qFvyVsroI0PBN+Fn/xK2skcKY4CrD
3RA=
=ubJb
-----END PGP SIGNATURE-----

--tdaG8xLM35UnWXdEbHGff0AxZRCvF7LCW--

--===============1157582765==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
amd-gfx mailing list
amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--===============1157582765==--
