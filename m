From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: [PATCH 5/7] drm/nouveau: use PTR_ERR instead of a cast
Date: Sat,  8 Aug 2009 10:39:00 +0300
Message-ID: <1249717142-6302-5-git-send-email-pq@iki.fi>
References: <1249717142-6302-1-git-send-email-pq@iki.fi>
	<1249717142-6302-2-git-send-email-pq@iki.fi>
	<1249717142-6302-3-git-send-email-pq@iki.fi>
	<1249717142-6302-4-git-send-email-pq@iki.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1249717142-6302-4-git-send-email-pq-X3B1VOXEql0@public.gmane.org>
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

A small cleanup in using the ERR_PTR API.

Signed-off-by: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_gem.c |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
index 670348b..bbef95d 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
@@ -482,19 +482,19 @@ nouveau_gem_ioctl_pushbuf(struct drm_device *dev, void *data,
 
 	pushbuf = u_memcpya(req->dwords, req->nr_dwords, sizeof(uint32_t));
 	if (IS_ERR(pushbuf))
-		return (unsigned long)pushbuf;
+		return PTR_ERR(pushbuf);
 
 	bo = u_memcpya(req->buffers, req->nr_buffers, sizeof(*bo));
 	if (IS_ERR(bo)) {
 		kfree(pushbuf);
-		return (unsigned long)bo;
+		return PTR_ERR(bo);
 	}
 
 	reloc = u_memcpya(req->relocs, req->nr_relocs, sizeof(*reloc));
 	if (IS_ERR(reloc)) {
 		kfree(bo);
 		kfree(pushbuf);
-		return (unsigned long)reloc;
+		return PTR_ERR(reloc);
 	}
 
 	mutex_lock(&dev->struct_mutex);
-- 
1.6.3.3
