From: Samuel Pitoiset <samuel.pitoiset-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/3] perfmon: remove unused nouveau_perfsig_wrap()
	function
Date: Mon, 15 Sep 2014 13:25:41 +0200
Message-ID: <1410780342-2808-3-git-send-email-samuel.pitoiset@gmail.com>
References: <1410780342-2808-1-git-send-email-samuel.pitoiset@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1410780342-2808-1-git-send-email-samuel.pitoiset-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Signed-off-by: Samuel Pitoiset <samuel.pitoiset-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 nvkm/engine/perfmon/base.c | 20 --------------------
 nvkm/engine/perfmon/priv.h |  3 ---
 2 files changed, 23 deletions(-)

diff --git a/nvkm/engine/perfmon/base.c b/nvkm/engine/perfmon/base.c
index 5fa45e1..b74734e 100644
--- a/nvkm/engine/perfmon/base.c
+++ b/nvkm/engine/perfmon/base.c
@@ -80,26 +80,6 @@ nouveau_perfsig_find(struct nouveau_perfmon *ppm, const char *name, u32 size,
 	return nouveau_perfsig_find_(dom, name, size);
 }
 
-struct nouveau_perfctr *
-nouveau_perfsig_wrap(struct nouveau_perfmon *ppm, const char *name,
-		     struct nouveau_perfdom **pdom)
-{
-	struct nouveau_perfsig *sig;
-	struct nouveau_perfctr *ctr;
-
-	sig = nouveau_perfsig_find(ppm, name, strlen(name), pdom);
-	if (!sig)
-		return NULL;
-
-	ctr = kzalloc(sizeof(*ctr), GFP_KERNEL);
-	if (ctr) {
-		ctr->signal[0] = sig;
-		ctr->logic_op = 0xaaaa;
-	}
-
-	return ctr;
-}
-
 /*******************************************************************************
  * Perfmon object classes
  ******************************************************************************/
diff --git a/nvkm/engine/perfmon/priv.h b/nvkm/engine/perfmon/priv.h
index 0ac8714..9e27ff5 100644
--- a/nvkm/engine/perfmon/priv.h
+++ b/nvkm/engine/perfmon/priv.h
@@ -31,9 +31,6 @@ struct nouveau_perfsig {
 };
 
 struct nouveau_perfdom;
-struct nouveau_perfctr *
-nouveau_perfsig_wrap(struct nouveau_perfmon *, const char *,
-		     struct nouveau_perfdom **);
 
 struct nouveau_specdom {
 	u16 signal_nr;
-- 
2.0.0
