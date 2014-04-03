From: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>
Subject: [PATCH] bios: fix a potential NULL deref in the PROM
	shadowing function
Date: Thu,  3 Apr 2014 22:12:41 +0200
Message-ID: <1396555961-2252-1-git-send-email-martin.peres@free.fr>
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
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Reported-by: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>
---
 nvkm/subdev/bios/base.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/nvkm/subdev/bios/base.c b/nvkm/subdev/bios/base.c
index 3de7d81..5f8643d 100644
--- a/nvkm/subdev/bios/base.c
+++ b/nvkm/subdev/bios/base.c
@@ -183,10 +183,11 @@ nouveau_bios_shadow_prom(struct nouveau_bios *bios)
 		goto out;
 
 	bios->data = kmalloc(bios->size, GFP_KERNEL);
-	if (bios->data) {
-		for (i = 0; i < bios->size; i += 4)
-			((u32 *)bios->data)[i/4] = nv_rd32(bios, 0x300000 + i);
-	}
+	if (!bios->data)
+		goto out;
+
+	for (i = 0; i < bios->size; i += 4)
+		((u32 *)bios->data)[i/4] = nv_rd32(bios, 0x300000 + i);
 
 	/* check the PCI record header */
 	pcir = nv_ro16(bios, 0x0018);
-- 
1.9.1
