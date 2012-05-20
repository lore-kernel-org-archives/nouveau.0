From: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 04/14] drm/nouveau: Remove non-relevant function
	prototypes
Date: Mon, 21 May 2012 00:14:53 +0100
Message-ID: <1337555703-18925-5-git-send-email-emil.l.velikov@gmail.com>
References: <1337555703-18925-1-git-send-email-emil.l.velikov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1337555703-18925-1-git-send-email-emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Signed-off-by: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_fb.h   |    1 -
 drivers/gpu/drm/nouveau/nouveau_gpio.h |    3 ---
 2 files changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_fb.h b/drivers/gpu/drm/nouveau/nouveau_fb.h
index b804fd0..5f62743 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fb.h
+++ b/drivers/gpu/drm/nouveau/nouveau_fb.h
@@ -37,7 +37,6 @@ void nv30_fb_free_tile_region(struct nouveau_fb *, int i);
 int  nv40_fb_create(struct nouveau_device *, int);
 
 int  nv50_fb_create(struct nouveau_device *, int);
-void nv50_fb_vram_fini(struct nouveau_fb *);
 void nv50_fb_vram_del(struct nouveau_fb *, struct nouveau_mem **);
 void nv50_fb_vm_trap(struct nouveau_device *, int display);
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_gpio.h b/drivers/gpu/drm/nouveau/nouveau_gpio.h
index 1814c19..5bd66e8 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gpio.h
+++ b/drivers/gpu/drm/nouveau/nouveau_gpio.h
@@ -53,9 +53,6 @@ struct gpio_func {
 
 /* nouveau_gpio.c */
 int  nouveau_gpio_create(struct nouveau_device *, int subdev);
-void nouveau_gpio_destroy(struct nouveau_device *);
-int  nouveau_gpio_init(struct nouveau_device *);
-void nouveau_gpio_fini(struct nouveau_device *);
 void nouveau_gpio_reset(struct nouveau_device *);
 int  nouveau_gpio_drive(struct nouveau_device *, int idx, int line,
 			int dir, int out);
-- 
1.7.10.2
