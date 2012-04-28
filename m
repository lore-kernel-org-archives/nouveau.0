From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 4/4] drm/nouveau: gpu lockup recovery
Date: Sat, 28 Apr 2012 16:56:15 +0200
Message-ID: <20120428145615.GB10116@joi.lan>
References: <1335388836-13127-4-git-send-email-marcin.slusarz@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1335388836-13127-4-git-send-email-marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Wed, Apr 25, 2012 at 11:20:36PM +0200, Marcin Slusarz wrote:
> Overall idea:
> Detect lockups by watching for timeouts (vm flush / fence), return -EIOs,
> handle them at ioctl level, reset the GPU and repeat last ioctl.
> 
> GPU reset is done by doing suspend / resume cycle with few tweaks:
> - CPU-only bo eviction
> - ignoring vm flush / fence timeouts
> - shortening waits
> 
> Signed-off-by: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---

Martin,

I'm wondering how below patch (which builds upon the above) affects
reclocking stability. I can't test it on my card, because it has only
one performance level. Can you test it on yours?

---
From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] drm/nouveau: take ioctls_rwsem before reclocking

Signed-off-by: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_pm.c    |    6 ++++++
 drivers/gpu/drm/nouveau/nouveau_reset.c |    2 +-
 2 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_pm.c b/drivers/gpu/drm/nouveau/nouveau_pm.c
index 34d591b..4716f39 100644
--- a/drivers/gpu/drm/nouveau/nouveau_pm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_pm.c
@@ -383,9 +383,15 @@ nouveau_pm_set_perflvl(struct device *d, struct device_attribute *a,
 		       const char *buf, size_t count)
 {
 	struct drm_device *dev = pci_get_drvdata(to_pci_dev(d));
+	struct drm_nouveau_private *dev_priv = dev->dev_private;
 	int ret;
 
+	intr_rwsem_down_write(&dev_priv->ioctls_rwsem);
+
 	ret = nouveau_pm_profile_set(dev, buf);
+
+	intr_rwsem_up_write(&dev_priv->ioctls_rwsem);
+
 	if (ret)
 		return ret;
 	return strlen(buf);
diff --git a/drivers/gpu/drm/nouveau/nouveau_reset.c b/drivers/gpu/drm/nouveau/nouveau_reset.c
index e893096..7c25a3c 100644
--- a/drivers/gpu/drm/nouveau/nouveau_reset.c
+++ b/drivers/gpu/drm/nouveau/nouveau_reset.c
@@ -139,7 +139,7 @@ int nouveau_reset_device(struct drm_device *dev)
 		end = jiffies;
 		NV_INFO(dev, "GPU reset done, took %lu s\n", (end - start) / DRM_HZ);
 		while (intr_rwsem_down_read_interruptible(&dev_priv->ioctls_rwsem))
-			; /* not possible, we are holding reset_lock */
+			;
 	}
 	mutex_unlock(&dev_priv->reset_lock);
 
-- 
1.7.8.5
