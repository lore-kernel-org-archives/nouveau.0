From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: [PATCH 2/2] drm/nouveau: Don't reuse the same variable in
	a nested loop.
Date: Fri, 19 Feb 2010 04:59:10 +0100
Message-ID: <1266551950-5766-2-git-send-email-currojerez@riseup.net>
References: <1266551950-5766-1-git-send-email-currojerez@riseup.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1266551950-5766-1-git-send-email-currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
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
Cc: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Signed-off-by: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_gem.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
index ec6da5c..173d5e2 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
@@ -578,7 +578,7 @@ nouveau_gem_ioctl_pushbuf(struct drm_device *dev, void *data,
 	struct nouveau_channel *chan;
 	struct validate_op op;
 	struct nouveau_fence *fence = 0;
-	int i, ret = 0, do_reloc = 0;
+	int i, j, ret = 0, do_reloc = 0;
 
 	NOUVEAU_CHECK_INITIALISED_WITH_RETURN;
 	NOUVEAU_GET_USER_CHANNEL_WITH_RETURN(req->channel, file_priv, chan);
@@ -700,7 +700,7 @@ nouveau_gem_ioctl_pushbuf(struct drm_device *dev, void *data,
 			OUT_RING(chan, ((mem->start << PAGE_SHIFT) +
 					push[i].offset) | 0x20000000);
 			OUT_RING(chan, 0);
-			for (i = 0; i < NOUVEAU_DMA_SKIPS; i++)
+			for (j = 0; j < NOUVEAU_DMA_SKIPS; j++)
 				OUT_RING(chan, 0);
 		}
 	}
-- 
1.6.4.4
