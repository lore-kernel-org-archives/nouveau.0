From: Lucas Stach <dev@lynxeye.de>
Subject: [PATCH 5/6] drm/nouveau: map IB write-combined
Date: Wed, 28 Aug 2013 02:00:49 +0200
Message-ID: <1377648050-6649-6-git-send-email-dev@lynxeye.de>
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
 drivers/gpu/drm/nouveau/nouveau_chan.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.c b/drivers/gpu/drm/nouveau/nouveau_chan.c
index e84f4c3..3b54e8f 100644
--- a/drivers/gpu/drm/nouveau/nouveau_chan.c
+++ b/drivers/gpu/drm/nouveau/nouveau_chan.c
@@ -114,7 +114,8 @@ nouveau_channel_prep(struct nouveau_drm *drm, struct nouveau_cli *cli,
 	if (nouveau_vram_pushbuf)
 		target = TTM_PL_FLAG_VRAM;
 
-	ret = nouveau_bo_new(drm->dev, size, 0, target, 0, 0, NULL,
+	ret = nouveau_bo_new(drm->dev, size, 0, target, 0,
+			    NOUVEAU_GEM_TILE_WCUS, NULL,
 			    &chan->push.buffer);
 	if (ret == 0) {
 		ret = nouveau_bo_pin(chan->push.buffer, target);
-- 
1.8.3.1
