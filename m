From: =?utf-8?q?Marcin=20Ko=C5=9Bcielnicki?= <koriakin-mP9o5jsk0RY@public.gmane.org>
Subject: [PATCH] nouveau: Make winsys recognise the original NV50.
Date: Mon, 11 Jan 2010 05:15:38 +0000
Message-ID: <1263186938-13310-1-git-send-email-koriakin@0x04.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

---
 .../winsys/drm/nouveau/drm/nouveau_drm_api.c       |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/src/gallium/winsys/drm/nouveau/drm/nouveau_drm_api.c b/src/gallium/winsys/drm/nouveau/drm/nouveau_drm_api.c
index 7106a06..e5912ef 100644
--- a/src/gallium/winsys/drm/nouveau/drm/nouveau_drm_api.c
+++ b/src/gallium/winsys/drm/nouveau/drm/nouveau_drm_api.c
@@ -87,6 +87,7 @@ nouveau_drm_create_screen(struct drm_api *api, int fd,
 	case 0x60:
 		init = nv40_screen_create;
 		break;
+	case 0x50:
 	case 0x80:
 	case 0x90:
 	case 0xa0:
@@ -164,6 +165,7 @@ nouveau_drm_create_context(struct drm_api *api, struct pipe_screen *pscreen)
 	case 0x60:
 		init = nv40_create;
 		break;
+	case 0x50:
 	case 0x80:
 	case 0x90:
 	case 0xa0:
-- 
1.6.5.6
