From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Subject: [PATCH] drm/nouveau: fix nv40 gart size
Date: Sun, 17 Oct 2010 15:14:47 +0200
Message-ID: <1287321287.2215.13.camel@workstation>
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
To: Nouveau Dev List <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Nouveau sets GART size to 64MiB for all cards before nv50, but nv40 has
enough RAMIN space to support 512MiB GART size. This patch fixes this
value to make use of this hardware capability.

Signed-off-by: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
---
drivers/gpu/drm/nouveau/nouveau_sgdma.c |    6 +++++-
1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_sgdma.c
b/drivers/gpu/drm/nouveau/nouveau_sgdma.c
index 7f028fe..388b3e1 100644
--- a/drivers/gpu/drm/nouveau/nouveau_sgdma.c
+++ b/drivers/gpu/drm/nouveau/nouveau_sgdma.c
@@ -224,7 +224,11 @@ nouveau_sgdma_init(struct drm_device *dev)
int i, ret;

if (dev_priv->card_type < NV_50) {
- aper_size = (64 * 1024 * 1024);
+ if(dev_priv->card_type < NV_40) {
+ aper_size = (64 * 1024 * 1024);
+ } else {
+ aper_size = (512 * 1024 * 1024);
+ }
obj_size  = (aper_size >> NV_CTXDMA_PAGE_SHIFT) * 4;
obj_size += 8; /* ctxdma header */
} else {
-- 
1.7.2.3
