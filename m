From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: [PATCH] drm/ttm: Avoid conflicting reserve_memtype during
	ttm_tt_set_page_caching.
Date: Tue, 12 Jan 2010 18:49:43 +0100
Message-ID: <1263318583-11392-1-git-send-email-currojerez@riseup.net>
References: <91752841001111610q78af5515g73725e3c4aa56e67@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <91752841001111610q78af5515g73725e3c4aa56e67-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: dri-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Fixes errors like:
> reserve_ram_pages_type failed 0x15b7a000-0x15b7b000, track 0x8, req 0x10
when a BO is moved between WC and UC areas.

Reported-by: Xavier Chantry <shiningxc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Signed-off-by: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
---
 drivers/gpu/drm/ttm/ttm_tt.c |   23 ++++++++++++++++-------
 1 files changed, 16 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
index 9c2b1cc..e2123af 100644
--- a/drivers/gpu/drm/ttm/ttm_tt.c
+++ b/drivers/gpu/drm/ttm/ttm_tt.c
@@ -198,17 +198,26 @@ EXPORT_SYMBOL(ttm_tt_populate);
 static inline int ttm_tt_set_page_caching(struct page *p,
 					  enum ttm_caching_state c_state)
 {
+	int ret = 0;
+
 	if (PageHighMem(p))
 		return 0;
 
-	switch (c_state) {
-	case tt_cached:
-		return set_pages_wb(p, 1);
-	case tt_wc:
-	    return set_memory_wc((unsigned long) page_address(p), 1);
-	default:
-		return set_pages_uc(p, 1);
+	if (get_page_memtype(p) != -1) {
+		/* p isn't in the default caching state, set it to
+		 * writeback first to free its current memtype. */
+
+		ret = set_pages_wb(p, 1);
+		if (ret)
+			return ret;
 	}
+
+	if (c_state == tt_wc)
+		ret = set_memory_wc((unsigned long) page_address(p), 1);
+	else if (c_state == tt_uncached)
+		ret = set_pages_uc(p, 1);
+
+	return ret;
 }
 #else /* CONFIG_X86 */
 static inline int ttm_tt_set_page_caching(struct page *p,
-- 
1.6.4.4
