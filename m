From: Roy Spliet <r.spliet-oe7qfRrRQfeEZXFvZSAUrfP6llvjuJOh@public.gmane.org>
Subject: [PATCH] drm/nvc0-/ltcg: Fix build on 32-bit platforms
Date: Sun, 14 Apr 2013 11:57:45 +0200
Message-ID: <1365933465-6329-2-git-send-email-r.spliet@student.tudelft.nl>
References: <1365933465-6329-1-git-send-email-r.spliet@student.tudelft.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1365933465-6329-1-git-send-email-r.spliet-oe7qfRrRQfeEZXFvZSAUrfP6llvjuJOh@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Nouveau Mailinglist <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Cc: Roy Spliet <r.spliet-oe7qfRrRQfeEZXFvZSAUrfP6llvjuJOh@public.gmane.org>
List-Id: nouveau.vger.kernel.org

---
 drivers/gpu/drm/nouveau/core/subdev/ltcg/nvc0.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/core/subdev/ltcg/nvc0.c b/drivers/gpu/drm/nouveau/core/subdev/ltcg/nvc0.c
index a529563..6fab663 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/ltcg/nvc0.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/ltcg/nvc0.c
@@ -151,7 +151,7 @@ nvc0_ltcg_init_tag_ram(struct nouveau_fb *pfb, struct nvc0_ltcg_priv *priv)
 		u64 tag_base = (priv->tag_ram->offset << 12) + tag_margin;
 
 		tag_base += tag_align - 1;
-		tag_base /= tag_align;
+		tag_base = do_div(tag_base, tag_align);
 
 		nv_wr32(priv, 0x17e8d4, tag_base);
 	}
-- 
1.8.1.4
