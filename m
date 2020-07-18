From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH 2/2] present: don't enable if there's no
 acceleration
Date: Sat, 18 Jul 2020 18:53:19 -0400
Message-ID: <20200718225319.27884-2-imirkin@alum.mit.edu>
References: <20200718225319.27884-1-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20200718225319.27884-1-imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

All the present logic relies on EXA being used to wrap everything.
Unclear if present could even be used without the other things EXA
enables, but better be safe.

Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
---
 src/nv_driver.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/nv_driver.c b/src/nv_driver.c
index a63674c..e72a6b6 100644
--- a/src/nv_driver.c
+++ b/src/nv_driver.c
@@ -1489,7 +1489,7 @@ NVScreenInit(SCREEN_INIT_ARGS_DECL)
 
 	xf86SetBlackWhitePixels(pScreen);
 
-	if (nouveau_present_init(pScreen))
+	if (pNv->AccelMethod == EXA && nouveau_present_init(pScreen))
 		xf86DrvMsg(pScrn->scrnIndex, X_INFO,
 			   "Hardware support for Present enabled\n");
 	else
-- 
2.26.2
