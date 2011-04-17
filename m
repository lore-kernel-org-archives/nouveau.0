From: Jimmy Rentz <jb17bsome-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] drm/nouveau: Free nv04 instmem ramin heap at card
	takedown
Date: Sun, 17 Apr 2011 16:15:03 -0400
Message-ID: <20110417161503.1769f9d0@amd64linuxmsi.rentzhouse.lan>
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

Add a missing nv04 instmem ramin heap shutdown call.
    
Signed-off-by: Jimmy Rentz <jb17bsome-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

diff --git a/drivers/gpu/drm/nouveau/nv04_instmem.c
b/drivers/gpu/drm/nouveau/nv04_instmem.c index b8e3edb..b8611b9 100644
--- a/drivers/gpu/drm/nouveau/nv04_instmem.c
+++ b/drivers/gpu/drm/nouveau/nv04_instmem.c
@@ -95,6 +95,9 @@ nv04_instmem_takedown(struct drm_device *dev)
 	nouveau_ramht_ref(NULL, &dev_priv->ramht, NULL);
 	nouveau_gpuobj_ref(NULL, &dev_priv->ramro);
 	nouveau_gpuobj_ref(NULL, &dev_priv->ramfc);
+
+	if (drm_mm_initialized(&dev_priv->ramin_heap))
+		drm_mm_takedown(&dev_priv->ramin_heap);
 }
 
 int
