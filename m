From: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] nouveau: make sure initial kalloc for user bo
	ends up in the right place
Date: Mon,  1 Mar 2010 19:39:36 +0100
Message-ID: <1267468776-6652-1-git-send-email-madman2003@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

- Currently reloc'ing a user bo to gart will first cause an allocation in vram,
which is then cpu written to, then the bo gets moved to gart.

Signed-off-by: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 nouveau/nouveau_reloc.c |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/nouveau/nouveau_reloc.c b/nouveau/nouveau_reloc.c
index 301482b..332dfa0 100644
--- a/nouveau/nouveau_reloc.c
+++ b/nouveau/nouveau_reloc.c
@@ -73,6 +73,12 @@ nouveau_reloc_emit(struct nouveau_channel *chan, struct nouveau_bo *reloc_bo,
 		return -EINVAL;
 	}
 
+	/* We're about to reloc a user buffer, better make sure we don't cause
+	 * a double migration.
+	 */
+	if (!(nvbo->flags & (NOUVEAU_BO_GART | NOUVEAU_BO_VRAM)))
+		nvbo->flags |= (flags & (NOUVEAU_BO_GART | NOUVEAU_BO_VRAM));
+
 	rpbbo = nouveau_bo_emit_buffer(chan, reloc_bo);
 	if (!rpbbo)
 		return -ENOMEM;
-- 
1.7.0
