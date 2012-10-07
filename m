From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] drm/nv50: wire up pll_calc hook
Date: Mon,  8 Oct 2012 00:49:27 +0200
Message-ID: <1349650171-25045-1-git-send-email-marcin.slusarz@gmail.com>
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

Fixes crash during reclocking.
Call Trace:
 pll_calc == NULL
 calc_pll
 calc_mclk
 nv50_pm_clocks_pre
 nouveau_pm_perflvl_set
 nouveau_pm_trigger
 nouveau_pm_profile_set
 nouveau_pm_set_perflvl
 dev_attr_store
 sysfs_write_file
 vfs_write
 sys_write
 system_call_fastpath

Signed-off-by: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---

It's weird nobody noticed this... nva3+ code does not set this hook either,
but there's no existing function to wire up...

---
 drivers/gpu/drm/nouveau/core/subdev/clock/nv50.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/nouveau/core/subdev/clock/nv50.c b/drivers/gpu/drm/nouveau/core/subdev/clock/nv50.c
index fd181fb..f4147f6 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/clock/nv50.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/clock/nv50.c
@@ -90,6 +90,7 @@ nv50_clock_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
 		return ret;
 
 	priv->base.pll_set = nv50_clock_pll_set;
+	priv->base.pll_calc = nv04_clock_pll_calc;
 	return 0;
 }
 
-- 
1.7.12
