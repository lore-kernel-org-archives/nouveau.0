From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] drm/nouveau: improve reporting of fifo errors
Date: Thu, 20 Dec 2012 23:37:14 +0100
Message-ID: <1356043034-25739-7-git-send-email-marcin.slusarz@gmail.com>
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
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Note: bar faults and semaphore errors were previously silently acked.

Signed-off-by: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/nouveau/core/engine/fifo/nv04.c | 142 ++++++++++++++++++++++--
 drivers/gpu/drm/nouveau/core/engine/fifo/nv04.h |   5 +-
 2 files changed, 139 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/core/engine/fifo/nv04.c b/drivers/gpu/drm/nouveau/core/engine/fifo/nv04.c
index e34ab40..9c73bc1 100644
--- a/drivers/gpu/drm/nouveau/core/engine/fifo/nv04.c
+++ b/drivers/gpu/drm/nouveau/core/engine/fifo/nv04.c
@@ -25,6 +25,7 @@
 #include <core/os.h>
 #include <core/class.h>
 #include <core/engctx.h>
+#include <core/enum.h>
 #include <core/namedb.h>
 #include <core/handle.h>
 #include <core/ramht.h>
@@ -398,6 +399,73 @@ out:
 	return handled;
 }
 
+static struct nouveau_bitfield
+nv04_cache1_pull0_bits[] = {
+	{0x00000001, "ACCESS"},
+	{0x00000010, "HASH_FAILED"},
+	{0x00000100, "DEVICE_SOFTWARE"},
+	{0x00001000, "HASH_BUSY"},
+	{0x00010000, "ACQUIRE_BUSY"},
+	{}
+};
+
+static struct nouveau_bitfield
+nv50_cache1_pull0_bits[] = {
+	{0x00000001, "ACCESS"},
+	{0x00000010, "HASH_FAILED"},
+	{0x00000100, "DEVICE_SOFTWARE"},
+	{0x00001000, "HASH_BUSY"},
+	{0x00010000, "ACQUIRE_BUSY"},
+	{0x01000000, "INVALID_ENGINE"},
+	{}
+};
+
+static const char * const
+nv11_sem_error_codes[] = {
+	"NONE", "INVALID_OPERAND", "INVALID_STATE"
+};
+
+static const char * const
+nv50_sem_error_codes[] = {
+	"NONE", "ADDRESS_UNALIGNED", "INVALID_STATE",
+	"ADDRESS_TOO_LARGE", "MEM_FAULT"
+};
+
+static void
+nv_decode_cache1_pull0(struct nouveau_device *device, u32 reg)
+{
+	const char * const *sem_error_codes;
+	int error_codes_size;
+	struct nouveau_bitfield *pull0_bits;
+	u8 sem_error;
+
+	pr_cont(" cache1_pull0 0x%08x", reg);
+
+	sem_error = (reg & 0x00F00000) >> 20;
+	reg &= ~0x00F00000;
+
+	if (device->card_type == NV_50) {
+		pull0_bits = nv50_cache1_pull0_bits;
+		sem_error_codes = nv50_sem_error_codes;
+		error_codes_size = ARRAY_SIZE(nv50_sem_error_codes);
+	} else {
+		pull0_bits = nv04_cache1_pull0_bits;
+		sem_error_codes = nv11_sem_error_codes;
+		error_codes_size = ARRAY_SIZE(nv11_sem_error_codes);
+	}
+
+	nouveau_bitfield_print(pull0_bits, reg);
+
+	if (sem_error) {
+		pr_cont(" SEMAPHORE_ERROR=");
+
+		if (sem_error < error_codes_size)
+			pr_cont("%s", sem_error_codes[sem_error]);
+		else
+			pr_cont("UNK%d", sem_error);
+	}
+}
+
 static void
 nv04_fifo_cache_error(struct nouveau_device *device,
 		struct nv04_fifo_priv *priv, u32 chid, u32 get)
@@ -423,10 +491,16 @@ nv04_fifo_cache_error(struct nouveau_device *device,
 	if (!nv04_fifo_swmthd(priv, chid, mthd, data)) {
 		const char *client_name =
 			nouveau_client_name_for_fifo_chid(&priv->base, chid);
+		u32 c1p0 = nv_rd32(priv, NV04_PFIFO_CACHE1_PULL0);
 		nv_error(priv,
-			 "CACHE_ERROR - ch %d [%s] subc %d mthd 0x%04x data 0x%08x\n",
+			 "CACHE_ERROR - ch %d [%s] subc %d mthd 0x%04x data 0x%08x",
 			 chid, client_name, (mthd >> 13) & 7, mthd & 0x1ffc,
 			 data);
+		nv_decode_cache1_pull0(device, c1p0);
+		if (c1p0 & 0x00000010) /* HASH_FAILED */
+			pr_cont(" cache1_hash 0x%08x",
+				nv_rd32(priv, NV04_PFIFO_CACHE1_HASH));
+		pr_cont("\n");
 	}
 
 	nv_wr32(priv, NV04_PFIFO_CACHE1_DMA_PUSH, 0);
@@ -496,6 +570,7 @@ nv04_fifo_intr(struct nouveau_subdev *subdev)
 	struct nouveau_device *device = nv_device(subdev);
 	struct nv04_fifo_priv *priv = (void *)subdev;
 	uint32_t status, reassign;
+	const char *client_name = NULL;
 	int cnt = 0;
 
 	reassign = nv_rd32(priv, NV03_PFIFO_CACHES) & 1;
@@ -517,9 +592,19 @@ nv04_fifo_intr(struct nouveau_subdev *subdev)
 			status &= ~NV_PFIFO_INTR_DMA_PUSHER;
 		}
 
+		if (status)
+			client_name = nouveau_client_name_for_fifo_chid(
+					&priv->base, chid);
+
 		if (status & NV_PFIFO_INTR_SEMAPHORE) {
 			uint32_t sem;
 
+			nv_error(priv, "SEM_ERROR - ch %d [%s]", chid,
+				 client_name);
+			nv_decode_cache1_pull0(device,
+					nv_rd32(priv, NV04_PFIFO_CACHE1_PULL0));
+			pr_cont("\n");
+
 			status &= ~NV_PFIFO_INTR_SEMAPHORE;
 			nv_wr32(priv, NV03_PFIFO_INTR_0,
 				NV_PFIFO_INTR_SEMAPHORE);
@@ -532,15 +617,56 @@ nv04_fifo_intr(struct nouveau_subdev *subdev)
 		}
 
 		if (device->card_type == NV_50) {
-			if (status & 0x00000010) {
-				status &= ~0x00000010;
-				nv_wr32(priv, 0x002100, 0x00000010);
+			if (status & NV50_PFIFO_INTR_BAR_FAULT) {
+				nv_error(priv, "BAR_FAULT ch %d [%s]\n",
+					 chid, client_name);
+				status &= ~NV50_PFIFO_INTR_BAR_FAULT;
+				nv_wr32(priv, 0x002100,
+					NV50_PFIFO_INTR_BAR_FAULT);
+			}
+
+			if (status & NV50_PFIFO_INTR_PEEPHOLE_FAULT) {
+				nv_error(priv, "PEEPHOLE_FAULT ch %d [%s]\n",
+					 chid, client_name);
+				status &= ~NV50_PFIFO_INTR_PEEPHOLE_FAULT;
+				nv_wr32(priv, 0x002100,
+					NV50_PFIFO_INTR_PEEPHOLE_FAULT);
+			}
+
+			if (status & NV50_PFIFO_INTR_PIO_ERROR) {
+				nv_error(priv, "PIO_ERROR ch %d [%s]\n",
+					 chid, client_name);
+				status &= ~NV50_PFIFO_INTR_PIO_ERROR;
+				nv_wr32(priv, 0x002100,
+					NV50_PFIFO_INTR_PIO_ERROR);
+			}
+		} else if (device->card_type < NV_50) {
+			if (status & NV_PFIFO_INTR_RUNOUT) {
+				nv_error(priv, "RUNOUT ch %d [%s]\n",
+					 chid, client_name);
+				status &= ~NV_PFIFO_INTR_RUNOUT;
+				nv_wr32(priv, 0x002100, NV_PFIFO_INTR_RUNOUT);
+			}
+
+			if (status & NV_PFIFO_INTR_RUNOUT_OVERFLOW) {
+				nv_error(priv, "RUNOUT_OVERFLOW ch %d [%s]\n",
+					 chid, client_name);
+				status &= ~NV_PFIFO_INTR_RUNOUT_OVERFLOW;
+				nv_wr32(priv, 0x002100,
+					NV_PFIFO_INTR_RUNOUT_OVERFLOW);
+			}
+
+			if (status & NV_PFIFO_INTR_DMA_PTE) {
+				nv_error(priv, "DMA_PTE ch %d [%s]\n",
+					 chid, client_name);
+				status &= ~NV_PFIFO_INTR_DMA_PTE;
+				nv_wr32(priv, 0x002100, NV_PFIFO_INTR_DMA_PTE);
 			}
 		}
 
 		if (status) {
-			nv_warn(priv, "unknown intr 0x%08x, ch %d\n",
-				status, chid);
+			nv_warn(priv, "unknown intr 0x%08x, ch %d [%s]\n",
+				status, chid, client_name);
 			nv_wr32(priv, NV03_PFIFO_INTR_0, status);
 			status = 0;
 		}
@@ -549,7 +675,9 @@ nv04_fifo_intr(struct nouveau_subdev *subdev)
 	}
 
 	if (status) {
-		nv_error(priv, "still angry after %d spins, halt\n", cnt);
+		nv_error(priv,
+			 "still angry after %d spins (status 0x%08x), halt\n",
+			 cnt, status);
 		nv_wr32(priv, 0x002140, 0);
 		nv_wr32(priv, 0x000140, 0);
 	}
diff --git a/drivers/gpu/drm/nouveau/core/engine/fifo/nv04.h b/drivers/gpu/drm/nouveau/core/engine/fifo/nv04.h
index 496a4b4..467e31d 100644
--- a/drivers/gpu/drm/nouveau/core/engine/fifo/nv04.h
+++ b/drivers/gpu/drm/nouveau/core/engine/fifo/nv04.h
@@ -10,9 +10,12 @@
 #define NV03_PFIFO_INTR_EN_0                               0x00002140
 #    define NV_PFIFO_INTR_CACHE_ERROR                          (1<<0)
 #    define NV_PFIFO_INTR_RUNOUT                               (1<<4)
+#    define NV50_PFIFO_INTR_BAR_FAULT                          (1<<4)
+#    define NV50_PFIFO_INTR_PEEPHOLE_FAULT                     (1<<6)
 #    define NV_PFIFO_INTR_RUNOUT_OVERFLOW                      (1<<8)
+#    define NV50_PFIFO_INTR_PIO_ERROR                          (1<<8)
 #    define NV_PFIFO_INTR_DMA_PUSHER                          (1<<12)
-#    define NV_PFIFO_INTR_DMA_PT                              (1<<16)
+#    define NV_PFIFO_INTR_DMA_PTE                             (1<<16)
 #    define NV_PFIFO_INTR_SEMAPHORE                           (1<<20)
 #    define NV_PFIFO_INTR_ACQUIRE_TIMEOUT                     (1<<24)
 #define NV03_PFIFO_RAMHT                                   0x00002210
-- 
1.8.0.2
