From: Maarten Lankhorst <maarten.lankhorst@canonical.com>
Subject: [PATCH 2/3] drm/nouveau: fix null pointer dereference in poll_changed
Date: Tue, 23 Jul 2013 15:45:11 +0200
Message-ID: <51EE88E7.8010802@canonical.com>
References: <51EE8888.4030302@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <51EE8888.4030302@canonical.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
List-Id: nouveau.vger.kernel.org

Fixes vgaswitcheroo on a card without display.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@canonical.com>
---
diff --git a/drivers/gpu/drm/nouveau/nouveau_fbcon.c b/drivers/gpu/drm/nouveau/nouveau_fbcon.c
index 4c1bc06..8f6d63d 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fbcon.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fbcon.c
@@ -398,7 +398,8 @@ void
 nouveau_fbcon_output_poll_changed(struct drm_device *dev)
 {
 	struct nouveau_drm *drm = nouveau_drm(dev);
-	drm_fb_helper_hotplug_event(&drm->fbcon->helper);
+	if (drm->fbcon)
+		drm_fb_helper_hotplug_event(&drm->fbcon->helper);
 }
 
 static int
