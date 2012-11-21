From: Maarten Lankhorst <maarten.lankhorst@canonical.com>
Subject: Re: [PATCH] drm/nouveau: fix takedown in move_notify
Date: Wed, 21 Nov 2012 15:13:12 +0100
Message-ID: <50ACE178.9090707@canonical.com>
References: <50ACD3F5.6010007@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <50ACD3F5.6010007@canonical.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: nouveau@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

Op 21-11-12 14:15, Maarten Lankhorst schreef:
> With this fix, nouveau_gem_object_close can be safely changed to a noop,
> forcing the vm bindings to be removed when the original object is. This
> is not done in this patch since it may lead to the object staying mapped
> in the vm space until the gem object refcount drops to 0. This shouldn't
> be a big issue however.
>
> If we choose to do so does allow us to use ttm's delayed destruction
> mechanism to unmap vm after object is idle, resulting in ioread32 no
> longer taking up 30% of cpu in Team Fortress 2 if I don't do the vma
> unmap in nouveau_gem_object_close.

And for those crazy enough to try, deliberately in the most hacky form possible:

drm/nouveau: use ttm delayed destroy for unmapping vm

According to perf top, drops ioread32 from taking 30% cpu to 3% cpu..

diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
index 5e2f521..bdb99ab 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
@@ -111,7 +111,7 @@ nouveau_gem_object_close(struct drm_gem_object *gem, struct drm_file *file_priv)
 	struct nouveau_vma *vma;
 	int ret;
 
-	if (!cli->base.vm)
+//	if (!cli->base.vm)
 		return;
 
 	ret = ttm_bo_reserve(&nvbo->bo, false, false, false, 0);
