From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] drm/nv40/graph: fix typo in type names
Date: Tue,  6 Nov 2012 22:48:50 +0100
Message-ID: <1352238533-14920-2-git-send-email-marcin.slusarz@gmail.com>
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

nv04_graph_priv / nv04_graph_chan are not defined in this context...

Signed-off-by: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/nouveau/core/engine/graph/nv40.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/core/engine/graph/nv40.c b/drivers/gpu/drm/nouveau/core/engine/graph/nv40.c
index b076678..a3742db 100644
--- a/drivers/gpu/drm/nouveau/core/engine/graph/nv40.c
+++ b/drivers/gpu/drm/nouveau/core/engine/graph/nv40.c
@@ -156,8 +156,8 @@ nv40_graph_context_ctor(struct nouveau_object *parent,
 static int
 nv40_graph_context_fini(struct nouveau_object *object, bool suspend)
 {
-	struct nv04_graph_priv *priv = (void *)object->engine;
-	struct nv04_graph_chan *chan = (void *)object;
+	struct nv40_graph_priv *priv = (void *)object->engine;
+	struct nv40_graph_chan *chan = (void *)object;
 	u32 inst = 0x01000000 | nv_gpuobj(chan)->addr >> 4;
 	int ret = 0;
 
-- 
1.7.12
