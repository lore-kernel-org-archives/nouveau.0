From: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/2] nouveau/exa: Fix transfer bo memory leak
Date: Tue, 19 Jun 2012 00:29:00 +0200
Message-ID: <1340058540-12607-2-git-send-email-madman2003@gmail.com>
References: <1340058540-12607-1-git-send-email-madman2003@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1340058540-12607-1-git-send-email-madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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

Thanks to "Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>" for hinting at the cause of the problem.

Signed-off-by: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 src/nouveau_exa.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/src/nouveau_exa.c b/src/nouveau_exa.c
index c51a799..bb946b6 100644
--- a/src/nouveau_exa.c
+++ b/src/nouveau_exa.c
@@ -185,6 +185,8 @@ nouveau_exa_scratch(NVPtr pNv, int size, struct nouveau_bo **pbo, int *off)
 		}
 
 		nouveau_bo_ref(bo, &pNv->transfer);
+		/* Lower the refcount of the bo back to 1, otherwise it will never be freed. */
+		nouveau_bo_ref(NULL, &bo);
 		pNv->transfer_offset = 0;
 	}
 
-- 
1.7.8.6
