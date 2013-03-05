From: Maarten Lankhorst <maarten.lankhorst@canonical.com>
Subject: [PATCH] drm/nouveau: fix regression in vblanking
Date: Tue, 05 Mar 2013 14:59:26 +0100
Message-ID: <5135FA3E.3000009@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: nouveau@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
List-Id: nouveau.vger.kernel.org

nv50_vblank_enable/disable got switched from NV50_PDISPLAY_INTR_EN_1_VBLANK_CRTC_0 (4) << head to 1 << head, which is wrong.

4 << head is the correct value.

Fixes regression with vblanking since 1d7c71a3e2f77 "drm/nouveau/disp: port vblank handling to event interface"

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@canonical.com>
---
diff --git a/drivers/gpu/drm/nouveau/core/engine/disp/nv50.c b/drivers/gpu/drm/nouveau/core/engine/disp/nv50.c
index 5fa1326..02e369f 100644
--- a/drivers/gpu/drm/nouveau/core/engine/disp/nv50.c
+++ b/drivers/gpu/drm/nouveau/core/engine/disp/nv50.c
@@ -544,13 +544,13 @@ nv50_disp_curs_ofuncs = {
 static void
 nv50_disp_base_vblank_enable(struct nouveau_event *event, int head)
 {
-	nv_mask(event->priv, 0x61002c, (1 << head), (1 << head));
+	nv_mask(event->priv, 0x61002c, (4 << head), (4 << head));
 }
 
 static void
 nv50_disp_base_vblank_disable(struct nouveau_event *event, int head)
 {
-	nv_mask(event->priv, 0x61002c, (1 << head), (0 << head));
+	nv_mask(event->priv, 0x61002c, (4 << head), 0);
 }
 
 static int
