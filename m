From: Dmitry Eremin-Solenikov <dmitry_eremin-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] drm/nouveau/i2c: correct default settings for i2c
	ports
Date: Sat, 22 Sep 2012 21:33:50 +0400
Message-ID: <1348335230-20502-1-git-send-email-dmitry_eremin@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Fix typo introduced when converting to core infrastructure.

Signed-off-by: Dmitry Eremin-Solenikov <dmitry_eremin-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/nouveau/core/subdev/bios/i2c.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/core/subdev/bios/i2c.c b/drivers/gpu/drm/nouveau/core/subdev/bios/i2c.c
index 5fcce5d..ad577db 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/bios/i2c.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/bios/i2c.c
@@ -112,13 +112,13 @@ dcb_i2c_parse(struct nouveau_bios *bios, u8 idx, struct dcb_i2c_entry *info)
 			info->drive = nv_ro08(bios, ent + 4);
 			if (!info->drive) info->drive = 0x3f;
 			info->sense = nv_ro08(bios, ent + 5);
-			if (!info->sense) info->drive = 0x3e;
+			if (!info->sense) info->sense = 0x3e;
 		} else
 		if (idx == 1) {
 			info->drive = nv_ro08(bios, ent + 6);
 			if (!info->drive) info->drive = 0x37;
 			info->sense = nv_ro08(bios, ent + 7);
-			if (!info->sense) info->drive = 0x36;
+			if (!info->sense) info->sense = 0x36;
 		}
 
 		info->type = DCB_I2C_NV04_BIT;
-- 
1.7.10.4
