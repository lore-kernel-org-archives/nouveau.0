From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH] copy: don't bother trying to create copy on
	pre-nva3
Date: Thu,  4 Sep 2014 15:27:53 -0400
Message-ID: <1409858873-21829-1-git-send-email-imirkin@alum.mit.edu>
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

Only the NVA3/5/8/F tesla chips have a copy engine. Don't bother trying
to create one on earlier tesla chips (and thus printing an error on
failure).

Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
---
 src/nouveau_copy.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/src/nouveau_copy.c b/src/nouveau_copy.c
index f46f0c3..3202121 100644
--- a/src/nouveau_copy.c
+++ b/src/nouveau_copy.c
@@ -61,6 +61,10 @@ nouveau_copy_init(ScreenPtr pScreen)
 
 	switch (pNv->Architecture) {
 	case NV_TESLA:
+		if (pNv->dev->chipset < 0xa3 ||
+		    pNv->dev->chipset == 0xaa ||
+		    pNv->dev->chipset == 0xac)
+			return FALSE;
 		data = &(struct nv04_fifo) {
 			.vram = NvDmaFB,
 			.gart = NvDmaTT,
-- 
1.8.5.5
