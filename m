From: Jeremy Cline <jcline-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [RFC PATCH v2 1/3] drm/nouveau/kms/nvd9-: Introduce some
 kernel-docs for CRC support
Date: Tue,  6 Oct 2020 17:13:11 -0400
Message-ID: <20201006211313.49177-2-jcline@redhat.com>
References: <20200911162128.405604-1-jcline@redhat.com>
 <20201006211313.49177-1-jcline@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20201006211313.49177-1-jcline-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

This is not complete documentation, but covers the pieces I read through
while reviewing the IGT CRC tests for nouveau. It covers the
nouveau-specific debugfs file, an overview of why the code is more
complicated than the DRM display CRC support documentation would lead
one to expect, and the nv50_crc_func vtable. Many of the details were
gleaned from Lyude's commit message, but I think it's valuable to have
them with the code rather than in the change log.

The rendered documentation of the functions in nv50_crc_func aren't as
nice as I'd like, but from what I can tell it would require creating a
typedef for each function with proper argument/return value docs.

Cc: Lyude Paul <lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Jeremy Cline <jcline-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/nouveau/dispnv50/crc.c |  8 ++++
 drivers/gpu/drm/nouveau/dispnv50/crc.h | 65 ++++++++++++++++++++++++++
 2 files changed, 73 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/crc.c b/drivers/gpu/drm/nouveau/dispnv50/crc.c
index b8c31b697797..84df41e8fb05 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/crc.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/crc.c
@@ -699,6 +699,14 @@ nv50_crc_debugfs_flip_threshold_set(struct file *file,
 	return ret;
 }
 
+/**
+ * DOC: nv_crc/flip_threshold
+ *
+ * The number of CRC entries to place in a :term:`CRC notifier context` before
+ * attempting to flip to the other notifier context. Writing ``-1`` to this file
+ * will reset the threshold to the default value, which is hardware-dependent.
+ * Values cannot be greater than the default or less than ``-1``.
+ */
 static const struct file_operations nv50_crc_flip_threshold_fops = {
 	.owner = THIS_MODULE,
 	.open = nv50_crc_debugfs_flip_threshold_open,
diff --git a/drivers/gpu/drm/nouveau/dispnv50/crc.h b/drivers/gpu/drm/nouveau/dispnv50/crc.h
index 4fce871b04c8..04ebb1f936db 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/crc.h
+++ b/drivers/gpu/drm/nouveau/dispnv50/crc.h
@@ -10,6 +10,24 @@
 #include <nvkm/subdev/bios.h>
 #include "nouveau_encoder.h"
 
+/**
+ * DOC: Overview
+ *
+ * This interface is designed to aid in the implementation of the standard DRM
+ * CRC interface that is part of :doc:`drm-uapi`. NVIDIA's hardware has a
+ * peculiar CRC implementation that limits the number of CRCs that can be
+ * captured, which breaks the DRM API's expectations.
+ *
+ * CRCs are reported to a :term:`CRC notifier context` of limited size. Once the
+ * context fills, an overflow bit is set and no further CRCs are reported. To
+ * work around this, the driver flips between notifier contexts to allow users
+ * to capture an arbitrary number of CRCs.
+ *
+ * .. warning:: The flip requires flushing two separate updates on the
+ *     :term:`EVO/NVD` channel, and this results in the unavoidable loss of a single
+ *     frame's CRC.
+ */
+
 struct nv50_atom;
 struct nv50_disp;
 struct nv50_head;
@@ -49,16 +67,63 @@ struct nv50_crc_atom {
 	u8 wndw : 4;
 };
 
+/**
+ * struct nv50_crc_func - Functions and data for CRC support
+ *
+ * The interface used to abstract CRC support across card families that support
+ * it.
+ */
 struct nv50_crc_func {
+	/**
+	 * @set_src: Program the hardware to capture CRCs from the given
+	 * &enum nv50_crc_source_type. Using NULL for the source and ctx will
+	 * disable CRC for the given &struct nv50_head.
+	 *
+	 * Return 0 on success, or a negative error code.
+	 */
 	int (*set_src)(struct nv50_head *, int or, enum nv50_crc_source_type,
 		       struct nv50_crc_notifier_ctx *, u32 wndw);
+
+	/**
+	 * @set_ctx: Change the &struct nv50_crc_notifier_ctx used to capture
+	 * CRC entries. Providing a NULL context will remove any existing
+	 * context.
+	 *
+	 * Return 0 on success, or a negative error code.
+	 */
 	int (*set_ctx)(struct nv50_head *, struct nv50_crc_notifier_ctx *);
+
+	/**
+	 * @get_entry: Read the CRC entry at the given index. idx is guaranteed
+	 * to be less than @num_entries so implementations do not need to
+	 * perform a bounds check.
+	 *
+	 * Return the CRC or 0 if there is no CRC for the given index.
+	 */
 	u32 (*get_entry)(struct nv50_head *, struct nv50_crc_notifier_ctx *,
 			 enum nv50_crc_source, int idx);
+
+	/**
+	 * @ctx_finished: Return true when all requested CRCs have been written
+	 * and it is safe to read them.
+	 */
 	bool (*ctx_finished)(struct nv50_head *,
 			     struct nv50_crc_notifier_ctx *);
+
+	/**
+	 * @flip_threshold: The default number of CRC entries at which point the
+	 * notifier context should be flipped. This should be set somewhat lower
+	 * than @num_entries. It is configurable from userspace via DebugFS.
+	 */
 	short flip_threshold;
+
+	/**
+	 * @num_entries: The maximum number of entries supported in the
+	 * notifier context.
+	 */
 	short num_entries;
+
+	/** @notifier_len: The size of the notifier context in bytes. */
 	size_t notifier_len;
 };
 
-- 
2.28.0
