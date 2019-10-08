From: Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [PATCH 5/5] drm/nouveau/disp/gv100: make gv100_disp_wimm static
Date: Tue,  8 Oct 2019 12:35:59 +0100
Message-ID: <20191008113559.29569-5-ben.dooks@codethink.co.uk>
References: <20191008113559.29569-1-ben.dooks@codethink.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191008113559.29569-1-ben.dooks@codethink.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Ben Dooks <ben.dooks@codethink.co.uk>
List-Id: nouveau.vger.kernel.org

The gv100_disp_wimm is not declared, so make it static
to avoid the following warning:

drivers/gpu/drm/nouveau/nvkm/engine/disp/wimmgv100.c:39:1: warning: symbol 'gv100_disp_wimm' was not declared. Should it be static?

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
 drivers/gpu/drm/nouveau/nvkm/engine/disp/wimmgv100.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/wimmgv100.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/wimmgv100.c
index 89d783368b4f..bb4db6351ddf 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/wimmgv100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/wimmgv100.c
@@ -35,7 +35,7 @@ gv100_disp_wimm_intr(struct nv50_disp_chan *chan, bool en)
 	nvkm_mask(device, 0x611da8, mask, data);
 }
 
-const struct nv50_disp_chan_func
+static const struct nv50_disp_chan_func
 gv100_disp_wimm = {
 	.init = gv100_disp_dmac_init,
 	.fini = gv100_disp_dmac_fini,
-- 
2.23.0
