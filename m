From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [mesa PATCH] gallium/nouveau: optimize so_reloc2
Date: Wed, 12 Jan 2011 21:43:51 +0100
Message-ID: <1294865031-22457-3-git-send-email-marcin.slusarz@gmail.com>
References: <1294865031-22457-1-git-send-email-marcin.slusarz@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1294865031-22457-1-git-send-email-marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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

use one relocation with newly introduced flag

unfortunately we can't enable it unconditionally, because we don't
know if the kernel supports it...
---
 src/gallium/drivers/nouveau/nouveau_stateobj.h |   11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/src/gallium/drivers/nouveau/nouveau_stateobj.h b/src/gallium/drivers/nouveau/nouveau_stateobj.h
index be8850b..4a08ba3 100644
--- a/src/gallium/drivers/nouveau/nouveau_stateobj.h
+++ b/src/gallium/drivers/nouveau/nouveau_stateobj.h
@@ -182,6 +182,9 @@ so_method(struct nouveau_stateobj *so, struct nouveau_grobj *gr,
 	so->cur = 0;
 }
 
+//disabled for now
+//#define NOUVEAU_MESA_NEW_RELOC
+
 static INLINE void
 so_reloc(struct nouveau_stateobj *so, struct nouveau_bo *bo,
 	 unsigned data, unsigned flags, unsigned vor, unsigned tor)
@@ -208,6 +211,10 @@ so_reloc(struct nouveau_stateobj *so, struct nouveau_bo *bo,
 	r[so->cur_reloc].tor = tor;
 
 	so_data(so, data);
+#if defined(NOUVEAU_MESA_NEW_RELOC) && defined(NOUVEAU_BO_HILO)
+	if (flags & NOUVEAU_BO_HILO)
+		so_data(so, data);
+#endif
 	so->cur_reloc++;
 }
 
@@ -215,8 +222,12 @@ static INLINE void
 so_reloc2(struct nouveau_stateobj *so, struct nouveau_bo *bo,
 	 unsigned data, unsigned flags, unsigned vor, unsigned tor)
 {
+#if defined(NOUVEAU_MESA_NEW_RELOC) && defined(NOUVEAU_BO_HILO)
+	so_reloc(so, bo, data, flags | NOUVEAU_BO_HILO, vor, tor);
+#else
 	so_reloc(so, bo, data, flags | NOUVEAU_BO_HIGH, vor, tor);
 	so_reloc(so, bo, data, flags | NOUVEAU_BO_LOW, vor, tor);
+#endif
 }
 
 /* Determine if this buffer object is referenced by this state object. */
-- 
1.7.3.3
