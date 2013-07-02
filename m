From: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] drm/nv50-/disp: Use output specific mask in
	interrupt
Date: Tue,  2 Jul 2013 14:44:12 +0100
Message-ID: <1372772652-3154-1-git-send-email-emil.l.velikov@gmail.com>
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
Cc: stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "[3.9+]"@freedesktop.org, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

The commit

   commit 476e84e126171d809f9c0b5d97137f5055f95ca8
   Author: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
   Date:   Mon Feb 11 09:24:23 2013 +1000

       drm/nv50-/disp: initial supervisor support for off-chip encoders

changed the write mask in one of the interrupt functions for on-chip encoders,
causing a regression in certain VGA dual-head setups. This commit reintroduces
the mask thus resolving the regression

Bugzilla: https://bugs.freedesktop.org/show_bug.cgi?id=66129
Reported-and-Tested-by: Yves-Alexis <corsac-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org [3.9+]
CC: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/nouveau/core/engine/disp/nv50.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/core/engine/disp/nv50.c b/drivers/gpu/drm/nouveau/core/engine/disp/nv50.c
index 8b42f45..7ffe2f3 100644
--- a/drivers/gpu/drm/nouveau/core/engine/disp/nv50.c
+++ b/drivers/gpu/drm/nouveau/core/engine/disp/nv50.c
@@ -1107,6 +1107,7 @@ nv50_disp_intr_unk20_2(struct nv50_disp_priv *priv, int head)
 	u32 pclk = nv_rd32(priv, 0x610ad0 + (head * 0x540)) & 0x3fffff;
 	u32 hval, hreg = 0x614200 + (head * 0x800);
 	u32 oval, oreg;
+	u32 mask;
 	u32 conf = exec_clkcmp(priv, head, 0xff, pclk, &outp);
 	if (conf != ~0) {
 		if (outp.location == 0 && outp.type == DCB_OUTPUT_DP) {
@@ -1133,6 +1134,7 @@ nv50_disp_intr_unk20_2(struct nv50_disp_priv *priv, int head)
 			oreg = 0x614280 + (ffs(outp.or) - 1) * 0x800;
 			oval = 0x00000000;
 			hval = 0x00000000;
+			mask = 0xffffffff;
 		} else
 		if (!outp.location) {
 			if (outp.type == DCB_OUTPUT_DP)
@@ -1140,14 +1142,16 @@ nv50_disp_intr_unk20_2(struct nv50_disp_priv *priv, int head)
 			oreg = 0x614300 + (ffs(outp.or) - 1) * 0x800;
 			oval = (conf & 0x0100) ? 0x00000101 : 0x00000000;
 			hval = 0x00000000;
+			mask = 0x00000707;
 		} else {
 			oreg = 0x614380 + (ffs(outp.or) - 1) * 0x800;
 			oval = 0x00000001;
 			hval = 0x00000001;
+			mask = 0x00000707;
 		}
 
 		nv_mask(priv, hreg, 0x0000000f, hval);
-		nv_mask(priv, oreg, 0x00000707, oval);
+		nv_mask(priv, oreg, mask, oval);
 	}
 }
 
-- 
1.8.3.2
