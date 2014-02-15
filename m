From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 74613] [NV34] [v3.14-rc1] nouveau: get 0x10000000
 put 0x0000ed30 state 0xc0000000 (err: MEM_FAULT) push 0x00000000
Date: Sat, 15 Feb 2014 19:14:13 +0000
Message-ID: <bug-74613-8800-crIhNhG898@http.bugs.freedesktop.org/>
References: <bug-74613-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1655156392=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-74613-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1655156392==
Content-Type: multipart/alternative; boundary="1392491653.5ABC41241.9245"; charset="us-ascii"


--1392491653.5ABC41241.9245
Date: Sat, 15 Feb 2014 19:14:13 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=74613

--- Comment #6 from Ronald <ronald645-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
It's "drm/nv50-: map TTM_PL_SYSTEM through a BAR for CPU access"

Despite it's name it touches generic stuff. I'm running v3.14-rc2 with this
patch reverted -> no issue's yet.

commit a554090664728384c94b027ba15bc7df87f9ac09
Author: Maarten Lankhorst <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Date:   Tue Nov 12 13:34:09 2013 +0100

    drm/nv50-: map TTM_PL_SYSTEM through a BAR for CPU access

    Moves bo's to TTM_PL_TT for BAR mapping, to hide tiling from user.

    Signed-off-by: Maarten Lankhorst <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
    Signed-off-by: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c
b/drivers/gpu/drm/nouveau/nouveau_bo.c
index e4623e9..39ca36c 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -1241,6 +1241,7 @@ nouveau_ttm_io_mem_reserve(struct ttm_bo_device *bdev,
struct ttm_mem_reg *mem)
 {
     struct ttm_mem_type_manager *man = &bdev->man[mem->mem_type];
     struct nouveau_drm *drm = nouveau_bdev(bdev);
+    struct nouveau_mem *node = mem->mm_node;
     struct drm_device *dev = drm->dev;
     int ret;

@@ -1263,14 +1264,16 @@ nouveau_ttm_io_mem_reserve(struct ttm_bo_device *bdev,
struct ttm_mem_reg *mem)
             mem->bus.is_iomem = !dev->agp->cant_use_aperture;
         }
 #endif
-        break;
+        if (!node->memtype)
+            /* untiled */
+            break;
+        /* fallthrough, tiled memory */
     case TTM_PL_VRAM:
         mem->bus.offset = mem->start << PAGE_SHIFT;
         mem->bus.base = pci_resource_start(dev->pdev, 1);
         mem->bus.is_iomem = true;
         if (nv_device(drm->device)->card_type >= NV_50) {
             struct nouveau_bar *bar = nouveau_bar(drm->device);
-            struct nouveau_mem *node = mem->mm_node;

             ret = bar->umap(bar, node, NV_MEM_ACCESS_RW,
                     &node->bar_vma);
@@ -1306,6 +1309,7 @@ nouveau_ttm_fault_reserve_notify(struct ttm_buffer_object
*bo)
     struct nouveau_bo *nvbo = nouveau_bo(bo);
     struct nouveau_device *device = nv_device(drm->device);
     u32 mappable = pci_resource_len(device->pdev, 1) >> PAGE_SHIFT;
+    int ret;

     /* as long as the bo isn't in vram, and isn't tiled, we've got
      * nothing to do here.
@@ -1314,10 +1318,20 @@ nouveau_ttm_fault_reserve_notify(struct
ttm_buffer_object *bo)
         if (nv_device(drm->device)->card_type < NV_50 ||
             !nouveau_bo_tile_layout(nvbo))
             return 0;
+
+        if (bo->mem.mem_type == TTM_PL_SYSTEM) {
+            nouveau_bo_placement_set(nvbo, TTM_PL_TT, 0);
+
+            ret = nouveau_bo_validate(nvbo, false, false);
+            if (ret)
+                return ret;
+        }
+        return 0;
     }

     /* make sure bo is in mappable vram */
-    if (bo->mem.start + bo->mem.num_pages < mappable)
+    if (nv_device(drm->device)->card_type >= NV_50 ||
+        bo->mem.start + bo->mem.num_pages < mappable)
         return 0;

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1392491653.5ABC41241.9245
Date: Sat, 15 Feb 2014 19:14:13 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV34] [v3.14-rc1] nouveau: get 0x10000000 put 0x0000ed30 state 0xc0000000 (err: MEM_FAULT) push 0x00000000"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=74613#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV34] [v3.14-rc1] nouveau: get 0x10000000 put 0x0000ed30 state 0xc0000000 (err: MEM_FAULT) push 0x00000000"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=74613">bug 74613</a>
              from <span class="vcard"><a class="email" href="mailto:ronald645&#64;gmail.com" title="Ronald &lt;ronald645&#64;gmail.com&gt;"> <span class="fn">Ronald</span></a>
</span></b>
        <pre>It's &quot;drm/nv50-: map TTM_PL_SYSTEM through a BAR for CPU access&quot;

Despite it's name it touches generic stuff. I'm running v3.14-rc2 with this
patch reverted -&gt; no issue's yet.

commit a554090664728384c94b027ba15bc7df87f9ac09
Author: Maarten Lankhorst &lt;<a href="mailto:maarten.lankhorst&#64;canonical.com">maarten.lankhorst&#64;canonical.com</a>&gt;
Date:   Tue Nov 12 13:34:09 2013 +0100

    drm/nv50-: map TTM_PL_SYSTEM through a BAR for CPU access

    Moves bo's to TTM_PL_TT for BAR mapping, to hide tiling from user.

    Signed-off-by: Maarten Lankhorst &lt;<a href="mailto:maarten.lankhorst&#64;canonical.com">maarten.lankhorst&#64;canonical.com</a>&gt;
    Signed-off-by: Ben Skeggs &lt;<a href="mailto:bskeggs&#64;redhat.com">bskeggs&#64;redhat.com</a>&gt;

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c
b/drivers/gpu/drm/nouveau/nouveau_bo.c
index e4623e9..39ca36c 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
&#64;&#64; -1241,6 +1241,7 &#64;&#64; nouveau_ttm_io_mem_reserve(struct ttm_bo_device *bdev,
struct ttm_mem_reg *mem)
 {
     struct ttm_mem_type_manager *man = &amp;bdev-&gt;man[mem-&gt;mem_type];
     struct nouveau_drm *drm = nouveau_bdev(bdev);
+    struct nouveau_mem *node = mem-&gt;mm_node;
     struct drm_device *dev = drm-&gt;dev;
     int ret;

&#64;&#64; -1263,14 +1264,16 &#64;&#64; nouveau_ttm_io_mem_reserve(struct ttm_bo_device *bdev,
struct ttm_mem_reg *mem)
             mem-&gt;bus.is_iomem = !dev-&gt;agp-&gt;cant_use_aperture;
         }
 #endif
-        break;
+        if (!node-&gt;memtype)
+            /* untiled */
+            break;
+        /* fallthrough, tiled memory */
     case TTM_PL_VRAM:
         mem-&gt;bus.offset = mem-&gt;start &lt;&lt; PAGE_SHIFT;
         mem-&gt;bus.base = pci_resource_start(dev-&gt;pdev, 1);
         mem-&gt;bus.is_iomem = true;
         if (nv_device(drm-&gt;device)-&gt;card_type &gt;= NV_50) {
             struct nouveau_bar *bar = nouveau_bar(drm-&gt;device);
-            struct nouveau_mem *node = mem-&gt;mm_node;

             ret = bar-&gt;umap(bar, node, NV_MEM_ACCESS_RW,
                     &amp;node-&gt;bar_vma);
&#64;&#64; -1306,6 +1309,7 &#64;&#64; nouveau_ttm_fault_reserve_notify(struct ttm_buffer_object
*bo)
     struct nouveau_bo *nvbo = nouveau_bo(bo);
     struct nouveau_device *device = nv_device(drm-&gt;device);
     u32 mappable = pci_resource_len(device-&gt;pdev, 1) &gt;&gt; PAGE_SHIFT;
+    int ret;

     /* as long as the bo isn't in vram, and isn't tiled, we've got
      * nothing to do here.
&#64;&#64; -1314,10 +1318,20 &#64;&#64; nouveau_ttm_fault_reserve_notify(struct
ttm_buffer_object *bo)
         if (nv_device(drm-&gt;device)-&gt;card_type &lt; NV_50 ||
             !nouveau_bo_tile_layout(nvbo))
             return 0;
+
+        if (bo-&gt;mem.mem_type == TTM_PL_SYSTEM) {
+            nouveau_bo_placement_set(nvbo, TTM_PL_TT, 0);
+
+            ret = nouveau_bo_validate(nvbo, false, false);
+            if (ret)
+                return ret;
+        }
+        return 0;
     }

     /* make sure bo is in mappable vram */
-    if (bo-&gt;mem.start + bo-&gt;mem.num_pages &lt; mappable)
+    if (nv_device(drm-&gt;device)-&gt;card_type &gt;= NV_50 ||
+        bo-&gt;mem.start + bo-&gt;mem.num_pages &lt; mappable)
         return 0;</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1392491653.5ABC41241.9245--

--===============1655156392==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1655156392==--
