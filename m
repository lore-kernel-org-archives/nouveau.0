From: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>
Subject: [PATCH 3/3] therm/nv84+: do not expose non-calibrated
	internal temp sensor
Date: Sun, 24 Aug 2014 23:15:11 +0200
Message-ID: <1408914911-5022-3-git-send-email-martin.peres@free.fr>
References: <1408914911-5022-1-git-send-email-martin.peres@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1408914911-5022-1-git-send-email-martin.peres-GANU6spQydw@public.gmane.org>
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

Signed-off-by: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>
---
 nvkm/subdev/therm/nv84.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/nvkm/subdev/therm/nv84.c b/nvkm/subdev/therm/nv84.c
index 38b16d9..14e2e09 100644
--- a/nvkm/subdev/therm/nv84.c
+++ b/nvkm/subdev/therm/nv84.c
@@ -33,7 +33,12 @@ struct nv84_therm_priv {
 int
 nv84_temp_get(struct nouveau_therm *therm)
 {
-	return nv_rd32(therm, 0x20400);
+	struct nouveau_fuse *fuse = nouveau_fuse(therm);
+
+	if (nv_ro32(fuse, 0x1a8) == 1)
+		return nv_rd32(therm, 0x20400);
+	else
+		return -ENODEV;
 }
 
 void
-- 
2.0.0
