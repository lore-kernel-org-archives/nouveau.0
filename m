From: Roy Spliet <rspliet-pPYjZ15w/Xhulxpn9UvDqw@public.gmane.org>
Subject: [PATCH 3/8] pwr/memx: Make FB disable and enable explicit
Date: Thu,  4 Sep 2014 16:58:50 +0200
Message-ID: <1409842735-7361-4-git-send-email-rspliet@eclipso.eu>
References: <1409842735-7361-1-git-send-email-rspliet@eclipso.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1409842735-7361-1-git-send-email-rspliet-pPYjZ15w/Xhulxpn9UvDqw@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Nouveau Mailinglist <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Cc: Roy Spliet <rspliet-pPYjZ15w/Xhulxpn9UvDqw@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Needs to be done after wait-for-VBLANK, and NVA3 requires register writes in between. Rather than hard-coding register writes, just split out fb_disable and fb_enable.

Signed-off-by: Roy Spliet <rspliet-pPYjZ15w/Xhulxpn9UvDqw@public.gmane.org>
---
 drivers/gpu/drm/nouveau/core/include/subdev/pwr.h    |  2 ++
 drivers/gpu/drm/nouveau/core/subdev/fb/ramfuc.h      | 14 ++++++++++++++
 drivers/gpu/drm/nouveau/core/subdev/pwr/fuc/memx.fuc |  4 ++--
 drivers/gpu/drm/nouveau/core/subdev/pwr/fuc/os.h     |  4 ++--
 drivers/gpu/drm/nouveau/core/subdev/pwr/memx.c       | 20 ++++++++++++++++++--
 5 files changed, 38 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/core/include/subdev/pwr.h b/drivers/gpu/drm/nouveau/core/include/subdev/pwr.h
index b5286b3..94f8629 100644
--- a/drivers/gpu/drm/nouveau/core/include/subdev/pwr.h
+++ b/drivers/gpu/drm/nouveau/core/include/subdev/pwr.h
@@ -77,5 +77,7 @@ void nouveau_memx_wait(struct nouveau_memx *,
 		       u32 addr, u32 mask, u32 data, u32 nsec);
 void nouveau_memx_nsec(struct nouveau_memx *, u32 nsec);
 void nouveau_memx_wait_vblank(struct nouveau_memx *);
+void nouveau_memx_fb_disable(struct nouveau_memx *);
+void nouveau_memx_fb_enable(struct nouveau_memx *);
 
 #endif
diff --git a/drivers/gpu/drm/nouveau/core/subdev/fb/ramfuc.h b/drivers/gpu/drm/nouveau/core/subdev/fb/ramfuc.h
index 76290bb..430261a 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/fb/ramfuc.h
+++ b/drivers/gpu/drm/nouveau/core/subdev/fb/ramfuc.h
@@ -111,6 +111,18 @@ ramfuc_wait_vblank(struct ramfuc *ram)
 	nouveau_memx_wait_vblank(ram->memx);
 }
 
+static inline void
+ramfuc_fb_disable(struct ramfuc *ram)
+{
+	nouveau_memx_fb_disable(ram->memx);
+}
+
+static inline void
+ramfuc_fb_enable(struct ramfuc *ram)
+{
+	nouveau_memx_fb_enable(ram->memx);
+}
+
 #define ram_init(s,p)        ramfuc_init(&(s)->base, (p))
 #define ram_exec(s,e)        ramfuc_exec(&(s)->base, (e))
 #define ram_have(s,r)        ((s)->r_##r.addr[0] != 0x000000)
@@ -121,5 +133,7 @@ ramfuc_wait_vblank(struct ramfuc *ram)
 #define ram_wait(s,r,m,d,n)  ramfuc_wait(&(s)->base, (r), (m), (d), (n))
 #define ram_nsec(s,n)        ramfuc_nsec(&(s)->base, (n))
 #define ram_wait_vblank(s)   ramfuc_wait_vblank(&(s)->base)
+#define ram_fb_disable(s)    ramfuc_fb_disable(&(s)->base)
+#define ram_fb_enable(s)     ramfuc_fb_enable(&(s)->base)
 
 #endif
diff --git a/drivers/gpu/drm/nouveau/core/subdev/pwr/fuc/memx.fuc b/drivers/gpu/drm/nouveau/core/subdev/pwr/fuc/memx.fuc
index 228ee0d..9f2f57c 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/pwr/fuc/memx.fuc
+++ b/drivers/gpu/drm/nouveau/core/subdev/pwr/fuc/memx.fuc
@@ -43,9 +43,9 @@ process(PROC_MEMX, #memx_init, #memx_recv)
 */	.b32 func
 
 memx_func_head:
-handler(ENTER , 0x0000, 0x0000, #memx_func_enter)
+handler(FB_OFF, 0x0000, 0x0000, #memx_func_enter)
 memx_func_next:
-handler(LEAVE , 0x0000, 0x0000, #memx_func_leave)
+handler(FB_ON , 0x0000, 0x0000, #memx_func_leave)
 handler(WR32  , 0x0000, 0x0002, #memx_func_wr32)
 handler(WAIT  , 0x0004, 0x0000, #memx_func_wait)
 handler(DELAY , 0x0001, 0x0000, #memx_func_delay)
diff --git a/drivers/gpu/drm/nouveau/core/subdev/pwr/fuc/os.h b/drivers/gpu/drm/nouveau/core/subdev/pwr/fuc/os.h
index 80f8328..50f9a38 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/pwr/fuc/os.h
+++ b/drivers/gpu/drm/nouveau/core/subdev/pwr/fuc/os.h
@@ -19,8 +19,8 @@
 #define MEMX_MSG_EXEC 1
 
 /* MEMX: script opcode definitions */
-#define MEMX_ENTER  0
-#define MEMX_LEAVE  1
+#define MEMX_FB_OFF 0
+#define MEMX_FB_ON  1
 #define MEMX_WR32   2
 #define MEMX_WAIT   3
 #define MEMX_DELAY  4
diff --git a/drivers/gpu/drm/nouveau/core/subdev/pwr/memx.c b/drivers/gpu/drm/nouveau/core/subdev/pwr/memx.c
index bcdc00f..060bbd2 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/pwr/memx.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/pwr/memx.c
@@ -63,7 +63,6 @@ nouveau_memx_init(struct nouveau_pwr *ppwr, struct nouveau_memx **pmemx)
 		nv_wr32(ppwr, 0x10a580, 0x00000003);
 	} while (nv_rd32(ppwr, 0x10a580) != 0x00000003);
 	nv_wr32(ppwr, 0x10a1c0, 0x01000000 | memx->base);
-	nv_wr32(ppwr, 0x10a1c4, 0x00010000 | MEMX_ENTER);
 
 	return 0;
 }
@@ -79,7 +78,6 @@ nouveau_memx_fini(struct nouveau_memx **pmemx, bool exec)
 	memx_out(memx);
 
 	/* release data segment access */
-	nv_wr32(ppwr, 0x10a1c4, 0x00000000 | MEMX_LEAVE);
 	finish = nv_rd32(ppwr, 0x10a1c0) & 0x00ffffff;
 	nv_wr32(ppwr, 0x10a580, 0x00000000);
 
@@ -151,4 +149,22 @@ nouveau_memx_wait_vblank(struct nouveau_memx *memx)
 	memx_out(memx); /* fuc can't handle multiple */
 }
 
+void
+nouveau_memx_fb_disable(struct nouveau_memx *memx)
+{
+	struct nouveau_pwr *ppwr = memx->ppwr;
+
+	nv_debug(memx->ppwr, "   FB OFF\n");
+	nv_wr32(ppwr, 0x10a1c4, MEMX_FB_OFF);
+}
+
+void
+nouveau_memx_fb_enable(struct nouveau_memx *memx)
+{
+	struct nouveau_pwr *ppwr = memx->ppwr;
+
+	nv_debug(memx->ppwr, "   FB  ON\n");
+	nv_wr32(ppwr, 0x10a1c4, MEMX_FB_ON);
+}
+
 #endif
-- 
1.9.3
