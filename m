From: Adam Jackson <ajax-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] drm/nouveau: Fix bandwidth calculation for
	DisplayPort
Date: Tue, 25 Oct 2011 13:09:43 -0400
Message-ID: <1319562583-14920-1-git-send-email-ajax@redhat.com>
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
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Ported from the equivalent fix in drm-intel-next:

http://cgit.freedesktop.org/~keithp/linux/commit/?h=drm-intel-next&id=cd9dde44f47501394b9f0715b6a36a92aa74c0d0

Signed-off-by: Adam Jackson <ajax-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_connector.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
index 939d4df..f5ca456 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.c
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
@@ -717,7 +717,7 @@ nouveau_connector_mode_valid(struct drm_connector *connector,
 		else
 			max_clock = nv_encoder->dp.link_nr * 162000;
 
-		clock = clock * nouveau_connector_bpp(connector) / 8;
+		clock = clock * nouveau_connector_bpp(connector) / 10;
 		break;
 	default:
 		BUG_ON(1);
-- 
1.7.6.4
