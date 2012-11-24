From: Daniel J Blueman <daniel-JCXMqzvhRcvYtjvyW6yDsg@public.gmane.org>
Subject: [PATCH] drm/nouveau: prevent log mangling
Date: Sat, 24 Nov 2012 10:11:46 +0800
Message-ID: <1353723106-2534-1-git-send-email-daniel@quora.org>
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
Cc: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On 3.7-rc6, add missing newline to to prevent the following kernel log
line getting appended to the current one after switching the integrated
GPU and suspending the discrete GPU.

Signed-off-by: Daniel J Blueman <daniel-JCXMqzvhRcvYtjvyW6yDsg@public.gmane.org>
---
 drivers/gpu/drm/nouveau/core/subdev/i2c/aux.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/core/subdev/i2c/aux.c b/drivers/gpu/drm/nouveau/core/subdev/i2c/aux.c
index fe1ebf1..dc27e79 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/i2c/aux.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/i2c/aux.c
@@ -50,7 +50,7 @@ auxch_init(struct nouveau_i2c *aux, int ch)
 		ctrl = nv_rd32(aux, 0x00e4e4 + (ch * 0x50));
 		udelay(1);
 		if (!timeout--) {
-			AUX_ERR("begin idle timeout 0x%08x", ctrl);
+			AUX_ERR("begin idle timeout 0x%08x\n", ctrl);
 			return -EBUSY;
 		}
 	} while (ctrl & 0x03010000);
-- 
1.7.10.4
