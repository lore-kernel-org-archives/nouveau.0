From: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>
Subject: [PATCH] drm/nvc0/pm: read core/shader/memory clocks
	(more) correctly
Date: Sun, 17 Apr 2011 17:10:35 +0200
Message-ID: <1303053035-25716-1-git-send-email-martin.peres@free.fr>
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
List-Id: nouveau.vger.kernel.org

---
 drivers/gpu/drm/nouveau/nouveau_perf.c |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_perf.c b/drivers/gpu/drm/nouveau/nouveau_perf.c
index 950caba..d64a98a 100644
--- a/drivers/gpu/drm/nouveau/nouveau_perf.c
+++ b/drivers/gpu/drm/nouveau/nouveau_perf.c
@@ -177,9 +177,9 @@ nouveau_perf_init(struct drm_device *dev)
 #define subent(n) entry[perf[2] + ((n) * perf[3])]
 			perflvl->fanspeed = 0; /*XXX*/
 			perflvl->voltage = entry[2];
-			perflvl->core = (ROM16(subent(0)) & 0xfff) * 1000;
-			perflvl->shader = (ROM16(subent(1)) & 0xfff) * 1000;
-			perflvl->memory = (ROM16(subent(2)) & 0xfff) * 1000;
+			perflvl->core = (ROM16(subent(3)) & 0xfff) * 1000;
+			perflvl->shader = (ROM16(subent(3)) & 0xfff) / 2 * 1000;
+			perflvl->memory = (ROM16(subent(5)) & 0xfff) * 1000;
 			break;
 		}
 
-- 
1.7.4.4
