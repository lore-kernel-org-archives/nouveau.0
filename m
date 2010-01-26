From: =?utf-8?q?Marcin=20Ko=C5=9Bcielnicki?= <koriakin-mP9o5jsk0RY@public.gmane.org>
Subject: [PATCH] nouveau: Update nouveau_drm.h
Date: Tue, 26 Jan 2010 18:39:21 +0000
Message-ID: <1264531161-4156-2-git-send-email-koriakin@0x04.net>
References: <1264531161-4156-1-git-send-email-koriakin@0x04.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1264531161-4156-1-git-send-email-koriakin-mP9o5jsk0RY@public.gmane.org>
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
 include/drm/nouveau_drm.h |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/include/drm/nouveau_drm.h b/include/drm/nouveau_drm.h
index 1e67c44..f745948 100644
--- a/include/drm/nouveau_drm.h
+++ b/include/drm/nouveau_drm.h
@@ -77,6 +77,7 @@ struct drm_nouveau_gpuobj_free {
 #define NOUVEAU_GETPARAM_PCI_PHYSICAL    10
 #define NOUVEAU_GETPARAM_CHIPSET_ID      11
 #define NOUVEAU_GETPARAM_VM_VRAM_BASE    12
+#define NOUVEAU_GETPARAM_GRAPH_UNITS     13
 struct drm_nouveau_getparam {
 	uint64_t param;
 	uint64_t value;
-- 
1.6.4.1
