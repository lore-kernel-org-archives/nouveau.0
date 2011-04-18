From: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] drm/nouveau: Rename bit_table()
Date: Mon, 18 Apr 2011 02:29:42 +0100
Message-ID: <1303090182-5218-1-git-send-email-emil.l.velikov@gmail.com>
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

Rename bit_table() to find_bit_table() to make the
if easier on the eyes, as well as to remove duplication
i.e. existing struct already has the same name

Signed-off-by: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_bios.c |    4 ++--
 drivers/gpu/drm/nouveau/nouveau_bios.h |    2 +-
 drivers/gpu/drm/nouveau/nouveau_mem.c  |    2 +-
 drivers/gpu/drm/nouveau/nouveau_perf.c |    2 +-
 drivers/gpu/drm/nouveau/nouveau_temp.c |    2 +-
 drivers/gpu/drm/nouveau/nouveau_volt.c |    2 +-
 drivers/gpu/drm/nouveau/nv50_pm.c      |    2 +-
 7 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bios.c b/drivers/gpu/drm/nouveau/nouveau_bios.c
index 8486dc6..9cb09ee 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bios.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bios.c
@@ -5493,7 +5493,7 @@ struct bit_table {
 #define BIT_TABLE(id, funcid) ((struct bit_table){ id, parse_bit_##funcid##_tbl_entry })
 
 int
-bit_table(struct drm_device *dev, u8 id, struct bit_entry *bit)
+find_bit_table(struct drm_device *dev, u8 id, struct bit_entry *bit)
 {
 	struct drm_nouveau_private *dev_priv = dev->dev_private;
 	struct nvbios *bios = &dev_priv->vbios;
@@ -5524,7 +5524,7 @@ parse_bit_table(struct nvbios *bios, const uint16_t bitoffset,
 	struct drm_device *dev = bios->dev;
 	struct bit_entry bitentry;
 
-	if (bit_table(dev, table->id, &bitentry) == 0)
+	if (find_bit_table(dev, table->id, &bitentry) == 0)
 		return table->parse_fn(dev, bios, &bitentry);
 
 	NV_INFO(dev, "BIT table '%c' not found\n", table->id);
diff --git a/drivers/gpu/drm/nouveau/nouveau_bios.h b/drivers/gpu/drm/nouveau/nouveau_bios.h
index 8a54fa7..2516ac4 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bios.h
+++ b/drivers/gpu/drm/nouveau/nouveau_bios.h
@@ -46,7 +46,7 @@ struct bit_entry {
 	uint8_t *data;
 };
 
-int bit_table(struct drm_device *, u8 id, struct bit_entry *);
+int find_bit_table(struct drm_device *, u8 id, struct bit_entry *);
 
 struct dcb_i2c_entry {
 	uint32_t entry;
diff --git a/drivers/gpu/drm/nouveau/nouveau_mem.c b/drivers/gpu/drm/nouveau/nouveau_mem.c
index ce3cb5e..b424218 100644
--- a/drivers/gpu/drm/nouveau/nouveau_mem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_mem.c
@@ -557,7 +557,7 @@ nouveau_mem_timing_init(struct drm_device *dev)
 	int i, recordlen, entries;
 
 	if (bios->type == NVBIOS_BIT) {
-		if (bit_table(dev, 'P', &P))
+		if (find_bit_table(dev, 'P', &P))
 			return;
 
 		if (P.version == 1)
diff --git a/drivers/gpu/drm/nouveau/nouveau_perf.c b/drivers/gpu/drm/nouveau/nouveau_perf.c
index 670e3cb..0457ae7 100644
--- a/drivers/gpu/drm/nouveau/nouveau_perf.c
+++ b/drivers/gpu/drm/nouveau/nouveau_perf.c
@@ -84,7 +84,7 @@ nouveau_perf_init(struct drm_device *dev)
 	int vid, i;
 
 	if (bios->type == NVBIOS_BIT) {
-		if (bit_table(dev, 'P', &P))
+		if (find_bit_table(dev, 'P', &P))
 			return;
 
 		if (P.version != 1 && P.version != 2) {
diff --git a/drivers/gpu/drm/nouveau/nouveau_temp.c b/drivers/gpu/drm/nouveau/nouveau_temp.c
index 649b041..db6a091 100644
--- a/drivers/gpu/drm/nouveau/nouveau_temp.c
+++ b/drivers/gpu/drm/nouveau/nouveau_temp.c
@@ -284,7 +284,7 @@ nouveau_temp_init(struct drm_device *dev)
 	u8 *temp = NULL;
 
 	if (bios->type == NVBIOS_BIT) {
-		if (bit_table(dev, 'P', &P))
+		if (find_bit_table(dev, 'P', &P))
 			return;
 
 		if (P.version == 1)
diff --git a/drivers/gpu/drm/nouveau/nouveau_volt.c b/drivers/gpu/drm/nouveau/nouveau_volt.c
index 75e8727..49b100d 100644
--- a/drivers/gpu/drm/nouveau/nouveau_volt.c
+++ b/drivers/gpu/drm/nouveau/nouveau_volt.c
@@ -113,7 +113,7 @@ nouveau_volt_init(struct drm_device *dev)
 	int i, headerlen, recordlen, entries, vidmask, vidshift;
 
 	if (bios->type == NVBIOS_BIT) {
-		if (bit_table(dev, 'P', &P))
+		if (find_bit_table(dev, 'P', &P))
 			return;
 
 		if (P.version == 1)
diff --git a/drivers/gpu/drm/nouveau/nv50_pm.c b/drivers/gpu/drm/nouveau/nv50_pm.c
index 8a28100..424361e 100644
--- a/drivers/gpu/drm/nouveau/nv50_pm.c
+++ b/drivers/gpu/drm/nouveau/nv50_pm.c
@@ -111,7 +111,7 @@ nv50_pm_clock_set(struct drm_device *dev, void *pre_state)
 	int P = state->P;
 
 	if (state->type == PLL_MEMORY && perflvl->memscript &&
-	    bit_table(dev, 'M', &BIT_M) == 0 &&
+	    find_bit_table(dev, 'M', &BIT_M) == 0 &&
 	    BIT_M.version == 1 && BIT_M.length >= 0x0b) {
 		script = ROM16(BIT_M.data[0x05]);
 		if (script)
-- 
1.7.1
