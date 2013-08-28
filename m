From: Lucas Stach <dev@lynxeye.de>
Subject: [PATCH 1/6] drm/ttm: recognize ARM arch in ioprot handler
Date: Wed, 28 Aug 2013 02:00:45 +0200
Message-ID: <1377648050-6649-2-git-send-email-dev@lynxeye.de>
References: <1377648050-6649-1-git-send-email-dev@lynxeye.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <1377648050-6649-1-git-send-email-dev@lynxeye.de>
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

Signed-off-by: Lucas Stach <dev@lynxeye.de>
---
 drivers/gpu/drm/ttm/ttm_bo_util.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index 319cf41..db15687 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -487,7 +487,7 @@ pgprot_t ttm_io_prot(uint32_t caching_flags, pgprot_t tmp)
 			pgprot_val(tmp) |= _PAGE_GUARDED;
 	}
 #endif
-#if defined(__ia64__)
+#if defined(__ia64__) || defined(__arm__)
 	if (caching_flags & TTM_PL_FLAG_WC)
 		tmp = pgprot_writecombine(tmp);
 	else
-- 
1.8.3.1
