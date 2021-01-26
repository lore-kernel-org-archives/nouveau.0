From: Lyude Paul <lyude@redhat.com>
Subject: [RFC v2 1/5] drm/nouveau/kms/nv40-/backlight: Assign
 prop type once
Date: Mon, 25 Jan 2021 19:10:27 -0500
Message-ID: <20210126001031.881048-2-lyude@redhat.com>
References: <20210126001031.881048-1-lyude@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <intel-gfx-bounces@lists.freedesktop.org>
In-Reply-To: <20210126001031.881048-1-lyude@redhat.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>, David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>, greg.depoire@gmail.com, Ben Skeggs <bskeggs@redhat.com>
List-Id: nouveau.vger.kernel.org

Signed-off-by: Lyude Paul <lyude@redhat.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Dave Airlie <airlied@gmail.com>
Cc: greg.depoire@gmail.com
---
 drivers/gpu/drm/nouveau/nouveau_backlight.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_backlight.c b/drivers/gpu/drm/nouveau/nouveau_backlight.c
index 72f35a2babcb..42b498e7e2bf 100644
--- a/drivers/gpu/drm/nouveau/nouveau_backlight.c
+++ b/drivers/gpu/drm/nouveau/nouveau_backlight.c
@@ -106,7 +106,6 @@ nv40_backlight_init(struct nouveau_encoder *encoder,
 	if (!(nvif_rd32(device, NV40_PMC_BACKLIGHT) & NV40_PMC_BACKLIGHT_MASK))
 		return -ENODEV;
 
-	props->type = BACKLIGHT_RAW;
 	props->max_brightness = 31;
 	*ops = &nv40_bl_ops;
 	return 0;
@@ -212,7 +211,6 @@ nv50_backlight_init(struct nouveau_encoder *nv_encoder,
 	else
 		*ops = &nva3_bl_ops;
 
-	props->type = BACKLIGHT_RAW;
 	props->max_brightness = 100;
 
 	return 0;
@@ -226,7 +224,7 @@ nouveau_backlight_init(struct drm_connector *connector)
 	struct nouveau_encoder *nv_encoder = NULL;
 	struct nvif_device *device = &drm->client.device;
 	char backlight_name[BL_NAME_SIZE];
-	struct backlight_properties props = {0};
+	struct backlight_properties props = { .type = BACKLIGHT_RAW, 0 };
 	const struct backlight_ops *ops;
 	int ret;
 
-- 
2.29.2
