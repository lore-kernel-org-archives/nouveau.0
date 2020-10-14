From: Keita Suzuki <keitasuzuki.park@sslab.ics.keio.ac.jp>
Subject: [PATCH RFC] drm/nouveau: fix memory leak in nvkm_iccsense_oneinit
Date: Wed, 14 Oct 2020 07:54:16 +0000
Message-ID: <20201014075419.19974-1-keitasuzuki.park@sslab.ics.keio.ac.jp>
Return-path: <linux-kernel-owner@vger.kernel.org>
Cc: keitasuzuki.park@sslab.ics.keio.ac.jp, takafumi@sslab.ics.keio.ac.jp, Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

struct pw_rail_t is allocated as an array in function nvios_iccsense_parse,
and stored to a struct member of local variable. However, the array is not
freed when the local variable becomes invalid, and the reference is not
passed on, leading to a memory leak.

Fix this by freeing struct pw_rail_t when exiting nvkm_iccsense_oneinit.

Signed-off-by: Keita Suzuki <keitasuzuki.park@sslab.ics.keio.ac.jp>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c b/drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c
index fecfa6afcf54..8ba8d8e3f52a 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c
@@ -280,8 +280,10 @@ nvkm_iccsense_oneinit(struct nvkm_subdev *subdev)
 			}
 
 			rail = kmalloc(sizeof(*rail), GFP_KERNEL);
-			if (!rail)
+			if (!rail) {
+				kfree(stbl.rail);
 				return -ENOMEM;
+			}
 
 			rail->read = read;
 			rail->sensor = sensor;
@@ -291,6 +293,7 @@ nvkm_iccsense_oneinit(struct nvkm_subdev *subdev)
 			list_add_tail(&rail->head, &iccsense->rails);
 		}
 	}
+	kfree(stbl.rail);
 	return 0;
 }
 
-- 
2.17.1
