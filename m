From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH 08/12] nv50,nvc0: handle guard band defines
Date: Tue, 20 May 2014 19:40:02 -0400
Message-ID: <1400629206-4447-9-git-send-email-imirkin@alum.mit.edu>
References: <1400629206-4447-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1400629206-4447-1-git-send-email-imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: Christoph Bumiller <christoph.bumiller-D4IDLmZPRBc@public.gmane.org>
List-Id: nouveau.vger.kernel.org

From: Christoph Bumiller <christoph.bumiller-D4IDLmZPRBc@public.gmane.org>

[imirkin: moved default case out of switch]
Reviewed-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
---
 src/gallium/drivers/nouveau/nv50/nv50_screen.c | 10 ++++++++--
 src/gallium/drivers/nouveau/nvc0/nvc0_screen.c | 10 ++++++++--
 2 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/src/gallium/drivers/nouveau/nv50/nv50_screen.c b/src/gallium/drivers/nouveau/nv50/nv50_screen.c
index 68d30ea..36a4ad1 100644
--- a/src/gallium/drivers/nouveau/nv50/nv50_screen.c
+++ b/src/gallium/drivers/nouveau/nv50/nv50_screen.c
@@ -286,10 +286,16 @@ nv50_screen_get_paramf(struct pipe_screen *pscreen, enum pipe_capf param)
       return 16.0f;
    case PIPE_CAPF_MAX_TEXTURE_LOD_BIAS:
       return 4.0f;
-   default:
-      NOUVEAU_ERR("unknown PIPE_CAP %d\n", param);
+   case PIPE_CAPF_GUARD_BAND_LEFT:
+   case PIPE_CAPF_GUARD_BAND_TOP:
       return 0.0f;
+   case PIPE_CAPF_GUARD_BAND_RIGHT:
+   case PIPE_CAPF_GUARD_BAND_BOTTOM:
+      return 0.0f; /* that or infinity */
    }
+
+   NOUVEAU_ERR("unknown PIPE_CAPF %d\n", param);
+   return 0.0f;
 }
 
 static void
diff --git a/src/gallium/drivers/nouveau/nvc0/nvc0_screen.c b/src/gallium/drivers/nouveau/nvc0/nvc0_screen.c
index cccfe2b..9f89f31 100644
--- a/src/gallium/drivers/nouveau/nvc0/nvc0_screen.c
+++ b/src/gallium/drivers/nouveau/nvc0/nvc0_screen.c
@@ -294,10 +294,16 @@ nvc0_screen_get_paramf(struct pipe_screen *pscreen, enum pipe_capf param)
       return 16.0f;
    case PIPE_CAPF_MAX_TEXTURE_LOD_BIAS:
       return 15.0f;
-   default:
-      NOUVEAU_ERR("unknown PIPE_CAP %d\n", param);
+   case PIPE_CAPF_GUARD_BAND_LEFT:
+   case PIPE_CAPF_GUARD_BAND_TOP:
       return 0.0f;
+   case PIPE_CAPF_GUARD_BAND_RIGHT:
+   case PIPE_CAPF_GUARD_BAND_BOTTOM:
+      return 0.0f; /* that or infinity */
    }
+
+   NOUVEAU_ERR("unknown PIPE_CAPF %d\n", param);
+   return 0.0f;
 }
 
 static int
-- 
1.8.5.5
