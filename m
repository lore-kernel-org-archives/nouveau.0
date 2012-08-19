From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 07/10] drm/nouveau: add sparse annotations to
	nv04_fifo_pause/nv04_fifo_start
Date: Sun, 19 Aug 2012 23:00:02 +0200
Message-ID: <1345410004-27729-7-git-send-email-marcin.slusarz@gmail.com>
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

Signed-off-by: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/nouveau/core/engine/fifo/nv04.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/core/engine/fifo/nv04.c b/drivers/gpu/drm/nouveau/core/engine/fifo/nv04.c
index c472501..c70a70d 100644
--- a/drivers/gpu/drm/nouveau/core/engine/fifo/nv04.c
+++ b/drivers/gpu/drm/nouveau/core/engine/fifo/nv04.c
@@ -292,6 +292,7 @@ nv04_fifo_cclass = {
 
 void
 nv04_fifo_pause(struct nouveau_fifo *pfifo, unsigned long *pflags)
+	__acquires(priv->base.lock)
 {
 	struct nv04_fifo_priv *priv = (void *)pfifo;
 	unsigned long flags;
@@ -324,6 +325,7 @@ nv04_fifo_pause(struct nouveau_fifo *pfifo, unsigned long *pflags)
 
 void
 nv04_fifo_start(struct nouveau_fifo *pfifo, unsigned long *pflags)
+	__releases(priv->base.lock)
 {
 	struct nv04_fifo_priv *priv = (void *)pfifo;
 	unsigned long flags = *pflags;
-- 
1.7.8.6
