From: Lyude Paul <lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [RFC v4 11/20] drm/nouveau/kms: Move
 drm_dp_cec_unset_edid() into nouveau_connector_detect()
Date: Tue, 25 Aug 2020 15:50:18 -0400
Message-ID: <20200825195027.74681-12-lyude@redhat.com>
References: <20200825195027.74681-1-lyude@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20200825195027.74681-1-lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, intel-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

For whatever reason we currently unset the EDID for DP CEC support when
responding to the connector being unplugged, instead of just doing it in
nouveau_connector_detect() where we set the CEC EDID. This isn't really
needed and could even potentially cause us to forget to unset the EDID
if the connector is removed without a corresponding hpd event, so let's
fix that.

Signed-off-by: Lyude Paul <lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Reviewed-by: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_connector.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
index b90591114faaf..4a29f691c08e4 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.c
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
@@ -633,10 +633,11 @@ nouveau_connector_detect(struct drm_connector *connector, bool force)
 			conn_status = connector_status_connected;
 			goto out;
 		}
-
 	}
 
  out:
+	if (!nv_connector->edid)
+		drm_dp_cec_unset_edid(&nv_connector->aux);
 
 	pm_runtime_mark_last_busy(dev->dev);
 	pm_runtime_put_autosuspend(dev->dev);
@@ -1174,8 +1175,6 @@ nouveau_connector_hotplug(struct nvif_notify *notify)
 		return NVIF_NOTIFY_DROP;
 	}
 
-	if (!plugged)
-		drm_dp_cec_unset_edid(&nv_connector->aux);
 	NV_DEBUG(drm, "%splugged %s\n", plugged ? "" : "un", name);
 
 	drm_helper_hpd_irq_event(connector->dev);
-- 
2.26.2
