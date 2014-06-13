From: Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org>
Subject: [PATCH 2/2] drm/nouveau: Remove an unneeded write while
	initialising PGRAPH
Date: Fri, 13 Jun 2014 02:34:30 +0200
Message-ID: <1402619670-21368-2-git-send-email-pierre.morrow@free.fr>
References: <pierre.morrow@free.fr>
 <1402619670-21368-1-git-send-email-pierre.morrow@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1402619670-21368-1-git-send-email-pierre.morrow-GANU6spQydw@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Ben Skeggs <bskeggs-8RVElS0ezzQdnm+yROfE0A@public.gmane.org>
List-Id: nouveau.vger.kernel.org

The blob does not seem to write at that place for my NVAC, though it does for
my NV96, agreeing with what is done in the if/else structure below. I guess
someone forgot to remove the line when the if/else was put in place.

Signed-off-by: Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org>
---
 drivers/gpu/drm/nouveau/core/engine/graph/nv50.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/core/engine/graph/nv50.c b/drivers/gpu/drm/nouveau/core/engine/graph/nv50.c
index a36adcd..ca1b886 100644
--- a/drivers/gpu/drm/nouveau/core/engine/graph/nv50.c
+++ b/drivers/gpu/drm/nouveau/core/engine/graph/nv50.c
@@ -976,7 +976,6 @@ nv50_graph_init(struct nouveau_object *object)
 		break;
 	case 0xa0:
 	default:
-		nv_wr32(priv, 0x402cc0, 0x00000000);
 		if (nv_device(priv)->chipset == 0xa0 ||
 		    nv_device(priv)->chipset == 0xaa ||
 		    nv_device(priv)->chipset == 0xac) {
-- 
2.0.0
