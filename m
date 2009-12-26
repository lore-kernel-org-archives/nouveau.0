From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: [PATCH 2/3] drm/nouveau: Use the software object for
	fencing.
Date: Sat, 26 Dec 2009 19:21:48 +0100
Message-ID: <1261851709-10677-2-git-send-email-currojerez@riseup.net>
References: <1261851709-10677-1-git-send-email-currojerez@riseup.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1261851709-10677-1-git-send-email-currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
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

This should avoid a race condition on nv0x, if we're doing it with
actual PGRAPH objects and a there's a fence within the FIFO DMA fetch
area when a context switch kicks in.

In that case we get an ILLEGAL_MTHD interrupt as expected, but the
values in PGRAPH_TRAPPED_ADDR aren't calculated correctly and they're
almost useless (e.g. you can see ILLEGAL_MTHDs for the now inactive
channel, with a wrong offset/data pair).

Signed-off-by: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_fence.c |    2 +-
 drivers/gpu/drm/nouveau/nv04_graph.c    |    5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
index dacac9a..faddf53 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
@@ -142,7 +142,7 @@ nouveau_fence_emit(struct nouveau_fence *fence)
 	list_add_tail(&fence->entry, &chan->fence.pending);
 	spin_unlock_irqrestore(&chan->fence.lock, flags);
 
-	BEGIN_RING(chan, NvSubM2MF, USE_REFCNT ? 0x0050 : 0x0150, 1);
+	BEGIN_RING(chan, NvSubSw, USE_REFCNT ? 0x0050 : 0x0150, 1);
 	OUT_RING(chan, fence->sequence);
 	FIRE_RING(chan);
 
diff --git a/drivers/gpu/drm/nouveau/nv04_graph.c b/drivers/gpu/drm/nouveau/nv04_graph.c
index d561d77..82c77f9 100644
--- a/drivers/gpu/drm/nouveau/nv04_graph.c
+++ b/drivers/gpu/drm/nouveau/nv04_graph.c
@@ -547,7 +547,7 @@ nv04_graph_mthd_set_operation(struct nouveau_channel *chan, int grclass,
 	return 0;
 }
 
-static struct nouveau_pgraph_object_method nv04_graph_mthds_m2mf[] = {
+static struct nouveau_pgraph_object_method nv04_graph_mthds_sw[] = {
 	{ 0x0150, nv04_graph_mthd_set_ref },
 	{}
 };
@@ -558,7 +558,7 @@ static struct nouveau_pgraph_object_method nv04_graph_mthds_set_operation[] = {
 };
 
 struct nouveau_pgraph_object_class nv04_graph_grclass[] = {
-	{ 0x0039, false, nv04_graph_mthds_m2mf },
+	{ 0x0039, false, NULL },
 	{ 0x004a, false, nv04_graph_mthds_set_operation }, /* gdirect */
 	{ 0x005f, false, nv04_graph_mthds_set_operation }, /* imageblit */
 	{ 0x0061, false, nv04_graph_mthds_set_operation }, /* ifc */
@@ -574,6 +574,7 @@ struct nouveau_pgraph_object_class nv04_graph_grclass[] = {
 	{ 0x0053, false, NULL }, /* surf3d */
 	{ 0x0054, false, NULL }, /* tex_tri */
 	{ 0x0055, false, NULL }, /* multitex_tri */
+	{ 0x506e, true, nv04_graph_mthds_sw },
 	{}
 };
 
-- 
1.6.4.4
