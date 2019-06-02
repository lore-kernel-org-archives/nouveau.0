From: Rhys Kidd <rhyskidd@gmail.com>
Subject: [PATCH 1/2] drm/nouveau/bios/init: handle INIT_RESET_BEGUN devinit opcode
Date: Mon,  3 Jun 2019 00:13:14 +1000
Message-ID: <20190602141315.6197-2-rhyskidd@gmail.com>
References: <20190602141315.6197-1-rhyskidd@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190602141315.6197-1-rhyskidd@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org, Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, Ilia Mirkin <imirkin@alum.mit.edu>
Cc: Rhys Kidd <rhyskidd@gmail.com>
List-Id: nouveau.vger.kernel.org

Signal that the reset sequence has begun.

This opcode signals that the software reset sequence has begun.
Ordinarily, no actual operations are performed by the opcode.
However it allows for possible software work arounds by devinit
engines in software agents other than the VBIOS, such as the resman,
FCODE, and EFI driver.

Signed-off-by: Rhys Kidd <rhyskidd@gmail.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/bios/init.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/init.c b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/init.c
index ec0e9f7224b5..a54b5e410dcd 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/init.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/init.c
@@ -1934,6 +1934,17 @@ init_ram_restrict_pll(struct nvbios_init *init)
 	}
 }
 
+/**
+ * INIT_RESET_BEGUN - opcode 0x8c
+ *
+ */
+static void
+init_reset_begun(struct nvbios_init *init)
+{
+	trace("RESET_BEGUN\n");
+	init->offset += 1;
+}
+
 /**
  * INIT_GPIO - opcode 0x8e
  *
@@ -2260,7 +2271,7 @@ static struct nvbios_init_opcode {
 	[0x79] = { init_pll },
 	[0x7a] = { init_zm_reg },
 	[0x87] = { init_ram_restrict_pll },
-	[0x8c] = { init_reserved },
+	[0x8c] = { init_reset_begun },
 	[0x8d] = { init_reserved },
 	[0x8e] = { init_gpio },
 	[0x8f] = { init_ram_restrict_zm_reg_group },
-- 
2.20.1
