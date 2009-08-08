From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: [PATCH 7/7] drm/nouveau: fix and verify __user pointer
	casts
Date: Sat,  8 Aug 2009 10:39:02 +0300
Message-ID: <1249717142-6302-7-git-send-email-pq@iki.fi>
References: <1249717142-6302-1-git-send-email-pq@iki.fi>
	<1249717142-6302-2-git-send-email-pq@iki.fi>
	<1249717142-6302-3-git-send-email-pq@iki.fi>
	<1249717142-6302-4-git-send-email-pq@iki.fi>
	<1249717142-6302-5-git-send-email-pq@iki.fi>
	<1249717142-6302-6-git-send-email-pq@iki.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1249717142-6302-6-git-send-email-pq-X3B1VOXEql0@public.gmane.org>
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
List-Id: nouveau.vger.kernel.org

On 32-bit arch this fixes compiler warnings about casting an integer of
different size to a pointer.

This also fixes sparse warnings about casting address spaces.

Signed-off-by: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_gem.c |   13 ++++++++-----
 1 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
index 4717ced..0dcf391 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
@@ -271,11 +271,13 @@ static int
 nouveau_gem_pushbuf_validate(struct nouveau_channel *chan,
 			     struct drm_file *file_priv,
 			     struct drm_nouveau_gem_pushbuf_bo *pbbo,
-			     uint64_t user_bo, int nr_buffers,
+			     uint64_t user_buffers, int nr_buffers,
 			     struct list_head *list, int *apply_relocs)
 {
 	struct drm_device *dev = chan->dev;
 	struct drm_nouveau_gem_pushbuf_bo *b;
+	struct drm_nouveau_gem_pushbuf_bo __user *user_pbbos =
+				(void __force __user *)(uintptr_t)user_buffers;
 	struct nouveau_fence *prev_fence;
 	struct nouveau_bo *nvbo;
 	struct list_head *entry, *tmp;
@@ -358,7 +360,7 @@ retry:
 		     (nvbo->bo.mem.mem_type == TTM_PL_TT &&
 		      b->presumed_domain & NOUVEAU_GEM_DOMAIN_GART))) {
 			b++;
-			user_bo += sizeof(*b);
+			user_pbbos++;
 			continue;
 		}
 
@@ -371,13 +373,13 @@ retry:
 		if (apply_relocs)
 			(*apply_relocs)++;
 
-		if (copy_to_user((void __user *)user_bo, b, sizeof(*b))) {
+		if (copy_to_user(user_pbbos, b, sizeof(*b))) {
 			ret = -EFAULT;
 			goto out_unref;
 		}
 
 		b++;
-		user_bo += sizeof(*b);
+		user_pbbos++;
 	}
 
 out_unref:
@@ -438,12 +440,13 @@ static inline void *
 u_memcpya(uint64_t user, unsigned nmemb, unsigned size)
 {
 	void *mem;
+	void __user *userptr = (void __force __user *)(uintptr_t)user;
 
 	mem = kmalloc(nmemb * size, GFP_KERNEL);
 	if (!mem)
 		return ERR_PTR(-ENOMEM);
 
-	if (copy_from_user(mem, (void __user *)user, nmemb * size)) {
+	if (copy_from_user(mem, userptr, nmemb * size)) {
 		kfree(mem);
 		return ERR_PTR(-EFAULT);
 	}
-- 
1.6.3.3
