From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: Re: [PATCH] drm/nouveau: fix ref leak in
 nouveau_gem_pushbuf_validate()
Date: Tue, 8 Sep 2009 00:19:10 +0300
Message-ID: <20090908001910.1164e8f1@daedalus.pq.iki.fi>
References: <1252354165-5109-1-git-send-email-pq@iki.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1252354165-5109-1-git-send-email-pq-X3B1VOXEql0@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

From ee49e66551a28550b69a1a0fc7f45ec2ab24c295 Mon Sep 17 00:00:00 2001
From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Date: Tue, 8 Sep 2009 00:05:24 +0300
Subject: [PATCH] drm/nouveau: do not call ttm_bo_wait_unreserved()

In nouveau_gem_puhsbuf_validate() path, ttm_bo_reserve() already calls
ttm_bo_wait_unreserved() internally. Calling it again is not only racy
and needless, but it makes the X process hang in uninterruptible sleep.

Remove the call to ttm_bo_wait_unreserved() from
nouveau_gem_pushbuf_validate().

Signed-off-by: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
---

NOTE!

This is a tentative patch, I didn't even have the time to compile-test it.
On top of the previous.

 drivers/gpu/drm/nouveau/nouveau_gem.c |   17 ++++++-----------
 1 files changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
index 55e7988..b339de2 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
@@ -286,19 +286,14 @@ nouveau_gem_pushbuf_lookup_and_reserve(struct nouveau_channel *chan,
 
 	ret = ttm_bo_reserve(&nvbo->bo, false, false, true,
 			     chan->fence.sequence);
-	switch (ret) {
-	case 0:
-		*bop = nvbo;
-		return 0;
-	case -EAGAIN:
-		ret = ttm_bo_wait_unreserved(&nvbo->bo, false);
-		if (ret == 0)
-			ret = -EAGAIN;
-		/* fall through */
-	default:
+
+	if (ret) {
 		drm_gem_object_unreference(gem);
+		return ret;
 	}
-	return ret;
+
+	*bop = nvbo;
+	return 0;
 }
 
 static int
-- 
1.6.3.3
