From: "Gustavo A. R. Silva" <garsilva@embeddedor.com>
Subject: [PATCH] drm/nouveau/devinit/nv04: mark expected switch fall-throughs
Date: Thu, 2 Nov 2017 15:06:25 -0500
Message-ID: <20171102200625.GA9199@embeddedor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org, "Gustavo A. R. Silva" <garsilva@embeddedor.com>
List-Id: nouveau.vger.kernel.org

In preparation to enabling -Wimplicit-fallthrough, mark switch cases
where we are expecting to fall through.

Addresses-Coverity-ID: 143119
Addresses-Coverity-ID: 143120
Addresses-Coverity-ID: 143121
Addresses-Coverity-ID: 143122
Addresses-Coverity-ID: 143123
Addresses-Coverity-ID: 143124
Signed-off-by: Gustavo A. R. Silva <garsilva@embeddedor.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/devinit/nv04.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/nv04.c b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/nv04.c
index 158977f..c3dae05 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/nv04.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/nv04.c
@@ -119,11 +119,11 @@ powerctrl_1_shift(int chip_version, int reg)
 
 	switch (reg) {
 	case 0x680520:
-		shift += 4;
+		shift += 4; /* fall through */
 	case 0x680508:
-		shift += 4;
+		shift += 4; /* fall through */
 	case 0x680504:
-		shift += 4;
+		shift += 4; /* fall through */
 	case 0x680500:
 		shift += 4;
 	}
@@ -245,11 +245,11 @@ setPLL_double_highregs(struct nvkm_devinit *init, u32 reg1,
 
 		switch (reg1) {
 		case 0x680504:
-			shift_c040 += 2;
+			shift_c040 += 2; /* fall through */
 		case 0x680500:
-			shift_c040 += 2;
+			shift_c040 += 2; /* fall through */
 		case 0x680520:
-			shift_c040 += 2;
+			shift_c040 += 2; /* fall through */
 		case 0x680508:
 			shift_c040 += 2;
 		}
-- 
2.7.4
