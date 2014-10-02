From: Roy Spliet <rspliet-pPYjZ15w/Xhulxpn9UvDqw@public.gmane.org>
Subject: [PATCH 9/9] pwr/fuc: Fix thinko in nouveau_memx_wait()
Date: Thu,  2 Oct 2014 18:01:58 +0200
Message-ID: <1412265718-1215-10-git-send-email-rspliet@eclipso.eu>
References: <1412011639-3210-1-git-send-email-rspliet@eclipso.eu>
 <1412265718-1215-1-git-send-email-rspliet@eclipso.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1412265718-1215-1-git-send-email-rspliet-pPYjZ15w/Xhulxpn9UvDqw@public.gmane.org>
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

---
 drivers/gpu/drm/nouveau/core/subdev/pwr/memx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/core/subdev/pwr/memx.c b/drivers/gpu/drm/nouveau/core/subdev/pwr/memx.c
index f6ce39d..7a9299d 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/pwr/memx.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/pwr/memx.c
@@ -107,7 +107,7 @@ nouveau_memx_wait(struct nouveau_memx *memx,
 {
 	nv_debug(memx->ppwr, "R[%06x] & 0x%08x == 0x%08x, %d us\n",
 				addr, mask, data, nsec);
-	memx_cmd(memx, MEMX_WAIT, 4, (u32[]){ addr, ~mask, data, nsec });
+	memx_cmd(memx, MEMX_WAIT, 4, (u32[]){ addr, mask, data, nsec });
 	memx_out(memx); /* fuc can't handle multiple */
 }
 
-- 
1.9.3
