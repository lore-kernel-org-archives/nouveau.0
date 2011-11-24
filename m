From: Maarten Lankhorst <m.b.lankhorst-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH to drm/nouveau] nouveau: Mark nouveau subchannel
	unbound nouveau_grobj_free
Date: Thu, 24 Nov 2011 14:08:53 +0100
Message-ID: <4ECE41E5.3090608@gmail.com>
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

Valgrind throws warns about a user-after-free if you try to bind a
new subchannel after the old one in that slot was freed,
so remove it from the channel list.

Signed-off-by: Maarten Lankhorst <m.b.lankhorst-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

--- a/nouveau/nouveau_grobj.c
+++ b/nouveau/nouveau_grobj.c
@@ -100,12 +99,13 @@ nouveau_grobj_free(struct nouveau_grobj **grobj)
 		struct drm_nouveau_gpuobj_free f;
 
 		FIRE_RING(&chan->base);
-
 		f.channel = chan->drm.channel;
 		f.handle  = nvgrobj->base.handle;
 		drmCommandWrite(nvdev->fd, DRM_NOUVEAU_GPUOBJ_FREE,
 				&f, sizeof(f));	
 	}
+	if (nvgrobj->base.bound != NOUVEAU_GROBJ_UNBOUND)
+		chan->base.subc[nvgrobj->base.subc].gr = NULL;
 	free(nvgrobj);
 }
