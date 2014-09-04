From: Roy Spliet <rspliet-pPYjZ15w/Xhulxpn9UvDqw@public.gmane.org>
Subject: [PATCH 7/8] fb/sddr3: Expand MR generation
Date: Thu,  4 Sep 2014 16:58:54 +0200
Message-ID: <1409842735-7361-8-git-send-email-rspliet@eclipso.eu>
References: <1409842735-7361-1-git-send-email-rspliet@eclipso.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1409842735-7361-1-git-send-email-rspliet-pPYjZ15w/Xhulxpn9UvDqw@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Nouveau Mailinglist <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Cc: Roy Spliet <rspliet-pPYjZ15w/Xhulxpn9UvDqw@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Signed-off-by: Roy Spliet <rspliet-pPYjZ15w/Xhulxpn9UvDqw@public.gmane.org>
---
 drivers/gpu/drm/nouveau/core/subdev/fb/sddr3.c | 43 ++++++++++++++++++++------
 1 file changed, 33 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/core/subdev/fb/sddr3.c b/drivers/gpu/drm/nouveau/core/subdev/fb/sddr3.c
index ebd4cd9..f84c654 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/fb/sddr3.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/fb/sddr3.c
@@ -20,6 +20,7 @@
  * OTHER DEALINGS IN THE SOFTWARE.
  *
  * Authors: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
+ * 	    Roy Spliet <rspliet-pPYjZ15w/Xhulxpn9UvDqw@public.gmane.org>
  */
 
 #include <subdev/bios.h>
@@ -70,30 +71,52 @@ int
 nouveau_sddr3_calc(struct nouveau_ram *ram)
 {
 	struct nouveau_bios *bios = nouveau_bios(ram);
-	int WL, CL, WR;
+	int CWL, CL, WR, DLL = 0, ODT = 0;
 
 	switch (!!ram->timing.data * ram->timing.version) {
+	case 0x10:
+		if (ram->timing.size < 0x17) {
+			/* XXX: NV50: Get CWL from the timing register */
+			return -ENOSYS;
+		}
+		CWL =   nv_ro08(bios, ram->timing.data + 0x13);
+		CL  =   nv_ro08(bios, ram->timing.data + 0x02);
+		WR  =   nv_ro08(bios, ram->timing.data + 0x00);
+		DLL = !(nv_ro08(bios, ram->ramcfg.data + 0x02) & 0x40);
+		ODT =   nv_ro08(bios, ram->timing.data + 0x0e) & 0x07;
+		break;
 	case 0x20:
-		WL = (nv_ro16(bios, ram->timing.data + 0x04) & 0x0f80) >> 7;
-		CL =  nv_ro08(bios, ram->timing.data + 0x04) & 0x1f;
-		WR =  nv_ro08(bios, ram->timing.data + 0x0a) & 0x7f;
+		CWL =  (nv_ro16(bios, ram->timing.data + 0x04) & 0x0f80) >> 7;
+		CL  =   nv_ro08(bios, ram->timing.data + 0x04) & 0x1f;
+		WR  =   nv_ro08(bios, ram->timing.data + 0x0a) & 0x7f;
+		/* XXX: Get these values from the VBIOS instead */
+		DLL = !(ram->mr[1] & 0x1);
+		ODT =   (ram->mr[1] & 0x004) >> 2 |
+			(ram->mr[1] & 0x040) >> 5 |
+		        (ram->mr[1] & 0x200) >> 7;
 		break;
 	default:
 		return -ENOSYS;
 	}
 
-	WL = ramxlat(ramddr3_cwl, WL);
-	CL = ramxlat(ramddr3_cl, CL);
-	WR = ramxlat(ramddr3_wr, WR);
-	if (WL < 0 || CL < 0 || WR < 0)
+	CWL = ramxlat(ramddr3_cwl, CWL);
+	CL  = ramxlat(ramddr3_cl, CL);
+	WR  = ramxlat(ramddr3_wr, WR);
+	if (CL < 0 || CWL < 0 || WR < 0)
 		return -EINVAL;
 
-	ram->mr[0] &= ~0xe74;
+	ram->mr[0] &= ~0xf74;
 	ram->mr[0] |= (WR & 0x07) << 9;
 	ram->mr[0] |= (CL & 0x0e) << 3;
 	ram->mr[0] |= (CL & 0x01) << 2;
 
+	ram->mr[1] &= ~0x245;
+	ram->mr[1] |= (ODT & 0x1) << 2;
+	ram->mr[1] |= (ODT & 0x2) << 5;
+	ram->mr[1] |= (ODT & 0x4) << 7;
+	ram->mr[1] |= !DLL;
+
 	ram->mr[2] &= ~0x038;
-	ram->mr[2] |= (WL & 0x07) << 3;
+	ram->mr[2] |= (CWL & 0x07) << 3;
 	return 0;
 }
-- 
1.9.3
