From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 8/8] drm/ttm: do not keep GPU dependent addresses
Date: Tue, 18 Feb 2020 19:37:44 +0100
Message-ID: <31b0cac7-82c7-60ad-830b-66f7838a1047@gmail.com>
References: <20200217150427.49994-1-nirmoy.das@amd.com>
 <20200217150427.49994-9-nirmoy.das@amd.com>
 <c3a20c1b-0520-1995-7445-9e3f3ea77394@suse.de>
 <9db59846-90b4-2b9a-8200-69297112693a@amd.com>
 <edc985f1-8856-4d1a-8960-efe4d21b960d@amd.com>
 <5b8db944-5a55-8161-6ab6-98490cfb0562@suse.de>
 <f8534965-ea14-bbac-bd34-06b951766a7c@amd.com>
 <48a5e3e2-cb9d-8328-1529-3558601ba860@suse.de>
Reply-To: christian.koenig-5C7GfCeVMHo@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0098550391=="
Return-path: <amd-gfx-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <48a5e3e2-cb9d-8328-1529-3558601ba860-l3A5Bk7waGM@public.gmane.org>
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
To: Thomas Zimmermann <tzimmermann-l3A5Bk7waGM@public.gmane.org>, =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig-5C7GfCeVMHo@public.gmane.org>, Nirmoy <nirmodas-5C7GfCeVMHo@public.gmane.org>, Nirmoy Das <nirmoy.aiemd-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: thellstrom-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, kenny.ho-5C7GfCeVMHo@public.gmane.org, amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, nirmoy.das-5C7GfCeVMHo@public.gmane.org, linux-graphics-maintainer-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org, bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, alexander.deucher-5C7GfCeVMHo@public.gmane.org, sean-p7yTbzM4H96eqtR555YLDQ@public.gmane.org, kraxel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
List-Id: nouveau.vger.kernel.org

This is a multi-part message in MIME format.
--===============0098550391==
Content-Type: multipart/alternative;
 boundary="------------720D19E588A50163BC63142C"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------720D19E588A50163BC63142C
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 18.02.20 um 19:28 schrieb Thomas Zimmermann:
> Hi
>
> Am 18.02.20 um 19:23 schrieb Christian König:
>> Am 18.02.20 um 19:16 schrieb Thomas Zimmermann:
>>> Hi
>>>
>>> Am 18.02.20 um 18:13 schrieb Nirmoy:
>>>> On 2/18/20 1:44 PM, Christian König wrote:
>>>>> Am 18.02.20 um 13:40 schrieb Thomas Zimmermann:
>>>>>> Hi
>>>>>>
>>>>>> Am 17.02.20 um 16:04 schrieb Nirmoy Das:
>>>>>>> GPU address handling is device specific and should be handle by its
>>>>>>> device
>>>>>>> driver.
>>>>>>>
>>>>>>> Signed-off-by: Nirmoy Das <nirmoy.das-5C7GfCeVMHo@public.gmane.org>
>>>>>>> ---
>>>>>>>     drivers/gpu/drm/ttm/ttm_bo.c    | 7 -------
>>>>>>>     include/drm/ttm/ttm_bo_api.h    | 2 --
>>>>>>>     include/drm/ttm/ttm_bo_driver.h | 1 -
>>>>>>>     3 files changed, 10 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c
>>>>>>> b/drivers/gpu/drm/ttm/ttm_bo.c
>>>>>>> index 151edfd8de77..d5885cd609a3 100644
>>>>>>> --- a/drivers/gpu/drm/ttm/ttm_bo.c
>>>>>>> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
>>>>>>> @@ -85,7 +85,6 @@ static void ttm_mem_type_debug(struct
>>>>>>> ttm_bo_device *bdev, struct drm_printer *p
>>>>>>>         drm_printf(p, "    has_type: %d\n", man->has_type);
>>>>>>>         drm_printf(p, "    use_type: %d\n", man->use_type);
>>>>>>>         drm_printf(p, "    flags: 0x%08X\n", man->flags);
>>>>>>> -    drm_printf(p, "    gpu_offset: 0x%08llX\n", man->gpu_offset);
>>>>>>>         drm_printf(p, "    size: %llu\n", man->size);
>>>>>>>         drm_printf(p, "    available_caching: 0x%08X\n",
>>>>>>> man->available_caching);
>>>>>>>         drm_printf(p, "    default_caching: 0x%08X\n",
>>>>>>> man->default_caching);
>>>>>>> @@ -345,12 +344,6 @@ static int ttm_bo_handle_move_mem(struct
>>>>>>> ttm_buffer_object *bo,
>>>>>>>     moved:
>>>>>>>         bo->evicted = false;
>>>>>>>     -    if (bo->mem.mm_node)
>>>>>>> -        bo->offset = (bo->mem.start << PAGE_SHIFT) +
>>>>>>> -            bdev->man[bo->mem.mem_type].gpu_offset;
>>>>>>> -    else
>>>>>>> -        bo->offset = 0;
>>>>>>> -
>>>>>> After moving this into users, the else branch has been lost. Is
>>>>>> 'bo->mem.mm_node' always true?
>>>>> At least for the amdgpu and radeon use cases, yes.
>>>>>
>>>>> But that is a rather good question I mean for it is illegal to get the
>>>>> GPU BO address if it is inaccessible (e.g. in the system domain).
>>>>>
>>>>> Could be that some driver relied on the behavior to get 0 for the
>>>>> system domain here.
>>>> I wonder how to verify that ?
>>>>
>>>> If I understand correctly:
>>>>
>>>> 1 qxl uses bo->offset only in qxl_bo_physical_address() which is not in
>>>> system domain.
>>>>
>>>> 2 unfortunately I can't say the same for bochs but it works with this
>>>> patch series so I think bochs is fine as well.
>>>>
>>>> 3 vmwgfx uses bo->offset only when bo->mem.mem_type == TTM_PL_VRAM so
>>>> vmwgfx should be fine.
>>>>
>>>> 4 amdgpu and radeon runs with 'bo->mem.mm_node' always true
>>>>
>>>> I am not sure about  nouveau as bo->offset is being used in many places.
>>>>
>>>> I could probably mirror the removed logic to nouveau as
>>> I suggest to introduce a ttm helper that contains the original branching
>>> and use it everywhere. Something like
>>>
>>>     s64 ttm_bo_offset(struct ttm_buffer_object *bo)
>>>     {
>>>        if (WARN_ON_ONCE(!bo->mem.mm_node))
>>>            return 0;
>>>        return bo->mem.start << PAGE_SHIFT;
>>>     }
>>>
>>> Could be static inline. The warning should point to broken drivers. This
>>> also gets rid of the ugly shift in the drivers.
>> Big NAK on this. That is exactly what we should NOT do.
>>
>> See the shift belongs into the driver, because it is driver dependent if
>> we work with page or byte offsets.
>>
>> For amdgpu we for example want to work with byte offsets and TTM should
>> not make any assumption about what bo->mem.start actually contains.
> OK. What about something like ttm_bo_pg_offset()? Same code without the
> shift. Would also make it clear that it's a page offset.

That is a rather good idea. We could name that ttm_bo_man_offset() and 
put it into ttm_bo_manager.c next to the manager which allocates them.

It's just that this manager is not used by everybody, so amdgpu, radeon 
and nouveau would still need a separate function.

Christian.

>
> Best regards
> Thomas
>
>> Regards,
>> Christian.
>>
>>> Best regards
>>> Thomas
>>>
>>>
>>>> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c
>>>> b/drivers/gpu/drm/nouveau/nouveau_bo.c
>>>> index f8015e0318d7..5a6a2af91318 100644
>>>> --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
>>>> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
>>>> @@ -1317,6 +1317,10 @@ nouveau_bo_move_ntfy(struct ttm_buffer_object
>>>> *bo, bool evict,
>>>>                   list_for_each_entry(vma, &nvbo->vma_list, head) {
>>>>                           nouveau_vma_map(vma, mem);
>>>>                   }
>>>> +               if (bo->mem.mm_node)
>>>> +                       nvbo->offset = (new_reg->start << PAGE_SHIFT);
>>>> +               else
>>>> +                       nvbo->offset = 0;
>>>>           } else {
>>>>                   list_for_each_entry(vma, &nvbo->vma_list, head) {
>>>>                           WARN_ON(ttm_bo_wait(bo, false, false));
>>>>
>>>> Regards,
>>>>
>>>> Nirmoy
>>>>
>>>>
>>>>> Regards,
>>>>> Christian.
>>>>>
>>>>>> Best regards
>>>>>> Thomas
>>>>>>
>>>>>>>         ctx->bytes_moved += bo->num_pages << PAGE_SHIFT;
>>>>>>>         return 0;
>>>>>>>     diff --git a/include/drm/ttm/ttm_bo_api.h
>>>>>>> b/include/drm/ttm/ttm_bo_api.h
>>>>>>> index b9bc1b00142e..d6f39ee5bf5d 100644
>>>>>>> --- a/include/drm/ttm/ttm_bo_api.h
>>>>>>> +++ b/include/drm/ttm/ttm_bo_api.h
>>>>>>> @@ -213,8 +213,6 @@ struct ttm_buffer_object {
>>>>>>>          * either of these locks held.
>>>>>>>          */
>>>>>>>     -    uint64_t offset; /* GPU address space is independent of CPU
>>>>>>> word size */
>>>>>>> -
>>>>>>>         struct sg_table *sg;
>>>>>>>     };
>>>>>>>     diff --git a/include/drm/ttm/ttm_bo_driver.h
>>>>>>> b/include/drm/ttm/ttm_bo_driver.h
>>>>>>> index c9e0fd09f4b2..c8ce6c181abe 100644
>>>>>>> --- a/include/drm/ttm/ttm_bo_driver.h
>>>>>>> +++ b/include/drm/ttm/ttm_bo_driver.h
>>>>>>> @@ -177,7 +177,6 @@ struct ttm_mem_type_manager {
>>>>>>>         bool has_type;
>>>>>>>         bool use_type;
>>>>>>>         uint32_t flags;
>>>>>>> -    uint64_t gpu_offset; /* GPU address space is independent of CPU
>>>>>>> word size */
>>>>>>>         uint64_t size;
>>>>>>>         uint32_t available_caching;
>>>>>>>         uint32_t default_caching;
>>>>>>>
>>>> _______________________________________________
>>>> dri-devel mailing list
>>>> dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
>>>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx


--------------720D19E588A50163BC63142C
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">Am 18.02.20 um 19:28 schrieb Thomas
      Zimmermann:<br>
    </div>
    <blockquote type="cite"
      cite="mid:48a5e3e2-cb9d-8328-1529-3558601ba860-l3A5Bk7waGM@public.gmane.org">
      <pre class="moz-quote-pre" wrap="">Hi

Am 18.02.20 um 19:23 schrieb Christian König:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Am 18.02.20 um 19:16 schrieb Thomas Zimmermann:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">Hi

Am 18.02.20 um 18:13 schrieb Nirmoy:
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">On 2/18/20 1:44 PM, Christian König wrote:
</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">Am 18.02.20 um 13:40 schrieb Thomas Zimmermann:
</pre>
              <blockquote type="cite">
                <pre class="moz-quote-pre" wrap="">Hi

Am 17.02.20 um 16:04 schrieb Nirmoy Das:
</pre>
                <blockquote type="cite">
                  <pre class="moz-quote-pre" wrap="">GPU address handling is device specific and should be handle by its
device
driver.

Signed-off-by: Nirmoy Das <a class="moz-txt-link-rfc2396E" href="mailto:nirmoy.das-5C7GfCeVMHo@public.gmane.org">&lt;nirmoy.das-5C7GfCeVMHo@public.gmane.org&gt;</a>
---
   drivers/gpu/drm/ttm/ttm_bo.c    | 7 -------
   include/drm/ttm/ttm_bo_api.h    | 2 --
   include/drm/ttm/ttm_bo_driver.h | 1 -
   3 files changed, 10 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c
b/drivers/gpu/drm/ttm/ttm_bo.c
index 151edfd8de77..d5885cd609a3 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -85,7 +85,6 @@ static void ttm_mem_type_debug(struct
ttm_bo_device *bdev, struct drm_printer *p
       drm_printf(p, "    has_type: %d\n", man-&gt;has_type);
       drm_printf(p, "    use_type: %d\n", man-&gt;use_type);
       drm_printf(p, "    flags: 0x%08X\n", man-&gt;flags);
-    drm_printf(p, "    gpu_offset: 0x%08llX\n", man-&gt;gpu_offset);
       drm_printf(p, "    size: %llu\n", man-&gt;size);
       drm_printf(p, "    available_caching: 0x%08X\n",
man-&gt;available_caching);
       drm_printf(p, "    default_caching: 0x%08X\n",
man-&gt;default_caching);
@@ -345,12 +344,6 @@ static int ttm_bo_handle_move_mem(struct
ttm_buffer_object *bo,
   moved:
       bo-&gt;evicted = false;
   -    if (bo-&gt;mem.mm_node)
-        bo-&gt;offset = (bo-&gt;mem.start &lt;&lt; PAGE_SHIFT) +
-            bdev-&gt;man[bo-&gt;mem.mem_type].gpu_offset;
-    else
-        bo-&gt;offset = 0;
-
</pre>
                </blockquote>
                <pre class="moz-quote-pre" wrap="">After moving this into users, the else branch has been lost. Is
'bo-&gt;mem.mm_node' always true?
</pre>
              </blockquote>
              <pre class="moz-quote-pre" wrap="">At least for the amdgpu and radeon use cases, yes.

But that is a rather good question I mean for it is illegal to get the
GPU BO address if it is inaccessible (e.g. in the system domain).

Could be that some driver relied on the behavior to get 0 for the
system domain here.
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">I wonder how to verify that ?

If I understand correctly:

1 qxl uses bo-&gt;offset only in qxl_bo_physical_address() which is not in
system domain.

2 unfortunately I can't say the same for bochs but it works with this
patch series so I think bochs is fine as well.

3 vmwgfx uses bo-&gt;offset only when bo-&gt;mem.mem_type == TTM_PL_VRAM so
vmwgfx should be fine.

4 amdgpu and radeon runs with 'bo-&gt;mem.mm_node' always true

I am not sure about  nouveau as bo-&gt;offset is being used in many places.

I could probably mirror the removed logic to nouveau as
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">I suggest to introduce a ttm helper that contains the original branching
and use it everywhere. Something like

   s64 ttm_bo_offset(struct ttm_buffer_object *bo)
   {
      if (WARN_ON_ONCE(!bo-&gt;mem.mm_node))
          return 0;
      return bo-&gt;mem.start &lt;&lt; PAGE_SHIFT;
   }

Could be static inline. The warning should point to broken drivers. This
also gets rid of the ugly shift in the drivers.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Big NAK on this. That is exactly what we should NOT do.

See the shift belongs into the driver, because it is driver dependent if
we work with page or byte offsets.

For amdgpu we for example want to work with byte offsets and TTM should
not make any assumption about what bo-&gt;mem.start actually contains.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
OK. What about something like ttm_bo_pg_offset()? Same code without the
shift. Would also make it clear that it's a page offset.</pre>
    </blockquote>
    <br>
    That is a rather good idea. We could name that ttm_bo_man_offset()
    and put it into ttm_bo_manager.c next to the manager which allocates
    them.<br>
    <br>
    It's just that this manager is not used by everybody, so amdgpu,
    radeon and nouveau would still need a separate function.<br>
    <br>
    Christian.<br>
    <br>
    <blockquote type="cite"
      cite="mid:48a5e3e2-cb9d-8328-1529-3558601ba860-l3A5Bk7waGM@public.gmane.org">
      <pre class="moz-quote-pre" wrap="">

Best regards
Thomas

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
Regards,
Christian.

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
Best regards
Thomas


</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c
b/drivers/gpu/drm/nouveau/nouveau_bo.c
index f8015e0318d7..5a6a2af91318 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -1317,6 +1317,10 @@ nouveau_bo_move_ntfy(struct ttm_buffer_object
*bo, bool evict,
                 list_for_each_entry(vma, &amp;nvbo-&gt;vma_list, head) {
                         nouveau_vma_map(vma, mem);
                 }
+               if (bo-&gt;mem.mm_node)
+                       nvbo-&gt;offset = (new_reg-&gt;start &lt;&lt; PAGE_SHIFT);
+               else
+                       nvbo-&gt;offset = 0;
         } else {
                 list_for_each_entry(vma, &amp;nvbo-&gt;vma_list, head) {
                         WARN_ON(ttm_bo_wait(bo, false, false));

Regards,

Nirmoy


</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">Regards,
Christian.

</pre>
              <blockquote type="cite">
                <pre class="moz-quote-pre" wrap="">Best regards
Thomas

</pre>
                <blockquote type="cite">
                  <pre class="moz-quote-pre" wrap="">       ctx-&gt;bytes_moved += bo-&gt;num_pages &lt;&lt; PAGE_SHIFT;
       return 0;
   diff --git a/include/drm/ttm/ttm_bo_api.h
b/include/drm/ttm/ttm_bo_api.h
index b9bc1b00142e..d6f39ee5bf5d 100644
--- a/include/drm/ttm/ttm_bo_api.h
+++ b/include/drm/ttm/ttm_bo_api.h
@@ -213,8 +213,6 @@ struct ttm_buffer_object {
        * either of these locks held.
        */
   -    uint64_t offset; /* GPU address space is independent of CPU
word size */
-
       struct sg_table *sg;
   };
   diff --git a/include/drm/ttm/ttm_bo_driver.h
b/include/drm/ttm/ttm_bo_driver.h
index c9e0fd09f4b2..c8ce6c181abe 100644
--- a/include/drm/ttm/ttm_bo_driver.h
+++ b/include/drm/ttm/ttm_bo_driver.h
@@ -177,7 +177,6 @@ struct ttm_mem_type_manager {
       bool has_type;
       bool use_type;
       uint32_t flags;
-    uint64_t gpu_offset; /* GPU address space is independent of CPU
word size */
       uint64_t size;
       uint32_t available_caching;
       uint32_t default_caching;

</pre>
                </blockquote>
              </blockquote>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">_______________________________________________
dri-devel mailing list
<a class="moz-txt-link-abbreviated" href="mailto:dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org">dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org</a>
<a class="moz-txt-link-freetext" href="https://lists.freedesktop.org/mailman/listinfo/dri-devel">https://lists.freedesktop.org/mailman/listinfo/dri-devel</a>
</pre>
          </blockquote>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
_______________________________________________
dri-devel mailing list
<a class="moz-txt-link-abbreviated" href="mailto:dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org">dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org</a>
<a class="moz-txt-link-freetext" href="https://lists.freedesktop.org/mailman/listinfo/dri-devel">https://lists.freedesktop.org/mailman/listinfo/dri-devel</a>
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

--------------720D19E588A50163BC63142C--

--===============0098550391==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
amd-gfx mailing list
amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--===============0098550391==--
