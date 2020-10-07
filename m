From: Karol Herbst <kherbst-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [RFC] fifo: only reboot engines if they have a ref
Date: Wed,  7 Oct 2020 17:13:56 +0200
Message-ID: <20201007151356.51917-1-kherbst@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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

this prevents double fini/init on engines and also fixes the
"gr: fecs falcon already acquired by gr!" error I was seeing.

RFC comment: not sure if this is the right solution, but it does fix the issue
for me. And I guess if this is a valid approach older/newer chipset might need
similiar fixes?

Signed-off-by: Karol Herbst <kherbst-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 drm/nouveau/nvkm/engine/fifo/gk104.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drm/nouveau/nvkm/engine/fifo/gk104.c b/drm/nouveau/nvkm/engine/fifo/gk104.c
index 441483325..669153fba 100644
--- a/drm/nouveau/nvkm/engine/fifo/gk104.c
+++ b/drm/nouveau/nvkm/engine/fifo/gk104.c
@@ -292,8 +292,12 @@ gk104_fifo_recover_work(struct work_struct *w)
 
 	for (todo = engm; engn = __ffs(todo), todo; todo &= ~BIT(engn)) {
 		if ((engine = fifo->engine[engn].engine)) {
-			nvkm_subdev_fini(&engine->subdev, false);
-			WARN_ON(nvkm_subdev_init(&engine->subdev));
+			mutex_lock(&engine->subdev.mutex);
+			if (engine->usecount) {
+				nvkm_subdev_fini(&engine->subdev, false);
+				WARN_ON(nvkm_subdev_init(&engine->subdev));
+			}
+			mutex_unlock(&engine->subdev.mutex);
 		}
 	}
 
-- 
2.26.2
