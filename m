From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] drm/nouveau: comment out unused
 _nouveau_parent_ctor
Date: Tue, 9 Oct 2012 00:19:50 +0200
Message-ID: <20121008221950.GC3103@joi.lan>
References: <1349650171-25045-2-git-send-email-marcin.slusarz@gmail.com>
	<20121008010734.GC4197@turiel.bne.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20121008010734.GC4197-6RkuLLNOGXsZ315U/fw+0NvLeJWuRmrY@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Mon, Oct 08, 2012 at 11:07:34AM +1000, Ben Skeggs wrote:
> On Mon, Oct 08, 2012 at 12:49:28AM +0200, Marcin Slusarz wrote:
> > Signed-off-by: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > ---
> >  drivers/gpu/drm/nouveau/core/core/parent.c         | 2 ++
> >  drivers/gpu/drm/nouveau/core/include/core/parent.h | 3 +++
> >  2 files changed, 5 insertions(+)
> Feel free to just kill it completely.  There's a few bits and pieces
> of left-overs like this around the place, I'll be killing them as
> I run across them too.

OK.

---
From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] drm/nouveau: remove unused _nouveau_parent_ctor

Signed-off-by: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/nouveau/core/core/parent.c         | 17 -----------------
 drivers/gpu/drm/nouveau/core/include/core/parent.h |  3 ---
 2 files changed, 20 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/core/core/parent.c b/drivers/gpu/drm/nouveau/core/core/parent.c
index a1ea034..db7c549 100644
--- a/drivers/gpu/drm/nouveau/core/core/parent.c
+++ b/drivers/gpu/drm/nouveau/core/core/parent.c
@@ -101,23 +101,6 @@ nouveau_parent_create_(struct nouveau_object *parent,
 	return 0;
 }
 
-int
-_nouveau_parent_ctor(struct nouveau_object *parent,
-		     struct nouveau_object *engine,
-		     struct nouveau_oclass *oclass, void *data, u32 size,
-		     struct nouveau_object **pobject)
-{
-	struct nouveau_parent *object;
-	int ret;
-
-	ret = nouveau_parent_create(parent, engine, oclass, 0, NULL, 0, &object);
-	*pobject = nv_object(object);
-	if (ret)
-		return ret;
-
-	return 0;
-}
-
 void
 nouveau_parent_destroy(struct nouveau_parent *parent)
 {
diff --git a/drivers/gpu/drm/nouveau/core/include/core/parent.h b/drivers/gpu/drm/nouveau/core/include/core/parent.h
index d3aa251..3c2e940 100644
--- a/drivers/gpu/drm/nouveau/core/include/core/parent.h
+++ b/drivers/gpu/drm/nouveau/core/include/core/parent.h
@@ -50,9 +50,6 @@ int  nouveau_parent_create_(struct nouveau_object *, struct nouveau_object *,
 			    int size, void **);
 void nouveau_parent_destroy(struct nouveau_parent *);
 
-int  _nouveau_parent_ctor(struct nouveau_object *, struct nouveau_object *,
-			  struct nouveau_oclass *, void *, u32,
-			  struct nouveau_object **);
 void _nouveau_parent_dtor(struct nouveau_object *);
 #define _nouveau_parent_init _nouveau_object_init
 #define _nouveau_parent_fini _nouveau_object_fini
-- 
1.7.12
