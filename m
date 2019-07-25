From: Lyude Paul <lyude@redhat.com>
Subject: [PATCH 1/2] drm/nouveau: Fix missing elses in g94_i2c_aux_xfer
Date: Thu, 25 Jul 2019 15:40:00 -0400
Message-ID: <20190725194005.16572-2-lyude@redhat.com>
References: <20190725194005.16572-1-lyude@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190725194005.16572-1-lyude@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: nouveau@lists.freedesktop.org
Cc: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

This looks rather unintentional!

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxg94.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxg94.c b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxg94.c
index c8ab1b5741a3..9bc9eac08789 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxg94.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxg94.c
@@ -138,9 +138,9 @@ g94_i2c_aux_xfer(struct nvkm_i2c_aux *obj, bool retry,
 		if ((stat & 0x000f0000) == 0x00080000 ||
 		    (stat & 0x000f0000) == 0x00020000)
 			ret = 1;
-		if ((stat & 0x00000100))
+		else if ((stat & 0x00000100))
 			ret = -ETIMEDOUT;
-		if ((stat & 0x00000e00))
+		else if ((stat & 0x00000e00))
 			ret = -EIO;
 
 		AUX_TRACE(&aux->base, "%02d %08x %08x", retries, ctrl, stat);
-- 
2.21.0
