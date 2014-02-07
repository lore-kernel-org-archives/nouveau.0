From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH] nouveau/drm/fifo: fix ENG_RUNLIST register address
Date: Fri,  7 Feb 2014 22:22:57 +0900
Message-ID: <1391779377-10176-1-git-send-email-acourbot@nvidia.com>
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
To: Ben Skeggs <bskeggs@redhat.com>, nouveau@lists.freedesktop.org
Cc: gnurou@gmail.com, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

Address of the ENG_RUNLIST register should be 0x002284 + (engine * 8),
not 0x002284 + (engine * 4).

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
Stumbled upon this one and I'm quite certain the offset was not correct.
This is inconsequential for GK20A which only features one runlist, but
other GPUs might run into troubles because of this. Not tested, just
reported for your consideration.

FWIW, the Android GK20A driver uses the same offset calculation.

 drivers/gpu/drm/nouveau/core/engine/fifo/nve0.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/core/engine/fifo/nve0.c b/drivers/gpu/drm/nouveau/core/engine/fifo/nve0.c
index 99c9dee..dbc3ff6 100644
--- a/drivers/gpu/drm/nouveau/core/engine/fifo/nve0.c
+++ b/drivers/gpu/drm/nouveau/core/engine/fifo/nve0.c
@@ -112,7 +112,7 @@ nve0_fifo_runlist_update(struct nve0_fifo_priv *priv, u32 engine)
 
 	nv_wr32(priv, 0x002270, cur->addr >> 12);
 	nv_wr32(priv, 0x002274, (engine << 20) | (p >> 3));
-	if (!nv_wait(priv, 0x002284 + (engine * 4), 0x00100000, 0x00000000))
+	if (!nv_wait(priv, 0x002284 + (engine * 8), 0x00100000, 0x00000000))
 		nv_error(priv, "runlist %d update timeout\n", engine);
 	mutex_unlock(&nv_subdev(priv)->mutex);
 }
-- 
1.8.5.3
