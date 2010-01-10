From: Luca Barbieri <luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org>
Subject: [PATCH] drm/nouveau: Check pushbuffer bounds in system
	call
Date: Sun, 10 Jan 2010 20:10:53 +0100
Message-ID: <1263150653-29325-1-git-send-email-luca@luca-barbieri.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: Luca Barbieri <luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Currently there is no check that the pushbuffer request bounds are inside
the TTM BO.

This allows to instruct the kernel to do relocations on user-selected
addresses, since the relocation bounds checking relies on the request
bounds.

This can oops the kernel accidentally and is easily exploitable.

This patch adds bound checking and alignment checking for ->offset and
->nr_dwords.

It also makes some variables unsigned, which should have no effect,
but prevents possible bounds checking problems.

Signed-off-by: Luca Barbieri <luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_gem.c |   19 ++++++++++++++++---
 1 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
index 2009db2..c599dea 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
@@ -466,13 +466,14 @@ u_memcpya(uint64_t user, unsigned nmemb, unsigned size)
 static int
 nouveau_gem_pushbuf_reloc_apply(struct nouveau_channel *chan, int nr_bo,
 				struct drm_nouveau_gem_pushbuf_bo *bo,
-				int nr_relocs, uint64_t ptr_relocs,
-				int nr_dwords, int first_dword,
+				unsigned nr_relocs, uint64_t ptr_relocs,
+				unsigned nr_dwords, unsigned first_dword,
 				uint32_t *pushbuf, bool is_iomem)
 {
 	struct drm_nouveau_gem_pushbuf_reloc *reloc = NULL;
 	struct drm_device *dev = chan->dev;
-	int ret = 0, i;
+	int ret = 0;
+	unsigned i;
 
 	reloc = u_memcpya(ptr_relocs, nr_relocs, sizeof(*reloc));
 	if (IS_ERR(reloc))
@@ -667,6 +668,18 @@ nouveau_gem_ioctl_pushbuf_call(struct drm_device *dev, void *data,
 	}
 	pbbo = nouveau_gem_object(gem);
 
+	if((req->offset & 3)
+		|| req->nr_dwords < 2
+		|| (unsigned long)req->offset > (unsigned long)pbbo->bo.mem.size
+		|| (unsigned long)req->nr_dwords
+			> ((unsigned long)(pbbo->bo.mem.size - req->offset ) >> 2)
+		)
+	{
+		NV_ERROR(dev, "pb call is misaligned or out of bo bounds: %d + %d * 4 > %ld\n", req->offset, req->nr_dwords, pbbo->bo.mem.size);
+		ret = -EFAULT;
+		goto out;
+	}
+
 	ret = ttm_bo_reserve(&pbbo->bo, false, false, true,
 			     chan->fence.sequence);
 	if (ret) {
-- 
1.6.3.3
