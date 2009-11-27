From: Xavier Chantry <shiningxc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] nouveau: add ratelimit to
	nouveau_graph_dump_trap_info
Date: Fri, 27 Nov 2009 23:31:13 +0100
Message-ID: <1259361073-24931-1-git-send-email-shiningxc@gmail.com>
References: <1259357794-6972-1-git-send-email-shiningxc@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1259357794-6972-1-git-send-email-shiningxc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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

Often when things get stuck spinning, nouveau_pgraph_intr_error and
nouveau_graph_dump_trap_info gets called many times, flooding logs with
PGRAPH_ERROR and filling up the disk.

Pekka Paalanen pointed me to ratelimit, so I went ahead and added some
ratelimit support. It is much better now :)

I am completely new to the kernel world though so I hope I did not do
something terribly wrong.

Signed-off-by: Xavier Chantry <shiningxc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---

Addressed a few comments from pq (or is it PP ? :D)
* make the function and global variable static
* fix whitespace damage

 drivers/gpu/drm/nouveau/nouveau_irq.c |   10 +++++++++-
 1 files changed, 9 insertions(+), 1 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_irq.c b/drivers/gpu/drm/nouveau/nouveau_irq.c
index 597007a..fa3b5d1 100644
--- a/drivers/gpu/drm/nouveau/nouveau_irq.c
+++ b/drivers/gpu/drm/nouveau/nouveau_irq.c
@@ -462,6 +462,14 @@ nouveau_pgraph_intr_notify(struct drm_device *dev, uint32_t nsource)
 		nouveau_graph_dump_trap_info(dev, "PGRAPH_NOTIFY", &trap);
 }
 
+static DEFINE_RATELIMIT_STATE(nouveau_ratelimit_state, 3 * HZ, 20);
+
+static int nouveau_ratelimit(void)
+{
+	return __ratelimit(&nouveau_ratelimit_state);
+}
+
+
 static inline void
 nouveau_pgraph_intr_error(struct drm_device *dev, uint32_t nsource)
 {
@@ -478,7 +486,7 @@ nouveau_pgraph_intr_error(struct drm_device *dev, uint32_t nsource)
 		unhandled = 1;
 	}
 
-	if (unhandled)
+	if (unhandled && nouveau_ratelimit())
 		nouveau_graph_dump_trap_info(dev, "PGRAPH_ERROR", &trap);
 }
 
-- 
1.6.5.3
