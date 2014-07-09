From: Maarten Lankhorst <maarten.lankhorst@canonical.com>
Subject: [PATCH 16/17] drm/vmwgfx: use rcu in vmw_user_dmabuf_synccpu_grab
Date: Wed, 09 Jul 2014 14:30:34 +0200
Message-ID: <20140709123034.11354.50674.stgit@patser>
References: <20140709093124.11354.3774.stgit@patser>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20140709093124.11354.3774.stgit@patser>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: airlied@linux.ie
Cc: thellstrom@vmware.com, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, bskeggs@redhat.com, alexander.deucher@amd.com, christian.koenig@amd.com
List-Id: nouveau.vger.kernel.org

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@canonical.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_resource.c |   17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
index 20a1a866ceeb..79e950df3018 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
@@ -567,13 +567,16 @@ static int vmw_user_dmabuf_synccpu_grab(struct vmw_user_dma_buffer *user_bo,
 	int ret;
 
 	if (flags & drm_vmw_synccpu_allow_cs) {
-		ret = ttm_bo_reserve(bo, true, !!(flags & drm_vmw_synccpu_dontblock), false, 0);
-		if (!ret) {
-			ret = ttm_bo_wait(bo, false, true,
-					  !!(flags & drm_vmw_synccpu_dontblock));
-			ttm_bo_unreserve(bo);
-		}
-		return ret;
+		long lret;
+		if (flags & drm_vmw_synccpu_dontblock)
+			return reservation_object_test_signaled_rcu(bo->resv, true) ? 0 : -EBUSY;
+
+		lret = reservation_object_wait_timeout_rcu(bo->resv, true, true, MAX_SCHEDULE_TIMEOUT);
+		if (!lret)
+			return -EBUSY;
+		else if (lret < 0)
+			return lret;
+		return 0;
 	}
 
 	ret = ttm_bo_synccpu_write_grab
