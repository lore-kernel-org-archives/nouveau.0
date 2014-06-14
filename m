From: Tobias Klausmann <tobias.johannes.klausmann-AqjdNwhu20eELgA04lAiVw@public.gmane.org>
Subject: [PATCH 3/3] nv50/ir: Remove NV50_SEMANTIC_VIEWPORTINDEX
	and its last consumer
Date: Sat, 14 Jun 2014 16:41:10 +0200
Message-ID: <1402756870-2207-4-git-send-email-tobias.johannes.klausmann@mni.thm.de>
References: <1402756870-2207-1-git-send-email-tobias.johannes.klausmann@mni.thm.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1402756870-2207-1-git-send-email-tobias.johannes.klausmann-AqjdNwhu20eELgA04lAiVw@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org
List-Id: nouveau.vger.kernel.org

We use TGSI_SEMANTIC_VIEWPORT_INDEX for nvc0 now as well.

Signed-off-by: Tobias Klausmann <tobias.johannes.klausmann-AqjdNwhu20eELgA04lAiVw@public.gmane.org>
---
 src/gallium/drivers/nouveau/codegen/nv50_ir_driver.h        | 1 -
 src/gallium/drivers/nouveau/codegen/nv50_ir_target_nv50.cpp | 1 -
 2 files changed, 2 deletions(-)

diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_driver.h b/src/gallium/drivers/nouveau/codegen/nv50_ir_driver.h
index f829aac..c885c8c 100644
--- a/src/gallium/drivers/nouveau/codegen/nv50_ir_driver.h
+++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_driver.h
@@ -70,7 +70,6 @@ struct nv50_ir_varying
 #endif
 
 #define NV50_SEMANTIC_CLIPDISTANCE  (TGSI_SEMANTIC_COUNT + 0)
-#define NV50_SEMANTIC_VIEWPORTINDEX (TGSI_SEMANTIC_COUNT + 4)
 #define NV50_SEMANTIC_TESSFACTOR    (TGSI_SEMANTIC_COUNT + 7)
 #define NV50_SEMANTIC_TESSCOORD     (TGSI_SEMANTIC_COUNT + 8)
 #define NV50_SEMANTIC_COUNT         (TGSI_SEMANTIC_COUNT + 10)
diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_target_nv50.cpp b/src/gallium/drivers/nouveau/codegen/nv50_ir_target_nv50.cpp
index abadc7f..7e314aa 100644
--- a/src/gallium/drivers/nouveau/codegen/nv50_ir_target_nv50.cpp
+++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_target_nv50.cpp
@@ -538,7 +538,6 @@ recordLocation(uint16_t *locs, uint8_t *masks,
    case TGSI_SEMANTIC_VERTEXID: locs[SV_VERTEX_ID] = addr; break;
    case TGSI_SEMANTIC_PRIMID: locs[SV_PRIMITIVE_ID] = addr; break;
    case TGSI_SEMANTIC_LAYER: locs[SV_LAYER] = addr; break;
-   case NV50_SEMANTIC_VIEWPORTINDEX: locs[SV_VIEWPORT_INDEX] = addr; break;
    default:
       break;
    }
-- 
1.8.4.5
