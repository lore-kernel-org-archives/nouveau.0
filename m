From: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] drm/nouveau/pm: Prevent overflow in
	nouveau_perf_init()
Date: Sat, 11 Jun 2011 13:30:32 +0100
Message-ID: <1307795432-5417-1-git-send-email-emil.l.velikov@gmail.com>
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

While parsing the perf table, there is no check if
the num of entries read from the vbios is less than
the currently allocated number.

In case of a buggy vbios this will cause overwriting
of kernel memory, causing aditional problems.

Add a simple check in order to prevent the case

Signed-off-by: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_perf.c |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_perf.c b/drivers/gpu/drm/nouveau/nouveau_perf.c
index f2d98c9..b0e995f 100644
--- a/drivers/gpu/drm/nouveau/nouveau_perf.c
+++ b/drivers/gpu/drm/nouveau/nouveau_perf.c
@@ -225,6 +225,11 @@ nouveau_perf_init(struct drm_device *dev)
 		entries   = perf[2];
 	}
 
+	if (entries > NOUVEAU_PM_MAX_LEVEL) {
+		NV_DEBUG(dev, "perf table has too many entries - buggy vbios?\n");
+		entries = NOUVEAU_PM_MAX_LEVEL;
+	}
+
 	entry = perf + headerlen;
 	for (i = 0; i < entries; i++) {
 		struct nouveau_pm_level *perflvl = &pm->perflvl[pm->nr_perflvl];
-- 
1.7.1
