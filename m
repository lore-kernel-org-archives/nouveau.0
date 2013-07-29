From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH] drm/nouveau/vdec: copy nvc0 bsp/vp/ppp to nv98
Date: Sun, 28 Jul 2013 22:30:06 -0400
Message-ID: <1375065006-16944-1-git-send-email-imirkin@alum.mit.edu>
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
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

For NV98+, BSP/VP/PPP are all FUC-based engines. Hook them all up in the
same way as NVC0, but with a couple of different values. Also make sure
that the PPP engine is handled in the fifo/mc/vm.

Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
---

It seems like VP4.0 is basically working here... only mpeg2/vc1 work,
but I'm pretty sure that's just a user-side issue. My guess is that
VP3 will work the same way here, but if it doesn't, we can break out
the logic then.

 drivers/gpu/drm/nouveau/core/engine/bsp/nv98.c  | 52 +++++++++++++++++--------
 drivers/gpu/drm/nouveau/core/engine/fifo/nv84.c |  2 +
 drivers/gpu/drm/nouveau/core/engine/ppp/nv98.c  | 52 +++++++++++++++----------
 drivers/gpu/drm/nouveau/core/engine/vp/nv98.c   | 47 +++++++++++++++-------
 drivers/gpu/drm/nouveau/core/subdev/mc/nv98.c   |  3 +-
 drivers/gpu/drm/nouveau/core/subdev/vm/nv50.c   |  1 +
 6 files changed, 104 insertions(+), 53 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/core/engine/bsp/nv98.c b/drivers/gpu/drm/nouveau/core/engine/bsp/nv98.c
index 8bf92b0..6b089e0 100644
--- a/drivers/gpu/drm/nouveau/core/engine/bsp/nv98.c
+++ b/drivers/gpu/drm/nouveau/core/engine/bsp/nv98.c
@@ -19,16 +19,14 @@
  * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
  * OTHER DEALINGS IN THE SOFTWARE.
  *
- * Authors: Ben Skeggs
+ * Authors: Ben Skeggs, Maarten Lankhorst, Ilia Mirkin
  */
 
-#include <core/engctx.h>
-#include <core/class.h>
-
+#include <engine/falcon.h>
 #include <engine/bsp.h>
 
 struct nv98_bsp_priv {
-	struct nouveau_engine base;
+	struct nouveau_falcon base;
 };
 
 /*******************************************************************************
@@ -37,31 +35,49 @@ struct nv98_bsp_priv {
 
 static struct nouveau_oclass
 nv98_bsp_sclass[] = {
+	{ 0x88b1, &nouveau_object_ofuncs },
+	{ 0x85b1, &nouveau_object_ofuncs },
+	{ 0x86b1, &nouveau_object_ofuncs },
 	{},
 };
 
 /*******************************************************************************
- * BSP context
+ * PBSP context
  ******************************************************************************/
 
 static struct nouveau_oclass
 nv98_bsp_cclass = {
 	.handle = NV_ENGCTX(BSP, 0x98),
 	.ofuncs = &(struct nouveau_ofuncs) {
-		.ctor = _nouveau_engctx_ctor,
-		.dtor = _nouveau_engctx_dtor,
-		.init = _nouveau_engctx_init,
-		.fini = _nouveau_engctx_fini,
-		.rd32 = _nouveau_engctx_rd32,
-		.wr32 = _nouveau_engctx_wr32,
+		.ctor = _nouveau_falcon_context_ctor,
+		.dtor = _nouveau_falcon_context_dtor,
+		.init = _nouveau_falcon_context_init,
+		.fini = _nouveau_falcon_context_fini,
+		.rd32 = _nouveau_falcon_context_rd32,
+		.wr32 = _nouveau_falcon_context_wr32,
 	},
 };
 
 /*******************************************************************************
- * BSP engine/subdev functions
+ * PBSP engine/subdev functions
  ******************************************************************************/
 
 static int
+nv98_bsp_init(struct nouveau_object *object)
+{
+	struct nv98_bsp_priv *priv = (void *)object;
+	int ret;
+
+	ret = nouveau_falcon_init(&priv->base);
+	if (ret)
+		return ret;
+
+	nv_wr32(priv, 0x084010, 0x0000ffd2);
+	nv_wr32(priv, 0x08401c, 0x0000fff2);
+	return 0;
+}
+
+static int
 nv98_bsp_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
 	      struct nouveau_oclass *oclass, void *data, u32 size,
 	      struct nouveau_object **pobject)
@@ -69,7 +85,7 @@ nv98_bsp_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
 	struct nv98_bsp_priv *priv;
 	int ret;
 
-	ret = nouveau_engine_create(parent, engine, oclass, true,
+	ret = nouveau_falcon_create(parent, engine, oclass, 0x084000, true,
 				    "PBSP", "bsp", &priv);
 	*pobject = nv_object(priv);
 	if (ret)
@@ -86,8 +102,10 @@ nv98_bsp_oclass = {
 	.handle = NV_ENGINE(BSP, 0x98),
 	.ofuncs = &(struct nouveau_ofuncs) {
 		.ctor = nv98_bsp_ctor,
-		.dtor = _nouveau_engine_dtor,
-		.init = _nouveau_engine_init,
-		.fini = _nouveau_engine_fini,
+		.dtor = _nouveau_falcon_dtor,
+		.init = nv98_bsp_init,
+		.fini = _nouveau_falcon_fini,
+		.rd32 = _nouveau_falcon_rd32,
+		.wr32 = _nouveau_falcon_wr32,
 	},
 };
diff --git a/drivers/gpu/drm/nouveau/core/engine/fifo/nv84.c b/drivers/gpu/drm/nouveau/core/engine/fifo/nv84.c
index 7f53196..d4ed3b4 100644
--- a/drivers/gpu/drm/nouveau/core/engine/fifo/nv84.c
+++ b/drivers/gpu/drm/nouveau/core/engine/fifo/nv84.c
@@ -57,6 +57,7 @@ nv84_fifo_context_attach(struct nouveau_object *parent,
 	case NVDEV_ENGINE_SW   : return 0;
 	case NVDEV_ENGINE_GR   : addr = 0x0020; break;
 	case NVDEV_ENGINE_VP   : addr = 0x0040; break;
+	case NVDEV_ENGINE_PPP  :
 	case NVDEV_ENGINE_MPEG : addr = 0x0060; break;
 	case NVDEV_ENGINE_BSP  : addr = 0x0080; break;
 	case NVDEV_ENGINE_CRYPT: addr = 0x00a0; break;
@@ -92,6 +93,7 @@ nv84_fifo_context_detach(struct nouveau_object *parent, bool suspend,
 	case NVDEV_ENGINE_SW   : return 0;
 	case NVDEV_ENGINE_GR   : engn = 0; addr = 0x0020; break;
 	case NVDEV_ENGINE_VP   : engn = 3; addr = 0x0040; break;
+	case NVDEV_ENGINE_PPP  :
 	case NVDEV_ENGINE_MPEG : engn = 1; addr = 0x0060; break;
 	case NVDEV_ENGINE_BSP  : engn = 5; addr = 0x0080; break;
 	case NVDEV_ENGINE_CRYPT: engn = 4; addr = 0x00a0; break;
diff --git a/drivers/gpu/drm/nouveau/core/engine/ppp/nv98.c b/drivers/gpu/drm/nouveau/core/engine/ppp/nv98.c
index 5a5b2a7..13bf31c 100644
--- a/drivers/gpu/drm/nouveau/core/engine/ppp/nv98.c
+++ b/drivers/gpu/drm/nouveau/core/engine/ppp/nv98.c
@@ -19,21 +19,14 @@
  * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
  * OTHER DEALINGS IN THE SOFTWARE.
  *
- * Authors: Ben Skeggs
+ * Authors: Ben Skeggs, Maarten Lankhorst, Ilia Mirkin
  */
 
-#include <core/engine.h>
-#include <core/engctx.h>
-#include <core/class.h>
-
+#include <engine/falcon.h>
 #include <engine/ppp.h>
 
 struct nv98_ppp_priv {
-	struct nouveau_engine base;
-};
-
-struct nv98_ppp_chan {
-	struct nouveau_engctx base;
+	struct nouveau_falcon base;
 };
 
 /*******************************************************************************
@@ -42,6 +35,8 @@ struct nv98_ppp_chan {
 
 static struct nouveau_oclass
 nv98_ppp_sclass[] = {
+	{ 0x88b3, &nouveau_object_ofuncs },
+	{ 0x85b3, &nouveau_object_ofuncs },
 	{},
 };
 
@@ -53,12 +48,12 @@ static struct nouveau_oclass
 nv98_ppp_cclass = {
 	.handle = NV_ENGCTX(PPP, 0x98),
 	.ofuncs = &(struct nouveau_ofuncs) {
-		.ctor = _nouveau_engctx_ctor,
-		.dtor = _nouveau_engctx_dtor,
-		.init = _nouveau_engctx_init,
-		.fini = _nouveau_engctx_fini,
-		.rd32 = _nouveau_engctx_rd32,
-		.wr32 = _nouveau_engctx_wr32,
+		.ctor = _nouveau_falcon_context_ctor,
+		.dtor = _nouveau_falcon_context_dtor,
+		.init = _nouveau_falcon_context_init,
+		.fini = _nouveau_falcon_context_fini,
+		.rd32 = _nouveau_falcon_context_rd32,
+		.wr32 = _nouveau_falcon_context_wr32,
 	},
 };
 
@@ -67,6 +62,21 @@ nv98_ppp_cclass = {
  ******************************************************************************/
 
 static int
+nv98_ppp_init(struct nouveau_object *object)
+{
+	struct nv98_ppp_priv *priv = (void *)object;
+	int ret;
+
+	ret = nouveau_falcon_init(&priv->base);
+	if (ret)
+		return ret;
+
+	nv_wr32(priv, 0x086010, 0x0000ffd2);
+	nv_wr32(priv, 0x08601c, 0x0000fff2);
+	return 0;
+}
+
+static int
 nv98_ppp_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
 	      struct nouveau_oclass *oclass, void *data, u32 size,
 	      struct nouveau_object **pobject)
@@ -74,7 +84,7 @@ nv98_ppp_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
 	struct nv98_ppp_priv *priv;
 	int ret;
 
-	ret = nouveau_engine_create(parent, engine, oclass, true,
+	ret = nouveau_falcon_create(parent, engine, oclass, 0x086000, true,
 				    "PPPP", "ppp", &priv);
 	*pobject = nv_object(priv);
 	if (ret)
@@ -91,8 +101,10 @@ nv98_ppp_oclass = {
 	.handle = NV_ENGINE(PPP, 0x98),
 	.ofuncs = &(struct nouveau_ofuncs) {
 		.ctor = nv98_ppp_ctor,
-		.dtor = _nouveau_engine_dtor,
-		.init = _nouveau_engine_init,
-		.fini = _nouveau_engine_fini,
+		.dtor = _nouveau_falcon_dtor,
+		.init = nv98_ppp_init,
+		.fini = _nouveau_falcon_fini,
+		.rd32 = _nouveau_falcon_rd32,
+		.wr32 = _nouveau_falcon_wr32,
 	},
 };
diff --git a/drivers/gpu/drm/nouveau/core/engine/vp/nv98.c b/drivers/gpu/drm/nouveau/core/engine/vp/nv98.c
index 8a8236b..fc9ae0f 100644
--- a/drivers/gpu/drm/nouveau/core/engine/vp/nv98.c
+++ b/drivers/gpu/drm/nouveau/core/engine/vp/nv98.c
@@ -19,16 +19,14 @@
  * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
  * OTHER DEALINGS IN THE SOFTWARE.
  *
- * Authors: Ben Skeggs
+ * Authors: Ben Skeggs, Maarten Lankhorst, Ilia Mirkin
  */
 
-#include <core/engctx.h>
-#include <core/class.h>
-
+#include <engine/falcon.h>
 #include <engine/vp.h>
 
 struct nv98_vp_priv {
-	struct nouveau_engine base;
+	struct nouveau_falcon base;
 };
 
 /*******************************************************************************
@@ -37,6 +35,8 @@ struct nv98_vp_priv {
 
 static struct nouveau_oclass
 nv98_vp_sclass[] = {
+	{ 0x88b2, &nouveau_object_ofuncs },
+	{ 0x85b2, &nouveau_object_ofuncs },
 	{},
 };
 
@@ -48,12 +48,12 @@ static struct nouveau_oclass
 nv98_vp_cclass = {
 	.handle = NV_ENGCTX(VP, 0x98),
 	.ofuncs = &(struct nouveau_ofuncs) {
-		.ctor = _nouveau_engctx_ctor,
-		.dtor = _nouveau_engctx_dtor,
-		.init = _nouveau_engctx_init,
-		.fini = _nouveau_engctx_fini,
-		.rd32 = _nouveau_engctx_rd32,
-		.wr32 = _nouveau_engctx_wr32,
+		.ctor = _nouveau_falcon_context_ctor,
+		.dtor = _nouveau_falcon_context_dtor,
+		.init = _nouveau_falcon_context_init,
+		.fini = _nouveau_falcon_context_fini,
+		.rd32 = _nouveau_falcon_context_rd32,
+		.wr32 = _nouveau_falcon_context_wr32,
 	},
 };
 
@@ -62,6 +62,21 @@ nv98_vp_cclass = {
  ******************************************************************************/
 
 static int
+nv98_vp_init(struct nouveau_object *object)
+{
+	struct nv98_vp_priv *priv = (void *)object;
+	int ret;
+
+	ret = nouveau_falcon_init(&priv->base);
+	if (ret)
+		return ret;
+
+	nv_wr32(priv, 0x085010, 0x0000ffd2);
+	nv_wr32(priv, 0x08501c, 0x0000fff2);
+	return 0;
+}
+
+static int
 nv98_vp_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
 	     struct nouveau_oclass *oclass, void *data, u32 size,
 	     struct nouveau_object **pobject)
@@ -69,7 +84,7 @@ nv98_vp_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
 	struct nv98_vp_priv *priv;
 	int ret;
 
-	ret = nouveau_engine_create(parent, engine, oclass, true,
+	ret = nouveau_falcon_create(parent, engine, oclass, 0x085000, true,
 				    "PVP", "vp", &priv);
 	*pobject = nv_object(priv);
 	if (ret)
@@ -86,8 +101,10 @@ nv98_vp_oclass = {
 	.handle = NV_ENGINE(VP, 0x98),
 	.ofuncs = &(struct nouveau_ofuncs) {
 		.ctor = nv98_vp_ctor,
-		.dtor = _nouveau_engine_dtor,
-		.init = _nouveau_engine_init,
-		.fini = _nouveau_engine_fini,
+		.dtor = _nouveau_falcon_dtor,
+		.init = nv98_vp_init,
+		.fini = _nouveau_falcon_fini,
+		.rd32 = _nouveau_falcon_rd32,
+		.wr32 = _nouveau_falcon_wr32,
 	},
 };
diff --git a/drivers/gpu/drm/nouveau/core/subdev/mc/nv98.c b/drivers/gpu/drm/nouveau/core/subdev/mc/nv98.c
index e82fd21..6daed76 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/mc/nv98.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/mc/nv98.c
@@ -35,6 +35,7 @@ nv98_mc_intr[] = {
 	{ 0x00001000, NVDEV_ENGINE_GR },
 	{ 0x00004000, NVDEV_ENGINE_CRYPT },	/* NV84:NVA3 */
 	{ 0x00008000, NVDEV_ENGINE_BSP },
+	{ 0x00020000, NVDEV_ENGINE_VP },
 	{ 0x00080000, NVDEV_SUBDEV_THERM },	/* NVA3:NVC0 */
 	{ 0x00100000, NVDEV_SUBDEV_TIMER },
 	{ 0x00200000, NVDEV_SUBDEV_GPIO },
@@ -42,7 +43,7 @@ nv98_mc_intr[] = {
 	{ 0x04000000, NVDEV_ENGINE_DISP },
 	{ 0x10000000, NVDEV_SUBDEV_BUS },
 	{ 0x80000000, NVDEV_ENGINE_SW },
-	{ 0x0040d101, NVDEV_SUBDEV_FB },
+	{ 0x0042d101, NVDEV_SUBDEV_FB },
 	{},
 };
 
diff --git a/drivers/gpu/drm/nouveau/core/subdev/vm/nv50.c b/drivers/gpu/drm/nouveau/core/subdev/vm/nv50.c
index 07dd1fe..a4aa81a 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/vm/nv50.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/vm/nv50.c
@@ -174,6 +174,7 @@ nv50_vm_flush(struct nouveau_vm *vm)
 		case NVDEV_ENGINE_GR   : vme = 0x00; break;
 		case NVDEV_ENGINE_VP   : vme = 0x01; break;
 		case NVDEV_SUBDEV_BAR  : vme = 0x06; break;
+		case NVDEV_ENGINE_PPP  :
 		case NVDEV_ENGINE_MPEG : vme = 0x08; break;
 		case NVDEV_ENGINE_BSP  : vme = 0x09; break;
 		case NVDEV_ENGINE_CRYPT: vme = 0x0a; break;
-- 
1.8.1.5
