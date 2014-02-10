From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH] drm/nouveau/fifo: allocate usermem as needed
Date: Mon, 10 Feb 2014 14:57:01 +0900
Message-ID: <1392011821-2406-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
To: Ben Skeggs <bskeggs@redhat.com>
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, gnurou@gmail.com
List-Id: nouveau.vger.kernel.org

Memory was always allocated for 4096 channels. Change this to allocate
what we actually need according to the number of channels we use.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/drm/nouveau/core/engine/fifo/nve0.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/core/engine/fifo/nve0.c b/drivers/gpu/drm/nouveau/core/engine/fifo/nve0.c
index 9a850fe19515..99c9deea248f 100644
--- a/drivers/gpu/drm/nouveau/core/engine/fifo/nve0.c
+++ b/drivers/gpu/drm/nouveau/core/engine/fifo/nve0.c
@@ -852,8 +852,8 @@ nve0_fifo_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
 			return ret;
 	}
 
-	ret = nouveau_gpuobj_new(nv_object(priv), NULL, 4096 * 0x200, 0x1000,
-				 NVOBJ_FLAG_ZERO_ALLOC, &priv->user.mem);
+	ret = nouveau_gpuobj_new(nv_object(priv), NULL, impl->channels * 0x200,
+				0x1000, NVOBJ_FLAG_ZERO_ALLOC, &priv->user.mem);
 	if (ret)
 		return ret;
 
-- 
1.8.5.4
