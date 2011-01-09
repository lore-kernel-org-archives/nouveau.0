From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [libdrm PATCH 2/3] nouveau: add OUT_RELOChl
Date: Sun,  9 Jan 2011 18:30:59 +0100
Message-ID: <1294594263-1862-2-git-send-email-marcin.slusarz@gmail.com>
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

---
 nouveau/nouveau_pushbuf.h |   11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/nouveau/nouveau_pushbuf.h b/nouveau/nouveau_pushbuf.h
index 70d0f28..5151e01 100644
--- a/nouveau/nouveau_pushbuf.h
+++ b/nouveau/nouveau_pushbuf.h
@@ -142,4 +142,15 @@ OUT_RELOCh(struct nouveau_channel *chan, struct nouveau_bo *bo,
 	return OUT_RELOC(chan, bo, delta, flags | NOUVEAU_BO_HIGH, 0, 0);
 }
 
+/* High 32-bits, then low 32-bits of offset */
+static __inline__ int
+OUT_RELOChl(struct nouveau_channel *chan, struct nouveau_bo *bo,
+	   unsigned delta, unsigned flags)
+{
+	int r = OUT_RELOC(chan, bo, delta, flags | NOUVEAU_BO_HIGH, 0, 0);
+	if (r)
+		return r;
+	return OUT_RELOC(chan, bo, delta, flags | NOUVEAU_BO_LOW, 0, 0);
+}
+
 #endif
-- 
1.7.3.3
