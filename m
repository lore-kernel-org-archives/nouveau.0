From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] nouveau: fix nouveau_fence leak
Date: Wed, 7 Sep 2011 01:08:35 +0200
Message-ID: <20110906230835.GC7555@joi.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


Note: This is a candidate for the 7.11 branch.
---
 src/gallium/drivers/nouveau/nouveau_fence.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/src/gallium/drivers/nouveau/nouveau_fence.c b/src/gallium/drivers/nouveau/nouveau_fence.c
index d8f59dc..ea2038c 100644
--- a/src/gallium/drivers/nouveau/nouveau_fence.c
+++ b/src/gallium/drivers/nouveau/nouveau_fence.c
@@ -219,5 +219,7 @@ nouveau_fence_next(struct nouveau_screen *screen)
    if (screen->fence.current->state < NOUVEAU_FENCE_STATE_EMITTED)
       nouveau_fence_emit(screen->fence.current);
 
+   nouveau_fence_ref(NULL, &screen->fence.current);
+
    nouveau_fence_new(screen, &screen->fence.current, FALSE);
 }
-- 
1.7.6.1
