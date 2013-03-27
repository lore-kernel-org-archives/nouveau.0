From: Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
Subject: [PATCH 3/4] drm/nvc0: add software methods to control
	some MP regs
Date: Wed, 27 Mar 2013 22:16:55 +0100
Message-ID: <1364419016-18275-3-git-send-email-e0425955@student.tuwien.ac.at>
References: <1364419016-18275-1-git-send-email-e0425955@student.tuwien.ac.at>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1364419016-18275-1-git-send-email-e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
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

---
 .../gpu/drm/nouveau/core/engine/software/nvc0.c    |   29 ++++++++++++++++++++
 1 files changed, 29 insertions(+), 0 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/core/engine/software/nvc0.c b/drivers/gpu/drm/nouveau/core/engine/software/nvc0.c
index a523eaa..d698e71 100644
--- a/drivers/gpu/drm/nouveau/core/engine/software/nvc0.c
+++ b/drivers/gpu/drm/nouveau/core/engine/software/nvc0.c
@@ -94,6 +94,32 @@ nvc0_software_mthd_flip(struct nouveau_object *object, u32 mthd,
 	return -EINVAL;
 }
 
+static int
+nvc0_software_mthd_mp_control(struct nouveau_object *object, u32 mthd,
+                              void *args, u32 size)
+{
+	struct nvc0_software_chan *chan = (void *)nv_engctx(object->parent);
+	struct nvc0_software_priv *priv = (void *)nv_object(chan)->engine;
+	u32 data = *(u32 *)args;
+
+	switch (mthd) {
+	case 0x600:
+		nv_wr32(priv, 0x419e00, data); /* MP.PM_UNK000 */
+		break;
+	case 0x644:
+		if (data & ~0x1ffffe)
+			return -EINVAL;
+		nv_wr32(priv, 0x419e44, data); /* MP.TRAP_WARP_ERROR_EN */
+		break;
+	case 0x6ac:
+		nv_wr32(priv, 0x419eac, data); /* MP.PM_UNK0AC */
+		break;
+	default:
+		return -EINVAL;
+	}
+	return 0;
+}
+
 static struct nouveau_omthds
 nvc0_software_omthds[] = {
 	{ 0x0400, 0x0400, nvc0_software_mthd_vblsem_offset },
@@ -101,6 +127,9 @@ nvc0_software_omthds[] = {
 	{ 0x0408, 0x0408, nvc0_software_mthd_vblsem_value },
 	{ 0x040c, 0x040c, nvc0_software_mthd_vblsem_release },
 	{ 0x0500, 0x0500, nvc0_software_mthd_flip },
+	{ 0x0600, 0x0600, nvc0_software_mthd_mp_control },
+	{ 0x0644, 0x0644, nvc0_software_mthd_mp_control },
+	{ 0x06ac, 0x06ac, nvc0_software_mthd_mp_control },
 	{}
 };
 
-- 
1.7.3.4
