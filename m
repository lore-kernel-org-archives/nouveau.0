From: Maarten Lankhorst <maarten.lankhorst@canonical.com>
Subject: [PATCH] drm/nouveau: force alignment to 0x1000 for gpu objects
Date: Mon,  2 Sep 2013 16:31:37 +0200
Message-ID: <1378132297-19616-1-git-send-email-maarten.lankhorst@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
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

There are a lot of places that allocate multiples of 1000,
but do not set alignment correctly and still require this
alignment implicitly or explicitly.
---
 drivers/gpu/drm/nouveau/core/core/gpuobj.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/core/core/gpuobj.c b/drivers/gpu/drm/nouveau/core/core/gpuobj.c
index 7595506..7bcae1d 100644
--- a/drivers/gpu/drm/nouveau/core/core/gpuobj.c
+++ b/drivers/gpu/drm/nouveau/core/core/gpuobj.c
@@ -65,6 +65,14 @@ nouveau_gpuobj_create_(struct nouveau_object *parent,
 	int ret, i;
 	u64 addr;
 
+	/*
+	 * There are a lot of places that allocate multiples of 1000,
+	 * but do not set alignment correctly and still require this
+	 * alignment implicitly or explicitly.
+	 */
+	if (size >= 0x1000 && align < 0x1000)
+		align = 0x1000;
+
 	*pobject = NULL;
 
 	if (pargpu) {
-- 
1.8.3.4
