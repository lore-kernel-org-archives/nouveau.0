From: Roy Spliet <rspliet-pPYjZ15w/Xhulxpn9UvDqw@public.gmane.org>
Subject: [PATCH 4/8] fb/ramnve0: Disable FB before reclocking
Date: Thu,  4 Sep 2014 16:58:51 +0200
Message-ID: <1409842735-7361-5-git-send-email-rspliet@eclipso.eu>
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

This used to be done implicitly

Signed-off-by: Roy Spliet <rspliet-pPYjZ15w/Xhulxpn9UvDqw@public.gmane.org>
---
 drivers/gpu/drm/nouveau/core/subdev/fb/ramnve0.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/core/subdev/fb/ramnve0.c b/drivers/gpu/drm/nouveau/core/subdev/fb/ramnve0.c
index c5b46e3..9764792 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/fb/ramnve0.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/fb/ramnve0.c
@@ -998,6 +998,8 @@ nve0_ram_calc_xits(struct nouveau_fb *pfb, struct nouveau_ram_data *next)
 	if (ret)
 		return ret;
 
+	ram_fb_disable(fuc);
+
 	ram->mode = (next->freq > fuc->refpll.vco1.max_freq) ? 2 : 1;
 	ram->from = ram_rd32(fuc, 0x1373f4) & 0x0000000f;
 
@@ -1061,6 +1063,9 @@ nve0_ram_calc_xits(struct nouveau_fb *pfb, struct nouveau_ram_data *next)
 		break;
 	}
 
+	if (!ret)
+		ram_fb_enable(fuc);
+
 	return ret;
 }
 
-- 
1.9.3
