From: Maarten Lankhorst <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Subject: [PATCH] drm/nouveau: do not move buffers when not needed
Date: Mon, 15 Jul 2013 10:39:57 +0200
Message-ID: <51E3B55D.8080403@canonical.com>
References: <51DFFA52.6010102@canonical.com>
	<CACAvsv74X7xU0BkfhN0gXHvFG+Ooe=7wrFBzKnqUF7PMeB5wLw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CACAvsv74X7xU0BkfhN0gXHvFG+Ooe=7wrFBzKnqUF7PMeB5wLw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Op 15-07-13 08:05, Ben Skeggs schreef:
> On Fri, Jul 12, 2013 at 10:45 PM, Maarten Lankhorst
> <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org> wrote:
>> I have no idea what this bogus restriction on placement is, but it breaks decoding 1080p
>> VDPAU at boot speed. With this patch applied I only need to bump the vdec clock to
>> get real-time 1080p decoding. It prevents a lot of VRAM <-> VRAM buffer moves.
> It's not bogus, and is required for pre-GF8 boards with VRAM > BAR size.
>
> What configuration does the buffer that's getting moved here have
> exactly?  The placement restriction isn't necessary on GF8, the rest
> of the restrictions may currently be required still however.
>
>= vdpau on NVC0 with tiling. I upload the raw bitstream to a tiling bo. This is ok because
the vm hides all the tiling translations, and the engines will read the raw bitstream correctly.
8<---
This prevents buffer moves from being done on NV50+, where remapping is not needed because
the bar has its own VM, instead of only having the first BAR1-size chunk of VRAM accessible.
nouveau_bo_tile_layout is always 0 on < NV_50.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
---
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index d506da5..762bfcd 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -1346,14 +1361,13 @@ nouveau_ttm_fault_reserve_notify(struct ttm_buffer_object *bo)
 	struct nouveau_device *device = nv_device(drm->device);
 	u32 mappable = pci_resource_len(device->pdev, 1) >> PAGE_SHIFT;
 
-	/* as long as the bo isn't in vram, and isn't tiled, we've got
-	 * nothing to do here.
+	/*
+	 * if the bo is not in vram, or remapping can be done (nv50+)
+	 * do not worry about placement, any location is valid
 	 */
-	if (bo->mem.mem_type != TTM_PL_VRAM) {
-		if (nv_device(drm->device)->card_type < NV_50 ||
-		    !nouveau_bo_tile_layout(nvbo))
-			return 0;
-	}
+	if (nv_device(drm->device)->card_type >= NV_50 ||
+	    bo->mem.mem_type != TTM_PL_VRAM)
+		return 0;
 
 	/* make sure bo is in mappable vram */
 	if (bo->mem.start + bo->mem.num_pages < mappable)
