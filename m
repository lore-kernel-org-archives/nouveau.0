From: Lyude Paul <lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 1/2] drm/nouveau/kms/nv50-: Program notifier
 offset before requesting disp caps
Date: Mon, 24 Aug 2020 14:32:52 -0400
Message-ID: <20200824183253.826343-2-lyude@redhat.com>
References: <20200824183253.826343-1-lyude@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20200824183253.826343-1-lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Sasha Levin <sashal-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: nouveau.vger.kernel.org

Not entirely sure why this never came up when I originally tested this
(maybe some BIOSes already have this setup?) but the ->caps_init vfunc
appears to cause the display engine to throw an exception on driver
init, at least on my ThinkPad P72:

nouveau 0000:01:00.0: disp: chid 0 mthd 008c data 00000000 0000508c 0000102b

This is magic nvidia speak for "You need to have the DMA notifier offset
programmed before you can call NV507D_GET_CAPABILITIES." So, let's fix
this by doing that, and also perform an update afterwards to prevent
racing with the GPU when reading capabilities.

Changes since v1:
* Don't just program the DMA notifier offset, make sure to actually
  perform an update

Signed-off-by: Lyude Paul <lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Fixes: 4a2cb4181b07 ("drm/nouveau/kms/nv50-: Probe SOR and PIOR caps for DP interlacing support")
Cc: <stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org> # v5.8+
---
 drivers/gpu/drm/nouveau/dispnv50/core507d.c | 25 ++++++++++++++++-----
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/core507d.c b/drivers/gpu/drm/nouveau/dispnv50/core507d.c
index e341f572c2696..5e86feec3b720 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/core507d.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/core507d.c
@@ -65,13 +65,26 @@ core507d_ntfy_init(struct nouveau_bo *bo, u32 offset)
 int
 core507d_caps_init(struct nouveau_drm *drm, struct nv50_disp *disp)
 {
-	u32 *push = evo_wait(&disp->core->chan, 2);
+	struct nv50_core *core = disp->core;
+	u32 interlock[NV50_DISP_INTERLOCK__SIZE] = {0};
+	u32 *push;
 
-	if (push) {
-		evo_mthd(push, 0x008c, 1);
-		evo_data(push, 0x0);
-		evo_kick(push, &disp->core->chan);
-	}
+	core->func->ntfy_init(disp->sync, NV50_DISP_CORE_NTFY);
+
+	push = evo_wait(&core->chan, 4);
+	if (!push)
+		return 0;
+
+	evo_mthd(push, 0x0084, 1);
+	evo_data(push, 0x80000000 | NV50_DISP_CORE_NTFY);
+	evo_mthd(push, 0x008c, 1);
+	evo_data(push, 0x0);
+	evo_kick(push, &core->chan);
+
+	core->func->update(core, interlock, false);
+	if (core->func->ntfy_wait_done(disp->sync, NV50_DISP_CORE_NTFY,
+				       core->chan.base.device))
+		NV_ERROR(drm, "core notifier timeout\n");
 
 	return 0;
 }
-- 
2.26.2
