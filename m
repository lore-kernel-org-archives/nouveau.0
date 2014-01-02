From: Maarten Lankhorst <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Subject: [PATCH] drm/nvc0-: Fix voltage obtained from vbios.
Date: Thu, 02 Jan 2014 17:12:26 +0100
Message-ID: <52C58FEA.7080702@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Coefficients are based on the formula:

uV = 0.1 * arg[0] + 150.5 * arg[1] + 22.65025 * arg[2]

It seems to be rounded downwards. I have no idea why the voltage isn't
specified in the bios directly.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
----
diff --git a/drivers/gpu/drm/nouveau/core/subdev/bios/vmap.c b/drivers/gpu/drm/nouveau/core/subdev/bios/vmap.c
index f343a1b060e8..0a18f9496103 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/bios/vmap.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/bios/vmap.c
@@ -87,14 +87,25 @@ nvbios_vmap_entry_parse(struct nouveau_bios *bios, int idx, u8 *ver, u8 *len,
 	u16 vmap = nvbios_vmap_entry(bios, idx, ver, len);
 	memset(info, 0x00, sizeof(*info));
 	switch (!!vmap * *ver) {
-	case 0x10:
+	case 0x10: {
+		s32 accum, b, c;
+
 		info->link   = 0xff;
 		info->min    = nv_ro32(bios, vmap + 0x00);
 		info->max    = nv_ro32(bios, vmap + 0x04);
-		info->arg[0] = nv_ro32(bios, vmap + 0x08);
-		info->arg[1] = nv_ro32(bios, vmap + 0x0c);
-		info->arg[2] = nv_ro32(bios, vmap + 0x10);
+
+		accum = nv_ro32(bios, vmap + 0x08);
+		b = nv_ro32(bios, vmap + 0x0c);
+		c = nv_ro32(bios, vmap + 0x10);
+
+		accum += b * 1505;
+		accum += (c * 453 / 2) + c / 400;
+		accum /= 10;
+
+		if (accum > info->min)
+			info->min = min((u32)accum, info->max);
 		break;
+	}
 	case 0x20:
 		info->unk0   = nv_ro08(bios, vmap + 0x00);
 		info->link   = nv_ro08(bios, vmap + 0x01);
diff --git a/drivers/gpu/drm/nouveau/core/subdev/volt/base.c b/drivers/gpu/drm/nouveau/core/subdev/volt/base.c
index 32794a999106..7bf716b048bd 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/volt/base.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/volt/base.c
@@ -50,12 +50,23 @@ nouveau_volt_set(struct nouveau_volt *volt, u32 uv)
 {
 	if (volt->vid_set) {
 		int i, ret = -EINVAL;
+		u32 best_uv = INT_MAX, best_vid = 0;
+
 		for (i = 0; i < volt->vid_nr; i++) {
-			if (volt->vid[i].uv == uv) {
-				ret = volt->vid_set(volt, volt->vid[i].vid);
-				nv_debug(volt, "set %duv: %d\n", uv, ret);
+			s32 delta = volt->vid[i].uv - uv;
+
+			if (delta < 0 || best_uv < volt->vid[i].uv)
+				continue;
+
+			best_uv = volt->vid[i].uv;
+			best_vid = volt->vid[i].vid;
+			if (!delta)
 				break;
-			}
+		}
+
+		if (best_uv < INT_MAX) {
+			ret = volt->vid_set(volt, best_vid);
+			nv_debug(volt, "set %duv from %duv: %d\n", best_uv, uv, ret);
 		}
 		return ret;
 	}
