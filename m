From: Maarten Lankhorst <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Subject: [PATCH] drm/nouveau: mark last megabyte as usable
Date: Wed, 07 Aug 2013 17:24:09 +0200
Message-ID: <52026699.1010004@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Cc: "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

It's my megabyte, I want to use it! At this point in init
vbios is copied over already, so there's no reason it cannot
used to hold other data now.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
---
diff --git a/drivers/gpu/drm/nouveau/core/subdev/fb/ramnvc0.c b/drivers/gpu/drm/nouveau/core/subdev/fb/ramnvc0.c
index cf97c4d..507d35d 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/fb/ramnvc0.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/fb/ramnvc0.c
@@ -119,7 +119,6 @@ nvc0_ram_create(struct nouveau_object *parent, struct nouveau_object *engine,
 	struct nouveau_bios *bios = nouveau_bios(pfb);
 	struct nouveau_ram *ram;
 	const u32 rsvd_head = ( 256 * 1024) >> 12; /* vga memory */
-	const u32 rsvd_tail = (1024 * 1024) >> 12; /* vbios etc */
 	u32 parts = nv_rd32(pfb, 0x022438);
 	u32 pmask = nv_rd32(pfb, 0x022554);
 	u32 bsize = nv_rd32(pfb, 0x10f20c);
@@ -156,7 +155,7 @@ nvc0_ram_create(struct nouveau_object *parent, struct nouveau_object *engine,
 	/* if all controllers have the same amount attached, there's no holes */
 	if (uniform) {
 		offset = rsvd_head;
-		length = (ram->size >> 12) - rsvd_head - rsvd_tail;
+		length = (ram->size >> 12) - rsvd_head;
 		ret = nouveau_mm_init(&pfb->vram, offset, length, 1);
 	} else {
 		/* otherwise, address lowest common amount from 0GiB */
@@ -167,7 +166,7 @@ nvc0_ram_create(struct nouveau_object *parent, struct nouveau_object *engine,
 
 		/* and the rest starting from (8GiB + common_size) */
 		offset = (0x0200000000ULL >> 12) + (bsize << 8);
-		length = (ram->size >> 12) - (bsize << 8) - rsvd_tail;
+		length = (ram->size >> 12) - (bsize << 8);
 
 		ret = nouveau_mm_init(&pfb->vram, offset, length, 0);
 		if (ret)
