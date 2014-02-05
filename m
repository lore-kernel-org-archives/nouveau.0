From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH] drm/nv50/graph: update status enum names
Date: Tue,  4 Feb 2014 20:38:17 -0500
Message-ID: <1391564297-20748-1-git-send-email-imirkin@alum.mit.edu>
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
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
---

This syncs it up with what's in envytools. Some of the names are a bit
different, but I'm inclined to trust envytools as the correct thing.

 drivers/gpu/drm/nouveau/core/engine/graph/nv50.c | 29 ++++++++++++------------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/core/engine/graph/nv50.c b/drivers/gpu/drm/nouveau/core/engine/graph/nv50.c
index 30ed19c..6da473c 100644
--- a/drivers/gpu/drm/nouveau/core/engine/graph/nv50.c
+++ b/drivers/gpu/drm/nouveau/core/engine/graph/nv50.c
@@ -197,34 +197,35 @@ static const struct nouveau_bitfield nv50_pgraph_status[] = {
 	{ 0x00000080, "UNK7" },
 	{ 0x00000100, "CTXPROG" },
 	{ 0x00000200, "VFETCH" },
-	{ 0x00000400, "CCACHE_UNK4" },
-	{ 0x00000800, "STRMOUT_GSCHED_UNK5" },
-	{ 0x00001000, "UNK14XX" },
-	{ 0x00002000, "UNK24XX_CSCHED" },
-	{ 0x00004000, "UNK1CXX" },
+	{ 0x00000400, "CCACHE_PREGEOM" },
+	{ 0x00000800, "STRMOUT_VATTR_POSTGEOM" },
+	{ 0x00001000, "VCLIP" },
+	{ 0x00002000, "RATTR_APLANE" },
+	{ 0x00004000, "TRAST" },
 	{ 0x00008000, "CLIPID" },
 	{ 0x00010000, "ZCULL" },
 	{ 0x00020000, "ENG2D" },
-	{ 0x00040000, "UNK34XX" },
-	{ 0x00080000, "TPRAST" },
-	{ 0x00100000, "TPROP" },
-	{ 0x00200000, "TEX" },
-	{ 0x00400000, "TPVP" },
-	{ 0x00800000, "MP" },
+	{ 0x00040000, "RMASK" },
+	{ 0x00080000, "TPC_RAST" },
+	{ 0x00100000, "TPC_PROP" },
+	{ 0x00200000, "TPC_TEX" },
+	{ 0x00400000, "TPC_GEOM" },
+	{ 0x00800000, "TPC_MP" },
 	{ 0x01000000, "ROP" },
 	{}
 };
 
 static const char *const nv50_pgraph_vstatus_0[] = {
-	"VFETCH", "CCACHE", "UNK4", "UNK5", "GSCHED", "STRMOUT", "UNK14XX", NULL
+	"VFETCH", "CCACHE", "PREGEOM", "POSTGEOM", "VATTR", "STRMOUT", "VCLIP",
+	NULL
 };
 
 static const char *const nv50_pgraph_vstatus_1[] = {
-	"TPRAST", "TPROP", "TEXTURE", "TPVP", "MP", NULL
+	"TPC_RAST", "TPC_PROP", "TPC_TEX", "TPC_GEOM", "TPC_MP", NULL
 };
 
 static const char *const nv50_pgraph_vstatus_2[] = {
-	"UNK24XX", "CSCHED", "UNK1CXX", "CLIPID", "ZCULL", "ENG2D", "UNK34XX",
+	"RATTR", "APLANE", "TRAST", "CLIPID", "ZCULL", "ENG2D", "RMASK",
 	"ROP", NULL
 };
 
-- 
1.8.3.2
