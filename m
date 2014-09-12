From: Roy Spliet <rspliet-pPYjZ15w/Xhulxpn9UvDqw@public.gmane.org>
Subject: [PATCH 1/6] bios: Add rammap support for version 1.0
Date: Fri, 12 Sep 2014 18:00:12 +0200
Message-ID: <1410537617-8269-2-git-send-email-rspliet@eclipso.eu>
References: <1410537617-8269-1-git-send-email-rspliet@eclipso.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1410537617-8269-1-git-send-email-rspliet-pPYjZ15w/Xhulxpn9UvDqw@public.gmane.org>
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
 drivers/gpu/drm/nouveau/core/subdev/bios/rammap.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/core/subdev/bios/rammap.c b/drivers/gpu/drm/nouveau/core/subdev/bios/rammap.c
index 8b0dda5..ae3d956 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/bios/rammap.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/bios/rammap.c
@@ -84,6 +84,10 @@ nvbios_rammapEp(struct nouveau_bios *bios, int idx,
 	p->rammap_ver = *ver;
 	p->rammap_hdr = *hdr;
 	switch (!!data * *ver) {
+	case 0x10:
+		p->rammap_min      =  nv_ro16(bios, data + 0x00);
+		p->rammap_max      =  nv_ro16(bios, data + 0x02);
+		break;
 	case 0x11:
 		p->rammap_min      =  nv_ro16(bios, data + 0x00);
 		p->rammap_max      =  nv_ro16(bios, data + 0x02);
-- 
1.9.3
