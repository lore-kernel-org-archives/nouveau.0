From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] drm/nouveau: don't return freed object from
	nouveau_handle_create
Date: Thu, 20 Dec 2012 23:37:10 +0100
Message-ID: <1356043034-25739-3-git-send-email-marcin.slusarz@gmail.com>
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
 drivers/gpu/drm/nouveau/core/core/handle.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/core/core/handle.c b/drivers/gpu/drm/nouveau/core/core/handle.c
index b8d2cbf..264c2b3 100644
--- a/drivers/gpu/drm/nouveau/core/core/handle.c
+++ b/drivers/gpu/drm/nouveau/core/core/handle.c
@@ -109,7 +109,7 @@ nouveau_handle_create(struct nouveau_object *parent, u32 _parent, u32 _handle,
 	while (!nv_iclass(namedb, NV_NAMEDB_CLASS))
 		namedb = namedb->parent;
 
-	handle = *phandle = kzalloc(sizeof(*handle), GFP_KERNEL);
+	handle = kzalloc(sizeof(*handle), GFP_KERNEL);
 	if (!handle)
 		return -ENOMEM;
 
@@ -146,6 +146,9 @@ nouveau_handle_create(struct nouveau_object *parent, u32 _parent, u32 _handle,
 	}
 
 	hprintk(handle, TRACE, "created\n");
+
+	*phandle = handle;
+
 	return 0;
 }
 
-- 
1.8.0.2
