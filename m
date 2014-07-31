From: Maarten Lankhorst <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Subject: [PATCH 17/19] drm/radeon: use rcu waits in some ioctls
Date: Thu, 31 Jul 2014 17:34:32 +0200
Message-ID: <20140731153432.15061.49403.stgit@patser>
References: <20140731153245.15061.63023.stgit@patser>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20140731153245.15061.63023.stgit@patser>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: airlied-cv59FeDIM0c@public.gmane.org
Cc: thellstrom-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, alexander.deucher-5C7GfCeVMHo@public.gmane.org, christian.koenig-5C7GfCeVMHo@public.gmane.org
List-Id: nouveau.vger.kernel.org

Signed-off-by: Maarten Lankhorst <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
---
 drivers/gpu/drm/radeon/radeon_gem.c |   19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_gem.c b/drivers/gpu/drm/radeon/radeon_gem.c
index d09650c1d720..7ba883843668 100644
--- a/drivers/gpu/drm/radeon/radeon_gem.c
+++ b/drivers/gpu/drm/radeon/radeon_gem.c
@@ -107,9 +107,12 @@ static int radeon_gem_set_domain(struct drm_gem_object *gobj,
 	}
 	if (domain == RADEON_GEM_DOMAIN_CPU) {
 		/* Asking for cpu access wait for object idle */
-		r = radeon_bo_wait(robj, NULL, false);
-		if (r) {
-			printk(KERN_ERR "Failed to wait for object !\n");
+		r = reservation_object_wait_timeout_rcu(robj->tbo.resv, true, true, 30 * HZ);
+		if (!r)
+			r = -EBUSY;
+
+		if (r < 0 && r != -EINTR) {
+			printk(KERN_ERR "Failed to wait for object: %i\n", r);
 			return r;
 		}
 	}
@@ -357,14 +360,20 @@ int radeon_gem_wait_idle_ioctl(struct drm_device *dev, void *data,
 	struct drm_radeon_gem_wait_idle *args = data;
 	struct drm_gem_object *gobj;
 	struct radeon_bo *robj;
-	int r;
+	int r = 0;
+	long ret;
 
 	gobj = drm_gem_object_lookup(dev, filp, args->handle);
 	if (gobj == NULL) {
 		return -ENOENT;
 	}
 	robj = gem_to_radeon_bo(gobj);
-	r = radeon_bo_wait(robj, NULL, false);
+	ret = reservation_object_wait_timeout_rcu(robj->tbo.resv, true, true, 30 * HZ);
+	if (ret == 0)
+		r = -EBUSY;
+	else if (ret < 0)
+		r = ret;
+
 	/* callback hw specific functions if any */
 	if (rdev->asic->ioctl_wait_idle)
 		robj->rdev->asic->ioctl_wait_idle(rdev, robj);
