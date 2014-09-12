From: Roy Spliet <rspliet-pPYjZ15w/Xhulxpn9UvDqw@public.gmane.org>
Subject: [PATCH 4/6] fb/ramfuc: Support strided regs
Date: Fri, 12 Sep 2014 18:00:15 +0200
Message-ID: <1410537617-8269-5-git-send-email-rspliet@eclipso.eu>
References: <1410537617-8269-1-git-send-email-rspliet@eclipso.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1410537617-8269-1-git-send-email-rspliet-pPYjZ15w/Xhulxpn9UvDqw@public.gmane.org>
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

Signed-off-by: Roy Spliet <rspliet-pPYjZ15w/Xhulxpn9UvDqw@public.gmane.org>
---
 drivers/gpu/drm/nouveau/core/subdev/fb/ramfuc.h  | 45 +++++++++++++++++++-----
 drivers/gpu/drm/nouveau/core/subdev/fb/ramnve0.c |  2 +-
 2 files changed, 38 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/core/subdev/fb/ramfuc.h b/drivers/gpu/drm/nouveau/core/subdev/fb/ramfuc.h
index 6ae560a..d1fbbe4 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/fb/ramfuc.h
+++ b/drivers/gpu/drm/nouveau/core/subdev/fb/ramfuc.h
@@ -12,16 +12,32 @@ struct ramfuc {
 struct ramfuc_reg {
 	int sequence;
 	bool force;
-	u32 addr[2];
+	u32 addr;
+	u32 stride; /* in bytes */
+	u32 mask;
 	u32 data;
 };
 
 static inline struct ramfuc_reg
+ramfuc_stride(u32 addr, u32 stride, u32 mask)
+{
+	return (struct ramfuc_reg) {
+		.sequence = 0,
+		.addr = addr,
+		.stride = stride,
+		.mask = mask,
+		.data = 0xdeadbeef,
+	};
+}
+
+static inline struct ramfuc_reg
 ramfuc_reg2(u32 addr1, u32 addr2)
 {
 	return (struct ramfuc_reg) {
 		.sequence = 0,
-		.addr = { addr1, addr2 },
+		.addr = addr1,
+		.stride = addr2 - addr1,
+		.mask = 0x3,
 		.data = 0xdeadbeef,
 	};
 }
@@ -29,7 +45,13 @@ ramfuc_reg2(u32 addr1, u32 addr2)
 static noinline struct ramfuc_reg
 ramfuc_reg(u32 addr)
 {
-	return ramfuc_reg2(addr, addr);
+	return (struct ramfuc_reg) {
+		.sequence = 0,
+		.addr = addr,
+		.stride = 0,
+		.mask = 0x1,
+		.data = 0xdeadbeef,
+	};
 }
 
 static inline int
@@ -62,18 +84,25 @@ static inline u32
 ramfuc_rd32(struct ramfuc *ram, struct ramfuc_reg *reg)
 {
 	if (reg->sequence != ram->sequence)
-		reg->data = nv_rd32(ram->pfb, reg->addr[0]);
+		reg->data = nv_rd32(ram->pfb, reg->addr);
 	return reg->data;
 }
 
 static inline void
 ramfuc_wr32(struct ramfuc *ram, struct ramfuc_reg *reg, u32 data)
 {
+	unsigned int mask, off = 0;
+
 	reg->sequence = ram->sequence;
 	reg->data = data;
-	if (reg->addr[0] != reg->addr[1])
-		nouveau_memx_wr32(ram->memx, reg->addr[1], reg->data);
-	nouveau_memx_wr32(ram->memx, reg->addr[0], reg->data);
+
+	for (mask = reg->mask; mask > 0; mask = (mask & ~1) >> 1) {
+		if (mask & 1) {
+			nouveau_memx_wr32(ram->memx, reg->addr+off, reg->data);
+		}
+
+		off += reg->stride;
+	}
 }
 
 static inline void
@@ -125,7 +154,7 @@ ramfuc_unblock(struct ramfuc *ram)
 
 #define ram_init(s,p)        ramfuc_init(&(s)->base, (p))
 #define ram_exec(s,e)        ramfuc_exec(&(s)->base, (e))
-#define ram_have(s,r)        ((s)->r_##r.addr[0] != 0x000000)
+#define ram_have(s,r)        ((s)->r_##r.addr != 0x000000)
 #define ram_rd32(s,r)        ramfuc_rd32(&(s)->base, &(s)->r_##r)
 #define ram_wr32(s,r,d)      ramfuc_wr32(&(s)->base, &(s)->r_##r, (d))
 #define ram_nuke(s,r)        ramfuc_nuke(&(s)->base, &(s)->r_##r)
diff --git a/drivers/gpu/drm/nouveau/core/subdev/fb/ramnve0.c b/drivers/gpu/drm/nouveau/core/subdev/fb/ramnve0.c
index 76de882..d4842f3 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/fb/ramnve0.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/fb/ramnve0.c
@@ -241,7 +241,7 @@ nve0_ram_nuts(struct nve0_ram *ram, struct ramfuc_reg *reg,
 {
 	struct nve0_fb_priv *priv = (void *)nouveau_fb(ram);
 	struct ramfuc *fuc = &ram->fuc.base;
-	u32 addr = 0x110000 + (reg->addr[0] & 0xfff);
+	u32 addr = 0x110000 + (reg->addr & 0xfff);
 	u32 mask = _mask | _copy;
 	u32 data = (_data & _mask) | (reg->data & _copy);
 	u32 i;
-- 
1.9.3
