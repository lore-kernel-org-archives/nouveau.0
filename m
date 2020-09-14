From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 01/20] drm/amdgpu: Introduce GEM object functions
Date: Mon, 14 Sep 2020 19:51:07 +0200
Message-ID: <ee7528ba-6775-53be-97fe-c8425178b491@gmail.com>
References: <20200813083644.31711-1-tzimmermann@suse.de>
 <20200813083644.31711-2-tzimmermann@suse.de>
 <5c1b3cab-1898-46df-2c5c-23ab6cbfbb7a@amd.com>
 <c445493b-9914-63f2-1cf2-c3c1de14e3e5@suse.de>
Reply-To: christian.koenig-5C7GfCeVMHo@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1987600549=="
Return-path: <amd-gfx-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <c445493b-9914-63f2-1cf2-c3c1de14e3e5-l3A5Bk7waGM@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:amd-gfx-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: amd-gfx-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "amd-gfx" <amd-gfx-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Thomas Zimmermann <tzimmermann-l3A5Bk7waGM@public.gmane.org>, =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig-5C7GfCeVMHo@public.gmane.org>, alexander.deucher-5C7GfCeVMHo@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, daniel-/w4YWyX8dFk@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, maarten.lankhorst-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, mripard-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, christian.gmeiner-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, patrik.r.jakobsson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jani.nikula-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, joonas.lahtinen-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, rodrigo.vivi-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, chunkuang.hu-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sean-p7yTbzM4H96eqtR555YLDQ@public.gmane.org, bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, tomi.valkeinen-l0cyMroinI0@public.gmane.org, eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org, hjc-TNX95d0MmH7DzftRWevZcw@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, rodrigosiqueiramelo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, hamohammed.sa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, oleksandr_andrushchenko@ep
Cc: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, intel-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, etnaviv-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, xen-devel-GuqFBffKawtpuQazS67q72D2FQJk+8+b@public.gmane.org, freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: nouveau.vger.kernel.org

This is a multi-part message in MIME format.
--===============1987600549==
Content-Type: multipart/alternative;
 boundary="------------29780EC5D45E17F55361B946"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------29780EC5D45E17F55361B946
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 14.09.20 um 17:05 schrieb Thomas Zimmermann:
> Hi
>
> Am 13.08.20 um 12:22 schrieb Christian König:
>> Am 13.08.20 um 10:36 schrieb Thomas Zimmermann:
>>> GEM object functions deprecate several similar callback interfaces in
>>> struct drm_driver. This patch replaces the per-driver callbacks with
>>> per-instance callbacks in amdgpu. The only exception is gem_prime_mmap,
>>> which is non-trivial to convert.
>>>
>>> Signed-off-by: Thomas Zimmermann <tzimmermann-l3A5Bk7waGM@public.gmane.org>
>>> ---
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c    |  6 ------
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 12 ++++++++++++
>>>    2 files changed, 12 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>> index 81a79760ca61..51525b8774c9 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>> @@ -1468,19 +1468,13 @@ static struct drm_driver kms_driver = {
>>>        .lastclose = amdgpu_driver_lastclose_kms,
>>>        .irq_handler = amdgpu_irq_handler,
>>>        .ioctls = amdgpu_ioctls_kms,
>>> -    .gem_free_object_unlocked = amdgpu_gem_object_free,
>>> -    .gem_open_object = amdgpu_gem_object_open,
>>> -    .gem_close_object = amdgpu_gem_object_close,
>>>        .dumb_create = amdgpu_mode_dumb_create,
>>>        .dumb_map_offset = amdgpu_mode_dumb_mmap,
>>>        .fops = &amdgpu_driver_kms_fops,
>>>          .prime_handle_to_fd = drm_gem_prime_handle_to_fd,
>>>        .prime_fd_to_handle = drm_gem_prime_fd_to_handle,
>>> -    .gem_prime_export = amdgpu_gem_prime_export,
>>>        .gem_prime_import = amdgpu_gem_prime_import,
>>> -    .gem_prime_vmap = amdgpu_gem_prime_vmap,
>>> -    .gem_prime_vunmap = amdgpu_gem_prime_vunmap,
>>>        .gem_prime_mmap = amdgpu_gem_prime_mmap,
>>>          .name = DRIVER_NAME,
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>>> index 43f4966331dd..ca2b79f94e99 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>>> @@ -36,6 +36,7 @@
>>>    #include <drm/amdgpu_drm.h>
>>>    #include <drm/drm_cache.h>
>>>    #include "amdgpu.h"
>>> +#include "amdgpu_dma_buf.h"
>>>    #include "amdgpu_trace.h"
>>>    #include "amdgpu_amdkfd.h"
>>>    @@ -510,6 +511,15 @@ bool amdgpu_bo_support_uswc(u64 bo_flags)
>>>    #endif
>>>    }
>>>    +static const struct drm_gem_object_funcs amdgpu_gem_object_funcs = {
>>> +    .free = amdgpu_gem_object_free,
>>> +    .open = amdgpu_gem_object_open,
>>> +    .close = amdgpu_gem_object_close,
>>> +    .export = amdgpu_gem_prime_export,
>>> +    .vmap = amdgpu_gem_prime_vmap,
>>> +    .vunmap = amdgpu_gem_prime_vunmap,
>>> +};
>>> +
>> Wrong file, this belongs into amdgpu_gem.c
>>
>>>    static int amdgpu_bo_do_create(struct amdgpu_device *adev,
>>>                       struct amdgpu_bo_param *bp,
>>>                       struct amdgpu_bo **bo_ptr)
>>> @@ -552,6 +562,8 @@ static int amdgpu_bo_do_create(struct
>>> amdgpu_device *adev,
>>>        bo = kzalloc(sizeof(struct amdgpu_bo), GFP_KERNEL);
>>>        if (bo == NULL)
>>>            return -ENOMEM;
>>> +
>>> +    bo->tbo.base.funcs = &amdgpu_gem_object_funcs;
>> And this should probably go into amdgpu_gem_object_create().
> I'm trying to understand what amdgpu does.  What about all the places
> where amdgpu calls amdgpu_bo_create() internally? Wouldn't these miss
> the free callback for the GEM object?

Those shouldn't have a GEM object in the first place.

Or otherwise we would have a reference counting issue.

Regards,
Christian.

>
> Best regards
> Thomas
>
>> Apart from that looks like a good idea to me.
>>
>> Christian.
>>
>>>        drm_gem_private_object_init(adev->ddev, &bo->tbo.base, size);
>>>        INIT_LIST_HEAD(&bo->shadow_list);
>>>        bo->vm_bo = NULL;
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx


--------------29780EC5D45E17F55361B946
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">Am 14.09.20 um 17:05 schrieb Thomas
      Zimmermann:<br>
    </div>
    <blockquote type="cite"
      cite="mid:c445493b-9914-63f2-1cf2-c3c1de14e3e5-l3A5Bk7waGM@public.gmane.org">
      <pre class="moz-quote-pre" wrap="">Hi

Am 13.08.20 um 12:22 schrieb Christian König:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Am 13.08.20 um 10:36 schrieb Thomas Zimmermann:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">GEM object functions deprecate several similar callback interfaces in
struct drm_driver. This patch replaces the per-driver callbacks with
per-instance callbacks in amdgpu. The only exception is gem_prime_mmap,
which is non-trivial to convert.

Signed-off-by: Thomas Zimmermann <a class="moz-txt-link-rfc2396E" href="mailto:tzimmermann-l3A5Bk7waGM@public.gmane.org">&lt;tzimmermann-l3A5Bk7waGM@public.gmane.org&gt;</a>
---
  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c    |  6 ------
  drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 12 ++++++++++++
  2 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 81a79760ca61..51525b8774c9 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -1468,19 +1468,13 @@ static struct drm_driver kms_driver = {
      .lastclose = amdgpu_driver_lastclose_kms,
      .irq_handler = amdgpu_irq_handler,
      .ioctls = amdgpu_ioctls_kms,
-    .gem_free_object_unlocked = amdgpu_gem_object_free,
-    .gem_open_object = amdgpu_gem_object_open,
-    .gem_close_object = amdgpu_gem_object_close,
      .dumb_create = amdgpu_mode_dumb_create,
      .dumb_map_offset = amdgpu_mode_dumb_mmap,
      .fops = &amp;amdgpu_driver_kms_fops,
        .prime_handle_to_fd = drm_gem_prime_handle_to_fd,
      .prime_fd_to_handle = drm_gem_prime_fd_to_handle,
-    .gem_prime_export = amdgpu_gem_prime_export,
      .gem_prime_import = amdgpu_gem_prime_import,
-    .gem_prime_vmap = amdgpu_gem_prime_vmap,
-    .gem_prime_vunmap = amdgpu_gem_prime_vunmap,
      .gem_prime_mmap = amdgpu_gem_prime_mmap,
        .name = DRIVER_NAME,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index 43f4966331dd..ca2b79f94e99 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -36,6 +36,7 @@
  #include &lt;drm/amdgpu_drm.h&gt;
  #include &lt;drm/drm_cache.h&gt;
  #include "amdgpu.h"
+#include "amdgpu_dma_buf.h"
  #include "amdgpu_trace.h"
  #include "amdgpu_amdkfd.h"
  @@ -510,6 +511,15 @@ bool amdgpu_bo_support_uswc(u64 bo_flags)
  #endif
  }
  +static const struct drm_gem_object_funcs amdgpu_gem_object_funcs = {
+    .free = amdgpu_gem_object_free,
+    .open = amdgpu_gem_object_open,
+    .close = amdgpu_gem_object_close,
+    .export = amdgpu_gem_prime_export,
+    .vmap = amdgpu_gem_prime_vmap,
+    .vunmap = amdgpu_gem_prime_vunmap,
+};
+
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Wrong file, this belongs into amdgpu_gem.c

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">  static int amdgpu_bo_do_create(struct amdgpu_device *adev,
                     struct amdgpu_bo_param *bp,
                     struct amdgpu_bo **bo_ptr)
@@ -552,6 +562,8 @@ static int amdgpu_bo_do_create(struct
amdgpu_device *adev,
      bo = kzalloc(sizeof(struct amdgpu_bo), GFP_KERNEL);
      if (bo == NULL)
          return -ENOMEM;
+
+    bo-&gt;tbo.base.funcs = &amp;amdgpu_gem_object_funcs;
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
And this should probably go into amdgpu_gem_object_create().
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I'm trying to understand what amdgpu does.  What about all the places
where amdgpu calls amdgpu_bo_create() internally? Wouldn't these miss
the free callback for the GEM object?</pre>
    </blockquote>
    <br>
    Those shouldn't have a GEM object in the first place.<br>
    <br>
    Or otherwise we would have a reference counting issue.<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <blockquote type="cite"
      cite="mid:c445493b-9914-63f2-1cf2-c3c1de14e3e5-l3A5Bk7waGM@public.gmane.org">
      <pre class="moz-quote-pre" wrap="">

Best regards
Thomas

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
Apart from that looks like a good idea to me.

Christian.

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">      drm_gem_private_object_init(adev-&gt;ddev, &amp;bo-&gt;tbo.base, size);
      INIT_LIST_HEAD(&amp;bo-&gt;shadow_list);
      bo-&gt;vm_bo = NULL;
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">_______________________________________________
amd-gfx mailing list
<a class="moz-txt-link-abbreviated" href="mailto:amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org">amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org</a>
<a class="moz-txt-link-freetext" href="https://lists.freedesktop.org/mailman/listinfo/amd-gfx">https://lists.freedesktop.org/mailman/listinfo/amd-gfx</a>
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------29780EC5D45E17F55361B946--

--===============1987600549==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
amd-gfx mailing list
amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--===============1987600549==--
