From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [kernel PATCH] drm/nv50: decode PGRAPH DATA_ERROR = 0x24
Date: Sun, 6 May 2012 20:51:41 +0200
Message-ID: <20120506185141.GB4311@joi.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
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


Signed-off-by: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nv50_graph.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nv50_graph.c b/drivers/gpu/drm/nouveau/nv50_graph.c
index d0a2e50..86a4969 100644
--- a/drivers/gpu/drm/nouveau/nv50_graph.c
+++ b/drivers/gpu/drm/nouveau/nv50_graph.c
@@ -518,6 +518,7 @@ struct nouveau_enum nv50_data_error_names[] = {
 	{ 0x0000001f, "RT_BPP128_WITH_MS8", NULL },
 	{ 0x00000021, "Z_OUT_OF_BOUNDS", NULL },
 	{ 0x00000023, "XY_OUT_OF_BOUNDS", NULL },
+	{ 0x00000024, "VP_NO_INPUT_MASK", NULL },
 	{ 0x00000027, "CP_MORE_PARAMS_THAN_SHARED", NULL },
 	{ 0x00000028, "CP_NO_REG_SPACE_STRIPED", NULL },
 	{ 0x00000029, "CP_NO_REG_SPACE_PACKED", NULL },
-- 
1.7.8.5
